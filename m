Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp688673njb;
        Tue, 13 May 2025 10:48:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/1VWybSYJiZ3iJAeNJKhW9pOnuyrOcJaqYaiOHTJ9zVFLM+oGQ56FT58ya92Po9t/fr6kJZgjov68vw==@linaro.org
X-Google-Smtp-Source: AGHT+IEgNhwmsR5WgccnKo2jz5pWt92lPTyVopYqxmD6XXkj+D/CbDzH21AJQN/UzgzoDrY4po13
X-Received: by 2002:a05:6214:d0c:b0:6f8:8df1:63e with SMTP id 6a1803df08f44-6f896dfb2d2mr5275036d6.3.1747158534584;
        Tue, 13 May 2025 10:48:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747158534; cv=none;
        d=google.com; s=arc-20240605;
        b=XEoiHxQfQYpnUcSkUF09an3ApShmbgc3dYC93Va+DZcDyH/4oNpxW4OrDR9Wy7mnRQ
         lhPeX6us+lmCio/84EpozkS3I1a01+xiNzTuximZ5STczeubm4xqDj2FI78c2EsTs7jW
         hJcjwvbnOuUUlp8NNLJ2el5mY/dQ/2oNEW0L3I1xLAmk3Uos1zJPgHaYTqxliO/LX9CK
         cBZiRsLYCVruqDEl3zIf5W+MUxFUGst8RWccJ8EtN73VswZNqT5T+UVC+vQq+UsLQ0d2
         zrcU/En/LskbAI4/ZtTethI3nx66WrgwIprNiGdI6BWDxvgqnVILW6fJ/7ubAYL7NZCF
         4BNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mOQr33THEcq0t4i2qfK/BB9LCYbfrT4uaAwTHlVrFMs=;
        fh=VUYQg3svJ9KX0xG6/C6v89YvNOXOBeD5Rc2guppdDLs=;
        b=Rqq8eG0eBbrD3Tvf6XqJZQvYZ2holDffYIFlfAFAYkJcII1P1sgfZyH6IWf4jy87Il
         1/c0KGoov+ohp8YSnr935dTLxWnP/wRUDoHEFT38++QsVzjQTgimFJjw1ghh5ZUnDZ6p
         xasgLoZjWoQZ3iOiuH0YB6k/A/tMUqVhAGZfEQQiiwHIbXhVToJVOAdTMRteKyA/VUmm
         X3VAn6Kefnk5hnP6j2K+uqsGdcHlpC+Uw2wPQT+gHnfLaC2QvlaA/K6H0lo9wcWHlRAX
         oyrOxXkRrt8tD4IMfTk0SGks0JKUhDhDGAlkakn1Ytd0V8cD7cuF95GEr1XVNMQGyDY3
         snnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=phrswJal;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39f7796si117667136d6.152.2025.05.13.10.48.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:48:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=phrswJal;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEtk3-0000i0-0g; Tue, 13 May 2025 13:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtcI-0000PE-CS
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:40:36 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtcG-0003PW-93
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:40:33 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a1f9791a4dso2577160f8f.0
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 10:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747158030; x=1747762830; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mOQr33THEcq0t4i2qfK/BB9LCYbfrT4uaAwTHlVrFMs=;
 b=phrswJalDLMHHbOAWS9yMlaQnLeJj40ph9Rhac7dD0ylVM1LF2VnkFS0ljMo+lhxfI
 JfgpmN0xLteCgpDNw6iWChINhQ2MCn/QHDzABJakbOCcYE2uPongkdwNHsPsbnyRUvRy
 yB0sf/NF7Okj9z4xNirWVLtU6awRqKpIqzGInBWiSXJLSpXGPf2NhjrUVDPIJDEJjipU
 PCVAMmUyE27ORMpm5mq2PU8TdB8HNO+gjV4ezLSKseVyOF5sNCmBWNgdUVk1dtGuxrKH
 w/2sHHHMUyzJko7hoVJNahvUbO+vPmcnuV4PmIh9an1ePdnjz3ocFj8oWOmuHRhQheFr
 qGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747158030; x=1747762830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mOQr33THEcq0t4i2qfK/BB9LCYbfrT4uaAwTHlVrFMs=;
 b=a1bQVX/y7INuTqu8mcyGW7VAArGJsbJTJ25WDZin0QZwTY+CDdjh8iqJ7jBauBV8EL
 vZ/wO3XpYpFd7VfijWtlhJOXb56nMLFAJSLSRL3yFPEPSNjy9MNgmFxgdVQAP3mpil1t
 hEtAx0M/9XxT0seu/UiSSDyezNIXBHOnkV5aqYmVp7Vgpu8V5Q6TGbyJZM3bvK29cSFc
 YYvAkziST0CrDZhgmijWJdmbc/NvaL0eZKlne9PQO5gVFcYUrGlZTlJly7+chCx7e6oy
 K0src4YIqmvfS8YhJ7RsJNkRYo0tya7gKMjKxTISa686YOor6M2e3eO79uCP0sM9ZkS7
 SXdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoSto+/sX9mzr29uKXCteoFvZojx5a6bweMuvNSGDc91+mcq561XvfbOpiUaP7cLO8rmLRYUoYdA==@nongnu.org
