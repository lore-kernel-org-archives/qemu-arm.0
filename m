Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp210528lfq;
        Wed, 16 Sep 2020 20:24:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI7GbSwAF9KYV7ZBuxnR9xmg5+YuFo6la9aISmLbqR5VkblbW+dcchWEzhRJwCeWHi4dNK
X-Received: by 2002:a25:c2c7:: with SMTP id s190mr37215520ybf.161.1600313055309;
        Wed, 16 Sep 2020 20:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600313055; cv=none;
        d=google.com; s=arc-20160816;
        b=muCMSTklcsaKu/bTfq3PrFYB0M3DEDAe8HAhszexjT02QDnG+TZEkZh+eyp8CBCtOj
         GcWPBelW8DXboY7zl4p02r/uRsG68SNiaRr1P2AEr318+4SYLyXz67FPD7BUj0cnl/LF
         +68O7HFFe/6weQWMQ8qvXW71SOwx8RGMwbswK1LxOKvjHB3aP8oyazDgbG4BysStztOO
         hPqJdJaIcWuF1YomvM2h2cWSZcl9vwNPnpxK85fDrwGh2850NzR7lM4FGFyZm5pX2B5H
         oRZaNAYUPKMWjTyE/uUBR3XrA40225QPVJiRJLENpI82/LxdCm8ZMNS3T4TAjtMG/+2C
         aDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=a4yYG57F5HEJeTWNQuFDC14+iVA59HTEsNyguIHDQf0=;
        b=YdnunfU2+BCRj17raKXOWtUIPnAr15RogYYBfYF21ZJ5YyORFO/wOCFJRxBn+BFyWQ
         v53LznfTbbyQzSQczBFtr19ffXrkf2s+e8NQMVSYXTdxwNpbSUI9knoSqzok0qaz2lA/
         rQy7P5kcUbD8k0dWKyN3zMpC14Pap9uhTcQXx89599eZmbCLv7cTpGtGTtL1g2szgLXT
         dudoVFOapkX9HwburvyGMua9doND+u06TVNh22OlKtGCHq41upnNU+hgM/8sgt7nu1O3
         VZErSalE58KO3qLk1+aD9S85ROxdBLJEh57Vky1+X+4W3M9vV8mCtwTIum6T0XXVdy9w
         APbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si17338666ybj.107.2020.09.16.20.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 20:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIkWs-000092-JV
	for alex.bennee@linaro.org; Wed, 16 Sep 2020 23:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUP-0004zU-9w; Wed, 16 Sep 2020 23:21:41 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4748 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUM-0004RS-J7; Wed, 16 Sep 2020 23:21:40 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id F287774951387E5CE419;
 Thu, 17 Sep 2020 11:21:13 +0800 (CST)
Received: from localhost (10.174.185.104) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 11:21:04 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 09/12] target/arm/cpu: Add CPU cache description for arm
Date: Thu, 17 Sep 2020 11:20:30 +0800
Message-ID: <20200917032033.2020-10-fangying1@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20200917032033.2020-1-fangying1@huawei.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.104]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 23:21:09
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
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rMs6d6bOXtIp

Add the CPUCacheInfo structure to hold CPU cache information for ARM cpus.
A classic three level cache topology is used here. The default cache
capacity is given and userspace can overwrite these values.

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 target/arm/cpu.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h | 27 +++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c179e0752d..efa8e1974a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -27,6 +27,7 @@
 #include "qapi/visitor.h"
 #include "cpu.h"
 #include "internals.h"
+#include "qemu/units.h"
 #include "exec/exec-all.h"
 #include "hw/qdev-properties.h"
 #if !defined(CONFIG_USER_ONLY)
@@ -998,6 +999,45 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
     return (Aff1 << ARM_AFF1_SHIFT) | Aff0;
 }
 
+static CPUCaches default_cache_info = {
+    .l1d_cache = &(CPUCacheInfo) {
+    .type = DATA_CACHE,
+        .level = 1,
+        .size = 64 * KiB,
+        .line_size = 64,
+        .associativity = 4,
+        .sets = 256,
+        .attributes = 0x02,
+    },
+    .l1i_cache = &(CPUCacheInfo) {
+        .type = INSTRUCTION_CACHE,
+        .level = 1,
+        .size = 64 * KiB,
+        .line_size = 64,
+        .associativity = 4,
+        .sets = 256,
+        .attributes = 0x04,
+    },
+    .l2_cache = &(CPUCacheInfo) {
+        .type = UNIFIED_CACHE,
+        .level = 2,
+        .size = 512 * KiB,
+        .line_size = 64,
+        .associativity = 8,
+        .sets = 1024,
+        .attributes = 0x0a,
+    },
+    .l3_cache = &(CPUCacheInfo) {
+        .type = UNIFIED_CACHE,
+        .level = 3,
+        .size = 65536 * KiB,
+        .line_size = 64,
+        .associativity = 15,
+        .sets = 2048,
+        .attributes = 0x0a,
+    },
+};
+
 static void cpreg_hashtable_data_destroy(gpointer data)
 {
     /*
@@ -1835,6 +1875,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
+    cpu->caches = default_cache_info;
+
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a1c7d8ebae..e9e3817e20 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -745,6 +745,30 @@ typedef enum ARMPSCIState {
 
 typedef struct ARMISARegisters ARMISARegisters;
 
+/* Cache information type */
+enum CacheType {
+    DATA_CACHE,
+    INSTRUCTION_CACHE,
+    UNIFIED_CACHE
+};
+
+typedef struct CPUCacheInfo {
+    enum CacheType type;      /* Cache Type*/
+    uint8_t level;
+    uint32_t size;            /* Size in bytes */
+    uint16_t line_size;       /* Line size in bytes */
+    uint8_t associativity;    /* Cache associativity */
+    uint32_t sets;            /* Number of sets */
+    uint8_t attributes;       /* Cache attributest  */
+} CPUCacheInfo;
+
+typedef struct CPUCaches {
+        CPUCacheInfo *l1d_cache;
+        CPUCacheInfo *l1i_cache;
+        CPUCacheInfo *l2_cache;
+        CPUCacheInfo *l3_cache;
+} CPUCaches;
+
 /**
  * ARMCPU:
  * @env: #CPUARMState
@@ -986,6 +1010,9 @@ struct ARMCPU {
 
     /* Generic timer counter frequency, in Hz */
     uint64_t gt_cntfrq_hz;
+
+    /* CPU cache information */
+    CPUCaches caches;
 };
 
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu);
-- 
2.23.0

