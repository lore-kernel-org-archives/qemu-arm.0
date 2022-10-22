Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1727551ejn;
        Fri, 21 Oct 2022 22:35:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM655sFT93R0v2fPbSO9Dhq/bTaPo+ISWNdPpbAtvFqmAprQuXTAksJ/0c+58uw524h4REB4
X-Received: by 2002:a05:622a:152:b0:39c:b772:290 with SMTP id v18-20020a05622a015200b0039cb7720290mr18974693qtw.35.1666416919339;
        Fri, 21 Oct 2022 22:35:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666416919; cv=none;
        d=google.com; s=arc-20160816;
        b=ErYvYJGgdRv1dBNRX8kRHU5gECRqhXdbtJGm7ivzOJq2dKzruQTKNNHKS/8VkurS77
         B16riPL2gntCfOi+aasRBhCI6jkV5VgoBLcw0TdpdNkkxIn7E5OmonYO24w+BqjIT/8y
         xlHcSCHnUzhxYDHYWd3/FtR23xZSK8XsJTrHhIgjCvzixnfwKBvs8xaAzDFDGdFy1puM
         VX3X5bSfKuwpuXCoEJ8bLZ57Hu1EtwohjSp0UU4Hdfdrmqf5UE/PjPTJ6NoTzg62M/O6
         WabVf9whIBG5lf99e11FhRmsoAo94EEBn68NPZgUxbn5dj93lhcAp7hq20Ra/Og1Fcqs
         qLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8OX4G9SaMZ/DTLrx8FtRqvNmcNEup+3capnfCY2VlS4=;
        b=Tyiz+tjsktNC1kXVXoJrtbKCl1jb0rRy6uEQdnIU1tSy1VaF5xxr+xTtqDYAcVgMRx
         QMavOI2smgjgY0RHxGwp5qiV886UvHNDhNGIo02SWtDHBRB45oQXmu3qQzL1lLCMqDKS
         Tfk0UTpmzySn28jIoCcRCCffusWeasAghaIIQAkb8NMFPnnaa8DOgGF1SVBjemDVn4V5
         nFzfB4f0Re3vnKTO3uvL9djpiADG4GxnzbzcxlSHOajrxhZIvkT5C4/C1ZxF5awqnBfZ
         U0/sxKN4Z6Z6iTASU8zMADxkZ7KjM5ppPXiwEknC7hVo49oHRjtDrR38eRdTVD3Sm0Ok
         1QUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=7tG0lgjQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hu13-20020a056214234d00b004b1d2231adesi13304860qvb.16.2022.10.21.22.35.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 22:35:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=7tG0lgjQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om6LO-0005lf-MC; Sat, 22 Oct 2022 00:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6LG-0005k0-Eg
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:42:38 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6LC-0003wx-90
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:42:37 -0400
Received: by mail-pl1-x632.google.com with SMTP id p3so3131819pld.10
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 21:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8OX4G9SaMZ/DTLrx8FtRqvNmcNEup+3capnfCY2VlS4=;
 b=7tG0lgjQ4KqhnTFa+K2Pu0mK2C/6jK/ANLDNRgsrcUkRfunuik11vFh6+nTlBaM8+Y
 ye/u/9hFbwHqZMdeldBXrDAQMIvf8VX6ePTc6ZgJuqjIBpNJxWgYi6ArWwJFCXg2VWe9
 bN6B6roLDL8t9OllFmQsRjUJ9pKguF6brdc9znGMQsdcC6DgHvcTbuF/wMaBHnJLW1mc
 7gWkcbD8g/Nw9nrjarXvGq5aXi8gAhoLgej8Rnx+r83+u4PAFfoS70GgAvjzIxUuMTws
 3L+t+7xWkCpDrOxC0vfCoXG5qmJLrJvkcGliAWBydQFFQSdHH88A0L71aGWyq4UfEp4S
 1VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8OX4G9SaMZ/DTLrx8FtRqvNmcNEup+3capnfCY2VlS4=;
 b=vTXQ8AId74tNhGHyODnEkLaN8LVqvWBLv5ArTxLv71VKLVgfAonwZVnWSAC6L6HH4C
 CiBtXo3UAmqS6GwJaQ3D2goRCWRWyrh4z4a62yXMvBa/BVWbviO3Z7hxnqkncNuf2rf6
 TqrvlxXndEpoaQwl2Vx4bOGTh9OoDTc08ArnvyyShz36urBVczbPdA8epx/aHpi7IAQW
 QfCc2ewnkeNVdA9N6SW9FEyqinx0xlhisF0jYVHEinNnjFtDF6juj2c13/XrVX4FsfzG
 hci/8noGG2cYBbqQnVem+qucfG21vzgPt+2VpAZ4dGNiXrNN4Z0Mi7MtU2s9m6/QJvVv
 1gxg==
X-Gm-Message-State: ACrzQf2uK1/9RgJfE6/xaeNyeMnLgM/46KafraLY9r9Xn6avmxgGcU74
 5/pPBFdGm6m/UetuttzPWEYYLA==
X-Received: by 2002:a17:90a:54:b0:212:eb01:1ce with SMTP id
 20-20020a17090a005400b00212eb0101cemr97956pjb.236.1666413752679; 
 Fri, 21 Oct 2022 21:42:32 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:42:32 -0700 (PDT)
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
Subject: [PATCH v2 16/17] virtio-pci: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:52 +0900
Message-Id: <20221022044053.81650-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: DyN+2Ou5XPno

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/virtio/virtio-pci.c         |  9 ++-------
 include/hw/pci/pci.h           | 12 ++----------
 include/hw/virtio/virtio-pci.h |  2 +-
 3 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index c37bdc77ea..b393ff01be 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1154,8 +1154,7 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
     PCIDevice *dev = &proxy->pci_dev;
     int offset;
 
-    offset = pci_add_capability(dev, PCI_CAP_ID_VNDR, 0,
-                                cap->cap_len, &error_abort);
+    offset = pci_add_capability(dev, PCI_CAP_ID_VNDR, 0, cap->cap_len);
 
     assert(cap->cap_len >= sizeof *cap);
     memcpy(dev->config + offset + PCI_CAP_FLAGS, &cap->cap_len,
@@ -1864,11 +1863,7 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
 
         pcie_endpoint_cap_init(pci_dev, 0);
 
-        pos = pci_add_capability(pci_dev, PCI_CAP_ID_PM, 0,
-                                 PCI_PM_SIZEOF, errp);
-        if (pos < 0) {
-            return;
-        }
+        pos = pci_add_capability(pci_dev, PCI_CAP_ID_PM, 0, PCI_PM_SIZEOF);
 
         pci_dev->exp.pm_cap = pos;
 
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
 
diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index 2446dcd9ae..9f3736723c 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -141,7 +141,7 @@ struct VirtIOPCIProxy {
     uint32_t msix_bar_idx;
     uint32_t modern_io_bar_idx;
     uint32_t modern_mem_bar_idx;
-    int config_cap;
+    uint8_t config_cap;
     uint32_t flags;
     bool disable_modern;
     bool ignore_backend_features;
-- 
2.37.3

