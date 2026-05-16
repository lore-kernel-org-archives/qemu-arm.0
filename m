Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FC8CD4F21
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 17:15:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOIbw-0002I5-UT; Sat, 16 May 2026 13:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIbs-0002Hh-4O
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:15:32 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIbp-0007n8-7A
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:15:31 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso6326775e9.2
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 10:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778951727; x=1779556527; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XHHnJtEBNK9u9Oo5QyR6G6fsgpAKxhHypZXuKbvfgaM=;
 b=zOmlF4Rwg7kYVvOKfhySHVSq/NNvH1yoLsd2pudTwAplhEfAFbhumYoUANGzkVukCA
 UPkeESQnn9mq5oEnEcba3x3Iqh/IJXiJ/gq13xCRwi20etEpY9FNw2MQjoRfZotut+Lo
 XwN2ZPpZXgPHwiNZmSQN2p+Z5H4xO3Hli9/ateM1YiL0LT1q2bCz1WJ0TTha0ReBUltT
 b1sNneaCvWswc02dh4fPwAK4oJ+gskGm0rD0vJ+kf8+JG4DCwfBKjpecN3w8OIAu9+nS
 a4iRmLlBygdQLY8Zg+aNDXhaEGM8254IEyPPYHVH0vdvZMwnVSup+j+pxJa2rPHfpy2I
 UEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778951727; x=1779556527;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHHnJtEBNK9u9Oo5QyR6G6fsgpAKxhHypZXuKbvfgaM=;
 b=lx5/wtX/3EDGjU1pkMYxVDwLefjlfm7N6zvY1KlDgkqIjEDu1RoFOlFTWv0rgAD8h0
 6LZsef0TQSK6jQ7tgYIpzW4FOcWTXVlwlieJTwjt+ud7hwRtlNnxKdoY4bG9sgf9r38T
 4XapTuAZPh2pnCr5Rpq1gUXdGn/RIncMaOTmmWntXeItztgyLzUaCS/OlQHJVSw67Dxk
 knnhK6E767dHNx/S9iY1nWElmEa+1DK+p/DtYn3z4iHrH9u5EBsIIRvITaYG3VjBiTL+
 WL1U9hmw4Em6wlPVL+LwAonE85EtaMIoojkpHqFtBJsTTD8mWTlTVbevoZtAe/RynzI5
 PITQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+1xoAz+Fah+gcY/6EpI246o8sFI9nWYTl+BOpuA3nFyLQ+6Ul3ucPBVGONh+1fl6/KQZNTaYkzAA==@nongnu.org
X-Gm-Message-State: AOJu0YwjovTUtjshT7HYKjxjwvaCuxPJviChXq9ouFJSffdPdgtEeVW8
 b8+io0KqZ+kZCExTAY3aVEBwhwpD2OGH7u02v8MRKNqa0N7tgvf5nhMIMDACyqfP9DU=
X-Gm-Gg: Acq92OHaE4vPq0uL5Z0Rwco5piPx8OTMXXl4qkYszH1S+EVz1LfcQ0liQadQZmcyMTa
 eXKnMN+2Aoz2ZzbTZtbegz/aE3vJmbTVLpnalnZ8X0bTT40Sb89K4TQFoaeW78IdrkpyhSwj1oA
 WY/yyOhxhOvRbpF7Lk9xLrazYYsi9M7YbEhIN0BWk01SXPtwZn4QKpalYsAf1d1Mf6c6pmE4n8U
 kbUvTMjm2GPmZ2SsAwmcXPTiJw1HScmg/CT8jMNmEdGRNDjRNr+/3G+T8bGXap2lGxLSsVTtJTO
 u2zPAeM8RaSw/DczB4+qgRQ45uU31wddsHTs2aF+8GJvL+ep6SEA7gopS1ZlVwsT80zw7eeO8Tz
 fKAbRdFkODEgYscPshLgILL+1vEN7aI0GodytvDZtTEkHxTzGlaMQAkllUPwLsW4B1Yc1O8RkoF
 1joonbKvREx8UpWTnUUWTFSGcAWPsIP7y5o6Y/+o7dPKIaLTpMmROLbjHsNyVLNl1fH4IMv+vLk
 4hXXwBcPJA=
