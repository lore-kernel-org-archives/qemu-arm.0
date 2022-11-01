Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1434468ejc;
        Mon, 31 Oct 2022 18:05:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7fc/BQ1cJdxphE4KGU2qD0PP2kA7pfWuxGKjnDa4x3PSeHGTV3htFGvKuHk6qCITxJZ93E
X-Received: by 2002:ac8:4e41:0:b0:39c:f205:f954 with SMTP id e1-20020ac84e41000000b0039cf205f954mr13094159qtw.134.1667264719519;
        Mon, 31 Oct 2022 18:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667264719; cv=none;
        d=google.com; s=arc-20160816;
        b=cG/PlCwnroK5juW4/vzJn31BJUEObvC957iYDCUAlaEv2DxJSpej6Oehgp7H0WbGZx
         3DulDYLEUqLI6vMUQq2QhfSpu2+qfTuV4vah/xOwer3saqL9aeQ15zIHCyMFHCq7OWxd
         5Ly17pABlEFm1XI86movsP8ruxOVcTNVakMjUq+FA1lSHWDVw9CFXEJDsMzBYUe63JNd
         SqYHtpwxJ1vZnXVPqs3IlST7Ez/1B38ddK9wZFzuUy9QbE2NheJrnVZZI3YfESJqrXCe
         MMWLkKBojFiFy0so+yIJ9K5EUByLNwz/sxdwdoRO42kxBtba05yzk+oAGN+VvbCZ7YEW
         9j8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MRQTorWjTOPm3hdswdPN9yJh6/SSUlrMzBdFF2tp1l4=;
        b=M8fnS0eg0Nrm1XFHbbTkwfXIfyTEhTbpSek1m9KNwq9n6Iq3kV9J0b6QRESophX1y2
         59I4wELah0NBZOPlROL7pFNdZbAEpvt0D+Br/4NNR3/55wr/WH9L2O7Sg7Q5hZEOFNyt
         SSkUh0ueLArNHAxl5hJy1l7ILcuJ+rTmByklv88VABVKAVwW8/9NdY9Wpe7cmnpCJFWA
         BajqWiNMDqYUoUwDctm/tY17crbKqCK7tydBFaqqRLyJeK4jXaJyRlCrOLMjS7k543HB
         NJKgQE9a3JiVvBmOhPg8mv0LCrfRpNHNVJ8DxpR2lLwUeMospIpbTSxTEMWCGeQi14Ml
         3wlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=ACTAWMj4;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020ac8140d000000b003a4f1c2aee1si4606709qtj.142.2022.10.31.18.05.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 18:05:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=ACTAWMj4;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opfez-0006x7-8u; Mon, 31 Oct 2022 21:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfe9-0005Tn-RZ
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 21:00:55 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfdu-0006Bd-SC
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 21:00:53 -0400
Received: by mail-pf1-x42d.google.com with SMTP id g62so12139694pfb.10
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 18:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MRQTorWjTOPm3hdswdPN9yJh6/SSUlrMzBdFF2tp1l4=;
 b=ACTAWMj41wFb/KM5H0nFpOokYTmdj2o3LEPV+cuBu44vm+zvN+b/5XzQ/Ln/nqO71V
 ay05JcNX20Mqif/bAq8UoaIzAiUmCheE7sigmeRxiirzCVTkfBMxrdyykeGnPVuSxXwA
 odevizu6zaEJD56TMICa1UZQnU1EJsoU3RlzcP9QJ62yUPSKNQjOL79I2jWaHxUHpo5n
 ZuCwv9J5Ic6Bn1QL9ZfPYrUhRK8UzbL8DesO71X8NBKzbq9kPsIQw2gitzNa08Xt1m92
 pJjLYT7JSWeOL4PidHuraJ5/4JIqqK7VQvAjqJDN4a6bnzbQIIIR0ySR9s+1wl7fEONY
 wJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MRQTorWjTOPm3hdswdPN9yJh6/SSUlrMzBdFF2tp1l4=;
 b=Cs3f1KlNlggJpmCVjiX5xRs5PtSvhQAA/8m8YJEIQA6Z7ytX6VzMd+NksCGkTQe1bi
 0Ast6D0M6n+amLGOwQDvfObsu79xy5wpGqDQVqL+ZoOQR+7N9eos1FRiK51Ox0JyHMgO
 D7u6qNw+P0RlUHL0FOMFBuJtfGSfrmlQTpONxoIWVxrpYMQpMIUAGt9lVfRAuhjI134s
 YUCMUkjtYYohHjo2T2l01X10S7qD06fOwbEreNyWI0y5+AHFrp2QBvjnfm98XDK0JvBZ
 1+oy5GUbTzqNjZrHTGsg560RaGbxYJJUrHF0cyR/09Nhfb+Zdg5L2927DtQmaOhj9Np3
 E4Jw==
X-Gm-Message-State: ACrzQf0EUFCVv+PvY4460MLB8NbylWduU/WnC2C6fiaJ1qbKb1PmpnuZ
 lZ7SJREleohzywQh7TjxiLTNfw==
X-Received: by 2002:a62:b40a:0:b0:56c:6c63:fdb2 with SMTP id
 h10-20020a62b40a000000b0056c6c63fdb2mr17141154pfn.4.1667264435450; 
 Mon, 31 Oct 2022 18:00:35 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.18.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 18:00:34 -0700 (PDT)
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
Subject: [PATCH v7 17/17] pci: Remove legacy errp from pci_add_capability
Date: Tue,  1 Nov 2022 09:58:59 +0900
Message-Id: <20221101005859.4198-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: sSKWeE4WzX9X

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/pci.c         | 20 +++++---------------
 include/hw/pci/pci.h | 12 ++----------
 2 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 9e62c8e75d..b352a9c732 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2530,14 +2530,11 @@ void pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
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
 
@@ -2546,14 +2543,7 @@ int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
         /* out of PCI config space is programming error */
         assert(offset);
     } else {
-        /* Verify that capabilities don't overlap.  Note: device assignment
-         * depends on this check to verify that the device is not broken.
-         * Should never trigger for emulated devices, but it's helpful
-         * for debugging these. */
-        pci_check_capability_overlap(pdev, cap_id, offset, size, errp);
-        if (errp) {
-            return -EINVAL;
-        }
+        pci_check_capability_overlap(pdev, cap_id, offset, size, &error_abort);
     }
 
     config = pdev->config + offset;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 4f3e1e2558..f0a1a47f11 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -2,7 +2,6 @@
 #define QEMU_PCI_H
 
 #include "exec/memory.h"
-#include "qapi/error.h"
 #include "sysemu/dma.h"
 
 /* PCI includes legacy ISA access.  */
@@ -394,15 +393,8 @@ pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 void pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
                                   uint8_t offset, uint8_t size, Error **errp);
 
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
2.38.1

