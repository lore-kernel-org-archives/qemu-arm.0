Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1261897lfp;
        Thu, 16 Sep 2021 09:07:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFZmZ8xVbNSzQ2PTmHNJNpBAxqk5yOP0v4rKn1P3d8VFlVBrNqAdSf72q+GxdWff0HTnWx
X-Received: by 2002:a05:620a:2a10:: with SMTP id o16mr5723471qkp.481.1631808427658;
        Thu, 16 Sep 2021 09:07:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631808427; cv=none;
        d=google.com; s=arc-20160816;
        b=qGbdQoka1SB5xxEZlmm1hurZuSj8r4hzk5F/QLCfxS7L66FHUSNRMEzKicZ29IeJjF
         eJ1Rm1WqxyMiql8bKRFGTgUZRAsowN5cZ7JP61FTffhnqnPDB21PBIbaYA1TrnCJbgjZ
         ZF14LResLlJN54TIjxv1SkxWYIAxbIP89quXVhNftpKESMqtlKqRjgEVXwa0dE751/fb
         xT6y/vIr2VGw9t0GMcSzXUA9rgUH2qxBsesVjilUJf+M7qmPn5OX8jrJr4cXZe93/YXk
         QjCWA+W3R5ZRAf+U4Bb2ONloulblUaV5TzBVw17xQdrW6744W/ujPlmFPC/0gZQ/g9IU
         k40w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=hf6ehpvE2P7S5A/OE6DUopaMCARczNMhL7Qy+L2n2x8=;
        b=faG1VynooYFAV1iY1ro8GAsr3Ojet/R8E3eBn6Mnuu8/G8MpFRPsVvoS+4tZiJplzm
         lxiDnpgIicnqJXmGQvwylzOxCIj/Mpbc8tTvfxOumg/nWZXzHBLM/3T7GW06b8dZ/sU6
         JPY4qx5SdRRS+ZLn1iSKt+v0+1AYWE1/QHgMLhb5LHnvSpnKG3UZGKUpIKGZYRzagqRB
         V/C8TiAr72KleykfhSh20/YzVmFszdqCDQ0t0IQ6wBBHeMyubL0RetdKjMldCho4p/er
         pEk9IrZDRfwgeeL8UO8nK1he8Em42eStCUBvqSzI6iorHAG3tL4d+YW9uQivgOIlQXoF
         AH+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si1755970vse.165.2021.09.16.09.07.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 09:07:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQtul-0003fz-2q
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 12:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQtiK-00030C-C0; Thu, 16 Sep 2021 11:54:16 -0400
Received: from mail.csgraf.de ([85.25.223.15]:51310 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQtiD-00053f-QK; Thu, 16 Sep 2021 11:54:13 -0400
Received: from localhost.localdomain
 (dynamic-077-009-016-098.77.9.pool.telefonica.de [77.9.16.98])
 by csgraf.de (Postfix) with ESMTPSA id 76D446080641;
 Thu, 16 Sep 2021 17:54:05 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v12 01/10] arm: Move PMC register definitions to internals.h
Date: Thu, 16 Sep 2021 17:53:55 +0200
Message-Id: <20210916155404.86958-2-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210916155404.86958-1-agraf@csgraf.de>
References: <20210916155404.86958-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MZMizfMDTVBW

We will need PMC register definitions in accel specific code later.
Move all constant definitions to common arm headers so we can reuse
them.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v9 -> v10:

  - Move to target/arm/internals.h

v10 -> v11:

  - Fix subject line
---
 target/arm/helper.c    | 44 ------------------------------------------
 target/arm/internals.h | 44 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b210da2bc2..21ee94ec2e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1114,50 +1114,6 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
