Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp785753ejc;
        Thu, 10 Aug 2023 09:13:33 -0700 (PDT)
X-Received: by 2002:adf:d4c8:0:b0:317:ef76:b776 with SMTP id w8-20020adfd4c8000000b00317ef76b776mr2465060wrk.68.1691684012986;
        Thu, 10 Aug 2023 09:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691684012; cv=none;
        d=google.com; s=arc-20160816;
        b=IQF7Hp4Wt9Sx/n8MakPqiLDD/h5eV3tWfxUcrTYXUVLxQtQGK3LFKuyzgNH8zolL0t
         cjavc/uooVBk8NQQXptTrzYANv8/71Ma212kXGWby24NgpJ8FpSV4ux+Q5fdlV21x8Mi
         K6STy4GCSGa90DFRdUV3+BXN6+P8AnQ4hLuYA3SRIUppbgn2MF8NG/A+R1shKoe5gjZf
         ZwJLNijjKkiYgxn6Hbfsh+NHrQoegrfV1sPifpNVx5I/nj18SWzjcvoNrsHfyEQ4hloK
         a0dJ3+6G3F4hda2sjgNHWKsFusPqLQ+1XAN89P/qCpMSpPSznfxAdi41CLBF9eY2Kqot
         WbOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=bJM8N4R9J6Gyk9m0A9ejLgBXb/ApU3lquNvKlYn7WWg=;
        fh=Ar7VjEJHBCSw9/GAQFI1HxbtM2WCKR82tFXq3E5dzKk=;
        b=tCiVX+KE7sVFcBa1ly3dVanR8f86GyJNYz3E4pgvnHbMvRgOYSZbUNObgT+6lxUq77
         3sO2ptrPOa+AUthf13XePl1UygzGaM82doiu1u7G4OX+dMkQGrm1lTPXLFKsDfbLYGzT
         chZxvYiUUc9vWqgXnudPKsDk/sTohzcwoyZ8Glc1uqjsRMz125Pu6lnXhSVJtOn8RAtF
         /knhD2L5UTinEgQldjTATFZ1fOR8awifJeYcbxixx2gSWQG6SUVX10oAPv4S8dlVTiJi
         c7cY8BVFAyL59nAgnAnhLabT6xuOe9EtqssFpTsru4tj/HchpB0Wy/Jg9ltSmir5DEJ9
         MD9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bjx+D9h2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q30-20020adfb19e000000b003175524677csor667618wra.7.2023.08.10.09.13.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Aug 2023 09:13:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bjx+D9h2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691684012; x=1692288812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bJM8N4R9J6Gyk9m0A9ejLgBXb/ApU3lquNvKlYn7WWg=;
        b=bjx+D9h2xauAgseHaauo6pWEv3J3g7M4+qQmCXkEF6ySK944HO31dtoFj/6k/2a3ab
         zkdxCAQQ8E/Q+E3AkYiaVyP8WZQfP/tsIOjvcQU0/QNsy1qvgzQAoIwSmwcih6695cM4
         Zbm/tkKGvZ0zlbmw/acbxXBQx/OCT8X0NM50sm+DbvsU/gkLWfHqLb9hq+Z3bCzY3yyw
         URctd4QRfPsNY6QzfeBzaE3QCvlm1ZngxQCJqn0h8iF8ll06jcmsbwRgPszlr0PLjLp2
         ZcfN5SaVzEndbJOxmYBWtNndI0M3x3eTtp1uNKJhjx1BC+qSoNr+1oZ3tdzWc0gv+bBg
         Nz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691684012; x=1692288812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJM8N4R9J6Gyk9m0A9ejLgBXb/ApU3lquNvKlYn7WWg=;
        b=iI3A82VBfLrlrycOIpJL/BCBQV4aOcSlZsCsg2tebueN4YEMlGP0KW/OgLyvohWOkk
         P0GwdzoapET4TnJnaqGX4uMdKhU+0xLe96DJBuS/Y1XsKyaaQohMZbkv456JFF8/YGCJ
         5ptIW5P6kqKU4zFXr45Q5vp6OZ3/SFHg3lpo3VWfO2rypR1Z6t2KKLbctYt8SBUMVLiq
         1bezqc0xqbsD2Q7bC3dwHdcZLR7m7gQaFJtuq2jhBM3D/CQrY6IcCVC3H59hUjCgIKtz
         E4G2bubbTm9GlZbiRA8ic/+Uh+MWN4oVXYshMOSGXZWveFIpONAid8iLMCnFE7VA5V8m
         Xemg==
