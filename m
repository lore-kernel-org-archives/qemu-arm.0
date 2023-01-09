Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5602098ejb;
        Tue, 7 Feb 2023 09:38:23 -0800 (PST)
X-Google-Smtp-Source: AK7set8dfStQApPxLgjiPSLY/IpWDQ5sdSGVh3hGpNsGRk6hWoVpUkWP3BmRl+Sa3OVngE8tY6qb
X-Received: by 2002:a05:6214:da1:b0:53d:9f65:148f with SMTP id h1-20020a0562140da100b0053d9f65148fmr6414931qvh.14.1675791503216;
        Tue, 07 Feb 2023 09:38:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675791503; cv=none;
        d=google.com; s=arc-20160816;
        b=ZNZ1gg1RJdp11XA2tz2RQhoKyHlyRAILbUw38l82W2n/NdlMiKsKaCjRkx1fmzJeM0
         bAXQMxBAGjag3wytMvN3CK4QXW0I5d/sjmYR2+nsVPZqILYlg049NjXLnnjnzKzozy55
         UIlD8DYhv3UNPaMRMXR2bAuylSslqmI4koGR7yAxI4J45tDkuOfqbekQSWBIEu6U9x6+
         r1VXyT7ROyn1ltD7JTQFI3PJ5GLlMdhxCbjjs4BnnHImYLtG+Ksl1sQmp8Kbw8vVddCx
         WHQb9kWyH4jYJi7lQ9sMbpbHi+KluQCB9sZBKi+lzfXB5i0XG8azcoX/t7D+SYaW1ywi
         PX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=ICQeOBq1jWjJqnwGNVZHOfJxqTZqDwj+ttEowD5wX1Y=;
        b=lJRb1mlGO0TNzoC+2eDxSVNLqDgFHDtbsQvfJMDlu89/NzgEunX4UI/LBiIVTmp/5D
         1El078y+JuM0S/3XGCi8AupqKnmi9xxYl8lxhdZWvRHpxiPRAdfwQqt+XoRpuyzjaDsD
         irwTW5M535jNhMO5FPj2WRVQbQ1u05lY4pFrl4x7q41BCX3sE+20qnJuFs87bflQJ2FW
         qF2tJvvkS5USIgf2VW4yIN8wW2TDD8KmXdt9+tdwRC8tKvv1GZwFI4tQHZ1TMo65UaNm
         IgoLndifRQ7iYuRukiALsqfzIKKnNF48piPAqEIonVqyD84EzfidizOqls6oGc/5ytLB
         59kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v186-20020a37dcc3000000b007198ab38e95si10981333qki.634.2023.02.07.09.38.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 09:38:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRut-0004WU-W4; Tue, 07 Feb 2023 12:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pPRur-0004VA-Rw; Tue, 07 Feb 2023 12:38:01 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pPRup-0004Kv-Br; Tue, 07 Feb 2023 12:38:01 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id A977411EF19;
 Tue,  7 Feb 2023 17:37:57 +0000 (UTC)
From: ~dreiss-meta <dreiss-meta@git.sr.ht>
Date: Mon, 09 Jan 2023 15:05:21 -0800
Subject: [PATCH qemu v4 1/2] target/arm/gdbstub: Support reading M system
 registers from GDB
Message-ID: <167579147730.28776.7263330829354840538-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <167579147730.28776.7263330829354840538-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: ~dreiss-meta <dreiss@meta.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lTLLy94w8gXi

From: David Reiss <dreiss@meta.com>

Follows a fairly similar pattern to the existing special register debug
support.  Only reading is implemented, but it should be possible to
implement writes.

`v7m_mrs_control` was renamed `arm_v7m_mrs_control` and made
non-static so this logic could be shared between the MRS instruction and
the GDB stub.

