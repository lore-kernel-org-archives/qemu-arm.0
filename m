Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp827576ejn;
        Wed, 26 Oct 2022 13:18:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ReXQZhtuhggw7MYuYwuIKpBYG3U4H2KiHVsEcXC0oMqGB3rPx798cDA3zJp1dvRdMmKf8
X-Received: by 2002:a05:620a:1a23:b0:6ee:7b21:95f1 with SMTP id bk35-20020a05620a1a2300b006ee7b2195f1mr31373123qkb.296.1666815525243;
        Wed, 26 Oct 2022 13:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666815525; cv=none;
        d=google.com; s=arc-20160816;
        b=DuhIA9eTpB9PQXhRSLnNvtWNIsI5mVzE1Rr4toAyNTUyYpZ8lxBA35xVA4ZV7olIQD
         UTbSzwyJYWDVdH/dOV4q3pYd2XOrXXZPjSbT87xiRpneZNyt/8LqCPgs+GNTpE4sN6r3
         0PI1VMp2KMUME24Y0RBDWV7oIcLdUwEufcOpf4FOI+z0TCsG/6YvM20XviXCZXzW59va
         Oq6Jjdw0FiOYvdOgUBW83o00+iH+q3tyY57lEKaHuAIGx7p4M3hWPyGDPnzxvgXLHlYJ
         0IoLAQqROxna4fw1hthqgKXY3AEIc2iWW8RCTCG81UHeFvZt9vg8z5WAar08ytCLpJ8z
         4ZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NqszKtwi0YXXdx0iWSFUDJDEOg8IoBblvu8lJaEmuhg=;
        b=ciqHuf2GqDJcsgKRj6mMv4Fa0o1DJh83tJ9N7nv3cXdKnNByTSWkW7g5SjxqPkED2W
         O4x8hDPuKPh3SypcLtiuZsBE2gn9MAkUjyR6RxTvgwnaUI1hZKtoIFBuBSV8hMrd8tzC
         swou58OdSxgEaNSpaU/iOH9alvFkynlzmCsdlmYqHaeOPWltCZvz+K68z5cUY1WpE//5
         /Iuuh7Vs/hm8Pik9UZVRb/Rv0wXzCHxvHlPo1vYjA9koBxuJrjVyOaiDGujzOMYzvZhW
         MtiZC2QkUNJ3SLyhcr8VQ5KYWKyBagNGRsysttxg8HA3pBosnVDYR2IJtwhhQ5agH5j/
         TYDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=q7Hq+o3e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do32-20020a05620a2b2000b006f96bd5cef1si1320078qkb.313.2022.10.26.13.18.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 13:18:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=q7Hq+o3e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmqi-0003Ze-4P; Wed, 26 Oct 2022 16:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmpm-00022u-CY
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:17:07 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmpk-0003BV-1R
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:17:05 -0400
Received: by mail-pl1-x629.google.com with SMTP id y4so15300962plb.2
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NqszKtwi0YXXdx0iWSFUDJDEOg8IoBblvu8lJaEmuhg=;
 b=q7Hq+o3eP6zf4jrVp6qhuK//2yHpTDo+4TFVsk8xmufhdYg0EbA4HXRfwYiIrf6RIi
 SdIG2o+bN04dMhFHmAErxl1bkehFc9bSgYNPXd4mX706DJBP64+C0DRbaTRU8cN1yrxY
 PzOm6oII7Si95aWzMrWEyInsq5PYoLEvIgitKmAxyunfWdwPPdiWrJUHmJ5sEj2q06A5
 y9hEj13ePO0YMJUt3BrWEzAOvKwhsrkKAoWVG356q0DZlxibU98nGfInQmkRuzgPsCQI
 DtcWYztLvSRan6XI27Bjp2H0uwfu+1yXlLIfazFAvDd2HmKQqnEi6lKJ4VDwe+okUDDq
 GU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NqszKtwi0YXXdx0iWSFUDJDEOg8IoBblvu8lJaEmuhg=;
 b=AA4xVi5vP9hnN2kVdqAPmA1FTT42QaBLaQqrT9BUGf62yTkCY2ENZ35M7iHmaSBA2y
 pTBDNRy9hN7o85mHALXVZ6nVIEu3oDSn5kn1ZPA9HnSqYDHG+SeOzwqpqcT3pR3isRvN
 Hz+cYvYa2WC0+5ncBTKIei1xkk3DzJ+Ylm/a9vmo5x5FkQ9kzyhzFWPQez7lJm1eST01
 9QJHSssHAv9Iwb1Doinpzp0O+wBmNXO+gKk1qABFdXniPgrhRLFcI8UoQd/AFEY5M+0J
 6Q7a+RcNtEBO+20j811AFm5+pUPnllzLYp3MqS3RdrCgNN+VvFecx56bAGLnBM8BRrz5
 NaOQ==
