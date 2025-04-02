Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3753079njd;
        Wed, 2 Apr 2025 15:27:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDyxAHIROz8hmk3NbSklPkgBrM3TiGqidqzGHDxDeGYNA86njoJSY669y0VEP31jHbOUQj10H4fSAWLw==@linaro.org
X-Google-Smtp-Source: AGHT+IFYhKtrhzEuBPhFsYi8v1cLFcreCEt6gQwcwUhtOxO5007OFjvfAo2G7m91fPTn0RCyQpCp
X-Received: by 2002:a05:6000:186e:b0:39c:1404:3748 with SMTP id ffacd0b85a97d-39c29752ddcmr3967774f8f.16.1743632858182;
        Wed, 02 Apr 2025 15:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743632858; cv=none;
        d=google.com; s=arc-20240605;
        b=QYcwOG5xw3idAx1RKrkcsJbThREFYYwa5Z/v4OH1H0tOOEumrxRvPQ76v8nDevH1Iv
         RbktZ7j8aT9GX8T5NMNq2MPhsGVIgHOQqS16c8RVol2SD2oQm4n/vKJJrYWM45I1SL4U
         6zAi9GVLfE2zL+xmdhufTiz16oZ67ftn8MheuagoN5FySsUGQ+z+GinjdHdGSZaJs439
         uqPdcaOP1Qlv03t9lAFc9DWGqF2O20mnSibhaFfg/awr//j+FgWjkpsDgYBuprZ8vv3R
         ztTA8RAVfKtAiuOtauZh0Yfr/HwWmYl+Q+yRZHch40fWD8Z6TvjOzI9iFWqI+j1/cv2m
         0CQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Bvg0sskfp1zs/zAw+tx6oTWh/pDWcI3/X7VI/A1vFkg=;
        fh=ILu9n9UJYyGKJ+F9rVBU1LrxK5aJ3ihMVgUEh7OR7WA=;
        b=XjBHPcxJLBjw4xhb1kdPG54N/FmUHgdW3GN3CKw+ipid4OwtwrO9vKw6BkFxF7H/M0
         B0vxEANFXfgJ3Q+RMFHWlX03RJTjeZ1QfVEOIL5qgGzV2/j3oUsWp0s2iwfgIezHRv3B
         almKHUgp0uHLyw8F4i4pKK+WGReRGybgHgRThKx0gYZ8IUkPRhjhYw7Mz+BCSJIrvFNw
         AKifqAKum/G2yAV/eLfB5jdza1fHdsqA8UeiF9Jh4ZMwsqXk+aC6tF5I1yxBtmm9zkjB
         ujIOHhvYUpImADuaRVIOXIumDPMFl5Yl9hhN2J/LTdRbdUwQQBr+AhdMD2qGRBOLoqSu
         DMkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AfD3Ebn1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-39c3023bb35si22253f8f.444.2025.04.02.15.27.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 15:27:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AfD3Ebn1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u06W6-0005HG-S7; Wed, 02 Apr 2025 18:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06Vk-0004wM-Qj
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 18:24:43 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06Vj-0002a4-3X
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 18:24:40 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so1943775e9.1
 for <qemu-arm@nongnu.org>; Wed, 02 Apr 2025 15:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743632677; x=1744237477; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bvg0sskfp1zs/zAw+tx6oTWh/pDWcI3/X7VI/A1vFkg=;
 b=AfD3Ebn1nx6JzteM0/cuPaMYJJUdKUbNsG5BR4EuDyR91TNSuto2/AU4eOVuonb+j1
 TkMDGEsfKV7IKCtymzgN9mqMiqBu2IkqzgVDRsr7dc6q+f1/UlsGRYpvucbH/MUwsP4Y
 gcUWB3eDSONKgraXGxE/ZYuAzSJP4YslWDIo1lTP3qtmaBRDJRCFY7ZrxbkESyOUmGvj
 zoWleV0Wg8MgQVUYJRtkP6dY7Od5sw3in2siQC8HVb7kVel1fwHSFhUW0RstYp7C0wNg
 e+iJAIt1WrZe1CYOa0c0eqJbYX28Z8RI9gCepfvichWCBrs0uMM2Ky2JX/SkpbM39l8M
 +z5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743632677; x=1744237477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bvg0sskfp1zs/zAw+tx6oTWh/pDWcI3/X7VI/A1vFkg=;
 b=M+kFUVLQGeCb07f3TuHdGp90wh71RYDGVPRm895iZ0PkJbpoTwirRuHaVG7x4+SlMh
 G8QucbBqplG6tlHWUc8DoJuzEyEdwLPF6PllPVmpZY+Zc/uURCAFHgoUADteMPL+kXFM
 bXEcZRwvkURa/3IijHcA6RUv2lPb3eG8DtL+r3C4i+G69z6BcHGYB2x0IR+2AvcjVE29
 mp1kmMdN9RmvrWpZtSwf1bDN9vuKVb+JwaIIenVkDxyHIE2QCKtsuXO8T1Kv+xtMgmqR
 2ceirUmhtJEX/Vrpa/oshY5lbkuqsMl0iy+mxw6jYBG9y0iE2rWIa6ikEov+IgPS6dAX
 DK0Q==
