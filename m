Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1492226wrx;
        Thu, 18 Apr 2019 23:24:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwtm5lVYTtw2wedA0a8xfW+zRLsC/vgBZkMGGiojLHmoBde8hINLx/B8UCYeWua+uqOT1tC
X-Received: by 2002:adf:b64e:: with SMTP id i14mr1684190wre.72.1555655053177;
        Thu, 18 Apr 2019 23:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555655053; cv=none;
        d=google.com; s=arc-20160816;
        b=xr7S/6bU+lGxDb2YQZZFHcPUf+MPgQREjNAU+QAFzzVKDcwZb9CI8gxqQEsXjOAlfU
         o1SgEGUhMYeY6/ykJGA0OJULCSeQz1d244FvGygRCfakC6kI1xDmH1bpi46M6Cwfb5kP
         OPh9Qpyb02jQGY1IpzZmRzGGkccNvcmT4DwqHoo9YPaTSgVK2RwVLBYE2ig70PXOwydz
         JwVZRjcMvt8Zx8/dPPn7xRQBuGb0yVLQWDtsQy9JxTLokfsCwLIqWVAWhVox0Rn9yyjS
         cX0yE0EEJSo71RfGl5YOYdvugZ4lyeplZyuuxW172olLxg4fNwhWurdg/yGV7azQdQnT
         HC3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=2d6qPtCf/+rqqh2D9fH+U7V33KbTIezXWv6TQi48gLM=;
        b=gW0bukSGCXxI0IhDuJwXjluBZq/OEyx1L4UJECe8VlenCxaUNMpU4kYJjk3H3gNN2i
         o7sTRH9K6FYXq3ooQd7QiaIPuymH/rv7ZL6XYZ1uw9JsuVe5/7wKApP22ID9dkGvju47
         0Zd8P7PGdYYq7B+km7qmIye/UNisX5Y3/QxmpPKf8VCrQ/dCi8ssoWnc7NOf4oTwPV7X
         bBQyQ9QygcaSao4dbnFNUxQn4m/mXj47cgwLSGVLIP0ZJ1O3ZhS3F9RtJkPlMtpb/pUH
         nPWzeukdy+ftq9oIBrXYcoDQcnY9gxFaLrO858o6VAdOSkaHbPXOEH3knixM33bU5AbW
         B50w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si3439379wrn.71.2019.04.18.23.24.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 23:24:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHMwW-0004KM-2h
	for alex.bennee@linaro.org; Fri, 19 Apr 2019 02:24:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hHMnf-00063D-KK
	for qemu-devel@nongnu.org; Fri, 19 Apr 2019 02:15:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hHMnd-0005Bc-5I
	for qemu-devel@nongnu.org; Fri, 19 Apr 2019 02:15:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37086)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hHMnW-00058I-GJ; Fri, 19 Apr 2019 02:14:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC9DB30254A3;
	Fri, 19 Apr 2019 06:14:51 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 919675D70D;
	Fri, 19 Apr 2019 06:14:45 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 19 Apr 2019 03:14:28 -0300
Message-Id: <20190419061429.17695-7-ehabkost@redhat.com>
In-Reply-To: <20190419061429.17695-1-ehabkost@redhat.com>
References: <20190419061429.17695-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 19 Apr 2019 06:14:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 6/7] cpu: Set class name format for some
 architectures
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
	Palmer Dabbelt <palmer@sifive.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Stafford Horne <shorne@gmail.com>,
	Richard Henderson <rth@twiddle.net>, qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Knek5KJdGcyA

Set CPUClass::class_name_format for 12 architectures that simply
generate a class name using g_strdup_printf(): arm, i386, lm32,
m68k, mips, moxie, openrisc, riscv, s390x, tricore, unicore32,
xtensa.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Aleksandar Markovic <amarkovic@wavecomp.com>
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>
Cc: Anthony Green <green@moxielogic.com>
Cc: Stafford Horne <shorne@gmail.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org
Cc: qemu-s390x@nongnu.org
---
 target/s390x/internal.h   |  1 -
 target/arm/cpu.c          | 17 +----------------
 target/i386/cpu.c         | 11 +----------
 target/lm32/cpu.c         | 17 +----------------
 target/m68k/cpu.c         | 17 +----------------
 target/mips/cpu.c         | 13 +------------
 target/moxie/cpu.c        | 17 +----------------
 target/openrisc/cpu.c     | 17 +----------------
 target/riscv/cpu.c        | 17 +----------------
 target/s390x/cpu.c        |  2 +-
 target/s390x/cpu_models.c | 10 ----------
 target/tricore/cpu.c      | 17 +----------------
 target/unicore32/cpu.c    | 17 +----------------
 target/xtensa/cpu.c       | 17 +----------------
 14 files changed, 12 insertions(+), 178 deletions(-)

diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index 3b4855c175..789d6444c9 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -256,7 +256,6 @@ static inline void s390_cpu_unhalt(S390CPU *cpu)
 void s390_cpu_model_register_props(Object *obj);
 void s390_cpu_model_class_register_props(ObjectClass *oc);
 void s390_realize_cpu_model(CPUState *cs, Error **errp);
-ObjectClass *s390_cpu_class_by_name(const char *name);
 
 
 /* excp_helper.c */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index dcc65093d9..4f0ed3715d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1208,21 +1208,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     acc->parent_realize(dev, errp);
 }
 
-static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
-{
-    ObjectClass *oc;
-    char *typename;
-
-    typename = g_strdup_printf(ARM_CPU_TYPE_NAME("%s"), cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_ARM_CPU) ||
-        object_class_is_abstract(oc)) {
-        return NULL;
-    }
-    return oc;
-}
-
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
@@ -2142,7 +2127,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     acc->parent_reset = cc->reset;
     cc->reset = arm_cpu_reset;
 
-    cc->class_by_name = arm_cpu_class_by_name;
+    cc->class_name_format = ARM_CPU_TYPE_NAME("%s");
     cc->has_work = arm_cpu_has_work;
     cc->cpu_exec_interrupt = arm_cpu_exec_interrupt;
     cc->dump_state = arm_cpu_dump_state;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index d6bb57d210..18adef524f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1391,15 +1391,6 @@ static char *x86_cpu_type_name(const char *model_name)
     return g_strdup_printf(X86_CPU_TYPE_NAME("%s"), model_name);
 }
 
