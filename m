Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp595834ejb;
        Sat, 2 Sep 2023 21:31:32 -0700 (PDT)
X-Received: by 2002:a17:902:e850:b0:1b8:9461:6729 with SMTP id t16-20020a170902e85000b001b894616729mr8575310plg.2.1693715492184;
        Sat, 02 Sep 2023 21:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693715492; cv=none;
        d=google.com; s=arc-20160816;
        b=djZC+DIUb3to1fqxwxKctqDmt9CAVdY4TPR8RsaZwIdX+ymqyhaDpESIOJ/viMN0+G
         4z1ZP9mzXunk872ctpgIkzxPBjJFJq8jZdzVVKasE1ttEFI++QXdpWCXIZjVB2WseFsz
         z5hTE/01atU5T5Tr5b1V8tt4jm0TNqY2EQMfMGdvMGWgYSw67l/4BFEY29NPn8u3hzp7
         ijKAPTZ8sORFeSf2qNCs82XWDyd2/h/e4MaUBFDh224LAsdqSYflDaOnOMCp6aBz7101
         E1BZYBXfGtDYyxbQTyNMeyrP64HcUGFX8FaGbIe84Aa6PPOeKRAZR2U6bi07peGHNuZO
         Z1TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=frehclFszcwfB9vSGB44IhmZy3iPQA9K18ZglgMoRmU=;
        fh=SqKyJROJui9a17k1FEImfRrhfLXqSZ+DT5LKXbqV0a4=;
        b=JEbA7HEEatRm3WqeuNbnRmpaV1zOtivCvLjH3/6k+yBHJZIXrFaGa7/o8KOCY8qIoT
         iJ6dqw4yeehYniBvkXzinMmXk183icAydh+FZWqDdvbB6/VCyV3zYhIkHlaHWT/5GLA6
         pMazRjisCbvkC/7vHVOB6L4eILZBeYjEgiusZ27OsVmw+3n1NAAn2j1+Y9pHY71iXr6m
         3o/xn8j64Wul9s9r17jgB+teAoTMzpGagw92yyT7aphefN9NqTwiB7khz8ldjGK+wGTh
         x05TaA2CES9IG57QOjCpiVxe5zlO00VhLUynbCehKO+8Ot69IxhqwGN7Z1R8bCf7Zjly
         cbOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=g2D6OBPz;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s13-20020a170903200d00b001bdca71d0bbsor4257013pla.14.2023.09.02.21.31.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 02 Sep 2023 21:31:32 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=g2D6OBPz;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1693715491; x=1694320291; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frehclFszcwfB9vSGB44IhmZy3iPQA9K18ZglgMoRmU=;
        b=g2D6OBPzPxouJk7J69sCnWO4KS9COPvQCVh66YA/0b+WP52+GqaaEFqOXlzFXKWohV
         1/xkkHRDqgeR+ORPMLy3PH8A9z1v2PquLOwiyoTyP7ZaVDP36jerFd/oo1Bynp58KBxD
         9dVJTPFOCRXccgqko3QuAiRGrQfrTiE5FFoSsVFxJ+JtPzm8kYaBkrmYCGo8jm81Gc9N
         SwyO/rQruyqhiPZCZdGz6Tjbu5Su6WXUke/pszeuUbJJuHkZrbVZjZa2s/Gj2wZ3fuvk
         qfa0WbbE5OahvBkvjmeqS9yU9Dw08I3ChFh4L0/m/uefkhu02EX5ZPmCMV2LXm8DVBDY
         3QKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693715491; x=1694320291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frehclFszcwfB9vSGB44IhmZy3iPQA9K18ZglgMoRmU=;
        b=SgQ8uqsxdBCSjoygqEhmW1A0cKNIGjOvJCq3kmFRQsYVH5/kD1HREw6PXGn1+TAFR8
         GjFnauB3X1fWFDYdMvqieKVQuGsRQyKFPQ2ZBjC2D8F8DcrZ0RU+uIlMiA3iXix2xuJz
         qJwygZM5YnZqjCR6BIPAZW7Bmrmdg+3rc0vVVHshNuxAFAsIOWo7MXKeAGVwFydnwVme
         LmZlaly32odTxYcPXcdemGlOoAbjnBytxow6fI3vwTGjS1oK+YtLqiAfGS0XVgWJM6W6
         XtmVQh4/oHMPoR97NmB9m8u4IteVNqynRsYW43diU2NKrdOy7d/kgqtlsLhoN/iHCnvT
         ILBQ==
X-Gm-Message-State: AOJu0Ywm00rB0WgDTGDGW4o9vpOIVGq2+Z/17yLJX5H3RaiP+UU19wPE
	e6JnsVX8srnHTfqLUcmdm19s/hn9uZYPXy1PaLk=
X-Google-Smtp-Source: AGHT+IFqi74KMZZIJBsU51vq7BtAop99Ju4EwXVlAvsyYxpn7DYQpdQxhwjWybwpk4U+0C5PCDmdoQ==
X-Received: by 2002:a17:902:748a:b0:1c0:e014:90c1 with SMTP id h10-20020a170902748a00b001c0e01490c1mr7192189pll.48.1693715491599;
        Sat, 02 Sep 2023 21:31:31 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id iz2-20020a170902ef8200b001bb9f104328sm5295792plb.146.2023.09.02.21.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 21:31:31 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikhail Tyutin <m.tyutin@yadro.com>,
	Aleksandr Anenkov <a.anenkov@yadro.com>,
	qemu-devel@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs),
	qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
	qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
	qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PATCH 4/8] hw/core/cpu: Return static value with gdb_arch_name()
Date: Sun,  3 Sep 2023 13:30:14 +0900
Message-ID: <20230903043030.20708-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230903043030.20708-1-akihiko.odaki@daynix.com>
References: <20230903043030.20708-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +dBmuVMv1jPT

