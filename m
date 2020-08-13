Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp389297lfy;
        Thu, 13 Aug 2020 03:34:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn+LipOuYP+ScczCBNrzN/vHU4bR8zq0B5EwXrDigOHSPXN88PWddYOkUAff2GMGpRvWfQ
X-Received: by 2002:a25:138a:: with SMTP id 132mr5586833ybt.334.1597314869632;
        Thu, 13 Aug 2020 03:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597314869; cv=none;
        d=google.com; s=arc-20160816;
        b=s1/tubNqcPcfAvaVnUqU/SkJ4ZdQy7iDjF75czl0FPxTFQUbMhLKmfPR/Q09fa1pql
         Rc1LVHtvhKHBhOnFDhz0G/ayvTCUtP3/Zba0lfH/C03vRNzbRl79xqGyinfcofCEtl9d
         FW9z/jJl1YquwhimTXGuZIKGgttfhvGyuJQf19UvaBCVDmCi0DUX6k+aXBiHETR7Elxy
         a+7WMmbeszyfvyxxqebQT7/Q+V/Q985jTWLmsCtMA1MG43CaflupiDZWxt+tqz1hq6vS
         iLidLoxO0Qa75LYmbQnqWMZton8N5nsRVrso3g+NbZgZg+gslMyzdeu0Woi/6lVXloZ6
         9HxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=4KE/dJj4bo8W4MEDEjEwbFHYyFtdedSa5R2rjP6q5x8=;
        b=B2gDszaniJ1zRL8PwzQoDnIIAKSkEOwjoGJGg0pDx0yNurApDNBs/j5n8tZynJHR4h
         t25aoKg1uyUuQChOqnpjL/rIte7C+gsywUAnz4gPhgbjpPhGkf6vZ8qiIapzzWAbpP9C
         xn0/1eFqKZw/rULp/tdKqcwRWGjQYB3IPbPRddkuClbS8/rTpCg1JgJ88kFBKC0AuqDF
         FfGZyWKA/GjK2E7pEtKfk8fhl6y/1R6BKGvYck0Zyd5eEmi7CtkC7CNqspjbMKKbiBnV
         +kxEoifw15AE5dKJXK0fT609ShMImgO7tQEnQ4pcUsA6j+HcVr7qhXGLknOM/LYWc8Cb
         aiMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22si4905867ybe.195.2020.08.13.03.34.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 03:34:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6AZ2-0002vg-TA
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 06:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AXE-00008M-3Y; Thu, 13 Aug 2020 06:32:36 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4181 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AXA-0006oz-Ef; Thu, 13 Aug 2020 06:32:35 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 10802DDD0521AA55BFD7;
 Thu, 13 Aug 2020 18:32:27 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 18:32:20 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC 5/9] target/arm: introduce CPU feature dependency mechanism
Date: Thu, 13 Aug 2020 18:26:53 +0800
Message-ID: <20200813102657.2588720-6-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200813102657.2588720-1-liangpeng10@huawei.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 06:32:27
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
X-TUID: sUBnJfKWoQjh

Some CPU features are dependent on other CPU features.  For example,
ID_AA64PFR0_EL1.FP field and ID_AA64PFR0_EL1.AdvSIMD must have the same
value, which means FP and ADVSIMD are dependent on each other, FPHP and
ADVSIMDHP are dependent on each other.

This commit introduces a mechanism for CPU feature dependency in
AArch64.  We build a directed graph from the CPU feature dependency
relationship, each edge from->to means the `to` CPU feature is dependent
on the `from` CPU feature.  And we will automatically enable/disable CPU
feature according to the directed graph.

For example, a, b, and c CPU features are in relationship a->b->c, which
means c is dependent on b and b is dependent on a.  If c is enabled by
user, then a and b is enabled automatically.  And if a is disabled by
user, then b and c is disabled automatically.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/cpu.c | 129 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 113cf4a9e7..4e67b8f22c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1418,6 +1418,103 @@ static struct CPUFeatureInfo cpu_features[] = {
     },
 };
 