X-Gm-Message-State: AOJu0YyFiNsfKauqAMBmNsxRiYAniF59YBEA7uNFCqovW/M7o5mbHJdv
	2nBjwaEV86oIDrBwDASvRvYahwfn
X-Google-Smtp-Source: AGHT+IHwnZLCHX3T/K+iKxZKSrthQEiNZ0IrFoZIqfTQ4WwTOKvgNwERXyGNEBVWDzW3ljCAyv2GVQ==
X-Received: by 2002:a5d:46ca:0:b0:314:e929:bcb9 with SMTP id g10-20020a5d46ca000000b00314e929bcb9mr2563128wrs.57.1691684012416;
        Thu, 10 Aug 2023 09:13:32 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (tre93-h02-176-184-7-255.dsl.sta.abo.bbox.fr. [176.184.7.255])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d4281000000b00317a29af4b2sm2589650wrq.68.2023.08.10.09.13.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Aug 2023 09:13:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.2] target/arm/cpu: Allow logging disabled CPU features at UNIMP level
Date: Thu, 10 Aug 2023 18:13:29 +0200
Message-Id: <20230810161329.7453-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MQFil6myTMuW

Some CPU features aren't strictly required to run guest code (such
debugging features), so we don't model them. To prevent the guest
to access non-existent system registers, we disable the feature bit
in the ID registers (see commit 7d8c283e10 "target/arm: Suppress more
TCG unimplemented features in ID registers").

Since it might be useful to know when a CPU supposed to implement a
feature has it disabled in QEMU, provide the ability to log disabled
features at the UNIMP level:

  $ qemu-system-aarch64 -M virt -d unimp -S -cpu neoverse-v1
  QEMU 8.0.92 monitor - type 'help' for more information
  CPU#0: Disabling unimplemented feature 'FEAT_SPE (Statistical Profiling Extension)' for neoverse-v1
  CPU#0: Disabling unimplemented feature 'FEAT_TRF (Self-hosted Trace Extension)' for neoverse-v1
  CPU#0: Disabling unimplemented feature 'FEAT_TRF (Self-hosted Trace Extension)' for neoverse-v1
  CPU#0: Disabling unimplemented feature 'Trace Macrocell system register access' for neoverse-v1
  CPU#0: Disabling unimplemented feature 'Trace Macrocell system register access' for neoverse-v1
  CPU#0: Disabling unimplemented feature 'Memory-mapped Trace' for neoverse-v1
  CPU#0: Disabling unimplemented feature 'FEAT_AMU (Activity Monitors Extension)' for neoverse-v1
  CPU#0: Disabling unimplemented feature 'FEAT_AMU (Activity Monitors Extension)' for neoverse-v1
  CPU#0: Disabling unimplemented feature 'FEAT_MPAM (Memory Partitioning and Monitoring Extension)' for neoverse-v1
  CPU#0: Disabling unimplemented feature 'FEAT_NV (Nested Virtualization)' for neoverse-v1
  (qemu) q

  $ qemu-system-aarch64 -M xlnx-zcu102 -trace arm_disable\* -S -d unimp -monitor stdio -cpu cortex-a76
  QEMU 8.0.92 monitor - type 'help' for more information
  CPU#0: Disabling unimplemented feature 'Memory-mapped Trace' for cortex-a53
  CPU#1: Disabling unimplemented feature 'Memory-mapped Trace' for cortex-a53
  CPU#2: Disabling unimplemented feature 'Memory-mapped Trace' for cortex-a53
  CPU#3: Disabling unimplemented feature 'Memory-mapped Trace' for cortex-a53
  (qemu) q

Refactor the FIELD_DPxx() calls into the DISABLE_UNIMP_CPU_FEATURE()
macro where we call qemu_log(UNIMP).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
There is another series reworking cpu_typename() helpers, so
meanwhile I simply added a static arm_cpu_typename() here.
---
 target/arm/cpu.c | 60 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 20 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 93c28d50e5..becd2d2690 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1580,6 +1580,24 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
     }
 }
 
