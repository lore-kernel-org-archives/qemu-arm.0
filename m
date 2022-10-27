Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp157149ejn;
        Wed, 26 Oct 2022 23:38:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6z5lZWvSNCaK/soFwp8C+KkwA5kaSDXVKPFgpeZqqTBr0ZSTocR5DAfPZ+K1d8s5Y44Yk2
X-Received: by 2002:a05:6214:2389:b0:4b4:9f66:7bed with SMTP id fw9-20020a056214238900b004b49f667bedmr39896712qvb.83.1666852731195;
        Wed, 26 Oct 2022 23:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666852731; cv=none;
        d=google.com; s=arc-20160816;
        b=MccI6GlQz5kqJH20ZP7F9VHTeUoH+PwaHGUlx0X7xX69TBypz/mw/Qx9zGzyXtbuPH
         tbAzgV4YokmvD6Gpe8Ta71oaFo/x9d2RPZJxQe2LE5y/Wc9rcqcs6roLY7dPpidc5MiZ
         67PTQ2xro9nZTkO6a/XKceqfPsDZdIhV4qU+iPSj2ypUTNMWdB5UZLfmyktoKZXpxopG
         0U/7LcLFEWEoT45FBmf6SYwAgtmdrfCArjbg+RXrtDx3vyE47vHCmF7l05L2FI0ed/ov
         AtJU/IzFgOjddeVKzAQnyIO+repmGfU37fO6vBSbRT/KVUpTzKe2ur+nmKtea78afjeb
         9hjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Amj+vSFcdbQnaoWcuLvjNhpGRqy42M12Pln3+46OKr0=;
        b=YbJhUqAXL1g7GV6klOXx1nrtZgfnFduItDFZfyMDtZkAwlfOG562ly88jZHdRp3LZj
         Qrq6SdxNxetZCYkMP5VDyxaDih05pao5VvtPiAIpuqR/NepS6RHSPeVZ4SrtKG1yUex/
         5Tbm+2sw5x9x767fiDIad7LwN5aP7CFlMXuX/jPkBnSUD82rdIDxtHFGu8gXjK3k6SD2
         45N0KVeXYp9y8+3mFpla6AlUoXZz2RdymB1/4osonVR7FffZ9yoXhXe5H76+m37U9+jN
         lLgzMrymr9svP5yucS0gBbtAmWRpBhLG68fYXPzQOiBa+fvDG9JXjqKr3V5e1wfncM53
         WNpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=US4hq7xn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020ac8070b000000b00399b7f5b6c7si374691qth.472.2022.10.26.23.38.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 23:38:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=US4hq7xn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onwXE-0005CC-P4; Thu, 27 Oct 2022 02:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwW8-0002WM-5A
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 02:37:30 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwW6-00039I-GT
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 02:37:27 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 78so367345pgb.13
 for <qemu-arm@nongnu.org>; Wed, 26 Oct 2022 23:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Amj+vSFcdbQnaoWcuLvjNhpGRqy42M12Pln3+46OKr0=;
 b=US4hq7xnkpA+QoIMEG/q95ja6l3o2DHKrM3g2z7Zs76He3X2zgPrRiiBYEPvIwwqsn
 elI92UB9OZlLj06pxwU+em8JduIg04xFDYubHQrE8rQotsK0hJycxEdS8Llf3pZCp13F
 48uuBVozM5AWt6dhj6xcXT1AgxNTAVkiaibn9x4a0GDugsmYGnaQoPqYuNK7W9dEhR+w
 8Ap0jLRnaTUWwiRSmmmdvGf0z1Zvsf4S8Kwccpc6zog3hdTcOM3C2i42ZhEq59jD2bIm
 RK81rsXHEmQGYDkZb9zdFTLo3EeKkQomHpQdI3MT3IPXZc7E8jOzox+1TxFzjtYcTSwC
 to3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Amj+vSFcdbQnaoWcuLvjNhpGRqy42M12Pln3+46OKr0=;
 b=CaBCaz7RWnReStb8p2KFeTjaKLXyZpdCI+0uBNvVAtlDM+8GqC/IooYkg7cbret6S1
 Tlzne4B/deUJe9hiAZk9LpODzpBVIQPGoH6QTMtLwGcT11tl4ijzj4CrGx6jorckjXGh
 eQGpPaM7PgEQlbu/9P4LxmMSUUf44UKa/eqHwBd8yAdcHaWh1kJI1tQNAwb7kz0qNFWS
 VMscO+LoGrLKAq6InE+wkpCUiti/BFOeEPHlIH6F461AQJmR/vhmqn6OTOJIu+OMKxQz
 3OmpHRa8iQQ+7PtZuJW2DqZrzP5Sg3BDI7GnlpM2ESRVa0/kC7ZuoMskDr46P2SHB4N0
 uUlw==
X-Gm-Message-State: ACrzQf3jpXKKNeDvc/rvLxP8l+AqVhfU30dD6mBYUNDlCXTq7nOXQoYb
 jIfRPXA9xfAAnwqe+7viMTSslQ==
X-Received: by 2002:aa7:8011:0:b0:567:70cc:5b78 with SMTP id
 j17-20020aa78011000000b0056770cc5b78mr43890537pfi.29.1666852645035; 
 Wed, 26 Oct 2022 23:37:25 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:37:24 -0700 (PDT)
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
Subject: [PATCH v4 02/17] pci: Allow to omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 15:36:50 +0900
Message-Id: <20221027063705.4093-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52c.google.com
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
X-TUID: EU6rvYjDzpZV

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

