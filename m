Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26941E7DEEE
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 15:36:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmvyW-0008Sj-Dj; Mon, 02 Feb 2026 10:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vmvyS-0008S6-Ak
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 10:36:24 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vmvyQ-0005Dv-5Y
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 10:36:24 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso47297755e9.0
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 07:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770046580; x=1770651380; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j4/kwZ73A7vkmvhFZ8O1A7HoNiOiQZYmNOg6/BjiXVo=;
 b=ck/czsTFsrM/j1DNB5rak559ZJPrB0Nx46Pu7KyO4B4zeFMVT5xWkiUHE2BzyYRouo
 FkJYAs88Onjnj5vrBkn9sKIBxixrfvI62p/7czelQR49qaADB6VqjpcxCaXaTncKhg/J
 tj0CUKghHfCf1vxfD+5b9ZcIbD30dkfS9zEYf/HSyW5Rh07UucTI6yrof51vOVDCcFQa
 1vbAS7QgblD5j3HmnaSTd7Kvs+xgDodaOzg7FKAaY1jD0fvIdZQCzxCVmg2u8JBYoLCb
 GZIoUD6HNrsWy0ZgBsBOO1td3n6BmFtCecn1GGvwZBQexybTe7GPE49G9HyqzlrhAJ6/
 sVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770046580; x=1770651380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j4/kwZ73A7vkmvhFZ8O1A7HoNiOiQZYmNOg6/BjiXVo=;
 b=gFIjNa8Pekri9zLeglNxuNtNrX4M5AysvJSnh4N6IBhxSxRR8uXokS/L1g7kqtQP/w
 skhsg/k/OWgsGF7+maA4bo74uDvc6bQA0TeIKP93n+hPcPSyy5SdzUCgLkCEoDeD0zPK
 z9Uvm2EKjLC0EaGUCmGnjyFyz/1gPKHv3Jjm8wQknkafgqEcrlF6BSUTF6GoNGVLGCQ7
 DXOj0DIN8kMSm2XCqu1sta6QrC07VmvxI/6u2fHW30RhYXXwpylgCs8zex0SNjY0eQI/
 Sa0GRHC6x6STUH8Q+nCA6UJb4rFRWByw3oagD6Nm7BQZH6Lxc4hEWqd84t12DBpqBiIN
 4fCg==
X-Gm-Message-State: AOJu0Yw/12lXpsxXec8pQptuWFPJ9Otso7Hr4yTRd+Myq20BsHwfG57t
 L8oCrxzlUXGzffaJoV9/PMalmCZmCa2v3bcr/6p5ZuaXm+IrOvr7PDH0dIaAT1oRovrUnOHGp69
 o+pypvto=
X-Gm-Gg: AZuq6aLOmlwGg6pMl213DFe4mMmqbqRqVj8iUx5zLFS/MQe8vt9kOPLD3cnvxH/0pa/
 hIMdHavyUZCmwSCI8MgUqZF2rrgBoleV5pPPE1iUYqPnL8e05LpiitOWUzuf6Cwjw/iQKqmpk0c
 7Tir+rk+jqff7MlA4+2XYniNzgVBOQkA5koKiETr2ImvkMuxLVBJKlKyw2a5W9HAjov9cEp3WZZ
 iowlB5yuuogVxtyLva2NE/cJ2GkN28KoSUov0XL0yCTqxzEFR9X6hdH2bKzCiSTn4IkXDnQT74U
 2g5axN6t/R8IEWpL5f1Btw8qvkYiuEADcxejsyBFQji1GpoGTtA6/ieQDrq8E71vPEdymJdBbk5
 fU12lmf5R0Ux5DoeDq2BNglO9DrIXb9kGqm+SiKKv8XM6wJS22ihI5wvdfoZh8idUntKkNGQ0PZ
 152wJVArRp1cdARVVMUZiimfcuTiZp4jppOK2hrv2+lJIPdB2vP4kBSnwM6UU7pixUGt/Kns4=
X-Received: by 2002:a05:600c:1f14:b0:471:14f5:126f with SMTP id
 5b1f17b1804b1-482db4ac1d8mr150386725e9.33.1770046580156; 
 Mon, 02 Feb 2026 07:36:20 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066be77b5sm444483915e9.2.2026.02.02.07.36.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 02 Feb 2026 07:36:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 devel@lists.libvirt.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/2] target/arm: Deprecate '-cpu any'
Date: Mon,  2 Feb 2026 16:36:16 +0100
Message-ID: <20260202153618.78675-1-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Arm '-cpu any' is aliased to '-cpu max' since more than
5 years. Deprecate the former in preparation of removal.

v2: s/any/max/ in target/arm/cpu.c comment

Philippe Mathieu-Daudé (2):
  target/arm: Remove dead code
  target/arm: Deprecate '-cpu any' (remplaced by '-cpu max')

 docs/about/deprecated.rst | 8 ++++++++
 target/arm/cpu.h          | 2 +-
 target/arm/cpu.c          | 1 +
 target/arm/tcg/cpu32.c    | 3 ---
 4 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.52.0


