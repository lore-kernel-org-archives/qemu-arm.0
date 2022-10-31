Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp932897ejc;
        Mon, 31 Oct 2022 05:38:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7QzkJsRDBJ7Md1cU6hs/HfQeoSw9aXETUyRXvxDBoe5FPGybjcU4oZhDzlnNYhs+Oqk/1M
X-Received: by 2002:a05:6214:2464:b0:4bb:93b8:eeb1 with SMTP id im4-20020a056214246400b004bb93b8eeb1mr10636307qvb.40.1667219916857;
        Mon, 31 Oct 2022 05:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667219916; cv=none;
        d=google.com; s=arc-20160816;
        b=BawajxK/IyV9BP6HnxBUw4TF7+4obTrXS2XkzwGbO9hPShI4S8nohZ8/ySrPS/Sl+d
         cSjWYdcuu65c42wou3ChTfODMmIGj1VmO8YwP3sosTvX3+3+mUERUTSDakFYQsJHqzb8
         kJN4G9UAjj7weI+JqMe0iIqfa/UBEBa3tBg7z9wWvxAf3p3VtmV7tFqpL9aD4Etc3ejG
         2Q+oPFeU0HG5RuVOsLWTzNXvlNmtfOApK7rapG+M9jTWjwNvndbrobKK25mH3Dqu3CX+
         xqZtm4bvmfDIvGaF050/pc8EFCcHrir9UusXiCsgRWMYKxp6UCPC917L1AttcLqupFfT
         /ERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=P72V6+Ir6tNrNqLeGOgeVfZ54cbK622H9TATsjqGOCc=;
        b=K11bHYVohtQfzEof1C0Jlrz4MKlAncddfrZvBk8u2NyEnZYoh0Q2UwClF+uCzupEb7
         RHlDows3yA9rvEsGa0PZkeT4Os9qq9r3aWws0A9Pa5oSzuhVfIiVkWowLC2VwR+pRIVK
         MEivLrSPUfrcTvyvfAqD+x9vWHeiOkCcjf2xK30sKDXxroTSentyBmSM1giZ7Pl6i2Sk
         E2yKBIPQd2msXlZrRwFR10jdgn6e4mChH933rPbw8FdRyO7Tu2t04dBxgaEt0QqQsQYZ
         B2u1+NmkgH0/M+gsIkP/EF3RfnOdmKyayuHTde3Au/3GBb+8iwqkISVXllc4TS53d5j8
         hjmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="iQ/jMguT";
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do44-20020a05620a2b2c00b006e05a8630d8si3986885qkb.380.2022.10.31.05.38.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:38:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="iQ/jMguT";
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opU1A-000731-FE; Mon, 31 Oct 2022 08:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opU0K-0004v1-BS
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:35:00 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opU0I-0004b4-Gx
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:35:00 -0400
Received: by mail-pf1-x42c.google.com with SMTP id f140so10581504pfa.1
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P72V6+Ir6tNrNqLeGOgeVfZ54cbK622H9TATsjqGOCc=;
 b=iQ/jMguTumKuX2/iqA6YN/fuHvpRY9zI10BZnwgEKTNWJQi7zUsuCxclFHMTekPioq
 qwK6nVNOrqnpAtHqngJOLHNjIWV+IkkRIAIKDaD/zAWr4hDU2SOg6G0moEoB7mK9W2cY
 u83qkpmgO5V1fjBUOydwJivin2F/O4c5HlAifuMAmQ+zHZq+hqoAaROtlVuQv6T3UO4v
 NiFuajjo/6YCQQ4F9tvM3KIBYcDqQcdYpeUUKptUBW3d/2hcB/bg5IZPMDU3hV+/B16N
 gn1QkBWugT+boeWche7PMkL96xfDKBBGxHxBLJDrI9dtcaxgZo6Ya1+rAeWxe4zrtyUY
 E3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P72V6+Ir6tNrNqLeGOgeVfZ54cbK622H9TATsjqGOCc=;
 b=xt+P6OjznjWP31vvedh5FP34OjOeuokLwxfUrPLTvcsUwNUtRLVg0wlJY1f1mxJ8s6
 ejXOBT1bGwKi6XC4dNtfJYurU88EouoqE9S35eONwd6z6rAkZuQnsYfby/cQ5vwlBSVb
 UzQgoc4QJRWvNnhKvbVZ4aEWYxjlkNflwnAMHxc3xAbxz1vNP8/cHe2zcq+p08o0G8R4
 oju8zjWTU+mCe9LdCUmtgQWBYbYDbNLdmgbT7EqXyxYmciRWwCJtTAwAtHbBJXKRjJHv
 gi3+QxQJ+9WB8QA/YeTKo5YtCty3I5BRY8O2fn2zezZ5qXLfdD/YAmyXWhSXET+FihOE
 j6VQ==
X-Gm-Message-State: ACrzQf3D7kUzgJgnG5k1GIOX7UAR6uCtQWy2joM+4LdeOQ8oKTe5ZDNZ
 WH3V85NuBZ8TDK4bSjhDIk1lDw==
X-Received: by 2002:a05:6a00:174a:b0:562:781f:eca3 with SMTP id
 j10-20020a056a00174a00b00562781feca3mr13890168pfc.41.1667219697331; 
 Mon, 31 Oct 2022 05:34:57 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a6545ca000000b0042b5095b7b4sm4093810pgr.5.2022.10.31.05.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:34:56 -0700 (PDT)
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
Subject: [PATCH v6 17/17] pci: Remove legacy errp from pci_add_capability
Date: Mon, 31 Oct 2022 21:33:19 +0900
Message-Id: <20221031123319.21532-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031123319.21532-1-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42c.google.com
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
X-TUID: IHQX5OV2B+aH

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
2.38.1

