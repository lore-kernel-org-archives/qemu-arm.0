Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3651081lfa;
        Sun, 1 Nov 2020 21:52:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/adu5xGZJnBFDZoFebaT4RbMD53chdbsk+xSBXBOYHVzo9+BaYDb2KC6u6JRXrfDcMDqN
X-Received: by 2002:aed:2091:: with SMTP id 17mr7233492qtb.342.1604296334212;
        Sun, 01 Nov 2020 21:52:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604296334; cv=none;
        d=google.com; s=arc-20160816;
        b=YrrsWcPqnsh9cCXmvb35aYPcVlHchwPcj6PWDJJlos7jbwRwGqQmphBkS3Qg71e5Hb
         2DKq3Q4IUBerbMtEAp8g7OMu0buZgC7NfKYEXNkt8w9kbCHJCqdI2uq7wEDUkh0SXhrf
         T4LCYFwxiER0NWROOC5iboHJtsDE4o3TzDVj75cn1kiS1G5EOIAT6IYbWxg2ce+AOXsG
         YJpxqDIfriMBW6huyTAZn1I0HbuIXTDnO313HH0d/Hr0uFcUAGrICXMr34zl+0HsAAfv
         +JcjFfC1KTSZHR79/4+rbhqOnAAA4YnWhyS3armQ04VQn8QNkMvWf8YvkVK7QrUkc97H
         85nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Q7SfHyc4hQvIwhLQeL2BCEOiUQCXt05ZwP+ljzZhDts=;
        b=0nh1Gm7BB6piWuSmbFjEoIwJUyIiunwn7L/43tIy2wgjJYuocvXN7crCA9yFY4qT8z
         pbiJHe+teYWv8vAsBZnHpyT4/0rSpn41IT4OAaV+88Q2d8wZWQDvT3UuuSPZK7gEnd88
         d1s3OOMKZTmxKNvnMoHVTR5QpYRl2+QCnKBhZPURmNxxd/8V1GOIlFRzRAHN8DwYDjGu
         SkAhTNM3ur9jBa50WprBj4XxVRb/1GbHNm+JlPSLT/TmOl3IRy7PKBxyld4HD1wo6EDH
         gfRTUSomBz+SEACohe9p5DqFjZ8e5XiiIA2xyc5+RM46IaQwSY2P1uQC/uZBfRSQPeiR
         6tKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15si8395582qtr.76.2020.11.01.21.52.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Nov 2020 21:52:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZSlJ-000524-LX
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 00:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdQ-0002We-3h; Mon, 02 Nov 2020 00:44:06 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdM-0001NY-0z; Mon, 02 Nov 2020 00:44:03 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPhfy2TW4zkcJL;
 Mon,  2 Nov 2020 13:43:54 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 13:43:48 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v3 09/10] target/arm: introduce CPU feature dependency mechanism
Date: Mon, 2 Nov 2020 13:40:54 +0800
Message-ID: <20201102054055.686143-10-liangpeng10@huawei.com>
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
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, Peng Liang <liangpeng10@huawei.com>,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UWbVDHMkv1pM

Some CPU features are dependent on other CPU features.  For example,
ID_AA64PFR0_EL1.FP field and ID_AA64PFR0_EL1.AdvSIMD must have the same
value, which means FP and ADVSIMD are dependent on each other, FPHP and
ADVSIMDHP are dependent on each other.

This commit introduces a mechanism for CPU feature dependency in
AArch64.  We build a directed graph from the CPU feature dependency
relationship, each edge from->to means the `to` CPU feature is dependent
on the `from` CPU feature.  And we will automatically enable/disable CPU
feature according to the directed graph.

For example, a and b CPU features are in relationship a->b, which means
b is dependent on a.  If b is enabled by user, then a is enabled
automatically.  And if a is disabled by user, then b is disabled
automatically.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/cpu.c | 134 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8c84a16d92a8..9d5916719a24 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1266,6 +1266,107 @@ static struct CPUFeatureInfo cpu_features[] = {
     },
 };
 
