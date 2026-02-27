Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EF7FD530D
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 08:01:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvsn4-0006NH-Tr; Fri, 27 Feb 2026 03:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vvsn3-0006Mo-4J
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 03:01:37 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vvsn1-0001ib-AY
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 03:01:36 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso18054315e9.0
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 00:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772179293; x=1772784093; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=APxl7Tz/BNsPYdflQpzKd3+z0GhTJJVepRD4NMTzCO4=;
 b=b1dYZTdCAI2vQin/UBVD9v+KyAc9KZEa6Thk55D2617jVU7xFM0KwVKhy99lS46iDb
 hgdr+L+Jja+MoskZtS2ya03YrdlvLpH4kgXZ5Al7h8Bmoq0nPJJL5PCSdefVvdLp73RT
 iqtLVCX4ZcH1gU6NICvkZD9LhHK4zB6dQqPd7bAjLGjrpWY51U9sUJLGBPMMgikR+xc5
 7xx+Fkx0fSbOpxPrg3sn786xqVQw0P/TL7F8lWDryuCtr10uPGBhggxLCoImnsR0Redv
 cIYBtz09n/ZAOd7peKdwHhHAq1aM85SsutJiSir+8w8Mgrr3S6dmhYwqes5nOau2QzY2
 jBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772179293; x=1772784093;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=APxl7Tz/BNsPYdflQpzKd3+z0GhTJJVepRD4NMTzCO4=;
 b=pxgYYNqKJuqgm80rhG7t2PSFDOkFJhb3mzfoOJSkjKxax+J7tljYH1TWElQ5OXFvtj
 N7f+68wrngx3LGMuAzmU++Dyaz9XFPzLuP0FsFPqpieU+MYghhg+kT4AZjSV9Pgg/x1e
 2Vvl8PSXTnAUUhRAZeWjpQpY9/nkfCZRlsIiQyNfa6zgfoc1fCaqmHJJhte5rGnTZvgQ
 muOjmTS3TbJofxoVVl4lZ9V9A2pPtx2xN4npLtGNX1JiY6q5jaCNbceHcoKdDREXj/CG
 Yez/4TmcGWJ46zN/ngf/3bOrKrK+a+SxOkPGsJ/KiVWUaXTWOyrx5s9smeeNk/VJlR8q
 DEzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMA/M59bMEUjMfBxyG5tMQlnZx8IqYi8pGjM16DMF4BxB3CuA16teqxaiN5bRyxphg+f4i6kksrg==@nongnu.org
X-Gm-Message-State: AOJu0YwT8pxb7X519e4Ol3yn9BUy48bBNvLggeAsmXz0g+9PB4fZVV/2
 1CrQ6d0aFG+/QRT98PvAoWiDe5OR7o8hct4Zgd2VpCTY0sTu3a41/UiLc60uA+I1TK4=
X-Gm-Gg: ATEYQzz9jYmhw4oNHj+qJk4okYmghT9L4krKT17xxrpQIVI3t70xq+hIt6FKpH9YwIR
 UO+ao2/iv35znd40WEyZxBQHbOfaPCOy2UjPHqYQwSyL5PMW78O8Z6+8XtuLuUgTr0BdoevpMLi
 tab2pvPVfpXF+N8HzKrkOvCA6VprtFDrW0B1ms1+mJ5RPsE/oC74ZfrmXjQNbtPvc6EbbGsoBWu
 wUTkz5RThelxUpyxHtBG2IeoB1Dr4/WWWH5vIQgHeU2dvDwJkBhWkQKs5s7QUL/AnxlACKM9Ubw
 KSM30X9CQaTaUTdjNn6FoPqDV6U6FNkWxiRoBpeiJv+BrGm8LyxVRUWImyFdQujfdBZQznNqBE7
 2/oU27Cg6bYGS28fIAUxQOKxvsTfiypa1z1i4IzUcFRBOz4Ei++rbo80jQGzKVKJG99UDj9mKbz
 gfFFJnNPQi8PvLkX+AKc3y7kUJNB1e07FGqQbwVEIYv17/9H3SPsZ5uNfsSA7Oz3nxkdOVYqhfw
 JUSos8HYkl0qJg59C9jGf2aKaIAf+GkJ4qd/dQ=
X-Received: by 2002:a05:600c:6217:b0:480:1b65:b744 with SMTP id
 5b1f17b1804b1-483c9bc5bb6mr22063655e9.28.1772179292484; 
 Fri, 27 Feb 2026 00:01:32 -0800 (PST)
Received: from [127.0.1.1] (ppp-2-86-215-248.home.otenet.gr. [2.86.215.248])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bffc17dasm98554765e9.2.2026.02.27.00.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 00:01:32 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v4 0/2] arm/hvf: Add SME2 support
Date: Fri, 27 Feb 2026 10:01:26 +0200
Message-Id: <20260227-sme2-hvf-v4-0-3dae31a1876d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFZPoWkC/23OwQrCMAwG4FeRnq006dpunnwP8dBt2VbQVVopy
 ti72+3iRCGXP+T7ycQiBUeRHXcTC5RcdH7ModjvWDPYsSfu2pwZCtQCoODxRsiH1HEQymgDZaU
 QWD6/B+rcc606X3IeXHz48FqbEyzbPyUJuOANVarKo43Up6sbbfAHH3q2tCTcSrWRmCVSY4sS6
 tYQ/Uj5kYh6I2WWZPP3sq2ptvgl53l+A6a0auQVAQAA
