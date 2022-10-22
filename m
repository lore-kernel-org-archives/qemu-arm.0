Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1713656ejn;
        Fri, 21 Oct 2022 22:15:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5sulLtId/UFQIiOc40+MfeubPFAigw0LjsFJJiWe/tRGyOXMfcB8RlPDQtUHI/zc8FC9AX
X-Received: by 2002:a05:620a:2699:b0:6cf:3ee4:5657 with SMTP id c25-20020a05620a269900b006cf3ee45657mr16244812qkp.475.1666415715152;
        Fri, 21 Oct 2022 22:15:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666415715; cv=none;
        d=google.com; s=arc-20160816;
        b=0A/gx6GS1etwQx01wLYqBt9IpSjClHK20MmGHFIMKg8RT9HlyjqQgQotPWcGyLph8Q
         +XAQCPJWxb2NPCfURKiD4wy82pvCNtPKgVvqdJTgSo2twEH3AamAxvc4GUzA3JvTiwVJ
         P6kYR0G/bFzjxQEYkZ5AWGjzDtp9yc06a0J5Mjm+eBUvxVZdl9Ux3XzlZ2h7SoiZ+vLv
         UqCcW62Rqj9JcAf64+s8uVKmyyG7KrXPu465ktXpDI8DN1EaoiIrt1ATP35uA2D2CBH4
         oPHT1pFgi1+A5ipsFO4ksAoIOyQ2H85K6iwP4BJZjrAiktLa7aVzBQtgD4fWUOTy7pd5
         FrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Amj+vSFcdbQnaoWcuLvjNhpGRqy42M12Pln3+46OKr0=;
        b=Y2ZQHlVzZsTX4PV14pw2ipQ2YCh2y+zmMy83S+pFrVvYt8jTvKwr3OSePvcI6RMhbG
         C9pACmh6Q4bHtg9B8obQRYa/62f5yokqnZcanJNKIjThuBGGBeumc2mQBLpXLfKL0Ons
         6Nkwh41lR5nUsHMMtpXt1orbn1pFuRUK4Kh32Uu9gAuIaTHF+N4tIZmd2dBum3w+Z2Z1
         0Kx8a+hh8XuXP25axG2XERmJxUrQHubDfKo97EP87sKZ/li0an1hebb+Dcg+yeJCkkeh
         kuzVLHiTxB9AopQ4aN+LPHIsBGpL78kOZcLpNNXM8L1WEb/OeMGBd6dgfKL4yCD+XD6r
         6UEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=gZ48ofMt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ed3-20020ad44ea3000000b004b1d693ee51si14321025qvb.504.2022.10.21.22.15.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 22:15:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=gZ48ofMt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1om6K0-0005GK-N3; Sat, 22 Oct 2022 00:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Jz-0005FE-2L
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:41:19 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Jv-0003YP-4i
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:41:17 -0400
Received: by mail-pf1-x435.google.com with SMTP id w189so2989549pfw.4
 for <qemu-arm@nongnu.org>; Fri, 21 Oct 2022 21:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Amj+vSFcdbQnaoWcuLvjNhpGRqy42M12Pln3+46OKr0=;
 b=gZ48ofMttxNaD0YttAZ4PAFFUPBGh+saYUeyHYqRb/1lp3fMDLtqU7paLb6mb8uzc2
 bgYYQsFVi3sl09GNmN5hATjNvWk8UpTaQpt0ajYdic/1PKiwZI9kZa5En1cdeMNzpLGD
 xQwvDrEUtbskWgEjgPQWEs6imDvCRIAPCUbYX0hECtH9Zq7nD1V/JF2kiFY1cB/RwgRB
 AULS2Ncis7s7XTNEl0Cfd1LTK2y5zo+SAsz6oNdEzYPJUcenm8dj4h9fvpJIIlDM3RFD
 hOc9u7Q+xx6F+NHjI+iYs1yhZdihPKP0Rem39YnTLYdHbxOddBLQ3dKdlG1zxl2DQkOB
 44ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Amj+vSFcdbQnaoWcuLvjNhpGRqy42M12Pln3+46OKr0=;
 b=GDS4eWLStwuqkf2Taygn7b8FC4Gxn8dAy3AW8iVtW1nYtx5onWG+U7FKQoEX15TvD5
 PbKw04VgojuHJaX/BM+CvZxs/igh4uyEwPaBZ7ANQ6MXKfvnxKn0VYkOlQu9o4ZtK5rY
 HmLI22BEjpz6OLj1eDYRzN1x/gz1uCuJ8dp3bh/EvXVPSavwQj0jRT82mZBkTy6e3l0v
 29kTSHlFKqzqcby1O8FoSk5rgdn9FxSvemlXScOjuPd6w4uJL8+owFjLASeKRHZyG0bJ
 oBPEaY9zm3evwlE65I8nT2XIFnx73dVdUr4VbHFr3HNoFxkN5D4oj2mkWoTMf04WZar8
 iEOg==
X-Gm-Message-State: ACrzQf2wCOt4VCD921b6zZoCnZxmMbBvXlADphZl/mQlA9Mn1lp++NH/
 KtnMR0w6+k+kj5iC+IPQzHJ4uA==
X-Received: by 2002:a63:5144:0:b0:43b:ed4b:224 with SMTP id
 r4-20020a635144000000b0043bed4b0224mr19234060pgl.594.1666413673769; 
 Fri, 21 Oct 2022 21:41:13 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:41:13 -0700 (PDT)
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
Subject: [PATCH v2 01/17] pci: Allow to omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:37 +0900
Message-Id: <20221022044053.81650-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::435;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x435.google.com
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
X-TUID: xjEYyoGihPOF

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
index 2f450f6a72..8ee2171011 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2513,14 +2513,14 @@ static void pci_del_option_rom(PCIDevice *pdev)
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
     int i, overlapping_cap;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b54b6ef88f..51fd106f16 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -2,6 +2,7 @@
 #define QEMU_PCI_H
 
 #include "exec/memory.h"
+#include "qapi/error.h"
 #include "sysemu/dma.h"
 
 /* PCI includes legacy ISA access.  */
@@ -390,9 +391,15 @@ void pci_register_vga(PCIDevice *pci_dev, MemoryRegion *mem,
 void pci_unregister_vga(PCIDevice *pci_dev);
 pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 
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
2.37.3

