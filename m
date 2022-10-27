Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp160243ejn;
        Wed, 26 Oct 2022 23:45:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6sI9B69AQORFXqD/0CVlcIr+UdLa44GgFBmlKY9RJuy2vBHAwk9CaaJ1oXxZQnK9OWls4M
X-Received: by 2002:a37:48c:0:b0:6f8:70d5:9a41 with SMTP id 134-20020a37048c000000b006f870d59a41mr7338092qke.676.1666853130227;
        Wed, 26 Oct 2022 23:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666853130; cv=none;
        d=google.com; s=arc-20160816;
        b=nwtPq8OHlGYcV6UOuzMw/t3lAxW1RWWEhO3qaz+kpXHUJmLcdDUdAaocyqXt+UIrp7
         Wr5+fkdoVdua8DcizLaacSktnEZIA08BU5OsR9b2SWgZnTYir6LcPr+yHXG+cZLTuWxz
         koR+UssG0CH5TEL8ADqFpWAi7Va5ShYP3zXTpdd87yMm3aDk10aqrWIJ5wpsj/2ZKTca
         wQXHO/njjixJOJ/BMlwADkk5LcUjMyGjK6NSgElvZsgLYt32mZVAkGcHa6yuML6QtT0P
         nM2BrkkBJKN3+F7S1Z4pPJGWiV+iMzZLs2DKq1hE7Nuf8CW6KnMKjwlz7WjtNTGs6LyP
         xd8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1STM3PpWdsCtuLQ0E6sPy5DYW3VO2819dTVvZ/ugr5w=;
        b=Mnhd/160FihXNlsZS+jQaZ+DTfb/JxBXkdTVCng33ZIrfmJDrKECV9Gn5ZE5pXYBVP
         jfWOPcqBR0zf2mOtIUYtMfp6ZtYvhWLr6u/5pwei9+YqWDIK1Ew0NzG2HOj5x/1+FU9X
         XFS8JpDzz3+TMNw50cfnFcMotoEDHgPqqy/b1cCL6UshBjpjatGwL8UX6U3cROZZ6q5N
         S/+XoHF2TYfT6GDlB6jmRgsMRe2S5n5FjAjNlURKGTGPrja2gLzIZycSGG4gijaqrye5
         H5Ed2gvjsxiJQl8dPG+9MnuHL+X+yRL7yoHWql7Bvz9dMMzMCvjJ0XwZVUTMnph0Jnva
         9unQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=0R0dLN0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21-20020a05620a291500b006ee7a243f4fsi427939qkp.712.2022.10.26.23.45.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 23:45:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=0R0dLN0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onwZ8-0004oi-4z; Thu, 27 Oct 2022 02:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwX3-0004wy-0J
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 02:38:25 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWi-0003Ew-Fj
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 02:38:23 -0400
Received: by mail-pf1-x42f.google.com with SMTP id b185so567774pfb.9
 for <qemu-arm@nongnu.org>; Wed, 26 Oct 2022 23:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1STM3PpWdsCtuLQ0E6sPy5DYW3VO2819dTVvZ/ugr5w=;
 b=0R0dLN0fopu74Fk/OlRoU+7syV3ruF03VFa72rTKpV33/1YAMzPs/wXjWIZf0H42+b
 NGvlHOy3hlBsXH3GGbd9KzTqBqfy7TsDVpIOk+rblE2Gsm6sTTuP26AT4sd1/FSbTBYn
 KXz4XlxyBtPokylEPUM9c3yOEDj8zo6LW1DXZaDYWDPe3T8ykm4+1GQ1eSQXytQzDbsw
 QHRMk5Rcxve8ekqTvcSiFH7xCNrZpgy5bUrkTJBN3K3UoeAnAfNFbCPu2XFyP9KV5S4O
 GUvLGG0m4UCW1/qP4VlGFQ+lSEfmq98Iq7yRABSTHHIEbHsFZM4fI0fg0xptdHsHWTHv
 OM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1STM3PpWdsCtuLQ0E6sPy5DYW3VO2819dTVvZ/ugr5w=;
 b=VTba+fpr2SvwNRJBBKbMv4k6djopg+/QAPt4Z7Zz5jlAumR8CpRJvC6WsP40Gj3HgM
 TuGu+cLRkIcv4Lrto+cF80yf2Z+y5c1ALnPcrkdJFvGrhTJlwUwwtjCbIHJxC+eZzQDa
 HvMCAmo5L6RMZww05oYQkYflbvhKNYCx3e6Py5wVAJKVq9So9Ds/aGB/12KQtI95dE9i
 Mu7l4PyLUWGbLhmHvHgRrvLz0I0Mr3ZtTUzNcNRuH6R/ossXnY9olYHM8BpqIz7YSN/o
 mc3eCGooFr1D9wwNZYEAyf+T00xdDDvg4v8ETsG1AQ6pe+vu95v+l0b357h5lW65Puzg
 rFPQ==
X-Gm-Message-State: ACrzQf26k4tDc6PW6yyXVBHbxdtDNnkd4kzK7IJAL1l1fmocAK+X3Pw8
 CFcbRldF1rR+AKsqQQcFXQimZA==
X-Received: by 2002:a63:8bc3:0:b0:461:c9af:94e0 with SMTP id
 j186-20020a638bc3000000b00461c9af94e0mr39762736pge.421.1666852681539; 
 Wed, 26 Oct 2022 23:38:01 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:38:01 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
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
Subject: [PATCH v4 09/17] hw/pci/pci_bridge: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 15:36:57 +0900
Message-Id: <20221027063705.4093-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VENQ80ZrE1Cx

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
2.37.3

