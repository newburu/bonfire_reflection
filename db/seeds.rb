# db/seeds.rb

strengths_data = [
  # --- 実行力 (Executing) ---
  {
    name: "達成欲",
    genius: "タスク完了の天才",
    balcony: "常に活動的で高い生産性を誇ります。目標に向かって粘り強く努力し、完遂することに喜びを感じます。",
    basement: "休息を取るのが苦手で燃え尽きやすく、成果を急ぐあまり人間関係を軽視することがあります。",
    opposite_trait: "内省",
    opposite_description: "内省の人は行動の前に思索にふける時間を大切にします。達成欲の「まず行動」とは対照的です。"
  },
  {
    name: "アレンジ",
    genius: "最高の組み合わせを見つける天才",
    balcony: "複雑な要素を効率的に組み合わせ、状況の変化に合わせて柔軟に計画を組み替えることができます。",
    basement: "他人のやり方に過度に口出ししたり、効率を重視しすぎて感情を無視したりすることがあります。",
    opposite_trait: "焦点化",
    opposite_description: "焦点化の人は一直線に進むことを好みます。柔軟に組み替えるアレンジとは対照的です。"
  },
  {
    name: "信念",
    genius: "揺るぎない価値観を持つ天才",
    balcony: "核となる価値観が明確で、言動に一貫性があります。使命感に基づいて誠実に行動します。",
    basement: "自分の価値観に合わないことに非寛容になりやすく、頑固だと思われることがあります。",
    opposite_trait: "適応性",
    opposite_description: "適応性の人は流れを重視します。一貫した価値観を貫く信念とは対照的です。"
  },
  {
    name: "公平性",
    genius: "平等な判断と機会提供の天才",
    balcony: "誰に対しても分け隔てなく接し、規則やルールを尊重して調和の取れた環境を築きます。",
    basement: "個人の特殊な事情に配慮しきれず、平等にこだわるあまり柔軟性を欠くことがあります。",
    opposite_trait: "個別化",
    opposite_description: "個別化の人は一人ひとりの違いを重視します。一律の基準で扱う公平性とは対照的です。"
  },
  {
    name: "慎重さ",
    genius: "リスクを徹底的に洗い出す天才",
    balcony: "行動前にあらゆるリスクを予測し、慎重に計画を立てます。大きな失敗を未然に防ぎます。",
    basement: "決断に時間がかかりすぎ、チャンスを逃したり悲観主義だと思われたりすることがあります。",
    opposite_trait: "活発性",
    opposite_description: "活発性の人はまず動くことを重視します。徹底的にリスクを考える慎重さとは対照的です。"
  },
  {
    name: "規律性",
    genius: "秩序と計画の天才",
    balcony: "物事を秩序立て、計画通りにきっちりと実行します。混乱した状況を整理するのが得意です。",
    basement: "予期せぬ変化に対応するのが苦手で、ルールや手順にこだわりすぎる傾向があります。",
    opposite_trait: "適応性",
    opposite_description: "適応性の人は変化を楽しみます。秩序と計画を重んじる規律性とは対照的です。"
  },
  {
    name: "焦点化",
    genius: "ゴールへの最短距離を進む天才",
    balcony: "明確な目標を設定し、不要な活動を排除して効率的に結果を出します。軌道修正も得意です。",
    basement: "回り道や計画変更に強いストレスを感じ、短期的な集中で全体像を見失うことがあります。",
    opposite_trait: "適応性",
    opposite_description: "適応性の人はプロセスを大切にします。最短距離を突き進む焦点化とは対照的です。"
  },
  {
    name: "責任感",
    genius: "やり遂げる約束の天才",
    balcony: "一度引き受けたことは何があっても最後までやり遂げ、周囲に強い安心感を与えます。",
    basement: "断るのが苦手で抱え込みやすく、完璧を求めすぎて自分や他人を追い詰めることがあります。",
    opposite_trait: "信念",
    opposite_description: "信念の人は価値観に合わないことは断ります。何でも引き受けてしまう責任感とは対照的です。"
  },
  {
    name: "回復志向",
    genius: "問題解決の天才",
    balcony: "欠陥や問題点を見つけ、分析して正常な状態に戻すことに長けています。トラブルに強いです。",
    basement: "ネガティブな側面ばかりに目が行き、批判的だと思われることがあります。",
    opposite_trait: "最上志向",
    opposite_description: "最上志向の人は強みに焦点を当てます。問題点を修正しようとする回復志向とは対照的です。"
  },

  # --- 影響力 (Influencing) ---
  {
    name: "活発性",
    genius: "スタートダッシュの天才",
    balcony: "アイデアをすぐに行動に移し、チームに勢いをもたらします。停滞を打破する起爆剤です。",
    basement: "準備不足で行動し、後から問題が発生することがあります。待つことが苦手です。",
    opposite_trait: "慎重さ",
    opposite_description: "慎重さの人は徹底的に検討します。すぐに行動する活発性とは対照的です。"
  },
  {
    name: "指令性",
    genius: "決断と主導の天才",
    balcony: "対立を恐れず、主導権を握って明確な決断を下します。混乱に秩序をもたらします。",
    basement: "威圧的、独裁的だと思われることがあり、他者の意見を聞き入れるのが苦手です。",
    opposite_trait: "調和性",
    opposite_description: "調和性の人は合意形成を目指します。対立を辞さない指令性とは対照的です。"
  },
  {
    name: "コミュニケーション",
    genius: "言葉で命を吹き込む天才",
    balcony: "複雑な内容を分かりやすいストーリーとして表現し、聞き手の心に響かせます。",
    basement: "話が長くなりすぎたり、考えがまとまる前に話し始めたりすることがあります。",
    opposite_trait: "内省",
    opposite_description: "内省の人は一人の時間をかけて思索します。外に出すコミュニケーションとは対照的です。"
  },
  {
    name: "競争性",
    genius: "勝利を追求する天才",
    balcony: "常に一番を目指し、その意欲がチームを高いレベルへと押し上げます。比較を成長の糧にします。",
    basement: "勝つことにこだわりすぎてプロセスを楽しめず、人間関係を損なうことがあります。",
    opposite_trait: "運命思考",
    opposite_description: "運命思考の人は一体感を重視します。個人の勝利を追う競争性とは対照的です。"
  },
  {
    name: "最上志向",
    genius: "強みを最高レベルに磨き上げる天才",
    balcony: "人や事の長所を瞬時に見抜き、卓越したレベルに引き上げます。強みの活用を最大化します。",
    basement: "弱点から目をそらしたり、完璧でないものに対して不満を感じやすくなったりします。",
    opposite_trait: "回復志向",
    opposite_description: "回復志向の人は弱点を修正します。強みを伸ばす最上志向とは対照的です。"
  },
  {
    name: "自己確信",
    genius: "自分の羅針盤を信じる天才",
    balcony: "自分の能力と判断力に強い自信を持ち、不確実な状況でもリスクを恐れず決断します。",
    basement: "自信過剰で他者のアドバイスを軽視し、頑固だと思われることがあります。",
    opposite_trait: "慎重さ",
    opposite_description: "慎重さの人は外部情報を重視します。内なる確信で動く自己確信とは対照的です。"
  },
  {
    name: "自我",
    genius: "特別な存在として輝く天才",
    balcony: "他者から認められたい欲求を原動力に、大きな成果を上げます。独立心旺盛です。",
    basement: "常に称賛を求め、認められないと落ち込みます。自己中心的だと思われることもあります。",
    opposite_trait: "運命思考",
    opposite_description: "運命思考の人は全体への貢献を重視します。特別な個人でありたい自我とは対照的です。"
  },
  {
    name: "社交性",
    genius: "初対面の心をつかむ天才",
    balcony: "知らない人と打ち解け、好感を持たれることを楽しみます。広いネットワークを築きます。",
    basement: "関係が表面的になりがちで、深い信頼関係を築くのに時間がかかることがあります。",
    opposite_trait: "親密性",
    opposite_description: "親密性の人は深い関係を大切にします。広く浅い社交性とは対照的です。"
  },

  # --- 人間関係構築力 (Relationship Building) ---
  {
    name: "適応性",
    genius: "今を生きる天才",
    balcony: "「今」に集中し、予期せぬ変化にも柔軟に対応します。流れに身を任せるのが得意です。",
    basement: "長期的な計画を立てるのが苦手で、方向性が定まらないと思われることがあります。",
    opposite_trait: "焦点化",
    opposite_description: "焦点化の人は目標を重視します。流れを重視する適応性とは対照的です。"
  },
  {
    name: "運命思考",
    genius: "すべての繋がりに意味を見出す天才",
    balcony: "あらゆる物事は繋がっていると信じ、全体像で捉えます。他者に寛容で思いやりがあります。",
    basement: "現実離れした理想論を語り、個人の責任を軽視することがあります。",
    opposite_trait: "分析思考",
    opposite_description: "分析思考の人は論理的な因果関係を求めます。包括的な運命思考とは対照的です。"
  },
  {
    name: "成長促進",
    genius: "人の可能性を見つけ育てる天才",
    balcony: "他人の小さな進歩を見逃さず、辛抱強くサポートして励ますことに喜びを感じます。",
    basement: "成長の意欲がない人に興味を失ったり、おせっかいだと思われたりすることがあります。",
    opposite_trait: "最上志向",
    opposite_description: "最上志向の人は卓越したレベルを求めます。ゼロからの成長を喜ぶ成長促進とは対照的です。"
  },
  {
    name: "共感性",
    genius: "感情の共有の天才",
    balcony: "相手の気持ちを深く理解し寄り添います。言葉にされない感情も察知して信頼を築きます。",
    basement: "他者のネガティブな感情に引きずられ、客観的な判断ができなくなることがあります。",
    opposite_trait: "分析思考",
    opposite_description: "分析思考の人は事実に基づき冷静に判断します。感情を重視する共感性とは対照的です。"
  },
  {
    name: "調和性",
    genius: "穏やかな合意形成の天才",
    balcony: "対立を避け、異なる意見の中から共通点を見つけ出します。協調的な環境を作ります。",
    basement: "自分の意見を主張するのが苦手で、対立を避けるために安易に妥協することがあります。",
    opposite_trait: "指令性",
    opposite_description: "指令性の人は明確に主張しコントロールします。調整役の調和性とは対照的です。"
  },
  {
    name: "包含",
    genius: "仲間はずれを作らない天才",
    balcony: "疎外されている人に気づき、積極的に輪に招き入れます。チームの一体感を高めます。",
    basement: "誰でも受け入れるためチームの質が低下したり、対立を恐れすぎて問題を放置したりします。",
    opposite_trait: "最上志向",
    opposite_description: "最上志向の人は優秀な人と付き合うことを好みます。誰でも受け入れる包含とは対照的です。"
  },
  {
    name: "個別化",
    genius: "一人ひとりの違いを見抜く天才",
    balcony: "個人のユニークな才能や考え方を理解し、その人に合わせた対応や適材適所の配置をします。",
    basement: "全員に同じルールを適用するのが苦手で、個別対応に時間がかかりすぎることがあります。",
    opposite_trait: "公平性",
    opposite_description: "公平性の人は一律の基準を重視します。個別に合わせる個別化とは対照的です。"
  },
  {
    name: "ポジティブ",
    genius: "情熱と楽観性を伝染させる天才",
    balcony: "どんな状況でも明るい面を見つけ出し、その熱意で周囲を元気づけます。ムードメーカーです。",
    basement: "深刻な問題を軽視し、楽観的すぎて不真面目だと見なされることがあります。",
    opposite_trait: "慎重さ",
    opposite_description: "慎重さの人はリスクに注意を払います。常に明るい面を見るポジティブとは対照的です。"
  },
  {
    name: "親密性",
    genius: "深く誠実な関係を築く天才",
    balcony: "信頼できる少数の人々と深く本物の関係を築きます。一度築いた関係を非常に大切にします。",
    basement: "新しい関係を築くのに時間がかかり、身内意識が強すぎて壁を作ることがあります。",
    opposite_trait: "社交性",
    opposite_description: "社交性の人は新しい出会いを楽しみます。少数の深さを好む親密性とは対照的です。"
  },

  # --- 戦略的思考力 (Strategic Thinking) ---
  {
    name: "分析思考",
    genius: "データに基づいた真実探求の天才",
    balcony: "客観的な事実に基づき冷静な判断ができます。因果関係を見つけ出し根拠のある結論を出します。",
    basement: "データがないと判断できず、他者の主観的な感情を軽視してしまう傾向があります。",
    opposite_trait: "共感性",
    opposite_description: "共感性の人は感情を判断材料にします。事実重視の分析思考とは対照的です。"
  },
  {
    name: "原点思考",
    genius: "過去から現在を理解する天才",
    balcony: "現在の状況を理解するために背景や歴史を振り返ります。過去の事例から洞察を得ます。",
    basement: "過去にこだわりすぎて新しい変化を受け入れるのが遅れることがあります。",
    opposite_trait: "未来志向",
    opposite_description: "未来志向の人は未来に目を向けます。過去を振り返る原点思考とは対照的です。"
  },
  {
    name: "未来志向",
    genius: "未来のビジョンを描く天才",
    balcony: "未来を鮮明に思い描き、そのビジョンで人々に希望を与えます。前向きなエネルギーを持ちます。",
    basement: "未来に夢中になりすぎて現実の課題をおろそかにし、夢想家だと思われることがあります。",
    opposite_trait: "原点思考",
    opposite_description: "原点思考の人は過去から学びます。ビジョンを追う未来志向とは対照的です。"
  },
  {
    name: "着想",
    genius: "アイデアの泉の天才",
    balcony: "無関係な物事を結びつけ、斬新な発想を生み出します。行き詰まった状況を打開します。",
    basement: "アイデアが多すぎて実行に移すのが苦手だったり、現実性に欠けたりすることがあります。",
    opposite_trait: "分析思考",
    opposite_description: "分析思考の人はデータの裏付けを求めます。斬新な概念を生む着想とは対照的です。"
  },
  {
    name: "収集心",
    genius: "知のコレクターの天才",
    balcony: "好奇心旺盛で情報や知識を集めることを楽しみ、必要な時に適切な情報を提供できます。",
    basement: "集めること自体が目的となり、整理や活用が疎かになったり取捨選択が難しくなったりします。",
    opposite_trait: "焦点化",
    opposite_description: "焦点化の人は不要な情報を削ぎ落とします。何でも集める収集心とは対照的です。"
  },
  {
    name: "内省",
    genius: "深く考える天才",
    balcony: "一人で静かに考えを巡らせ、物事の本質を深く探求します。思慮深い結論を導き出します。",
    basement: "考えすぎて行動に移せない「分析麻痺」に陥ったり、周囲から非協力的だと思われたりします。",
    opposite_trait: "活発性",
    opposite_description: "活発性の人はまず行動することを重視します。思索を深める内省とは対照的です。"
  },
  {
    name: "学習欲",
    genius: "学びのプロセスを楽しむ天才",
    balcony: "未知の分野にも臆せず飛び込み、常に自分を成長させ続けます。習得のスピードが速いです。",
    basement: "学ぶことに夢中で実践が疎かになったり、興味の対象が次々と移ったりすることがあります。",
    opposite_trait: "達成欲",
    opposite_description: "達成欲の人は学んだことを活用して成果を出すことを重視します。学ぶこと自体を喜ぶ学習欲とは対照的です。"
  },
  {
    name: "戦略性",
    genius: "最適ルート発見の天才",
    balcony: "全体像を捉え、ゴールへの最適な道筋を見つけます。起こりうる障害を先読みして予測します。",
    basement: "選択肢を考えすぎて行動が遅れたり、細かな実務を見落としたりすることがあります。",
    opposite_trait: "適応性",
    opposite_description: "適応性の人はその場の流れに対応します。あらかじめ計画を練る戦略性とは対照的です。"
  }
]

