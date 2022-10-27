Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp157678ejn;
        Wed, 26 Oct 2022 23:39:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM666LpoDD3yP/QkFWXh1GddtB0PyF2SCAb2bCW62ViMwfXrnDE2ii9cWmIrg5JYs20T9JbA
X-Received: by 2002:ac8:5a4a:0:b0:3a4:fde3:6cd1 with SMTP id o10-20020ac85a4a000000b003a4fde36cd1mr151002qta.518.1666852796215;
        Wed, 26 Oct 2022 23:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666852796; cv=none;
        d=google.com; s=arc-20160816;
        b=YUfRlRNf7CCE4Dka//v3eNFKPT2cCO2dMaMzYJaW27X22U6k4OkaHdirER6zruD/TJ
         lxiBhdAdpYAEMYRM3xpa4f0PGyLEJCWH+6Fa0VpucetneGRmdyhnGfrjj2uVC98lyUeP
         Q6E3UE4v1UthHkNWG3E6E8w/EyjDrhsKbVSlY/jCvKH5eJ4G24cw76w/8bqDBhVjx6aR
         XhVHgm8d8gJK1eWtPLv4WYgrYA0+Yhum/fetpU/WESj2+Ce/W9ToOAEN7P72yGPU9mQA
         Mbrb5k2DC2m6n19N9irCFK3GVOfnZ3T+ECbz7gfk9uWGRbRBsoyZ0HPAej4feyZtI45f
         L3rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4Xxs0NFuqvg7Vtl90axivbNNVJnByrtsktTsJnYMork=;
        b=kyaaUb4xkxbOaGHmtjqA6IwHuWo0OD9jg0i5WHV/o4BIYVx3fWPP5Tk7zCAmwE5eDo
         6IIqZHzzoJhuQs04XvOjRfvoaN8CqmAjq7KZ7HvzedVg1zfMX2/PE7qJRBoH6UG0qhmn
         ryB6Wxzs/m/zN755und3yLfAMgQ8mV6wS4Ekjd58kNe8uF0m4TY/FSHBHJ46ZE3KOw6+
         SxmmLguyfMvMqy7rdZWNz201fXrHxev60KhK0d/UBEcb+aekrBGx2oeBeaIA0dbGatGX
         0Knqf8hyNPJLNGluFe1exrOVWhPkZc5PdC4BbUm9cu9oMTGGnn/9IOU8pQ407H2u4mp6
         p8bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="5B3z/7f9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 190-20020a3705c7000000b006eb472451fcsi405187qkf.113.2022.10.26.23.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 23:39:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="5B3z/7f9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onwXJ-00064H-MY; Thu, 27 Oct 2022 02:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWI-0002c3-G5
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 02:37:43 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwW2-00038k-Qb
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 02:37:38 -0400
Received: by mail-pl1-x62f.google.com with SMTP id g24so475111plq.3
 for <qemu-arm@nongnu.org>; Wed, 26 Oct 2022 23:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Xxs0NFuqvg7Vtl90axivbNNVJnByrtsktTsJnYMork=;
 b=5B3z/7f9tM1Az6Gx+Foluox9+NHUgZzlXh3jixK43t+QAVDBtcX8JIPI/OO9btv8Ee
 MNsnUR8zgNI2CbbvPi7gq3mj5r7mjVvmsr791kC3o4Hfzk4/SWkRn+QvPLze2Axl+ZY4
 7g/zpdU9Nlt6a8qRmBYxOa828YJKizjRI0r2OtOqTQwiBn23ey83Dsx6mkTVkuN5s9o+
 mO/P3NBJBsKDx54wXHNYpGe+a3GdLy92MxgZC+DttrSvyTcnKfQFKCsKM85hQSao1qE7
 gUkMqg9Z8Y11HQXF3MTWFbkEvlSmQz6rCbNNEzP3T4EOFfeMlMmDeu5RIBOqlyVJYrbq
 5ffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Xxs0NFuqvg7Vtl90axivbNNVJnByrtsktTsJnYMork=;
 b=OKxrRFZthKcT1vDVJDADvYpc15FsvzMJsIv2uzry+IbB5A81JLrFzgqA89pydUoiJV
 xuRotiV7RaJjvCKDBHX16RZs/waDPQoBku2cDtiWlfTbSsnqpmDpVjLyRqZi4cyxDdY1
 PF0T0XsFn9iGNU7/HAnLgj2WY+amsj5R5gue++yReRuyLjIiKkaLgdG/02bfNmd6hrf2
 iOyRBoMw6jNzrpsWY0azgf6HjODCYCdKMNgg1cbFopS2cs0Z3E4iNpf0PFDTK1FeHdBT
 5hXAlrJmp0jNDkNt3w7ohiTufeMt5ywEpyEq4q3DPYXPkp34j8rtKrIiiTyEZ48hIfG1
 TKMw==
