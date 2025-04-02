Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3752049njd;
        Wed, 2 Apr 2025 15:24:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHpZrfvosYcLDTz3fbi7QJAd/WyozKffa3EAkx5CWg7nIzS2DRQC6bPwl17U5OWWbk2GN6UcfSH9G8Lw==@linaro.org
X-Google-Smtp-Source: AGHT+IG/+byEMEG8B2Q4czq43yXG0/eFEU16/koayUTByFsuiaWhrB/mWabMmGgmUpZr0eZTccbm
X-Received: by 2002:a05:620a:1792:b0:7c5:afc9:5144 with SMTP id af79cd13be357-7c76c9a11d5mr159995885a.23.1743632689810;
        Wed, 02 Apr 2025 15:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743632689; cv=none;
        d=google.com; s=arc-20240605;
        b=Ty1U3dBMKvMSysbmwvN2yr6/Ab3CvkpheTy7wqs6sYY1G6SlTMovmbLFk2CCbn89fD
         EpL78wMPXZsApqDb7LFLB8GLFEKuDbgP/4TQI0m22dIpCp0rLYHYvm/W60Z6u++O7fCo
         jkk6fKRgyPvbmYXV9qtZvumzvpyvojfqNntGuX0jpfFDJSbzHVpCRKbFdQbU4PgmJW9K
         8ijIJK26joSLYPHdmSfOT8UB1z5uB0ftItFr0747exJiB50CIhzoqiYkUiOcD5LADlbf
         uPlbqB6D/UM04YuO3Ofq3rOkpz00CJ8kzxNd1DS+3m7R8tJFrqRgFz4uYxt/C9pSf02j
         UGuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gVdlHjO6zMdyeJFXmWmW2B+qZ532MIXjoEVZuCPnDX0=;
        fh=ILu9n9UJYyGKJ+F9rVBU1LrxK5aJ3ihMVgUEh7OR7WA=;
        b=EerCexK7D/t5kVfM+eNI5h51PV97jJ3STXx9YWJnBmERhJyxzqsx18PaYrktZPP0if
         YOhBu1PuB+xzZbidzawtxVnacCBJSpa0ZOVHPw/P70rXE5ZgR6GY5530y7Fkm9sh3ixB
         hhInl3uqpKv5zZvZhP+bx1FKitJVzaiavyjNzNCJihU0T4/G2ADoMwSqyZnPQ2t1dxbC
         v2rW2iyPnIelBVVD1VoPRJ8xhvXNsd6LLD6RUnT0qmmL28j2rl/xnepF3/4GsxRp8Epy
         Svrp+bvqlu6s0Bvj0axA1CjX8kdyeQqZNFm1v6mxmUdFU6o4MRhmQRp/Eu6d6g4ylgsK
         ng8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IOV3ssRD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c76eabade9si3189285a.472.2025.04.02.15.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 15:24:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IOV3ssRD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u06VP-0004jD-NW; Wed, 02 Apr 2025 18:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06VJ-0004hh-Le
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 18:24:14 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06VH-0002Sd-Lw
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 18:24:13 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso1455945e9.2
 for <qemu-arm@nongnu.org>; Wed, 02 Apr 2025 15:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743632649; x=1744237449; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gVdlHjO6zMdyeJFXmWmW2B+qZ532MIXjoEVZuCPnDX0=;
 b=IOV3ssRDBzDi8oogoKB+U90wD8HknnicOv5QK7wxoGP0swdR0fzV59wzuqxdQFbVm5
 358NbXWZ9SvG7EnHvGlldCMwpWKTPg/zcs9hQVz/8BehVebdFjVEUYAcvnEKhq0CxiuP
 lmhhCC/OlyPzCUE3yzYLNocwYTPlWpvu/HmErxl/8zpNRlIx5ZM3lGLtMCLiz5iPx5aq
 QfBFAC/huLVl+BO0zh7j6WZHoFODR4EDAYRvttJM6BAHhVppoHbNTL9kRw2PgZzhk/Mp
 7nFDTY4FicaDu9nlL7PED1jjNnG/LI8TMvx9hi1q89rg7Q9BjwCMT9ng+Y5iTYGZ74Go
 sZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743632649; x=1744237449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gVdlHjO6zMdyeJFXmWmW2B+qZ532MIXjoEVZuCPnDX0=;
 b=f6FX+kH0eFj6sIgOFov+8lte5sZsNYPPbIh4P+kFJIAsnoIB4pAvS0GaRMJ3bLfcPK
 ohIyCfodg9k0QHgcw+h4M0FtmbFvLEodZEBtem8EapO4IkBq2RICUD1+tnjAqknuNEGN
 tPbl8yYAG8kJ3GiJMMMFPE/o+dAEAKLUOSxelRqy41ki7DRsfF5WFSWAv7hpAMmcUXsV
 l5E5W/GXshWYgNGu3FgsSediRN8cHaF1HRbCIyePAMiKUMbU+ufXNXEtVPWCX9NI1g7e
 WB2s9xzPJ6GUWivNBdHTrrVrqv6TtqV7rrC/xnjTbYnA647TDzL/s/7rS2LfqoJQ5xWA
 T7Tg==