+typedef struct CPUFeatureDep {
+    CPUFeatureInfo from, to;
+} CPUFeatureDep;
+
+static const CPUFeatureDep feature_dependencies[] = {
+    {
+        .from = FIELD_INFO("fp", ID_AA64PFR0, FP, true, 0, 0xf, false),
+        .to = FIELD_INFO("asimd", ID_AA64PFR0, ADVSIMD, true, 0, 0xf, false),
+    },
+    {
+        .from = FIELD_INFO("asimd", ID_AA64PFR0, ADVSIMD, true, 0, 0xf, false),
+        .to = FIELD_INFO("fp", ID_AA64PFR0, FP, true, 0, 0xf, false),
+    },
+    {
+        .from = {
+            .reg = ID_AA64PFR0, .length = R_ID_AA64PFR0_FP_LENGTH,
+            .shift = R_ID_AA64PFR0_FP_SHIFT, .sign = true, .min_value = 1,
+            .ni_value = 0, .name = "fphp", .is_32bit = false,
+        },
+        .to = {
+            .reg = ID_AA64PFR0, .length = R_ID_AA64PFR0_ADVSIMD_LENGTH,
+            .shift = R_ID_AA64PFR0_ADVSIMD_SHIFT, .sign = true, .min_value = 1,
+            .ni_value = 0, .name = "asimdhp", .is_32bit = false,
+        },
+    },
+    {
+        .from = {
+            .reg = ID_AA64PFR0, .length = R_ID_AA64PFR0_ADVSIMD_LENGTH,
+            .shift = R_ID_AA64PFR0_ADVSIMD_SHIFT, .sign = true, .min_value = 1,
+            .ni_value = 0, .name = "asimdhp", .is_32bit = false,
+        },
+        .to = {
+            .reg = ID_AA64PFR0, .length = R_ID_AA64PFR0_FP_LENGTH,
+            .shift = R_ID_AA64PFR0_FP_SHIFT, .sign = true, .min_value = 1,
+            .ni_value = 0, .name = "fphp", .is_32bit = false,
+        },
+    },
+    {
+
+        .from = FIELD_INFO("aes", ID_AA64ISAR0, AES, false, 1, 0, false),
+        .to = {
+            .reg = ID_AA64ISAR0, .length = R_ID_AA64ISAR0_AES_LENGTH,
+            .shift = R_ID_AA64ISAR0_AES_SHIFT, .sign = false, .min_value = 2,
+            .ni_value = 1, .name = "pmull", .is_32bit = false,
+        },
+    },
+    {
+
+        .from = FIELD_INFO("sha2", ID_AA64ISAR0, SHA2, false, 1, 0, false),
+        .to = {
+            .reg = ID_AA64ISAR0, .length = R_ID_AA64ISAR0_SHA2_LENGTH,
+            .shift = R_ID_AA64ISAR0_SHA2_SHIFT, .sign = false, .min_value = 2,
+            .ni_value = 1, .name = "sha512", .is_32bit = false,
+        },
+    },
+    {
+        .from = FIELD_INFO("lrcpc", ID_AA64ISAR1, LRCPC, false, 1, 0, false),
+        .to = {
+            .reg = ID_AA64ISAR1, .length = R_ID_AA64ISAR1_LRCPC_LENGTH,
+            .shift = R_ID_AA64ISAR1_LRCPC_SHIFT, .sign = false, .min_value = 2,
+            .ni_value = 1, .name = "ilrcpc", .is_32bit = false,
+        },
+    },
+    {
+        .from = FIELD_INFO("sm3", ID_AA64ISAR0, SM3, false, 1, 0, false),
+        .to = FIELD_INFO("sm4", ID_AA64ISAR0, SM4, false, 1, 0, false),
+    },
+    {
+        .from = FIELD_INFO("sm4", ID_AA64ISAR0, SM4, false, 1, 0, false),
+        .to = FIELD_INFO("sm3", ID_AA64ISAR0, SM3, false, 1, 0, false),
+    },
+    {
+        .from = FIELD_INFO("sha1", ID_AA64ISAR0, SHA1, false, 1, 0, false),
+        .to = FIELD_INFO("sha2", ID_AA64ISAR0, SHA2, false, 1, 0, false),
+    },
+    {
+        .from = FIELD_INFO("sha2", ID_AA64ISAR0, SHA2, false, 1, 0, false),
+        .to = FIELD_INFO("sha1", ID_AA64ISAR0, SHA1, false, 1, 0, false),
+    },
+    {
+        .from = FIELD_INFO("sha1", ID_AA64ISAR0, SHA1, false, 1, 0, false),
+        .to = FIELD_INFO("sha3", ID_AA64ISAR0, SHA3, false, 1, 0, false),
+    },
+    {
+        .from = FIELD_INFO("sha3", ID_AA64ISAR0, SHA3, false, 1, 0, false),
+        .to = {
+            .reg = ID_AA64ISAR0, .length = R_ID_AA64ISAR0_SHA2_LENGTH,
+            .shift = R_ID_AA64ISAR0_SHA2_SHIFT, .sign = false, .min_value = 2,
+            .ni_value = 1, .name = "sha512", .is_32bit = false,
+        },
+    },
+    {
+        .from = {
+            .reg = ID_AA64ISAR0, .length = R_ID_AA64ISAR0_SHA2_LENGTH,
+            .shift = R_ID_AA64ISAR0_SHA2_SHIFT, .sign = false, .min_value = 2,
+            .ni_value = 1, .name = "sha512", .is_32bit = false,
+        },
+        .to = FIELD_INFO("sha3", ID_AA64ISAR0, SHA3, false, 1, 0, false),
+    },
+};
+
 static void arm_cpu_get_feature_prop(Object *obj, Visitor *v, const char *name,
                                      void *opaque, Error **errp)
 {
@@ -1500,6 +1601,8 @@ static void arm_cpu_finalizefn(Object *obj)
 
 void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
+    int i;
+    ARMISARegisters *isar = &cpu->isar;
     Error *local_err = NULL;
 
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
@@ -1517,6 +1620,37 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             return;
         }
     }
