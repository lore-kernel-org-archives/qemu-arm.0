Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1728724ejn;
        Fri, 21 Oct 2022 22:37:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7/Lke9m09SqUlVSsG+5Z95R7EpzRRmcKKGB9m8fU1WpGGqtGE+Ft+Gym4HJUxdBZg3jCeO
X-Received: by 2002:a05:620a:46a9:b0:6ee:d108:d2be with SMTP id bq41-20020a05620a46a900b006eed108d2bemr16578209qkb.436.1666417071325;
        Fri, 21 Oct 2022 22:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666417071; cv=none;
        d=google.com; s=arc-20160816;
        b=mMTnCCGriejdwhzzcXyrsgZ1wSKXb7Hcy8h2DtuA575wE9dUYhz8Uokw/cWV2RnKwB
         W1yRsNtgYWSgkeL51S11PnN0xLMuN9j7GYfubvxCq8+cdX7AxJXvfRDE1xjfERpwvxcu
         5U2qcwySe+VQ20m5x0PW5+GHA9wQrCXkVRTT3l9cKMaD9qmQ6/fb1q+FvCvVcLUFTwFg
         28a59Rdsw5xF2X8D4Ag4i+XHP2WX71T/iCBnSim4Xtvj3YmZacdl6H7jQpPjYA3Z8rMu
         VBfhBo3NFj/snpj3i66srPvfnKgolDwke5GPUUwqZbNB00uOfPB3yohhjUrivm98g0y9
         unGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=F1tEOGpRHGzQkodaDFgMlipmveAWiDG8GsDf3ehO7aw=;
        b=BTeecpovaVm5SzT7RZiL68iuT4mQvRue0GAPQ4qFiZi+yHqeGADIcnR4vSNGNt84kM
         SVUW9JYQSam80Z4T9ejFiw8L16rlLIbxrTBhFN7zPZgqGl0+mKMXHTstil8K0q9eC2l7
         tBaxWpNEsXn6AW4I0IvSJU7pWeFpUgyh1RlvJVThPnOMBkSjytegbY53oE0+mdq+3w1D
         rgD8qdr7IZ1txp2uArsWwjVEDnnXLj2A7PMOIp6QdI2h1xQj44tysgS46m2a76cnuSfC
         Ina1CyRmfK6MzgnDdFLVYaz/C8UYzRju8FsjF8ozJ9Ch+zEZsvEtCkG3DOKBQNQDrs7e
         Xdfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=O4uKO+LW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cj12-20020a05622a258c00b00392ac131c45si13848026qtb.618.2022.10.21.22.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 22:37:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=O4uKO+LW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1om6LP-0005mi-Br; Sat, 22 Oct 2022 00:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6LI-0005kj-GH
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:42:40 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6LG-0003uC-E5
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:42:40 -0400
Received: by mail-pj1-x1031.google.com with SMTP id pb15so4031746pjb.5
 for <qemu-arm@nongnu.org>; Fri, 21 Oct 2022 21:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1tEOGpRHGzQkodaDFgMlipmveAWiDG8GsDf3ehO7aw=;
 b=O4uKO+LWP7hndNdZPwWTrJyazKp2K6VbTXRd4zGY2o/nWLThNsfg1PlIJmto2xtKYO
 1VBFtawIpVXdBb0Vu3Jw+ur8eUf7Vtdpi0OzMQ4ME8Cdiu49xJj/sfGcwEXz6+5dkEuP
 C8FpZSdAXkdg+bCzihdkWcTXEhSqiKqfCJiaxI4FpIMDK6JIP3wK0KUkrvjEmGQeBJl2
 6HbwKVfp+mGlrM5Sv2/62g5AcPo1QreGTAj2X1ZGwW/bcZlVMC74xTFH9j9cwiYoEKnv
 HKWIIo7pkhJMQ6ZgbVVKrYOiljjJPmtALySjaeb6DOqpx/yKjANYFn+xV/LZ0wbNvqMz
 1Sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F1tEOGpRHGzQkodaDFgMlipmveAWiDG8GsDf3ehO7aw=;
 b=Z2F63O9Qc14jPI43R43NZ4E7ohGCFnYAtGhS0sYf5FOLC4pi43zDdGUMJvfLK3E3A2
 m5CQTbeHBqpWBIwmFtR+L6wBoSQWcfjVoSwGo8wK3uB9YjekdM4koMlhj7HYB3ZX6+hH
 6MwcSu7JQOKrKi0/3xA2/lCEmd+rnSz1OtYFeqz7JJAOQvFssP2aEpYb+VKppWf23tdo
 ZPFRBrc0plncvciBAZ/RiLBQa5KUIt1IJPMnsZr/BSdJn4Z7/tOMTccl6/TmB57zAW9B
 pmPVQLeEBcNGUndvDaw50NXVI4oKjbUzQltIY47vnf3PGbQULbZinxOOo+9mK4BBLVxN
 2zrw==
X-Gm-Message-State: ACrzQf14mYAyGilytpZFpKpGql3leBhXXXs+cK2Q1zHinwKxJ+Hq+NEZ
 2VsKGlBQnxtJn6VgmpFfesKlsQ==
X-Received: by 2002:a17:90a:354:b0:20a:6867:4a2b with SMTP id
 20-20020a17090a035400b0020a68674a2bmr61815076pjf.157.1666413757777; 
 Fri, 21 Oct 2022 21:42:37 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:42:37 -0700 (PDT)
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
Subject: [PATCH v2 17/17] pci: Remove legacy errp from pci_add_capability
Date: Sat, 22 Oct 2022 13:40:53 +0900
Message-Id: <20221022044053.81650-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wAgoWN9j5BIJ

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/pci.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

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
 
-- 
2.37.3

