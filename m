Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB94C61DB9
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 04:17:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzRXM-0007Aa-Gg; Thu, 27 Aug 2026 00:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzRXF-00076s-CW
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 00:16:17 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzRXD-0006S6-Dd
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 00:16:17 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-38e58034d05so275011a91.2
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 21:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787804174; x=1788408974; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NN+AYChl0fCz2uWH5Ftv6FK+uk3UyZJ6XO3OQUKzsbk=;
 b=tiJVj/76TDyo/2ajfO1DauDGWV+MrseO3GKScak4RUSAmltOWZRM5+l7cSezqCKCzG
 4rg6NhcCIo9+rBM2G77xzPQxYdsicfcLEC3ug4Jp9b2FpaLfcAaPGSIqIRWucc1H/pKw
 s6uBQp/8mafpXZkjpgYPNeNcBRFuuFBxbQO8+IqiExte3g8atdfezTFv92MfD/32Krhy
 LD+cxgmkGevsKAnRmWigT7SYNb7yMXJPHbSh6rMCA+3/LaLnwVxJVIUtz9XiLYUYn93a
 BLrwae2CHO5rw+HXXPl+eUVM2mE0CRbOmLJkN4eZMyZNeOqNIpBhu/z48N2n47y47bWa
 jfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787804174; x=1788408974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NN+AYChl0fCz2uWH5Ftv6FK+uk3UyZJ6XO3OQUKzsbk=;
 b=gxZqg/jZhjxhDN7spafkmlIMXoD3+4tXmCts9cJfVRbBYw5GU9OxNNjkp4YnW/wwv1
 3TBVcJh9PaDGmAOlNzB19fZMjm1CDE+NCTVfWv3Gjk4Cgc0SUVAUFYXPfFg2dCz2m8fh
 hqABwP5fxzHUkTMOOBF96BWmvAend5k9XfrDoPlUNZ46KEKmRGYUnlDeqet2oeYhveAb
 qFnuRuLzZlvB32mPRBOlp+5nqb9GfW0bfMYJQI1w2/Uhv0nnW9IHsZUQDTBuK7tMHIoS
 5I/GZWh0CIODC+aGlnFnzmrCa5XKrH4T/nZadr+4ToKlmjPNX0j5AmivGFqXRhhKZDfu
 yomQ==
X-Gm-Message-State: AFuF++llbeWYBC96Vm9wRrygyN8Hm+eI+GdKH4c0dEwPzSloaVjj9fwi
 nbUIvVqlV6YaKDDzCHooZSTAUsIwN6eVGUBCqrzdrJgTNYr1NHHO5SgGS4mqGWGixPQ=
X-Gm-Gg: AR+sD1175mW+PJs5PDeJuYEmdXRlWudSwE84SyUUBoPou4vLnrmoZHgJe/MCw9uRPuU
 k88ChS9AzuP2Qb0kItl2hlVUfaZotC3o6yxyAfWnXKyor9MXppYR2vd0HzHD0zK00cbQKUd8qpT
 QoU+qQfs2lF31D/vAaskfhxsnnzdKnUGnGyl1V2Yt9u8ucYdDNMTHJrr4JjQCFnquZxvKLwf4ZH
 55JMqsUAPY8Gpw8dFhhhfhZAxfeRSQwWjEvSqxPkIen2N/kCTZlaXE5AqHuQ7Fa8aisps0BMDlQ
 e4LNHSz8lO0YyDdHWUr3gX7tBh1l/wFv6kYOP7JaGF+oLTZUykG8boqxB3j59Ff1WA8X5lo26rg
 ZeVIMo5EjQHCWq7WC+Rt9BRNdEzjrav1R5vHLuP0XKklCXYHQ99FemcFPZzfX7kc2aRF8FHbsGk
 0SkTobVPTuHwoq4xOtmXxhTQAtkiFU2urVCxai4leaNtry6ZMBCg7brDlDryq7Jvb3Q2XIuPXIt
 7aOwTTRXR3ixcQA1A==
X-Received: by 2002:a17:90b:3890:b0:395:bbfe:fc6f with SMTP id
 98e67ed59e1d1-3966d401db6mr23680278a91.3.1787804173703; 
 Wed, 26 Aug 2026 21:16:13 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396b0d81682sm969597a91.7.2026.08.26.21.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 21:16:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pierrick.bouvier@oss.qualcomm.com,
 philmd@oss.qualcomm.com
Subject: [PATCH v4 4/6] target/arm: Introduce cpu types max-v8 and max-v9
Date: Wed, 26 Aug 2026 21:15:55 -0700
Message-ID: <20260827041557.775080-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827041557.775080-1-richard.henderson@linaro.org>
References: <20260827041557.775080-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Introduce the names and allow them with the virt and sbsa-ref
machine types.  So far, the cpu types both exactly match "max".

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/sbsa-ref.c           |  2 ++
 hw/arm/virt.c               |  2 ++
 target/arm/tcg/cpu-max-v8.c | 11 +++++++++++
 target/arm/tcg/cpu64.c      |  1 +
 4 files changed, 16 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 484b90053e8..56d08f605c8 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -913,6 +913,8 @@ static void sbsa_ref_class_init(ObjectClass *oc, const void *data)
         ARM_CPU_TYPE_NAME("neoverse-v1"),
         ARM_CPU_TYPE_NAME("neoverse-n2"),
         ARM_CPU_TYPE_NAME("max"),
+        ARM_CPU_TYPE_NAME("max-v8"),
+        ARM_CPU_TYPE_NAME("max-v9"),
         NULL,
     };
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e7a56e37f73..d738b95c726 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -4132,6 +4132,7 @@ static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
     if (tcg_enabled()) {
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a7")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a15")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("max-v8")));
     }
     if (tcg_enabled() && target_aarch64()) {
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a35")));
@@ -4143,6 +4144,7 @@ static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n1")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-v1")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n2")));
+        g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("max-v9")));
     }
     if (target_aarch64()) {
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a53")));
diff --git a/target/arm/tcg/cpu-max-v8.c b/target/arm/tcg/cpu-max-v8.c
index 5a9845d88f3..55f8c341423 100644
--- a/target/arm/tcg/cpu-max-v8.c
+++ b/target/arm/tcg/cpu-max-v8.c
@@ -2,6 +2,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "qemu/target-info.h"
 #include "internals.h"
 
 
@@ -117,3 +118,13 @@ void aarch32_max_v8_tcg_initfn(Object *obj)
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
 #endif
 }
+
+static void cpu_max_v8_register_type(void)
+{
+    static const ARMCPUInfo max_v8[2] = {
+        { .name = "max-v8", .initfn = aarch32_max_v8_tcg_initfn },
+        { .name = "max-v8", .initfn = aarch64_max_tcg_initfn }
+    };
+    arm_cpu_register(&max_v8[target_aarch64()]);
+}
+type_init(cpu_max_v8_register_type)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index b38c61ba623..d44a8221c8b 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1488,6 +1488,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "neoverse-n1",        .initfn = aarch64_neoverse_n1_initfn },
     { .name = "neoverse-v1",        .initfn = aarch64_neoverse_v1_initfn },
     { .name = "neoverse-n2",        .initfn = aarch64_neoverse_n2_initfn },
+    { .name = "max-v9",             .initfn = aarch64_max_tcg_initfn },
 };
 
 static void aarch64_cpu_register_types(void)
-- 
2.53.0


