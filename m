Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15CDCA5FEC
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 12:36:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDLJf-0006Q2-1f; Sun, 04 Oct 2026 08:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJb-0006O0-Kc
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:40 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJZ-00075d-OU
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:39 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-4a024e16179so5302175e9.2
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 05:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791116856; x=1791721656; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gRy8WWXvEYtZQPX3GEr0tmWE4nqxjkXA7yTxqBnrb2k=;
 b=G+CM2elZyysy1SR2pK9qGTCLjDF/V6MUtTGJ54JaSZJ1G8TDynAo4RXegk+gS2b6LT
 q716MdFR/CXGY6cfxldvU9v2+0j4EinhkIk7eHCXDwwsO386GcTaI3h74Lk48uO6WOB6
 v/s8RQdq65eDvNYJkTBnC/PJmfKaWraSb6hYf5pLEDp0uoh7KKbSPLFlnMkl1zcNv5Dr
 3ax63kp7dLmGfNS4g8azv37GDFTWYtL+yHkbegU5BZkf1bduskecmiFtJMhdeTsff0T7
 ffwc0ffViX/EfWJz6Z7kwc+jC+YsL5EIJwcVNUgjMRo77Gj8m9QZFEODqPHdouTIfJ6d
 /W4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791116856; x=1791721656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gRy8WWXvEYtZQPX3GEr0tmWE4nqxjkXA7yTxqBnrb2k=;
 b=WiE0A3PHQ3fwcYH/INyd97r9ssNLABr8TKXpEV3jNx8bMxE+q8Wg772hQlspRQnFTA
 H4kS9RBh04619mAZXYNUsATiQW9Az6tD4zsrY4GOP7nDXxg0p4MVogu26Z8V1wTIUnzP
 LLs3G4cCXuph6OaG1Fz6nbZnUnlEw74IdSuwzZVQJ/uvmdx7nXKZqm4bIc0jxAG/aHQv
 e3z0S6NVDsNMnDrSDZZObdl3J/cKgY9JsJ+4jPIZICMAxXem9grvoytOtmeHyRHYx+M6
 MqD12rZ260TcAZmiyWT3w39Xzt6YAdisYgqE5LhXdqaJC5TNnZSzwkSD3gG1WsuB4iqL
 YL2g==
X-Forwarded-Encrypted: i=1;
 AKwUvBwlIgotW8TIR7EZMg4iTsAWKr7U2YbV+nzHNrkDAFzQi+uZs5hxBYQM9ZCayinOsi4DV2ggJJk/ZA==@nongnu.org
X-Gm-Message-State: AFuF++kxH4q76MbJLjY5Xh2XCb5Lmv+l6OW3D60umsW8HblG9do434Ri
 HEZZB8kwJ6WcRt17qyWl+SbDAkArLoMAC+yUHoHRqxtq7EhoMdbTLWS8
X-Gm-Gg: AYBFou2t6/eShqH6iEvhznYy5C7s8D2y0A2XRF5Mw0RMQHjOaPP4GNAS19+AZLonKvl
 bebi7GPN4NdSa+QewwTXlYKmggSMcew857AU1I16BLSIISu7PEqj8Rl6jEtplxxQK0Dgs7K06kp
 Vu8UTdJjjrQr/54LTfx9gs+BcRSj8G3c9MT5rZMiNMefkU5J82WnVXi8apIqjVKhmAyeX8XBNfI
 3j5ALePaN8mdTbpVubZjBbXIUlg2xsOC0TQvP8goAfU8n/V1JK/3X3zdTpjVdHS2yUrZjeDmFLS
 TURhG0F5fpSYuwcqNkx4gmf6aGrEszwbq7xByhptHtgkp2fgUDAip0kwW3OZGesg5XYsBS5IN3T
 nsEmw5/+tOF0DQqsfzNEqNigLjOHG0gxh2lYGcowNbFFItU2n49O+ygI0SYyGrul8iTom8oUDr7
 /4RM6pCBm4NS2pYI54wKqGCR+4p9JFIfZjNtvqaeWiVWEfZ4vepr8TSuP6YULLwzRA6yOydTCYq
 AoMzBQI8VPOiwslGOupz5ARVdHTfhT3RjwPsQ==
X-Received: by 2002:a05:600c:5391:b0:4a0:c2a:485e with SMTP id
 5b1f17b1804b1-4a02769a99cmr146426475e9.33.1791116856050; 
 Sun, 04 Oct 2026 05:27:36 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027698f13sm242319975e9.1.2026.10.04.05.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 05:27:35 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 03/30] hw/watchdog/wdt_imx2: Remove redundant attributes
