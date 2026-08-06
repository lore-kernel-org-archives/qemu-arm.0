Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B3BC56208
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 16:41:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws18E-0006kT-Os; Thu, 06 Aug 2026 12:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws18C-0006jd-QG
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 12:39:44 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws18A-0000HC-O0
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 12:39:44 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2d02b4c3601so28539225ad.3
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 09:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786034381; x=1786639181; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RP6TEj1SzUuvCX0BFE+H9j0Fl0KSHgDaUnXUDRz6XSY=;
 b=G1AT7y3DBYWysDrtb+W+4QvMZFjJsrD0cuVEt42HdGhjDS6TiztPgB66jVnolEDZAd
 Zkja2qM+k5UwgkR/WiEPHj4Zyyt9Ui6bewaMlL7ho4jxULRefBI4vT43wZvCMrg62Ynl
 Co/ofIPbtlABaJrIiuPIHuER3OolP8tdf9BtAXaIHugEVyB7RJs7DbYAONP8n2EIlqvO
 lRm9uZlQKxFDnN6wmIbMkeqdwWA7MO0dMQbRVPwJnHn8jWtacRWrxo4RlYYW/1pTrWbx
 876aAmKoJnaK1DYfz6afCK3ICX0qEKCt+8uVScnPbVS0XEmpiAYp6F5WgT7PUg5po1Fr
 0bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786034381; x=1786639181;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RP6TEj1SzUuvCX0BFE+H9j0Fl0KSHgDaUnXUDRz6XSY=;
 b=nkVwccQ9pwsn7K/4rz97IEbsBrQMklIUfidKvaql5UlsfXf86akvNiZPWkrKPAFxhh
 AblpqsUhCKUkNn2twUPkByJURfvKgPJOaufKPB1iO7+WM1oX+1sTXAfntW9pIqh3ViYr
 4bwpnjwEUmOei9bAVSFy2gtsD2UU1kHscTzELZMBCBnH5BSU5ryOXSW7gd4Xtb3wdTxY
 uvJWCw8AiqApXcMeNVeNCaVJk28/SzIezysUxNoHrRsbJa+kb+WY03M1XH16AsCh9yz2
 mfJ0On/UEHIz3cNgk1vSakgz2e1T0kOZebCVH+PZBKjhXbxaHFWI4rTSytvJuv2jt4/I
 5rYQ==
X-Gm-Message-State: AOJu0YxN03vq4QqFx7HO80M70gSwxtvkWeSy9l4eJwRBV4s9tF5zfcha
 oU0Y40yIffsHReIy7EO/Ue8B9519ikO5uHASaRgOgpQowDmtgZ9jmh1E+xcElqI1Ex9XALS0yfi
 8Q/nZ
X-Gm-Gg: AR+sD12tRA7/VCI/uCX3JHOfPeazUkN7mV0Z5XeO14EWsVTW9Ej2kCrBISuaQiUPD8Z
 jamLgrA8wzvjkTFfjBwRXtFtnHCgI3GjQ1ClhFouah7Qr82FBaInoLOSWZ10CchQ6ASsXq3zg9p
 sUs+5rCuWlkSJ5ldYQn43Fo3dt8+JCU2+jqJLe1idce1jcTzwj/utcQgVriWQvRvKzD4ZcoP0CA
 7fmy0Q531vjZf0kgQxoBbEz/UC9n9zQEwTVnDSI+6fHCZTnXbiP7WMMD+AL1zylikZqM3MU2NPq
 7QhNwUN+ngoOdEKgn0fC3VKEDmlF58JPFijSOjfVmkFOqp9dN/DwmHod6XziRqXPdOwvJzxjnol
 JU/NOtppD5Y2PbZStVAXHVXafD3ORRnP7/Ocj80D1+VbySlG66WVXVVCgaifDiITL2B0kkGdvNm
 AYBENkkl0CZOK1U4ySufNs20BooLcJ4wpa1Gcfn3N0qCNR6q6biATPgOyZtn6TedhVZ/k192noW
 LVOTWfFkgbu6FXK3HPpkw==
X-Received: by 2002:a17:902:ea01:b0:2ca:9d5a:8b6c with SMTP id
 d9443c01a7336-2d0ca712d79mr174851365ad.5.1786034380767; 
 Thu, 06 Aug 2026 09:39:40 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d0aa4ec8c7sm34280735ad.80.2026.08.06.09.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 09:39:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/7] target/arm: Introduce cpu types max-v8 and max-v9
Date: Thu,  6 Aug 2026 09:39:32 -0700
Message-ID: <20260806163939.328201-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

This is something that we've talked about for quite some time,
having separate "max" cpu types for Armv{8,9}, because Armv9
prohibits some deprecated Armv8 features.  Retaining all features
simultaneously has the potential to cause confusion.

r~

Richard Henderson (7):
  target/arm: Tidy cpu_max_initfn
  target/arm: Pass ARMCPU to aarch64_aa32_a57_init
  target/arm: Pass aarch64_enabled to aarch64_aa32_a57_init
  target/arm: Sink aarch64_aa32_a57_init into aarch64_max_tcg_initfn
  target/arm: Introduce cpu types max-v8 and max-v9
  target/arm: Use -cpu max-v8 with aarch64=off
  target/arm: Separate cpu types max-v8 and max-v9

 target/arm/internals.h                        |   4 +-
 hw/arm/sbsa-ref.c                             |   2 +
 hw/arm/virt.c                                 |   2 +
 target/arm/cpu-max.c                          |  14 +-
 target/arm/cpu64.c                            |   2 +-
 target/arm/tcg/cpu64.c                        | 408 +++++++++++-------
 target/arm/tcg/stubs32.c                      |   2 +-
 tests/qtest/arm-cpu-features.c                |   4 +-
 docs/system/arm/emulation.rst                 |  11 +-
 .../aarch64/test_virt_aarch64_off.py          |   4 +-
 10 files changed, 269 insertions(+), 184 deletions(-)

-- 
2.43.0


