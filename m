Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F157BE9A053
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 17:20:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt7fQ-0005Mg-AM; Thu, 19 Feb 2026 12:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vt7fN-0005L0-Ge
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 12:18:17 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vt7fK-0000Pv-Ek
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 12:18:17 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b8850aa5b56so225137566b.2
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 09:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771521492; x=1772126292; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gadO7bigcRDHgxevTilDA1AZWO5dSY59yjXY5cBcG9g=;
 b=dqebgeBIkKBnOw5Z7Suz5g2vi22QfU6GNWD1VRfnWcrsekI4m8d44r7xdmmq63ja1O
 U+kVXkHkPOQy/FBAQMDqymIRB9bUmcPQJsls0SWy2fLsJ6F2pTJ3FsoAB5glL3t/qeL7
 dusdOXhEx9wAG+rgFUpeC9olDF36qQ1t2MyULse7Qqp312dIa3KkX0BRjyz2woraXl1K
 dcX4stwFKbpHDQBuEJwvxsjzfVr8Hp9+obFK9/2TH1gq63FOB70Aj/ET/SC14vgWuu34
 88zYEBrZYNvcOis7l14FlWa523VxnJ1kgdTpzlEWeoAaqv88fvfmA0DJALvkblb/+/xc
 Z2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521492; x=1772126292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gadO7bigcRDHgxevTilDA1AZWO5dSY59yjXY5cBcG9g=;
 b=f4iYewE1EILqwX4eG4O3PVLqmGarD9psw00WCv87GTQ4TdGn6w9Dw6KbTeVwNiX8i4
 p6kom17TpXvlCB5R4tY2LfDQIR3tdL+lzgR0vFqYjIEChHmhUb8rlsHPsDdS6uxOT9NN
 XffF8MGVt1gFzYXQHFGcXq8J2/yO+Sdg6PsJgj/3mjxG+dQeISEHC+qMIHsaDgwo/4JC
 Q3QRLdcS05OdI5HXfHQhakHlaWKh/XFxpMRKnb6QJaOXJaHYN7VxgoZ34yNgZh5xQHi3
 8GXJpkxdAenEYZ4gfTmQ7A3SC7Adb+yMwDAr/aB+pSn87uwSsa/fTvPn3x5k8uTJ2pX8
 560w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHEGQm+1hBachA2AoR2xKB6NDRtX6tqj/w4BjDEu+9AYEKmwXEK4iizs3KlkWFg5ig4xO8gVf23A==@nongnu.org
X-Gm-Message-State: AOJu0Yzl+mMD1kfeKwyTxoKu4cFt55jummruUbGEbbUPG79+mYQ2ifHF
 U2+S5MENFINQoxos5ziyCH6O/N9v7eCQtpjvaaFYB1zE/Zr8sOmZ3KRFvm80uxqBsWw=
X-Gm-Gg: AZuq6aJs5Rtg/LwnJ5UBP9GqpQaff5LbblygIUo+yhqKTQETYUAWE56Qm6sGlBFhAS3
 IcREEFLGKndR28OAwz6xyTf0OPx7KyG91duDDSSJMCx4GFszsgZ1jWdvGDz98N2RSk2bIhnzX1L
 VJxPMVvyi1ycY9VAAdSiC6DDNISaG/cY8LA0RRcO/G0jDYjUsOUfUdW0u2rz9qEbOErhyKld+gH
 zr2Au3h/7QxOs9bAYjFbP9jKR/xq9eDflUxJ6egNQbe8S9dwwbypg/bOySe0p6mwAdOU6p2Erah
 hLA61Eyj6s6ij1Ye+OsFTuoFmIpKS8NZs+mXMzCbcS01rMZXfqqz3IHxn+JANivUeyFiPJLaK1Y
 UdFgp9UhWmcV9OkkYKaBnBoYo3UEiP6xcNQslSaTgogKda/vMT4E1sMah7JMEyqRsqNtX1AKSJ8
 3UWKO8R9Sk+F4jHoaHkQnAxwA=
X-Received: by 2002:a17:907:7fa5:b0:b8e:fe3c:2264 with SMTP id
 a640c23a62f3a-b8face2498amr1270538066b.41.1771521492121; 
 Thu, 19 Feb 2026 09:18:12 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735e4cbsm599432366b.13.2026.02.19.09.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:18:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 898D05F818;
 Thu, 19 Feb 2026 17:18:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <yoshinori.sato@nifty.com>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <huth@tuxfamily.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH v2 00/14] cpu_reset clean-ups for arm, alpha, mips,
 m68k and tricore
Date: Thu, 19 Feb 2026 17:17:56 +0000
Message-ID: <20260219171810.602667-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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

v2

I re-span this to address the missing cpu_reset Akihiko found
troubling the alpha replay test:

  Message-Id: <20260217-alpha-v1-0-0dcc708c9db3@rsg.ci.i.u-tokyo.ac.jp>
  Date: Tue, 17 Feb 2026 15:34:28 +0900
  Subject: [PATCH 0/2] Reapply "rcu: Unify force quiescent state"
  From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

I also dropped the use of qemu_register_reset in favour of the proper
3-phase APIs.

Alex.

Alex Bennée (14):
  target/m68k: clean-up includes in cpu.c
  target/m68k: initialise pc/sp vector during reset
  hw/m68k: transition virt machine to multi-phase reset
  hw/m68k: update nextcube to 3-phase reset
  hw/m68k: update mcf5208evb to 3-phase reset
  hw/m68k: update an5206 to 3-phase reset
  hw/mips: defer finalising gcr_base until reset time
  hw/mips: drop cpu_reset in mips_cpu_realizefn
  target/tricore: move cpu_reset from tricore_cpu_realizefn
  target/arm: remove extraneous cpu_reset from realizefn
  hw/alpha: remove unused includes
  hw/alpha: add a reset function for the clipper machine
  target/alpha: move cpu reset into a proper reset function
  include/hw: expand cpu_reset function docs

 include/hw/core/cpu.h |  3 +++
 include/hw/mips/cps.h | 14 +++++++++++++-
 target/alpha/cpu.h    |  2 ++
 target/m68k/cpu.h     |  2 ++
 hw/alpha/dp264.c      | 12 ++++++++++--
 hw/m68k/an5206.c      | 23 ++++++++++++++++-------
 hw/m68k/mcf5208.c     | 26 ++++++++++++--------------
 hw/m68k/next-cube.c   | 23 +++++++++++++++++------
 hw/m68k/virt.c        | 34 ++++++++++------------------------
 hw/mips/cps.c         | 26 +++++++++++++++++---------
 hw/misc/mips_cmgcr.c  |  1 -
 target/alpha/cpu.c    | 10 ++++++----
 target/arm/cpu.c      |  1 -
 target/m68k/cpu.c     | 41 +++++++++++++++++++++++++++++++++--------
 target/mips/cpu.c     |  1 -
 target/tricore/cpu.c  |  9 ++++++++-
 16 files changed, 149 insertions(+), 79 deletions(-)

-- 
2.47.3