+
+    if (!kvm_enabled() || !kvm_arm_cpu_feature_supported()) {
+        return;
+    }
+
+    for (i = 0; i < ARRAY_SIZE(feature_dependencies); ++i) {
+        const CPUFeatureDep *d = &feature_dependencies[i];
+        bool from_explicit = !!(isar->user_mask[d->from.reg] &
+                                MAKE_64BIT_MASK(d->from.shift, d->from.length));
+        bool to_explicit = !!(isar->user_mask[d->to.reg] &
+                              MAKE_64BIT_MASK(d->to.shift, d->to.length));
+        bool from_enabled = object_property_get_bool(OBJECT(cpu), d->from.name,
+                                                     &error_abort);
+        bool to_enabled = object_property_get_bool(OBJECT(cpu), d->to.name,
+                                                   &error_abort);
+
+        if (!from_enabled && to_enabled) {
+            if (from_explicit && to_explicit) {
+                error_setg(errp, "The CPU feature '%s' dependes on CPU feature "
+                           "'%s' that is disabled explicitly",
+                           d->to.name, d->from.name);
+                return;
+            } else if (from_explicit) {
+                isar->regs[d->to.reg] = deposit64(isar->regs[d->to.reg],
+                        d->to.shift, d->to.length, d->to.ni_value);
+            } else if (to_explicit) {
+                isar->regs[d->from.reg] = deposit64(isar->regs[d->from.reg],
+                        d->from.shift, d->from.length, d->from.min_value);
+            }
+        }
+    }
 }
 
 static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
-- 
2.26.2

