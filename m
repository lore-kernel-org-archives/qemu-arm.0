Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1980040ejc;
        Tue, 1 Nov 2022 08:54:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4/x/GW9Ky2JuZD+sN0H/rkdodJIfv7DBhg6mfONIJpA8YRuckRaKd6cWcS/kj0P/Gdk2Jr
X-Received: by 2002:a05:6214:5086:b0:4bb:cb21:d369 with SMTP id kk6-20020a056214508600b004bbcb21d369mr14512613qvb.124.1667318064573;
        Tue, 01 Nov 2022 08:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667318064; cv=none;
        d=google.com; s=arc-20160816;
        b=jbEds+QbggsVpPIIW0yHk23RG5O0230oPEucUmgEjV+qnbQzNP6GC3Fr3b/1wRSnKw
         VDnMexPWBRDhj9exHeX50sSYTs6TNSlPd967n7xkySzde5kiPGmq26JKhQR+d/i1bFOT
         /1uCW1U7EjcyeMIc/3mqMF7Rt/0bVtF7eSyYUIW8AYJat8zFcjzil7KRTw7U75d+uZiK
         VVk48aVNfxka7SWG8w5ZdnwOmia3n1F10xlPOswInQcWl8WYkYfX4eHhplk11anZlgss
         eQsszlfYt8AqaOmSTBCD5+NeEiIwfIUr4hBBFFhek51NO4hHiQBhaZjdvfps0rQn5Mo7
         Q5Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=At8j53igPyPAzDtB1h3pG2XsyNuLgQtuDuAHSF4bzEg=;
        b=QC0WpY2bIowx80rwAaqd4pZpb//iZtiGRSyolBpnvRW+6btvlagdXgKS63jl80iXMT
         LHiSF+C1rcznfCk4Kio4YFYqlp5R8x+zTvH/aGqT8mOgFBfoLJh3bk9Bhhy32akK0shh
         bUckQ3CHtPGiX5P29GvdhDnR9NtNkEZVodzmqSnF9zgq/DoZyAPA8w4ffRt36t80beL+
         QT3M2r1fPu7kXp7XGDH8mKjypzCS+9Kxo516Nih8CMP+i+iStoitqnLodGwRTxzFtP1B
         MNd28F2kCVrh6uKLIudUiL6hkg5+YiF/TfYVbq0nSufaMH9lEy9OzFFDC8n6iaN75yo/
         QgFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=WkLHXxc+;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fq4-20020a056214258400b004ad73812f2esi6133226qvb.428.2022.11.01.08.54.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 08:54:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=WkLHXxc+;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opshp-00074f-Vk; Tue, 01 Nov 2022 10:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opsho-00074Y-VS
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 10:57:32 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opshn-0003g4-Bm
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 10:57:32 -0400
Received: by mail-pg1-x532.google.com with SMTP id b62so3257189pgc.0
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 07:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=At8j53igPyPAzDtB1h3pG2XsyNuLgQtuDuAHSF4bzEg=;
 b=WkLHXxc+SxnccDKsma7Nw57lKYx6v2GEzbJ6K96VSFuBwc+aF1tVJumudWilea3iUb
 FYBa0x9kRZCL5Iyw7Y8OqFqFKa6nZs5auZCiYgfPrF80YgpXxsqXQcsC1TTlQhSUvRgF
 QBh3sOKpWYsBoNW9gkXXDPZyDo61nM9ENLzSMtN+yeIlnjgVOGMm1xhrVYo5iDXxBVxj
 R4x4Hk+SfmR6CVzO0ovwZ3F12u5diYaHtNUbhIOEW/W7I5Em/nbN1Nnk0gtzTcAiVWhR
 M7BFdAcGSEYvlUEAwrF3D6opSUg7/2xVRYgndoBDulB0XjoPPBzCAuSsmlL4yKLmyW5k
 NG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=At8j53igPyPAzDtB1h3pG2XsyNuLgQtuDuAHSF4bzEg=;
 b=D9FU84Au9rhVudsh9q6vSTf5atjJy03IgGntl85T4wrLMJgBtWH47nJzEgbyYLYAvh
 GG48SEk5Pm/M9gvbyxyLG5wFLrdIzEveVH4O7mELbPzV88ezlp6IKrjjn6U0fVA9H7YR
 1imTnSijrp8A8pYZbBGFG3233qrV4W7oVenZsfmsbiE7mPsBJmT6I1Y3PcHWsDQ8x9EE
 8bvnFQZb8/HYDaDtn8ukgT2GUyyHUukDibjWxYJc6Q7tyMtBiq6cBS78TkpS2kz7N57M
 rS+7cFq1hujUvSkqLt8XdEvLXRf7N3t8I5suzSS1QZJySvCXufIh4eKYy2fjt0wM95+m
 1tjQ==
X-Gm-Message-State: ACrzQf28H/75b1k4baxz89sbxuGxBNCUZVadMNFFe0gIqEGgKsOo00mE
 1OcS47FyBZb5UdaGt49iHrOggQ==
