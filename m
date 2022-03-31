Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp418190lfb;
        Thu, 31 Mar 2022 15:26:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiYz/pO/w+kGAcj5ZollXkJ+wEQQBoA1rgkLqzfGaJeGoEhGbu/nDwWSiKSI+NuBTbQU7R
X-Received: by 2002:a81:140b:0:b0:2e6:650c:dd7b with SMTP id 11-20020a81140b000000b002e6650cdd7bmr7043110ywu.365.1648765565208;
        Thu, 31 Mar 2022 15:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648765565; cv=none;
        d=google.com; s=arc-20160816;
        b=Y551Z7Wl2iocWEAZg/SafJiRH4kM1+WiEf/JirCun1kpoyhJ/EaHn7HFHoFzAtBhSE
         adqEwxt7Jbk5U+1wbbLeZ0qGv17P/QOIgmk/JHJGVT6xqrYBoZ7AH+tT+P+fF2QEAS2T
         nG5u/VBny0LbAEV2AOpvnxffuJJKsKD8BUxsOmXybJDCeYICE1xMKghS9mtfhqWyAgJK
         JZNSAvAu0QLyiN5X+Zzg+Y1UJZ4bRKa62BtFxnIIWQXorsyFv5syS0ZeEUqP0GqI18bN
         iFeagwg2AXWxgA268BeFTTqLqJl9BiH6oCE8nPcW1A2+9lSUTDBweFEc0QXIEzguKD3g
         QRUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/poTCG9aUgajh1ydyMdcGu8vdPS4oshl7xTbY6x/bqM=;
        b=fp4/5MfPT32ymERonkU/nNWxvg9adkMIlJhoZZDb4nPs148IeW2rNAoRztdr1t5Xyt
         dzZxy0+Fbq8pZUHnxJP0HIGS7GXQYOrSJcZNyZmfC40IClPYDraXS1vofgowbT+TteqZ
         qNdQi2GaiH8xivfsE1H9Psf1knX3n7XmKDMukHFkQ2EcA5dNuWuVyvbYR9p00+bcbN/s
         ZwDXwB2ffzaDdcCnok4qhYb0hQ317gHV2fmQnlKDkPKXVp3l8fvA/c2AraZH3tw3d9n6
         UHEAfafHAxusmBtqVkJmY1S2fkREAPw9yRqvYihO5DSMwkaRpWrMpuWF5kkIFTgsVW2S
         ScUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=iz4SIwX1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15-20020a81bc4f000000b002eaf5110682si642280ywl.496.2022.03.31.15.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 15:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=iz4SIwX1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1na3Ey-0000W0-Kk
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 18:26:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1na39U-0008Te-9U; Thu, 31 Mar 2022 18:20:24 -0400
Received: from [2a00:1450:4864:20::135] (port=45054
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1na39S-0001QS-GM; Thu, 31 Mar 2022 18:20:23 -0400
Received: by mail-lf1-x135.google.com with SMTP id m3so1584136lfj.11;
 Thu, 31 Mar 2022 15:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/poTCG9aUgajh1ydyMdcGu8vdPS4oshl7xTbY6x/bqM=;
 b=iz4SIwX1NFd6tImcV02Ee4HgvPAsyYiM2iIUPKncMoruOujj7mQfnZQqcuX/en28gB
 wnCXuSDvq2wUjPhor2R59m7Zf1XwadjaglcDdpYY2MsBUg2ZtmiyWjeoZz5DIxac25TQ
 5TFEiNnSIM0fZV8xpn0Nd1BdE+GCpGw3PmI2hrWKAusFRWV6G6atxaDdgaUOGSRMHMww
 KzJw22xbF7wgdKe3mcHk191I/cID+ZlzKTZ5vdlQLZwVeB3pDRjnyyZPnJR14m6u3Eqc
 Nkwhi7Xxjvf4nvHbrBnSeGtfZsGMvw7zll4JzcBKP2M8AqtfXEYIGIzPmDDIu6TajXo3
 cpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/poTCG9aUgajh1ydyMdcGu8vdPS4oshl7xTbY6x/bqM=;
 b=Q+I8MciWxI4npWx/RD1660Cg6ux23jNRyjmuqmp8ltIITZvKQJl7Kxm6etT1HW/7wP
 O5zCPtv36aTJmLAEzCrhjJmdssCfUjqsoSFNZIPkFASYisxs2JnNJCpi/PGRmRtu92iu
 fQiI1I25HNjliamc85nYW3f9OsHWGHzGaEltWUbNo9iHG26gHKWyW18h7EbuFJjRQOUQ
 9Npifx5dAq1FCXyLVdrgvrYD+dcsVBpAzST64+ZHIryltWBIGQN4/Nvh1+R8EubNYai7
 9tLuiZBaYoRWd/y94dpHOzjI4LV+i4V49tKsv0q6pcRtwTBQf/Whvp4U4Vbk0mWMDnrj
 tzIw==
X-Gm-Message-State: AOAM5317BqBXgY32SNUTgCATJs56GYutQgmMCL1siF7lxQ2qemcuhm+D
 P7jTu0qoAq5Ko4X2C8Pj6JnxHkBfBCPKEw==
X-Received: by 2002:a05:6512:3fa:b0:44a:2d3e:e9d0 with SMTP id
 n26-20020a05651203fa00b0044a2d3ee9d0mr11647480lfq.412.1648765219853; 
 Thu, 31 Mar 2022 15:20:19 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a2e8658000000b0024806af7079sm43641ljj.43.2022.03.31.15.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 15:20:19 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] timer: cadence_ttc: Break out header file to allow
 embedding
