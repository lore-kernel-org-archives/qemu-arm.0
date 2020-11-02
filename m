Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3649200lfa;
        Sun, 1 Nov 2020 21:48:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxW+ysuJPC5rhLFF9kDytQAuIg1xdzv7d/qt1t9ayQVehZpJFu8+Hrjv0WtRL4YNpyogsZP
X-Received: by 2002:a25:aa42:: with SMTP id s60mr18932394ybi.266.1604296087543;
        Sun, 01 Nov 2020 21:48:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604296087; cv=none;
        d=google.com; s=arc-20160816;
        b=hfqGjtwK3PleeIvinNvV5JXMF3rTvTdfw5LL/1WZHm4OfkD1rvc7TRuxvQC41BanjK
         5Ra7xbXpsDu4vdovrLDcc2oEfVwr19m+Ac0n4jBWT/DqQ0VOvRZG5Foxx5z5PHBaJhDN
         SstYLOy25OLEVZOQu6Gps0t/irdOi51Rz0UO21+YSffXx4y9e+28zfGpv33iRHwBnGKS
         RvcnCXLQaN97HLopGemva5fYWjhCWNqjQIMIs/gQNX1b2YpHRMD4GhjAXqb+A73Qt/7o
         HIgKlU2AE5Kj2VsWXUEIVHiQUCVXSqhkwd3w67tZqEzv7CvXcTrps5/ppVdWonClsEOj
         c2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=+fp4JULcWfUF9lWMrd4ymoW93/vDzpp+ny0ChxcIpeA=;
        b=0mgG1kEGOF5SdKxjfRkiBKHbPvNE/eYEiq+5b7bfrEwIdwPhFi7mp0aIQyk3h3bAuu
         CGLj54coQVRTTsLMNY7HoUfhsvVLEEuqz/DRhhKX6jJwXaKY6ILQZp2Lpeqz3ilOqGBv
         v8Lu9NBkn5Gw1bk0I/iYagp0YQvFDZxDrAaeF+2hFuPXSHSzleLe4lLKk5oLfxU1sxYL
         oetiH0GLCy2VYl7oRrFFm5954zTQXHNwwdGHiyhE/6cjavd5eills4SJekLGXMwxGBu5
         hFUShv1vINvglnGfXomCtDfQH4IZWMjXrDbzDZYjpmB3NwxblBeEzrbEqNxXHbkcJHaG
         HujQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j134si14708642ybg.406.2020.11.01.21.48.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Nov 2020 21:48:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZShK-0006ie-PG
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 00:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdR-0002Wo-Lj; Mon, 02 Nov 2020 00:44:08 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdM-0001Nb-75; Mon, 02 Nov 2020 00:44:05 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPhft3nrqz15PmP;
 Mon,  2 Nov 2020 13:43:50 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 13:43:43 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v3 06/10] target/arm: register CPU features for property
Date: Mon, 2 Nov 2020 13:40:51 +0800
Message-ID: <20201102054055.686143-7-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102054055.686143-1-liangpeng10@huawei.com>
References: <20201102054055.686143-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 00:43:42
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, Peng Liang <liangpeng10@huawei.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bhvVqtBJOZzO

The Arm architecture specifies a number of ID registers that are
characterized as comprising a set of 4-bit ID fields. Each ID field
identifies the presence, and possibly the level of support for, a
particular feature in an implementation of the architecture. [1]

For most of the ID fields, there is a minimum presence value, equal to
or higher than which means the corresponding CPU feature is implemented.
Hence, we can use the minimum presence value to determine whether a CPU
feature is enabled and enable a CPU feature.

To disable a CPU feature, setting the corresponding ID field to 0x0/0xf
(for unsigned/signed field) seems as a good idea.  However, it maybe
lead to some problems.  For example,  ID_AA64PFR0_EL1.FP is a signed ID
field. ID_AA64PFR0_EL1.FP == 0x0 represents the implementation of FP
(floating-point) and ID_AA64PFR0_EL1.FP == 0x1 represents the
implementation of FPHP (half-precision floating-point).  If
ID_AA64PFR0_EL1.FP is set to 0xf when FPHP is disabled (which is also
disable FP), guest kernel maybe stuck.  Hence, we add a ni_value (means
not-implemented value) to disable a CPU feature safely.

[1] D13.1.3 Principles of the ID scheme for fields in ID registers in
    DDI.0487

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/cpu.c | 188 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 13179e13e358..c5530550ece0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1157,6 +1157,193 @@ unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
       NANOSECONDS_PER_SECOND / cpu->gt_cntfrq_hz : 1;
 }
 
