Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1430977ejo;
        Tue, 12 Dec 2023 22:41:40 -0800 (PST)
X-Received: by 2002:a05:6358:9199:b0:170:da5a:d24e with SMTP id j25-20020a056358919900b00170da5ad24emr5584732rwa.51.1702449700024;
        Tue, 12 Dec 2023 22:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702449699; cv=none;
        d=google.com; s=arc-20160816;
        b=QJ2NCPmRg71O6R5Ergxf48n8UE7jf7+/eDn+awBf7NJ3oeJSTLfu1OPla6JUKFJzVN
         A8J9m/VtGSWEhc2gIhqoypTvXdZyRbp2MFWr81zr7p+pwiC7+MMoYxamj2QzHKP+FosO
         q9uECFcofeLFAZJgaOY+z+YQE323elNG5mpbb7zhXxEHKvPzXOdtMLHV6LGG48XcPTYL
         NVP61kmYZW7a8DvuGJytF58YU2KBlfV0ArgO9KbdDMfp1XSBLtiHwVigDxn48ANSVHMW
         p0chjDypIstXFT0cuWbYwMZMEYID/bCnyg2smEQtxQai8LMJUxYJ7my4DKbWCnGsQF4A
         WBPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=NvSh0WknHcG/StytJqfPktwL2HplvmINJyMyxl48wgw=;
        fh=HE3HFS1hEYtTzJ0gsfroCOJ69k1mn8lcAqBvf3V8Iho=;
        b=RhmgLhW3jHMsmdiu2AL+ji2s3SN7yqT6kzDdre9eiYwWyRiIQkgSLgBCgjpg7CSSRo
         YjyxpGYyvWyEmuUWTFTyk5k5qokgyz09nURZV5i5SxAWhA9bTA8K7XeueibWnKobYTUV
         ae8rHR6fw8ZnmQOUIVmvZwX9agsZxvVxhG9zlY3WB5GQKTKOPW92jd2cJyLjpI1p48yP
         IdM4IOH8prwnvbe4JYJQ0E7Oa42nDkJ4dSlDPyPzNWXl+CBK8uVenWNXwtfuQ27/zHvo
         3SMkZ+LdTwHbOd37odVG5NV1NlCwksQPgKCNdD25MjvJJFPiEYXX4h+WFdN67o7xa8We
         L3/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=R0BFVB8T;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k17-20020aa79d11000000b006cde0fc91f2sor8044764pfp.9.2023.12.12.22.41.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 22:41:39 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=R0BFVB8T;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702449699; x=1703054499; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvSh0WknHcG/StytJqfPktwL2HplvmINJyMyxl48wgw=;
        b=R0BFVB8TGQBK/K/55fS0NmBHDwLYv3ioqenKrOQwPEUUDUbRhH2VCoYaa3NoRb0hX+
         uiw/tSpwcat/Xx3hoiey2DcsrgfsdkahZkJNtB/Yy5GxRFkHGNcbJkVamOH6wueR33a7
         pqw0y902uSOEj2N8XXBqioEpBopjqQa7BQO7NzgEWrLzgF8hgl+k8Z2NU0YTu1lGS2SK
         uPkihMz53IiaXUWzzd9ScEB63912wQtvtlfn0xX23h5nqsd8W9HukeeAKktRYWvlAxJ8
         dAdncg9oKkaSN/Zo7NecqCvb4kM5wXWjPLM9TbW/Z8jB6KLcXsi7eaKTJRZ0U77PaUgg
         TRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702449699; x=1703054499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvSh0WknHcG/StytJqfPktwL2HplvmINJyMyxl48wgw=;
        b=hH9vgdB5gvRlzI/lmQBmvwoLg3YP3a5Bi4CBO74PwAqfeVKihHxbbeWpl9P1YXiuOB
         b30HgiISbKFEyIqcw1KnPbT69/h1lzRCFMEQR2QeVBbbB7XhxHpFggFQ1Wb7RP7weS2L
         MdOo8cgCVRdIo8jmbF+knp30voRLfPiD5Wi2ZW9rlU3+gcoutznHAc7HZLHpfzq4MkXV
         /ZqO7l/p6/pzoA8TLuIwY+9WQhHxeEyNXIdoyaFvGcUYdH0uZCNmQQSIlJ8EHoBmiIE6
         8aD9Zxvg5D9C/SH8YpGPCEskUKSGXw5kVisGBIzHblQAX6XybNVSnsewTl2Zxu5YEm99
         vSPw==
X-Gm-Message-State: AOJu0YydpRq6cRi2r3EqdGO5CZXNZAXttzdWSI5hpZTaKIK3R6kDcS5J
	qsl5g7Do26A35+U2L6hC0LujRw==
X-Google-Smtp-Source: AGHT+IE2mcc5b2IVbceldc256meTS3JA/FbqxSUrx/DimaTJdtSpaN7AIRRD0XOPRzrFIU9OONSUQw==
X-Received: by 2002:a05:6a00:890:b0:6ce:2732:57e with SMTP id q16-20020a056a00089000b006ce2732057emr8504350pfj.47.1702449699520;
        Tue, 12 Dec 2023 22:41:39 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.205.15])
        by smtp.gmail.com with UTF8SMTPSA id x6-20020aa784c6000000b006bd26bdc909sm9262511pfn.72.2023.12.12.22.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 22:41:39 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 13 Dec 2023 15:41:01 +0900
