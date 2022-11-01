Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2034431ejc;
        Tue, 1 Nov 2022 10:06:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6F1YJ7qY0n1Zzxpm5YU/JnE6n7EFyGErb+AmGbCSjAgRB7fNWFwybJ1UfAIATT9nbE4+cm
X-Received: by 2002:a5d:4f05:0:b0:236:a65e:3762 with SMTP id c5-20020a5d4f05000000b00236a65e3762mr11881740wru.156.1667322368024;
        Tue, 01 Nov 2022 10:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667322368; cv=none;
        d=google.com; s=arc-20160816;
        b=Q6lUs9DccfyGK2irLPcS/4OEzwxJtZ7Pf/Uhf9Xj6vaFr0zLrV6+jNj+BthHtmHDce
         B5vXdunOrhxSsqb+3uNHg2RIGRUEIrzM7JcmjbSl6bbz6vZxBAqcoPkHXkAnYdcuXG+W
         snOAj3XYfp4+VT2TV1AB1JKn9FIWOXM9Byd0sSq9gIRGSrCBZndQ2t7uFDAJDDB/KVJg
         UN4LM4r1RWsh65JsJTtF5quHsUF7fVQQksJk3NTb3YFfS92zCqXivuAaI4BV2fZb2wSp
         LZaaGslpFFdu5Y/2fHRLSHFe+h3/u8OgtNsRlZSAPPF1OMb0Ln3amyAtdfWxVi4Xowm4
         pqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WKgohXmGJwvxptEACisdke1JMQ0FNytd6UjjgGeOgSM=;
        b=hbObuFvlNpmzCuk/EfXXXY5VkaKtpxPbdi/wxbWc5A4C/fKB1JuV0BMaCHhISygDdD
         cds59UZxEbFHJ4RWomgV3NMAnVxi24KVJR8UuVGVFuY0nwq8i/kmpSZB6QKb51e4sHgt
         ZUvj3Eww0ihjH34gyXLwOz4EYEGlvLkaHtZDPeFDCevCLaIfeU89vno8BbPCq0YCcyW7
         6o0oJbpYJEOISSPsStG8MNHG4kSZC29ONqsQDSurBKQh1oT0ta5uJ+uNBQkasDIiixfX
         iLZ7r9hll44BzVmbz1vWinUbBS9TsgEqrvL1Bv6rNTbAUlZymAeVeuG2zkB9YmokrAdh
         lUeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=B9rI6s44;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12-20020a5d6d8c000000b00236d5d67dc4si4774611wrs.526.2022.11.01.10.06.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 10:06:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=B9rI6s44;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oprmV-0005l0-Fl; Tue, 01 Nov 2022 09:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmU-0005kV-6I
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:58:18 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmI-0003ir-V9
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:58:17 -0400
Received: by mail-pg1-x533.google.com with SMTP id h193so4789519pgc.10
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 06:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WKgohXmGJwvxptEACisdke1JMQ0FNytd6UjjgGeOgSM=;
 b=B9rI6s44cZ42yBKdUR3gMEVGCbzBd4DNmJf2fuRk53Dt/y7pTS45aQjovroh+PFxsK
 6NXIBskC1CrigLiDGPVW9fW7TCZc15au7bDbk1611yvC1knCeQ+dv8if4qOoUaT2Td8u
 2Mm6d0LBaUlCS7KHO+ciINStmtNbk4fd1MUZJeET2KW2VGn/H69dzLdQNd5orgNyUz3D
 yf8o4278eXs8QFzr5N7bbbqtNrPsQPX6eS4SA16feTuED7BSWfUaSz5QUbCEtbPHRAOQ
 Dovasz3snVadwmnz0iX3sJijCdQtZijRzBFMYlgHtUMRH/LWGcakWIeZNteN/G6Q7MmR
 op9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WKgohXmGJwvxptEACisdke1JMQ0FNytd6UjjgGeOgSM=;
 b=5/pDSKo85qP0XVefbaSmSS+pibVO6JvONCGonJ6ogCME//4BLNUjTm8dBktpBSfh3z
 PiYcsot/86ZZq2DSlqTWosDTcCxYlFMy8JOE37txgz0Ak8oo8RIGWJf7Ks2n4ANUkLOg
 7NFr8sEBrmqXuwnckQt27ibZ3M9Kaiqib35Wrd9mQ9xG7K4JtoiOGveY/gpzxJ33688O
 6CbKmTENmiPSy1cyIEaTpydSqA0+hqypRgOVZYJ7NkiINR40h3YtQYD883MXj3fYIMnR
 6B3aev4v41kiVjIz2KfYjrWUPOjX4JSAUmjxtSXHeJut3b3pRbl0c2d6Xnp7lDOb2HYU
 fyeg==
X-Gm-Message-State: ACrzQf2gdGf8l5on8UCB+1KtAmCzsBWUYl9lVSKju3zhMadEOtt1SNqt
 e+McaNzzH8diBLEL608CaPA6UA==
X-Received: by 2002:a63:5662:0:b0:46f:c6e0:bb95 with SMTP id
 g34-20020a635662000000b0046fc6e0bb95mr8594879pgm.379.1667311084614; 
 Tue, 01 Nov 2022 06:58:04 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:58:04 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v8 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
