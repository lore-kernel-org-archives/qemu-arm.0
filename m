Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6AEC61DCB
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Aug 2026 22:27:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0526-0002il-D0; Fri, 28 Aug 2026 18:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x0524-0002iN-U5
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:44 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x0523-0002HO-Bs
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:44 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2cacb8416a1so13935995ad.1
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 15:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787956001; x=1788560801; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=0ufLUr+4cUEKYM/Z9xjrYtxWtD8GHEnQXDnj4Sgo7XY=;
 b=zteiRAcnbpKcciHftf23g/VZykyiwTh1j+mRZ09HqbIu63Jl6v2gbXgEFvLTW3d+JA
 fnMlSIB0CNw7tFAzJAbKj88sUmam6vJIsK5g9KJwPUsGlPREYJtBTnjQf26+5xzUUO5I
 zZevhnQ0eKZ7eNYHLv5q9HiF8qRQwM8GN4k5yeVoPB0iIQfiRjTVFg5o7yDazYm1UEIN
 VC7t7y6YvSEmHw6SVJ8QpikXrHaBAzbx/KuKQ2BMIAWS7txwsB6hOZcKhguls11QOZre
 wAI99egOUwa28UnmKquj9YCr2xGwK8q13ZjrTet+S8GRRI9I/TQIe7abWF59dQUstMZS
 xALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787956001; x=1788560801;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0ufLUr+4cUEKYM/Z9xjrYtxWtD8GHEnQXDnj4Sgo7XY=;
 b=rASMJ4l6G0XmJb4d1+3PiwYRtfGFQuvoUIRYZUurOkD4fnR+dLBFyz2ZXKRtwgRkVI
 27/yWiUBmr9XaYPR3YfDS93hrJIseXr8JcOVL/KKx6rhlJGZ61WZ354yaj8qDc2BTCGy
 aU15hcPyOqxyn/GkPOyYS14hFfv76gwrZwsy4yLItH8GVHfVj6yv5yQPUivJBK3/BhS1
 JCkI29zLa5e9QKmnrZiCUIjxaAzRD0g8UJEodKS+10FsK/QLSDwhKXtWTHKvkeOe+dYw
 o5UYSxeSYybIsz6kpNHlRv2E0ovSua/1OzaA6bqL9lafzIy3Sps/i2kTGmjwCdXefhM1
 U4Gw==
X-Gm-Message-State: AFuF++nteoQ+EvqtiSc8/PvWwuXqKA4V6LWymbSgq0dYLuYNOMlthzLV
 qcJp717GdnqnuJEK2qBo3u6p+xujbNg9eq2LVkdgZsRcSAJFKFzTlN3RHEeWVCy9Zo512YpmPlt
 R4bfBZz0=
X-Gm-Gg: AYBFou0JHIlO/pD8i++R55MPyWbVaQL2bzKG3cqxGDM2nMC2D4Pw5Iid3/DChc9Z9C0
 ajpzQn5RqUeM676zb1BL2F6P5VGPexHH8hwLQhJ113/GwYD7HHLfcrPuDisifLonUbuExuSPm3H
 GYFcXQiyQFX4shTczsC6Zj/LYJhu7UDYeW3t5L+l7YOPit8uZM0+VhpLAhUvE0e8dVON/LDIfiL
 3ki/M+01VwxC8OYNB2xxAI00meRdnBRYhhdX1lnGFP1sD9l0e2ZaJItcv8qeBH3Xb9xep4O16lV
 16pGnfkEgOodGOvtUNOffWrJ7PrgUJSHn/b1msXHQ74WvRlP8sxEaD6N6+rgcrrK/oOmG281T0U
 ortsnXccrbeBEvaxIHgG6+bzfMFfkgcQoaMryEaCJSQrCL8T+3btG8TrOElnnekQ2cGaPbMmHZN
 ztaFy4/Mrp9Q137urpqWx++pbgVLQcGbf7ho7ZZrajFxxzmj14BEPiLWV260+uU1KNoqhay1OAW
 DchVh71vkAtLEiPk8rq
X-Received: by 2002:a17:903:32c4:b0:2ca:2079:91cc with SMTP id
 d9443c01a7336-2d74ddd6755mr135091615ad.5.1787956001383; 
 Fri, 28 Aug 2026 15:26:41 -0700 (PDT)
Received: from stoup (71-212-39-143.tukw.qwest.net. [71.212.39.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d759640270sm9178355ad.34.2026.08.28.15.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 15:26:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/13] target/arm: Implement FEAT_UINJ
Date: Fri, 28 Aug 2026 15:26:26 -0700
Message-ID: <20260828222639.1432046-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Based-on: 20260827041557.775080-1-richard.henderson@linaro.org
("[PATCH v4 0/6] target/arm: Introduce cpu types max-v8 and max-v9")

Another trivial little extension.

Like PSTATE.IL, the priority of the exception raised by PSTATE.UINJ 
is below translation and below single-step.  Thus we must defer to
translation, after such things have been recognized.


r~


Richard Henderson (13):
  target/arm: Rename and adjust aarch32_max_v8_tcg_initfn
  target/arm: Introduce cpu types max-v8 and max-v9
  target/arm: Use -cpu max-v8 with aarch64=off
  target/arm: Separate cpu types max-v8 and max-v9
  target/arm: Move ID_AA64PFR2 feature tests together
  target/arm: Add isar_feature_aa64_uinj
  target/arm: Drop U from most PSTATE bits
  target/arm: Clear PSTATE.UINJ when taking exceptions
  target/arm: Widen cpsr_{read,write}_for_spsr_elx to uint64_t
  target/arm: Read and write PSTATE.UINJ
  target/arm: Add PSTATE.UINJ to tbflags
  target/arm: Honor PSTATE.UINJ during translation
  target/arm: Enable FEAT_UINJ for -cpu max-v9

 target/arm/cpu-features.h                     |  26 +--
 target/arm/cpu.h                              |  42 ++---
 target/arm/internals.h                        |  11 +-
 target/arm/tcg/translate.h                    |   2 +
 hw/arm/sbsa-ref.c                             |   2 +
 hw/arm/virt.c                                 |   2 +
 target/arm/cpu-max.c                          |   4 +-
 target/arm/helper.c                           |  28 ++-
 target/arm/tcg/cpu32.c                        |   8 +-
 target/arm/tcg/cpu64.c                        | 161 ++++++++++++------
 target/arm/tcg/helper-a64.c                   |   2 +
 target/arm/tcg/hflags.c                       |   6 +
 target/arm/tcg/stubs32.c                      |   2 +-
 target/arm/tcg/translate-a64.c                |   9 +
 target/arm/tcg/translate.c                    |  17 ++
 tests/qtest/arm-cpu-features.c                |   4 +-
 docs/system/arm/emulation.rst                 |  14 +-
 .../aarch64/test_virt_aarch64_off.py          |   4 +-
 18 files changed, 243 insertions(+), 101 deletions(-)

-- 
2.53.0


