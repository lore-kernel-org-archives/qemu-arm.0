Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1431307ejc;
        Mon, 31 Oct 2022 18:01:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM56K1ZLezCTUe+Mr4k0IQ/aNMbVHPei9cTSCNOUQ5FU7CrMQRBOTbdeYtdaqEm2rVuXeDdl
X-Received: by 2002:a05:620a:11bb:b0:6fa:300d:af5f with SMTP id c27-20020a05620a11bb00b006fa300daf5fmr5158631qkk.621.1667264478529;
        Mon, 31 Oct 2022 18:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667264478; cv=none;
        d=google.com; s=arc-20160816;
        b=zdipseYrx/RkQx0Gy39LNUm/jX3FZ33U3RQH/o0WI0reHOw5KG+MU6+8Jvt99sFznD
         9Id8wwgeTPw/yavsn1xG9p52pJ+3fNWL1GJsc9P0zlthT/FJWb1iayB+jM07csAnNkif
         VkkHBE1bSKtTJABPeCCQqaYRQSwgZIJIsgDu693KH2uMajz0ACC51BcT8MaB8sJ3P2sA
         jhvS7ijrbas1F/52LeH6JZUtZUJJy2wdki+lugdrq4GrXVLMfQnb2pXqp7r3Hoh3Pcs9
         FvkmpL1Fju38w1mVELIZ+0EVERBCOhaH6EwDpnqUEBz/iI22LuVYL1rMqctK4CEWfZj2
         wdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ENEn0P7Y2heV6flYqbtW2H+Zea4rTiTJEEmDhl8ljMs=;
        b=0m8Nx6rGB/U2L4U8bGUMNwjLTqKHjYsnALnlUy9JuQMWxsgIeQO4yVrSFHYdjLtB8v
         dgdPv4HW2WPPUbZSz4CMzRCNU3t4hkeA9Fpe+v4G7zHezfm+WTjfv1xx8sHGaM9ATKJR
         BNt3eeeHuk+QiXhXNwIWUxVg/eeNCtloa4A1hxydmN5WGXuY9EUE9Kh9/Pueh3erGKE1
         fRCSo8tigVhvkEl3iim80raQ+O9qwNdu0NQize/ZB7mwltunZ7KeyACfObwPEsiS12Dg
         bw/EqTMLXbMFEjeQP/JDWbdecSA4kXquY57CVEJXHWO8Luq51vnZRcXmUbOLaG/j51Ix
         BaRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=PNrS1kzb;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm8-20020a05620a198800b006ee956d80afsi5537752qkb.27.2022.10.31.18.01.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 18:01:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=PNrS1kzb;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opfdO-0004gl-48; Mon, 31 Oct 2022 21:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfdH-0004Xh-Fu
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 20:59:59 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfdE-0006Az-4i
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 20:59:58 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r18so12106132pgr.12
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 17:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ENEn0P7Y2heV6flYqbtW2H+Zea4rTiTJEEmDhl8ljMs=;
 b=PNrS1kzbMsH6wkHT1EOoDxwJtrDQckHVj3ccTYgv1QCbkFOOkOoNSjpeQ1zDCQKIXe
 PDpHm1qnK81j+yl7j2jKL7eJN+ZWSXq5XLeIBtm7qfHoeJlJtjC7fB5q56z++Iqu6345
 11ozPZBb/g21yH2bsuT4pSz54YnjafZ+3kUZY9gKWVHCcdzuRKIJHmQbhMStO1eYoDA4
 F7XhlF+M8HgDzfl0/sfvUwNWyADwa4XHLH54w+oPTStBfPqD+7/16FI6uYrG9yE293u1
 gV/YAnm2Ic9cQphlRRuLYVZ77gjrHyFWwc5MkafDmmd7qtjBMI4LJuVlgfpVokKzP6Sl
 zpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ENEn0P7Y2heV6flYqbtW2H+Zea4rTiTJEEmDhl8ljMs=;
 b=QszHBminFhx/Kn3zF8c2ZRWytgydUnnhH5nGF/sROdnhOl71qqlWEEXl6eKAA6cKZp
 v5oQAAVHOQyp32RaX8VroyzDPQZC+iZNW0szg6q8P4IYA2qb8Emt4OljGlCgpCz/J+VL
 9aIMXg5pGqC9LCKnuI9QhFg6grb8DDmYuBKW+Kx2ERNMC5Bw7w1Crt9IKA7R9sZE1NZG
 o/wP+QQoCO9A/7aFGMNjzGJGZLqkzHG19FPeYDamYbHA1P5XZl09UIAm7a3oPJtXFYms
 Q62Ito/WPyrvM+Su/R4Out1FQ3PSYR9WpunqcGz383krxIfmtGTZvHJIpevJaCFutKiw
 C7/g==