Signed-off-by: David Reiss <dreiss@meta.com>
---
 target/arm/cpu.h      |  12 +++-
 target/arm/gdbstub.c  | 125 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/m_helper.c |   6 +-
 3 files changed, 138 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7bc97fece9..2ba64811a0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -867,6 +867,7 @@ struct ArchCPU {
=20
     DynamicGDBXMLInfo dyn_sysreg_xml;
     DynamicGDBXMLInfo dyn_svereg_xml;
+    DynamicGDBXMLInfo dyn_m_systemreg_xml;
=20
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
@@ -1111,11 +1112,13 @@ int arm_cpu_gdb_read_register(CPUState *cpu, GByteArr=
ay *buf, int reg);
 int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
=20
 /*
- * Helpers to dynamically generates XML descriptions of the sysregs
- * and SVE registers. Returns the number of registers in each set.
+ * Helpers to dynamically generate XML descriptions of the sysregs,
+ * SVE registers, and M-profile system registers.
+ * Returns the number of registers in each set.
  */
 int arm_gen_dynamic_sysreg_xml(CPUState *cpu, int base_reg);
 int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
+int arm_gen_dynamic_m_systemreg_xml(CPUState *cpu, int base_reg);
=20
 /* Returns the dynamically generated XML for the gdb stub.
  * Returns a pointer to the XML contents for the specified XML file or NULL
@@ -1507,6 +1510,11 @@ FIELD(SVCR, ZA, 1, 1)
 FIELD(SMCR, LEN, 0, 4)
 FIELD(SMCR, FA64, 31, 1)
=20
+/*
+ * Read the CONTROL register as the MRS instruction would.
+ */
+uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure);
+
 /* Write a new value to v7m.exception, thus transitioning into or out
  * of Handler mode; this may result in a change of active stack pointer.
  */
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 2f806512d0..2780a089ec 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -322,6 +322,121 @@ int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_r=
eg)
     return cpu->dyn_sysreg_xml.num;
 }
=20
+/*
+ * Helper required because g_array_append_val is a macro
+ * that cannot handle string literals.
+ */
+static inline void g_array_append_str_literal(GArray *array, const char *str)
+{
+    g_array_append_val(array, str);
+}
+
+static int arm_gdb_get_m_systemreg(CPUARMState *env, GByteArray *buf, int re=
g)
+{
+    /* NOTE: This implementation shares a lot of logic with v7m_mrs. */
+    switch (reg) {
+
+    /*
+     * NOTE: MSP and PSP technically don't exist if the secure extension
+     * is present (replaced by MSP_S, MSP_NS, PSP_S, PSP_NS).  Similar for
+     * MSPLIM and PSPLIM.
+     * However, the MRS instruction is still allowed to read from MSP and PS=
P,
+     * and will return the value associated with the current security state.
+     * We replicate this behavior for the convenience of users, who will see
+     * GDB behave similarly to their assembly code, even if they are oblivio=
us
+     * to the security extension.
+     */
+    case 0: /* MSP */
+        return gdb_get_reg32(buf,
+            v7m_using_psp(env) ? env->v7m.other_sp : env->regs[13]);
+    case 1: /* PSP */
+        return gdb_get_reg32(buf,
+            v7m_using_psp(env) ? env->regs[13] : env->v7m.other_sp);
+    case 6: /* MSPLIM */
+        if (!arm_feature(env, ARM_FEATURE_V8)) {
+            return 0;
+        }
+        return gdb_get_reg32(buf, env->v7m.msplim[env->v7m.secure]);
+    case 7: /* PSPLIM */
+        if (!arm_feature(env, ARM_FEATURE_V8)) {
+            return 0;
+        }
+        return gdb_get_reg32(buf, env->v7m.psplim[env->v7m.secure]);
+
+    /*
+     * NOTE: PRIMASK, BASEPRI, and FAULTMASK are defined a bit differently
+     * from the SP family, but have similar banking behavior.
+     */
+    case 2: /* PRIMASK */
+        return gdb_get_reg32(buf, env->v7m.primask[env->v7m.secure]);
+    case 3: /* BASEPRI */
+        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            return 0;
+        }
+        return gdb_get_reg32(buf, env->v7m.basepri[env->v7m.secure]);
+    case 4: /* FAULTMASK */
+        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            return 0;
+        }
+        return gdb_get_reg32(buf, env->v7m.faultmask[env->v7m.secure]);
+
+    /*
+     * NOTE: CONTROL has a mix of banked and non-banked bits.  We continue
+     * to emulate the MRS instruction.  Unfortunately, this gives GDB no way
+     * to read the SFPA bit when the CPU is in a non-secure state.
+     */
+    case 5: /* CONTROL */
+        return gdb_get_reg32(buf, arm_v7m_mrs_control(env, env->v7m.secure));
+    }
+
+    return 0;
+}
+
+static int arm_gdb_set_m_systemreg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    /* TODO: Implement. */
+    return 0;
+}
+
+int arm_gen_dynamic_m_systemreg_xml(CPUState *cs, int base_reg)
+{
+    ARMCPU *cpu =3D ARM_CPU(cs);
+    CPUARMState *env =3D &cpu->env;
+    GString *s =3D g_string_new(NULL);
+    DynamicGDBXMLInfo *info =3D &cpu->dyn_m_systemreg_xml;
+    bool is_v8 =3D arm_feature(env, ARM_FEATURE_V8);
+    bool is_main =3D arm_feature(env, ARM_FEATURE_M_MAIN);
+
+    g_string_printf(s, "<?xml version=3D\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=3D\"org.gnu.gdb.arm.m-system\">=
\n");
+
+    g_autoptr(GArray) regs =3D g_array_new(false, true, sizeof(const char *)=
);
+    /* 0 */ g_array_append_str_literal(regs, "msp");
+    /* 1 */ g_array_append_str_literal(regs, "psp");
+    /* 2 */ g_array_append_str_literal(regs, "primask");
+    /* 3 */ g_array_append_str_literal(regs, is_main ? "basepri" : NULL);
+    /* 4 */ g_array_append_str_literal(regs, is_main ? "faultmask" : NULL);
+    /* 5 */ g_array_append_str_literal(regs, "control");
+    /* 6 */ g_array_append_str_literal(regs, is_v8 ? "msplim" : NULL);
+    /* 7 */ g_array_append_str_literal(regs, is_v8 ? "psplim" : NULL);
+
+    for (int idx =3D 0; idx < regs->len; idx++) {
+        const char *name =3D g_array_index(regs, const char *, idx);
+        if (name) {
+            g_string_append_printf(s,
+                        "<reg name=3D\"%s\" bitsize=3D\"32\" regnum=3D\"%d\"=
/>\n",
+                        name, base_reg);
+        }
+        base_reg++;
+    }
+    info->num =3D regs->len;
+
+    g_string_append_printf(s, "</feature>");
+    info->desc =3D g_string_free(s, false);
+    return info->num;
+}
+
 struct TypeSize {
     const char *gdb_type;
     int  size;
@@ -450,6 +565,8 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, const c=
har *xmlname)
         return cpu->dyn_sysreg_xml.desc;
     } else if (strcmp(xmlname, "sve-registers.xml") =3D=3D 0) {
         return cpu->dyn_svereg_xml.desc;
+    } else if (strcmp(xmlname, "arm-m-system.xml") =3D=3D 0) {
+        return cpu->dyn_m_systemreg_xml.desc;
     }
     return NULL;
 }
