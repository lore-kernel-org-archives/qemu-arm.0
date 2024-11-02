Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1071401njc;
        Sat, 2 Nov 2024 05:58:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6yG52cTZ0IgPymGnX4XldoBkjqWSKFS4e5mLiHXljxA8IZ5BHqF0b7r424CNBjPrPHKNj7SI74M5aMg==@linaro.org
X-Google-Smtp-Source: AGHT+IG5PkAE/W2+0yPRyisalD5LhKFOQMKsqbWDm+EZ6Ps9vN5b/5LYWUT+7drCwBTAasS/CBbT
X-Received: by 2002:a05:6214:2aac:b0:6c3:5338:9116 with SMTP id 6a1803df08f44-6d35b964266mr132238056d6.23.1730552299099;
        Sat, 02 Nov 2024 05:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730552299; cv=none;
        d=google.com; s=arc-20240605;
        b=f+pQIRjblKErPtlyTfMR43RfBMqQupRzz+WmVZcBrjZQ5hhq7P2q0jed2KaIBwavSs
         bSMNbaLzzPUu/pA6kxSJjJWPC1nw8efYjhjoQD34vPSa3SUsvONgak7T6b7jB2assl9w
         Snx/gS8ez44c8oxLMlGZV8+hVEWvjC3qBXgT4MvyGtwJHawoWRptdpMFjOnj9W6ONvIl
         y+ITwpHxujpxdwLLSCsdGDqwmpyypkwyJQB5FmpbTpUeXREv7t/P8mQGDNIzYbcSTfFb
         hFx6Y5gsYWrMhsm6tFxFE5MxvcaVBtvS3qn1Vtw0BMisSg0kRZUAeNjK6yEbutC0xtIU
         gv6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ih14XklEVYarXqTz8g4uIjcvTf0R6rom6BFWnySTnBQ=;
        fh=qpjL7Zwj5l+gIC/RnnIfZFJA7TCt3CoPesb0AS0kNe0=;
        b=MDWgSViHBB3Yho6RVRIa6xbgFG+NzWFvXumPKNU/iFoznTH985ZIkCZTg6ZncbjNo5
         SIjR/+vpoEunJNBQ4P/KZ88qYI+e7AKWqAMTDFJGCCDgqA9LvlbmXo0SY6e6YqPt45ap
         +7ZQzYRw7FVHbDBqIGcoAMOOUBxgR8XAtfif9t9iLxtbJw4PUt/cyF4m3RZszo7XN/B2
         7YCTFSLRrVRvqyFyaALOdNv5Ytv1AlFfCmU+SLXkb1Od3Oe6BZa8a0gz603frMFiew4T
         b+Ph1cxN9cLcI5b1eBitaIuKKOfGRejb7BO1ezugVz5f7jIaLiHzg19sbV3cb2epgWHs
         BhZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=YNZY10Tg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35418007fsi72774606d6.400.2024.11.02.05.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Nov 2024 05:58:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=YNZY10Tg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7DhL-0004LZ-Lt; Sat, 02 Nov 2024 08:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1t7DhG-0004K8-IS; Sat, 02 Nov 2024 08:57:42 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1t7DhD-0003Ws-MT; Sat, 02 Nov 2024 08:57:42 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9a68480164so405292666b.3; 
 Sat, 02 Nov 2024 05:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730552257; x=1731157057; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ih14XklEVYarXqTz8g4uIjcvTf0R6rom6BFWnySTnBQ=;
 b=YNZY10TgC2ZC6fN4T62Cery2dcMDw1qaRHYBMde9mSuHWlDGoX5/YAYGtKNU7yoFsT
 VU6d2w2/gbVF/k+Buj7hLlYbftgoLLrxZga2Of2qAEt0YGrkANxx/db5X9hfH4MGho5X
 XNMV78bC/hEkILk/rLvFwlDJLKzqRdupWc7YLkKA09FQlatbQd9kY8R1C3jXHG8OIBXH
 e5wOurxymAL9qQrzrisRF+NDvEigr7VH7YF6S0sATfXOi2fHYUwQOzTRViLutm4zF0N9
 AQrDTkXwVKOXz2bzcR8DQQIf5uTAJbVFL7EKVB9X/w3O9oxID+httHC7XuASi7Uq2kex
 h15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730552257; x=1731157057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ih14XklEVYarXqTz8g4uIjcvTf0R6rom6BFWnySTnBQ=;
 b=QrsaNKxzy4c11SOohO4PIHK7D/CfkQqEXnM3gRkxF9JDJSqNav4HlJYN7+oCkqk+Dn
 hSHRWiK4XlIkczgEYZDimBD+ilxwnNmT18SfQDMll8B/bRM79bFcW4VFm+j3yGtpt6pS
 1KokyLtsTdZvV4sKNbJg+hAzfgr3wFTfLrS4r7rKu/EPnQpAieoIyxFKlGn9JGIl7/RV
 0HmO9+/5KvJBWLwGUXgbSp8JbyLTDIjGdR7ZYCqWWSXmHOsKuUq0xLoSv3j+OEcbh1WI
 ZPQNOr/xPNErvNsUeYOaDG2+UcE7vTQ6GLCA7doTJlRjm+hoghUurq+5fvG7J7ltfd/U
 M7SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwEbjSgZr7Olsp9g3xwJr32kLcdSr4eqDhxx1SjpnJo3I5rfFhAVi0ru5YpZaIfuvM+3zDP9JJJA==@nongnu.org