+/* callers must free the returned string with g_free() */
+static char *arm_cpu_typename(ARMCPU *cpu)
+{
+    const char *cpu_type = object_get_typename(OBJECT(cpu));
+
+    return g_strndup(cpu_type, strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX));
+}
+
+#define DISABLE_UNIMP_CPU_FEATURE(size, cpu, storage, reg, field, desc) \
+    if (FIELD_EX##size(cpu->isar.storage, reg, field)) { \
+        g_autofree char *cpu_type = arm_cpu_typename(cpu); \
+        \
+        qemu_log_mask(LOG_UNIMP, \
+                      "CPU#%d: Disabling unimplemented feature '%s' for %s\n", \
+                      CPU(cpu)->cpu_index, desc, cpu_type); \
+        cpu->isar.storage = FIELD_DP##size(cpu->isar.storage, reg, field, 0); \
+    }
+
 static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -2075,32 +2093,34 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          * try to access the non-existent system registers for them.
          */
         /* FEAT_SPE (Statistical Profiling Extension) */
-        cpu->isar.id_aa64dfr0 =
-            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMSVER, 0);
+        DISABLE_UNIMP_CPU_FEATURE(64, cpu, id_aa64dfr0, ID_AA64DFR0, PMSVER,
+                                  "FEAT_SPE (Statistical Profiling Extension)");
+
         /* FEAT_TRF (Self-hosted Trace Extension) */
-        cpu->isar.id_aa64dfr0 =
-            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, TRACEFILT, 0);
-        cpu->isar.id_dfr0 =
-            FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, TRACEFILT, 0);
+        DISABLE_UNIMP_CPU_FEATURE(64, cpu, id_aa64dfr0, ID_AA64DFR0, TRACEFILT,
+                                  "FEAT_TRF (Self-hosted Trace Extension)");
+        DISABLE_UNIMP_CPU_FEATURE(32, cpu, id_dfr0, ID_DFR0, TRACEFILT,
+                                  "FEAT_TRF (Self-hosted Trace Extension)");
         /* Trace Macrocell system register access */
-        cpu->isar.id_aa64dfr0 =
-            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, TRACEVER, 0);
-        cpu->isar.id_dfr0 =
-            FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPTRC, 0);
+        DISABLE_UNIMP_CPU_FEATURE(64, cpu, id_aa64dfr0, ID_AA64DFR0, TRACEVER,
+                                  "Trace Macrocell system register access");
+        DISABLE_UNIMP_CPU_FEATURE(32, cpu, id_dfr0, ID_DFR0, COPTRC,
+                                  "Trace Macrocell system register access");
         /* Memory mapped trace */
-        cpu->isar.id_dfr0 =
-            FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, MMAPTRC, 0);
+        DISABLE_UNIMP_CPU_FEATURE(32, cpu, id_dfr0, ID_DFR0, MMAPTRC,
+                                  "Memory-mapped Trace");
         /* FEAT_AMU (Activity Monitors Extension) */
-        cpu->isar.id_aa64pfr0 =
-            FIELD_DP64(cpu->isar.id_aa64pfr0, ID_AA64PFR0, AMU, 0);
-        cpu->isar.id_pfr0 =
-            FIELD_DP32(cpu->isar.id_pfr0, ID_PFR0, AMU, 0);
+        DISABLE_UNIMP_CPU_FEATURE(64, cpu, id_aa64pfr0, ID_AA64PFR0, AMU,
+                                  "FEAT_AMU (Activity Monitors Extension)");
+        DISABLE_UNIMP_CPU_FEATURE(32, cpu, id_pfr0, ID_PFR0, AMU,
+                                  "FEAT_AMU (Activity Monitors Extension)");
         /* FEAT_MPAM (Memory Partitioning and Monitoring Extension) */
-        cpu->isar.id_aa64pfr0 =
-            FIELD_DP64(cpu->isar.id_aa64pfr0, ID_AA64PFR0, MPAM, 0);
+        DISABLE_UNIMP_CPU_FEATURE(64, cpu, id_aa64pfr0, ID_AA64PFR0, MPAM,
+                                  "FEAT_MPAM (Memory Partitioning"
+                                  " and Monitoring Extension)");
         /* FEAT_NV (Nested Virtualization) */
-        cpu->isar.id_aa64mmfr2 =
-            FIELD_DP64(cpu->isar.id_aa64mmfr2, ID_AA64MMFR2, NV, 0);
+        DISABLE_UNIMP_CPU_FEATURE(64, cpu, id_aa64mmfr2, ID_AA64MMFR2, NV,
+                                  "FEAT_NV (Nested Virtualization)");
     }
 
     /* MPU can be configured out of a PMSA CPU either by setting has-mpu
-- 
2.38.1
