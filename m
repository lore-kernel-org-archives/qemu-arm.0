Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1202389ejn;
        Fri, 28 Oct 2022 05:30:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5KJupU1dX4gDDbVMTLBe/ivXT69tgLnLaG1ewFQjVz4F3uzpGafMR+sB7RM4BVYCI7wHre
X-Received: by 2002:a05:6214:21e3:b0:4b2:6624:753f with SMTP id p3-20020a05621421e300b004b26624753fmr45989919qvj.105.1666960225437;
        Fri, 28 Oct 2022 05:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666960225; cv=none;
        d=google.com; s=arc-20160816;
        b=QijMKKeta2V8wV/dIYfuKbPsNd7rINlXyqz2GnDUwhgCuxcIOwTBtdRquyj4F/vist
         NA9gpLlc1FGgOocOo4V3nuikI7sy90s2nTgreCRuOw2y13kJZoeOmxTUFsiV0OyWdlgo
         YWhqTV5j4Pe/r5Gie/DcOIDVCqqvLScSohSA2zipPhpLF14rDVydAuYdQCVhSQoQLvnw
         XRN98mbLGjRpk/syjFXFagxAZgEoO0eAGWv++DirPMKJ7tfs9v7C2vXQWQFzKXzUSCoa
         rPFCyETfzKevty38lyQnE5uB6mJUlo1tGBAf++1DhB91D7FfKqPWQgjFkJwjVESUdmf5
         iniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Amj+vSFcdbQnaoWcuLvjNhpGRqy42M12Pln3+46OKr0=;
        b=LUQLga8dyNCf/RBeLvpJ+9lmk910VHDGzpqlEzxWSPyFA5n6AHZoyWpM8+TLXtTvt9
         Kn6Robx4sOEcgVRy84miWc8sSMg1sS7gJgNj6ufKlgyIZJa4kqDSOkMe6bJ8Nl+n8Emh
         65OmcKkEwmAQOqbSP3fvM0ZH8ZISwpNVNNDNWOEuWLe1bJkJIbCd5pqFH+H3zhVCeScv
         efBmtVwG2sUdAtnOHpkTRBp7wlP9egEOhHcy0egEQJsMsLO/u3RwHclQoCJcckVlE4B2
         AZj8p4SN/rzCJ8/7XEQd/p28SWzWuayHhDRXzGLa+EnMpJmAymFR6qFar3GVqzE9e2jX
         fLQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=yRLR7VqF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8-20020ac81488000000b00392803b3acbsi2540002qtj.614.2022.10.28.05.30.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 05:30:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=yRLR7VqF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooOSr-0003Np-RJ; Fri, 28 Oct 2022 08:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooORt-0002mL-I6
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 08:27:01 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooORq-0003Gx-J3
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 08:26:56 -0400
Received: by mail-pf1-x431.google.com with SMTP id k22so4681225pfd.3
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Amj+vSFcdbQnaoWcuLvjNhpGRqy42M12Pln3+46OKr0=;
 b=yRLR7VqFY4R2t504OuxBL2i6e6/EfeFrW1m8OCLmSDqbUcIj7KykRumaGHDDhC2ns7
 Bust8hubcmExPGZ52osDPmnOpZAYT1/vZ5yYrdKK3DjgcaMhWPFBEbZoGw50C+Ncuz0y
 LY1HJuNpDKzKXPG09YP3yjb+MsYg4rO/a3jmH964XZJ2gemW++Nb8RyTL0eRyzvicRDF
 wbYZmFXU7ktKCTo/ue/jHpeTKVpuYIxbaEIlfpwwQAM5RKldcR50YlFULxm/0qtMU7sB
 w16mIYfm8TjhI9LBHB7YWgGyUeuSUDtYMkLgNCjBp2DdugM5R7RnlNn9zi9IAxI5UjJj
 YVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Amj+vSFcdbQnaoWcuLvjNhpGRqy42M12Pln3+46OKr0=;
 b=blegaAarPZcwBsP2il1pvEhI48i/rS6xPbCr5fUy9CTeAisdwDqQ0TazDZ6Vbg6oGU
 3FVdMOetfy8zF9Izz4i3+Qb8rqEUMsSsfvqnL0a+ZeSfW498gtmJEWUPls+3XWlZdP5z
 /IIIBgsgTW5oKxGBj0bNKiULEHZhy/s5882mHo4jD/UV0dfQlA00EqzIxtbmjZQwW0Pm
 wUIwKykoynu22pyRB5JK7xF5SZK5TNE4QxDevL3/RHqxr79l8H7Jdl8ZndZExGMQ8qUV
 19our3cfixzQTsuyxObOuOj6avOZUJeR90NdeF07PWIx85EG1H557OQXnZHjKuNod6tE
 DyUA==
X-Gm-Message-State: ACrzQf1ZMOl2OlqQls3LY1VJLJaKFbVlbLywFQdqyBnLmCYsTuepIOoo
 61dfb/QxY5dAnaElB+5k/eOl6Q==
X-Received: by 2002:a63:cc:0:b0:463:6cb7:4f5d with SMTP id
 195-20020a6300cc000000b004636cb74f5dmr45579042pga.489.1666960012625; 
 Fri, 28 Oct 2022 05:26:52 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:26:52 -0700 (PDT)
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
Subject: [PATCH v5 02/17] pci: Allow to omit errp for pci_add_capability
Date: Fri, 28 Oct 2022 21:26:14 +0900
Message-Id: <20221028122629.3269-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028122629.3269-1-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x431.google.com
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
X-TUID: l12BNOy1KFkm

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