X-Gm-Message-State: AOJu0Yzr5ZfOphQZXOTV+eoO3jYjyaJfwr33cWOVdNDP+0OBYoEos04k
 SuKhNRFG6dn8tnibpynYBNetIzA090ItQoswmp6xFg3rCCfqlUzCX5neCQ==
X-Received: by 2002:a17:907:7f13:b0:a99:5f2a:444d with SMTP id
 a640c23a62f3a-a9de61a0feemr2678464466b.56.1730552257208; 
 Sat, 02 Nov 2024 05:57:37 -0700 (PDT)
Received: from archlinux.. (pd9ed7f6d.dip0.t-ipconnect.de. [217.237.127.109])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e566846a7sm305836666b.206.2024.11.02.05.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 05:57:36 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 2/5] hw/net/lan9118_phy: Reuse in imx_fec and consolidate
 implementations
Date: Sat,  2 Nov 2024 13:57:21 +0100
Message-ID: <20241102125724.532843-3-shentey@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241102125724.532843-1-shentey@gmail.com>
References: <20241102125724.532843-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wPp0Z7l3oPRZ

imx_fec models the same PHY as lan9118_phy. The code is almost the same with
imx_fec having more logging and tracing. Merge these improvements into
lan9118_phy and reuse in imx_fec to fix the code duplication.

Some migration state how resides in the new device model which breaks migration
compatibility for the following machines:
* imx25-pdk
* sabrelite
* mcimx7d-sabre
* mcimx6ul-evk

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/net/imx_fec.h |   9 ++-
 hw/net/imx_fec.c         | 146 ++++-----------------------------------
 hw/net/lan9118_phy.c     |  82 ++++++++++++++++------
 hw/net/Kconfig           |   1 +
 hw/net/trace-events      |  10 +--
 5 files changed, 85 insertions(+), 163 deletions(-)

diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index 2d13290c78..83b21637ee 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -31,6 +31,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(IMXFECState, IMX_FEC)
 #define TYPE_IMX_ENET "imx.enet"
 
 #include "hw/sysbus.h"
+#include "hw/net/lan9118_phy.h"
+#include "hw/irq.h"
 #include "net/net.h"
 
 #define ENET_EIR               1
