Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3063381lfh;
        Sun, 22 May 2022 11:25:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqRIJdpO9mQuPm9uCUJtA+3sT2KOFUycTs6K6LP0JDb42gUFk3bGof1OFCI0gH2Dx2T0a2
X-Received: by 2002:ac8:5c14:0:b0:2f9:38d7:b095 with SMTP id i20-20020ac85c14000000b002f938d7b095mr440284qti.83.1653243917254;
        Sun, 22 May 2022 11:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653243917; cv=none;
        d=google.com; s=arc-20160816;
        b=DxAxVCUP73FxnU39DXphO+Wf+/NY5lCNMqTYH5781JK6gSnGfl5aOdW1wkqvM/ZY2/
         LN09R6Zhrknqw6YM95l+FREBO+pQdo6xjLXSDETSHcVv5cmGP/7pv5pj+0A6hDWimbxe
         qJ7LzEgsarWBdMeDTPcvhH5OpQSuVChmUvetwxsb6LmaH4EAACBo1o/tAa9KT95Yk0F7
         ifPCg3PslkskZsRZogfhE7OvnP2d0RLKZXc+PhNcEbJmW5bX1ZlGIFHckyOQwvcpYtzL
         j+w94ff7tkNRJ9UrZoK9itK9TSuuZNEf6SxXz4av5cPXCDKFSlh08MeACBVvboVXvdkp
         xrdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=xs4gvUailLLGe5qeax8Qh14bKpSzOTOlFdbaqXnmdbg=;
        b=xjQg5MP/AkJhdcqibcE2fNzTUHq0+gmbwE0431X0S2XtZhhqoSOzsDyLnipPRCJaUl
         1Ug8R6ro0PiF/IP7TMWCocB3ZkRE1n/XzlBTl5i6L8Rky63EefKg+Rr9A3XPSXqIy/kc
         9Fkuu1M7GvmJDEZu5xp57QArepgurver3KJXTIAuxUGiYhZkVUNUVl6E5Z2RdW5w6MmJ
         yD95dDQxMSo9lu8LmIN/KIkRlvlLKx3kbAqd/fVcqje5qUZE2GNkWwemdPhx3NPdjHaW
         lBrKdBpCSwQ23KeCWlXdygzsvDY7DckK2omvfEIiSiEsP8val6Kop9dlaDvOJIrPsP1y
         9kqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=I40BvdJZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2-20020ac85c02000000b002f934d8124csi681796qti.57.2022.05.22.11.25.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:25:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=I40BvdJZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqGS-0007qX-IK
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBO-0007tF-Cy; Sun, 22 May 2022 14:20:03 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBM-0003ag-LR; Sun, 22 May 2022 14:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xs4gvUailLLGe5qeax8Qh14bKpSzOTOlFdbaqXnmdbg=; b=I40BvdJZM5FAaW7pK9udLPILOf
 /arapUWdj19jj/D9t0XilXIh2cjNUli0zVGJooU3cBKQ26NlO1Nf3Ow8VcSyHR+HynzPl495w1WGW
 qt+Y6Rhpfgn8NJMUteOSJc/potFrg2w8hfJ2DugLLGX0jfK02Yygub+nDLInE8fHoQyMaAWvI+pnM
 2fKVHyc6fhXb/osQ1qRSqSQPRL1Ug7m1IaP0XngKZ0ORyotxbB8AyY+p0thuecu7Wt/jPS434o+e4
 oh2+8zcSnqp62HzVtdcfwPT+32FVu/Dj3PFe45l+bAQg6KFtXF632OLbr6YoXm2WGIEOCnC5ST2bf
 lf/+A7P0kqzrHX/GhoDPlV+SXP7EUDn2M3FIw9FHpG3xZ3cuJkGumYPcF8qiARcBV3kvVymrJWd4p
 iDgIrMpN1TgLvvFqZB96Tp6kA6OnmKCyPoYW3wtWzmEHpXphu7vIkypMQh0yoSERzUN/FA+VlgeVz
 Sjtmhh3tB2mwGrqaDaMHtXHPBcdSPM0s3m+4C3Zp0oYDTt80KmsVQoopnnax+eOTTseISw24B8x8D
 CAVR29bPJTkzR+klLpsgrzHkTAyc+Suqv9yLIeFGm+T8+WBlDDEAuDQkbHvDV9aRwzWIHk6ip9Ojg
 gLbn5myuelcGgdt6vSeyZ08hrdAajlvD9bXYl608s=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9v-0007pH-VG; Sun, 22 May 2022 19:18:32 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:05 +0100
Message-Id: <20220522181836.864-20-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 19/50] pckbd: move KBDState from pckbd.c to i8042.h
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2BDN1w6Exbgk

This allows the QOM types in pckbd.c to be used elsewhere by simply including
i8042.h.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c         | 24 ------------------------
 include/hw/input/i8042.h | 25 +++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index ab0d66d00d..87e015f243 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -146,30 +146,6 @@
 #define KBD_OBSRC_MOUSE         0x02
 #define KBD_OBSRC_CTRL          0x04
 
-typedef struct KBDState {
-    uint8_t write_cmd; /* if non zero, write data to port 60 is expected */
-    uint8_t status;
-    uint8_t mode;
-    uint8_t outport;
-    uint32_t migration_flags;
-    uint32_t obsrc;
-    bool outport_present;
-    bool extended_state;
-    bool extended_state_loaded;
-    /* Bitmask of devices with data available.  */
-    uint8_t pending;
-    uint8_t obdata;
-    uint8_t cbdata;
-    uint8_t pending_tmp;
-    void *kbd;
-    void *mouse;
-    QEMUTimer *throttle_timer;
-
-    qemu_irq irq_kbd;
-    qemu_irq irq_mouse;
-    qemu_irq a20_out;
-    hwaddr mask;
-} KBDState;
 
 /*
  * XXX: not generating the irqs if KBD_MODE_DISABLE_KBD is set may be
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index e070f546e4..84b5aa7f23 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -11,6 +11,31 @@
 #include "hw/isa/isa.h"
 #include "qom/object.h"
 
+typedef struct KBDState {
+    uint8_t write_cmd; /* if non zero, write data to port 60 is expected */
+    uint8_t status;
+    uint8_t mode;
+    uint8_t outport;
+    uint32_t migration_flags;
+    uint32_t obsrc;
+    bool outport_present;
+    bool extended_state;
+    bool extended_state_loaded;
+    /* Bitmask of devices with data available.  */
+    uint8_t pending;
+    uint8_t obdata;
+    uint8_t cbdata;
+    uint8_t pending_tmp;
+    void *kbd;
+    void *mouse;
+    QEMUTimer *throttle_timer;
+
+    qemu_irq irq_kbd;
+    qemu_irq irq_mouse;
+    qemu_irq a20_out;
+    hwaddr mask;
+} KBDState;
+
 #define TYPE_I8042 "i8042"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAKBDState, I8042)
 
-- 
2.20.1

