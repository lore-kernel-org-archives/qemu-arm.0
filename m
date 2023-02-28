Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5184179ejc;
        Mon, 27 Feb 2023 16:37:35 -0800 (PST)
X-Google-Smtp-Source: AK7set/jtrVf5TIOmWhJxd7Osovyi66nV8A88x/vxLtJ55QbypQYMJgItVoQ6UXt2HIq/rhAg/bs
X-Received: by 2002:ac8:5703:0:b0:3b6:2f31:efc4 with SMTP id 3-20020ac85703000000b003b62f31efc4mr2200558qtw.66.1677544655161;
        Mon, 27 Feb 2023 16:37:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677544655; cv=none;
        d=google.com; s=arc-20160816;
        b=urV5XBU1hpCCA8EQSTkWR5Bkbk4Rr87UWpBwMhadLl5Sa6szbiSPmbtar4vDWwIJzM
         dV9ecQMOE72siAYsxVyvOZv7d0WxWnrC0OG673lKjfJEuY+XlhfV+N5p86dL7mzXcOj7
         s74QqxBiVumXpljs9FyDZ0nmA+VSeUEZcepQqIUkylD9KhRypafzaVxVAYNDzQt0nuwj
         DXWvwLfJz0WygJrTqJsaXUnQ0B8UAL4d7aTVyNkX30b4JctAzGIK3nPZ9ny6WFov3g+D
         uqbX5mPkQhJOH8ISwdngBO+AN1fG2N8m6T1ePFHfP+/rsOIuTUOIrMKSADsNJCQFE1+G
         Ps3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hB69UJs6DFGk5NVC6xvA04dBA1lHgG7I+VN9AFpQB6Q=;
        b=tIQkpNUsuJwwaQftMoqdjdq9OrhF2wfUFCnv8Quo54tlpLQdqK1fJXLlelUVuH38uI
         0ExeC5aYcqlhdMm7SKWFclqvSBMUJA3qvw06DzDwtL6pnheyBbiKrTxXkuW3gltij0MS
         IIMLeWZYqN8r2ZBiORrkPuPd9MYxobfT8iivzZoH4yTEeiPgDG8YSQlISsA+oE5hD/zj
         LOCtmvUWuNxtfx/PxTJoevFGShIR0RBh5/7pZZMaWM49JHEtk0jXqU9NTXtsBNqM49lG
         dqZVXxQYmPVhqYs2LMmJ29CybP97n2UbNgz/DHy+0Hbk6mHGWL4tXxp6oL8lt/vaLEPn
         GFxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M4nHd6R8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020a05622a14cb00b003ba24c325a9si7508761qtx.256.2023.02.27.16.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 16:37:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M4nHd6R8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWnzh-0006Td-UI; Mon, 27 Feb 2023 19:37:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWnzf-0006Sl-Qz
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 19:37:23 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWnze-0001Y4-1O
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 19:37:23 -0500
Received: by mail-pl1-x644.google.com with SMTP id i10so8696614plr.9
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 16:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hB69UJs6DFGk5NVC6xvA04dBA1lHgG7I+VN9AFpQB6Q=;
 b=M4nHd6R8BWQhOYrvrQ5nUXpXx6OfgqNQJ7qzcIVZzvk6JnPNYxVbd7QJxK1eBmQd4H
 DYARK/NUv6f+iqAqgmFZzOozKYUVDmfkr+0fXNUiSjl8hZVtGpDCNQKxWYnkPa8/UH94
 acPvEfFYB+znDsoUeM8EK+jFnD/Es3fhLYFzjA+lTe2e1XQkrAiMtKlPy0f8LS8FGn7M
 Mp/p+FG8iOBWcagT5L0pOdSAw0mAlJ3bgpGiOt71yCLhRfIl8DF4yJMojMbstZRJOoTM
 365oUlLhwbp/FHW2yt5eHSAe/x4vNM/5zPNIn7OQwUpkzB08zzGYvH2VkhX4SnM7y2+A
 Q3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hB69UJs6DFGk5NVC6xvA04dBA1lHgG7I+VN9AFpQB6Q=;
 b=Y1Zh0ddfNlPVaKG+UWnN1W20vnsCM5V+4jhy9z/nV9EToFXzQ6P21ZazAvy/Rv/wg+
 ZRj4ohkbVlqMXPYXvxU0hifeEotkO1soLxZkAhP9uLi4BD+1m5YWFvKf6jqg1dK6bs7z
 0+bMWAKGTMMDMQdFeErBmCJ8d0ieiR+kveCRewuO28bWSEAnxsWdM2km/Ed4FgX+QB/+
 tDLauT4uRq22XJmBBPW9OY10OEYGotjftDi/BhGuf6KsnrpezdovmSGGb2ZnzXt5A2KG
 tcoQ7M/oIbbMKl4LO2/FU88XcZn8VpXWDx+RpvbmH5auKkn0ET2BM0k0zPW9WAMUuKzo
 vsRA==
X-Gm-Message-State: AO0yUKVMwOv/6a0G3G5gd9JhV+UyqZZ0yry+GuMpuXliE7YdlzMIiwQo
 iQjQJHh2Cb7eLxm72F4WK29Ozg==
X-Received: by 2002:a17:903:1c1:b0:19d:20f7:dafa with SMTP id
 e1-20020a17090301c100b0019d20f7dafamr838651plh.43.1677544640562; 
 Mon, 27 Feb 2023 16:37:20 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a1709028a9300b0019cec7d88c3sm5192651plo.236.2023.02.27.16.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 16:37:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 3/3] target/arm: Support reading ZA[] from gdbstub
