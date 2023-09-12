Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1835022ejx;
        Mon, 11 Sep 2023 23:58:37 -0700 (PDT)
X-Received: by 2002:a17:902:a9c2:b0:1c1:d4f4:cd3c with SMTP id b2-20020a170902a9c200b001c1d4f4cd3cmr9164647plr.31.1694501917309;
        Mon, 11 Sep 2023 23:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694501917; cv=none;
        d=google.com; s=arc-20160816;
        b=odMn1UkALXlOq21Jw0MijrMr5qkoEiKy4ZExdnDVgWkQR7zurhHS8cTFbfgb61HNve
         5qHdqMXYRrzAtYWYjHUSRALUr2PQP3vKO7q5ewgA6/Q0vSDu1dYslV/7zem0CBaQbBt5
         LXCruqQinbEytURibYo1YHXThDlTWUX+rU4j/Lup6rHXaX+e3mxnH5BhnEV6d/G992px
         BebN7jhoteLf/r+DF3VBP2Qz+KcTJqJd/AHxkth6aOSuspuCNnLKVNlheVAkRfAA5Tm0
         vUpwU/9PwxpDQc2GnzK0aODcS0E9m6yDb9atuhVqbQ2zg22fOKjm/wXsMhATqOYU/RZC
         yFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XaH1p6td5igBD+rwAYNP4i5cRkpL7NUdBgICYmg3X1o=;
        fh=WB1Lmlsi6yj5p/5Afm/5MCxt7zqXsfHM6nX4FW1wA/w=;
        b=mS2AQsahXh0tmTUzQx/sKeeBZ/hI0ZeHsqoIvsVVxGrxvPL8UHmwUXns6BMzFxNb6r
         1sOtReBl4Hy0Oz2JTJK4qDljlZKxK9TyOKQL5VUOVFHbor/9aS91HbSUru2YJlBEXgfO
         m5mFud305jxfBae/T7d1n/8vzY6SsB3f7EAHc9JX6sefqhy53nLkOMColoRPs6cFfkH+
         8FlFeteszMvZrgUfvsMOvxqh5LvcGC0cV0KY7AOvOIF+aNA0Wt1N5+QPXoxaRpkA2J52
         oLM55bACTEkLf3zjfKT7cuVdhhv8Xz3rZYjW+1sPVtjvGPhabYqf8LMUonwAissL3zJO
         XSEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=uKuZNukw;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i11-20020a170902e48b00b001bf0b29d912sor5232753ple.1.2023.09.11.23.58.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Sep 2023 23:58:37 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=uKuZNukw;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694501916; x=1695106716; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaH1p6td5igBD+rwAYNP4i5cRkpL7NUdBgICYmg3X1o=;
        b=uKuZNukwIK2mq22CWODIxxOS4Q97Zxs0GH7Gga2pB7in9fgfftF2sByK6iufizL6RZ
         glNRSWWKQdxZS1D0aoI9mbzWsSfgx20ZK9mLnV7bPjDTgeRHYVi7b792ziBTgxlH/4Oz
         xBsDGYJn2FQ42DF6+KmbZ5HzPavBeerszl3QalPf+Rd1LmRxTn5o8T9G8c5U03XOIgc7
         Q9f8aOQAhDW7Mml8b3UgiX09EajZYWvJ1uFnMyqYcWax4ESf8A/e2rhR413KV4sk0NA2
         CDp/hrEji2uxoyKzhMkTaSmNWjsXB+1kt2QDnAouDwdFDQMPrFXQvw5MyTsbgGZg0W8i
         qd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694501916; x=1695106716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaH1p6td5igBD+rwAYNP4i5cRkpL7NUdBgICYmg3X1o=;
        b=jr1q41wnOutCriJYlUObPdRi7sQ+BxbDDZqnUGqpaEcK8y4m9gdAeGw3y/BcOjwJSO
         YX4ozkS31mAdX4/gI+C58SCdpplGD3s54iLRIarO0OiMjlgLM8B4EtZSXbsEnep9/ipY
         xRFndO+wYjZwu6MGTvv33saZFNbTS7VEJTg29mu+OM8ivn0dof5GflJfE7ymqUVoWbU7
         ikbkm9YkLxGBRm0mtZ0r5YWTdSGnrS4J9WKxFww86xQSFpQ0wbbDana81exSBUCEqDJO
         AOyKM92hLDmCERsg131FpZvNczLtrGezkgqwusM8Hj3bmAKWG8Qf/HH1iIkkxuJM7r4l
         z01g==
