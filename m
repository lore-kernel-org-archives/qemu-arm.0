Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1205581ejn;
        Fri, 28 Oct 2022 05:34:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5w3jgFZialtq29UcGn/aUAma1jmTPxk+6nyrfc81tm6n1++2TVEnEsBegU0Dk9F9kRdIpK
X-Received: by 2002:a05:6214:230b:b0:4b8:aa39:f3a6 with SMTP id gc11-20020a056214230b00b004b8aa39f3a6mr36933427qvb.30.1666960452524;
        Fri, 28 Oct 2022 05:34:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666960452; cv=none;
        d=google.com; s=arc-20160816;
        b=TF2g9hCGjby1bcnV2CMfKVrp/X6Si4Syvs9GiwU0QX0rwag8OW8/JW9nVN096E/QE0
         uQ9lhZoIjdw4ALj68ISyEKGBolF7PTU5CuZXVAJOSB23Q+FUhGC9P5MjzPkcJl6JcmCc
         tjzflTv9OxhNitEE+cpfNOwp45wxcM91a05ccqJckoczsTjgeT1BDSaUsOU1SGGJnS0B
         XvNNPYIvh953N4CMfuUgwcOAN+z7jnJ6L9xXnzjXHghffIXF80MNr2YVsIn4xVE54rd4
         XjoPmddbA4xytax5VQuHUrIP8X+akJzm71U/2C38zkVP7B4uZmXE75v4JAgbOtOOzobt
         osGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NqszKtwi0YXXdx0iWSFUDJDEOg8IoBblvu8lJaEmuhg=;
        b=I0ltRv2FkQhnqkw1cO3Cwb1gZ/0Q8qt7BvGejv7BQ/O18HOGGLzYw/SDma/Hf5mbOZ
         ijMP7ndn2p7riKqvGPYfdZS5bwpDmmX9agBVnTDZ6SB1IXVYV/19vScahcIhM673fus3
         v0ttLOtCkO3OK+bKZ2JNuoRVKOK8FW+yb+naVqnnerWdTizmvCum9no/979eGfiV/dx1
         PwZU4EuGW83YF5h1ViL7HYR8DlUEJoj0ltev+J+ZQAsoQGuuF0pgBRBLtoRO52LvTqBD
         hTsMedZEr1MHTQ4nbA/AQCfgqIS5hDcClrM4UB1w2YCq9w33eyiSbwLhLSpjakrRNQ3n
         Awow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=HPBts9OC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14-20020ac8598e000000b0039cf2b789a7si2739880qte.669.2022.10.28.05.34.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 05:34:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=HPBts9OC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooOYl-00081O-Gg; Fri, 28 Oct 2022 08:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOTF-0003yp-9m
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 08:28:23 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOT4-0003Sv-Jw
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 08:28:12 -0400
Received: by mail-pj1-x102c.google.com with SMTP id b11so4575998pjp.2
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 05:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NqszKtwi0YXXdx0iWSFUDJDEOg8IoBblvu8lJaEmuhg=;
 b=HPBts9OCCcAn4+iuBRdzRVbmM2gdq0y3+ODoy42W6rk7kRXktjdCG6TBFDTSZXvxM8
 7I2+jxOaq/Q14NsyCesC7UvtIkXPC9MdaISDGZK+36pUCPhCoheFr7fr68kJbJN30gtn
 hJdb0IYuiyN3GiXzkcm9vVFlSzacrWGQG5/En8+e3p5krk6m11njknzPzFZQG93n0dvd
 DXwRQNSZ/S+nT60wQVSsydajF1STjOpqDcUJ7Ps8nmP5ulvDYui4MXrXX4e41q2dwwPi
 WWVGo4Mj0iZrtk9H+/biWfUUXKO9PLsrwujqkkmd1k3ytYWMfZwdw8+1ic3MRXXBc5Sn
 vmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NqszKtwi0YXXdx0iWSFUDJDEOg8IoBblvu8lJaEmuhg=;
 b=BwswIWdaEow8PmpmvB0Kj9XK7M+C8dVWG8jIxzg6TR6ypmhRWTmiiB4I9bxfwdj371
 m2Md1btH/Xh8aYwFfY+AV9XpHZpUxXWwV6U7jrunQRxDvux/0HHadsGfnIY+Zkoc38nP
 Lz8LgNcaW5/hlKOEQzSDzWPGct5whx05xP8Qg9ccNkwu07KZs31ZwvYz7y4wSKwffb0n
 34PhoO1a3QiLqpIzPshWWeKw9CAO0A0Bt66gGs1k1ErMAEs9WjVi2pHjmCOrzzQQAB36
 InYQE+H6LmyFBOEtVFMEDOGKeA4rG89eR2f88Pa36g6F9WxliBY95CwxleiOZNkocVFk
 a3hA==
X-Gm-Message-State: ACrzQf2adkCs+iK4oZVBEJyrOXrzjaUJExfrKt1mnfUb+x1KL7N6/KAL
 aJg2BZAe1po4RMnabqoDVeIMgw==
X-Received: by 2002:a17:902:da90:b0:185:5537:f388 with SMTP id
 j16-20020a170902da9000b001855537f388mr57153057plx.113.1666960089928; 
 Fri, 28 Oct 2022 05:28:09 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:28:09 -0700 (PDT)
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
Subject: [PATCH v5 17/17] pci: Remove legacy errp from pci_add_capability
Date: Fri, 28 Oct 2022 21:26:29 +0900
Message-Id: <20221028122629.3269-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028122629.3269-1-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102c.google.com
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
X-TUID: yMCjCFPZsbr3

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

