Received: by 10.28.71.27 with SMTP id u27csp1332440wma;
        Tue, 13 Feb 2018 06:14:02 -0800 (PST)
X-Google-Smtp-Source: AH8x224p7mTMJg7cj0D4skJ+V1fRZXXfAW79qK6x3BqrGDumkNhNClE99iC89eRYRy0ZGXgz+39M
X-Received: by 10.129.164.79 with SMTP id b76mr755552ywh.382.1518531242371;
        Tue, 13 Feb 2018 06:14:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518531242; cv=none;
        d=google.com; s=arc-20160816;
        b=Xs0y9Z576Rqvb1EoZpBW03YXuQC1jz2PXrDhoE0LOxIv7hB7SAteTuBBHQ5aQ+5LxO
         +gTqS3Zk3GkKY/yg6cSD7SMeLC8R2NEDSmwVDJdykcfJ04WI2jWzTebIKv+JteInjfC4
         ebCKALLTC6TOLp2xr80o4X93aISF0tM6HKYTJdfY7mjub7mcpltwQajO6xbPfoitPLH6
         SdNd/mKfNWhzX0zIJRNkAx8zL9E8Zh9ufJG/e7CRiIj87VSrft7qMtJeirwjkU7x3Tiy
         qAop4G7C9FX06iXMT6hIjTUtYth4sB1+L1PUBma4qFD+UTKEiRRrN9Mufahyw2Q8AHwN
         TaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=8uaJUZT3Z+aC1OWrWo6lq1nJhdcrgZbPs29T2qlddRc=;
        b=qW3s2u4UrocfCBENW1PxB1FhXf6t224+W+qyIMzMK5WZzZJBHR0XVBBMuExcXulEqw
         QXpEgMQPjrAk0wY4V7jEEe2X1fn64W2fwfTZMoRs7SHC6RRgd4txLNwhsi08bGwcFl1x
         AYfITfhUD4RGv5d3VDIM/8ybqdYHV5FfNJ5qNkvZbcL0IYLllfL3tzFEFNKEhfqf6RPD
         Aax6NdKtNZpmh6EJSUZuvTKb/O8yP5y2JnSeoJzJKT0OTO/9hkoWlLQczhVPaCYP5MN5
         caElKl+Su4nb7ImT5fEOY0nUbmv70424ujEvPjoratFZHtDWrWQ7+BjV7gMVLWrtOGLn
         A2zA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c198si1686289ybf.526.2018.02.13.06.14.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Feb 2018 06:14:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37648 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elbLN-00048O-PX
	for alex.bennee@linaro.org; Tue, 13 Feb 2018 09:14:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1elbLD-00044e-8u
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 09:13:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1elbL9-0006JY-W3
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 09:13:51 -0500
Received: from smtp1.lauterbach.com ([62.154.241.196]:53870)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1elbL9-0006J9-Jo
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 09:13:47 -0500
Received: (qmail 8822 invoked by uid 484); 13 Feb 2018 14:13:45 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.052883 secs); 13 Feb 2018 14:13:45 -0000
Received: from unknown (HELO [192.168.187.23])
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with
	ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
	for <qemu-devel@nongnu.org>; 13 Feb 2018 14:13:44 -0000
To: Peter Maydell <peter.maydell@linaro.org>
References: <d23a2730-a103-6336-0658-e12fa9b0193f@lauterbach.com>
	<CAFEAcA-tc+-+KLcMPB=BV0zCmO6t7tuKHM4=kyRf_Xx0aCCidA@mail.gmail.com>
	<2f4fd465-ab3a-d75d-ca91-86417b84ba9c@lauterbach.com>
	<CAFEAcA8ZMjCVgWTVLkExSK78s7yYfUS4iRUq-aLEeSWJnqngCA@mail.gmail.com>
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Message-ID: <2416087f-2096-25cb-d172-a3fe7586bab5@lauterbach.com>
Date: Tue, 13 Feb 2018 15:13:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ZMjCVgWTVLkExSK78s7yYfUS4iRUq-aLEeSWJnqngCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: Re: [Qemu-arm] [PATCH V2] target-arm:Add a dynamic XML-description
 of the cp-registers to GDB
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Khaled Jmal <khaled.jmal@lauterbach.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4noz26COR7cC

[PATCH V2] target-arm:Add a dynamic XML-description of the cp-registers to GDB

This patch offers to GDB the ability to read/write all the coprocessor
registers for ARM and ARM64 by generating dynamically an XML-description for
these registers.

Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
---
Hi Peter,

Thanks for the hints!
This should fix the issue. If no, I'll have to send the patch in a separate thread
using git-send-email command.

Best regards,
Abdallah

 gdbstub.c              | 18 +++++++++++
 include/qom/cpu.h      |  3 ++
 target/arm/cpu.c       |  3 ++
 target/arm/cpu.h       | 18 +++++++++++
 target/arm/gdbstub.c   | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/gdbstub64.c | 25 +++++++++++++++
 target/arm/helper.c    |  3 +-
 7 files changed, 155 insertions(+), 2 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index f1d5148..f54053f 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -670,10 +670,20 @@ static const char *get_feature_xml(const char *p, const char **newp,
                 pstrcat(target_xml, sizeof(target_xml), r->xml);
                 pstrcat(target_xml, sizeof(target_xml), "\"/>");
             }
