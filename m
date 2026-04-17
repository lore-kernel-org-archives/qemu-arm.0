Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F78F436BD
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 16:44:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDmI4-0003OC-Mi; Fri, 17 Apr 2026 12:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wDmI2-0003NG-Od
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 12:43:34 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wDmHz-0004rT-Vk
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 12:43:34 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488aa77a06eso15264085e9.0
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 09:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776444210; x=1777049010; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R0EWXP0g57s+kt+kiENK76TgaMvdaDZg54RtGtUrk/o=;
 b=TwRlV9UrUzUq3trRnfrXvX5iEBdA9Vyj42GGTSlfFXQ9V0lsWhQkHxh1N041vyl6Sg
 wCdKe7l7YablptoW2urlGcxc3yxJGtL7N7WQBPb9swquVRu0qTChMGvE5ZSFG1LBkv1s
 wAf2EwIoWihD8ntcaVzPSQmiobGsiF6c5Mj+LTDGDDVFAqrf0y4N7RNYgqdT2Smqr9A8
 UHHfY/erPrmmetkjx55P+mlM8187wCXvA/q+xvlY2QH8cdyDBJJmOISS33AudHuVAKxl
 8SbX3HbSLJ0MgojOVyI53Ljt685F0RLqeoOVkpA+iq/Kvo297v2idR1QvEh7VrHeqizy
 eYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776444210; x=1777049010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0EWXP0g57s+kt+kiENK76TgaMvdaDZg54RtGtUrk/o=;
 b=iULdt9otz/A0F4Q+oW8IL4f7ptMv9frvxfeGnfec6AmqSseKczx6HNLXr4DuRqYhb2
 bl5ZBFg9+Knbz3sOdw5EBYG1tF+YBLTp+D0SyLQNTXxBfhDEj7HJKtfE5LMalXzOEPce
 wXI1Blf5l/bpQN3DmNtclQVCFMN3xjlSX+V7TM+jqIp1apt9QJw9zrCIq95qeUfPwLrm
 tNTBeDrrlmAiyntp0ZQ/hxr9Docp+uBAah5SdeC4JWd9c8lU33Qd6OBGDcNYEKCVdp+G
 HwOchRyqde1rAFRTnZV3qA97DAamgyHp2K7GhETTrwnJ55xbgV0F9MaZounC+IbSpJst
 /x5Q==
X-Gm-Message-State: AOJu0YyGcwBX0iI6BjbvrHc/Tg3dlVARBkqgxDMCTAT5ASG1yTXGnasU
 kZb9ptyzL+2Qbp5p/A7+VM+sEONzZaUdJlVOnW6/KlHVtXmh29GocJ1sXnToWfO5Djotleuv/uu
 Vs3gaEUs=
X-Gm-Gg: AeBDieseZRL7I6/iRCoDcLJa1u7JnXFM8XV6/Wg2sPxgNsGwm88Zsj/c+WYcBO6E86j
 BXjmiFUbYU8mS7HN7/6Lekx8DNzmYjm6PhcvOVeKfW5SKwBGZKbX3nNajnVT9Uqe/PzWJ/fLoKd
 cLRJqnSA4+pMs4mWV5qg3Fn6RlT0T5UkPj9LXDumyuRaoK9yV5lqWK5EjMVopcSrsfleeaFHRuP
 Zr05kDRfloyI2BBxj8ffenPx/cyCL/bciQca+m47At3X1bwkiXhoxe6/lqgkhnXXMnV3p3t6+AO
 HY28KpsxMs5BZYnfTqADzLcUU43HBGTVQyT/BJ10TcZwy8RZ8ub/T51bN7DQAilgf4pgNtR2sZa
 O/iYHG9rrk0JUrd2gU4go6KzUbv0dTWl+bPo7ZGatjWvJflJ5GL1uVlrRp1c7DcmimlbSmop3of
 MUMUhd8Z6U/UZJ85hEgDlludWgPVd6/V34EA==
X-Received: by 2002:a05:600c:4fd1:b0:488:78f2:6b0 with SMTP id
 5b1f17b1804b1-488fb78ede0mr51686335e9.29.1776444210275; 
 Fri, 17 Apr 2026 09:43:30 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0589sm21277785e9.19.2026.04.17.09.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 09:43:29 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7209B5F94F;
 Fri, 17 Apr 2026 17:43:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/7] tests/tcg: more capabilities for aarch64-softmmu tests
Date: Fri, 17 Apr 2026 17:43:20 +0100
Message-ID: <20260417164328.1009132-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

In the process of writing the WFx code I needed to enhance the support
code so we could have interrupts in the test. To do that I needed to
map hardware into the page tables. To do that I wanted to make the
page table code easier to follow and now here we are.

It's quite a lot of code for a simple thing and of course if we keep
going down this road we'll end up with a kernel all of our own
although not big and professional like Linux.

The other option would be to build some machinery to exploit our cross
compiler support and just import kvm-unit-tests somehow and maybe
integrate it with meson more properly. It already has a more mature
set of helpers and is set up for even more architectural shenanigans
including setup for both GICs and a cleaner unit test wrappers.

While earlier versions of the tests where the result of LLM
prototyping hopefully the splitting and refactoring has made it more
human. There is an additional test for the HPFAR_EL2.NS for bug 2568
but I haven't had a chance to properly clean it up yet so I haven't
included it here.

What do people think? Should we go down this road or choose the
kvm-unit-tests option?

Alex.

Alex Bennée (7):
  tests/tcg: introduce a lib dir for aarch64 system tests
  tests/tcg: convert aarch64 feat-xs test to use helpers
  tests/tcg: convert aarch64 asid2 test to use sysreg helpers
  tests/tcg: move aarch64 page table setup to c code
  tests/tcg: add HW page for aarch64 tests
  tests/tcg: create a mini-gic3 library
  tests/tcg: add basic test for aarch64 wf[ie][t] insns

 tests/tcg/aarch64/system/lib/gicv3.h      |  60 +++++++++
 tests/tcg/aarch64/system/lib/pgtable.h    |  80 ++++++++++++
 tests/tcg/aarch64/system/lib/sysregs.h    |  42 +++++++
 tests/tcg/aarch64/system/asid2.c          |  35 +++---
 tests/tcg/aarch64/system/feat-xs.c        |   4 +-
 tests/tcg/aarch64/system/lib/gicv3.c      |  70 +++++++++++
 tests/tcg/aarch64/system/lib/pgtable.c    |  70 +++++++++++
 tests/tcg/aarch64/system/vtimer.c         |  23 +---
 tests/tcg/aarch64/system/wfx.c            | 143 ++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.softmmu-target |  22 +++-
 tests/tcg/aarch64/system/boot.S           | 125 +++----------------
 tests/tcg/aarch64/system/kernel.ld        |   3 +
 12 files changed, 521 insertions(+), 156 deletions(-)
 create mode 100644 tests/tcg/aarch64/system/lib/gicv3.h
 create mode 100644 tests/tcg/aarch64/system/lib/pgtable.h
 create mode 100644 tests/tcg/aarch64/system/lib/sysregs.h
 create mode 100644 tests/tcg/aarch64/system/lib/gicv3.c
 create mode 100644 tests/tcg/aarch64/system/lib/pgtable.c
 create mode 100644 tests/tcg/aarch64/system/wfx.c

-- 
2.47.3


