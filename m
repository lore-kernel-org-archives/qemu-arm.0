Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2811729ejb;
        Mon, 20 Feb 2023 18:21:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+4jxNUX7wpReii7TFNfjAuVKjBQEHVaN0EI/0118VTMSCOiTZO+zYFjEFD96XH8nX//a40
X-Received: by 2002:a05:6214:29c8:b0:56f:1b7e:d87f with SMTP id gh8-20020a05621429c800b0056f1b7ed87fmr5587280qvb.34.1676946071455;
        Mon, 20 Feb 2023 18:21:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676946071; cv=none;
        d=google.com; s=arc-20160816;
        b=c6jANxyINOIHLQVStP4o3iOrX4zNX9hMCNvxu8IZ+FmA7543N2tDoBuauJoKQ98wxS
         wkl4K2RymwnOY5jcFXgsAP/j1kBat4sMdZqNKYbWjAeHvWaWTYPCYJnM15TH3Q/nZ3Eq
         4PbuzMYSTqDxeOuLEsj2pCy/0dFF6icFZCvN3N1iFqkbDjzjEllMCyUkPrR/PsYs4H3P
         a4euN32yAwgRL8ieFcCdmOx4327DvK9HUl1xrYSxr0x29x8I4fjk2UuLc/8Fni6DZpuu
         qfGvAEnVdLOmatXZXEVxrxLcs2qQDb+aNUAfEheXGAnN+UMnwMnSzPbu/dwLPr2ZGyfN
         gUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=C4PEKitcWEtZp1SVejXeRjs9KFolSy/o7SWCuKGHUqY=;
        b=O2iRo9rLONbORLrORbvCidEMu5FkIN20xErw66tnP9UC/WF6l/e7T1xhyOim9RHDAd
         mJFtSsM4OCZn0+V+pigOrahh8DHYcMsegeQbDequAdfouNQ0BDjUKvfBLCsgNwciO391
         CbWyr5FcTDJMsWE95JP//4831IVPawimEJolw3FTZQPakDkJWhZEscZsxI9Y8qKAYyQe
         XU2FeQz2qhuhXj6xiaF+4Mca4AHt+1GE/YI2de4ETDcSMdi12xepTNG20CrFTzuXciE6
         O+l2FqURTzc0Q0mVw7yTe7U1GHEjmlwO4wKotEE3atXtXt4KRbuVrhAFI33qrxIXQU5j
         BLCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N3NJ6KF/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11-20020a05620a28cb00b0073b9e507487si2262055qkp.553.2023.02.20.18.21.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 18:21:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N3NJ6KF/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUIGd-0001l4-Da; Mon, 20 Feb 2023 21:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGW-0001go-6d
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 21:20:27 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGS-000821-Pp
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 21:20:23 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 nt5-20020a17090b248500b00237161e33f4so1357440pjb.4
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 18:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C4PEKitcWEtZp1SVejXeRjs9KFolSy/o7SWCuKGHUqY=;
 b=N3NJ6KF/Gh2/d861Aetl7rqT0Zky2IIUUjMpRt3v6HM9zOcFxTFAhYSdu18wqJjudF
 GgO1BeNnRfW4BjyXDTvrL8kX9nj1BqHMlSwgF9gmce7g2h0cSmoLaSKA+5DYkAfRZDj3
 kao8lu5EVBLkYbhVIY7kGN8acW8d+bVmoO6AyryW8QB9bqe44bP9f/t9aYfbG3ASEcfg
 WDUWWyG418X1Iqj/NyKMghAGJk10YKTZrHkpPG6zJAo8eEvuaNBnhkl/xFhjmsZJdo00
 yn7FfPVRNYmE5cxcr1bHiK1b5/AkyxFixcAdQLJCPY4Eu+wmsfXKslqjplYL5kQlg1FQ
 NWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C4PEKitcWEtZp1SVejXeRjs9KFolSy/o7SWCuKGHUqY=;
 b=uvGLw1Z1GAB7OeWvl3BmfRQX6yTzDCEO5vLdNW1RBS2ONgnSheGOiJHeRRokImKla2
 bAFkQXYUxvd8uIWYbVsb4eYEZvD1wv0f6UGLxBosPM8XYzdBtGedmHCwM3nJJORzn72j
 enw3eL3zhHl8wRVqIi2S/a3LRkkmWzI/qMS6XTnSnlJ9ZtmPsSTR57MWzPhCEpWfenCR
 w84jUt2EUVR1WDkin3zsH0l6omY3N7ci0Gp5JM5kGRtJQQdsuS4A58R8LKV5VcxSk8sp
 arH77qT96hBGGTKE1M0d8/JoLihGtFyED+WxlK6MHabL8LwUrwJT39jkMILN6C3MhYr/
 7c/w==
