Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD47CC83F27
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Jul 2025 20:21:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ueJU0-0006WQ-3g; Tue, 22 Jul 2025 16:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ueJTm-0006T9-6q
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 16:20:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ueJTj-0004LE-U6
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 16:20:49 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEqxjh011581
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 20:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=KBubgUyly7phGjhJ9hpgSiZi8rbhOC9BQLc
 Mwj6vATE=; b=n43ZRZ/52QNYGuzaAABwZUOeFwttSMdeIO2RaLZZVHT67GEF4+R
 S6REYo4aCedKVKZ9Pt1B+RNyvYxuuLds7UDmu3ku+JcATsL6l516palKYTua5I/l
 hIBvkgd0Botncc84rbAWrBZJA87tL7YZTP8wM6PgTBjxJdtZq7qQvFGAF4LSP1QY
 4CjiyqmQf9xqIiSkd4LExKI4x3WPgHSuQeWdEFooCvFP9NuJ936L3430SFc11XwY
 McO6RnOLY6Is8Id10jS2Cbapc/GEeaxtbTydYTgPWr1iYs8gDR1S4kePP0eGF6O/
 iKo3zBcFK9C57Ph4rSAkSC9iGImpvn4J0hA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w3wnx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 20:20:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74928291bc3so4389338b3a.0
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 13:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753215644; x=1753820444;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KBubgUyly7phGjhJ9hpgSiZi8rbhOC9BQLcMwj6vATE=;
 b=uApOlQKqopn3UNX5pi/8Fh4YBKzNq33EFXvrIAvKA2WEiAyv79P8g/6G/ZNSaDFCpt
 AI56QONYHSaQuxRjTdFO1IkunF2EziBt9p9GcFsKfH9vM5K502gXmBySuUPagtYn/1gJ
 94DOVPXj7z3oLL2UwrJxWOw1Ar+gDX3deiTAl+CHW6pSn+Omj1LCoYqxPep4kDF2MBaa
 PdI8x3A1MWSD7/q1wabKhYsLlchLUqObd1kHb1y/76d6mAkppYqr+KOS6FEXElfFO1/f
 3fm4NrHfcunCDolqvOrNGcr/YO4USGBLadqrmCPneJmAGeypY/7CWWefSceEzleB6v6Y
 llGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLOODWnbw5tDI7XQci5FtsZMgqPkbYbKEMWFh06NM+tOBO64JTh+a3BR4b0hb2VllHEr6SDldw5w==@nongnu.org
X-Gm-Message-State: AOJu0YwvOl4cGjRt8v67+1WdrQfH6aMNwHaQL59py4D9yOLfW2MJcL6e
 Iss+zt/XjIMLoOsGMNz1zaiUKbGAofJzUq1sL48U0HLe51WjtCB1oegpKFWuRpeu7/WBBhRGkXp
 oSGulPqi46xgBS3edxS/Hll8r6Dc45grPEinrTOmaL//rpgvOEllrtiQ=
X-Gm-Gg: ASbGncsoUYcyLDfkD7xG/Zc9ExnVFVOVRensOOm7IUV5FiaiGGf9f2Ysn8Upksskzcc
 1h2zv1eqov6TAFPSXd7aQ2r9Szhr2TSqUhps5oFETkGMixHLZS399DDiK8CaE7vY0XRCt+Cn3y4
 2zMvomwt431VQw2OKzemWRfnW+/5lpW7zGuSHs1+MLwdYiq4OLPqev/tM22ID81aPKzczMmTFlZ
 QfpsqyloY5k6qNDlGhFtSG77s47RPZ+CJsZvpHIkfkxxHC5+OD9p4qn0YM+hwByExnId+Ze4ZQd
 SMrXxTGYWwb0lfLkISuY0Vl85uyoNTpCi267HlStAAxiM0OnZjyB4peVSfkKAIgA4iU/Lm8Tzvw
 s0x+bmlN1y3OUy74=
X-Received: by 2002:a05:6a21:68f:b0:230:c82b:b2f2 with SMTP id
 adf61e73a8af0-23d491221c9mr265314637.29.1753215644515; 
 Tue, 22 Jul 2025 13:20:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdJ1ohUXdeMqY8F1KXh/mr86baNTDSBSZoPKB00c5ryAZKtVYuVPMaVnpzIJE0cL+MkDvpeQ==
X-Received: by 2002:a05:6a21:68f:b0:230:c82b:b2f2 with SMTP id
 adf61e73a8af0-23d491221c9mr265287637.29.1753215644078; 
 Tue, 22 Jul 2025 13:20:44 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2fe8dc8fsm7643350a12.28.2025.07.22.13.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 13:20:43 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v4 2/2] target/arm: Added support for SME register exposure to
 GDB
Date: Tue, 22 Jul 2025 20:20:29 +0000
Message-Id: <20250722202029.2369656-1-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687ff29d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=BNg5ujFbbBWOBbuzlAkA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE3NCBTYWx0ZWRfXyOqmGW0L4UDh
 iRIWtaBz1r24oe93OLiDC844lZpLt2dXzUgSKfGUMm4QyHfIj4Etnaix3Ajvxy8OMGs7XcoguZw
 4ozjkPaACOGIz4D4emGeki/F3rnAYxPy1w9OTXfyLpLZY7NQ1zvL0kpS3Mg9LGaExBwE1ycRXeY
 aQL7+QBN96bCdd0r4cI0HiJfx85x5/tLZe6dcizY3dy1Y/Yg+TBkWzLvpClAXpxxGcWjD2jazdi
 14nxE284v+c/lp39QgHiUmd+8XtZ3XPfk5s3ZzTF307eNvpmycdR1C5an7zZJ7frM+8H+CUmhvC
 F85iFDcKGstvEWyzcNeQ+2Bw4tXrvfuv49dN8p0Gg5hvoUThRfhsx14WrmSXfs3asZoDY2UAcre
 LGnE632r6dCXsr6njuayTBLH74zLQD28EWtE3l1HHT/grdHADAlvU5lknbAPQzcw8otV8r3f
X-Proofpoint-ORIG-GUID: frFKMSnO5X1vpFrnwhaLFFvCZwCPX1Nl
X-Proofpoint-GUID: frFKMSnO5X1vpFrnwhaLFFvCZwCPX1Nl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220174
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
 target/arm/cpu.h       |   1 +
 target/arm/gdbstub.c   |   6 ++
 target/arm/gdbstub64.c | 122 +++++++++++++++++++++++++++++++++++++++++
 target/arm/internals.h |   3 +
 4 files changed, 132 insertions(+)

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
index 64ee9b3b56..3d86980bc9 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -228,6 +228,91 @@ int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg)
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
+        for (int i = 0; i < svl; i++) {
+            for (int q = 0; q < vq; q++) {
+                if (target_big_endian()){
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
@@ -392,6 +477,43 @@ GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int base_reg)
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


