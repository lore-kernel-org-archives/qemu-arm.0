Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12FEC83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 22:28:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubReJ-0000jw-8m; Mon, 14 Jul 2025 18:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ubQ80-0002ux-5R
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 16:50:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ubQ7x-0002KC-PY
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 16:50:23 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EI2Q1i022925
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 20:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=pxx2c/NW4zMEvhAJXdFJXHOVNFgTmC2vPnF
 rfmF7+8M=; b=OUzVN/i2aM3mp2QojUNYkwTXRWkFzrKIUpW10e176r/wzJMCBvC
 GNST/qL5ILwkSq2XRAlaRmeJMN/5GBJf6UbafGZho7ge6kbkfqtFrI+nOzh4g1eg
 u8SFPuqzKv0Z6+7Frq2wopUl+fp+cv+aEo3Y3poIZFelJUjyUA9kb5db4Ch3XO7/
 rb8E6GMdFE3fwOQrYU2j0SSmSCUUBjyjX6mPtiCkPjQXGp8Evj8xSX1+w6i7TSiq
 dW7rFhng/9iDXrO66C+pJh32TdV7VydaVQ0QDadXHLNb6rxoV+2Pbr1X4rCz+5+j
 IyYnFtKmsBJy9vUJC0O1Ll6LPabt7lhYl0w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxawwpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 20:50:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-748cf01de06so7045233b3a.3
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 13:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752526213; x=1753131013;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pxx2c/NW4zMEvhAJXdFJXHOVNFgTmC2vPnFrfmF7+8M=;
 b=EU2z3SSPK8qpg4A4PO8SSlHlwtYFvtKS+QQO+4E8LwNqtA52ctIyuFs8+DpYSoyOps
 ZtOQPmVn3WgeNy7l804TGXQ5qtM1DuS5+GCXNG4hZ9fweS7vZC1eMT1vYU1zktHC4e/H
 MpZceNGgIIDoE48zkEVlrbBDTTFcL5DCpadJ0FaPmGYbzKvs+7KpJcSGZzJjGU9RNSQx
 Y8/lLdhhrq6UYlt7ExcpFgQbl3EwmQUzNDjo5bdLVxRCY1x6crfZf6IFYinYswmFdw//
 KWahakW/2uS5AeMO+D1txdlp5woZ8aVEbffltZkqhuupU23oA3kEkTZ19ZAa6Z1IXdWt
 pavw==
X-Gm-Message-State: AOJu0YwuURYZiRq9UVF3v+iMP3eO8m5CV3c4RS70/P1DRj+7yH3HiVFQ
 sS1ayG/uMoy6K7KaNIFKQo4H883j7o218k5x1Fx7iPLju2KtRbUl+QliC6GiNfEfzA9gJQmjaLb
 83pNXRPd5C9z8THVZjEgSUU4SikBZVymPwR+tAwJhkUVKWLCuWTmlDEU=
X-Gm-Gg: ASbGncuaX7bTT2sXcbN9/vyo9W2OWEc4uz2MJppSUmwsZhw1NyMCYenQW37nsYab/Q/
 3CiZe8CVOyLATz670W8oiVFItXzcP6n4VEiBcBvFVIOtjUGtrKTotL4tc5T/Nm8HRdAWeCGW9r5
 WZYvnaiw7qTM1TpFqnpncBnTvpZb+MOPb+G9I2v9EDLIYnw/j5bQnhutaDJtuP1IIUHg3E45tBd
 +4Cn9em7k1BPPzN1+gLrqtYIvjed1OptxdMdzLkFmPpDyNu9J++QZw8AzgGyRyEY3Dn0m5u8wEP
 E2W8ECynPY8jvHvGQxT6alrfeqmCFTxpQwxh8mMPXhaRf+kPGmjT30aiMNTAhMq6MgtWhu/KouI
 LZ+muPRwaYPSLC1A=
X-Received: by 2002:a05:6a00:14ca:b0:748:eedb:902a with SMTP id
 d2e1a72fcca58-74ee2d5d7e8mr15675142b3a.17.1752526212963; 
 Mon, 14 Jul 2025 13:50:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrKZjYCIq85br5O3z4hRWG3ioyf+U7l5uZEMH/Y8jgIbXIrpYSSSvHfdckzVswEa7fM5GyDA==
X-Received: by 2002:a05:6a00:14ca:b0:748:eedb:902a with SMTP id
 d2e1a72fcca58-74ee2d5d7e8mr15675119b3a.17.1752526212464; 
 Mon, 14 Jul 2025 13:50:12 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f90d66sm10824034b3a.173.2025.07.14.13.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 13:50:12 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v3] target/arm: Added support for SME register exposure to GDB
