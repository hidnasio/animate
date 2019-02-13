defmodule Animate do
  @frames [
    """               
                      
                      
                      
            <")       
            ( >\      
             " \\     
                \     
    """,
    """               
                      
                      
                      
            >")       
            ( >\      
             " \\     
                \     
    """,
  ]

  @poem """
  The Raven Edgar Allan Poe, 1809 - 1849. Once upon a midnight dreary, while I pondered, weak and weary, Over many a quaint and curious volume of forgotten lore. While I nodded, nearly napping, suddenly there came a tapping, As of some one gently rapping, rapping at my chamber door. Tis some visitor, I muttered, tapping at my chamber door. Only this and nothing more. Ah, distinctly I remember it was in the bleak December. And each separate dying ember wrought its ghost upon the floor. Eagerly I wished the morrow; vainly I had sought to borrow. From my books surcease of sorrow. sorrow for the lost Lenore. For the rare and radiant maiden whom the angels name Lenore. Nameless here for evermore. Presently my soul grew stronger; hesitating then no longer, Sir, said I, or Madam, truly your forgiveness I implore; But the fact is I was napping, and so gently you came rapping, And so faintly you came tapping, tapping at my chamber door, That I scarce was sure I heard you. here I opened wide the door. Darkness there and nothing more. Deep into that darkness peering, long I stood there wondering, fearing, Doubting, dreaming dreams no mortal ever dared to dream before; But the silence was unbroken, and the stillness gave no token, And the only word there spoken was the whispered word, Lenore? This I whispered, and an echo murmured back the word, Lenore! Merely this and nothing more.
  """

  def run() do
    spawn_link(
      fn ->
        'say ~p'
        |> :io_lib.format([to_charlist(@poem)])
        |> :os.cmd()
        IEx.dont_display_result
      end
    )

    @frames
    |> Stream.cycle()
    |> Enum.each(fn frame ->
      IO.write "\e[H\e[J"
      IEx.dont_display_result
      IO.write "#{frame}\n"
      IEx.dont_display_result
      Process.sleep(100)
    end)
  end
end