X-Gm-Message-State: ACrzQf1w3PTaA0zvswiqbncuOoO/V3/koz75df+zKv8FFZu6lWh4+0qU
 vnnrGM1BA2vxM6HjX2qjFtLURQ==
X-Received: by 2002:a17:903:2286:b0:182:2f05:8abb with SMTP id
 b6-20020a170903228600b001822f058abbmr46242854plh.14.1666852639765; 
 Wed, 26 Oct 2022 23:37:19 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:37:19 -0700 (PDT)
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
Subject: [PATCH v4 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
Date: Thu, 27 Oct 2022 15:36:49 +0900
Message-Id: <20221027063705.4093-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: JIPhg0Jse1w3

vfio_add_std_cap() is designed to ensure that capabilities do not
overlap, but it failed to do so for MSI and MSI-X capabilities.

Ensure MSI and MSI-X capabilities do not overlap with others by omitting
other overlapping capabilities.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/vfio/pci.c | 55 +++++++++++++++++++++++++++++++++++++++++----------
 hw/vfio/pci.h |  3 +++
 2 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3d4a..8a4995cd68 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1278,23 +1278,42 @@ static void vfio_disable_interrupts(VFIOPCIDevice *vdev)
     }
 }
 
-static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
+static void vfio_msi_early_setup(VFIOPCIDevice *vdev, Error **errp)
 {
     uint16_t ctrl;
-    bool msi_64bit, msi_maskbit;
-    int ret, entries;
-    Error *err = NULL;
+    uint8_t pos;
+
+    pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSIX);
+    if (!pos) {
+        return;
+    }
 
     if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
               vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
         error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
-        return -errno;
+        return;
     }
-    ctrl = le16_to_cpu(ctrl);
+    vdev->msi_pos = pos;
+    vdev->msi_ctrl = le16_to_cpu(ctrl);
+
+    vdev->msi_cap_size = 0xa;
+    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT)) {
+        vdev->msi_cap_size += 0xa;
+    }
+    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT)) {
+        vdev->msi_cap_size += 0x4;
+    }
+}
 
-    msi_64bit = !!(ctrl & PCI_MSI_FLAGS_64BIT);
-    msi_maskbit = !!(ctrl & PCI_MSI_FLAGS_MASKBIT);
-    entries = 1 << ((ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
+static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
+{
+    bool msi_64bit, msi_maskbit;
+    int ret, entries;
+    Error *err = NULL;
+
+    msi_64bit = !!(vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT);
+    msi_maskbit = !!(vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT);
+    entries = 1 << ((vdev->msi_ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
 
     trace_vfio_msi_setup(vdev->vbasedev.name, pos);
 
@@ -1306,7 +1325,6 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
         error_propagate_prepend(errp, err, "msi_init failed: ");
         return ret;
     }
-    vdev->msi_cap_size = 0xa + (msi_maskbit ? 0xa : 0) + (msi_64bit ? 0x4 : 0);
 
     return 0;
 }
@@ -1524,6 +1542,7 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
     pba = le32_to_cpu(pba);
 
     msix = g_malloc0(sizeof(*msix));
+    msix->pos = pos;
     msix->table_bar = table & PCI_MSIX_FLAGS_BIRMASK;
     msix->table_offset = table & ~PCI_MSIX_FLAGS_BIRMASK;
     msix->pba_bar = pba & PCI_MSIX_FLAGS_BIRMASK;
@@ -2025,6 +2044,16 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
         }
     }
 
+    if (cap_id != PCI_CAP_ID_MSI &&
+        pos >= vdev->msi_pos && pos < vdev->msi_pos + vdev->msi_cap_size) {
+        return 0;
+    }
+
+    if (cap_id != PCI_CAP_ID_MSIX && vdev->msix &&
+        pos >= vdev->msix->pos && pos < vdev->msix->pos + MSIX_CAP_LENGTH) {
+        return 0;
+    }
+
     /* Scale down size, esp in case virt caps were added above */
     size = MIN(size, vfio_std_cap_max_size(pdev, pos));
 
@@ -3037,6 +3066,12 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
 
     vfio_bars_prepare(vdev);
 
+    vfio_msi_early_setup(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        goto error;
+    }
+
     vfio_msix_early_setup(vdev, &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 7c236a52f4..9ae0278058 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -107,6 +107,7 @@ enum {
 
 /* Cache of MSI-X setup */
 typedef struct VFIOMSIXInfo {
+    uint8_t pos;
     uint8_t table_bar;
     uint8_t pba_bar;
     uint16_t entries;
@@ -128,6 +129,8 @@ struct VFIOPCIDevice {
     unsigned int rom_size;
     off_t rom_offset; /* Offset of ROM region within device fd */
     void *rom;
+    uint8_t msi_pos;
+    uint16_t msi_ctrl;
     int msi_cap_size;
     VFIOMSIVector *msi_vectors;
     VFIOMSIXInfo *msix;
-- 
2.37.3

