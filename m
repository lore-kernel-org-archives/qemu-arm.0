Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB29C83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 19:01:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubOPg-0002HY-BY; Mon, 14 Jul 2025 15:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ubNDI-0007T8-3V
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 13:43:40 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ubNDF-0007P8-N2
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 13:43:39 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGRlE7011111
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 17:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=nWuhbGQ4L8L8dZIDxi6otT/rZkte7mqTMVg
 FxXbAdnc=; b=hBGwdNMv3dJPxefLRBGLT6B/q/JrJ2RBWCKpHtAjQrBqKXnqm8M
 2oHw8CMgGsDotiYOO9rhDiyjykorbKI6UQFdiPG/xPVewUzE7bAbGvmIQ+9jYSYD
 LHbMJuvSsf7jBNfrlezr9ZA1iakmBISXNRl69LE4BnO3etDFhzuXkFOaLAGW/Vpf
 CHwcetPpjBCO8JyRnEajqc69VWO5Dvj96wX1SBwsitJ1XBlTXlYugPGoKGWd8wBs
 mK0jBAFS+LvwaKqtUxM/xoraLU4bzIG4bedNaDkOxz34jtOnfEnitSxRqnPwKYKp
 F+BCzH6YSF5sK35tBPRlOZCHoBdUfuqPE+A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyg74x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 17:43:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-31215090074so8619665a91.0
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 10:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752515013; x=1753119813;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nWuhbGQ4L8L8dZIDxi6otT/rZkte7mqTMVgFxXbAdnc=;
 b=VHSCSbJ/hg6RruquCeXSanzyXlgX740Bpq1UWXOYua57wnAv55jnPPDSrKkmlLTvE4
 b2SZJdEipTpfmbThDFP8wC8MU6MnLRARlR3LTOSPz08om8anOeHPy13MgpVVM5OF9juM
 Jd2a+ngj3FXHKaypyAniUpbOG2M+BWpF96E6Urnojaeyjkuyf7a7bczvvxmArkMc2AU1
 kkYOMeAIYNN1l7FCtQ8C+jgjcm08eY7xWh6biWt4eFJZ3pan21IKG/TLt30N/MMa6ZHy
 mJOmuWRynCx6mZNHaKhdNYQ3KasI7dlCS4Ezb/F9aUjmECfGSAf9cEt+Yskrdp+wwuQN
 apBQ==
X-Gm-Message-State: AOJu0Yx9wYO/MhJ3oP7nATsJ7edAmh7jCYf6HT/yHHUQIY8QeoikJnl1
 uHptGP02W6gWhIeW5R+75s/mJ8PWI9J/xZLOtzWFSC4+6aKVoCnQZfWrMbo5U3oF+3Lk6w/WDQo
 rIBlHi/5dqyD0cORMoUVq9pUPioJHeLdDWjClrYaLAqHbevtrnqyhf1w=
X-Gm-Gg: ASbGncuYNOTdUHovRGGFCzXWFGI1cS7dCyN/4BpTjwlFMqwDyvCc9+mucqbq9JBUkbL
 2baFnTmiLP/vDQbywf3O1fsOoJ6YzL7pL+jHIimrcvMxBUgw3h5FhECjNnZ1d6shK4Jhak4iKYp
 Kc7XMXjCMBdZurCI/wLadlR0Nj8hdRTYVzjeZ6h8j3ILf9yIo7oieAniE3YwtbNHEfCd5S+I2gl
 1g14cbBh67DnAbtLYViDuECWWu+SrwnJH0+/AAMjRxjc6g2gO4wXShQoKftWaEnQvPN0EG7eV7H
 fBUavSXSvTZBJVa/plBoRIO6Jd2bKH8uHGK/0KHsku6mw7yZhYsxz1wJw6j0//SWwNpwaM7Auoo
 SWrGZKrzR0T/n0XA=
