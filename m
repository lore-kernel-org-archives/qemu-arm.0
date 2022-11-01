Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1430146ejc;
        Mon, 31 Oct 2022 17:59:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4oPglf0Jn9lqUBcEm0Q51vq4XC4FVkFvL4tAmqkyuch77xzb3iDSBuUWGlbyi0G9/OWcAP
X-Received: by 2002:a05:622a:5d1:b0:3a5:3818:a067 with SMTP id d17-20020a05622a05d100b003a53818a067mr1023130qtb.574.1667264371035;
        Mon, 31 Oct 2022 17:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667264371; cv=none;
        d=google.com; s=arc-20160816;
        b=HNkQH1WeYuKY3ZADBgknezCiCyYrAXFUosWMTvwH+3QYOTi1MzoHYIBBxoq/Bw3kDW
         T/7Cq1SgpIRucnWztmT2iGyqRi849iy7gbngrjogJW/Gub5gdflXNT914DDXIMBDRtce
         TS9BaSGSrCfw8jAKJH5+bu+YVJ+ylqYKXcnuLdDXAL+1d8+zDF1zsFcdketRPjVjnamj
         sGVWIUwuqkiIvV71rOz7epE4iszeKjYd9TAsLBwCHtgq2a9E2kL95uT4F5joH5XPKH4T
         YvoJJStxBpiZgtw5sLmntHjAKsxFwAYXRPByDu+OEv/JG9gWQl+b0++6ZbSoAfk/0rS+
         S1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0C0Qx5SE6iSDPWaw8xqp3ZGFhXwr8M+xwNmJeAtQUf8=;
        b=r7+M9+cKnmuueDP1MnlsHlLOVDa8fYJbbEh9e9DIdD4JAPr8wEQDEkfIRVfZi0fcE7
         d+8LLfOqXzwyOUCycCfzQe81DgdyXp10/9MVEIwah32obWWe3OFf+CsgdyYyf22KTWCl
         nTy/SqQPgQGlgn6McPlppC1hhzEnyh4m/ezciKTkj+IpK/JvVOYL7YlsHfpUEnvCisH4
         E9C8PFPEX+VGR2EyWT6vBzCRkv5pLcTbFLKruEi3k5iMqA3DroOvuPmmS5kkuUENFbVB
         nbWVhV1D+14HC6SIBVzTsO8vP96TfXmwonI37FrxHBSF0D7FdYA/aH5ABD+I7sq+XL/F
         BOkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="zOaTQCD/";
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020a05620a244a00b006fa2bc142ffsi3603055qkn.672.2022.10.31.17.59.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 17:59:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="zOaTQCD/";
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opfch-0004Ht-GW; Mon, 31 Oct 2022 20:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfcg-0004HX-2P
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 20:59:22 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfce-0005dT-C3
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 20:59:21 -0400
Received: by mail-pj1-x1030.google.com with SMTP id m2so11828483pjr.3
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 17:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0C0Qx5SE6iSDPWaw8xqp3ZGFhXwr8M+xwNmJeAtQUf8=;
 b=zOaTQCD/vYKs7C4jABXNEbQGWQBTvTNHFzaDcf2dBhS4Zac/lHxsDAzXaVFhNtUJ2o
 Uj3/CJX64w46EETBLAAcXR1HZWjo951S9Jj36PJVbzaTTH9YhqrDzcrM+nQfYVG5x2Gl
 xEHpnSNKGBEMboIXRMr+Gc321gy+BOhJhTYmYyMQ+ITIw7J4wLhVUG28EFgDenTI4i03
 fuUMQpqUT1giZ5yw306N/zZTlPNn5oNfaIDvPdwvyBi0M6ImHGUkNHgq3X/lLhRimtSe
 Ez/mPBd/Q84x80acGxDuS+hfDp3OC8DjB8TfCkmYlMkNbtH1Ia0t3CzHe0CKvBfGvB7F
 hMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0C0Qx5SE6iSDPWaw8xqp3ZGFhXwr8M+xwNmJeAtQUf8=;
 b=1NTPnRJUdBgdAIXtGOEfwF6AOWLOkDe8pNqYPmcln3cYyaXkynvLZjgmxQcrt94/NI
 K7dgp5MAmiVdOq+vnuaZaAGKFiORumtgZa6snu1gxfiawkBfd9lg+nM8KU8HENaSil0H
 RznXE5WlVS1cyQO6W+ofXlJgYg8B9qh7ufJ6YE+FrBxN9ino5DvdIdja59S6xc1pKaTZ
 id6UmVoSlRwEqOKUwfBxKKTAVM1bI4UzJ/GL9nMhjUbl/+dB9z1UnJKh9uQN341fb6zl
 BRDvH/X+urW78SdGg3H4g/SwB0aPcW2iXgIGgk5cPcZ607hqzMhQ2WGAeYsWiZ99T2SX
 z08A==