Date: Tue,  1 Nov 2022 22:57:33 +0900
Message-Id: <20221101135749.4477-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::533;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x533.google.com
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
X-TUID: nxp8ocAC9DjX

pci_add_capability() checks whether capabilities overlap, and notifies
its caller so that it can properly handle the case. However, in the
most cases, the capabilities actually never overlap, and the interface
incurred extra error handling code, which is often incorrect or
suboptimal. For such cases, pci_add_capability() can simply abort the
execution if the capabilities actually overlap since it should be a
programming error.

This change handles the other cases: hw/vfio/pci depends on the check to
decide MSI and MSI-X capabilities overlap with another. As they are
quite an exceptional and hw/vfio/pci knows much about PCI capabilities,
adding code specific to the cases to hw/vfio/pci still results in less
code than having error handling code everywhere in total.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/pci.c         | 34 ++++++++++++++++++++++------------
 hw/vfio/pci.c        | 15 ++++++++++++++-
 include/hw/pci/pci.h |  3 +++
 3 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 2f450f6a72..b53649d1fd 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2512,6 +2512,25 @@ static void pci_del_option_rom(PCIDevice *pdev)
     pdev->has_rom = false;
 }
 
+bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
+                                  uint8_t offset, uint8_t size, Error **errp)
+{
+    int i;
+
+    for (i = offset; i < offset + size; i++) {
+        if (pdev->used[i]) {
+            error_setg(errp,
+                       "%s:%02x:%02x.%x PCI capability %x at offset %x overlaps existing capability %x at offset %x",
+                       pci_root_bus_path(pdev), pci_dev_bus_num(pdev),
+                       PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn),
+                       cap_id, offset, pci_find_capability_at_offset(pdev, i), i);
+            return true;
+        }
+    }
+
+    return false;
+}
+
 /*
  * On success, pci_add_capability() returns a positive value
  * that the offset of the pci capability.
@@ -2523,7 +2542,6 @@ int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
                        Error **errp)
 {
     uint8_t *config;
-    int i, overlapping_cap;
 
     if (!offset) {
         offset = pci_find_space(pdev, size);
@@ -2534,17 +2552,9 @@ int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
          * depends on this check to verify that the device is not broken.
          * Should never trigger for emulated devices, but it's helpful
          * for debugging these. */
-        for (i = offset; i < offset + size; i++) {
-            overlapping_cap = pci_find_capability_at_offset(pdev, i);
-            if (overlapping_cap) {
-                error_setg(errp, "%s:%02x:%02x.%x "
-                           "Attempt to add PCI capability %x at offset "
-                           "%x overlaps existing capability %x at offset %x",
-                           pci_root_bus_path(pdev), pci_dev_bus_num(pdev),
-                           PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn),
-                           cap_id, offset, overlapping_cap, i);
-                return -EINVAL;
-            }
+        pci_check_capability_overlap(pdev, cap_id, offset, size, errp);
+        if (errp) {
+            return -EINVAL;
         }
     }
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3d4a..0ca6b5ff4b 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1298,6 +1298,14 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
 
     trace_vfio_msi_setup(vdev->vbasedev.name, pos);
 
+    vdev->msi_cap_size = 0xa + (msi_maskbit ? 0xa : 0) + (msi_64bit ? 0x4 : 0);
+
+    ret = pci_check_capability_overlap(&vdev->pdev, PCI_CAP_ID_MSI,
+                                       pos, vdev->msi_cap_size, errp);
+    if (!ret) {
+        return -EINVAL;
+    }
+
     ret = msi_init(&vdev->pdev, pos, entries, msi_64bit, msi_maskbit, &err);
     if (ret < 0) {
         if (ret == -ENOTSUP) {
@@ -1306,7 +1314,6 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
         error_propagate_prepend(errp, err, "msi_init failed: ");
         return ret;
     }
-    vdev->msi_cap_size = 0xa + (msi_maskbit ? 0xa : 0) + (msi_64bit ? 0x4 : 0);
 
     return 0;
 }
@@ -1575,6 +1582,12 @@ static int vfio_msix_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
     int ret;
     Error *err = NULL;
 
+    ret = pci_check_capability_overlap(&vdev->pdev, PCI_CAP_ID_MSIX,
+                                       pos, MSIX_CAP_LENGTH, errp);
+    if (!ret) {
+        return -EINVAL;
+    }
+
     vdev->msix->pending = g_new0(unsigned long,
                                  BITS_TO_LONGS(vdev->msix->entries));
     ret = msix_init(&vdev->pdev, vdev->msix->entries,
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b54b6ef88f..77b264c17e 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -390,6 +390,9 @@ void pci_register_vga(PCIDevice *pci_dev, MemoryRegion *mem,
 void pci_unregister_vga(PCIDevice *pci_dev);
 pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 
+bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
+                                  uint8_t offset, uint8_t size, Error **errp);
+
 int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
                        uint8_t offset, uint8_t size,
                        Error **errp);
-- 
2.38.1

