Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2203D1D461
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 14:37:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdr63-00078q-CE; Thu, 08 Jan 2026 09:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5r-00071A-29
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:33 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5n-0000gA-Uy
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:30 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so30606605e9.1
 for <qemu-arm@nongnu.org>; Thu, 08 Jan 2026 06:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767882865; x=1768487665; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LK1fJuDCyZ+JCIQVkUbdv1IIkYo19dcsZFbtPtQwA4o=;
 b=LD/0f++ohkwH7/4s0EdsB1GxqYY2/8C6HENzxrh1AGSoebdzIIXENjjhF1qr4780Xu
 OahAnTFrMb7gddaOElTF8lUMiaE3kzn8tvGkxr2X933vnF1LOpD0Ks9sIPcYxhIbUEqx
 Ecj9krFM5XC7rLaXskCkACW1V8nlWzsHj4wWExAM50IUvcHPlRnDsP3ldTkYzxXFkrzO
 FqCDFEYdiWIDzjxQJvAK5yHbxRJu8hkIVx49vDsyCqasEH8h6iDSq9BeSINxZ/lEluF+
 9yeKa+GlyzB1dg7eK6amdzG08Dx3VGqQd5fSazcvS50sH6s5KurgNYv8RGlslDKonxzL
 D9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767882865; x=1768487665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LK1fJuDCyZ+JCIQVkUbdv1IIkYo19dcsZFbtPtQwA4o=;
 b=wqN/j/t8HHLfQ/Swc23N+HiN3Wwx7G3SgII/+h3tvInVrzX0DFb331yMIIGH3dUswA
 Z3rUiEZuZeNey3tTTfhzVrANrlSzHYVZu5ErMDReSwf8IVemcMFwqUyJWmjYqE5GAXj7
 iUuz9BTTt9WIw5etRfxYMJIHEghWyTz+TrJiLRPA66WS0udaA7los2q/G2I18G8RRFvh
 vAI6AJ73gVOwM0cMnAdjlOqzxjvUlJE6jR/Yd7yG4cVFm+dNX+HTTYuuS3AWTjnX00ri
 WZTw+yAFKvOgEN7/2A/Riodpj6U8upBhbqWrxLtBV5rIkDEuzgD9yMqpYUJSnObxNXHR
 wkow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVObA/mLZblyq9ngjDKTYICevcod7efLMGgWQ1p7u+p502/ESDeiiV9JXWLuN9art9NAsfOKv+d/w==@nongnu.org
X-Gm-Message-State: AOJu0Yx9Gy7R8HOPAcjR3YSSo1d4zY5nS/YCA3wrYiRndWsi+YF1fI6U
 a6q6kf86AP5GS1dnym/phz10UVrCEdq318r6BO3FwD7yCQKMxO6WQR3i3Ksu7Wcm5d8=
X-Gm-Gg: AY/fxX6zi6Jz5hwvGDIt7O8T1Ah1ocM/Mi1Gb8MviuHeFhH+fqfe3QI1FQZbV3neSId
 EoLGqb4ozf3JYkWWBn43gQn1pMB3rkn/F5/wWjb528TRLsS5CVAvlH3VPueMAMAOJ4rJlMhZAbl
 ExoC4S/KB0Gtz9//Js8SsIA1XqxzwDY7leSTRhUXzrGrd9+Q7pEwvEUkDxw0/Bc1UcMqLFXBBsf
 FDFlKbEbASsKADZvNZnKSxdSdscaen5ZqE+nTWCUtFsBwwlheuUON8GZUgXFuzPxW7fFdqrvzHb
 XfBlWfpwNumatvjTfMUn43bSCC+4zuCVii+QEhAQ5gPwcJCdvJ/WfWV8K4InWmTQ4qQ+BeVYkdn
 2WJbMeIXM5MOfX2ultgCsR77togQDswCdLt5lT7TPeX3hew+pB175JHi6EEl8hcOfH+lnSnKGvR
 w4/8DAPE6P5SI=
X-Google-Smtp-Source: AGHT+IE8oxPQ6D33yNKb1TeAnSpxaYwtuXGYdFLJ1fY2IJ8jUdCoraYWUbvc8DZlzRCxkzt+pJ80mg==
X-Received: by 2002:a05:600c:500d:b0:477:b642:9dc1 with SMTP id
 5b1f17b1804b1-47d84b3baa1mr58498795e9.20.1767882865206; 
 Thu, 08 Jan 2026 06:34:25 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f7053f5sm151990255e9.14.2026.01.08.06.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 06:34:24 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D89B35F804;
 Thu, 08 Jan 2026 14:34:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Yanan Wang <wangyanan55@huawei.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 00/12] cpu_reset clean-ups for arm, sh4, mips,
 m68k and tricore
Date: Thu,  8 Jan 2026 14:34:11 +0000
Message-ID: <20260108143423.1378674-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We tend to apply cpu_reset inconsistently throughout our various
models which leads to unintended ordering dependencies. This got in
the way in my last plugins series:

  https://patchew.org/QEMU/20251219190849.238323-1-alex.bennee@linaro.org/

where I needed to shuffle things around to ensure that gdb register
creation was done after dependant peripherals had created their cpu
interfaces.

Regardless of that we do have a proper reset interface now and most
architectures have moved to it. This series attempts to clean-up the
remaining cases with proper qemu_register_reset() calls so reset is
called when we intend to.

Alex.

Alex Bennée (12):
  target/sh4: drop cpu_reset from realizefn
  target/m68k: introduce env->reset_pc
  hw/m68k: register a nextcube_cpu_reset handler
  hw/m68k: register a mcf5208evb_cpu_reset handler
  hw/m68k: register a an5206_cpu_reset handler
  hw/m68k: just use reset_pc for virt platform
  target/m68k: drop cpu_reset on realizefn
  hw/mips: defer finalising gcr_base until reset time
  hw/mips: drop cpu_reset in mips_cpu_realizefn
  target/tricore: move cpu_reset from tricore_cpu_realizefn
  target/arm: remove extraneous cpu_reset from realizefn
  include/hw: expand cpu_reset function docs

 include/hw/core/cpu.h |  3 +++
 target/m68k/cpu.h     |  1 +
 hw/m68k/an5206.c      | 24 +++++++++++++++++-------
 hw/m68k/mcf5208.c     | 25 +++++++++++++++++++------
 hw/m68k/next-cube.c   | 23 +++++++++++++++++------
 hw/m68k/virt.c        | 24 +++++++-----------------
 hw/mips/cps.c         | 22 +++++++++++++---------
 hw/misc/mips_cmgcr.c  |  1 -
 target/arm/cpu.c      |  1 -
 target/m68k/cpu.c     |  1 -
 target/mips/cpu.c     |  1 -
 target/sh4/cpu.c      |  1 -
 target/tricore/cpu.c  |  9 ++++++++-
 13 files changed, 85 insertions(+), 51 deletions(-)

-- 
2.47.3