-/* Definitions for the PMU registers */
-#define PMCRN_MASK  0xf800
-#define PMCRN_SHIFT 11
-#define PMCRLC  0x40
-#define PMCRDP  0x20
-#define PMCRX   0x10
-#define PMCRD   0x8
-#define PMCRC   0x4
-#define PMCRP   0x2
-#define PMCRE   0x1
-/*
- * Mask of PMCR bits writeable by guest (not including WO bits like C, P,
- * which can be written as 1 to trigger behaviour but which stay RAZ).
- */
-#define PMCR_WRITEABLE_MASK (PMCRLC | PMCRDP | PMCRX | PMCRD | PMCRE)
-
-#define PMXEVTYPER_P          0x80000000
-#define PMXEVTYPER_U          0x40000000
-#define PMXEVTYPER_NSK        0x20000000
-#define PMXEVTYPER_NSU        0x10000000
-#define PMXEVTYPER_NSH        0x08000000
-#define PMXEVTYPER_M          0x04000000
-#define PMXEVTYPER_MT         0x02000000
-#define PMXEVTYPER_EVTCOUNT   0x0000ffff
-#define PMXEVTYPER_MASK       (PMXEVTYPER_P | PMXEVTYPER_U | PMXEVTYPER_NSK | \
-                               PMXEVTYPER_NSU | PMXEVTYPER_NSH | \
-                               PMXEVTYPER_M | PMXEVTYPER_MT | \
-                               PMXEVTYPER_EVTCOUNT)
-
-#define PMCCFILTR             0xf8000000
-#define PMCCFILTR_M           PMXEVTYPER_M
-#define PMCCFILTR_EL0         (PMCCFILTR | PMCCFILTR_M)
-
-static inline uint32_t pmu_num_counters(CPUARMState *env)
-{
-  return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
-}
-
-/* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
-static inline uint64_t pmu_counter_mask(CPUARMState *env)
-{
-  return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
-}
-
 typedef struct pm_event {
     uint16_t number; /* PMEVTYPER.evtCount is 16 bits wide */
     /* If the event is supported on this CPU (used to generate PMCEID[01]) */
diff --git a/target/arm/internals.h b/target/arm/internals.h
index cd2ea8a388..777f968764 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1226,4 +1226,48 @@ enum MVEECIState {
     /* All other values reserved */
 };
 
+/* Definitions for the PMU registers */
+#define PMCRN_MASK  0xf800
+#define PMCRN_SHIFT 11
+#define PMCRLC  0x40
+#define PMCRDP  0x20
+#define PMCRX   0x10
+#define PMCRD   0x8
+#define PMCRC   0x4
+#define PMCRP   0x2
+#define PMCRE   0x1
+/*
+ * Mask of PMCR bits writeable by guest (not including WO bits like C, P,
+ * which can be written as 1 to trigger behaviour but which stay RAZ).
+ */
+#define PMCR_WRITEABLE_MASK (PMCRLC | PMCRDP | PMCRX | PMCRD | PMCRE)
+
+#define PMXEVTYPER_P          0x80000000
+#define PMXEVTYPER_U          0x40000000
+#define PMXEVTYPER_NSK        0x20000000
+#define PMXEVTYPER_NSU        0x10000000
+#define PMXEVTYPER_NSH        0x08000000
+#define PMXEVTYPER_M          0x04000000
+#define PMXEVTYPER_MT         0x02000000
+#define PMXEVTYPER_EVTCOUNT   0x0000ffff
+#define PMXEVTYPER_MASK       (PMXEVTYPER_P | PMXEVTYPER_U | PMXEVTYPER_NSK | \
+                               PMXEVTYPER_NSU | PMXEVTYPER_NSH | \
+                               PMXEVTYPER_M | PMXEVTYPER_MT | \
+                               PMXEVTYPER_EVTCOUNT)
+
+#define PMCCFILTR             0xf8000000
+#define PMCCFILTR_M           PMXEVTYPER_M
+#define PMCCFILTR_EL0         (PMCCFILTR | PMCCFILTR_M)
+
+static inline uint32_t pmu_num_counters(CPUARMState *env)
+{
+  return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
+}
+
+/* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
+static inline uint64_t pmu_counter_mask(CPUARMState *env)
+{
+  return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
+}
+
 #endif
-- 
2.30.1 (Apple Git-130)

