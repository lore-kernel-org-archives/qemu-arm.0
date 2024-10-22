Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2942941njb;
        Tue, 22 Oct 2024 02:42:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUORgh4wEOKHJNRNiYf7BGSn6ESYYYyXscQMNeF/qzxRj7XTfu6BuAp9NQEAwvAFNOqPFNkd+jZF30LnA==@linaro.org
X-Google-Smtp-Source: AGHT+IHnDZWvFj/AAd3FbDOnFbru/+PFWojyuFAiD5s4yd3vRj4QLo5XxHq4i2ehU5M1Svq6WNJg
X-Received: by 2002:a05:622a:653:b0:460:9b03:452b with SMTP id d75a77b69052e-460aed85a70mr236794151cf.19.1729590163709;
        Tue, 22 Oct 2024 02:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729590163; cv=none;
        d=google.com; s=arc-20240605;
        b=UJZfP0Rh8Q+Ep2zALpllyf9Cmc3UiPvZEaJglTr12PkmVJg0sY6jv06jSwiNfEoDmz
         ooqop1556vsgoqV3ZdUR+3KgFtpCQItu7GYe9CrhyJVjkoHXOXBN3qPBXdm2tpVjYspc
         X7IAJa4DufLQSewjDWLchCVHUWxNPxbowKXpfnd8ac2EDcctNm78I/kMYNLDfxNPll3b
         5oF9lzHrpaJbMRGBZIefLFb7NDrRB9Axsuu+oOLsUcGvMKzm1gd2vgcK/RyqWm7PbP7b
         AXkKEIRfVOC8axPOJp4InFryrboSfI5fXlj5PG5CamxKj5QpOARfjWYLK67yIOEeZ2+E
         4CCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Np55r18JwD2NFT9kZPxWfAWFY8D3FPILzQ8a7Iw/DNc=;
        fh=RVX+uUL/oYxgKlLpNyiQfzI75/ka+93kXvmeIy2Oap4=;
        b=fnk29/mg5tS/TQGLrEfjnXnHBjFCRwPT3Zqk81YJy1lzvJdXtpMpnRpBTEvgsZaYkQ
         4q4ap+zKEPDmP1G22pTQs4ijuGqAq4ubACCtvN423gHKlpP1uAOow/Neyv76Juap4kpi
         eBNPLG9EdnZtd2fnDac3evPiqKjKlkO8Dixs4TRq6eSYVrYuuKR1EbReaNWBKOkD+IxB
         jdw4l9TJRGx1BUhXCM6uwfF58Ziy2zrttRPKoIQXOGyWBC9hv3LP5vb7qBzFtL4E1JzT
         DtdEzJV82NJfnTPPM9GdaGCRqQilWjt/mwaefmB/GtWgvQOgNKkm9RBQUGmuM4cpaXbK
         afyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3ce67c4si59540591cf.283.2024.10.22.02.42.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 02:42:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3BOb-0002pg-PP; Tue, 22 Oct 2024 05:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BOK-0002nG-2s; Tue, 22 Oct 2024 05:41:28 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BOI-00015E-65; Tue, 22 Oct 2024 05:41:27 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 22 Oct
 2024 17:41:11 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 22 Oct 2024 17:41:11 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>, "open list:Block layer
 core" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 01/18] aspeed/smc: Fix write incorrect data into flash in
 user mode
Date: Tue, 22 Oct 2024 17:40:53 +0800
Message-ID: <20241022094110.1574011-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
References: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: O0e2Pjv0lQIt

According to the design of ASPEED SPI controllers user mode, users write the
data to flash, the SPI drivers set the Control Register(0x10) bit 0 and 1
enter user mode. Then, SPI drivers send flash commands for writing data.
Finally, SPI drivers set the Control Register (0x10) bit 2 to stop
active control and restore bit 0 and 1.

According to the design of ASPEED SMC model, firmware writes the
Control Register and the "aspeed_smc_flash_update_ctrl" function is called.
Then, this function verify Control Register(0x10) bit 0 and 1. If it set user
mode, the value of s->snoop_index is SNOOP_START else SNOOP_OFF.
If s->snoop_index is SNOOP_START, the "aspeed_smc_do_snoop" function verify
the first incomming data is a new flash command and writes the corresponding
dummy bytes if need.

However, it did not check the current unselect status. If current unselect
status is "false" and firmware set the IO MODE by Control Register bit 31:28,
the value of s->snoop_index will be changed to SNOOP_START again and
"aspeed_smc_do_snoop" misunderstand that the incomming data is the new flash
command and it causes writing unexpected data into flash.