+typedef struct CPUFeatureDep {
+    CPUFeatureInfo from, to;
+} CPUFeatureDep;
+
+static const CPUFeatureDep feature_dependencies[] = {
+    {
+        .from = FIELD_INFO(ID_AA64PFR0, FP, true, 0, 0xf, false),
+        .to = FIELD_INFO(ID_AA64PFR0, ADVSIMD, true, 0, 0xf, false),
+    },
+    {
+        .from = FIELD_INFO(ID_AA64PFR0, ADVSIMD, true, 0, 0xf, false),
+        .to = FIELD_INFO(ID_AA64PFR0, FP, true, 0, 0xf, false),
+    },
+    {
+        .from = {
+            .reg = ID_AA64PFR0, .length = R_ID_AA64PFR0_FP_LENGTH,
+            .shift = R_ID_AA64PFR0_FP_SHIFT, .sign = true, .min_value = 1,
+            .ni_value = 0, .name = "FPHP", .is_32bit = false,
+        },
+        .to = {
+            .reg = ID_AA64PFR0, .length = R_ID_AA64PFR0_ADVSIMD_LENGTH,
+            .shift = R_ID_AA64PFR0_ADVSIMD_SHIFT, .sign = true, .min_value = 1,
+            .ni_value = 0, .name = "ADVSIMDHP", .is_32bit = false,
+        },
+    },
+    {
+        .from = {
+            .reg = ID_AA64PFR0, .length = R_ID_AA64PFR0_ADVSIMD_LENGTH,
+            .shift = R_ID_AA64PFR0_ADVSIMD_SHIFT, .sign = true, .min_value = 1,
+            .ni_value = 0, .name = "ADVSIMDHP", .is_32bit = false,
+        },
+        .to = {
+            .reg = ID_AA64PFR0, .length = R_ID_AA64PFR0_FP_LENGTH,
+            .shift = R_ID_AA64PFR0_FP_SHIFT, .sign = true, .min_value = 1,
+            .ni_value = 0, .name = "FPHP", .is_32bit = false,
+        },
+    },
+    {
+
+        .from = FIELD_INFO(ID_AA64ISAR0, AES, false, 1, 0, false),
+        .to = {
+            .reg = ID_AA64ISAR0, .length = R_ID_AA64ISAR0_AES_LENGTH,
+            .shift = R_ID_AA64ISAR0_AES_SHIFT, .sign = false, .min_value = 2,
+            .ni_value = 1, .name = "PMULL", .is_32bit = false,
+        },
+    },
+    {
+
+        .from = FIELD_INFO(ID_AA64ISAR0, SHA2, false, 1, 0, false),
+        .to = {
+            .reg = ID_AA64ISAR0, .length = R_ID_AA64ISAR0_SHA2_LENGTH,
+            .shift = R_ID_AA64ISAR0_SHA2_SHIFT, .sign = false, .min_value = 2,
+            .ni_value = 1, .name = "SHA512", .is_32bit = false,
+        },
+    },
+    {
+        .from = FIELD_INFO(ID_AA64ISAR1, LRCPC, false, 1, 0, false),
+        .to = {
+            .reg = ID_AA64ISAR1, .length = R_ID_AA64ISAR1_LRCPC_LENGTH,
+            .shift = R_ID_AA64ISAR1_LRCPC_SHIFT, .sign = false, .min_value = 2,
+            .ni_value = 1, .name = "ILRCPC", .is_32bit = false,
+        },
+    },
+    {
+        .from = FIELD_INFO(ID_AA64ISAR0, SM3, false, 1, 0, false),
+        .to = FIELD_INFO(ID_AA64ISAR0, SM4, false, 1, 0, false),
+    },
+    {
+        .from = FIELD_INFO(ID_AA64ISAR0, SM4, false, 1, 0, false),
+        .to = FIELD_INFO(ID_AA64ISAR0, SM3, false, 1, 0, false),
+    },
+    {
+        .from = FIELD_INFO(ID_AA64ISAR0, SHA1, false, 1, 0, false),
+        .to = FIELD_INFO(ID_AA64ISAR0, SHA2, false, 1, 0, false),
+    },
+    {
+        .from = FIELD_INFO(ID_AA64ISAR0, SHA1, false, 1, 0, false),
+        .to = FIELD_INFO(ID_AA64ISAR0, SHA3, false, 1, 0, false),
+    },
+    {
+        .from = FIELD_INFO(ID_AA64ISAR0, SHA3, false, 1, 0, false),
+        .to = {
+            .reg = ID_AA64ISAR0, .length = R_ID_AA64ISAR0_SHA2_LENGTH,
+            .shift = R_ID_AA64ISAR0_SHA2_SHIFT, .sign = false, .min_value = 2,
+            .ni_value = 1, .name = "SHA512", .is_32bit = false,
+        },
+    },
+    {
+        .from = {
+            .reg = ID_AA64ISAR0, .length = R_ID_AA64ISAR0_SHA2_LENGTH,
+            .shift = R_ID_AA64ISAR0_SHA2_SHIFT, .sign = false, .min_value = 2,
+            .ni_value = 1, .name = "SHA512", .is_32bit = false,
+        },
+        .to = FIELD_INFO(ID_AA64ISAR0, SHA3, false, 1, 0, false),
+    },
+};
+
 static void arm_cpu_get_bit_prop(Object *obj, Visitor *v, const char *name,
                                  void *opaque, Error **errp)
 {
@@ -1454,13 +1551,45 @@ static void arm_cpu_set_bit_prop(Object *obj, Visitor *v, const char *name,
     }
 
     if (value) {
+        if (object_property_get_bool(obj, feat->name, NULL)) {
+            return;
+        }
         isar->regs[feat->reg] = deposit64(isar->regs[feat->reg],
                                           feat->shift, feat->length,
                                           feat->min_value);
+        /* Auto enable the features which current feature is dependent on. */
+        for (int i = 0; i < ARRAY_SIZE(feature_dependencies); ++i) {
+            const CPUFeatureDep *d = &feature_dependencies[i];
+            if (strcmp(d->to.name, feat->name) != 0) {
+                continue;
+            }
+
+            object_property_set_bool(obj, d->from.name, true, &local_err);
+            if (local_err) {
+                error_propagate(errp, local_err);
+                return;
+            }
+        }
     } else {
+        if (!object_property_get_bool(obj, feat->name, NULL)) {
+            return;
+        }
         isar->regs[feat->reg] = deposit64(isar->regs[feat->reg],
                                           feat->shift, feat->length,
                                           feat->ni_value);
+        /* Auto disable the features which are dependent on current feature. */
+        for (int i = 0; i < ARRAY_SIZE(feature_dependencies); ++i) {
+            const CPUFeatureDep *d = &feature_dependencies[i];
+            if (strcmp(d->from.name, feat->name) != 0) {
+                continue;
+            }
+
+            object_property_set_bool(obj, d->to.name, false, &local_err);
+            if (local_err) {
+                error_propagate(errp, local_err);
+                return;
+            }
+        }
     }
 }
 
-- 
2.18.4

