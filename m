Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD2DC982ED
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:51:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lsW-0007J1-GK; Mon, 21 Sep 2026 17:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lsI-0006rl-Ax
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:35 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lsG-0000RU-Iw
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:34 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912e4b11so18639645e9.3
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027301; x=1790632101; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tmDgfriYvkY/+9mcvd2kxTZA0rXYs31L3FvnP3UTMHI=;
 b=ITv+PqehzLqoo4tdY+KEC9ldxV/bKq2cO4dwJS6yl5YPgs52PEn5hnPqgmRwYg3FIz
 03/EWVL3AUk+DUIkhAwG1R4SWLC/q6KS6DB6sB2jNUwB5YPjg2CqueVcx94Uha5xL4Oa
 6GEzBaX6RgBaAvzSNv1ht+vY+HECmJaTWp0Jp/ghjKfrsIVcEjgOL9sTyfhoL2xQleJK
 r5LFUKgFwfV2H1VK1/yhimi7Wk72ygau4HF9+HGp9v57eLOXBGxFgl/HGQ9hnZG35JAm
 e60K9B2CkfHTE4YXEjExc+clC5EBen8I0oUFzDwiZGxnl0rTiAnf2l2Z9VBcbay3ZVLo
 wXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027301; x=1790632101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tmDgfriYvkY/+9mcvd2kxTZA0rXYs31L3FvnP3UTMHI=;
 b=nrzYykH9opmkzDoASgOosnsgaeAKT0HTvGTFP6pQ1bamO/8w+wXMTB5iERT+jWAGSQ
 LbiPSDL913LkaddMV5pRHRo3VJh90iKcVsqE2jEDFYAWn+7r8iXRIBwSJ1xY93J9J2oX
 788UwGLKiY9Hbe/seaXr8gTDIqLpRespS7F0/5uNrZExHqVHNzdJ+n4WTsrNVKdzKw3w
 8jWDFtfk122+Yc00e0sexTh6o6B+QZX5+gyJf4wtz9yqWbwU8ybd2A52H7NdmKaUZwOU
 1olkAD6djhx4ixQ6QFlo7j5JpYWEm4YXFMCKfNvXRS8WzyBA+PQkKQmLs7TzgGGtOCRD
 Dz/g==
X-Forwarded-Encrypted: i=1;
 AKwUvBwVPIX4GNbvOkm79phZUchixOY8Tv13nduQ/iFfOGMrzV8eYUrZ57MJWFXPoafwyvm40ZbRQa2Y6A==@nongnu.org
X-Gm-Message-State: AFuF++mWRrLzi3084mE3G8BJ3+ipfda52bcl9vJqgAhtjqOA1PZhbOC1
 vLokJIUgDVZk3IhqKSDrMpCIRTuF9MraJwbMPH1c7Ze6hjDao817CHCM
X-Gm-Gg: AYBFou2iZgYzQei2Mx/Esc3In6j3sJhY6GomnEjtT+x88H58pDwEC0FkrUk2Lg8OYwJ
 C/t9uIk6pvSrzAZIp7bk2b2qDFbMRxKiKPp4mJdFVgKzVnsrHydKkeCFBS5w7ED9IyxtwP7LBcq
 mr/kkdIw0oef4XTjhvn1OGrjSlYuDdmGIMjtU1qrS1cVhLTU86W97+/pz8RC95PStMP1wgQPPGK
 JYAZ0P9VNBuqFrZlCAbDzjYc39nBkOVAg8iPkOI4z4PhjrFSIci/11hiLfMzKKYqrIQ7ZE+7zuQ
 cCAi5ie1QC3SIHiJMDVyGhKqqYCE1SBOhzrSpLBsIxl7iOX2/Xi64Poj+5YW9OCiF3k+Z4yXHrK
 edz/zREpzqnSA9R9vIgHTYllojOYhkpXPQ4B+ZdI/0EDiRN2rWYvdAKRQxpbSsEDovCAmjh8uzU
 mCAwOn0RnqFCexFxAb/CIdDaJLz2QYSlwx9klJurS286TQSUxneJCCgex7CeRekDvcYlbm+82vX
 YJUsf7ln+ImGsHmw4sUvlwaI9TlFwe9YvLFwl3T/thnLcMtYHjXRtCnEM6gtuX2BtGb54ELYjFp
 A7CFr2JhhDBVfw==
