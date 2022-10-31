Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp930899ejc;
        Mon, 31 Oct 2022 05:35:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6LVe7OZxbPYoQZgcr3xTfGPQ7Aefi6qvp3xkxNW+VYj+c5pmItZOdsNKx7KtnimFw2AX60
X-Received: by 2002:ac8:5d49:0:b0:39a:4f7:e0b2 with SMTP id g9-20020ac85d49000000b0039a04f7e0b2mr10025774qtx.119.1667219758875;
        Mon, 31 Oct 2022 05:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667219758; cv=none;
        d=google.com; s=arc-20160816;
        b=UVe340IG+UOL9Hu+jBxybNngnA9Vj6Xu7+Y6X8XhP5qww2SANfzdp7ODPMkqMQvYCF
         ao4W7u4zkni576k80S4SQsa70uBBIW0hBpa8CAirCf7ammXzkiBBZ3rq28+Z31VOiOT+
         kbVyfq+hThPPxrIiwilf3KTX0jnOuXKjeATGggwCROZUCZj0gKk2x3IJ71+XVtWqpIox
         J+/aXQ2MN+vRBXy1bnLn68e/hMZAp8clH7IzhWVyXrhG7mQrF2tVaLbMAIxQ+3l5NmY9
         i50SjaR5BzdbuIlXi8Z6w6MAuOJQJRedVq1gRPHIA6i7c6FKx4c8UNkzm9QETyLiS2X3
         L+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NRuCwoKWiPF/zQ4ogg7uItA8DuEE4aQtCuC8AzGLcFo=;
        b=g/3of4VWswljHaWakGhcGdG+cX0cjdXxFVbbmBRewxYdNaHcGukWXikO5e35Gwr13F
         69HkODsXH3HQeZ8NPMizy5qpc5QrsWA0pqntjY080/yKRdjPBEb/A/UcUoJQ6fq3qlU/
         lesAR702bakXq1Afc/ixt1S+rQxTNesW2iwYfgqCM4KcrNClL+u7XzPpORkm0nOD7Y73
         cIVKoxJgzgX+QUa4IhIrHEjiNre4Bj/oAJsYoNHWtiTHSLyXJ96yWsvzx6DPYP9k0etA
         c6uZiEDro7FVaB9127sKx+VxUHXwSrGf4TO5u18KvIDMu1kX+RLBrv70hlLzdnv50v+f
         LzLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=ureHZbay;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz4-20020a0562140e6400b004bc04a08632si591564qvb.523.2022.10.31.05.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=ureHZbay;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opU0o-00060V-R8; Mon, 31 Oct 2022 08:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzq-0003YW-5X
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:34:31 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzn-0004Qg-4t
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:34:28 -0400
Received: by mail-pg1-x52c.google.com with SMTP id s196so10583712pgs.3
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 05:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRuCwoKWiPF/zQ4ogg7uItA8DuEE4aQtCuC8AzGLcFo=;
 b=ureHZbayRPBZR6d1zQc1t/5iOcN/AGpraBTkqRN47pKZg4fsEv514rLV3rBzPhv4mo
 aLqvXIiZbrXF+71zgSKW3uFTgLROsHy9HJ9+K4QXdGSGBLYYFJPB8LCg1uumUF8GxRNf
 eSOQgKu1/STEGjfpQSElV/KarOt1gAWBjC68EJqf+ySc+8//BUad4jpumpvwUxzikB8R
 W3I5gGJeXl+hoAJew9PaGNl9yTdgBTg4kjVfojJfXgJ/qrl8kNDVatmuMNb9ibXCkGL/
 fRcWhzptqyEJ1q+uw3nP0gz/1LnilTkkiIdqpZHAtEv8ZXL/MubsCvkLNgE1ar0+C8dF
 BBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRuCwoKWiPF/zQ4ogg7uItA8DuEE4aQtCuC8AzGLcFo=;
 b=Oxacv7NEMqn9NpfzHtAHwYHaboqfhsqIDHD2xSPj/V88GaMGCcpW6oah19PKEKRExo
 H4seAs9XvkBaKNdVkwfzu5E/gIrNLC5z6AwJD558rwHiKBe+18AwCquVJxP10+1GD/mR
 6jbnzF9dCkE4bQVr/XhJp0hSSKPL315OelM3Yxo5RZ6US1sQSrHVyvs8ny+oXZV8bLOJ
 sQj+GttzeQHBh3yA5KNUQze6C1xMO1dKCMDEaYSi4+9HncqfceHs5obc6ZvBr2Pj23kd
 OLa6KqdE1GCHH+6mtgobysZcTZCr9191ENrdixkYwIK1Kxw4k+8eWOtPfbEqRyEAAQUj
 lvjQ==
X-Gm-Message-State: ACrzQf2rwnCki3ENgY5MUU7WPFeDldcIbSBlGOrSqBkA0jiKzgZWtzk9
 MuEMpmiUf/hPI9P+fAsEuznbIg==
X-Received: by 2002:a63:6cc2:0:b0:46f:cec6:c9b2 with SMTP id
 h185-20020a636cc2000000b0046fcec6c9b2mr3097878pgc.167.1667219664924; 
 Mon, 31 Oct 2022 05:34:24 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a6545ca000000b0042b5095b7b4sm4093810pgr.5.2022.10.31.05.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:34:24 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v6 11/17] pci/shpc: Omit errp for pci_add_capability
