Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2047711ejc;
        Tue, 1 Nov 2022 10:23:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM55ai3DI/dvghbW22GoFFRPaerIdOSP6rxRyR3uH90EC1zv8XQrwfZ/W1BAEMVkBnvDAVcd
X-Received: by 2002:ac8:5853:0:b0:39c:f1ed:2d30 with SMTP id h19-20020ac85853000000b0039cf1ed2d30mr15770463qth.442.1667323421071;
        Tue, 01 Nov 2022 10:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667323421; cv=none;
        d=google.com; s=arc-20160816;
        b=LVwuM70vByzMtdXOhhbinej0xyD9toMixG2xWMLvzT1Oqp10bkZo4iRet6G+dGINew
         ig/Efi+0WcZv1YH3eysGUfv+Dru5lNnzBR5xamJQH87e4fuR1a5l5n0p1nIFUEEiT8i9
         UK7xdQpgliY+qXp0Y/0/hpp0Sc2TS5wuyCDSREhJmx2njvB6rKB8V1s+2WVAXBcSiWqg
         350rjvtW3RUF3TxT8BnWu3fMC89a33r4RmjgmBipVZoCeh7nL89JAxSpdOHDFu6B15EU
         ls8uWI19696TgWBATzergmoLhoHMQuXGil0Oku5uWb4qsrDgFQqYN+Q/jdQ8a8vMusXl
         guCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QsPBBnx21obOVu6CmKcEL9m4WT1TgzSSD5C4PKH2HtU=;
        b=TReSo4M2KQ+U/DEsv7CPgpoX9XWErbLsHEFp8i/EY7LjuThx/6qYtathSFMvHEOoK/
         aABd5R9KLd1mu/S4a6r1ksma1WxJHQXz4aVSDNmDNj61ljU6mZe/6UtGSbQVkSZ4F3DW
         qEysvt6lU9+nR4gK/TOpZCpo35T3CtGZ8YWUfUd5kO0KDcExu8NCTSx6jBVAQZjSlpuO
         DXMGNOfAtRTze0dwvKm8x248Fz+L+PHcGLv8z71r0QceN4boZ5L4qput/yEgIY4H384A
         6f08Imp0ISHPw4Tpm9zjcnAfDbcICOxsz+Og5FkD76HMW1wZb/U+Epx4w3Jr1Vunpemu
         Thhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=zWuQmk8h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w30-20020a05620a0e9e00b006ee91933251si3841359qkm.708.2022.11.01.10.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 10:23:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=zWuQmk8h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oprnh-0006Ao-2j; Tue, 01 Nov 2022 09:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprnf-0006AZ-Va
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:59:31 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprne-0004gC-D3
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:59:31 -0400
Received: by mail-pj1-x102d.google.com with SMTP id o7so10067584pjj.1
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 06:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QsPBBnx21obOVu6CmKcEL9m4WT1TgzSSD5C4PKH2HtU=;
 b=zWuQmk8hzClg64xC4Riai1bLCsMPMetDwVWXibEqAFK3k8c0e4ZHlclcPOJmJXqNy5
 nBgD0dkjD93qR/Y8jXBWoQlN0qIiY4M/pVb+h7+ujkfM9cL9wIB6vI1xjzKIqnnSxJKr
 bQVVMZ+ANXojVNK4Q7z4GOr+uChmgrXjnIPu6KHwTZ77oWbzbH79s4dOYQFDlQuvYcCz
 /h3zBZaqvBWZQmh6sfFdTVa8FWu7QcRSVAvHW+I+DqeVu3GTfWt1txACc7c1vSxWvLQD
 l7FHo4nKd750hSlwKXmtnxSydrseLREJSotByMNhvUwyEdAswEyo8xAgP5uI1uXQJRf/
 kAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QsPBBnx21obOVu6CmKcEL9m4WT1TgzSSD5C4PKH2HtU=;
 b=oJ+XwDF8W2wci+94DU2qgFwpnarHKOmebaBA4GiCXFnVQBFe3Kci4U/fcLKW//Fw6M
 /c8KOgWqWoVq/Fl7iLA+nNHOMVjX4YBFWapDuYZDjb/eBjbSHZ+3HIL0zEyK+8dOszLt
 96aJSbyxy0BOBmSQRzXz2L0yqxevzgh33KHtdNhN+nq4yJcsnmYyGGCAKnzfGR3nRFPh
 kz0/hCbLTX0fooC5DT27mmV8isy98mGOkAQrQv8j3l8R1wUwlrpoaf5jq9S6OMUuzWdF
 G8S+O9rnnr/ppsTBiD3ZH630N0WJOCingtuc6jGmgIm84W27nNZh75R7hgCvQktG9STm
 GoKg==
X-Gm-Message-State: ACrzQf3xgmgJJKsQDUEusdNye4F/c17xycN9HeJ1a693YuIu8ahdMK4x
 DMFoEoi0ufO/D00UPjqRLMHE/g==
X-Received: by 2002:a17:90b:3147:b0:214:1066:920e with SMTP id
 ip7-20020a17090b314700b002141066920emr3430592pjb.175.1667311169219; 
 Tue, 01 Nov 2022 06:59:29 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:59:28 -0700 (PDT)
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
Subject: [PATCH v8 17/17] pci: Remove legacy errp from pci_add_capability
Date: Tue,  1 Nov 2022 22:57:49 +0900
Message-Id: <20221101135749.4477-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102d.google.com
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
X-TUID: 7aElp6sbOyCl

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/pci.c         | 20 +++++---------------
 include/hw/pci/pci.h | 12 ++----------
 2 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index cce57f572c..41de7643af 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2532,14 +2532,11 @@ bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
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
 
@@ -2548,14 +2545,7 @@ int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
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
index 50c00ece3e..1baa7628b2 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -2,7 +2,6 @@
 #define QEMU_PCI_H
 
 #include "exec/memory.h"
-#include "qapi/error.h"
 #include "sysemu/dma.h"
 
 /* PCI includes legacy ISA access.  */
@@ -394,15 +393,8 @@ pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
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