Date: Mon, 14 Jul 2025 20:50:11 +0000
Message-Id: <20250714205011.955688-1-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cPEk1zw_sOm3uxEdAeVVNMf7VNBFWsh7
X-Proofpoint-ORIG-GUID: cPEk1zw_sOm3uxEdAeVVNMf7VNBFWsh7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE0MCBTYWx0ZWRfX5zYP5MCwTGSK
 CfHrypkQugNXEvw0oupTAN5HshfxwxfqFjltOFLGoj3+Z4LsNZlW6kZxF10sNzHWoI7CEOANJ8c
 i5PI8XetGrU1AwFz9PBZtGh68yNhH0NAW+NOFW5gbYysT/bBSZWqZr7zZ1TKHzr18OGUUQEKEWD
 aK0eEar3kRD3AAsRQpaYmQ0AX/bEzeMAmDrIeQsiJwHPhwgRnG6DgCDXAcHJvIjsbuOhaCh9HP2
 s9u4txjH9KXuUIE4RjfVRsUv2h2GLTlbq4ro8q9vUnMpcIJ9/6UVsvBvVeotwNe2d8A6YDlHPzK
 5SB+MZ+iN7yS/dtZ5FVEArlok5gxV1FKw6zAsue0/WXt4xDEDWRHbt3I1HTwgMugt9O0PoehNp8
 +0gLo2DS0cdAgusqsYRp4b7R7G7Eauso/0mhSUUZtnzgxBCzr5HOdZqZXDRh87xaq/80lNKI
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68756d8a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=cPBEBSeHtjnCkXsRAdUA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140140
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
Changes since v2:
- Used FIELD_EX64(env->svcr, SVCR, SM) to determine streaming mode to set
value of vq in aarch64_gdb_get_sme_reg()
- Changed occurrences of sve_max_vq in the new sme functions to sme_max_vq
- Changed 'for (q = 0' to 'for (int q = 0' in the loop in case 2 in
aarch64_gdb_get_sme_reg()
- Returned 8, instead of 0, in case 0 (setting svg) in 
aarch64_gdb_set_sme_reg()
- Used ldq_le_p(buf) in the call to aarch64_set_svcr in case 1 (setting
svcr) in aarch64_gdb_set_sme_reg()
- Mirrored the q/vq loop from aarch64_gdb_get_sme_reg() in
aarch64_gdb_set_sme_reg()

 target/arm/cpu.h       |   1 +
 target/arm/gdbstub.c   |   6 +++
 target/arm/gdbstub64.c | 115 +++++++++++++++++++++++++++++++++++++++++
 target/arm/internals.h |   3 ++
 4 files changed, 125 insertions(+)

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
index 64ee9b3b56..c0fdac7e93 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -228,6 +228,84 @@ int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg)
     return 0;
 }
 
+int aarch64_gdb_get_sme_reg(CPUState *cs, GByteArray *buf, int reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    switch (reg) {
+    /* Svg register */
+    case 0:
+    {
+        int vq = 0;
+        if (FIELD_EX64(env->svcr, SVCR, SM)) {
+            vq = sve_vqm1_for_el_sm(env, arm_current_el(env),
+                     FIELD_EX64(env->svcr, SVCR, SM)) + 1;
+        }
+        /* svg = vector granules (2 * vector quardwords) in streaming mode */
+        return gdb_get_reg64(buf, vq * 2);
+    }
+    case 1:
+        return gdb_get_reg64(buf, env->svcr);
+    case 2:
+    {
+        int len = 0;
+        int vq = cpu->sme_max_vq;
+        int svl = vq * 16;
+        for (int i = 0; i < svl; i++) {
+            for (int q = 0; q < vq; q++) {
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
+        return 8;
+    }
+    case 1:
+        aarch64_set_svcr(env, ldq_le_p(buf),
+            R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
+        return 8;
+    case 2:
+        int len = 0;
+        int vq = cpu->sme_max_vq;
+        int svl = vq * 16;
+        uint64_t *p = (uint64_t *) buf;
+        for (int i = 0; i < svl; i++) {
+            for (int q = 0; q < vq; q++) {
+                env->za_state.za[i].d[q * 2 + 1] = *p++;
+                env->za_state.za[i].d[q * 2] = *p++;
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
@@ -392,6 +470,43 @@ GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int base_reg)
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


