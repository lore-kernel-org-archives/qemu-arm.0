Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp930268ejc;
        Mon, 31 Oct 2022 05:35:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7KSJZ0y6UvJOeECqZXpjiQ1/gU2agTPogx01bodF+4JDcb+yvETgZSzHkFvC+yDU/xYgy+
X-Received: by 2002:a37:2e84:0:b0:6cf:8dd4:7adc with SMTP id u126-20020a372e84000000b006cf8dd47adcmr8770744qkh.723.1667219707579;
        Mon, 31 Oct 2022 05:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667219707; cv=none;
        d=google.com; s=arc-20160816;
        b=EdnvnB0WnqG1A6AqL0VNG+Dy7dH9udVli3jSXG6In5s3WPh0x5roDGFjjnMEyyEE0U
         ByywgP9cL3YPps9rmxm7jPUkZ8XF3NqK3W/ih9Tb6uBhj3OnYC7C8ZEQnS/qW1mMycbY
         ZW0Ir1xUoYumG+XbMMbPHzGF7W1O7hoRkMlYeRLNLgT5VXMt8mWArQ1sBoTZULSnkrxT
         eAjgIlYMEDj+0l3MfLcdUWhrO4NIh/9fHjpBWTUTW0ziRgzvniNV3Gdt0eHn42vQ2SOn
         f+QLYCydmlYR9rxoK+c8vpSCrvTtwqt/UmFIZgRQFmgNZcBoasWRIeUaXAgcDeHhq15+
         F54A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Nr0YW9yWzkpPk77jiuUxzZwbjjkwdTQ1TcUuJ89L3jM=;
        b=LbjT59LOi4hBoHvHF6qVPfDxC7EGI4yzN9BfsU3nkI1vOuY9Q4JBFBGdhC3K2RG8GI
         Qd2hs2jUDB80ZivcHxXhpr+RRLHAGJxoWTNGZ3t6kSTWVUr3ZyYGTZAgZ9A2k6HLm69P
         Ti7Y5ZLNZTF3/z+x67mTdtEA+I9gdmV3QjR5yHAhpR/xl+QsKmlOzOjDKkCEAYnhy5Wf
         GPWIb0PCSg4ofCDBnt4UBniY0PoiWmpB8cspG3qiYPYeDsuM4D3ypuNv8cktdjP5kial
         sPh5pk7+H/Y2GHpOd5NYeySyiYD7UnZuBKapziW6fjafMn1YHzTAdlNeUaOfiIUAXpl5
         gHnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=5sW7IDud;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19-20020ac84613000000b00399f295a5e8si3626187qtn.38.2022.10.31.05.35.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:35:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=5sW7IDud;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opTzt-0003iZ-Jc; Mon, 31 Oct 2022 08:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTyz-000311-RL
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:33:46 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTyw-00048A-US
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:33:36 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 c15-20020a17090a1d0f00b0021365864446so10150805pjd.4
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nr0YW9yWzkpPk77jiuUxzZwbjjkwdTQ1TcUuJ89L3jM=;
 b=5sW7IDud1o1MLCdzFhhAEoviI4jujWiGEtqNBKU1SY2A0ZCuyx8kOfZDmVNZYsPHA6
 ip4OBQnYUhYtNPV1A1EyE5aRgi9HeXUeGfa+7f4M1ZR7AX85tu8DcD9qNqR+pEJvqkaU
 6LJhdurILctxIfkmztQB52ysjEpj0YU0KB/78sPimt0Cewyw/Pey0AI53jO73xzdeJDK
 noHT6aqSBM2kwHysEIQlIp3A9F5pijjJOY8YepKBnInF7YyOEhogMIEOsdVPPtGyZqdl
 NUK5PkcQ7aI3FYD+1X2awM3BOj/lb5q8V27I6N9RwXup/WuTt+aYGYpwDJ4KAoK2ntUr
 Cnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nr0YW9yWzkpPk77jiuUxzZwbjjkwdTQ1TcUuJ89L3jM=;
 b=Wmn1R4BOxO94iBzjfOORsdDaIgCNQIfiO5kI+6Nd6u/6cxqdzRTlXF85pCSx/VrgRC
 3+6mOznDVHG81woBpyZfY+/PAKjoWx5zHG+s+1jDQN+WvpKnMko5hfLx6tHqZ1OyN7cm
 skTJ59Y7f9Ofwg2V2HYmC+xfMhn26XaISrz+szyGGt7jhZx5PQ++mQN6K9WyryfA5M/C
 aM4q5jtMMyK4CCN4mHdiYLMHc2g8h4Gv6b+yoki6GccWpvpKmYnM2PD66qYVgVGIw8V9
 RE4zV5C4P09QthnqCfwuV6dciicZiNeonXbvyX2kl0tmy5YIsYoFsBYDZNj/dEjoLMOy
 YeGw==
