Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1206072ejn;
        Fri, 28 Oct 2022 05:34:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4V41D+uj0Sm20QNxXYM9Wym7K1xJmJIo8+odHtCmbIS4QuHiYSwJxAMEqIdMQKxflk53/n
X-Received: by 2002:a05:6214:c68:b0:4b2:31c5:78bc with SMTP id t8-20020a0562140c6800b004b231c578bcmr45455862qvj.45.1666960489691;
        Fri, 28 Oct 2022 05:34:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666960489; cv=none;
        d=google.com; s=arc-20160816;
        b=L0KiwRzMsD+s/VKWkFEC0fMTHDtpQkLJh1F1BMU3PHw1XSBul0KWSkLYEPYbVD7yFI
         LrjM1EQ981zFO5FVn5bzwuX27ud16eSR6UaB/t9Rc6lVGW9j0Sz6YS4nuYXq7SyB7swz
         BQGOGOwgR5XKR018lOwl4ImYJmD336MjC6xpcxc7gKUjmGVgZNTF6rTFhuTqJfFOKNw4
         1CF/3wsszR1lFw6DDa4hO8Z+Yre3Mrd3utD6wQC/cRyhsd7bz6smrATsFeRmskArnlH4
         yXkSahdbeOCfL2PgmKaIEeWO5oWQiJUdVX0kYlvbwZByWLlDuWuGE5T+8/TP2jvnAJE/
         GFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FkGOLeaEonfb8XEsVx6J57XrctBVTY4s5Nexnx7fj2M=;
        b=c8khAUvKiwZx8Q50JFbzgIYS2sRPPAWXzkabZcWSi6fgjR+R1HKJSAE2G3FLGsCXOu
         Hh/Eoam3FFU9/bdKvzoCnCWOLk2VhAeu+Abv91pyJDWdUzhMmVnhFkQx9nzQ3pQdsfTV
         40r4DAxV6j2M/PCOGR3I/Ucpd35dH/uIol8Bg9F00VHeDwl10Tu2NWoOe2vHrZ3agQ4N
         RknHOetnxABLA9LjT0wodwRb7x8YT/5LLmovXJt0Adr+D70VtZU3iuA6eGifCzhN2M/g
         ldMKJAQganzDheYxnNfC9bKCvMuUsV1jIl3nCTPLM6wZCWt9+TiIHwIM7oiPlFNOa/BN
         oP6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=VvyAZEJl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020aed2787000000b0035cbddbaf4csi2828460qtd.477.2022.10.28.05.34.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 05:34:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=VvyAZEJl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOXj-0006qI-LV; Fri, 28 Oct 2022 08:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOTF-0003z2-9G
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:28:23 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOT0-0003YR-Nv
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:28:11 -0400
Received: by mail-pf1-x42b.google.com with SMTP id k22so4683491pfd.3
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FkGOLeaEonfb8XEsVx6J57XrctBVTY4s5Nexnx7fj2M=;
 b=VvyAZEJlhjYI2Gknm8U9/UOc2/M9BSuOAhKHBVHhiaHVe1vXt7YNLOayY71e1B/FS2
 6eRuUWrZ0niSWEo8cYAJo5a1CythA5XA3L3CTrs7itCVi1ea4//8DmjcY3KNKxxMil8v
 reVsU4G+gY5Pv/SCOxJE3lVcYsef62Q7XzVxl2dS1MNqlIhPqNhZbdNZfgwuni/y3JN9
 8EHy37kXtLwCtsdurtbyNOIo73R58h5UTDKrh3duvd2aL4KgI44CiIPKuJttjw83SEBo
 K2vSyKHI+CrE0ew8FD024E3ehxFjT/xhRNYrlqrSIiCGfvyCpbUhHySJavoXY95GUio8
 zaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FkGOLeaEonfb8XEsVx6J57XrctBVTY4s5Nexnx7fj2M=;
 b=uFaomWtlj97NjGTXUK8skSphx1gamWYREumsjP2sfen7puYuBKbbTNDsdE6yO/qfiQ
 OSMg1Sy8bR8zqD+7mC8wmE6SFHMz1hXSc/NrkYYVf8HHGGS3vd7+moP/ZUjU6NiFLx9z
 8vohU4tes9zHYxV1pfTcBl3gWigewoWZUD4Zk68z4mcc50F8mWY1eietFaMKM1O4Cr1b
 oEBc58qUq+b2A5JQNLuzkdpeDmzHPvIFrKmXf3ob2iP5ZSz6prVJlySfQpy7I+pMzHVe
 9xZ/zhPyW3UOlHTOX9JsS7k92WuW/8ZkuO1ph0a/bO2ywChQCu9cyv2EZGRggEPUHZyr
 TaiQ==
X-Gm-Message-State: ACrzQf2XF6E7SzQg/HW+RuumiFNomFlz+LM4i6Jp1ixOs8DCs2BOyYl1
 UjzdMEhF2WsSjZ3FGbYqyNAW6Q==
X-Received: by 2002:a63:9:0:b0:461:f0b6:759a with SMTP id
 9-20020a630009000000b00461f0b6759amr46850775pga.153.1666960084816; 
 Fri, 28 Oct 2022 05:28:04 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:28:04 -0700 (PDT)
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
Subject: [PATCH v5 16/17] virtio-pci: Omit errp for pci_add_capability
Date: Fri, 28 Oct 2022 21:26:28 +0900
Message-Id: <20221028122629.3269-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028122629.3269-1-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: uG1i4msQ9QI/

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/virtio/virtio-pci.c         | 9 ++-------
 include/hw/virtio/virtio-pci.h | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)

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