X-Gm-Message-State: AOJu0Yy0G7YL1ijL00eQiC0httY4B1ZlNPG4FiR+NEp1txBNJG0nqmdB
 2J6kqSsWDpxIuGSlwLe1fJDjIBMhluDJ01G1i+y5kGiD6FZQRs9U3ccBRk0iSUI=
X-Gm-Gg: ASbGncuJpLIwMaQe+UNzVsiP1GYgEDSaS1C9waVbAyfQxQzf0DteduewwUGn94cKflS
 K9UzsoqwWqhL/VsELjlyXZi9mARvkyIr8jErPzxXhwYfxcINObEqih+hutTwFDJDmIkYnk9IERK
 okoBj38TtAn+w/xhfZhOPvrteirkryldu5+x02bjc7WTo5rrR5w4b3wA2qgUwV1xdDqA8sn/HqV
 ZCofNQT/Yt2V28g3fpqHnbravJRkurZhkmC3cAigRp1S1uy161a9G/wa8rSljZ7Z0hJKkf7Nowe
 GgGzlla90/nGCq7jSsaQePRe2ZqIUq7XRklJgZnpc+KBc2ZtokQv9qNudktlUphBb52CU67uCg4
 TmYdqZFEODtng0zno60g=
X-Received: by 2002:a05:6000:220f:b0:391:1388:64b7 with SMTP id
 ffacd0b85a97d-39c297e4637mr3850193f8f.46.1743632677629; 
 Wed, 02 Apr 2025 15:24:37 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020da22sm43807f8f.68.2025.04.02.15.24.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Apr 2025 15:24:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 13/13] hw/arm/virt-acpi: Replace arm_feature() ->
 arm_cpu_has_feature()
Date: Thu,  3 Apr 2025 00:23:33 +0200
Message-ID: <20250402222334.66511-14-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250402222334.66511-1-philmd@linaro.org>
References: <20250402222334.66511-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: COOl6bipTFEX

Using arm_cpu_has_feature() instead of arm_feature() remove
a dependency on (the indirectly included) "cpu.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt-acpi-build.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index da61af1d359..ae28d958895 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -58,6 +58,7 @@
 #include "hw/acpi/ghes.h"
 #include "hw/acpi/viot.h"
 #include "hw/virtio/virtio-acpi.h"
+#include "target/arm/cpu_has_feature.h"
 #include "target/arm/multiprocessing.h"
 #include "target/arm/psci.h"
 
@@ -697,7 +698,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
         uint64_t physical_base_address = 0, gich = 0, gicv = 0;
         uint32_t vgic_interrupt = vms->virt ? ARCH_GIC_MAINT_IRQ : 0;
-        uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
+        uint32_t pmu_interrupt = arm_cpu_has_feature(armcpu, ARM_FEATURE_PMU) ?
                                              VIRTUAL_PMU_IRQ : 0;
 
         if (vms->gic_version == VIRT_GIC_VERSION_2) {
-- 
2.47.1