X-Gm-Message-State: AOJu0Yw8CH9+M2knFQgqJ0ua1L6+pe98Bpa6RdWDe5Whl/D/EzDtio7W
 7c9U2qM5+lfyIwEwTWEhpNgRewSGWxRqZmLlqNaU7K70LFgLXlpA/F3zXs7Djws=
X-Gm-Gg: ASbGncvOEzVnoa5HQz15aoJUwkh3K/IPYJUeuzf7QlYNixyA1PiCoWVlQmT6XsjMGca
 fah4guY2fPsrVYcBbWRjglsNLbvWLLk+YBZc0ceMH/FmCJZdQlr2v7yI2qRIbVCKqcADjgPWwgi
 9GgRlid8oYGdEnJRmauS6i3JmPDmDgwtYmKOYtO/kgxYJ7iiApPZityWS67fjZ/8YDMe3/8mh+a
 2Q4mLFK8xBF6lVwd8QBNIEfVEqWQ2oqGVV5FzhqzATbxQ79aTVSsLCHF+Ltu2HkFTyEnlHCb3eG
 lkASidy6Q6AQvdzgtwps7KYRgKceIWkS3V0fn4d11zTN5vrUfVw0X6Fx7w3HkkMOreC+S75rBzZ
 T/YOR0Sk+wEL+XRL5bJks6cBH2X23
X-Received: by 2002:a5d:68d2:0:b0:3a0:9705:eb13 with SMTP id
 ffacd0b85a97d-3a34991e9a6mr113074f8f.43.1747158030224; 
 Tue, 13 May 2025 10:40:30 -0700 (PDT)
Received: from localhost.localdomain (110.8.30.213.rev.vodafone.pt.
 [213.30.8.110]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f2a1dsm16527595f8f.43.2025.05.13.10.40.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 May 2025 10:40:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 12/19] target/arm: Move some definitions from 'cpu.h' to
 'multiprocessing.h'
Date: Tue, 13 May 2025 18:39:21 +0100
Message-ID: <20250513173928.77376-13-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: sZY3LSSXegUA

arm_build_mp_affinity() and affinity mask definitionss are
related to multiprocessing. Move them to "multiprocessing.h",
including this header when necessary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
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
index 33ac0c9f818..b70c7a3ecd2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1155,23 +1155,6 @@ void gt_rme_post_el_change(ARMCPU *cpu, void *opaque);
 
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
index d12707f0abe..62a9200dac6 100644
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
index 1974a257660..a38c2a19751 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -22,6 +22,7 @@
 #include "hw/intc/arm_gicv3.h"
 #include "qobject/qlist.h"
 #include "qemu/log.h"
+#include "target/arm/multiprocessing.h"
 
 #define AST2700_SOC_IO_SIZE          0x01000000
 #define AST2700_SOC_IOMEM_SIZE       0x01000000
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 56267ec2bd2..e83a88d3369 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -36,6 +36,7 @@
 #include "hw/sd/sdhci.h"
 #include "hw/usb/hcd-ehci.h"
 #include "target/arm/cpu-qom.h"
+#include "target/arm/multiprocessing.h"
 
 #define EXYNOS4210_CHIPID_ADDR         0x10000000
 
diff --git a/hw/arm/npcm8xx.c b/hw/arm/npcm8xx.c
index d7ee306de7a..e6c16537eef 100644
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
index deae5cf9861..25ffb029ff4 100644
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
index 16e6110b68f..47f23b6e2c0 100644
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
index a08a269ad61..5969249b579 100644
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