@@ -264,11 +266,8 @@ struct IMXFECState {
     uint32_t tx_descriptor[ENET_TX_RING_NUM];
     uint32_t tx_ring_num;
 
-    uint32_t phy_status;
-    uint32_t phy_control;
-    uint32_t phy_advertise;
-    uint32_t phy_int;
-    uint32_t phy_int_mask;
+    Lan9118PhyState mii;
+    IRQState mii_irq;
     uint32_t phy_num;
     bool phy_connected;
     struct IMXFECState *phy_consumer;
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 6294d29202..4ee6f74206 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -203,17 +203,12 @@ static const VMStateDescription vmstate_imx_eth_txdescs = {
 
 static const VMStateDescription vmstate_imx_eth = {
     .name = TYPE_IMX_FEC,
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, IMXFECState, ENET_MAX),
         VMSTATE_UINT32(rx_descriptor, IMXFECState),
         VMSTATE_UINT32(tx_descriptor[0], IMXFECState),
-        VMSTATE_UINT32(phy_status, IMXFECState),
-        VMSTATE_UINT32(phy_control, IMXFECState),
-        VMSTATE_UINT32(phy_advertise, IMXFECState),
-        VMSTATE_UINT32(phy_int, IMXFECState),
-        VMSTATE_UINT32(phy_int_mask, IMXFECState),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription * const []) {
@@ -222,14 +217,6 @@ static const VMStateDescription vmstate_imx_eth = {
     },
 };
 
-#define PHY_INT_ENERGYON            (1 << 7)
-#define PHY_INT_AUTONEG_COMPLETE    (1 << 6)
-#define PHY_INT_FAULT               (1 << 5)
-#define PHY_INT_DOWN                (1 << 4)
-#define PHY_INT_AUTONEG_LP          (1 << 3)
-#define PHY_INT_PARFAULT            (1 << 2)
-#define PHY_INT_AUTONEG_PAGE        (1 << 1)
-
 static void imx_eth_update(IMXFECState *s);
 
 /*
@@ -238,47 +225,19 @@ static void imx_eth_update(IMXFECState *s);
  * For now we don't handle any GPIO/interrupt line, so the OS will
  * have to poll for the PHY status.
  */
-static void imx_phy_update_irq(IMXFECState *s)
-{
-    imx_eth_update(s);
-}
-
-static void imx_phy_update_link(IMXFECState *s)
+static void imx_phy_update_irq(void *opaque, int n, int level)
 {
-    /* Autonegotiation status mirrors link status.  */
-    if (qemu_get_queue(s->nic)->link_down) {
-        trace_imx_phy_update_link("down");
-        s->phy_status &= ~0x0024;
-        s->phy_int |= PHY_INT_DOWN;
-    } else {
-        trace_imx_phy_update_link("up");
-        s->phy_status |= 0x0024;
-        s->phy_int |= PHY_INT_ENERGYON;
-        s->phy_int |= PHY_INT_AUTONEG_COMPLETE;
-    }
-    imx_phy_update_irq(s);
+    imx_eth_update(opaque);
 }
 
 static void imx_eth_set_link(NetClientState *nc)
 {
-    imx_phy_update_link(IMX_FEC(qemu_get_nic_opaque(nc)));
-}
-
-static void imx_phy_reset(IMXFECState *s)
-{
-    trace_imx_phy_reset();
-
-    s->phy_status = 0x7809;
-    s->phy_control = 0x3000;
-    s->phy_advertise = 0x01e1;
-    s->phy_int_mask = 0;
-    s->phy_int = 0;
-    imx_phy_update_link(s);
+    lan9118_phy_update_link(&IMX_FEC(qemu_get_nic_opaque(nc))->mii,
+                            nc->link_down);
 }
 
 static uint32_t imx_phy_read(IMXFECState *s, int reg)
 {
-    uint32_t val;
     uint32_t phy = reg / 32;
 
     if (!s->phy_connected) {
@@ -296,54 +255,7 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
 
     reg %= 32;
 
-    switch (reg) {
-    case 0:     /* Basic Control */
-        val = s->phy_control;
-        break;
-    case 1:     /* Basic Status */
-        val = s->phy_status;
-        break;
-    case 2:     /* ID1 */
-        val = 0x0007;
-        break;
-    case 3:     /* ID2 */
-        val = 0xc0d1;
-        break;
-    case 4:     /* Auto-neg advertisement */
-        val = s->phy_advertise;
-        break;
-    case 5:     /* Auto-neg Link Partner Ability */
-        val = 0x0f71;
-        break;
-    case 6:     /* Auto-neg Expansion */
-        val = 1;
-        break;
-    case 29:    /* Interrupt source.  */
-        val = s->phy_int;
-        s->phy_int = 0;
-        imx_phy_update_irq(s);
-        break;
-    case 30:    /* Interrupt mask */
-        val = s->phy_int_mask;
-        break;
-    case 17:
-    case 18:
-    case 27:
-    case 31:
-        qemu_log_mask(LOG_UNIMP, "[%s.phy]%s: reg %d not implemented\n",
-                      TYPE_IMX_FEC, __func__, reg);
-        val = 0;
-        break;
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad address at offset %d\n",
-                      TYPE_IMX_FEC, __func__, reg);
-        val = 0;
-        break;
-    }
-
-    trace_imx_phy_read(val, phy, reg);
-
-    return val;
+    return lan9118_phy_read(&s->mii, reg);
 }
 
 static void imx_phy_write(IMXFECState *s, int reg, uint32_t val)
@@ -365,39 +277,7 @@ static void imx_phy_write(IMXFECState *s, int reg, uint32_t val)
 
     reg %= 32;
 
-    trace_imx_phy_write(val, phy, reg);
-
-    switch (reg) {
-    case 0:     /* Basic Control */
-        if (val & 0x8000) {
-            imx_phy_reset(s);
-        } else {
-            s->phy_control = val & 0x7980;
-            /* Complete autonegotiation immediately.  */
-            if (val & 0x1000) {
-                s->phy_status |= 0x0020;
-            }
-        }
-        break;
-    case 4:     /* Auto-neg advertisement */
-        s->phy_advertise = (val & 0x2d7f) | 0x80;
-        break;
-    case 30:    /* Interrupt mask */
-        s->phy_int_mask = val & 0xff;
-        imx_phy_update_irq(s);
-        break;
-    case 17:
-    case 18:
-    case 27:
-    case 31:
-        qemu_log_mask(LOG_UNIMP, "[%s.phy)%s: reg %d not implemented\n",
-                      TYPE_IMX_FEC, __func__, reg);
-        break;
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad address at offset %d\n",
-                      TYPE_IMX_FEC, __func__, reg);
-        break;
-    }
+    lan9118_phy_write(&s->mii, reg, val);
 }
 
 static void imx_fec_read_bd(IMXFECBufDesc *bd, dma_addr_t addr)