@@ -493,6 +610,14 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
              */
             gdb_register_coprocessor(cs, vfp_gdb_get_sysreg, vfp_gdb_set_sys=
reg,
                                      2, "arm-vfp-sysregs.xml", 0);
+        } else {
+            /* M-profile coprocessors. */
+            gdb_register_coprocessor(cs,
+                                     arm_gdb_get_m_systemreg,
+                                     arm_gdb_set_m_systemreg,
+                                     arm_gen_dynamic_m_systemreg_xml(
+                                         cs, cs->gdb_num_regs),
+                                     "arm-m-system.xml", 0);
         }
     }
     if (cpu_isar_feature(aa32_mve, cpu)) {
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index e7e746ea18..c20bcac977 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -53,7 +53,7 @@ static uint32_t v7m_mrs_xpsr(CPUARMState *env, uint32_t reg=
, unsigned el)
     return xpsr_read(env) & mask;
 }
=20
-static uint32_t v7m_mrs_control(CPUARMState *env, uint32_t secure)
+uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure)
 {
     uint32_t value =3D env->v7m.control[secure];
=20
@@ -90,7 +90,7 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
     case 0 ... 7: /* xPSR sub-fields */
         return v7m_mrs_xpsr(env, reg, 0);
     case 20: /* CONTROL */
-        return v7m_mrs_control(env, 0);
+        return arm_v7m_mrs_control(env, 0);
     default:
         /* Unprivileged reads others as zero.  */
         return 0;
@@ -2420,7 +2420,7 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
     case 0 ... 7: /* xPSR sub-fields */
         return v7m_mrs_xpsr(env, reg, el);
     case 20: /* CONTROL */
-        return v7m_mrs_control(env, env->v7m.secure);
+        return arm_v7m_mrs_control(env, env->v7m.secure);
     case 0x94: /* CONTROL_NS */
         /*
          * We have to handle this here because unprivileged Secure code
--=20
2.34.5

