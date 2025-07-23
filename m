Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26299C83F1A
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Jul 2025 13:55:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ueZwJ-000466-06; Wed, 23 Jul 2025 09:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ueZt6-0002of-Rn
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 09:52:10 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ueZt4-0002oK-Dd
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 09:52:04 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45618ddd62fso69540415e9.3
 for <qemu-arm@nongnu.org>; Wed, 23 Jul 2025 06:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753278719; x=1753883519; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WzSVwRjlmLr6uY4Fxwa1RWwINPFTTiRXdeHymvaEdJs=;
 b=doVvQgxUA5EP5fW3U9XuygcdqOMdElXcXKPYHWrKSni46S2TW1qoolysg7vrBy8fv4
 qmEEWVH30jGpSjnysE0b17sOfgOo6aDuMDdSIe1UuXgLm2J7tnxcchGikq02nMGc6MP3
 05V9LyUhDL4/TkmK1x7JMsIMrroTj6Oc+A9sptBnK/LxAZnpdP//ZzD/K67206wrgOOM
 M75NroSrC3wMKy4FzPhxm7S4OD69345jEb8f863qtDHUqcDGGKxriyyz/jFk4Qefo2a6
 AHMK7LcqXX92x0cj6Yc280N2PEZnIO5wSw021hRCiceOOV0V6rCNMmkj2soUesyEsHSf
 tPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753278719; x=1753883519;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WzSVwRjlmLr6uY4Fxwa1RWwINPFTTiRXdeHymvaEdJs=;
 b=voUGkHPQJWZj8fVcMjXeNdamrs9hnCGaF9oIDGxyAHGmqt+aq+56Z0HoX9yYmxSjWh
 d/F+QTawHRoEkDO+rBK1/vudAPadVS9rNj/ZeHA309cIW2HuP8n9UuxLUsVujysq32IW
 q27UvNwqpZo4J0xTCPqW45r3qhAuTqv7X1DLUIB+t7CWp43pg+tbkkU1dVT7M8y5FQMY
 6MeMANNnCp58J5086hFhQ750cVG0mA7FpU96OGr2SWeBQFSqW1zBexKeZGCrWUe/SC43
 zHMeCKtgiPpMGjcSshH9fnt1X5WZWj6j8uVWCnV5mfO8rXVOSUR03CobQrBQgYstEMjH
 v/Sw==
X-Gm-Message-State: AOJu0Yz9LCjQhOuA5WbQeqslRL5Ir2jNESwc7yRaKkeIIqgyjpYV3Kce
 LAbtIoPtR/zZQSBLYa6K6OUvpwatkGtbRcCfiFDlB+NgbSI8Ard0Q2Rm3EambJtVh/g=
X-Gm-Gg: ASbGncuQLdCAmcLaru4c5nBGZCKQdBONk0NB/vfX0aBtG4wjIFsDegOhnMNozMKOxKW
 vUaYk1jzzJzTMtlXdfymgbcJUogZJtyrBqfc4e9tjpYbiznNVzGH9y+JaCy5xa+cHzNUVEap43Y
 G7umtXI5K/boesz6xPC4jj9BI4oXQNjy8YzbYDVCM0RKVUJjpBQwWu97XruarklMcTMzcSM1znn
 H2CBu9JMv07ajhN1yrwaxrGtmCD6ncmnAKM/DyUzs8CDAMcLLRVVYOPR3XVZR6MYzM4+uqPfKzR
 NVe6VJyiAMFBSUN5I6SNoubVAwWE2M4w4xwGae2kVZrKsYgk9buPS42SYEzYpjRcChfVzHY2kV9
 VAJA/Ez6X5L4Q2Hz2cDx6uxABkvKroOQh5/fEkfbeEB2v/dl1ZsQNJmB/GX3k2AJoQ7K/hRyOfm
 2Vo+EEUtQ=
X-Google-Smtp-Source: AGHT+IEc93Ma6j0dB6V2FLi8g/Nh9GU0+I9wCbsnl2XWN0vm4qaw4eqC/NRvzL2FxnRDdEM9Mmq2Dw==
X-Received: by 2002:a05:600c:540e:b0:453:6b3a:6c06 with SMTP id
 5b1f17b1804b1-4586bddfd36mr17214885e9.29.1753278718833; 
 Wed, 23 Jul 2025 06:51:58 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca48a2esm16505085f8f.51.2025.07.23.06.51.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Jul 2025 06:51:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v4 0/4] target/arm/hvf: Correctly set Generic Timer
 frequency
Date: Wed, 23 Jul 2025 15:51:52 +0200
Message-ID: <20250723135156.85426-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

(Series fully reviewed)

When using HVF, the accelerator gets the host Generic Timer
frequency and update cpu->gt_cntfrq_hz; it is however too
late, as the timers have been created in arm_cpu_realizefn()
using the default frequency. Then guest virtualization code
depending on timers ends very slow (experienced on Silicon M1,
timer running at 24MHz but QEMU timer a 1GHz, ~70x slower).

This series fixes that by introducing a cpu_target_realize()
callback for accelerators, creating ARM timers *after* calling
this callback, and correctly setting the per-cpu timer freq
there.

Philippe Mathieu-Daudé (4):
  accel: Introduce AccelOpsClass::cpu_target_realize() hook
  accel/hvf: Add hvf_arch_cpu_realize() stubs
  target/arm: Create GTimers *after* features finalized / accel realized
  target/arm/hvf: Really set Generic Timer counter frequency

 include/accel/accel-cpu-ops.h |  1 +
 include/system/hvf_int.h      |  2 ++
 accel/accel-common.c          |  5 +++
 accel/hvf/hvf-accel-ops.c     |  2 ++
 target/arm/cpu.c              | 65 ++++++++++++++++++-----------------
 target/arm/hvf/hvf.c          | 20 ++++++++++-
 target/i386/hvf/hvf.c         |  5 +++
 7 files changed, 67 insertions(+), 33 deletions(-)

-- 
2.49.0