X-Gm-Message-State: ACrzQf32rukJ25mKwcbsdGUTPB8QdPsFdTh/Y0o4rUbSPOrI5/TkCnfu
 qM6Mh9LPPVQy/jMyLRtlK9MskA==
X-Received: by 2002:a17:902:b10d:b0:187:29fe:bda0 with SMTP id
 q13-20020a170902b10d00b0018729febda0mr2209432plr.16.1667219613728; 
 Mon, 31 Oct 2022 05:33:33 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a6545ca000000b0042b5095b7b4sm4093810pgr.5.2022.10.31.05.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:33:33 -0700 (PDT)
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
Subject: [PATCH v6 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
Date: Mon, 31 Oct 2022 21:33:03 +0900
Message-Id: <20221031123319.21532-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031123319.21532-1-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
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
X-TUID: IsuKrWD90BdA

pci_add_capability() checks whether capabilities overlap, and notifies
its caller so that it can properly handle the case. However, in the
most cases, the capabilities actually never overlap, and the interface
incurred extra error handling code, which is often incorrect or
suboptimal. For such cases, pci_add_capability() can simply abort the
execution if the capabilities actually overlap since it should be a
programming error.

This change handles the other cases: hw/vfio/pci depends on the check to
decide MSI and MSI-X capabilities overlap with another. As they are
quite an exceptional and hw/vfio/pci knows much about PCI capabilities,
adding code specific to the cases to hw/vfio/pci still results in less
code than having error handling code everywhere in total.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/vfio/pci.c | 61 ++++++++++++++++++++++++++++++++++++++++++---------
 hw/vfio/pci.h |  3 +++
 2 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3d4a..c7e3ef95a7 100644
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
+    pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSI);
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
 
-    msi_64bit = !!(ctrl & PCI_MSI_FLAGS_64BIT);
-    msi_maskbit = !!(ctrl & PCI_MSI_FLAGS_MASKBIT);
-    entries = 1 << ((ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
+    vdev->msi_cap_size = 0xa;
+    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT)) {
+        vdev->msi_cap_size += 0xa;
+    }
+    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT)) {
+        vdev->msi_cap_size += 0x4;
+    }
+}
+
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
@@ -2025,6 +2044,22 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
         }
     }
 
+    if (cap_id != PCI_CAP_ID_MSI &&
+        range_covers_byte(vdev->msi_pos, vdev->msi_cap_size, pos)) {
+        error_setg(errp,
+            "A capability overlaps with MSI (%" PRIu8 " in [%" PRIu8 ", %" PRIu8 "))",
+            pos, vdev->msi_pos, vdev->msi_pos + vdev->msi_cap_size);
+        return -EINVAL;
+    }
+
+    if (cap_id != PCI_CAP_ID_MSIX && vdev->msix &&
+        range_covers_byte(vdev->msix->pos, MSIX_CAP_LENGTH, pos)) {
+        error_setg(errp,
+            "A capability overlaps with MSI-X (%" PRIu8 " in [%" PRIu8 ", %" PRIu8 "))",
+            pos, vdev->msix->pos, vdev->msix->pos + MSIX_CAP_LENGTH);
+        return -EINVAL;
+    }
+
     /* Scale down size, esp in case virt caps were added above */
     size = MIN(size, vfio_std_cap_max_size(pdev, pos));
 
@@ -3037,6 +3072,12 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
 
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
2.38.1

