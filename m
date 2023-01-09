Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1897775ejb;
        Fri, 3 Feb 2023 16:34:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+92tdCxph2BYAd1Rb9+fuTk132hTWcBklj7XqKpVHIIIIdux/8Yc+yHOEqXm6MRLISL57I
X-Received: by 2002:a05:6214:4018:b0:56b:1f26:abe7 with SMTP id kd24-20020a056214401800b0056b1f26abe7mr3523659qvb.9.1675470897183;
        Fri, 03 Feb 2023 16:34:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675470897; cv=none;
        d=google.com; s=arc-20160816;
        b=lbroZD/wL4OOliefZLImPlrYLWtS8/eLGV2FrwHz/EuEFlW7+nNstE307fDuICLsd2
         w03EHGbSVO8Na19sz3rjmlnLrlogt5S1TA2vA18VYzA8S5I86zIQK+rihGiKL7Wvy3Ah
         75asCTaFbuvJ/+KO+vfgWgEqJVV/V0SlSlcokJ+7RV1OOiejTGs9pLKO4bfgeboxMpwQ
         mj315q905fI/3JjZV3fvZP6LswbN/saYbmqSME7BeeliGS83udRxMHKg8svlbbs69yoN
         LqVxORW5EcFUiLE44t6XVvBSWEZjk1C/ZoyPsueZy8C6F9/5Wti88b8ZzzSnoFt991zk
         m1Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=8Kl9tOzXqUeP7RukGP1Bgbl47PDocMbUKgA4le2xcts=;
        b=wA6z7SW3XigUUVh390mNf0pVnmmJA5jTArap3YSx6OLR956FpnTlBvNQhb5/1Il5Ua
         ChYrWYQRuCXgm+vLxWR+u5d/Thij8JWU4oTBkBdeyhrkQAGO3Dhd/DBNPniUPgHlG7GB
         Vk3WiWQSpIcuHRZQkGuGxNtVY84dS0qNwzLKTLLARuSouMoD1KDJ9FeVOvIDtjWxwpJm
         QSvGO0AiLRcWARu1f0s6042xyio0iqSB6LEPvFaYQmx7uCBQL3FYL5vjNQ/N4M/gWXyG
         lEzaVfhfiqKEelgQBws9HxFHGhYwmWP5ODnwprmp/8uizQhPP9f8RtF4VDnsrrtWu09N
         2jrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11-20020a0ce08b000000b0056ab7e3e19fsi1239288qvk.25.2023.02.03.16.34.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 16:34:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pO6Vd-0005b4-Ex; Fri, 03 Feb 2023 19:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pO6Va-0005Yw-SC; Fri, 03 Feb 2023 19:34:23 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pO6VY-0003rB-Ug; Fri, 03 Feb 2023 19:34:22 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id C988611F050;
 Sat,  4 Feb 2023 00:34:17 +0000 (UTC)
From: ~dreiss-meta <dreiss-meta@git.sr.ht>
Date: Mon, 09 Jan 2023 15:05:21 -0800
Subject: [PATCH qemu v3 1/2] target/arm/gdbstub: Support reading M system
 registers from GDB
Message-ID: <167547085745.18032.9674021893886143814-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <167547085745.18032.9674021893886143814-0@git.sr.ht>
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
Reply-To: ~dreiss-meta <dreiss@meta.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vqwQvvWT7A9D

From: David Reiss <dreiss@meta.com>

Follows a fairly similar pattern to the existing special register debug
support.  Only reading is implemented, but it should be possible to
implement writes.

`v7m_mrs_control` was renamed `arm_v7m_mrs_control` and made
non-static so this logic could be shared between the MRS instruction and
the GDB stub.

Signed-off-by: David Reiss <dreiss@meta.com>
---
 target/arm/cpu.h         |  12 +++-
 target/arm/gdbstub.c     | 125 +++++++++++++++++++++++++++++++++++++++
 target/arm/m_helper.c    |   6 +-
 tests/lcitool/libvirt-ci |   2 +-
 4 files changed, 139 insertions(+), 6 deletions(-)

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
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 319a534c22..e3eb28cf2e 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 319a534c220f53fc8670254cac25d6f662c82112
+Subproject commit e3eb28cf2e17fbcf7fe7e19505ee432b8ec5bbb5
--=20
2.34.5