strengths_data.each do |data|
  Strength.find_or_create_by!(name: data[:name]) do |s|
    s.genius = data[:genius]
    s.balcony = data[:balcony]
    s.basement = data[:basement]
    s.opposite_trait = data[:opposite_trait]
    s.opposite_description = data[:opposite_description]
  end
end

puts "Success: #{Strength.count} strengths created."

# 開発環境用のテストユーザー作成
if Rails.env.development?
  # Userがなければ作成 (deviseなのでemail/password必須だが、omniauth前提のためダミーで作成する場合は注意。
  # ここでは既存のUser取得または新規作成を試みる)
  test_user = User.find_or_create_by!(email: "test@example.com") do |u|
    u.name = "Test User"
    u.password = "password"
    u.password_confirmation = "password"
  end

  # 資質の設定 (1位: 慎重さ, 2位: 責任感, 3位: 最上志向, 4位: 親密性, 5位: 分析思考)
  # 既存の関連をクリア
  test_user.user_strengths.destroy_all

  rankings = {
    1 => "慎重さ",
    2 => "責任感",
    3 => "最上志向",
    4 => "親密性",
    5 => "分析思考"
  }

  rankings.each do |rank, strength_name|
    strength = Strength.find_by(name: strength_name)
    if strength
      UserStrength.create!(
        user: test_user,
        strength: strength,
        rank: rank
      )
    else
      puts "Warning: Strength '#{strength_name}' not found."
    end
  end

  puts "Success: Test user strengths created."
end
