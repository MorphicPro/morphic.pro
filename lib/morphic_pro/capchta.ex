defmodule MorphicPro.Captcha do
  # allow customize receive timeout, default: 10_000
  def get(timeout \\ 1_000) do
    case System.cmd(Application.app_dir(:captcha, "priv/captcha"), []) do
      {data, 0} ->
        <<text::bytes-size(5), img::binary>> = data
        {:ok, text, img}

      other ->
        :error
    end
  end
end