Date: Sun,  4 Oct 2026 14:26:19 +0200
Message-ID: <20261004122647.3913-4-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004122647.3913-1-shentey@gmail.com>
References: <20261004122647.3913-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Since WDT and WDE are write one once bits, their values always
correspond with their respective locked attributes. Thus, the attributes
are redundant. Take advantage of this observation to simplify the code.

Note that removing the attributes changes the vmstate structure which
constitutes a migration break. This is allowed since QEMU does not
guarantee migration compatibility for i.MX devices between feature
releases.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/watchdog/wdt_imx2.h |  2 --
 hw/watchdog/wdt_imx2.c         | 21 ++++-----------------
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/include/hw/watchdog/wdt_imx2.h b/include/hw/watchdog/wdt_imx2.h
index fc01fc46e7..0bf2903959 100644
--- a/include/hw/watchdog/wdt_imx2.h
+++ b/include/hw/watchdog/wdt_imx2.h
@@ -84,8 +84,6 @@ struct IMX2WdtState {
     uint16_t wmcr;
 
     bool wcr_locked;            /* affects WDZST, WDBG, and WDW */
-    bool wcr_wde_locked;        /* affects WDE */
-    bool wcr_wdt_locked;        /* affects WDT, cleared on POR */
 };
 
 #endif /* WDT_IMX2_H */
diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
index dc7751bd5a..e9cb5819e4 100644
--- a/hw/watchdog/wdt_imx2.c
+++ b/hw/watchdog/wdt_imx2.c
@@ -59,8 +59,6 @@ static void imx2_wdt_reset(DeviceState *dev)
 
     s->wicr_locked = false;
     s->wcr_locked = false;
-    s->wcr_wde_locked = false;
-    s->wcr_wdt_locked = false;
 
     s->wcr = IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS;
     s->wsr = 0;
@@ -156,24 +154,14 @@ static void imx2_wdt_write(void *opaque, hwaddr addr,
     switch (addr) {
     case IMX2_WDT_WCR:
         if (s->wcr_locked) {
+            /* WDZST, WDBG, and WDW are write-once bits */
             value &= ~IMX2_WDT_WCR_LOCK_MASK;
             value |= (s->wcr & IMX2_WDT_WCR_LOCK_MASK);
         }
         s->wcr_locked = true;
-        if (s->wcr_wde_locked) {
-            value &= ~IMX2_WDT_WCR_WDE;
-            value |= (s->wcr & ~IMX2_WDT_WCR_WDE);
-        } else if (value & IMX2_WDT_WCR_WDE) {
-            s->wcr_wde_locked = true;
-        }
-        if (s->wcr_wdt_locked) {
-            value &= ~IMX2_WDT_WCR_WDT;
-            value |= (s->wcr & ~IMX2_WDT_WCR_WDT);
-        } else if (value & IMX2_WDT_WCR_WDT) {
-            s->wcr_wdt_locked = true;
-        }
 
-        s->wcr = value;
+        /* WDT and WDE are write one once bits */
+        s->wcr = value | (s->wcr & (IMX2_WDT_WCR_WDT | IMX2_WDT_WCR_WDE));
         if (!(value & IMX2_WDT_WCR_SRS)) {
             s->wrsr = IMX2_WDT_WRSR_SFTW;
         }
@@ -234,13 +222,12 @@ static const MemoryRegionOps imx2_wdt_ops = {
 
 static const VMStateDescription vmstate_imx2_wdt = {
     .name = "imx2.wdt",
+    .version_id = 1,
     .fields = (const VMStateField[]) {
         VMSTATE_PTIMER(timer, IMX2WdtState),
         VMSTATE_PTIMER(itimer, IMX2WdtState),
         VMSTATE_BOOL(wicr_locked, IMX2WdtState),
         VMSTATE_BOOL(wcr_locked, IMX2WdtState),
-        VMSTATE_BOOL(wcr_wde_locked, IMX2WdtState),
-        VMSTATE_BOOL(wcr_wdt_locked, IMX2WdtState),
         VMSTATE_UINT16(wcr, IMX2WdtState),
         VMSTATE_UINT16(wsr, IMX2WdtState),
         VMSTATE_UINT16(wrsr, IMX2WdtState),
-- 
2.56.0