X-Received: by 2002:a17:90b:1810:b0:314:2840:8b21 with SMTP id
 98e67ed59e1d1-31c4f5d022emr18442946a91.32.1752515013198; 
 Mon, 14 Jul 2025 10:43:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgPRXPdMd8rnB8WmwXQYQipR2GPMZ/h3cUU3WLJnu/mMSz8pjkaE6FwaDzeA6y6fHZIR5Ukw==
X-Received: by 2002:a17:90b:1810:b0:314:2840:8b21 with SMTP id
 98e67ed59e1d1-31c4f5d022emr18442886a91.32.1752515012336; 
 Mon, 14 Jul 2025 10:43:32 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c3003d504sm13548679a91.10.2025.07.14.10.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 10:43:32 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v2] target/arm: Added support for SME register exposure to GDB
Date: Mon, 14 Jul 2025 17:43:30 +0000
Message-Id: <20250714174330.913636-1-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: u321COAo1U3pCxFnI6NplO_oN0oSerV2
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687541c6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=n8XNFov0HLMR1bPcp6wA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDExMSBTYWx0ZWRfXwzV9cCeIfAtP
 olElY/xHySIyQKKQEtaHey8a83j/wIY62A5WWaGb7T3SewqYdMTXqDx4ph8ejHbZoQYVT4pp/B2
 zcoQzXGgFCm7P+mTggLIclyy6uJJUVV7hZn6EUcEAqX3YEQ9YguWqlMAcPwooE5/NGcsdK5p5yW
 IDY3nesNlyz4C5hoKhz3dQ9WaU1MJuCIUq1+9BcWPyfCET2cWWzC7kjS7+qXuhEQSYvwD6p+q2I
 xWObofQHYG7TGBpIiSHsPqx7EZ/40FRqGffAj76fUAT9xqZvB9GxXi9IPVtLbYZxtbMqUst5KST
 gxlYOonxPp8tJBbWttWBUHhpwNEjtQiUVZDa1oMO0ubWSlqF+V17M5sNGVQB8b0jE1RRkBltfq2
 IL/01vJAEEOqhjh0Gl2/1/os1ZgOKADkuJUPc9rH09OIYhsZfqgsUo90sItgOUcDICrBpDW0
X-Proofpoint-GUID: u321COAo1U3pCxFnI6NplO_oN0oSerV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140111
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
---
Changes since v1:
- Removed unnecessary comments in aarch64_gdb_set_sme_reg() regarding the zregs
- Used aarch64_set_svcr to correctly set the 64 bit SVCR in aarch64_gdb_set_sme_reg()
- Corrected typo in comment in aarch64_gdb_set_sme_reg() and aarch64_gdb_get_sme_reg()

 target/arm/cpu.h       |   1 +
 target/arm/gdbstub.c   |   6 +++
 target/arm/gdbstub64.c | 118 +++++++++++++++++++++++++++++++++++++++++
 target/arm/internals.h |   3 ++
 4 files changed, 128 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index dc9b6dce4c..8bd66d7049 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -933,6 +933,7 @@ struct ArchCPU {
 
     DynamicGDBFeatureInfo dyn_sysreg_feature;
     DynamicGDBFeatureInfo dyn_svereg_feature;
+    DynamicGDBFeatureInfo dyn_smereg_feature;
     DynamicGDBFeatureInfo dyn_m_systemreg_feature;
     DynamicGDBFeatureInfo dyn_m_secextreg_feature;
 
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index ce4497ad7c..9c942c77cc 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -531,6 +531,12 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
             GDBFeature *feature = arm_gen_dynamic_svereg_feature(cs, cs->gdb_num_regs);
             gdb_register_coprocessor(cs, aarch64_gdb_get_sve_reg,
                                      aarch64_gdb_set_sve_reg, feature, 0);
+            if (isar_feature_aa64_sme(&cpu->isar)) {
+                GDBFeature *sme_feature = arm_gen_dynamic_smereg_feature(cs,
+                                             cs->gdb_num_regs);
+                gdb_register_coprocessor(cs, aarch64_gdb_get_sme_reg,
+                    aarch64_gdb_set_sme_reg, sme_feature, 0);
+            }
         } else {
             gdb_register_coprocessor(cs, aarch64_gdb_get_fpu_reg,
                                      aarch64_gdb_set_fpu_reg,
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 64ee9b3b56..c39d636caa 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -228,6 +228,87 @@ int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg)
     return 0;
 }
 
