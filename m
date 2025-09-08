Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40321CAC581
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Sep 2025 18:30:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uvgbm-0007yw-IX; Mon, 08 Sep 2025 14:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uvgbj-0007y0-Lk
 for qemu-arm@nongnu.org; Mon, 08 Sep 2025 14:28:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uvgbb-0001B9-72
 for qemu-arm@nongnu.org; Mon, 08 Sep 2025 14:28:51 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588B4e0J011910
 for <qemu-arm@nongnu.org>; Mon, 8 Sep 2025 18:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=z/urZLMPuM4
 d+XgtAOiLTf1NrHdA73jaMLOUSb5buQo=; b=SNgiq1hzmlCuC/AdZe/HnFMbOan
 PVjakUrLPRtRAXULOUQLrxc48fFtQWuY8D4YV9RhW9h/mQMboBuNO3aO3nESzP/h
 zByZiRooy+Up/xeJpaQrgolweYsrqslXlUxHxyHL+T9ZNXA4wlxik/Yl+ydmchEM
 UJgp1W3Iy7Hh0uZW8IgMYICXjsFozen7laU6SiFF2Q2COYd2EZu/RYc6OdJPmRDu
 MAA+SA58iT5zqBMbjREbHewy4hQIglThr60EYGwexIah8UAE2WKA+Jc3Upe0M2dV
 DVqWhMVuv5W1Dd7rJDQNQHEVCTGseikvcTq2Zc8gynWO0oGZR2FhYiYxjSw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdte4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 08 Sep 2025 18:28:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-77243618babso4660676b3a.0
 for <qemu-arm@nongnu.org>; Mon, 08 Sep 2025 11:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757356118; x=1757960918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z/urZLMPuM4d+XgtAOiLTf1NrHdA73jaMLOUSb5buQo=;
 b=HNsgZdHTxgQfL4Man9EX3YKnGMA75W99Kgm4v/HC8vY8WdVpJosLIgZKJNUML3rzEg
 GU4dg47UeITZmt0SRmmGI2RZzsUAUzylBYM6N9sRhcClUnr+j4maHKxCfvaP0Dxzd4Gu
 kmP3jh4fj9rEXGiwMSk2IfM+0wIAc30vlKlB+if+Cit+vVVqhJxoT39DYF0uYQZU67t2
 VNIAXjf0TQFqmvjKOMq5tQ3jVBxfxbRQ5WFt1WB0DO5c5q4dTcL32k+Pv3bBVtwyAQLy
 kA/X36PV8q6+AfU8AX5jkbKg9vYHEwnvxF/MXEwa/zogcK4NCvbpLnfbff583OIOLa6U
 xfZA==
X-Gm-Message-State: AOJu0YxYdWGG7vNsz1ezYLh8mbo3K5tbGTD+mRC7oHHUPYXRmfsoNX94
 Z8el7Nx8mlEgaJ5aH9t7apzeKZTJoeWdlul+WH7uWsHwIuHWnGBR9ZIp0o694wqV8hUJMgkmjDb
 LkJnqwJAyFXOzmRrYE8wjS3+iIBPicTEc9asZa+7TJPZ2mCw40CnWFKo1Lis0SMe+Hw==
X-Gm-Gg: ASbGnctT1lWZRmREt6QiH4v3o8pXpdS7ZB4PXYSxc19sSz7neqT+kWGt5+hKoo4qxW0
 89ApllpDvnhF7cp+eEqgVRnfJy6o5ay6o9oPKplKaVOREoeNdEO2fnZpQzkpSWTAiDA2p0IYbup
 N9NJLesEU4utY0H1ELWvTqb86NdOgH4fR3pmfpIYCJ5eUr7KOiBoxAvDIEF1cuhDmcAi+p1eT8k
 Gk4S8bdv0r7CE/xNdui5sQ9zbHVGhkce+o9bkANby+zrLmRGhpBtS5P4FRHFVQ33ES62ynduLvV
 DDDMz/mOrYJvXxJGq+TNL4izkDS2QJYDqTQDk6xCLUjIdZeQp94kPahV2KH7zcSOrMpxSrZilhx
 LT2HMXPF3U1qnWiU=
X-Received: by 2002:a05:6a20:244b:b0:248:ace6:7561 with SMTP id
 adf61e73a8af0-2533e94fa47mr13495001637.12.1757356118321; 
 Mon, 08 Sep 2025 11:28:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSfLAr7eWdvoqt3cZJv+c9sAbq+7ug3BCTWzjXPTOdJa0nTkB0ED/9L9F9kybe0qrMXDuRmw==
X-Received: by 2002:a05:6a20:244b:b0:248:ace6:7561 with SMTP id
 adf61e73a8af0-2533e94fa47mr13494961637.12.1757356117829; 
 Mon, 08 Sep 2025 11:28:37 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4f9c35f391sm15480164a12.25.2025.09.08.11.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 11:28:37 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v7 2/3] target/arm: Added support for SME register exposure to
 GDB