X-Gm-Message-State: AOJu0YwVF6mAS2zxZ1gs3jihJfacXvH0yFrp/PeaRrlwspMweFUHcY9n
 tJagdDtDhOAiTtZ3jZ8rL6CQ9AWCdMxMlNNauTKPZ7u3ZofWC8r2LcWQDPnu3po=
X-Gm-Gg: ASbGncsx2Q4O4uzbqv/t1jOwY882KUvl+IgyIVT0KOqqcsRD2uA2bKpZMtoz4LZUgJi
 O+j2S0YstTv/eCuPd+idH+M6P3AgrvAw5xEmy2td8ehqU6+/dF7O+xsx7F+C3LlwgJm/wH15mNI
 RWnEqjFYoN0YkS2gUriG1EONA/xldDHaWgFnB4BcVmE+O6fkY37c1H4RlEC6K/SCQECA3xZYhpi
 RaY+jfIthCsy+R6WJ0wedPzzATzi/4ZRgSqIFgJlVXz/5WzHikSDbki05gMFxrTXjctx3u4UJU/
 RpaAQiy9wlJvSyLSHRCh6UVVzY65QbbqFy3oy5RO/CKJeeb+qhY77LyG7lCTRzb4mSglSoCSd55
 L822v49FZLfp1V2fPMyX2Ex4CYgNqJA==
X-Received: by 2002:a05:600c:4e12:b0:43d:db5:7af8 with SMTP id
 5b1f17b1804b1-43db628c48bmr151616165e9.21.1743632649540; 
 Wed, 02 Apr 2025 15:24:09 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c300968cfsm64135f8f.16.2025.04.02.15.24.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Apr 2025 15:24:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 07/13] target/arm: Move some definitions from 'cpu.h'
 to 'multiprocessing.h'
Date: Thu,  3 Apr 2025 00:23:27 +0200
Message-ID: <20250402222334.66511-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250402222334.66511-1-philmd@linaro.org>
References: <20250402222334.66511-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: xUakBdjAEEyT

arm_build_mp_affinity() and affinity mask definitionss are
related to multiprocessing. Move them to "multiprocessing.h",
including this header when necessary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h             | 17 -----------------
 target/arm/multiprocessing.h | 18 ++++++++++++++++++
 hw/arm/aspeed_ast2600.c      |  1 +
 hw/arm/aspeed_ast27x0.c      |  1 +
 hw/arm/exynos4210.c          |  1 +
 hw/arm/npcm8xx.c             |  1 +
 hw/arm/sbsa-ref.c            |  1 +
 hw/vmapple/vmapple.c         |  1 +
 target/arm/kvm.c             |  1 +
 9 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 768e784c3e9..45a9551535e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1158,23 +1158,6 @@ void gt_rme_post_el_change(ARMCPU *cpu, void *opaque);
 
 void arm_cpu_post_init(Object *obj);
 
-#define ARM_AFF0_SHIFT 0
-#define ARM_AFF0_MASK  (0xFFULL << ARM_AFF0_SHIFT)
-#define ARM_AFF1_SHIFT 8
-#define ARM_AFF1_MASK  (0xFFULL << ARM_AFF1_SHIFT)
-#define ARM_AFF2_SHIFT 16
-#define ARM_AFF2_MASK  (0xFFULL << ARM_AFF2_SHIFT)
-#define ARM_AFF3_SHIFT 32
-#define ARM_AFF3_MASK  (0xFFULL << ARM_AFF3_SHIFT)
-#define ARM_DEFAULT_CPUS_PER_CLUSTER 8
-
-#define ARM32_AFFINITY_MASK (ARM_AFF0_MASK | ARM_AFF1_MASK | ARM_AFF2_MASK)
-#define ARM64_AFFINITY_MASK \
-    (ARM_AFF0_MASK | ARM_AFF1_MASK | ARM_AFF2_MASK | ARM_AFF3_MASK)
-#define ARM64_AFFINITY_INVALID (~ARM64_AFFINITY_MASK)
-
-uint64_t arm_build_mp_affinity(int idx, uint8_t clustersz);
-
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_arm_cpu;
 