-static ObjectClass *x86_cpu_class_by_name(const char *cpu_model)
-{
-    ObjectClass *oc;
-    char *typename = x86_cpu_type_name(cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
-    return oc;
-}
-
 static char *x86_cpu_class_get_model_name(X86CPUClass *cc)
 {
     const char *class_name = object_class_get_name(OBJECT_CLASS(cc));
@@ -5851,7 +5842,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->reset = x86_cpu_reset;
     cc->reset_dump_flags = CPU_DUMP_FPU | CPU_DUMP_CCOP;
 
-    cc->class_by_name = x86_cpu_class_by_name;
+    cc->class_name_format = X86_CPU_TYPE_NAME("%s");
     cc->parse_features = x86_cpu_parse_featurestr;
     cc->has_work = x86_cpu_has_work;
 #ifdef CONFIG_TCG
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index b7499cb627..675bea10e8 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -201,21 +201,6 @@ static void lm32_full_cpu_initfn(Object *obj)
                   | LM32_FEATURE_CYCLE_COUNT;
 }
 
-static ObjectClass *lm32_cpu_class_by_name(const char *cpu_model)
-{
-    ObjectClass *oc;
-    char *typename;
-
-    typename = g_strdup_printf(LM32_CPU_TYPE_NAME("%s"), cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
-    if (oc != NULL && (!object_class_dynamic_cast(oc, TYPE_LM32_CPU) ||
-                       object_class_is_abstract(oc))) {
-        oc = NULL;
-    }
-    return oc;
-}
-
 static void lm32_cpu_class_init(ObjectClass *oc, void *data)
 {
     LM32CPUClass *lcc = LM32_CPU_CLASS(oc);
@@ -227,7 +212,7 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
     lcc->parent_reset = cc->reset;
     cc->reset = lm32_cpu_reset;
 
-    cc->class_by_name = lm32_cpu_class_by_name;
+    cc->class_name_format = LM32_CPU_TYPE_NAME("%s");
     cc->has_work = lm32_cpu_has_work;
     cc->do_interrupt = lm32_cpu_do_interrupt;
     cc->cpu_exec_interrupt = lm32_cpu_exec_interrupt;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 582e3a73b3..b582c8d980 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -81,21 +81,6 @@ static void m68k_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 
 /* CPU models */
 
-static ObjectClass *m68k_cpu_class_by_name(const char *cpu_model)
-{
-    ObjectClass *oc;
-    char *typename;
-
-    typename = g_strdup_printf(M68K_CPU_TYPE_NAME("%s"), cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
-    if (oc != NULL && (object_class_dynamic_cast(oc, TYPE_M68K_CPU) == NULL ||
-                       object_class_is_abstract(oc))) {
-        return NULL;
-    }
-    return oc;
-}
-
 static void m5206_cpu_initfn(Object *obj)
 {
     M68kCPU *cpu = M68K_CPU(obj);
@@ -261,7 +246,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     mcc->parent_reset = cc->reset;
     cc->reset = m68k_cpu_reset;
 
-    cc->class_by_name = m68k_cpu_class_by_name;
+    cc->class_name_format = M68K_CPU_TYPE_NAME("%s");
     cc->has_work = m68k_cpu_has_work;
     cc->do_interrupt = m68k_cpu_do_interrupt;
     cc->cpu_exec_interrupt = m68k_cpu_exec_interrupt;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index e217fb3e36..c3b30f5562 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -166,17 +166,6 @@ static char *mips_cpu_type_name(const char *cpu_model)
     return g_strdup_printf(MIPS_CPU_TYPE_NAME("%s"), cpu_model);
 }
 
-static ObjectClass *mips_cpu_class_by_name(const char *cpu_model)
-{
-    ObjectClass *oc;
-    char *typename;
-
-    typename = mips_cpu_type_name(cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
-    return oc;
-}
-
 static void mips_cpu_class_init(ObjectClass *c, void *data)
 {
     MIPSCPUClass *mcc = MIPS_CPU_CLASS(c);
@@ -188,7 +177,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     mcc->parent_reset = cc->reset;
     cc->reset = mips_cpu_reset;
 
-    cc->class_by_name = mips_cpu_class_by_name;
+    cc->class_name_format = MIPS_CPU_TYPE_NAME("%s");
     cc->has_work = mips_cpu_has_work;
     cc->do_interrupt = mips_cpu_do_interrupt;
     cc->cpu_exec_interrupt = mips_cpu_exec_interrupt;
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 46434e65ba..8e7768e576 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -80,21 +80,6 @@ static void moxie_cpu_initfn(Object *obj)
     cs->env_ptr = &cpu->env;
 }
 
-static ObjectClass *moxie_cpu_class_by_name(const char *cpu_model)
-{
-    ObjectClass *oc;
-    char *typename;
-
-    typename = g_strdup_printf(MOXIE_CPU_TYPE_NAME("%s"), cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
-    if (oc != NULL && (!object_class_dynamic_cast(oc, TYPE_MOXIE_CPU) ||
-                       object_class_is_abstract(oc))) {
-        return NULL;
-    }
-    return oc;
-}
-
 static void moxie_cpu_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -106,7 +91,7 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
     mcc->parent_reset = cc->reset;
     cc->reset = moxie_cpu_reset;
 
-    cc->class_by_name = moxie_cpu_class_by_name;
+    cc->class_name_format = MOXIE_CPU_TYPE_NAME("%s");
 
     cc->has_work = moxie_cpu_has_work;
     cc->do_interrupt = moxie_cpu_do_interrupt;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 541b2a66c7..f78b5a2cd8 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -99,21 +99,6 @@ static void openrisc_cpu_initfn(Object *obj)
 
 /* CPU models */
 
-static ObjectClass *openrisc_cpu_class_by_name(const char *cpu_model)
-{
-    ObjectClass *oc;
-    char *typename;
-
-    typename = g_strdup_printf(OPENRISC_CPU_TYPE_NAME("%s"), cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
-    if (oc != NULL && (!object_class_dynamic_cast(oc, TYPE_OPENRISC_CPU) ||
-                       object_class_is_abstract(oc))) {
-        return NULL;
-    }
-    return oc;
-}
-
 static void or1200_initfn(Object *obj)
 {
     OpenRISCCPU *cpu = OPENRISC_CPU(obj);
@@ -140,7 +125,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     occ->parent_reset = cc->reset;
     cc->reset = openrisc_cpu_reset;
 
-    cc->class_by_name = openrisc_cpu_class_by_name;
+    cc->class_name_format = OPENRISC_CPU_TYPE_NAME("%s");
     cc->has_work = openrisc_cpu_has_work;
     cc->do_interrupt = openrisc_cpu_do_interrupt;
     cc->cpu_exec_interrupt = openrisc_cpu_exec_interrupt;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5e97a83c80..7bd32966bc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -175,21 +175,6 @@ static void rv64imacu_nommu_cpu_init(Object *obj)
 
 #endif
 
-static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
-{
-    ObjectClass *oc;
-    char *typename;
-
-    typename = g_strdup_printf(RISCV_CPU_TYPE_NAME("%s"), cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_RISCV_CPU) ||
-        object_class_is_abstract(oc)) {
-        return NULL;
-    }
-    return oc;
-}
-
 static void riscv_cpu_dump_state(CPUState *cs, FILE *f,
     fprintf_function cpu_fprintf, int flags)
 {
@@ -335,7 +320,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     mcc->parent_reset = cc->reset;
     cc->reset = riscv_cpu_reset;
 
-    cc->class_by_name = riscv_cpu_class_by_name;
+    cc->class_name_format = RISCV_CPU_TYPE_NAME("%s");
     cc->has_work = riscv_cpu_has_work;
     cc->do_interrupt = riscv_cpu_do_interrupt;
     cc->cpu_exec_interrupt = riscv_cpu_exec_interrupt;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 698dd9cb82..4ecd3f60be 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -461,7 +461,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     scc->cpu_reset = s390_cpu_reset;
     scc->initial_cpu_reset = s390_cpu_initial_reset;
     cc->reset = s390_cpu_full_reset;
-    cc->class_by_name = s390_cpu_class_by_name,
+    cc->class_name_format = S390_CPU_TYPE_NAME("%s");
     cc->has_work = s390_cpu_has_work;
 #ifdef CONFIG_TCG
     cc->do_interrupt = s390_cpu_do_interrupt;
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 391698595f..fa248c5b3f 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -1278,16 +1278,6 @@ static char *s390_base_cpu_type_name(const char *model_name)
     return g_strdup_printf(S390_CPU_TYPE_NAME("%s-base"), model_name);
 }
 
-ObjectClass *s390_cpu_class_by_name(const char *name)
-{
-    char *typename = s390_cpu_type_name(name);
-    ObjectClass *oc;
-
-    oc = object_class_by_name(typename);
-    g_free(typename);
-    return oc;
-}
-
 static const TypeInfo qemu_s390_cpu_type_info = {
     .name = S390_CPU_TYPE_NAME("qemu"),
     .parent = TYPE_S390_CPU,
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index e8d37e4040..81460f6aed 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -111,21 +111,6 @@ static void tricore_cpu_initfn(Object *obj)
     cs->env_ptr = env;
 }
 
-static ObjectClass *tricore_cpu_class_by_name(const char *cpu_model)
-{
-    ObjectClass *oc;
-    char *typename;
-
-    typename = g_strdup_printf(TRICORE_CPU_TYPE_NAME("%s"), cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_TRICORE_CPU) ||
-        object_class_is_abstract(oc)) {
-        return NULL;
-    }
-    return oc;
-}
-
 static void tc1796_initfn(Object *obj)
 {
     TriCoreCPU *cpu = TRICORE_CPU(obj);
@@ -158,7 +143,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
 
     mcc->parent_reset = cc->reset;
     cc->reset = tricore_cpu_reset;
-    cc->class_by_name = tricore_cpu_class_by_name;
+    cc->class_name_format = TRICORE_CPU_TYPE_NAME("%s");
     cc->has_work = tricore_cpu_has_work;
 
     cc->dump_state = tricore_cpu_dump_state;
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 2b49d1ca40..f7b3dd2bb1 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -40,21 +40,6 @@ static inline void set_feature(CPUUniCore32State *env, int feature)
 
 /* CPU models */
 
-static ObjectClass *uc32_cpu_class_by_name(const char *cpu_model)
-{
-    ObjectClass *oc;
-    char *typename;
-
-    typename = g_strdup_printf(UNICORE32_CPU_TYPE_NAME("%s"), cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
-    if (oc != NULL && (!object_class_dynamic_cast(oc, TYPE_UNICORE32_CPU) ||
-                       object_class_is_abstract(oc))) {
-        oc = NULL;
-    }
-    return oc;
-}
-
 static void unicore_ii_cpu_initfn(Object *obj)
 {
     UniCore32CPU *cpu = UNICORE32_CPU(obj);
@@ -132,7 +117,7 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_realize(dc, uc32_cpu_realizefn,
                                     &ucc->parent_realize);
 
-    cc->class_by_name = uc32_cpu_class_by_name;
+    cc->class_name_format = UNICORE32_CPU_TYPE_NAME("%s");
     cc->has_work = uc32_cpu_has_work;
     cc->do_interrupt = uc32_cpu_do_interrupt;
     cc->cpu_exec_interrupt = uc32_cpu_exec_interrupt;
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index a54dbe4260..2278a46989 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -90,21 +90,6 @@ static void xtensa_cpu_reset(CPUState *s)
 #endif
 }
 
-static ObjectClass *xtensa_cpu_class_by_name(const char *cpu_model)
-{
-    ObjectClass *oc;
-    char *typename;
-
-    typename = g_strdup_printf(XTENSA_CPU_TYPE_NAME("%s"), cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
-    if (oc == NULL || !object_class_dynamic_cast(oc, TYPE_XTENSA_CPU) ||
-        object_class_is_abstract(oc)) {
-        return NULL;
-    }
-    return oc;
-}
-
 static void xtensa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 {
     XtensaCPU *cpu = XTENSA_CPU(cs);
@@ -172,7 +157,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     xcc->parent_reset = cc->reset;
     cc->reset = xtensa_cpu_reset;
 
-    cc->class_by_name = xtensa_cpu_class_by_name;
+    cc->class_name_format = XTENSA_CPU_TYPE_NAME("%s");
     cc->has_work = xtensa_cpu_has_work;
     cc->do_interrupt = xtensa_cpu_do_interrupt;
     cc->cpu_exec_interrupt = xtensa_cpu_exec_interrupt;
-- 
2.18.0.rc1.1.g3f1ff2140