@@ -682,9 +562,6 @@ static void imx_eth_reset(DeviceState *d)
 
     s->rx_descriptor = 0;
     memset(s->tx_descriptor, 0, sizeof(s->tx_descriptor));
-
-    /* We also reset the PHY */
-    imx_phy_reset(s);
 }
 
 static uint32_t imx_default_read(IMXFECState *s, uint32_t index)
@@ -1329,6 +1206,13 @@ static void imx_eth_realize(DeviceState *dev, Error **errp)
     sysbus_init_irq(sbd, &s->irq[0]);
     sysbus_init_irq(sbd, &s->irq[1]);
 
+    qemu_init_irq(&s->mii_irq, imx_phy_update_irq, s, 0);
+    object_initialize_child(OBJECT(s), "mii", &s->mii, TYPE_LAN9118_PHY);
+    if (!sysbus_realize_and_unref(SYS_BUS_DEVICE(&s->mii), errp)) {
+        return;
+    }
+    qdev_connect_gpio_out(DEVICE(&s->mii), 0, &s->mii_irq);
+
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
 
     s->nic = qemu_new_nic(&imx_eth_net_info, &s->conf,
diff --git a/hw/net/lan9118_phy.c b/hw/net/lan9118_phy.c
index b22c3c2855..d2dcd732ac 100644
--- a/hw/net/lan9118_phy.c
+++ b/hw/net/lan9118_phy.c
@@ -4,6 +4,8 @@
  * Copyright (c) 2009 CodeSourcery, LLC.
  * Written by Paul Brook
  *
+ * Copyright (c) 2013 Jean-Christophe Dubois. <jcd@tribudubois.net>
+ *
  * This code is licensed under the GNU GPL v2
  *
  * Contributions after 2012-01-13 are licensed under the terms of the
@@ -16,6 +18,7 @@
 #include "hw/resettable.h"
 #include "migration/vmstate.h"
 #include "qemu/log.h"
+#include "trace.h"
 
 #define PHY_INT_ENERGYON            (1 << 7)
 #define PHY_INT_AUTONEG_COMPLETE    (1 << 6)
@@ -36,59 +39,88 @@ uint16_t lan9118_phy_read(Lan9118PhyState *s, int reg)
 
     switch (reg) {
     case 0: /* Basic Control */
-        return s->control;
+        val = s->control;
+        break;
     case 1: /* Basic Status */
-        return s->status;
+        val = s->status;
+        break;
     case 2: /* ID1 */
-        return 0x0007;
+        val = 0x0007;
+        break;
     case 3: /* ID2 */
-        return 0xc0d1;
+        val = 0xc0d1;
+        break;
     case 4: /* Auto-neg advertisement */
-        return s->advertise;
+        val = s->advertise;
+        break;
     case 5: /* Auto-neg Link Partner Ability */
-        return 0x0f71;
+        val = 0x0f71;
+        break;
     case 6: /* Auto-neg Expansion */
-        return 1;
-        /* TODO 17, 18, 27, 29, 30, 31 */
+        val = 1;
+        break;
     case 29: /* Interrupt source. */
         val = s->ints;
         s->ints = 0;
         lan9118_phy_update_irq(s);
-        return val;
+        break;
     case 30: /* Interrupt mask */
-        return s->int_mask;
+        val = s->int_mask;
+        break;
+    case 17:
+    case 18:
+    case 27:
+    case 31:
+        qemu_log_mask(LOG_UNIMP, "%s: reg %d not implemented\n",
+                      __func__, reg);
+        val = 0;
+        break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "lan9118_phy_read: PHY read reg %d\n", reg);
-        return 0;
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address at offset %d\n",
+                      __func__, reg);
+        val = 0;
+        break;
     }