Subject: [PATCH v17 02/14] target/ppc: Use GDBFeature for dynamic XML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231213-gdb-v17-2-777047380591@daynix.com>
References: <20231213-gdb-v17-0-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-0-777047380591@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 20231213-riscv-v7-0-a760156a337f@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.12.4
X-TUID: 2tZSAOYHc3mS

In preparation for a change to use GDBFeature as a parameter of
gdb_register_coprocessor(), convert the internal representation of
dynamic feature from plain XML to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu-qom.h  |  1 +
 target/ppc/cpu.h      |  4 +---
 target/ppc/cpu_init.c |  4 ----
 target/ppc/gdbstub.c  | 51 +++++++++++++++++++--------------------------------
 4 files changed, 21 insertions(+), 39 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 0241609efefe..8247fa23367e 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -20,6 +20,7 @@
 #ifndef QEMU_PPC_CPU_QOM_H
 #define QEMU_PPC_CPU_QOM_H
 
+#include "exec/gdbstub.h"
 #include "hw/core/cpu.h"
 
 #ifdef TARGET_PPC64
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index f8101ffa2963..f87c26f98a67 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1471,8 +1471,7 @@ struct PowerPCCPUClass {
     int bfd_mach;
     uint32_t l1_dcache_size, l1_icache_size;
 #ifndef CONFIG_USER_ONLY
-    unsigned int gdb_num_sprs;
-    const char *gdb_spr_xml;
+    GDBFeature gdb_spr;
 #endif
     const PPCHash64Options *hash64_opts;
     struct ppc_radix_page_info *radix_page_info;
@@ -1525,7 +1524,6 @@ int ppc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
 #ifndef CONFIG_USER_ONLY
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu);
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
 #endif
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 40fe14a6c259..a0178c3ce80a 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6682,10 +6682,6 @@ static void init_ppc_proc(PowerPCCPU *cpu)
     /* PowerPC implementation specific initialisations (SPRs, timers, ...) */
     (*pcc->init_proc)(env);
 
-#if !defined(CONFIG_USER_ONLY)
-    ppc_gdb_gen_spr_xml(cpu);
-#endif
-
     /* MSR bits & flags consistency checks */
     if (env->msr_mask & (1 << 25)) {
         switch (env->flags & (POWERPC_FLAG_SPE | POWERPC_FLAG_VRE)) {
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index ec5731e5d678..e3be3dbd109a 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -300,15 +300,23 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
 }
 
 #ifndef CONFIG_USER_ONLY
-void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu)
+static void gdb_gen_spr_feature(CPUState *cs)
 {
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
-    GString *xml;
-    char *spr_name;
+    GDBFeatureBuilder builder;
     unsigned int num_regs = 0;
     int i;
 
+    if (pcc->gdb_spr.xml) {
+        return;
+    }
+
+    gdb_feature_builder_init(&builder, &pcc->gdb_spr,
+                             "org.qemu.power.spr", "power-spr.xml",
+                             cs->gdb_num_regs);
+
     for (i = 0; i < ARRAY_SIZE(env->spr_cb); i++) {
         ppc_spr_t *spr = &env->spr_cb[i];
 
@@ -326,35 +334,13 @@ void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu)
          */
         spr->gdb_id = num_regs;
         num_regs++;
-    }
-
-    if (pcc->gdb_spr_xml) {
-        return;
-    }
 
-    xml = g_string_new("<?xml version=\"1.0\"?>");
-    g_string_append(xml, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append(xml, "<feature name=\"org.qemu.power.spr\">");
-
-    for (i = 0; i < ARRAY_SIZE(env->spr_cb); i++) {
-        ppc_spr_t *spr = &env->spr_cb[i];
-
-        if (!spr->name) {
-            continue;
-        }
-
-        spr_name = g_ascii_strdown(spr->name, -1);
-        g_string_append_printf(xml, "<reg name=\"%s\"", spr_name);
-        g_free(spr_name);
-
-        g_string_append_printf(xml, " bitsize=\"%d\"", TARGET_LONG_BITS);
-        g_string_append(xml, " group=\"spr\"/>");
+        gdb_feature_builder_append_reg(&builder, g_ascii_strdown(spr->name, -1),
+                                       TARGET_LONG_BITS, num_regs,
+                                       "int", "spr");
     }
 
-    g_string_append(xml, "</feature>");
-
-    pcc->gdb_num_sprs = num_regs;
-    pcc->gdb_spr_xml = g_string_free(xml, false);
+    gdb_feature_builder_end(&builder);
 }
 
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
@@ -362,7 +348,7 @@ const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
 
     if (strcmp(xml_name, "power-spr.xml") == 0) {
-        return pcc->gdb_spr_xml;
+        return pcc->gdb_spr.xml;
     }
     return NULL;
 }
@@ -599,7 +585,8 @@ void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
                                  32, "power-vsx.xml", 0);
     }
 #ifndef CONFIG_USER_ONLY
+    gdb_gen_spr_feature(cs);
     gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
-                             pcc->gdb_num_sprs, "power-spr.xml", 0);
+                             pcc->gdb_spr.num_regs, "power-spr.xml", 0);
 #endif
 }

-- 
2.43.0
