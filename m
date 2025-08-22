Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0A9CA0EEB
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 15:05:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upTHJ-00023h-ER; Fri, 22 Aug 2025 11:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGe-0001jU-N5
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 11:01:25 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGQ-0004zD-Mr
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 11:01:24 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2449978aceaso15978045ad.2
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 08:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755874865; x=1756479665; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BScP7UxE/DcOjVr/rqH/MMGS4ER0irB8nkPoyURuy9k=;
 b=DnTqQV/5TK4ZzyILytoT5uz75JWqZwkx0OzMVCAj6LQIpCv8tEPV1FmApQBdJHrogs
 ia1HqSYs2QYRLQoUxKT0uRMHQ1sjbW7k3VL56GqHyTiKZ93k72m2ecbbUZ/6WACCJ/Pd
 LzYlAhWDK8qZY2ydoGGJ8/LJW2t0hutL2Y9ECU/4GLZwE9bdsTcU7rv4StuGb56tf8Gd
 sgOnVSQ4hVOu255C/v5r/kOO2sM9GavmuGXI71LGVDHAubUgOImXhaT7+WjD9VmjsP0x
 V1BcEHAZG7BtvXvHYRwavHzlpp0FZi94NuKj+aBJTBNjhQ5aPDiYGo5Zs+TFwOc04c7m
 M+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755874865; x=1756479665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BScP7UxE/DcOjVr/rqH/MMGS4ER0irB8nkPoyURuy9k=;
 b=pr5x3CZNaX2jR9sJmKIk7KvvN6F+k121ozMcA1ZZ2aCAfM/ajbQ/oBM11M9XN/psqx
 YDsVUMnFeU7xIAoXt6/B9VezOYQDhLdVqNi4aGZGbi/LvpvNyr1rOGYPU7GKXtnRINla
 r0zoQs/NA15RL89LN3jT9LidvKYPXXaii3eDQWJxyJu8vMEBgJ61cPbTCMMu8NLTHtDD
 SYjrDSesv5zzg1bviOGCwNyytfJokU7xm/g3I0GjUVIoe7Exc0Ep5DtNveCoOXM1NYrV
 Xyo7CtED/LzZ+FDWOsPyBUxiejFTHaxg9CZhVrdg1bRYOHq8JUd86wVRs/ynzr8hbIW5
 6fQg==
X-Gm-Message-State: AOJu0Yxzvt4Jva7MQQSkaBqepA+F9IqlPwMfId1YKfpGso1O1ElzN514
 CcyrayiLlgqFhMjXx3LIs9Lz27T6Xm9OVN3NjGMkTMsi7mkEETSS8WMEzKTZ22G6ix4=
X-Gm-Gg: ASbGncv0lhlerAwMG7UrIYf+yHrFVUJcBGkj2VitQQCNqZt56EIVtbeinGouuw6Q1ah
 m0Vaqrjlfb+R7t3jLLxhGu0LnZnqob2mliA3M1RZiTGnF9KDmzZjSLod6PbatNB+sl3qlccF3su
 qWlTO7/V7s8DajOaRuVI+dcfNJDxbjqkUKWbCqpz3C+GXMSjaExdTvDtG9WBXSqu6hP7JmYZS5v
 sluCXpdsCWfIFORRxIyh2T2dcXxbkMgpPVcsbdEWVah/iuut2u4anfMQz4fSyrQwIjbViwJTsY9
 F5+35ynjwql8wJFVu1SvKTrhP7P9YT3up2Z9e5l1U9JwHPXb3w2IuT5+Rwph6iSdlxY3zbq5w3U
 ViX+r3rGE2PJDYmrcCFN/0xGXuMvmBaijONwTndHv10I=
X-Google-Smtp-Source: AGHT+IGmxJMGxDy/SvLeF43ie/hot59tJhE2rbcfb6WXSbGYIMI34GZHff2zjx4DzMnajq1NyL2HfA==
X-Received: by 2002:a17:902:d502:b0:234:f580:a11 with SMTP id
 d9443c01a7336-2462ee78588mr53505785ad.19.1755874865295; 
 Fri, 22 Aug 2025 08:01:05 -0700 (PDT)
Received: from pc.taild8403c.ts.net ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed5406e4sm85929495ad.165.2025.08.22.08.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 08:01:04 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 00/12] single-binary: compile once semihosting
Date: Fri, 22 Aug 2025 08:00:46 -0700
Message-ID: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This series compiles once semihosting files in system mode.
The most complicated file was semihosting/arm-compat-semi.c, which was carefully
cleaned in easy to understand steps.

v2
--

- use vaddr for syscalls.c/.h
- static qualifier for console_{in,out}_gf
- use vaddr for arm-compat-semi.c
- semihosting/arm-compat-semi: fix cast for common_semi_set_ret

v3
--

- keep common_semi_sys_exit_extended (Peter)

v4
--

- fix patch 9 commit message to s/uint64_t/vaddr (Phil)

Pierrick Bouvier (12):
  semihosting/syscalls: compile once in system and per target for user
    mode
  semihosting/syscalls: replace uint64_t with vaddr where appropriate
  semihosting/guestfd: compile once for system/user
  semihosting/arm-compat-semi: change common_semi_sys_exit_extended
  target/riscv/common-semi-target: remove sizeof(target_ulong)
  target/{arm,riscv}/common-semi-target: eradicate target_ulong
  include/semihosting/common-semi: extract common_semi API
  semihosting/arm-compat-semi: eradicate sizeof(target_ulong)
  semihosting/arm-compat-semi: replace target_ulong with vaddr
  semihosting/arm-compat-semi: eradicate target_long
  semihosting/arm-compat-semi: remove dependency on cpu.h
  semihosting/arm-compat-semi: compile once in system and per target for
    user mode

 include/semihosting/common-semi.h             |   6 +
 include/semihosting/guestfd.h                 |   7 --
 include/semihosting/semihost.h                |   2 +
 include/semihosting/syscalls.h                |  30 ++---
 semihosting/arm-compat-semi-stub.c            |  19 +++
 semihosting/arm-compat-semi.c                 |  65 ++++++++---
 semihosting/guestfd.c                         |  26 +----
 semihosting/syscalls.c                        | 109 +++++++++---------
 ...mon-semi-target.h => common-semi-target.c} |  22 ++--
 ...mon-semi-target.h => common-semi-target.c} |  27 +++--
 semihosting/meson.build                       |  18 +--
 target/arm/meson.build                        |   4 +
 target/riscv/meson.build                      |   4 +
 13 files changed, 190 insertions(+), 149 deletions(-)
 create mode 100644 semihosting/arm-compat-semi-stub.c
 rename target/arm/{common-semi-target.h => common-semi-target.c} (59%)
 rename target/riscv/{common-semi-target.h => common-semi-target.c} (53%)

-- 
2.47.2


