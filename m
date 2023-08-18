Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp1529279ejs;
        Thu, 17 Aug 2023 20:37:38 -0700 (PDT)
X-Received: by 2002:a9d:7b4a:0:b0:6bd:72a4:ea2d with SMTP id f10-20020a9d7b4a000000b006bd72a4ea2dmr1154516oto.31.1692329857896;
        Thu, 17 Aug 2023 20:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692329857; cv=none;
        d=google.com; s=arc-20160816;
        b=tXGrUSFEYUev23OJQH+ubq0d6TffTlka0A0LG93qx7JUVBeM22D2FcCiEjJTOONXWu
         NWd0xH7pOPCKj+/GGe/WuTcYFxUqnT4yY6ZgEzoES7AfySwqAEakAp08TTQvh0ZPol8l
         yqKgrk9srrSwc3wrkFtqd3iXZIDAPkLobjuDfNzZzHJNlZ1gkHyoXNqQ9//oEK2+aG6d
         MbYcZ2ytr4knZs6o73gUNoF5DSRK/Dx3n/tKvHtJbvo+1rBOS4nbwWlgTE0iVqzI9ZPC
         Qd6CoYF9EeTuVy0zvHe2ipXFfsFiIH149tU5+BN0H01SGwTiKl2eb2bkJExeinP0m8bg
         L/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bSViemf+riC8XdyZcYM8UC9Jeo9OcURk0ijmusphsBY=;
        fh=EKo38ZJOmw1+gO2duxF0ueWXrLbFTb7VIuN/H7tNjpk=;
        b=CBUFEzT8Nt6qQcvBnWwg/AfuFK4LCP51uX0oolXRc807vKeac/GatQ1BUUVbVTpf5V
         6FgtAnfzr2Zi9NPy68gpqU6xELmAUyUYY9X0clQrArr/yOSW1k8mOU+Us3iS/eocAGCc
         U/QJPi24ZUygl9tTeMnMg/0/P/Udo8HU4hgdIpcZWv5wV0WlBvCGp+unTsH/WM9YSbrI
         dXCeBw4JrkYELSOio+NQRQ7qiiJQgK3Ecgozy6Dl7yb94IyObjU9cHabIyXbFdXKWO5h
         crRTADa7ZY9Tmji/fgv+EqGy7ql4L45HRNR0Iwp35baS5AzhupptROu3GrA7VoR8i8D2
         KLEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=oBD+64Nv;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d188-20020a6336c5000000b00565ea31ca15sor550133pga.2.2023.08.17.20.37.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Aug 2023 20:37:37 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=oBD+64Nv;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692329857; x=1692934657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSViemf+riC8XdyZcYM8UC9Jeo9OcURk0ijmusphsBY=;
        b=oBD+64Nv8Yq2nbPhj5NC35zp1jKWexXbVjo6h43X+MvgMRPhXtjWaIoNdrkcLrkXuC
         a+/CZAt77iWOUWSKrw0VxMJF54wlNvYtaC2H88vqAwMCmKYUEFBJQGHMDBz2Jct6atFG
         KIA69/rrTSPtnHfJ93/+R0fBNKl7FooVIghTSS0LBpLDUdppTzPzMnDKoDWxm8GBDg1k
         PkmTSaO1tpUc5pjJoZgkkuSobg5zRHL0ZipkvBMk7+OjMYkq7XLl1MYXnFHMcgMmBEfZ
         AH5lYhsR4YQ0j/OhBT4itOqU5AhPjh9hLWvA8Yxci5DMTZC1mvJV2cE+qN5etSpKVfux
         bi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692329857; x=1692934657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSViemf+riC8XdyZcYM8UC9Jeo9OcURk0ijmusphsBY=;
        b=JVOqRV8eznvdplCh23mez1e5dGoVQMBKVmjDNSAo0sx1Lv3Ucm+NoruNzQu0d9rWIl
         NL8RlKU2scU36Lj3nsqqY7vk4W17XIRCR3eVnoEYCRipytNN83RTLli9cnJGp5+9LxnB
         XJkmOdCvD59ne2sIfru2RwgpGzef9mnQf6MhDlmZRrg0LyoKhkiBVzbNQGqqhEw8tF7a
         Q+fxi7XgGWPZIWC32jygjc0xHJBtpgN2gYngFQ6qSn4R+Vl5iItlqORdlM+dQkh2b6NT
         wkF+3Hb3WPwgIm5fkkGEEopqt/9ovbMe+iv8jyD9IfyCJbVeDC7SKemXm4jsLWnFP1Ux
         I7/A==
X-Gm-Message-State: AOJu0YydqmDwLSTkIPVeOPOPltpuwYGmUM9Qxy2Fy+DNHNPmqeuFNv79
	xBQ4KVgp/jIwzGt1UKwokeirCMI2YjaM64royrk=
X-Google-Smtp-Source: AGHT+IFZLpDs9qxTAJHKsoK1yfPbVKoGgIKltoPwGC16Bu0cripHejaq+qRo/5FfnasVVT2K/kjEIw==
X-Received: by 2002:a05:6a20:1589:b0:13d:860e:e346 with SMTP id h9-20020a056a20158900b0013d860ee346mr2258856pzj.5.1692329857228;
        Thu, 17 Aug 2023 20:37:37 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id c24-20020aa781d8000000b00686a80f431dsm484135pfn.126.2023.08.17.20.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 20:37:36 -0700 (PDT)
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
Subject: [PATCH RESEND v5 13/26] hw/core/cpu: Return static value with gdb_arch_name()
Date: Fri, 18 Aug 2023 12:36:32 +0900
Message-ID: <20230818033648.8326-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818033648.8326-1-akihiko.odaki@daynix.com>
References: <20230818033648.8326-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: RlplWvOH9bnR

All implementations of gdb_arch_name() returns dynamic duplicates of
static strings. It's also unlikely that there will be an implementation
of gdb_arch_name() that returns a truly dynamic value due to the nature
of the function returning a well-known identifiers. Qualify the value
gdb_arch_name() with const and make all of its implementations return
static strings.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
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
index 84219c1885..09f1aca624 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -165,7 +165,7 @@ struct CPUClass {
     vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
 
     const GDBFeature *gdb_core_feature;
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
index ee6b8b98c8..5656a44970 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -378,11 +378,9 @@ static const char *get_feature_xml(const char *p, const char **newp,
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
             pstrcat(buf, buf_sz, cc->gdb_core_feature->xmlname);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a206ab6b1b..5f07133419 100644
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
index 9c2a226159..65f84bfb18 100644
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
index 069410985f..c1a7667f4a 100644
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
index b204cb279d..6c76d14e43 100644
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
index 70cac919e0..dbdee7d56e 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -572,12 +572,12 @@ static int gdb_set_vsx_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
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
index ceca40cdd9..86a477bfc0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1941,17 +1941,17 @@ static Property riscv_cpu_properties[] = {
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
index 2a2ff8cbdc..ca356c2b86 100644
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
2.41.0
