Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2046419ejc;
        Tue, 1 Nov 2022 10:21:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7BS9CZVjq0UFYa3o5yejtA1uQCYwM11I0xE3m73KRwlF5mqPSNvZCQfXG8U+VKNyruWab1
X-Received: by 2002:ac8:4682:0:b0:3a5:2c7e:bf40 with SMTP id g2-20020ac84682000000b003a52c7ebf40mr6960622qto.65.1667323306465;
        Tue, 01 Nov 2022 10:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667323306; cv=none;
        d=google.com; s=arc-20160816;
        b=Pg76sV5GShG6uNECi0iEeNbkI2/NUO4aKMH53iK4/rS7fhqak7cIX+YVTqkfD4hjQd
         nFIuAazxor3pjPUlTx9DwzGyPFk2KMx7KadSBzvKGBzLvoz6WHSsisTxnTvgsUvZMQ5q
         iaPsbTv9WxOwos0VNyLq0w3T82SxRT0DeWpJfwqzYfAHP9uGK7ZKSABV7r1Mu3PVnJxa
         rx0ShfQLUtW97c6EbA3jWe1usfE070C0pyGCHE7VPBK5Zw5Bh5u0Kh/uvnwQMgRXxQtk
         WH4DsLBjaO9bD/VmCJNv8TyGAaQozGZQKTLPZsGnTzkTrwVjsBvR9CXvwS7zQsuYDtTp
         /ScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CWZ6XOCda6cVgBL4L93PsJnNZsiroRIzQ8rx/078euQ=;
        b=kESd8vVo4zcM1vyR+J0XaOYPWrI3zQFwBDh9bcflhDx4u3F9Wzh0ncN8f0ZS92Kdo8
         Jvr7YHyy1YakpwTkfh46eSzyDlLVKOfnEocOJTLloo57yNuS+T0Ycut4Q/BaN09Iteud
         GlF5EWSehMDQMzzSUDnOtu2E/oaYEb8M9Sip6n0IeTV93wENXdOEKoiRzNCwUb32Nzts
         XdnhvIwoWcMcFUST1GKgK6EDjy7I4jCzLtaOtChZdc/29zgpYOHY5nRF0A9cFrWoMm6u
         DvRDXHP7KR6b8/UIc2j3LG+wzdHIyDk+S1UX5ggXe1stYrMxMfv6X9gBeZWOGcMYp+96
         nTxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=tAHgVnn3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17-20020a05620a229100b006ea415df571si5940987qkh.189.2022.11.01.10.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 10:21:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=tAHgVnn3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opsgh-0006p3-K7; Tue, 01 Nov 2022 10:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opsge-0006oC-Rw
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 10:56:20 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opsgd-0003IW-54
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 10:56:20 -0400
Received: by mail-pl1-x630.google.com with SMTP id y4so13803717plb.2
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 07:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CWZ6XOCda6cVgBL4L93PsJnNZsiroRIzQ8rx/078euQ=;
 b=tAHgVnn3vvjoLPXXJAvGchC6fwnHiFwbVXzIgYP398jIIVQOjCaX6VfDnSsgivy4tR
 xebkduWH6p5DT0+ZuynV//UwnEi6FTHga6SvdM8EZhYlwJ0Hh/k2k5Vxc2Ynmkz8cR38
 V2nCNyuWtZHPbrYeUdHqC3KiHlRgoPgsIeSWThtWb053cp0UP5xXmG3JioajdvWvwDfB
 4Z3DWMKr5kXFmOg1QlFFihMm7dQymZka/OIKnA3DVc5RIMxHkcAdnY06nIfJd+w7lQa4
 BgWGybZ+dCL1AqdO3/koMZAgpCVtkCV5qm6ThJ9JUyGYXpudgU040FsSIiiy4QBUO9PK
 7fyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CWZ6XOCda6cVgBL4L93PsJnNZsiroRIzQ8rx/078euQ=;
 b=WsiTSM8rDuXT+HOLWHjwxrJql2cnyTmXYEHIs1a/IlkxiXKvb0HW43fgbsCtDNcOU6
 iiAQAVyY6LK4l8y20DsV+cQh9jeTVA78rGOf+rI12hGOpoxp4+Rlc14qSoxp9cGBwNn9
 5Ih3F7keFwbCbcaHio4nluS2Sgn8JJzLWwzCRbFU2hm90HHnzIaMnwYcuRrPXNinp7XX
 Tjys3tyQ6X56RUKnErlQ70/aQiD1JNPdYXp6R28WU4WBk99UGn9/fFk4aLE+ghrqtYta
 UGbtHkxWybK909jEVbK6rxcXMd+amGTJvr6voxWze7TTyHT5ejCPKYsaK2aoeH4e8S42
 5dJg==
X-Gm-Message-State: ACrzQf06E8trRDTgD/+fIvkK4x0pgMmeVrfj/r4WWfui62gfbcOelcD0
 FjLIoUiKq2N2mDvUk2wpV/hTfA==
X-Received: by 2002:a17:90a:784c:b0:213:5b03:62e with SMTP id
 y12-20020a17090a784c00b002135b03062emr20313438pjl.241.1667314577926; 
 Tue, 01 Nov 2022 07:56:17 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 22-20020a631656000000b0046f9f4a2de6sm4783219pgw.74.2022.11.01.07.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 07:56:17 -0700 (PDT)
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
Subject: [PATCH v9 02/17] pci: Allow to omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 23:55:43 +0900
Message-Id: <20221101145558.3998-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101145558.3998-1-akihiko.odaki@daynix.com>
References: <20221101145558.3998-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
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
X-TUID: 4hhO7Zqok8s1

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
 include/hw/pci/pci.h | 13 ++++++++++---
 hw/pci/pci.c         |  8 ++++----
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index f4e6612440..555ac03010 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -2,6 +2,7 @@
 #define QEMU_PCI_H
 
 #include "exec/memory.h"
+#include "qapi/error.h"
 #include "sysemu/dma.h"
 
 /* PCI includes legacy ISA access.  */
@@ -397,9 +398,15 @@ pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
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
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 5531e30385..5f77ca581a 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2532,14 +2532,14 @@ bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
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
 
-- 
2.38.1