X-Gm-Message-State: ACrzQf3pRcn9h8BNQNe3hNron/FHVAeohHgmx3Wze2DQ5i06y2gVqzvG
 NHBFChZIRbbVBwtUFbVrt9YJYQ==
X-Received: by 2002:a17:90b:1bd2:b0:212:cf30:3d53 with SMTP id
 oa18-20020a17090b1bd200b00212cf303d53mr34268074pjb.18.1667264359118; 
 Mon, 31 Oct 2022 17:59:19 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.17.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 17:59:18 -0700 (PDT)
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
Subject: [PATCH v7 02/17] pci: Allow to omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 09:58:44 +0900
Message-Id: <20221101005859.4198-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1030.google.com
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
X-TUID: g+uoU4lrO98I

pci_add_capability appears most PCI devices. Its error handling required
lots of code, and led to inconsistent behaviors such as:
- passing error_abort
- passing error_fatal
- asserting the returned value
- propagating the error to the caller
- skipping the rest of the function
- just ignoring

The code generating errors in pci_add_capability had a comment which
says:
> Verify that capabilities don't overlap.  Note: device assignment
> depends on this check to verify that the device is not broken.
> Should never trigger for emulated devices, but it's helpful for
> debugging these.

Indeed vfio has some code that passes capability offsets and sizes from
a physical device, but it explicitly pays attention so that the
capabilities never overlap. Therefore, we can always assert that
capabilities never overlap when pci_add_capability is called, resolving
these inconsistencies.

Such an implementation of pci_add_capability will not have errp
parameter. However, there are so many callers of pci_add_capability
that it does not make sense to amend all of them at once to match
with the new signature. Instead, this change will allow callers of
pci_add_capability to omit errp as the first step.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/pci.c         |  8 ++++----
 include/hw/pci/pci.h | 13 ++++++++++---
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 33f5406706..9e62c8e75d 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2530,14 +2530,14 @@ void pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
 }
 
 /*
- * On success, pci_add_capability() returns a positive value
+ * On success, pci_add_capability_legacy() returns a positive value
  * that the offset of the pci capability.
  * On failure, it sets an error and returns a negative error
  * code.
  */
-int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
-                       uint8_t offset, uint8_t size,
-                       Error **errp)
+int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
+                              uint8_t offset, uint8_t size,
+                              Error **errp)
 {
     uint8_t *config;
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 75e64ecdf2..4f3e1e2558 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -2,6 +2,7 @@
 #define QEMU_PCI_H
 
 #include "exec/memory.h"
+#include "qapi/error.h"
 #include "sysemu/dma.h"
 
 /* PCI includes legacy ISA access.  */
@@ -393,9 +394,15 @@ pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 void pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
                                   uint8_t offset, uint8_t size, Error **errp);
 
-int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
-                       uint8_t offset, uint8_t size,
-                       Error **errp);
+int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
+                              uint8_t offset, uint8_t size,
+                              Error **errp);
+
+#define PCI_ADD_CAPABILITY_VA(pdev, cap_id, offset, size, errp, ...) \
+    pci_add_capability_legacy(pdev, cap_id, offset, size, errp)
+
+#define pci_add_capability(...) \
+    PCI_ADD_CAPABILITY_VA(__VA_ARGS__, &error_abort)
 
 void pci_del_capability(PCIDevice *pci_dev, uint8_t cap_id, uint8_t cap_size);
 
-- 
2.38.1