Date: Mon,  8 Sep 2025 18:28:33 +0000
Message-Id: <20250908182834.2476277-3-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908182834.2476277-1-vacha.bhavsar@oss.qualcomm.com>
References: <20250908182834.2476277-1-vacha.bhavsar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2zNsp-Q157m8XIcmwR1lLsFILzb1DY08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX4K5L75Mg53Mi
 nw1k3+ScglPbGEKtBQpsCzo+cq6Rj7wPmBQ+wBWporIZ2wXXByPiy9RKIhSXngJKTsvwJe+gHdt
 6NblgFZCe/+idLPNbjYz1Oa333QWLmJQz5iCTQ7ZULVs4GL24AEoesyfu53g6gpk3+nt/w7SJdk
 BSK6dOsOo06STxZI3L9g1zt6icelI8KgXiN384Fy2onXTrSuQvtOPjELRCbwHqVkBFYEocvSzBO
 J0LH6oEHvWziDQi3oyJxnNE6++hxlPkXJqCpNrq7toCuHDV1TSl9I6y5YnDcXwioBrJgVDrC8YK
 1k9CJaLKUTGl/S1eEXfQQ4TybhKsV8PyWGcoeTi8M2xCbQkTYGEMmNYYD80kFgIN8bezAGnZDwC
 +5nbFeRl
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68bf2057 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=BgWsvkvSDKOZz1aDhXEA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 2zNsp-Q157m8XIcmwR1lLsFILzb1DY08
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The QEMU GDB stub does not expose the ZA storage SME register to GDB via
the remote serial protocol, which can be a useful functionality to debug SME
code. To provide this functionality in Aarch64 target, this patch registers the
SME register set with the GDB stub. To do so, this patch implements the
aarch64_gdb_get_sme_reg() and aarch64_gdb_set_sme_reg() functions to
specify how to get and set the SME registers, and the
arm_gen_dynamic_smereg_feature() function to generate the target
description in XML format to indicate the target architecture supports SME.
Finally, this patch includes a dyn_smereg_feature structure to hold this
GDB XML description of the SME registers for each CPU.

Note that according to the GDB documentation the ZA register is defined as a
vector of bytes, however the target description xml retrieved when using gdb
natively on a host with SME capabilities represents the ZA register as a vector
of vectors of bytes. To remain consistent with this implementation this patch
also represents the ZA register as a vector of vectors of bytes as is done by
GDB here:
https://github.com/bminor/binutils-gdb/blob/5cce2b7006daa7073b98e3d1a3b176199d1381d7/gdb/features/aarch64-sme.c#L50

Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
---
Changes since v6:
- removed unnecessary comment
- corrected indentation
---
 target/arm/cpu.h       |   1 +
 target/arm/gdbstub.c   |   9 +++-
 target/arm/gdbstub64.c | 119 +++++++++++++++++++++++++++++++++++++++++
 target/arm/internals.h |   3 ++
 4 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c15d79a106..92808c2fe6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -935,6 +935,7 @@ struct ArchCPU {
 
     DynamicGDBFeatureInfo dyn_sysreg_feature;
     DynamicGDBFeatureInfo dyn_svereg_feature;
+    DynamicGDBFeatureInfo dyn_smereg_feature;
     DynamicGDBFeatureInfo dyn_m_systemreg_feature;
     DynamicGDBFeatureInfo dyn_m_secextreg_feature;
 
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index ce4497ad7c..cfde7c3a46 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -527,7 +527,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
          * registers so we don't need to include both.
          */
 #ifdef TARGET_AARCH64
-        if (isar_feature_aa64_sve(&cpu->isar)) {
+        if (isar_feature_aa64_sve(&cpu->isar) || isar_feature_aa64_sme(&cpu->isar)) {
             GDBFeature *feature = arm_gen_dynamic_svereg_feature(cs, cs->gdb_num_regs);
             gdb_register_coprocessor(cs, aarch64_gdb_get_sve_reg,
                                      aarch64_gdb_set_sve_reg, feature, 0);
@@ -537,6 +537,13 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      gdb_find_static_feature("aarch64-fpu.xml"),
                                      0);
         }
+
+        if (isar_feature_aa64_sme(&cpu->isar)) {
+            GDBFeature *sme_feature = arm_gen_dynamic_smereg_feature(cs,
+                                                                     cs->gdb_num_regs);
+            gdb_register_coprocessor(cs, aarch64_gdb_get_sme_reg,
+                                     aarch64_gdb_set_sme_reg, sme_feature, 0);
+        }
         /*
          * Note that we report pauth information via the feature name
          * org.gnu.gdb.aarch64.pauth_v2, not org.gnu.gdb.aarch64.pauth.
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 08e2858539..3bccde2bf2 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -249,6 +249,90 @@ int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg)
     return 0;
 }
 
+int aarch64_gdb_get_sme_reg(CPUState *cs, GByteArray *buf, int reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    switch (reg) {
+    case 0: /* svg register */
+    {
+        int vq = 0;
+        if (FIELD_EX64(env->svcr, SVCR, SM)) {
+            vq = sve_vqm1_for_el_sm(env, arm_current_el(env),
+                                    FIELD_EX64(env->svcr, SVCR, SM)) + 1;
+        }
+        /* svg = vector granules (2 * vector quardwords) in streaming mode */
+        return gdb_get_reg64(buf, vq * 2);
+    }
+    case 1: /* svcr register */
+        return gdb_get_reg64(buf, env->svcr);
+    case 2: /* za register */
+    {
+        int len = 0;
+        int vq = cpu->sme_max_vq;
+        int svl = vq * 16;
+        for (int i = 0; i < svl; i++) {
+            for (int q = 0; q < vq; q++) {
+                len += gdb_get_reg128(buf,
+                                      env->za_state.za[i].d[q * 2 + 1],
+                                      env->za_state.za[i].d[q * 2]);
+            }
+        }
+        return len;
+    }
+    default:
+        /* gdbstub asked for something out of range */
+        qemu_log_mask(LOG_UNIMP, "%s: out of range register %d", __func__, reg);
+        break;
+    }
+
+    return 0;
+}
+
+int aarch64_gdb_set_sme_reg(CPUState *cs, uint8_t *buf, int reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    switch (reg) {
+    case 0: /* svg register */
+        /* cannot set svg via gdbstub */
+        return 8;
+    case 1: /* svcr register */
+        aarch64_set_svcr(env, ldq_le_p(buf),
+                         R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
+        return 8;
+    case 2: /* za register */
+    {
+        int len = 0;
+        int vq = cpu->sme_max_vq;
+        int svl = vq * 16;
+        for (int i = 0; i < svl; i++) {
+            for (int q = 0; q < vq; q++) {
+                if (target_big_endian()) {
+                    env->za_state.za[i].d[q * 2 + 1] = ldq_p(buf);
+                    buf += 8;
+                    env->za_state.za[i].d[q * 2] = ldq_p(buf);
+                } else{
+                    env->za_state.za[i].d[q * 2] = ldq_p(buf);
+                    buf += 8;
+                    env->za_state.za[i].d[q * 2 + 1] = ldq_p(buf);
+                }
+                buf += 8;
+                len += 16;
+            }
+        }
+        return len;
+    }
+    default:
+        /* gdbstub asked for something out of range */
+        break;
+    }
+
+    return 0;
+}
+
 int aarch64_gdb_get_pauth_reg(CPUState *cs, GByteArray *buf, int reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -413,6 +497,41 @@ GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int base_reg)
     return &cpu->dyn_svereg_feature.desc;
 }
 