Date: Mon, 27 Feb 2023 14:37:13 -1000
Message-Id: <20230228003713.861168-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228003713.861168-1-richard.henderson@linaro.org>
References: <20230228003713.861168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
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
X-TUID: Y5h/VCg7I1YQ

Mirror the existing support for SVE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |  1 +
 target/arm/internals.h |  3 ++
 target/arm/gdbstub.c   |  8 ++++
 target/arm/gdbstub64.c | 88 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 100 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6e97a256fb..9971280577 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -869,6 +869,7 @@ struct ArchCPU {
 
     DynamicGDBXMLInfo dyn_sysreg_xml;
     DynamicGDBXMLInfo dyn_svereg_xml;
+    DynamicGDBXMLInfo dyn_zareg_xml;
     DynamicGDBXMLInfo dyn_m_systemreg_xml;
     DynamicGDBXMLInfo dyn_m_secextreg_xml;
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index a03748aa10..a27e5b3f28 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1343,12 +1343,15 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
 
 #ifdef TARGET_AARCH64
 int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
+int arm_gen_dynamic_zareg_xml(CPUState *cpu, int base_reg);
 int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg);
 int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_gdb_set_fpu_reg(CPUARMState *env, uint8_t *buf, int reg);
 int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg);
+int aarch64_gdb_get_za_reg(CPUARMState *env, GByteArray *buf, int reg);
+int aarch64_gdb_set_za_reg(CPUARMState *env, uint8_t *buf, int reg);
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 3f799f5d05..60a9ade732 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -488,6 +488,8 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
         return cpu->dyn_sysreg_xml.desc;
     } else if (strcmp(xmlname, "sve-registers.xml") == 0) {
         return cpu->dyn_svereg_xml.desc;
+    } else if (strcmp(xmlname, "za-registers.xml") == 0) {
+        return cpu->dyn_zareg_xml.desc;
     } else if (strcmp(xmlname, "arm-m-system.xml") == 0) {
         return cpu->dyn_m_systemreg_xml.desc;
 #ifndef CONFIG_USER_ONLY
@@ -524,6 +526,12 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      aarch64_gdb_set_pauth_reg,
                                      4, "aarch64-pauth.xml", 0);
         }
+        if (cpu_isar_feature(aa64_sme, cpu)) {
+            int nreg = arm_gen_dynamic_zareg_xml(cs, cs->gdb_num_regs);
+            gdb_register_coprocessor(cs, aarch64_gdb_get_za_reg,
+                                     aarch64_gdb_set_za_reg, nreg,
+                                     "za-registers.xml", 0);
+        }
 #endif
     } else {
         if (arm_feature(env, ARM_FEATURE_NEON)) {
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 3bee892fb7..9210d12c4e 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -244,6 +244,61 @@ int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
+static int max_svq(ARMCPU *cpu)
+{
+    return 32 - clz32(cpu->sme_vq.map);
+}
+
+int aarch64_gdb_get_za_reg(CPUARMState *env, GByteArray *buf, int reg)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    int max_vq = max_svq(cpu);
+    int cur_vq = EX_TBFLAG_A64(env->hflags, SVL) + 1;
+    int i;
+
+    if (reg >= max_vq * 16) {
+        return 0;
+    }
+
+    /* If ZA is unset, or reg out of range, the contents are zero. */
+    if (FIELD_EX64(env->svcr, SVCR, ZA) && reg < cur_vq * 16) {
+        for (i = 0; i < cur_vq; i++) {
+            gdb_get_reg128(buf, env->zarray[reg].d[i * 2 + 1],
+                           env->zarray[reg].d[i * 2]);
+        }
+    } else {
+        cur_vq = 0;
+    }
+
+    for (i = cur_vq; i < max_vq; i++) {
+        gdb_get_reg128(buf, 0, 0);
+    }
+
+    return max_vq * 16;
+}
+
+int aarch64_gdb_set_za_reg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    uint64_t *p = (uint64_t *) buf;
+    int max_vq = max_svq(cpu);
+    int cur_vq = EX_TBFLAG_A64(env->hflags, SVL) + 1;
+    int i;
+
+    if (reg >= max_vq * 16) {
+        return 0;
+    }
+
+    /* If ZA is unset, or reg out of range, the contents are zero. */
+    if (FIELD_EX64(env->svcr, SVCR, ZA) && reg < cur_vq * 16) {
+        for (i = 0; i < cur_vq; i++) {
+            env->zarray[reg].d[i * 2 + 1] = *p++;
+            env->zarray[reg].d[i * 2 + 0] = *p++;
+        }
+    }
+    return max_vq * 16;
+}
+
 static void output_vector_union_type(GString *s, int reg_width,
                                      const char *name)
 {
@@ -376,3 +431,36 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     info->num = base_reg - orig_base_reg;
     return info->num;
 }
+
+/*
+ * Generate the xml for SME, with matrix size set to the maximum
+ * for the cpu.  Returns the number of registers generated.
+ */
+int arm_gen_dynamic_zareg_xml(CPUState *cs, int base_reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    GString *s = g_string_new(NULL);
+    int vq = max_svq(cpu);
+    int row_count = vq * 16;
+    int row_width = vq * 128;
+    int i;
+
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.qemu.aarch64.za\">");
+
+    output_vector_union_type(s, row_width, "zav");
+
+    for (i = 0; i < row_count; i++) {
+        g_string_append_printf(s,
+                               "<reg name=\"za%d\" bitsize=\"%d\""
+                               " regnum=\"%d\" type=\"zav\"/>",
+                               i, row_width, base_reg + i);
+    }
+
+    g_string_append_printf(s, "</feature>");
+
+    cpu->dyn_zareg_xml.num = row_count;
+    cpu->dyn_zareg_xml.desc = g_string_free(s, false);
+    return row_count;
+}
-- 
2.34.1

