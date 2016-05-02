defmodule College do
  @moduledoc """

  """

  @vsn 0.1

  @doc """

  """
  @spec make_room_list(String.t) :: HashDict.t

  def make_room_list(file_name) do
    {result, device} = File.open(file_name, [:read, :utf8])
    room_list = HashDict.new()
    process_list(device, room_list)
  end

  # Read next line from file; if not end of file, process
  # the room on that line. Recursively read through end of file.

  defp process_line(device, room_list) do
    data = IO.read(device, :line)
    case data do
      :eof ->
        File.close(device)
        room_list
      _ ->
        updated_list = process_room(data, room_list)
        process_line(device, updated_list)
      end
  end

  # Extract information from a line in the file, and append
  # course to hash dictionary value for the given room.

  defp process_room(data, room_list) do
    [_id, course, room] = String.split(String.strip(data), ",")
    course_list = HashDict.get(room_list, room)
    case course_list do
      nil -> updated_list = HashDict.put_new(room_list, room, [course])
      _ -> updated_list = HashDict.put(room_list, room, [course | course_list])
    end
    updated_list
  end

end