X-Gm-Message-State: ACrzQf1VvZV3jXt9xxVNPDJi/GAPY8OoN8fYhjd51/VU9d0qOgmrXEsr
 xDxbVmY6UQBC2rq1K9VY1O9ZHg==
X-Received: by 2002:a63:6b88:0:b0:46a:ff3c:b64a with SMTP id
 g130-20020a636b88000000b0046aff3cb64amr14885881pgc.196.1667264394447; 
 Mon, 31 Oct 2022 17:59:54 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.17.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 17:59:53 -0700 (PDT)
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
Subject: [PATCH v7 09/17] hw/pci/pci_bridge: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 09:58:51 +0900
Message-Id: <20221101005859.4198-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: 81IlHOCvJ+k/

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. A caller of pci_bridge_ssvid_init(), which calls
pci_add_capability() in turn, is expected to ensure that will not
happen.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci-bridge/i82801b11.c          | 14 ++------------
 hw/pci-bridge/pcie_root_port.c     |  7 +------
 hw/pci-bridge/xio3130_downstream.c |  8 ++------
 hw/pci-bridge/xio3130_upstream.c   |  8 ++------
 hw/pci/pci_bridge.c                | 21 ++++++---------------
 include/hw/pci/pci_bridge.h        |  5 ++---
 6 files changed, 15 insertions(+), 48 deletions(-)

diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
index f28181e210..f45dcdbacc 100644
--- a/hw/pci-bridge/i82801b11.c
+++ b/hw/pci-bridge/i82801b11.c
@@ -61,21 +61,11 @@ typedef struct I82801b11Bridge {
 
 static void i82801b11_bridge_realize(PCIDevice *d, Error **errp)
 {
-    int rc;
-
     pci_bridge_initfn(d, TYPE_PCI_BUS);
 
-    rc = pci_bridge_ssvid_init(d, I82801ba_SSVID_OFFSET,
-                               I82801ba_SSVID_SVID, I82801ba_SSVID_SSID,
-                               errp);
-    if (rc < 0) {
-        goto err_bridge;
-    }
+    pci_bridge_ssvid_init(d, I82801ba_SSVID_OFFSET,
+                          I82801ba_SSVID_SVID, I82801ba_SSVID_SSID);
     pci_config_set_prog_interface(d->config, PCI_CLASS_BRIDGE_PCI_INF_SUB);
-    return;
-
-err_bridge:
-    pci_bridge_exitfn(d);
 }
 
 static const VMStateDescription i82801b11_bridge_dev_vmstate = {
diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_port.c
index 460e48269d..a9d8c2adb4 100644
--- a/hw/pci-bridge/pcie_root_port.c
+++ b/hw/pci-bridge/pcie_root_port.c
@@ -74,12 +74,7 @@ static void rp_realize(PCIDevice *d, Error **errp)
     }
     pcie_port_init_reg(d);
 
-    rc = pci_bridge_ssvid_init(d, rpc->ssvid_offset, dc->vendor_id,
-                               rpc->ssid, errp);
-    if (rc < 0) {
-        error_append_hint(errp, "Can't init SSV ID, error %d\n", rc);
-        goto err_bridge;
-    }
+    pci_bridge_ssvid_init(d, rpc->ssvid_offset, dc->vendor_id, rpc->ssid);
 
     if (rpc->interrupts_init) {
         rc = rpc->interrupts_init(d, errp);
diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
index 05e2b06c0c..eea3d3a2df 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -81,12 +81,8 @@ static void xio3130_downstream_realize(PCIDevice *d, Error **errp)
         goto err_bridge;
     }
 
-    rc = pci_bridge_ssvid_init(d, XIO3130_SSVID_OFFSET,
-                               XIO3130_SSVID_SVID, XIO3130_SSVID_SSID,
-                               errp);
-    if (rc < 0) {
-        goto err_msi;
-    }
+    pci_bridge_ssvid_init(d, XIO3130_SSVID_OFFSET,
+                          XIO3130_SSVID_SVID, XIO3130_SSVID_SSID);
 
     rc = pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_DOWNSTREAM,
                        p->port, errp);
diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/xio3130_upstream.c
index 5ff46ef050..d954906d79 100644
--- a/hw/pci-bridge/xio3130_upstream.c
+++ b/hw/pci-bridge/xio3130_upstream.c
@@ -71,12 +71,8 @@ static void xio3130_upstream_realize(PCIDevice *d, Error **errp)
         goto err_bridge;
     }
 
-    rc = pci_bridge_ssvid_init(d, XIO3130_SSVID_OFFSET,
-                               XIO3130_SSVID_SVID, XIO3130_SSVID_SSID,
-                               errp);
-    if (rc < 0) {
-        goto err_msi;
-    }
+    pci_bridge_ssvid_init(d, XIO3130_SSVID_OFFSET,
+                          XIO3130_SSVID_SVID, XIO3130_SSVID_SSID);
 
     rc = pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_UPSTREAM,
                        p->port, errp);
diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index da34c8ebcd..30032fed64 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -42,21 +42,15 @@
 #define PCI_SSVID_SVID          4
 #define PCI_SSVID_SSID          6
 
-int pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,
-                          uint16_t svid, uint16_t ssid,
-                          Error **errp)
+void pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,
+                           uint16_t svid, uint16_t ssid)
 {
-    int pos;
+    uint8_t pos;
 
-    pos = pci_add_capability(dev, PCI_CAP_ID_SSVID, offset,
-                             PCI_SSVID_SIZEOF, errp);
-    if (pos < 0) {
-        return pos;
-    }
+    pos = pci_add_capability(dev, PCI_CAP_ID_SSVID, offset, PCI_SSVID_SIZEOF);
 
     pci_set_word(dev->config + pos + PCI_SSVID_SVID, svid);
     pci_set_word(dev->config + pos + PCI_SSVID_SSID, ssid);
-    return pos;
 }
 
 /* Accessor function to get parent bridge device from pci bus. */
@@ -455,11 +449,8 @@ int pci_bridge_qemu_reserve_cap_init(PCIDevice *dev, int cap_offset,
             .mem_pref_64 = cpu_to_le64(res_reserve.mem_pref_64)
     };
 
-    int offset = pci_add_capability(dev, PCI_CAP_ID_VNDR,
-                                    cap_offset, cap_len, errp);
-    if (offset < 0) {
-        return offset;
-    }
+    uint8_t offset = pci_add_capability(dev, PCI_CAP_ID_VNDR,
+                                        cap_offset, cap_len);
 
     memcpy(dev->config + offset + PCI_CAP_FLAGS,
            (char *)&cap + PCI_CAP_FLAGS,
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index ba4bafac7c..e499482972 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -101,9 +101,8 @@ typedef struct PXBDev PXBDev;
 DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
                          TYPE_PXB_CXL_DEVICE)
 
-int pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,
-                          uint16_t svid, uint16_t ssid,
-                          Error **errp);
+void pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,
+                           uint16_t svid, uint16_t ssid);
 
 PCIDevice *pci_bridge_get_device(PCIBus *bus);
 PCIBus *pci_bridge_get_sec_bus(PCIBridge *br);
-- 
2.38.1

