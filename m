Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5053032ejc;
        Mon, 27 Feb 2023 13:34:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8O9iorO+TCgHSO0dtvDU119vqb8Xgh/hpsf1keS5jnp22gGD5BBjVu/mAECz9m9zhTdJ9C
X-Received: by 2002:ac8:580f:0:b0:3bf:aa66:b9e2 with SMTP id g15-20020ac8580f000000b003bfaa66b9e2mr1471124qtg.37.1677533671946;
        Mon, 27 Feb 2023 13:34:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677533671; cv=none;
        d=google.com; s=arc-20160816;
        b=hEl2ygeI1jmhE9cpU7M6Dewh0ONuJu86INIsdePPa9SwiKgQTI2GzBHbiLuBcg23yp
         lfV4UFqjLv6ML4BV0YQ21WqXZludt9xJ6XdsAX7pa2IYKXWmy/6MaGoUaV7vrWYg8EoD
         dksZtYHwxac2UAUDB4zCfLq2pAa+PNJyvzdE0CBshdPgTippnKi5iO7a2eCh27XGoLO9
         k5RFNkDI8DMybg4OI4tKnaofIhzGJdNhkB48Pn4ycAGzaOm/aoy9TNwrfxZi8v5YavAU
         1QQpjJcPyF/WB1vW0WKWPfIr3J2U1q4/wnJCVHFldthPLxvxhmubzK61xSj7ae6ZO9X8
         0PWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sjZqTaUdPrCEIBQBnlQoRyAJsBDKtnJU1VZAEsiRUE4=;
        b=lKe1BmzKaoCYOW2EARSU2GR5m7OKrOiOzq8Nnjng1MlK8QYnJYarVGewdPnBQESTRQ
         4pHSNRCofi39WZFRDzhUVsspuxLnAoXUxXwZAVRjRNN04C/nslFwbtgC/B+jbl7nVhIz
         vl/CAEMyysHXHNGl6nAYy7/oo82J+trSyqTJHjghJ1N0FOWBiwQJhBIMAiItoATpCBhi
         0bpzygESVwJS0rB395P5v+1TA7eSYLtwq7OMI51yXvVgIM3BibPgMPeAqhEA1swxoLEp
         Bj7rFvC1a6JKa0UKEw3P15LGj+lJJblvkYrl/yGywwXXoS2aY3pX/okmN9p1QqNEoTh+
         i8YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AGmsmoIS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d67-20020a376846000000b007064c63b4dcsi6539678qkc.391.2023.02.27.13.34.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 13:34:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AGmsmoIS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWl89-0007Un-PN; Mon, 27 Feb 2023 16:33:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl88-0007Ov-DY
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:56 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl86-0004H1-GN
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:56 -0500
Received: by mail-pj1-x102a.google.com with SMTP id c23so7619938pjo.4
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 13:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjZqTaUdPrCEIBQBnlQoRyAJsBDKtnJU1VZAEsiRUE4=;
 b=AGmsmoIStwnubTaQPLJVr9SjKDLCYaByR1HVjUtVlJAl62uCRuthnVXGYtUTSDTYIZ
 bMPHERD5bkvK5xKW31h817Nuq3wXKy/g+e1SDZoD0LmTnVo/n++cKurRVnfbNWNNyXe+
 knG31lGkHBV9YPAfjhxjd5A9VddOllver+GNXB9C69FOBIQXMy0sVG9DisxwvYoeluEU
 tSkp8Jqu4pK/yuwS+6MQDh2vYhi2U2kmuVaMdQWKlEHisx38slTmiUh1Tt3o926uxQSh
 34+QXfRJHSZep3NI59PN/8V1pQPafFkTB1R7135MNZ5vPl8BkFq6BvRrBpcQCLurgm1l
 lxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sjZqTaUdPrCEIBQBnlQoRyAJsBDKtnJU1VZAEsiRUE4=;
 b=4MSEn0z7/OL41bu/w4iU3SqI7b3+VP3s0Z0VgukwQKQFCLwNdNBYadQkPWsrap2lnZ
 /dT55EZGbs/zOhP7+7AJNWA9zZhLMnpKmRt6Iia0ZIRmpioSvNW3hvgn1QcR+hyGyvCc
 ZarxXqv8XF8rnij3GVVsVoMecFl61PudEqlhDIK5g2dqmGHn+POrSAdAIkqLjhk/RA/A
 lsdNWLmxAdet9MfdNbRvPxh+hdAx83eZhxPWPNWLWWDoU05lc2jb029pk0cCBMViiGyw
 WlWXmYm8vOF9TQZ6vCLl+/ZUPQhA2Zzydn0PBZfU6XVZ0YueyCgE7qAfCDnDkZTFO8sS
 h/ew==
X-Gm-Message-State: AO0yUKUpy1nNM/wZepBkY3udOZ0BMnMi2n2kXTi7GkCX3FCLI9pJNPkI
 eptT0lEdnsnNm+7xV+AyK2NRGg==
X-Received: by 2002:a05:6a20:7f44:b0:bc:5a6:1b2a with SMTP id
 e4-20020a056a207f4400b000bc05a61b2amr658797pzk.49.1677533633683; 
 Mon, 27 Feb 2023 13:33:53 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	David Reiss <dreiss@meta.com>
Subject: [PATCH v3 14/14] target/arm: Implement gdbstub m-profile systemreg
 and secext
Date: Mon, 27 Feb 2023 11:33:29 -1000
Message-Id: <20230227213329.793795-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-TUID: NvFAFBbsOnte

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
 target/arm/gdbstub.c | 178 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 180 insertions(+)

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
index 062c8d447a..3f799f5d05 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -322,6 +322,164 @@ static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
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
+    return 0; /* TODO */
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
+    return 0; /* TODO */
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
@@ -330,6 +488,12 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
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
@@ -389,4 +553,18 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
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

