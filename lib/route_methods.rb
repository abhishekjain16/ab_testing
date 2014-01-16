class RouteMethods
  def self.find_all_paths
    Rails.application.reload_routes!
    all_routes = Rails.application.routes.routes.to_a
    all_routes.reject! { |route| route.verb.nil? || route.path.spec.to_s == '/assets' || route.verb.inspect.gsub(/^.{2}|.{2}$/, "") != "GET" }
    all_routes.select! { |route| ENV['CONTROLLER'].nil? || route.defaults[:controller].to_s == ENV['CONTROLLER'] }
    all_routes
  end

  def self.get_paths
    @paths ||= generate_path_array
  end

  def self.generate_path_array
    paths = [], index = 0
    find_all_paths.group_by { |route| route.defaults[:controller] }.each_value do |group|
      group.each do |route|
        paths[index] = route.path.spec.to_s.gsub("(.:format)", "")
        index += 1
      end
    end
    paths
  end
end