+/**
+ * CPUFeatureInfo:
+ * @reg: The ID register where the ID field is in.
+ * @name: The name of the CPU feature.
+ * @length: The bit length of the ID field.
+ * @shift: The bit shift of the ID field in the ID register.
+ * @min_value: The minimum value equal to or larger than which means the CPU
+ *   feature is implemented.
+ * @ni_value: Not-implemented value. It will be set to the ID field when
+ *   disabling the CPU feature.  Usually, it's min_value - 1.
+ * @sign: Whether the ID field is signed.
+ * @is_32bit: Whether the CPU feature is for 32-bit.
+ *
+ * In ARM, a CPU feature is described by an ID field, which is a 4-bit field in
+ * an ID register.
+ */
+typedef struct CPUFeatureInfo {
+    CPUIDReg reg;
+    const char *name;
+    int length;
+    int shift;
+    int min_value;
+    int ni_value;
+    bool sign;
+    bool is_32bit;
+} CPUFeatureInfo;
+
+#define FIELD_INFO(feat_name, id_reg, field, s, min_val, ni_val, is32bit) { \
+    .reg = id_reg, \
+    .length = R_ ## id_reg ## _ ## field ## _LENGTH, \
+    .shift = R_ ## id_reg ## _ ## field ## _SHIFT, \
+    .sign = s, \
+    .min_value = min_val, \
+    .ni_value = ni_val, \
+    .name = feat_name, \
+    .is_32bit = is32bit, \
+}
+
+static struct CPUFeatureInfo cpu_features[] = {
+    FIELD_INFO("aes", ID_AA64ISAR0, AES, false, 1, 0, false),
+    FIELD_INFO("sha1", ID_AA64ISAR0, SHA1, false, 1, 0, false),
+    FIELD_INFO("sha2", ID_AA64ISAR0, SHA2, false, 1, 0, false),
+    FIELD_INFO("crc32", ID_AA64ISAR0, CRC32, false, 1, 0, false),
+    FIELD_INFO("atomics", ID_AA64ISAR0, ATOMIC, false, 1, 0, false),
+    FIELD_INFO("asimdrdm", ID_AA64ISAR0, RDM, false, 1, 0, false),
+    FIELD_INFO("sha3", ID_AA64ISAR0, SHA3, false, 1, 0, false),
+    FIELD_INFO("sm3", ID_AA64ISAR0, SM3, false, 1, 0, false),
+    FIELD_INFO("sm4", ID_AA64ISAR0, SM4, false, 1, 0, false),
+    FIELD_INFO("asimddp", ID_AA64ISAR0, DP, false, 1, 0, false),
+    FIELD_INFO("asimdfhm", ID_AA64ISAR0, FHM, false, 1, 0, false),
+    FIELD_INFO("flagm", ID_AA64ISAR0, TS, false, 1, 0, false),
+    FIELD_INFO("rng", ID_AA64ISAR0, RNDR, false, 1, 0, false),
+
+    FIELD_INFO("dcpop", ID_AA64ISAR1, DPB, false, 1, 0, false),
+    FIELD_INFO("jscvt", ID_AA64ISAR1, JSCVT, false, 1, 0, false),
+    FIELD_INFO("fcma", ID_AA64ISAR1, FCMA, false, 1, 0, false),
+    FIELD_INFO("lrcpc", ID_AA64ISAR1, LRCPC, false, 1, 0, false),
+    FIELD_INFO("frint", ID_AA64ISAR1, FRINTTS, false, 1, 0, false),
+    FIELD_INFO("sb", ID_AA64ISAR1, SB, false, 1, 0, false),
+    FIELD_INFO("i8mm", ID_AA64ISAR1, I8MM, false, 1, 0, false),
+    FIELD_INFO("bf16", ID_AA64ISAR1, BF16, false, 1, 0, false),
+    FIELD_INFO("dgh", ID_AA64ISAR1, DGH, false, 1, 0, false),
+
+    FIELD_INFO("fp", ID_AA64PFR0, FP, true, 0, 0xf, false),
+    FIELD_INFO("asimd", ID_AA64PFR0, ADVSIMD, true, 0, 0xf, false),
+    FIELD_INFO("dit", ID_AA64PFR0, DIT, false, 1, 0, false),
+
+    FIELD_INFO("bt", ID_AA64PFR1, BT, false, 1, 0, false),
+    FIELD_INFO("sbss", ID_AA64PFR1, SBSS, false, 1, 0, false),
+
+    FIELD_INFO("uscat", ID_AA64MMFR2, AT, false, 1, 0, false),
+
+    {
+        .reg = ID_AA64PFR0, .length = R_ID_AA64PFR0_FP_LENGTH,
+        .shift = R_ID_AA64PFR0_FP_SHIFT, .sign = true, .min_value = 1,
+        .ni_value = 0, .name = "fphp", .is_32bit = false,
+    },
+    {
+        .reg = ID_AA64PFR0, .length = R_ID_AA64PFR0_ADVSIMD_LENGTH,
+        .shift = R_ID_AA64PFR0_ADVSIMD_SHIFT, .sign = true, .min_value = 1,
+        .ni_value = 0, .name = "asimdhp", .is_32bit = false,
+    },
+    {
+        .reg = ID_AA64ISAR0, .length = R_ID_AA64ISAR0_AES_LENGTH,
+        .shift = R_ID_AA64ISAR0_AES_SHIFT, .sign = false, .min_value = 2,
+        .ni_value = 1, .name = "pmull", .is_32bit = false,
+    },
+    {
+        .reg = ID_AA64ISAR0, .length = R_ID_AA64ISAR0_SHA2_LENGTH,
+        .shift = R_ID_AA64ISAR0_SHA2_SHIFT, .sign = false, .min_value = 2,
+        .ni_value = 1, .name = "sha512", .is_32bit = false,
+    },
+    {
+        .reg = ID_AA64ISAR0, .length = R_ID_AA64ISAR0_TS_LENGTH,
+        .shift = R_ID_AA64ISAR0_TS_SHIFT, .sign = false, .min_value = 2,
+        .ni_value = 1, .name = "flagm2", .is_32bit = false,
+    },
+    {
+        .reg = ID_AA64ISAR1, .length = R_ID_AA64ISAR1_DPB_LENGTH,
+        .shift = R_ID_AA64ISAR1_DPB_SHIFT, .sign = false, .min_value = 2,
+        .ni_value = 1, .name = "dcpodp", .is_32bit = false,
+    },
+    {
+        .reg = ID_AA64ISAR1, .length = R_ID_AA64ISAR1_LRCPC_LENGTH,
+        .shift = R_ID_AA64ISAR1_LRCPC_SHIFT, .sign = false, .min_value = 2,
+        .ni_value = 1, .name = "ilrcpc", .is_32bit = false,
+    },
+};
+
+static void arm_cpu_get_feature_prop(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    CPUFeatureInfo *feat = opaque;
+    int field_value = feat->sign ? sextract64(cpu->isar.regs[feat->reg],
+                                              feat->shift, feat->length) :
+                                   extract64(cpu->isar.regs[feat->reg],
+                                             feat->shift, feat->length);
+    bool value = field_value >= feat->min_value;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void arm_cpu_set_feature_prop(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    DeviceState *dev = DEVICE(obj);
+    ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
+    CPUFeatureInfo *feat = opaque;
+    Error *local_err = NULL;
+    bool value;
+
+    if (!kvm_arm_cpu_feature_supported()) {
+        warn_report("KVM doesn't support to set CPU feature in arm.  "
+                    "Setting to `%s` is ignored.", name);
+        return;
+    }
+    if (dev->realized) {
+        qdev_prop_set_after_realize(dev, name, errp);
+        return;
+    }
+
+    visit_type_bool(v, name, &value, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    if (value) {
+        if (object_property_get_bool(obj, feat->name, &error_abort)) {
+            return;
+        }
+        isar->regs[feat->reg] = deposit64(isar->regs[feat->reg],
+                                          feat->shift, feat->length,
+                                          feat->min_value);
+    } else {
+        if (!object_property_get_bool(obj, feat->name, &error_abort)) {
+            return;
+        }
+        isar->regs[feat->reg] = deposit64(isar->regs[feat->reg],
+                                          feat->shift, feat->length,
+                                          feat->ni_value);
+    }
+}
+
+static void arm_cpu_register_feature_props(ARMCPU *cpu)
+{
+    int i;
+    ObjectProperty *op;
+    CPUARMState *env = &cpu->env;
+
+    for (i = 0; i < ARRAY_SIZE(cpu_features); i++) {
+        if (!(arm_feature(env, ARM_FEATURE_AARCH64) ^
+              cpu_features[i].is_32bit)) {
+            continue;
+        }
+        op = object_property_find(OBJECT(cpu), cpu_features[i].name);
+        if (!op) {
+            object_property_add(OBJECT(cpu), cpu_features[i].name, "bool",
+                                arm_cpu_get_feature_prop,
+                                arm_cpu_set_feature_prop,
+                                NULL, &cpu_features[i]);
+        }
+    }
+}
+
 void arm_cpu_post_init(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1282,6 +1469,7 @@ void arm_cpu_post_init(Object *obj)
         }
     }
 #endif
+    arm_cpu_register_feature_props(cpu);
 }
 
 static void arm_cpu_finalizefn(Object *obj)
-- 
2.26.2