X-Received: by 2002:a05:600c:3b27:b0:48e:6275:27e1 with SMTP id
 5b1f17b1804b1-48fe6516b49mr112303655e9.26.1778951727103; 
 Sat, 16 May 2026 10:15:27 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe53804aesm133316255e9.15.2026.05.16.10.15.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 16 May 2026 10:15:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v7 00/21] single-binary: Make hw/arm/ common
Date: Sat, 16 May 2026 19:15:02 +0200
Message-ID: <20260516171524.19184-1-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Since v6:
- Do not initialize Aspeed CPU in SoC realize (cdrx)

Since v5:
- Unify 'max' CPU type (rth, pm215)

Since v4:
- Add DEFINE_MACHINE_WITH_INTERFACES (Zoltan)
- Use GPtrArray for get_valid_cpu_type (Richard)
- Define InterfaceInfo[] arrays (Richard)
- Collect R-b tags

Since v3:
- QAPI structure renamed as QemuTargetInfo
- MachineClass::get_valid_cpu_types() runtime
- target_aarch64() checking SysEmuTarget value
- Remove CONFIG_TCG #ifdef'ry in hw/arm/

Since v2:
- More comments from Pierrick addressed
- Use GList to register valid CPUs list
- Remove all TARGET_AARCH64 uses in hw/arm/

Since v1:
- Dropped unrelated / irrelevant patches
- Addressed Pierrick comments
- Added R-b tag
- Only considering machines, not CPUs.

Available here, based on my pending patch queue:
https://gitlab.com/philmd/qemu/-/tags/single-binary-hw-arm-rfc-v5

Matthew Penney (1):
  tests/qtest: fix discarded const qualifier warning

Philippe Mathieu-Daudé (20):
  hw/arm: Build ARM/HVF GICv3 stub once
  hw/arm/raspi: Initialize 64-bit CPU types during DeviceRealize()
  hw/arm/raspi: Build objects once
  hw/arm/aspeed: Do not realize 64-bit CPU types under QTest
  hw/arm/aspeed: Build objects once
  hw/arm/meson: Remove now unused arm_ss[] source set
  target/arm: Introduce common system/user meson source set
  target/arm: Build gdbstub64.o as common object
  target/arm: Build cpu64.o as common object
  target/arm: Restrict IDAU interface to TCG namespace
  target/arm: Rename Aarch64-specific methods
  target/arm: Extract common code related to 'max' CPU
  target/arm: Use make_ccsidr(LEGACY) in 32 bit 'max' CPU type
  target/arm: Implement DBGDEVID* registers in max AArch32 CPU
  target/arm: Only set %kvm_target when KVM is enabled
  target/arm: Factor aarch64_aa32_a57_init() out
  target/arm: Re-use common aarch64_aa32_a57_init() helper
  target/arm: Define 'max' CPU type in cpu-max.c
  target/arm: Build cpu32-system.o as common object
  target/arm: Build cpu-max.c once

 include/hw/arm/armv7m.h                    |   2 +-
 include/hw/misc/tz-msc.h                   |   2 +-
 target/arm/internals.h                     |  10 +-
 target/arm/{ => tcg}/idau.h                |   4 +-
 hw/arm/armv7m.c                            |   2 +-
 hw/arm/aspeed_ast27x0.c                    |  14 ++
 hw/arm/bcm2836.c                           |  14 +-
 hw/arm/raspi.c                             |   4 -
 target/arm/cpu-max.c                       | 241 +++++++++++++++++++++
 target/arm/cpu.c                           |  10 +-
 target/arm/cpu32-stubs.c                   |   8 +-
 target/arm/cpu64.c                         |  92 +-------
 target/arm/ptw.c                           |   2 +-
 target/arm/tcg/cpu-v7m.c                   |  11 +
 target/arm/tcg/{cpu32.c => cpu32-system.c} | 182 +---------------
 target/arm/tcg/stubs32.c                   |  10 +
 tests/qtest/libqtest.c                     |   2 +-
 hw/arm/meson.build                         |  15 +-
 hw/intc/meson.build                        |   2 +-
 target/arm/meson.build                     |  26 ++-
 target/arm/tcg/meson.build                 |  57 ++---
 21 files changed, 356 insertions(+), 354 deletions(-)
 rename target/arm/{ => tcg}/idau.h (97%)
 create mode 100644 target/arm/cpu-max.c
 rename target/arm/tcg/{cpu32.c => cpu32-system.c} (80%)

-- 
2.53.0