+
+    trace_lan9118_phy_read(val, reg);
+
+    return val;
 }
 
 void lan9118_phy_write(Lan9118PhyState *s, int reg, uint16_t val)
 {
+    trace_lan9118_phy_write(val, reg);
+
     switch (reg) {
     case 0: /* Basic Control */
         if (val & 0x8000) {
             lan9118_phy_reset(s);
-            break;
-        }
-        s->control = val & 0x7980;
-        /* Complete autonegotiation immediately. */
-        if (val & 0x1000) {
-            s->status |= 0x0020;
+        } else {
+            s->control = val & 0x7980;
+            /* Complete autonegotiation immediately. */
+            if (val & 0x1000) {
+                s->status |= 0x0020;
+            }
         }
         break;
     case 4: /* Auto-neg advertisement */
         s->advertise = (val & 0x2d7f) | 0x80;
         break;
-        /* TODO 17, 18, 27, 31 */
     case 30: /* Interrupt mask */
         s->int_mask = val & 0xff;
         lan9118_phy_update_irq(s);
         break;
+    case 17:
+    case 18:
+    case 27:
+    case 31:
+        qemu_log_mask(LOG_UNIMP, "%s: reg %d not implemented\n",
+                      __func__, reg);
+        break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "lan9118_phy_write: PHY write reg %d = 0x%04x\n", reg, val);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address at offset %d\n",
+                      __func__, reg);
+        break;
     }
 }
 
