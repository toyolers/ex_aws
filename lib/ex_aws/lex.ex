defmodule ExAws.Lex do
  @moduledoc """
  Operations on AWS Lex

  http://docs.aws.amazon.com/lex/latest/dg/API_Reference.html
  """

  @doc "Post text"
  @spec post_text(Map.t, String.t | integer, Map.t, [Keyword.t]) :: ExAws.Operation.Query.t
  def post_text(bot, user_id, input, options \\ []) do
    running_request(:post, bot, user_id, input, "text", options)
  end

  defp running_request(http_method, bot, user_id, body, op, opts \\ %{}) do
    path = "/bot/#{URI.encode(bot.name)}/alias/#{URI.encode(bot.alias)}/user/#{URI.encode(user_id)}/#{op}"

    ExAws.Operation.JSON.new(
      :lex_runtime,
      path: path,
      data: body,
      http_method: :post # just to be explicit
    )
  end
end