+int aarch64_gdb_get_sme_reg(CPUState *cs, GByteArray *buf, int reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    bool streaming_mode = ((env->svcr & 0x01) != 0);
+
+    switch (reg) {
+    /* Svg register */
+    case 0:
+    {
+        int vq;
+        if (streaming_mode) {
+            vq = sve_vqm1_for_el_sm(env, arm_current_el(env),
+                     streaming_mode) + 1;
+        } else {
+            vq = 0;
+        }
+        /* svg = vector granules (2 * vector quardwords) in streaming mode */
+        return gdb_get_reg64(buf, vq * 2);
+    }
+    case 1:
+        return gdb_get_reg64(buf, env->svcr);
+    case 2:
+    {
+        int q;
+        int len = 0;
+        int vq = cpu->sve_max_vq;
+        int svl = vq * 16;
+        for (int i = 0; i < svl; i++) {
+            for (q = 0; q < vq; q++) {
+                len += gdb_get_reg128(buf,
+                           env->za_state.za[i].d[q * 2 + 1],
+                           env->za_state.za[i].d[q * 2]);
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
+    case 0:
+    {
+        /* cannot set svg via gdbstub */
+        return 0;
+    }
+    case 1:
+        aarch64_set_svcr(env, *(uint64_t *)buf,
+            R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
+        return 8;
+    case 2:
+        int vq, len = 0;
+        int svl = cpu->sve_max_vq * 16;
+        uint64_t *p = (uint64_t *) buf;
+        for (int i = 0; i < svl; i++) {
+            for (vq = 0; vq < cpu->sve_max_vq; vq++) {
+                env->za_state.za[i].d[vq * 2 + 1] = *p++;
+                env->za_state.za[i].d[vq * 2] = *p++;
+                len += 16;
+            }
+        }
+        return len;
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
@@ -392,6 +473,43 @@ GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int base_reg)
     return &cpu->dyn_svereg_feature.desc;
 }
 
+GDBFeature *arm_gen_dynamic_smereg_feature(CPUState *cs, int base_reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    int vq = cpu->sve_max_vq;
+    int svl = vq * 16;
+    GDBFeatureBuilder builder;
+    int reg = 0;
+
+    gdb_feature_builder_init(&builder, &cpu->dyn_smereg_feature.desc,
+        "org.gnu.gdb.aarch64.sme", "sme-registers.xml", base_reg);
+
+
+    /* Create the sme_bv vector type. */
+    gdb_feature_builder_append_tag(&builder,
+        "<vector id=\"sme_bv\" type=\"uint8\" count=\"%d\"/>",
+        svl);
+
+    /* Create the sme_bvv vector type. */
+    gdb_feature_builder_append_tag(
+        &builder, "<vector id=\"sme_bvv\" type=\"sme_bv\" count=\"%d\"/>",
+        svl);
+
+    /* Define the svg, svcr, and za registers. */
+
+    /* fpscr & status registers */
+    gdb_feature_builder_append_reg(&builder, "svg", 64, reg++,
+        "int", NULL);
+    gdb_feature_builder_append_reg(&builder, "svcr", 64, reg++,
+        "int", NULL);
+    gdb_feature_builder_append_reg(&builder, "za", svl * svl * 8, reg++,
+        "sme_bvv", NULL);
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
index c4765e4489..760e1c6490 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1808,8 +1808,11 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
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