diff --git a/target/arm/multiprocessing.h b/target/arm/multiprocessing.h
index 81715d345c2..8eec79b11d8 100644
--- a/target/arm/multiprocessing.h
+++ b/target/arm/multiprocessing.h
@@ -11,6 +11,24 @@
 
 #include "target/arm/cpu-qom.h"
 
+#define ARM_AFF0_SHIFT 0
+#define ARM_AFF0_MASK  (0xFFULL << ARM_AFF0_SHIFT)
+#define ARM_AFF1_SHIFT 8
+#define ARM_AFF1_MASK  (0xFFULL << ARM_AFF1_SHIFT)
+#define ARM_AFF2_SHIFT 16
+#define ARM_AFF2_MASK  (0xFFULL << ARM_AFF2_SHIFT)
+#define ARM_AFF3_SHIFT 32
+#define ARM_AFF3_MASK  (0xFFULL << ARM_AFF3_SHIFT)
+#define ARM_DEFAULT_CPUS_PER_CLUSTER 8
+
+#define ARM32_AFFINITY_MASK \
+            (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK)
+#define ARM64_AFFINITY_MASK \
+            (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK|ARM_AFF3_MASK)
+#define ARM64_AFFINITY_INVALID (~ARM64_AFFINITY_MASK)
+
+uint64_t arm_build_mp_affinity(int idx, uint8_t clustersz);
+
 uint64_t arm_cpu_mp_affinity(ARMCPU *cpu);
 
 #endif
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 1f994ba26c6..4438402340b 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -17,6 +17,7 @@
 #include "net/net.h"
 #include "system/system.h"
 #include "target/arm/cpu-qom.h"
+#include "target/arm/multiprocessing.h"
 
 #define ASPEED_SOC_IOMEM_SIZE       0x00200000
 #define ASPEED_SOC_DPMCU_SIZE       0x00040000
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index dce7255a2c0..37bfeef304d 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -22,6 +22,7 @@
 #include "hw/intc/arm_gicv3.h"
 #include "qobject/qlist.h"
 #include "qemu/log.h"
+#include "target/arm/multiprocessing.h"
 
 static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_SRAM]      =  0x10000000,
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 04439364370..01e6e2fb052 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -36,6 +36,7 @@
 #include "hw/sd/sdhci.h"
 #include "hw/usb/hcd-ehci.h"
 #include "target/arm/cpu-qom.h"
+#include "target/arm/multiprocessing.h"
 
 #define EXYNOS4210_CHIPID_ADDR         0x10000000
 
diff --git a/hw/arm/npcm8xx.c b/hw/arm/npcm8xx.c
index f182accc47c..3987e55355b 100644
--- a/hw/arm/npcm8xx.c
+++ b/hw/arm/npcm8xx.c
@@ -29,6 +29,7 @@
 #include "qapi/error.h"
 #include "qemu/units.h"
 #include "system/system.h"
+#include "target/arm/multiprocessing.h"
 
 /*
  * This covers the whole MMIO space. We'll use this to catch any MMIO accesses
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 112cbbf29e6..90fbb56ba7a 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -52,6 +52,7 @@
 #include "qom/object.h"
 #include "target/arm/cpu-qom.h"
 #include "target/arm/gtimer.h"
+#include "target/arm/multiprocessing.h"
 
 #define RAMLIMIT_GB 8192
 #define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
diff --git a/hw/vmapple/vmapple.c b/hw/vmapple/vmapple.c
index fa117bf1511..9bb5b0553a2 100644
--- a/hw/vmapple/vmapple.c
+++ b/hw/vmapple/vmapple.c
@@ -51,6 +51,7 @@
 #include "system/reset.h"
 #include "system/runstate.h"
 #include "system/system.h"
+#include "target/arm/multiprocessing.h"
 
 struct VMAppleMachineState {
     MachineState parent;
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 97de8c7e939..a28acdecf3e 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -39,6 +39,7 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ghes.h"
 #include "target/arm/gtimer.h"
+#include "target/arm/multiprocessing.h"
 #include "migration/blocker.h"
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
-- 
2.47.1

