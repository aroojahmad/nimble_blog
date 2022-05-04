defmodule VolumeTech.Faqs do
  alias VolumeTech.Faqs.Faq

  use NimblePublisher,
    build: Faq,
    from: Application.app_dir(:volume_tech, "priv/faqs/*.md"),
    as: :faqs

  # The @faqs variable is first defined by NimblePublisher.
  # Let's further modify it by sorting all posts by ascending question
  @faqs Enum.sort_by(@faqs, & &1.question)

  # And finally export them
  def all_faqs, do: @faqs
end