X-Gm-Message-State: AO0yUKV95GpR4iSy8j7SM/cf5yLnqOXMGaz4R8/rydmH2cd9MUwDcink
 b7RDEeZvZsJKe4bicjKV7f0Enw==
X-Received: by 2002:a17:903:28c4:b0:19b:e2a:de14 with SMTP id
 kv4-20020a17090328c400b0019b0e2ade14mr2645611plb.6.1676946016371; 
 Mon, 20 Feb 2023 18:20:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:20:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	David Reiss <dreiss@meta.com>
Subject: [PATCH v2 14/14] target/arm: Implement gdbstub m-profile systemreg
 and secext
Date: Mon, 20 Feb 2023 16:19:51 -1000
Message-Id: <20230221021951.453601-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vcCsW5tNmaWe

The upstream gdb xml only implements {MSP,PSP}{,_NS,S}, but
go ahead and implement the other system registers as well.

Since there is significant overlap between the two, implement
them with common code.  The only exception is the systemreg
view of CONTROL, which merges the banked bits as per MRS.

Signed-off-by: David Reiss <dreiss@meta.com>
[rth: Substatial rewrite using enumerator and shared code.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     |   2 +
 target/arm/gdbstub.c | 194 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 196 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 059fe62eaa..6e97a256fb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -869,6 +869,8 @@ struct ArchCPU {
 
     DynamicGDBXMLInfo dyn_sysreg_xml;
     DynamicGDBXMLInfo dyn_svereg_xml;
+    DynamicGDBXMLInfo dyn_m_systemreg_xml;
+    DynamicGDBXMLInfo dyn_m_secextreg_xml;
 
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 062c8d447a..fef53e4ef5 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -322,6 +322,180 @@ static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
     return cpu->dyn_sysreg_xml.num;
 }
 
+typedef enum {
+    M_SYSREG_MSP,
+    M_SYSREG_PSP,
+    M_SYSREG_PRIMASK,
+    M_SYSREG_CONTROL,
+    M_SYSREG_BASEPRI,
+    M_SYSREG_FAULTMASK,
+    M_SYSREG_MSPLIM,
+    M_SYSREG_PSPLIM,
+} MProfileSysreg;
+
+static const struct {
+    const char *name;
+    int feature;
+} m_sysreg_def[] = {
+    [M_SYSREG_MSP] = { "msp", ARM_FEATURE_M },
+    [M_SYSREG_PSP] = { "psp", ARM_FEATURE_M },
+    [M_SYSREG_PRIMASK] = { "primask", ARM_FEATURE_M },
+    [M_SYSREG_CONTROL] = { "control", ARM_FEATURE_M },
+    [M_SYSREG_BASEPRI] = { "basepri", ARM_FEATURE_M_MAIN },
+    [M_SYSREG_FAULTMASK] = { "faultmask", ARM_FEATURE_M_MAIN },
+    [M_SYSREG_MSPLIM] = { "msplim", ARM_FEATURE_V8 },
+    [M_SYSREG_PSPLIM] = { "psplim", ARM_FEATURE_V8 },
+};
+
+static uint32_t *m_sysreg_ptr(CPUARMState *env, MProfileSysreg reg, bool sec)
+{
+    uint32_t *ptr;
+
+    switch (reg) {
+    case M_SYSREG_MSP:
+        ptr = arm_v7m_get_sp_ptr(env, sec, false, true);
+        break;
+    case M_SYSREG_PSP:
+        ptr = arm_v7m_get_sp_ptr(env, sec, true, true);
+        break;
+    case M_SYSREG_MSPLIM:
+        ptr = &env->v7m.msplim[sec];
+        break;
+    case M_SYSREG_PSPLIM:
+        ptr = &env->v7m.psplim[sec];
+        break;
+    case M_SYSREG_PRIMASK:
+        ptr = &env->v7m.primask[sec];
+        break;
+    case M_SYSREG_BASEPRI:
+        ptr = &env->v7m.basepri[sec];
+        break;
+    case M_SYSREG_FAULTMASK:
+        ptr = &env->v7m.faultmask[sec];
+        break;
+    case M_SYSREG_CONTROL:
+        ptr = &env->v7m.control[sec];
+        break;
+    default:
+        return NULL;
+    }
+    return arm_feature(env, m_sysreg_def[reg].feature) ? ptr : NULL;
+}
+
+static int m_sysreg_get(CPUARMState *env, GByteArray *buf,
+                        MProfileSysreg reg, bool secure)
+{
+    uint32_t *ptr = m_sysreg_ptr(env, reg, secure);
+
+    if (ptr == NULL) {
+        return 0;
+    }
+    return gdb_get_reg32(buf, *ptr);
+}
+
+static int m_sysreg_set(CPUARMState *env, uint8_t *buf,
+                        MProfileSysreg reg, bool secure)
+{
+    uint32_t *ptr = m_sysreg_ptr(env, reg, secure);
+
+    if (ptr == NULL) {
+        return 0;
+    }
+    *ptr = ldl_p(buf);
+    return 4;
+}
+
+static int arm_gdb_get_m_systemreg(CPUARMState *env, GByteArray *buf, int reg)
+{
+    /*
+     * Here, we emulate MRS instruction, where CONTROL has a mix of
+     * banked and non-banked bits.
+     */
+    if (reg == M_SYSREG_CONTROL) {
+        return gdb_get_reg32(buf, arm_v7m_mrs_control(env, env->v7m.secure));
+    }
+    return m_sysreg_get(env, buf, reg, env->v7m.secure);
+}
+
+static int arm_gdb_set_m_systemreg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    /* Control is a mix of banked and non-banked bits -- disallow write. */
+    if (reg == M_SYSREG_CONTROL) {
+        return 0;
+    }
+    return m_sysreg_set(env, buf, reg, env->v7m.secure);
+}
+
+static int arm_gen_dynamic_m_systemreg_xml(CPUState *cs, int orig_base_reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    GString *s = g_string_new(NULL);
+    int base_reg = orig_base_reg;
+    int i;
+
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.m-system\">\n");
+
+    for (i = 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
+        if (arm_feature(env, m_sysreg_def[i].feature)) {
+            g_string_append_printf(s,
+                "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
+                m_sysreg_def[i].name, base_reg++);
+        }
+    }
+
+    g_string_append_printf(s, "</feature>");
+    cpu->dyn_m_systemreg_xml.desc = g_string_free(s, false);
+    cpu->dyn_m_systemreg_xml.num = base_reg - orig_base_reg;
+
+    return cpu->dyn_m_systemreg_xml.num;
+}
+
+#ifndef CONFIG_USER_ONLY
+/*
+ * For user-only, we see the non-secure registers via m_systemreg above.
+ * For secext, encode the non-secure view as even and secure view as odd.
+ */
+static int arm_gdb_get_m_secextreg(CPUARMState *env, GByteArray *buf, int reg)
+{
+    return m_sysreg_get(env, buf, reg >> 1, reg & 1);
+}
+
+static int arm_gdb_set_m_secextreg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    return m_sysreg_set(env, buf, reg >> 1, reg & 1);
+}
+
+static int arm_gen_dynamic_m_secextreg_xml(CPUState *cs, int orig_base_reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    GString *s = g_string_new(NULL);
+    int base_reg = orig_base_reg;
+    int i;
+
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.secext\">\n");
+
+    for (i = 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
+        g_string_append_printf(s,
+            "<reg name=\"%s_ns\" bitsize=\"32\" regnum=\"%d\"/>\n",
+            m_sysreg_def[i].name, base_reg++);
+        g_string_append_printf(s,
+            "<reg name=\"%s_s\" bitsize=\"32\" regnum=\"%d\"/>\n",
+            m_sysreg_def[i].name, base_reg++);
+    }
+
+    g_string_append_printf(s, "</feature>");
+    cpu->dyn_m_secextreg_xml.desc = g_string_free(s, false);
+    cpu->dyn_m_secextreg_xml.num = base_reg - orig_base_reg;
+
+    return cpu->dyn_m_secextreg_xml.num;
+}
+#endif
+
 const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -330,6 +504,12 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
         return cpu->dyn_sysreg_xml.desc;
     } else if (strcmp(xmlname, "sve-registers.xml") == 0) {
         return cpu->dyn_svereg_xml.desc;
+    } else if (strcmp(xmlname, "arm-m-system.xml") == 0) {
+        return cpu->dyn_m_systemreg_xml.desc;
+#ifndef CONFIG_USER_ONLY
+    } else if (strcmp(xmlname, "arm-m-secext.xml") == 0) {
+        return cpu->dyn_m_secextreg_xml.desc;
+#endif
     }
     return NULL;
 }
@@ -389,4 +569,18 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                              arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
                              "system-registers.xml", 0);
 
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        gdb_register_coprocessor(cs,
+            arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
+            arm_gen_dynamic_m_systemreg_xml(cs, cs->gdb_num_regs),
+            "arm-m-system.xml", 0);
+#ifndef CONFIG_USER_ONLY
+        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+            gdb_register_coprocessor(cs,
+                arm_gdb_get_m_secextreg, arm_gdb_set_m_secextreg,
+                arm_gen_dynamic_m_secextreg_xml(cs, cs->gdb_num_regs),
+                "arm-m-secext.xml", 0);
+        }
+#endif
+    }
 }
-- 
2.34.1