All implementations of gdb_arch_name() returns dynamic duplicates of
static strings. It's also unlikely that there will be an implementation
of gdb_arch_name() that returns a truly dynamic value due to the nature
of the function returning a well-known identifiers. Qualify the value
gdb_arch_name() with const and make all of its implementations return
static strings.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/cpu.h  | 2 +-
 target/ppc/internal.h  | 2 +-
 gdbstub/gdbstub.c      | 4 +---
 target/arm/cpu.c       | 6 +++---
 target/arm/cpu64.c     | 4 ++--
 target/i386/cpu.c      | 6 +++---
 target/loongarch/cpu.c | 4 ++--
 target/ppc/gdbstub.c   | 6 +++---
 target/riscv/cpu.c     | 6 +++---
 target/s390x/cpu.c     | 4 ++--
 target/tricore/cpu.c   | 4 ++--
 11 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fdcbe87352..4f5c7eb04e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -164,7 +164,7 @@ struct CPUClass {
     vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
 
     const char *gdb_core_xml_file;
-    gchar * (*gdb_arch_name)(CPUState *cpu);
+    const gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
 
     void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 57acb3212c..974b37aa60 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -221,7 +221,7 @@ void destroy_ppc_opcodes(PowerPCCPU *cpu);
 
 /* gdbstub.c */
 void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
-gchar *ppc_gdb_arch_name(CPUState *cs);
+const gchar *ppc_gdb_arch_name(CPUState *cs);
 
 /**
  * prot_for_access_type:
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 2772f07bbe..78711801db 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -379,11 +379,9 @@ static const char *get_feature_xml(const char *p, const char **newp,
                     "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
                     "<target>");
             if (cc->gdb_arch_name) {
-                gchar *arch = cc->gdb_arch_name(cpu);
                 pstrcat(buf, buf_sz, "<architecture>");
-                pstrcat(buf, buf_sz, arch);
+                pstrcat(buf, buf_sz, cc->gdb_arch_name(cpu));
                 pstrcat(buf, buf_sz, "</architecture>");
-                g_free(arch);
             }
             pstrcat(buf, buf_sz, "<xi:include href=\"");
             pstrcat(buf, buf_sz, cc->gdb_core_xml_file);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d71a162070..4147c19597 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2281,15 +2281,15 @@ static Property arm_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
-static gchar *arm_gdb_arch_name(CPUState *cs)
+static const gchar *arm_gdb_arch_name(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
 
     if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
-        return g_strdup("iwmmxt");
+        return "iwmmxt";
     }
-    return g_strdup("arm");
+    return "arm";
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 96158093cc..6b91aab6b7 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -743,9 +743,9 @@ static void aarch64_cpu_finalizefn(Object *obj)
 {
 }
 
-static gchar *aarch64_gdb_arch_name(CPUState *cs)
+static const gchar *aarch64_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("aarch64");
+    return "aarch64";
 }
 
 static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 97ad229d8b..68bea8d3f0 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5910,12 +5910,12 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
     memset(&env->user_features, 0, sizeof(env->user_features));
 }
 
-static gchar *x86_gdb_arch_name(CPUState *cs)
+static const gchar *x86_gdb_arch_name(CPUState *cs)
 {
 #ifdef TARGET_X86_64
-    return g_strdup("i386:x86-64");
+    return "i386:x86-64";
 #else
-    return g_strdup("i386");
+    return "i386";
 #endif
 }
 
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index ad93ecac92..49565da3fa 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -692,9 +692,9 @@ static const struct SysemuCPUOps loongarch_sysemu_ops = {
 };
 #endif
 
-static gchar *loongarch_gdb_arch_name(CPUState *cs)
+static const gchar *loongarch_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("loongarch64");
+    return "loongarch64";
 }
 
 static void loongarch_cpu_class_init(ObjectClass *c, void *data)
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index ca39efdc35..72df36ca06 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -589,12 +589,12 @@ static int gdb_set_vsx_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
-gchar *ppc_gdb_arch_name(CPUState *cs)
+const gchar *ppc_gdb_arch_name(CPUState *cs)
 {
 #if defined(TARGET_PPC64)
-    return g_strdup("powerpc:common64");
+    return "powerpc:common64";
 #else
-    return g_strdup("powerpc:common");
+    return "powerpc:common";
 #endif
 }
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6b93b04453..ef8faaaff5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1939,17 +1939,17 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static gchar *riscv_gdb_arch_name(CPUState *cs)
+static const gchar *riscv_gdb_arch_name(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
 
     switch (riscv_cpu_mxl(env)) {
     case MXL_RV32:
-        return g_strdup("riscv:rv32");
+        return "riscv:rv32";
     case MXL_RV64:
     case MXL_RV128:
-        return g_strdup("riscv:rv64");
+        return "riscv:rv64";
     default:
         g_assert_not_reached();
     }
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index df167493c3..cf4b5e43f2 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -284,9 +284,9 @@ static void s390_cpu_initfn(Object *obj)
 #endif
 }
 
-static gchar *s390_gdb_arch_name(CPUState *cs)
+static const gchar *s390_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("s390:64-bit");
+    return "s390:64-bit";
 }
 
 static Property s390x_cpu_properties[] = {
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 133a9ac70e..44e3ba6f0e 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -29,9 +29,9 @@ static inline void set_feature(CPUTriCoreState *env, int feature)
     env->features |= 1ULL << feature;
 }
 
-static gchar *tricore_gdb_arch_name(CPUState *cs)
+static const gchar *tricore_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("tricore");
+    return "tricore";
 }
 
 static void tricore_cpu_set_pc(CPUState *cs, vaddr value)
-- 
2.42.0