X-Gm-Message-State: ACrzQf0GuDIKEqINlt36eDgxHxTOTha8TwTnu5CmiED7lxtwRabtRUVJ
 0XL2GatlIut44p3+jzZC1IxfWA==
X-Received: by 2002:a17:90a:6045:b0:212:fe9a:5792 with SMTP id
 h5-20020a17090a604500b00212fe9a5792mr5934966pjm.178.1666815422831; 
 Wed, 26 Oct 2022 13:17:02 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b00541c68a0689sm3375770pfr.7.2022.10.26.13.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:17:02 -0700 (PDT)
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
Subject: [PATCH v3 16/16] pci: Remove legacy errp from pci_add_capability
Date: Thu, 27 Oct 2022 05:15:27 +0900
Message-Id: <20221026201527.24063-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026201527.24063-1-akihiko.odaki@daynix.com>
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gc2NftgyNoQK

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/pci.c         | 29 +++++++----------------------
 include/hw/pci/pci.h | 12 ++----------
 2 files changed, 9 insertions(+), 32 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 8ee2171011..8ff71e4553 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2513,38 +2513,23 @@ static void pci_del_option_rom(PCIDevice *pdev)
 }
 
 /*
- * On success, pci_add_capability_legacy() returns a positive value
- * that the offset of the pci capability.
- * On failure, it sets an error and returns a negative error
- * code.
+ * pci_add_capability() returns a positive value that the offset of the pci
+ * capability.
  */
-int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
-                              uint8_t offset, uint8_t size,
-                              Error **errp)
+uint8_t pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
+                           uint8_t offset, uint8_t size)
 {
     uint8_t *config;
-    int i, overlapping_cap;
+    int i;
 
     if (!offset) {
         offset = pci_find_space(pdev, size);
         /* out of PCI config space is programming error */
         assert(offset);
     } else {
-        /* Verify that capabilities don't overlap.  Note: device assignment
-         * depends on this check to verify that the device is not broken.
-         * Should never trigger for emulated devices, but it's helpful
-         * for debugging these. */
+        /* Verify that capabilities don't overlap. */
         for (i = offset; i < offset + size; i++) {
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
+            assert(!pci_find_capability_at_offset(pdev, i));
         }
     }
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 51fd106f16..2a5d4b329f 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -2,7 +2,6 @@
 #define QEMU_PCI_H
 
 #include "exec/memory.h"
-#include "qapi/error.h"
 #include "sysemu/dma.h"
 
 /* PCI includes legacy ISA access.  */
@@ -391,15 +390,8 @@ void pci_register_vga(PCIDevice *pci_dev, MemoryRegion *mem,
 void pci_unregister_vga(PCIDevice *pci_dev);
 pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 
-int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
-                              uint8_t offset, uint8_t size,
-                              Error **errp);
-
-#define PCI_ADD_CAPABILITY_VA(pdev, cap_id, offset, size, errp, ...) \
-    pci_add_capability_legacy(pdev, cap_id, offset, size, errp)
-
-#define pci_add_capability(...) \
-    PCI_ADD_CAPABILITY_VA(__VA_ARGS__, &error_abort)
+uint8_t pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
+                           uint8_t offset, uint8_t size);
 
 void pci_del_capability(PCIDevice *pci_dev, uint8_t cap_id, uint8_t cap_size);
 
-- 
2.37.3

