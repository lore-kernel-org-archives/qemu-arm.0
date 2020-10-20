Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4781490lfa;
        Tue, 20 Oct 2020 06:18:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB4TR6lNK9hQo088VqdLdl9JRSUr3IQgSS6USBC6B9RgJEU0FJiWcakyVUio8PwUawISE2
X-Received: by 2002:a05:6902:4e7:: with SMTP id w7mr3914221ybs.190.1603199936807;
        Tue, 20 Oct 2020 06:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603199936; cv=none;
        d=google.com; s=arc-20160816;
        b=a2Blybuf2XhdewzFHkiq8MYUpIHAaHQ8N2vTYPsHNVV78vw1STo/4iG+i+2gJ/emKg
         kA7FFMJ+FMyClhzN9wY4bL91IRqm70+o5mrPqIuffPkv1oqzQJn3SRbceggNicGvvH9z
         UwDAT271m8MeBOrTNUTqA3fkYaaldjhNAvZUnis4i92DlGWc1GHbFn2G8bOKpdCT6Vfi
         u97PnlRnzOTlSXV3/jV8shrQrHL8JeVkLVQcT1ThEZwbZ/Leo1xA/+3RHP0aktlGqBI5
         +J+S1G98zSW81FAXSFWoMQxl3iSkmyLYyFNOdqF2XwXfCh1eJdyiA0oizV2ZmHocdF5P
         53pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=3fGMbZt/6guDC7ia1mVzJ6YdsMi0OYKaj8KNIRnpTv4=;
        b=hk3wMyyz0bZmQSPEq+TK5ysDIYyPUYp1BDsOLusHWQ6WxitsbwPuETYWwQ4YCsB2QP
         r+0lSiWBtDLZaOeaCfuqj6UTLu5sGMmMOEOb5qhd384hU/ulWacsvp50B4+EhFEjKPPw
         7Wa2dGMZJigNVTwQrHF6XNCIXZcmqTh5nZTROcRrPeKEucCH+wwjIC1HKA4UBzGeBCDZ
         RXf72/aPlO0917BcyUJIQ7JavY+Sp6DeWqXwzts1l7KaZY40KIwIgUma/FHT04Zpy7W5
         D/EabNwoC049CZjGAipILVxs4bpc21nCsz3N6eyb+ipJIjy1PNvaIkWy6w7rSBe8cwl7
         aBNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si1720183ybp.123.2020.10.20.06.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 06:18:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUrXU-0004IJ-6U
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 09:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU4-0000GS-Pg; Tue, 20 Oct 2020 09:15:24 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:48380 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrTz-00076r-9s; Tue, 20 Oct 2020 09:15:24 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7C862407BC9C087D99D8;
 Tue, 20 Oct 2020 21:15:10 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Tue, 20 Oct 2020
 21:15:04 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 10/13] target/arm/cpu: Add CPU cache description for arm
Date: Tue, 20 Oct 2020 21:14:37 +0800
Message-ID: <20201020131440.1090-11-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201020131440.1090-1-fangying1@huawei.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 07:04:17
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
X-TUID: DwdTQvs00gku

Add the CPUCacheInfo structure to hold CPU cache information for ARM cpus.
A classic three level cache topology is used here. The default cache
capacity is given and userspace can overwrite these values.

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 target/arm/cpu.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h | 27 +++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 056319859f..f1bac7452c 100644
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
@@ -997,6 +998,45 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
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
@@ -1841,6 +1881,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
+    cpu->caches = default_cache_info;
+
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cfff1b5c8f..dbc33a9802 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -746,6 +746,30 @@ typedef enum ARMPSCIState {
 
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
@@ -987,6 +1011,9 @@ struct ARMCPU {
 
     /* Generic timer counter frequency, in Hz */
     uint64_t gt_cntfrq_hz;
+
+    /* CPU cache information */
+    CPUCaches caches;
 };
 
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu);
-- 
2.23.0