X-Received: by 2002:a05:6a00:1d89:b0:56c:a2b:f1c2 with SMTP id
 z9-20020a056a001d8900b0056c0a2bf1c2mr20489429pfw.45.1667314650586; 
 Tue, 01 Nov 2022 07:57:30 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 22-20020a631656000000b0046f9f4a2de6sm4783219pgw.74.2022.11.01.07.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 07:57:29 -0700 (PDT)
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
Subject: [PATCH v9 15/17] hw/vfio/pci: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 23:55:56 +0900
Message-Id: <20221101145558.3998-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101145558.3998-1-akihiko.odaki@daynix.com>
References: <20221101145558.3998-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::532;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x532.google.com
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
X-TUID: efRlsyTxDD7J

The code generating errors in pci_add_capability has a comment which
says:
> Verify that capabilities don't overlap.  Note: device assignment
> depends on this check to verify that the device is not broken.
> Should never trigger for emulated devices, but it's helpful for
> debugging these.

Indeed vfio has some code that passes capability offsets and sizes from
a physical device, but it explicitly pays attention so that the
capabilities never overlap. Therefore, in pci_add_capability(), we can
always assert that capabilities never overlap, and that is what happens
when omitting errp.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/vfio/pci-quirks.c | 15 +++------------
 hw/vfio/pci.c        | 14 +++++---------
 2 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index f0147a050a..e94fd273ea 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1530,7 +1530,7 @@ const PropertyInfo qdev_prop_nv_gpudirect_clique = {
 static int vfio_add_nv_gpudirect_cap(VFIOPCIDevice *vdev, Error **errp)
 {
     PCIDevice *pdev = &vdev->pdev;
-    int ret, pos = 0xC8;
+    int pos = 0xC8;
 
     if (vdev->nv_gpudirect_clique == 0xFF) {
         return 0;
@@ -1547,11 +1547,7 @@ static int vfio_add_nv_gpudirect_cap(VFIOPCIDevice *vdev, Error **errp)
         return -EINVAL;
     }
 
-    ret = pci_add_capability(pdev, PCI_CAP_ID_VNDR, pos, 8, errp);
-    if (ret < 0) {
-        error_prepend(errp, "Failed to add NVIDIA GPUDirect cap: ");
-        return ret;
-    }
+    pci_add_capability(pdev, PCI_CAP_ID_VNDR, pos, 8);
 
     memset(vdev->emulated_config_bits + pos, 0xFF, 8);
     pos += PCI_CAP_FLAGS;
@@ -1718,12 +1714,7 @@ static int vfio_add_vmd_shadow_cap(VFIOPCIDevice *vdev, Error **errp)
         return -EFAULT;
     }
 
-    ret = pci_add_capability(&vdev->pdev, PCI_CAP_ID_VNDR, pos,
-                             VMD_SHADOW_CAP_LEN, errp);
-    if (ret < 0) {
-        error_prepend(errp, "Failed to add VMD MEMBAR Shadow cap: ");
-        return ret;
-    }
+    pci_add_capability(&vdev->pdev, PCI_CAP_ID_VNDR, pos, VMD_SHADOW_CAP_LEN);
 
     memset(vdev->emulated_config_bits + pos, 0xFF, VMD_SHADOW_CAP_LEN);
     pos += PCI_CAP_FLAGS;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 0ca6b5ff4b..458729eae3 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1839,7 +1839,7 @@ static void vfio_add_emulated_long(VFIOPCIDevice *vdev, int pos,
     vfio_set_long_bits(vdev->emulated_config_bits + pos, mask, mask);
 }
 
-static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, int pos, uint8_t size,
+static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, uint8_t pos, uint8_t size,
                                Error **errp)
 {
     uint16_t flags;
@@ -1956,11 +1956,7 @@ static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, int pos, uint8_t size,
                                1, PCI_EXP_FLAGS_VERS);
     }
 
-    pos = pci_add_capability(&vdev->pdev, PCI_CAP_ID_EXP, pos, size,
-                             errp);
-    if (pos < 0) {
-        return pos;
-    }
+    pos = pci_add_capability(&vdev->pdev, PCI_CAP_ID_EXP, pos, size);
 
     vdev->pdev.exp.exp_cap = pos;
 
@@ -2058,14 +2054,14 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
     case PCI_CAP_ID_PM:
         vfio_check_pm_reset(vdev, pos);
         vdev->pm_cap = pos;
-        ret = pci_add_capability(pdev, cap_id, pos, size, errp);
+        pci_add_capability(pdev, cap_id, pos, size);
         break;
     case PCI_CAP_ID_AF:
         vfio_check_af_flr(vdev, pos);
-        ret = pci_add_capability(pdev, cap_id, pos, size, errp);
+        pci_add_capability(pdev, cap_id, pos, size);
         break;
     default:
-        ret = pci_add_capability(pdev, cap_id, pos, size, errp);
+        pci_add_capability(pdev, cap_id, pos, size);
         break;
     }
 
-- 
2.38.1