@@ -98,9 +130,11 @@ void lan9118_phy_update_link(Lan9118PhyState *s, bool link_down)
 
     /* Autonegotiation status mirrors link status. */
     if (link_down) {
+        trace_lan9118_phy_update_link("down");
         s->status &= ~0x0024;
         s->ints |= PHY_INT_DOWN;
     } else {
+        trace_lan9118_phy_update_link("up");
         s->status |= 0x0024;
         s->ints |= PHY_INT_ENERGYON;
         s->ints |= PHY_INT_AUTONEG_COMPLETE;
@@ -110,6 +144,8 @@ void lan9118_phy_update_link(Lan9118PhyState *s, bool link_down)
 
 void lan9118_phy_reset(Lan9118PhyState *s)
 {
+    trace_lan9118_phy_reset();
+
     s->control = 0x3000;
     s->status = 0x7809;
     s->advertise = 0x01e1;
@@ -137,8 +173,8 @@ static const VMStateDescription vmstate_lan9118_phy = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (const VMStateField[]) {
-        VMSTATE_UINT16(control, Lan9118PhyState),
         VMSTATE_UINT16(status, Lan9118PhyState),
+        VMSTATE_UINT16(control, Lan9118PhyState),
         VMSTATE_UINT16(advertise, Lan9118PhyState),
         VMSTATE_UINT16(ints, Lan9118PhyState),
         VMSTATE_UINT16(int_mask, Lan9118PhyState),
diff --git a/hw/net/Kconfig b/hw/net/Kconfig
index 6b2ff2f937..7f80218d10 100644
--- a/hw/net/Kconfig
+++ b/hw/net/Kconfig
@@ -93,6 +93,7 @@ config ALLWINNER_SUN8I_EMAC
 
 config IMX_FEC
     bool
+    select LAN9118_PHY
 
 config CADENCE
     bool
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 91a3d0c054..e694d5823a 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -10,6 +10,12 @@ allwinner_sun8i_emac_set_link(bool active) "Set link: active=%u"
 allwinner_sun8i_emac_read(uint64_t offset, uint64_t val) "MMIO read: offset=0x%" PRIx64 " value=0x%" PRIx64
 allwinner_sun8i_emac_write(uint64_t offset, uint64_t val) "MMIO write: offset=0x%" PRIx64 " value=0x%" PRIx64
 
+# lan9118_phy.c
+lan9118_phy_read(uint16_t val, int reg) "[0x%02x] -> 0x%04" PRIx16
+lan9118_phy_write(uint16_t val, int reg) "[0x%02x] <- 0x%04" PRIx16
+lan9118_phy_update_link(const char *s) "%s"
+lan9118_phy_reset(void) ""
+
 # lance.c
 lance_mem_readw(uint64_t addr, uint32_t ret) "addr=0x%"PRIx64"val=0x%04x"
 lance_mem_writew(uint64_t addr, uint32_t val) "addr=0x%"PRIx64"val=0x%04x"
@@ -428,12 +434,8 @@ i82596_set_multicast(uint16_t count) "Added %d multicast entries"
 i82596_channel_attention(void *s) "%p: Received CHANNEL ATTENTION"
 
 # imx_fec.c
-imx_phy_read(uint32_t val, int phy, int reg) "0x%04"PRIx32" <= phy[%d].reg[%d]"
 imx_phy_read_num(int phy, int configured) "read request from unconfigured phy %d (configured %d)"
-imx_phy_write(uint32_t val, int phy, int reg) "0x%04"PRIx32" => phy[%d].reg[%d]"
 imx_phy_write_num(int phy, int configured) "write request to unconfigured phy %d (configured %d)"
-imx_phy_update_link(const char *s) "%s"
-imx_phy_reset(void) ""
 imx_fec_read_bd(uint64_t addr, int flags, int len, int data) "tx_bd 0x%"PRIx64" flags 0x%04x len %d data 0x%08x"
 imx_enet_read_bd(uint64_t addr, int flags, int len, int data, int options, int status) "tx_bd 0x%"PRIx64" flags 0x%04x len %d data 0x%08x option 0x%04x status 0x%04x"
 imx_eth_tx_bd_busy(void) "tx_bd ran out of descriptors to transmit"
-- 
2.47.0

