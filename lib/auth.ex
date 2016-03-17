defmodule GCloudex.Auth do
  alias Goth,      as: GoogleAuth

	@moduledoc """
	Provides retrieval of authentication tokens for several Google Cloud Platform
	services.
	"""

	@storage_scope_read_only    "https://www.googleapis.com/auth/devstorage.read_only"
	@storage_scope_read_write   "https://www.googleapis.com/auth/devstorage.read_write"
  @storage_scope_full_control "https://www.googleapis.com/auth/devstorage.full_control"
	@storage_scope_cs_read_only "https://www.googleapis.com/auth/cloud-platform.read-only"
	@storage_scope_cs           "https://www.googleapis.com/auth/cloud-platform"

	@doc """
	Retrieves an authentication token for the Google Cloud Storage service.
	"""
  def get_token_storage(type) do 
    case type do 
      :read_only ->
        {:ok, get_token_response} = GoogleAuth.Token.for_scope @storage_scope_read_only

        get_token_response |> Map.get(:token)

      :read_write ->
        {:ok, get_token_response} = GoogleAuth.Token.for_scope @storage_scope_read_write

        get_token_response |> Map.get(:token)

      :full_control ->
        {:ok, get_token_response} = GoogleAuth.Token.for_scope @storage_scope_full_control

        get_token_response |> Map.get(:token)


      :cs_read_only ->
        {:ok, get_token_response} = GoogleAuth.Token.for_scope @storage_scope_cs_read_only

        get_token_response |> Map.get(:token)

      :cs ->
        {:ok, get_token_response} = GoogleAuth.Token.for_scope @storage_scope_cs

        get_token_response |> Map.get(:token)
    end
  end   
end