+            if (cc->has_dynamic_xml) {
+                cc->gen_dynamic_xml(cpu);
+                pstrcat(target_xml, sizeof(target_xml), "<xi:include href=\"");
+                pstrcat(target_xml, sizeof(target_xml), "dynamic_desc.xml");
+                pstrcat(target_xml, sizeof(target_xml), "\"/>");
+            }
             pstrcat(target_xml, sizeof(target_xml), "</target>");
         }
         return target_xml;
     }
+    if (strncmp(p, "dynamic_desc.xml", len) == 0) {
+        CPUState *cpu = first_cpu;
+        return cc->get_dynamic_xml(cpu);
+    }
     for (i = 0; ; i++) {
         name = xml_builtin[i][0];
         if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
@@ -697,6 +707,10 @@ static int gdb_read_register(CPUState *cpu, uint8_t *mem_buf, int reg)
             return r->get_reg(env, mem_buf, reg - r->base_reg);
         }
     }
+
+    if (cc->has_dynamic_xml) {
+        return cc->gdb_read_register(cpu, mem_buf, reg);
+    }
     return 0;
 }
 
@@ -715,6 +729,10 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
             return r->set_reg(env, mem_buf, reg - r->base_reg);
         }
     }
+
+    if (cc->has_dynamic_xml) {
+        return cc->gdb_write_register(cpu, mem_buf, reg);
+    }
     return 0;
 }
 
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 93bd546..a3105c0 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -197,6 +197,9 @@ typedef struct CPUClass {
     const struct VMStateDescription *vmsd;
     const char *gdb_core_xml_file;
     gchar * (*gdb_arch_name)(CPUState *cpu);
+    bool has_dynamic_xml;
+    void (*gen_dynamic_xml)(CPUState *cpu);
+    char *(*get_dynamic_xml)(CPUState *cpu);
 
     void (*cpu_exec_enter)(CPUState *cpu);
     void (*cpu_exec_exit)(CPUState *cpu);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index cc1856c..410e250 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1752,6 +1752,9 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "arm-core.xml";
     cc->gdb_arch_name = arm_gdb_arch_name;
+    cc->has_dynamic_xml = true;
+    cc->gen_dynamic_xml = arm_gen_dynamic_xml;
+    cc->get_dynamic_xml = arm_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
     cc->debug_excp_handler = arm_debug_excp_handler;
     cc->debug_check_watchpoint = arm_debug_check_watchpoint;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9631670..bcb567b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -135,6 +135,19 @@ enum {
    s<2n+1> maps to the most significant half of d<n>
  */
 
+/**
+ * XMLDynamicDescription:
+ * @desc: Contains the XML descriptions.
+ * @num_cpregs: Number of the Coprocessor registers seen by GDB.
+ * @cpregs_keys: Array that contains the corresponding Key of
+ * a given cpreg with the same order of the cpreg in the XML description.
+ */
+typedef struct XMLDynamicDescription {
+    char *desc;
+    int num_cpregs;
+    uint32_t *cpregs_keys;
+} XMLDynamicDescription;
+
 /* CPU state for each instance of a generic timer (in cp15 c14) */
 typedef struct ARMGenericTimer {
     uint64_t cval; /* Timer CompareValue register */
@@ -633,6 +646,8 @@ struct ARMCPU {
     uint64_t *cpreg_vmstate_values;
     int32_t cpreg_vmstate_array_len;
 
+    XMLDynamicDescription dyn_xml;
+
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
     /* GPIO outputs for generic timer */
@@ -797,6 +812,8 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
 
 int arm_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+void arm_gen_dynamic_xml(CPUState *cpu);
+char *arm_get_dynamic_xml(CPUState *cpu);
 
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, void *opaque);
@@ -2005,6 +2022,7 @@ static inline bool cp_access_ok(int current_el,
 
 /* Raw read of a coprocessor register (as needed for migration, etc) */
 uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri);
+void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t v);
 
 /**
  * write_list_to_cpustate
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 04c1208..7cffe87 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -56,6 +56,17 @@ int arm_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
         /* CPSR */
         return gdb_get_reg32(mem_buf, cpsr_read(env));
     }
+    if (n >= cs->gdb_num_regs &&
+        n < cs->gdb_num_regs + cpu->dyn_xml.num_cpregs) {
+        const ARMCPRegInfo *ri;
+        uint32_t key;
+
+        key = cpu->dyn_xml.cpregs_keys[n - cs->gdb_num_regs];
+        ri = get_arm_cp_reginfo(arm_env_get_cpu(env)->cp_regs, key);
+        if (ri) {
+            return gdb_get_reg32(mem_buf, (uint32_t)read_raw_cp_reg(env, ri));
+        }
+    }
     /* Unknown register.  */
     return 0;
 }
