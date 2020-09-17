Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp533795lfq;
        Thu, 17 Sep 2020 05:28:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcY/v/6x6tqaw3uZLmZiYAGTqRYI0DgbrOe3ADN6J0D9IHQqIqJ2mtqHJSRO/JuyRSBlHj
X-Received: by 2002:a25:abe4:: with SMTP id v91mr23525238ybi.291.1600345684862;
        Thu, 17 Sep 2020 05:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600345684; cv=none;
        d=google.com; s=arc-20160816;
        b=k8sR7WH0TWmpGWIYpswXztDo5iO0InDY4mJMvcVH+pULHxP0744yQKorG/pJpolUKo
         K99HuN+ICTDccqTr0OW1z+vpvNV2Q7hLQxwnfnfadVosbXUWQtZJB/yRMGwy4GpEuPCL
         u2JpwXBi/BvRlAv5i8XnmLhlW1cTwdvEw/tSz7e2Pco9JEa4eCiHhLQNzK6kpFL42qzN
         mWiZHNNd7BlNl/ZCJW83F20a4yQMgRbgARLf/Cw7NbT5XZULCjYI9+pFiGMZlcRBPN4p
         HzCtdA6ieCiUzscJWClvFZ7Qvlqp7S8g8rAvn1HR+9VbHM5Q0ArgG6ji11JIxbw4nn9Y
         2AvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Ja8Mt3dM33y9iVDpaXiqpYLOxSsO7d6XG5nXx6XgcE0=;
        b=oJHv75NuHgpYOp7oTMM8IcswBUlf9w4OyDygndjIvO0xVN6TGZLOtnGRjWLSu8Ctxi
         WJpml8Z4w6bzSYRu0GGu3r8gqkrB5RPFI8HUFGaY+3e+5ELNo35soFKYocfI8eztDwz4
         lP4aVZtX4kjuqvwasMSoiyPZSO/r6ZJD5QtbrEQ6ybTqYHgRU9HallUYp8cO3nlyLZ23
         py31ho8qcAOrrENlAivwwMcW2GxZdEqLFCIiej/+U1dFCobg4GUikKo9MI7wqX2QPN4R
         S/H/yzc/lzda8oKOa6g20yepWo5SXxL8yUawCl9vDfIGJLUtRx2SF+qtqqLhpO8LdnPI
         fLBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20si6762335ybk.71.2020.09.17.05.28.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 05:28:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIt18-0004rS-Qa
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 08:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kIsww-0000Kc-6K; Thu, 17 Sep 2020 08:23:42 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:51596 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kIswr-0003R8-FK; Thu, 17 Sep 2020 08:23:41 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5FACB1A9EBC2C0236BA8;
 Thu, 17 Sep 2020 20:23:32 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 20:23:21 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 09/10] target/arm: introduce CPU feature dependency mechanism
Date: Thu, 17 Sep 2020 20:14:48 +0800
Message-ID: <20200917121449.3442059-10-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917121449.3442059-1-liangpeng10@huawei.com>
References: <20200917121449.3442059-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 08:23:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-TUID: wkVAA8ZvREQz

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
index 36375807e19d..4bb8587e9c53 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1257,6 +1257,107 @@ static struct CPUFeatureInfo cpu_features[] = {
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
@@ -1491,6 +1592,8 @@ static void arm_cpu_finalizefn(Object *obj)
 
 void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
+    int i;
+    ARMISARegisters *isar = &cpu->isar;
     Error *local_err = NULL;
 
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
@@ -1500,6 +1603,37 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
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

