Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE23CA0FE7
	for <qemu-arm@archiver.kernel.org>; Tue, 26 Aug 2025 18:45:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqyfe-0004w9-Ka; Tue, 26 Aug 2025 14:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uqyfd-0004vg-Lv
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 14:45:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uqyfU-0008Sx-Po
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 14:45:23 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QFWFHf027214
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=N/cJ1VigX5T
 amwRxQg27K5ECt0YK3rjIAflQIFqgDpE=; b=ga0rQ9zhXMkM6gR5QZZ7qtIGbJF
 4oKO+nFIJtmYSSni+7GoGxxvR4ygnWhZFpdMaHmaR2XcSEqEEuMgFdydq0bDbNEH
 6DHNOAh0xfuW7Jsu0WsIMxuq3c79keqyNdzHJB6T0KjNRG9JsjziaW4/TuLQB7yB
 ke2lLEMlX9G0IvyOdI4hrq7zGT3vqfjJJgg5bdJnYRQ+raLKDHG45rrAe3bZWHTh
 nb/UAmjxrfC2s98hv9JpIJs0rLMwFOc0OyRpnP7jgsWt8Sf+guj1NjrODwxoQidR
 sJSXizqGvQVNf8o0JiQ8XgbLF6eqYTj5uV+hBtNSbr3IS2/R+E/gpuDh7LA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we1v95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:45:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b47174c667aso4879907a12.2
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 11:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756233911; x=1756838711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N/cJ1VigX5TamwRxQg27K5ECt0YK3rjIAflQIFqgDpE=;
 b=U0lfr2mTHWhjRRX7H8Po4up/RpjL58xN8WsiOp1MqBG3XAj58K9WIcmdxCDpDmNDu0
 jiBnQtIu3UTMncfDNN+4e/DFGvL8N87w+C9DE3izPNpXjudLP/+FRySSeM+dsMCcPL1w
 TWlT1kYfOJUrXQg09bb1EGedTkEXFGNtx/WkiOYBHl7RAzRxxWHq3pkg4qHoYWmr1+eT
 iCfJzl1o+SZUJ+LUwpYcZOTLm2k2GrR+YGrI0tA8pVczwzgUCgGEOBawlpxRyttL8WQA
 qDD5gZr3+rK9xg3kMYTmmTYlbQn5c/74mt0X6LpKFGdvwE2JETdfhM+mLuGAUkxr6vLL
 KC2w==
X-Gm-Message-State: AOJu0Yz+oMmX0ulIctzlIPe9grpn0x3oiEa2ga68+draMNEl/DtA+54x
 YEl4dVzz8X7MbZuCNRdyyZDSaSERv1JS+BgrK8zUUJ2DKUBff/G9N2b34ly/FyugWMKJN/liA9H
 chHtVWgsOV0z2mQyMXUs5scpdfZQBv/PCPAZKRFLAkLMdBdMJt5zcq38=
X-Gm-Gg: ASbGncupPCe9ioAHIlwAJl/JPpg7CaMmNgOqwwAihptIS9YmvyH6XiJ96JtoozWjc0l
 RaNNWgfqWIm3hgGyFTit/alS7xPDyRhUncF6QRz2PB8nVLMGTUcwUKMGxtd7J3mmBfH/HPxKOYy
 /lCij+YelfOKCCnEfixKT4eiX8fGWaseLS9ffzhXG9e3XgVg4u9Aq03Z6zwFo1/q7qHSLc7PRTt
 eIQLyzl3EjnIKkcYOG0xtEP/GKFN883Bc++QrMOoFvzNunLnpco0974+qdlx4LK93tk8uHEG/fy
 Ky5Abu/nMvg1csB9MVddhPGTVUjcn+4zeL/R7kImbDx2Oua0fITxI+g94/CHU6Hp1fglBqniHFe
 4TmmtOaiASle1c2k=
X-Received: by 2002:a17:902:e786:b0:246:80b1:8c87 with SMTP id
 d9443c01a7336-24680b190famr149128385ad.43.1756233911045; 
 Tue, 26 Aug 2025 11:45:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9HnvJ9dEZOIKH20ityDwao35hmppm9k0kcAS/YV/wZgjhfUi73rgdrU6+DJL1x89N1dULnA==
X-Received: by 2002:a17:902:e786:b0:246:80b1:8c87 with SMTP id
 d9443c01a7336-24680b190famr149127965ad.43.1756233910507; 
 Tue, 26 Aug 2025 11:45:10 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3276aeef8b8sm220661a91.21.2025.08.26.11.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 11:45:09 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v6 2/3] target/arm: Added support for SME register exposure to
 GDB
Date: Tue, 26 Aug 2025 18:45:03 +0000
Message-Id: <20250826184504.510279-3-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250826184504.510279-1-vacha.bhavsar@oss.qualcomm.com>
References: <20250826184504.510279-1-vacha.bhavsar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: K6e1gksn1x9JeiZQHJL2GmQboc6KEQkX
X-Proofpoint-ORIG-GUID: K6e1gksn1x9JeiZQHJL2GmQboc6KEQkX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX6ddRu9lMXUGG
 hoflsFkXQyqHGGZ2w40p8YGoVGir1h2VQbpxylzJv4YQ9hEBT6WicG2zMGDfod1RHQv/wYdSsH5
 8kFmUdoIdD8BSUFQTSnIfe/uelejnAfr9Cv5LI6+TdQ/RYFeLAqvtI2eQ3M1NUM+fhP/MnH0ukF
 c5jpnASt09Kl0UUVHzVEQFgi9aFWF0Y8MmgCGfn87ODedzVDRwQ6gjTPnWjl7mgJ4tcAOOsgNvx
 q1VcFkir7ufbDgUHkIzxHmSA4tYHQdYL2XYvg0n691F8oqT5H8P5RdHArxr16YCGFVAsJC2N/0L
 CvQZsvAY51Wlb8fNMc69z5t8EraopKUGwCjQ6wlEb3DfKI+ym5voSLSb24jNdNb597vtTldLnCQ
 72fwPnwf
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68ae00b8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=JRRW1ReKSft4RaJC_60A:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Changes since v5:
- added code to handle the case when we have SME without SVE
- added comments to indicate th cases in aarch64_gdb_get/set_sme_reg
- added/removed braces where necessary
- corrected capitalization in comments
---
 target/arm/cpu.h       |   1 +
 target/arm/gdbstub.c   |   9 ++-
 target/arm/gdbstub64.c | 121 +++++++++++++++++++++++++++++++++++++++++
 target/arm/internals.h |   3 +
 4 files changed, 133 insertions(+), 1 deletion(-)

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
index ce4497ad7c..110258ec18 100644
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
+                cs->gdb_num_regs);
+            gdb_register_coprocessor(cs, aarch64_gdb_get_sme_reg,
+                aarch64_gdb_set_sme_reg, sme_feature, 0);
+        }
         /*
          * Note that we report pauth information via the feature name
          * org.gnu.gdb.aarch64.pauth_v2, not org.gnu.gdb.aarch64.pauth.
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 08e2858539..d3fd94b93d 100644
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
+                     FIELD_EX64(env->svcr, SVCR, SM)) + 1;
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
+    case 0: /* svg register */
+        /* cannot set svg via gdbstub */
+        return 8;
+    case 1: /* svcr register */
+        aarch64_set_svcr(env, ldq_le_p(buf),
+            R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
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
@@ -413,6 +497,43 @@ GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int base_reg)
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
index 1b3d0244fd..41e05066b9 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1802,8 +1802,11 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
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