+GDBFeature *arm_gen_dynamic_smereg_feature(CPUState *cs, int base_reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    int vq = cpu->sme_max_vq;
+    int svl = vq * 16;
+    GDBFeatureBuilder builder;
+    int reg = 0;
+
+    gdb_feature_builder_init(&builder, &cpu->dyn_smereg_feature.desc,
+                             "org.gnu.gdb.aarch64.sme", "sme-registers.xml",
+                             base_reg);
+
+
+    /* Create the sme_bv vector type. */
+    gdb_feature_builder_append_tag(
+        &builder, "<vector id=\"sme_bv\" type=\"uint8\" count=\"%d\"/>",
+        svl);
+
+    /* Create the sme_bvv vector type. */
+    gdb_feature_builder_append_tag(
+        &builder, "<vector id=\"sme_bvv\" type=\"sme_bv\" count=\"%d\"/>",
+        svl);
+
+    /* Define the svg, svcr, and za registers. */
+
+    gdb_feature_builder_append_reg(&builder, "svg", 64, reg++, "int", NULL);
+    gdb_feature_builder_append_reg(&builder, "svcr", 64, reg++, "int", NULL);
+    gdb_feature_builder_append_reg(&builder, "za", svl * svl * 8, reg++,
+                                   "sme_bvv", NULL);
+
+    gdb_feature_builder_end(&builder);
+
+    return &cpu->dyn_smereg_feature.desc;
+}
+
 #ifdef CONFIG_USER_ONLY
 int aarch64_gdb_get_tag_ctl_reg(CPUState *cs, GByteArray *buf, int reg)
 {
diff --git a/target/arm/internals.h b/target/arm/internals.h
index f5a1e75db3..df99a17448 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1820,8 +1820,11 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
 }
 
 GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cpu, int base_reg);
+GDBFeature *arm_gen_dynamic_smereg_feature(CPUState *cpu, int base_reg);
 int aarch64_gdb_get_sve_reg(CPUState *cs, GByteArray *buf, int reg);
 int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg);
+int aarch64_gdb_get_sme_reg(CPUState *cs, GByteArray *buf, int reg);
+int aarch64_gdb_set_sme_reg(CPUState *cs, uint8_t *buf, int reg);
 int aarch64_gdb_get_fpu_reg(CPUState *cs, GByteArray *buf, int reg);
 int aarch64_gdb_set_fpu_reg(CPUState *cs, uint8_t *buf, int reg);
 int aarch64_gdb_get_pauth_reg(CPUState *cs, GByteArray *buf, int reg);
-- 
2.34.1