Date: Mon, 31 Oct 2022 21:33:13 +0900
Message-Id: <20221031123319.21532-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031123319.21532-1-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: hw5KyY/Gkmqv

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. A caller of shpc_init(), which calls
pci_add_capability() in turn, is expected to ensure that will not
happen.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci-bridge/pci_bridge_dev.c  |  2 +-
 hw/pci-bridge/pcie_pci_bridge.c |  2 +-
 hw/pci/shpc.c                   | 23 ++++++-----------------
 include/hw/pci/shpc.h           |  3 +--
 4 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_dev.c
index 657a06ddbe..4b6d1876eb 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -66,7 +66,7 @@ static void pci_bridge_dev_realize(PCIDevice *dev, Error **errp)
         dev->config[PCI_INTERRUPT_PIN] = 0x1;
         memory_region_init(&bridge_dev->bar, OBJECT(dev), "shpc-bar",
                            shpc_bar_size(dev));
-        err = shpc_init(dev, &br->sec_bus, &bridge_dev->bar, 0, errp);
+        err = shpc_init(dev, &br->sec_bus, &bridge_dev->bar, 0);
         if (err) {
             goto shpc_error;
         }
diff --git a/hw/pci-bridge/pcie_pci_bridge.c b/hw/pci-bridge/pcie_pci_bridge.c
index df5dfdd139..99778e3e24 100644
--- a/hw/pci-bridge/pcie_pci_bridge.c
+++ b/hw/pci-bridge/pcie_pci_bridge.c
@@ -42,7 +42,7 @@ static void pcie_pci_bridge_realize(PCIDevice *d, Error **errp)
     d->config[PCI_INTERRUPT_PIN] = 0x1;
     memory_region_init(&pcie_br->shpc_bar, OBJECT(d), "shpc-bar",
                        shpc_bar_size(d));
-    rc = shpc_init(d, &br->sec_bus, &pcie_br->shpc_bar, 0, errp);
+    rc = shpc_init(d, &br->sec_bus, &pcie_br->shpc_bar, 0);
     if (rc) {
         goto error;
     }
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index e71f3a7483..5b3228c793 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -440,16 +440,11 @@ static void shpc_cap_update_dword(PCIDevice *d)
 }
 
 /* Add SHPC capability to the config space for the device. */
-static int shpc_cap_add_config(PCIDevice *d, Error **errp)
+static void shpc_cap_add_config(PCIDevice *d)
 {
     uint8_t *config;
-    int config_offset;
-    config_offset = pci_add_capability(d, PCI_CAP_ID_SHPC,
-                                       0, SHPC_CAP_LENGTH,
-                                       errp);
-    if (config_offset < 0) {
-        return config_offset;
-    }
+    uint8_t config_offset;
+    config_offset = pci_add_capability(d, PCI_CAP_ID_SHPC, 0, SHPC_CAP_LENGTH);
     config = d->config + config_offset;
 
     pci_set_byte(config + SHPC_CAP_DWORD_SELECT, 0);
@@ -459,7 +454,6 @@ static int shpc_cap_add_config(PCIDevice *d, Error **errp)
     /* Make dword select and data writable. */
     pci_set_byte(d->wmask + config_offset + SHPC_CAP_DWORD_SELECT, 0xff);
     pci_set_long(d->wmask + config_offset + SHPC_CAP_DWORD_DATA, 0xffffffff);
-    return 0;
 }
 
 static uint64_t shpc_mmio_read(void *opaque, hwaddr addr,
@@ -584,18 +578,13 @@ void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 }
 
 /* Initialize the SHPC structure in bridge's BAR. */
-int shpc_init(PCIDevice *d, PCIBus *sec_bus, MemoryRegion *bar,
-              unsigned offset, Error **errp)
+int shpc_init(PCIDevice *d, PCIBus *sec_bus, MemoryRegion *bar, unsigned offset)
 {
-    int i, ret;
+    int i;
     int nslots = SHPC_MAX_SLOTS; /* TODO: qdev property? */
     SHPCDevice *shpc = d->shpc = g_malloc0(sizeof(*d->shpc));
     shpc->sec_bus = sec_bus;
-    ret = shpc_cap_add_config(d, errp);
-    if (ret) {
-        g_free(d->shpc);
-        return ret;
-    }
+    shpc_cap_add_config(d);
     if (nslots < SHPC_MIN_SLOTS) {
         return 0;
     }
diff --git a/include/hw/pci/shpc.h b/include/hw/pci/shpc.h
index d5683b7399..18ab16ec9f 100644
--- a/include/hw/pci/shpc.h
+++ b/include/hw/pci/shpc.h
@@ -38,8 +38,7 @@ struct SHPCDevice {
 
 void shpc_reset(PCIDevice *d);
 int shpc_bar_size(PCIDevice *dev);
-int shpc_init(PCIDevice *dev, PCIBus *sec_bus, MemoryRegion *bar,
-              unsigned off, Error **errp);
+int shpc_init(PCIDevice *dev, PCIBus *sec_bus, MemoryRegion *bar, unsigned off);
 void shpc_cleanup(PCIDevice *dev, MemoryRegion *bar);
 void shpc_free(PCIDevice *dev);
 void shpc_cap_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len);
-- 
2.38.1

