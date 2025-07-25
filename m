Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB69C87FCF
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 20:26:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufOyo-000571-FL; Fri, 25 Jul 2025 16:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ufOsv-0006hk-MC
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 16:19:17 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ufOst-0000vc-2a
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 16:19:17 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-31c38e75dafso2086202a91.2
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 13:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753474753; x=1754079553; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ofwkNnvRpeUxFMMP1/NYCTaWcBPocFs20uPPW+a4FKw=;
 b=LYCCgIaG7IkDyAhbYQV4+wCwxn74aJZh2sLA2j5xZJs1IL0Pcm1hU+DtkA+Co0hImr
 GLKJViU8ivIKDcp7ZRiSnYiGfYX2Y0boSfSPmhUzC7EHfVRlRwFU4DTeZl6aJpd15qJp
 lZ7JKONj6bK1e3fVGdnbX8mGUiJAxnSoBhxZvDPcEbpF8D9qH9QFh8AaKHT41SZczCTd
 bHTRQYdPMPI8Gj2nhYPSf1lPzziEYrbNv+GDHQUtcVO6kBglgSZ0vUSoZV9bU3jaM+z1
 0jalX39Ci+/mfOWo3tBsWrkZzNb9sZRBVx1bX1IdA/X2ky8gFyzYgeRABzXym6D/g/jK
 iCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753474753; x=1754079553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ofwkNnvRpeUxFMMP1/NYCTaWcBPocFs20uPPW+a4FKw=;
 b=s8/D+nC0Puz84OBmXJDMambDjOe0YoMHcfCxwmx/hGu0FdVI7BzBPCIXryLdfP32rD
 4XA07yq6VACoYTv30+1i49Sr0m3hmEERpdmoq9YRoVCXp3sLalzhFAxhNaUlOzQH6dA2
 gxqp5dO3MYw/tDUGfGuQumnrYmaLzmgzecV12PWpSVgG2jkP3O/W+0WKdjqz7liphY/c
 /ixMVsifQwaUF1bxNarI1/YjPgwdYwCjFLqHXbEt3GECwRDbAxYW+Owo2Zt/QhWobysF
 TKxXm7Jij5MoVj971SjXtq980HqGtQ1E9csc7y5rk8+u8dLOcvmr/3t4I75UrqE7qKCJ
 PQ7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3TPusQ2Jab0k0CkBycqVjx5VfJOd1ulTagIkavHxJAgLhh23FX3Jic7otdRu0H+m0GeOnQLJhHQ==@nongnu.org
X-Gm-Message-State: AOJu0YxZTvYcXthHA6Qgt7pUcZE0PvBb+ljnR3kcGH+zAJ5agivqc6gO
 7QE8fzzWaUkJHt6vVBH+ClFZKWj10hQF37hPMp/PhJPe85RqfbsYk1gGrOnU0oyn2Ia1XkofzZn
 n0oxo
X-Gm-Gg: ASbGncvKL/vbzGbFKlxB6Yg9XhS8XeowBOGJNpTojjztewfYqs1XlGbXpPZHFa/9BSl
 ipWweBLDPuyOF+/gGSW3zs6zB+SoVE3vqDoCGnw1wpYngzIosdcoFnPJSYwzWiN5+6jwb34EvTz
 ueVra443Sn+cnrO45MshWwrWyjq+T1fALXTGnvsaYg+mwYfV2EgB22LObDRxgYGGPO878xOB+ar
 3JVWj613tCXJ51Npl5/qilCLJ9MhiZlnMMFTsIqc6YJ2bmByRk6EQ9Rnh2CaJsEjLvPp+1pALh/
 OBDVL+o4o/NpB2v6OKVeAB3Ekj9/XsDmoLjV6WgarDONacPFZoTFEy7AmjmYgUzuhnwY3D0pg/W
 R/nMT+kdlWiIYublw4OBw7w==
X-Google-Smtp-Source: AGHT+IHTXB0ys/xuQAFJVf4KiPKIa6ZzRQ2UfzgOsXLnLMZ0Fc6wz3VPehKgngaZqQpSOeQpH60pKA==
X-Received: by 2002:a17:90a:8c15:b0:313:33ca:3b8b with SMTP id
 98e67ed59e1d1-31e7785de0amr3698668a91.9.1753474753569; 
 Fri, 25 Jul 2025 13:19:13 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e6635f0a0sm4143309a91.24.2025.07.25.13.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 13:19:13 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 1/3] hw/arm/arm_gicv3_cpuif_common: move to hw/arm and compile
 only once
Date: Fri, 25 Jul 2025 13:19:04 -0700
Message-ID: <20250725201906.19533-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250725201906.19533-1-pierrick.bouvier@linaro.org>
References: <20250725201906.19533-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1029.google.com
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

This file needs definition of ARMCPU, and thus, belongs to hw/arm.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/{intc => arm}/arm_gicv3_cpuif_common.c | 2 +-
 hw/arm/meson.build                        | 1 +
 hw/intc/meson.build                       | 1 -
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename hw/{intc => arm}/arm_gicv3_cpuif_common.c (92%)

diff --git a/hw/intc/arm_gicv3_cpuif_common.c b/hw/arm/arm_gicv3_cpuif_common.c
similarity index 92%
rename from hw/intc/arm_gicv3_cpuif_common.c
rename to hw/arm/arm_gicv3_cpuif_common.c
index ff1239f65db..8435ef8cf0d 100644
--- a/hw/intc/arm_gicv3_cpuif_common.c
+++ b/hw/arm/arm_gicv3_cpuif_common.c
@@ -10,7 +10,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "gicv3_internal.h"
+#include "hw/intc/gicv3_internal.h"
 #include "cpu.h"
 
 void gicv3_set_gicv3state(CPUState *cpu, GICv3CPUState *s)
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index dc68391305f..9f2eea474b4 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -82,6 +82,7 @@ arm_common_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
 arm_common_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
 
 arm_common_ss.add(files('boot.c'))
+arm_common_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
 
 hw_arch += {'arm': arm_ss}
 hw_common_arch += {'arm': arm_common_ss}
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 3137521a4ad..4578c70dc45 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -38,7 +38,6 @@ if config_all_devices.has_key('CONFIG_APIC') or \
 endif
 
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
-specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GICV3', if_true: files('arm_gicv3_cpuif.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
-- 
2.47.2