Date: Fri,  1 Apr 2022 00:20:16 +0200
Message-Id: <20220331222017.2914409-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331222017.2914409-1-edgar.iglesias@gmail.com>
References: <20220331222017.2914409-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 asifsiddiqui120@gmail.com, edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, f4bug@amsat.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WvfSq2pxnIBh

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Break out header file to allow embedding of the the TTC.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 include/hw/timer/cadence_ttc.h | 54 ++++++++++++++++++++++++++++++++++
 hw/timer/cadence_ttc.c         | 32 ++------------------
 2 files changed, 56 insertions(+), 30 deletions(-)
 create mode 100644 include/hw/timer/cadence_ttc.h

diff --git a/include/hw/timer/cadence_ttc.h b/include/hw/timer/cadence_ttc.h
new file mode 100644
index 0000000000..e1251383f2
--- /dev/null
+++ b/include/hw/timer/cadence_ttc.h
@@ -0,0 +1,54 @@
+/*
+ * Xilinx Zynq cadence TTC model
+ *
+ * Copyright (c) 2011 Xilinx Inc.
+ * Copyright (c) 2012 Peter A.G. Crosthwaite (peter.crosthwaite@petalogix.com)
+ * Copyright (c) 2012 PetaLogix Pty Ltd.
+ * Written By Haibing Ma
+ *            M. Habib
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef HW_TIMER_CADENCE_TTC_H
+#define HW_TIMER_CADENCE_TTC_H
+
+#include "hw/sysbus.h"
+#include "qemu/timer.h"
+
+typedef struct {
+    QEMUTimer *timer;
+    int freq;
+
+    uint32_t reg_clock;
+    uint32_t reg_count;
+    uint32_t reg_value;
+    uint16_t reg_interval;
+    uint16_t reg_match[3];
+    uint32_t reg_intr;
+    uint32_t reg_intr_en;
+    uint32_t reg_event_ctrl;
+    uint32_t reg_event;
+
+    uint64_t cpu_time;
+    unsigned int cpu_time_valid;
+
+    qemu_irq irq;
+} CadenceTimerState;
+
+#define TYPE_CADENCE_TTC "cadence_ttc"
+OBJECT_DECLARE_SIMPLE_TYPE(CadenceTTCState, CADENCE_TTC)
+
+struct CadenceTTCState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    CadenceTimerState timer[3];
+};
+
+#endif
diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c
index 64108241ba..e57a0f5f09 100644
--- a/hw/timer/cadence_ttc.c
+++ b/hw/timer/cadence_ttc.c
@@ -24,6 +24,8 @@
 #include "qemu/timer.h"
 #include "qom/object.h"
 
+#include "hw/timer/cadence_ttc.h"
+
 #ifdef CADENCE_TTC_ERR_DEBUG
 #define DB_PRINT(...) do { \
     fprintf(stderr,  ": %s: ", __func__); \
@@ -49,36 +51,6 @@
 #define CLOCK_CTRL_PS_EN    0x00000001
 #define CLOCK_CTRL_PS_V     0x0000001e
 
-typedef struct {
-    QEMUTimer *timer;
-    int freq;
-
-    uint32_t reg_clock;
-    uint32_t reg_count;
-    uint32_t reg_value;
-    uint16_t reg_interval;
-    uint16_t reg_match[3];
-    uint32_t reg_intr;
-    uint32_t reg_intr_en;
-    uint32_t reg_event_ctrl;
-    uint32_t reg_event;
-
-    uint64_t cpu_time;
-    unsigned int cpu_time_valid;
-
-    qemu_irq irq;
-} CadenceTimerState;
-
-#define TYPE_CADENCE_TTC "cadence_ttc"
-OBJECT_DECLARE_SIMPLE_TYPE(CadenceTTCState, CADENCE_TTC)
-
-struct CadenceTTCState {
-    SysBusDevice parent_obj;
-
-    MemoryRegion iomem;
-    CadenceTimerState timer[3];
-};
-
 static void cadence_timer_update(CadenceTimerState *s)
 {
     qemu_set_irq(s->irq, !!(s->reg_intr & s->reg_intr_en));
-- 
2.25.1