Example:
1. Firmware set user mode by Control Register bit 0 and 1(0x03)
2. SMC model set s->snoop SNOOP_START
3. Firmware set Quad Page Program with 4-Byte Address command (0x34)
4. SMC model verify this flash command and it needs 4 dummy bytes.
5. Firmware send 4 bytes address.
6. SMC model receives 4 bytes address
7. Firmware set QPI IO MODE by Control Register bit 31. (0x80000003)
8. SMC model verify new user mode by Control Register bit 0 and 1.
   Then, set s->snoop SNOOP_START again. (It is the wrong behavior.)
9. Firmware send 0xebd8c134 data and it should be written into flash.
   However, SMC model misunderstand that the first incoming data, 0x34,
   is the new command because the value of s->snoop is changed to SNOOP_START.
   Finally, SMC sned the incorrect data to flash model.

Introduce a new unselect attribute in AspeedSMCState to save the current
unselect status for user mode and set it "true" by default.
Update "aspeed_smc_flash_update_ctrl" function to check the previous unselect
status. If both new unselect status and previous unselect status is different,
update s->snoop_index value and call "aspeed_smc_flash_do_select".

Increase VMStateDescription version.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/ssi/aspeed_smc.c         | 40 ++++++++++++++++++++++++++-----------
 include/hw/ssi/aspeed_smc.h |  1 +
 2 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index e3fdc66cb2..7b0f6599f9 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -417,7 +417,7 @@ static void aspeed_smc_flash_do_select(AspeedSMCFlash *fl, bool unselect)
     AspeedSMCState *s = fl->controller;
 
     trace_aspeed_smc_flash_select(fl->cs, unselect ? "un" : "");
-
+    s->unselect = unselect;
     qemu_set_irq(s->cs_lines[fl->cs], unselect);
 }
 
@@ -677,22 +677,35 @@ static const MemoryRegionOps aspeed_smc_flash_ops = {
 static void aspeed_smc_flash_update_ctrl(AspeedSMCFlash *fl, uint32_t value)
 {
     AspeedSMCState *s = fl->controller;
-    bool unselect;
+    bool unselect = false;
+    uint32_t old_mode;
+    uint32_t new_mode;
+
+    old_mode = s->regs[s->r_ctrl0 + fl->cs] & CTRL_CMD_MODE_MASK;
+    new_mode = value & CTRL_CMD_MODE_MASK;
 
-    /* User mode selects the CS, other modes unselect */
-    unselect = (value & CTRL_CMD_MODE_MASK) != CTRL_USERMODE;
+    if (old_mode == CTRL_USERMODE) {
+        if (new_mode != CTRL_USERMODE) {
+            unselect = true;
+        }
 
-    /* A change of CTRL_CE_STOP_ACTIVE from 0 to 1, unselects the CS */
-    if (!(s->regs[s->r_ctrl0 + fl->cs] & CTRL_CE_STOP_ACTIVE) &&
-        value & CTRL_CE_STOP_ACTIVE) {
-        unselect = true;
+        /* A change of CTRL_CE_STOP_ACTIVE from 0 to 1, unselects the CS */
+        if (!(s->regs[s->r_ctrl0 + fl->cs] & CTRL_CE_STOP_ACTIVE) &&
+            value & CTRL_CE_STOP_ACTIVE) {
+            unselect = true;
+        }
+    } else {
+        if (new_mode != CTRL_USERMODE) {
+            unselect = true;
+        }
     }
 
     s->regs[s->r_ctrl0 + fl->cs] = value;
 
-    s->snoop_index = unselect ? SNOOP_OFF : SNOOP_START;
-
-    aspeed_smc_flash_do_select(fl, unselect);
+    if (unselect != s->unselect) {
+        s->snoop_index = unselect ? SNOOP_OFF : SNOOP_START;
+        aspeed_smc_flash_do_select(fl, unselect);
+    }
 }
 
 static void aspeed_smc_reset(DeviceState *d)
@@ -729,6 +742,8 @@ static void aspeed_smc_reset(DeviceState *d)
         qemu_set_irq(s->cs_lines[i], true);
     }
 
+    s->unselect = true;
+
     /* setup the default segment register values and regions for all */
     for (i = 0; i < asc->cs_num_max; ++i) {
         aspeed_smc_flash_set_segment_region(s, i,
@@ -1261,12 +1276,13 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription vmstate_aspeed_smc = {
     .name = "aspeed.smc",
-    .version_id = 2,
+    .version_id = 3,
     .minimum_version_id = 2,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, AspeedSMCState, ASPEED_SMC_R_MAX),
         VMSTATE_UINT8(snoop_index, AspeedSMCState),
         VMSTATE_UINT8(snoop_dummies, AspeedSMCState),
+        VMSTATE_BOOL(unselect, AspeedSMCState),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 234dca32b0..25b95e7406 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -82,6 +82,7 @@ struct AspeedSMCState {
 
     uint8_t snoop_index;
     uint8_t snoop_dummies;
+    bool unselect;
 };
 
 typedef struct AspeedSegments {
-- 
2.34.1