X-Change-ID: 20260114-sme2-hvf-105767189521
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 =?utf-8?q?Phil_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=shINQ6zZriTJa/pf6qbVdCkK74s0wsY3bkHbu9mp97g=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQnBvVTlheHlWUWtDbEM5M25oemduZEFSMlBuTTdBCjdUT1VpZWlWalg4aGJ4dkI2
 Nm1KQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYWFGUFdnQUt
 DUkIzS2Nkd2YzNEowUGtKRUFDUUJFWDhFR3dsV0Fwek1abmlNVHFubnArN3gxTmdmcHBJczFOUQ
 pTZGNINnpwV2JKQkhpS0ZhMFlyNGJ2MUxQTitLZGwwZHQxTUxBbDgvckdjdGlFbWgwSWdpbVY0U
 VVBUExNa1hQCmVxV3NJWE1YVk1IZkVGdUlVRUtvazExSVcvVkhjQzZKK3dRaXI4RktKQURkTVR3
 bjFlTTRUb3BtWWtTVmVhNWsKRTdyV1BlcmdGU3JGY2RNQk5Ta3k5SVB1V2tWTGE3NmhRMGEwK3R
 oalNlWWNzUEV5ZkRIOFphanB1S0lid3ZMZAoyNEpibHBFcmpld25ZcmZnSkNudUw2SlFsR3FCMm
 5STXRyTStGQ1IvQTcycklkWVBSUnJ2T0cyVTFCcVZQSDlHCi8wb0Nsc1FubnJBZHp3SXdOR2Eza
 itYZGNpaVE4MHBORjljWGhCLy9UcUV3T3RVRDVnNVJtM2d1SUVrcUtLMTgKMCtRTDNIbjEvZE5s
 WXNzYkV3a0l3ZGlESmRzSVRmMmt1N0VUNU1IbFJ0ejBBMkN4cXFJRHFGWGprdFBYMmt1Ugo2YmI
 raC9YMTZqUmltWXh0a1BVL3dEa3F1bEs4dC9TRGtiajhaYVJ4RC9YMlBad3cyZ1VjUUNrN0twMX
 k3c3dLCi9hRXVMc0hEODBnc0FCZ2YwMzJXdnNQS2t4Zmt3VWFaSXdJZG5QaFE4bk1DZnB3aExaN
 2hacEYwV0U0czVKeGUKR0V2NFdFeDMxbHRqcnZOMXZrZkgzRXVNTWVXQlZpSmJibExmTjdBNzR2
 UFd2bFlNODRHRmdncHltWFZyT3k1UAozTGRNODBGWUVjM2hkWDQ4S1lKUmY3T0NOdCtQWFYzT3V
 aS1JPbVBPbTJ4SWlqQ3lZTXFrbEgvK3IxOEZrbmxpCmc5Y2xpUT09Cj1oYmZECi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_TRY_3LD=1.999 autolearn=no autolearn_force=no
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

M4/M5 Macs support SME2, and HVF exposes this functionality in its
public API.

Add support for it in QEMU.

This was tested by running an SME2 benchmark from Arm [0]. savevm and
loadvm during the benchmark's run were used to verify migration works.

[0]:
https://learn.arm.com/learning-paths/cross-platform/multiplying-matrices-with-sme2/1-get-started/

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
Changes in v4:
- Set cpu->sme_vq.supported in hvf_arm_set_cpu_features_from_host (thanks Richard)
- Removed two rogue lines that were smuggled in by git-rebase (thanks Mohamed)
- Link to v3: https://lore.kernel.org/qemu-devel/20260226-sme2-hvf-v3-0-ea5763dbeba2@linaro.org

Changes in v3:
- Rebased against master now that it supports SME-without-SVE setups for
  gdbstub
- Link to v2: https://lore.kernel.org/qemu-devel/20260115-sme2-hvf-v2-0-2eca481bd7ee@linaro.org

Changes in v2:
- Added stubs if hvf 15.2 headers are not available (suggested by agraf)
- Link to v1: https://lore.kernel.org/qemu-devel/20260114-sme2-hvf-v1-0-ce9599596736@linaro.org

---
Manos Pitsidianakis (2):
      hvf/arm: handle FEAT_SME2 migration
      hvf/arm: expose FEAT_SME2 to guest if available

 target/arm/hvf/hvf.c           | 319 +++++++++++++++++++++++++++++++++++++++--
 target/arm/hvf/hvf_sme_stubs.h | 158 ++++++++++++++++++++
 target/arm/hvf/sysreg.c.inc    |   8 ++
 target/arm/hvf_arm.h           |  41 ++++++
 target/arm/machine.c           |   2 +-
 5 files changed, 513 insertions(+), 15 deletions(-)
---
base-commit: d8a9d97317d03190b34498741f98f22e2a9afe3e
change-id: 20260114-sme2-hvf-105767189521

--
γαῖα πυρί μιχθήτω