@@ -98,6 +109,82 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         cpsr_write(env, tmp, 0xffffffff, CPSRWriteByGDBStub);
         return 4;
     }
+    if (n >= cs->gdb_num_regs &&
+        n < cs->gdb_num_regs + cpu->dyn_xml.num_cpregs) {
+        const ARMCPRegInfo *ri;
+        uint32_t key;
+
+        key = cpu->dyn_xml.cpregs_keys[n - cs->gdb_num_regs];
+        ri = get_arm_cp_reginfo(arm_env_get_cpu(env)->cp_regs, key);
+        if (ri) {
+            if (!(ri->type & ARM_CP_CONST)) {
+                write_raw_cp_reg(env, ri, tmp);
+                return 4;
+            }
+        }
+    }
     /* Unknown register.  */
     return 0;
 }
+
+static void arm_gen_xml_reg(gpointer key, gpointer value, gpointer cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    XMLDynamicDescription *dyn_xml = &cpu->dyn_xml;
+    ARMCPRegInfo *ri = value;
+    uint32_t ri_key = *(uint32_t *)key;
+    CPUARMState *env = &cpu->env;
+    char **target_xml = (char **)&(dyn_xml->desc);
+    char *tmp_xml = *target_xml;
+
+    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
+        if (env->aarch64) {
+            if (cpreg_field_is_64bit(ri)) {
+                *target_xml = g_strconcat(*target_xml,
+                                        "<reg name=\"", ri->name, "\" ",
+                                        "bitsize=\"64\" group=\"cp_regs\"/>",
+                                        NULL);
+            } else {
+                return;
+            }
+        } else {
+            if (ri->secure & ARM_CP_SECSTATE_S) {
+                *target_xml = g_strconcat(*target_xml,
+                                          "<reg name=\"", ri->name, "_S\" ",
+                                          "bitsize=\"32\" group=\"cp_regs\"/>",
+                                          NULL);
+            } else {
+                *target_xml = g_strconcat(*target_xml,
+                                          "<reg name=\"", ri->name, "\" ",
+                                          "bitsize=\"32\" group=\"cp_regs\"/>",
+                                          NULL);
+            }
+        }
+        g_free(tmp_xml);
+        dyn_xml->num_cpregs++;
+        dyn_xml->cpregs_keys = g_renew(uint32_t,
+                                       dyn_xml->cpregs_keys,
+                                       dyn_xml->num_cpregs);
+        dyn_xml->cpregs_keys[dyn_xml->num_cpregs - 1] = ri_key;
+    }
+}
+
+void arm_gen_dynamic_xml(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    cpu->dyn_xml.num_cpregs = 0;
+    cpu->dyn_xml.desc = g_strconcat("<?xml version=\"1.0\"?>",
+                                 "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">",
+                                   "<feature name=\"org.gnu.gdb.dynamic.cp\">",
+                                   NULL);
+    g_hash_table_foreach(cpu->cp_regs, arm_gen_xml_reg, cs);
+    cpu->dyn_xml.desc = g_strconcat(cpu->dyn_xml.desc, "</feature>", NULL);
+}
+
+char *arm_get_dynamic_xml(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    return cpu->dyn_xml.desc;
+}
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 49bc3fc..6cf302f 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -38,6 +38,17 @@ int aarch64_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
     case 33:
         return gdb_get_reg32(mem_buf, pstate_read(env));
     }
+    if (n >= cs->gdb_num_regs &&
+        n < cs->gdb_num_regs + cpu->dyn_xml.num_cpregs) {
+        const ARMCPRegInfo *ri;
+        uint32_t key;
+
+        key = cpu->dyn_xml.cpregs_keys[n - cs->gdb_num_regs];
+        ri = get_arm_cp_reginfo(arm_env_get_cpu(env)->cp_regs, key);
+        if (ri) {
+            return gdb_get_reg64(mem_buf, (uint64_t)read_raw_cp_reg(env, ri));
+        }
+    }
     /* Unknown register.  */
     return 0;
 }
@@ -67,6 +78,20 @@ int aarch64_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         pstate_write(env, tmp);
         return 4;
     }
+    if (n >= cs->gdb_num_regs &&
+        n < cs->gdb_num_regs + cpu->dyn_xml.num_cpregs) {
+        const ARMCPRegInfo *ri;
+        uint32_t key;
+
+        key = cpu->dyn_xml.cpregs_keys[n - cs->gdb_num_regs];
+        ri = get_arm_cp_reginfo(arm_env_get_cpu(env)->cp_regs, key);
+        if (ri) {
+            if (!(ri->type & ARM_CP_CONST)) {
+                write_raw_cp_reg(env, ri, tmp);
+                return 8;
+            }
+        }
+    }
     /* Unknown register.  */
     return 0;
 }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c83c901..223372f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -191,8 +191,7 @@ uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri)
     }
 }
 
-static void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
-                             uint64_t v)
+void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t v)
 {
     /* Raw write of a coprocessor register (as needed for migration, etc).
      * Note that constant registers are treated as write-ignored; the
-- 
1.9.1
