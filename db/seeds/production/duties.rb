names = %w(代表 副代表 会計係 ユニフォーム係 ボール係 合宿係 試合係 入退部係 イベント係)

0.upto(8) do |idx|
  Duty.create(
    name: names[idx]
  )
end

