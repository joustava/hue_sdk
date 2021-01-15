defmodule HueSDK.API.Rules do
  @moduledoc """
  Interface to the Rules API
  https://developers.meethue.com/develop/hue-api/6-rules-api/
  """

  alias HueSDK.{HTTP, JSON}

  @doc """
  Gets a list of all rules that are in the bridge.
  """
  def get_all_rules(bridge) do
    HTTP.request(
      :get,
      "http://#{bridge.host}/api/#{bridge.username}/rules",
      &JSON.decode!/1
    )
  end

  @doc """
  Returns a rule object with id matching <id> or an error if <id> is not available.
  """
  def get_rule_attributes(bridge, rule_id) do
    HTTP.request(
      :get,
      "http://#{bridge.host}/api/#{bridge.username}/rules/#{rule_id}",
      &JSON.decode!/1
    )
  end

  @doc """
  Creates a new rule in the bridge rule engine.
  """
  def create_rule(bridge, attributes) do
    HTTP.request(
      :post,
      "http://#{bridge.host}/api/#{bridge.username}/rules",
      JSON.encode!(attributes),
      &JSON.decode!/1
    )
  end

  @doc """
  Updates a rule in the bridge rule engine.
  """
  def update_rule(bridge, rule_id, attributes) do
    HTTP.request(
      :post,
      "http://#{bridge.host}/api/#{bridge.username}/rules/#{rule_id}",
      JSON.encode!(attributes),
      &JSON.decode!/1
    )
  end

  @doc """
  Deletes the specified rule from the bridge.
  """
  def delete_rule(bridge, rule_id) do
    HTTP.request(
      :delete,
      "http://#{bridge.host}/api/#{bridge.username}/rules/#{rule_id}",
      &JSON.decode!/1
    )
  end
end