X-Received: by 2002:a05:600c:1e24:b0:49c:fc6e:a3d2 with SMTP id
 5b1f17b1804b1-49fc574f74bmr166191595e9.17.1790027301174; 
 Mon, 21 Sep 2026 14:48:21 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:48:20 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 41/42] hw/net/lan9118_phy: Trace with QOM path
Date: Mon, 21 Sep 2026 23:47:09 +0200
Message-ID: <20260921214710.29422-42-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Some i.MX SoCs have multiple i.MX network IP blocks which in QEMU use
the LAN9118 Phy. Allow to distinguish them via their QOM path when
tracing.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/net/lan9118_phy.c | 10 +++++-----
 hw/net/trace-events  |  9 +++++----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/net/lan9118_phy.c b/hw/net/lan9118_phy.c
index 2fc027d112..ee87a51241 100644
--- a/hw/net/lan9118_phy.c
+++ b/hw/net/lan9118_phy.c
@@ -85,14 +85,14 @@ uint16_t lan9118_phy_read(Lan9118PhyState *s, int reg)
         break;
     }
 
-    trace_lan9118_phy_read(val, reg);
+    trace_lan9118_phy_read(DEVICE(s)->canonical_path, val, reg);
 
     return val;
 }
 
 void lan9118_phy_write(Lan9118PhyState *s, int reg, uint16_t val)
 {
-    trace_lan9118_phy_write(val, reg);
+    trace_lan9118_phy_write(DEVICE(s)->canonical_path, val, reg);
 
     switch (reg) {
     case MII_BMCR:
@@ -138,11 +138,11 @@ void lan9118_phy_update_link(Lan9118PhyState *s, bool link_down)
 
     /* Autonegotiation status mirrors link status. */
     if (link_down) {
-        trace_lan9118_phy_update_link("down");
+        trace_lan9118_phy_link_down(DEVICE(s)->canonical_path);
         s->status &= ~(MII_BMSR_AN_COMP | MII_BMSR_LINK_ST);
         s->ints |= PHY_INT_DOWN;
     } else {
-        trace_lan9118_phy_update_link("up");
+        trace_lan9118_phy_link_up(DEVICE(s)->canonical_path);
         s->status |= MII_BMSR_AN_COMP | MII_BMSR_LINK_ST;
         s->ints |= PHY_INT_ENERGYON;
         s->ints |= PHY_INT_AUTONEG_COMPLETE;
@@ -152,7 +152,7 @@ void lan9118_phy_update_link(Lan9118PhyState *s, bool link_down)
 
 void lan9118_phy_reset(Lan9118PhyState *s)
 {
-    trace_lan9118_phy_reset();
+    trace_lan9118_phy_reset(DEVICE(s)->canonical_path);
 
     s->control = MII_BMCR_AUTOEN | MII_BMCR_SPEED100;
     s->status = MII_BMSR_100TX_FD
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 81af808044..839a612d35 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -11,10 +11,11 @@ allwinner_sun8i_emac_read(uint64_t offset, uint64_t val) "MMIO read: offset=0x%"
 allwinner_sun8i_emac_write(uint64_t offset, uint64_t val) "MMIO write: offset=0x%" PRIx64 " value=0x%" PRIx64
 
 # lan9118_phy.c
-lan9118_phy_read(uint16_t val, int reg) "[0x%02x] -> 0x%04" PRIx16
-lan9118_phy_write(uint16_t val, int reg) "[0x%02x] <- 0x%04" PRIx16
-lan9118_phy_update_link(const char *s) "%s"
-lan9118_phy_reset(void) ""
+lan9118_phy_read(const char *path, uint16_t val, int reg) "%s: [0x%02x] -> 0x%04" PRIx16
+lan9118_phy_write(const char *path, uint16_t val, int reg) "%s: [0x%02x] <- 0x%04" PRIx16
+lan9118_phy_link_down(const char *path) "%s"
+lan9118_phy_link_up(const char *path) "%s"
+lan9118_phy_reset(const char *path) "%s"
 
 # lance.c
 lance_mem_readw(uint64_t addr, uint32_t ret) "addr=0x%"PRIx64"val=0x%04x"
-- 
2.55.0