X-Gm-Message-State: AOJu0YwVt9IhAFqhOQyqm1mVzgvZ7dpzE5fIiUawfls++hHALmM9Or5N
	IV4Jp4ZTdAQMlBU6SeCMcd63nuSJQrKRjNxgqfM=
X-Google-Smtp-Source: AGHT+IEnjhjFdWuEbSi5GgA5MA2TboEgZIKXEeA1FFazX0X7GpuZPRgCXfG4mWnmMpexRB4DwEnJzg==
X-Received: by 2002:a17:90a:dd81:b0:268:2543:723 with SMTP id l1-20020a17090add8100b0026825430723mr9337806pjv.5.1694501916676;
        Mon, 11 Sep 2023 23:58:36 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090a2ac800b002696aeb72e5sm9315058pjg.2.2023.09.11.23.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 23:58:36 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikhail Tyutin <m.tyutin@yadro.com>,
	Aleksandr Anenkov <a.anenkov@yadro.com>,
	qemu-devel@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
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
Subject: [PATCH v2 06/11] hw/core/cpu: Return static value with gdb_arch_name()
Date: Tue, 12 Sep 2023 15:58:01 +0900
Message-ID: <20230912065811.27796-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230912065811.27796-1-akihiko.odaki@daynix.com>
References: <20230912065811.27796-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dBMwkyIvFKzA

All implementations of gdb_arch_name() returns dynamic duplicates of
static strings. It's also unlikely that there will be an implementation
of gdb_arch_name() that returns a truly dynamic value due to the nature
of the function returning a well-known identifiers. Qualify the value
gdb_arch_name() with const and make all of its implementations return
static strings.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-By: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/core/cpu.h  | 2 +-
 target/ppc/internal.h  | 2 +-
 gdbstub/gdbstub.c      | 3 +--
 target/arm/cpu.c       | 6 +++---
 target/arm/cpu64.c     | 4 ++--
 target/i386/cpu.c      | 6 +++---
 target/loongarch/cpu.c | 8 ++++----
 target/ppc/gdbstub.c   | 6 +++---
 target/riscv/cpu.c     | 6 +++---
 target/s390x/cpu.c     | 4 ++--
 target/tricore/cpu.c   | 4 ++--
 11 files changed, 25 insertions(+), 26 deletions(-)

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
index 12f4d07046..9db4af41c1 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -380,10 +380,9 @@ static const char *get_feature_xml(const char *p, const char **newp,
                             "<target>");
 
             if (cc->gdb_arch_name) {
-                g_autofree gchar *arch = cc->gdb_arch_name(cpu);
                 g_string_append_printf(xml,
                                        "<architecture>%s</architecture>",
-                                       arch);
+                                       cc->gdb_arch_name(cpu));
             }
             g_string_append(xml, "<xi:include href=\"");
             g_string_append(xml, cc->gdb_core_xml_file);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6ff6ff2d55..a13c609249 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2316,15 +2316,15 @@ static Property arm_cpu_properties[] = {
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
index 00f913b638..5678b52472 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5914,12 +5914,12 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
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
index 27fc6e1f33..f88cfa93ce 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -763,9 +763,9 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
 #endif
 }
 
-static gchar *loongarch32_gdb_arch_name(CPUState *cs)
+static const gchar *loongarch32_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("loongarch32");
+    return "loongarch32";
 }
 
 static void loongarch32_cpu_class_init(ObjectClass *c, void *data)
@@ -777,9 +777,9 @@ static void loongarch32_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_arch_name = loongarch32_gdb_arch_name;
 }
 
-static gchar *loongarch64_gdb_arch_name(CPUState *cs)
+static const gchar *loongarch64_gdb_arch_name(CPUState *cs)
 {
-    return g_strdup("loongarch64");
+    return "loongarch64";
 }
 
 static void loongarch64_cpu_class_init(ObjectClass *c, void *data)
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 2ad11510bf..778ef73bd7 100644
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
