Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1702315ejn;
        Fri, 21 Oct 2022 21:56:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6bQcD02FHiblAZ0NC6EAsD2LQXreNDuHgmwed3sfgIyvyFS/7Vg2qbs0iQjLWp5GcZUorG
X-Received: by 2002:ac8:57c2:0:b0:39c:dbec:9488 with SMTP id w2-20020ac857c2000000b0039cdbec9488mr19531215qta.580.1666414572506;
        Fri, 21 Oct 2022 21:56:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666414572; cv=none;
        d=google.com; s=arc-20160816;
        b=wil4RWyLZ+a+UUvuxgpusbV4FnvHRZ2qgGt7KJc4PphuW4fgwmEL/xcL31OT/MKtKG
         GjnkI32Ol6G65k3NapavrKhkKmx3qGG/diDnpk7nwIcsOQs3ZMhO1/rUSH6xYO9NxESk
         uDfwS6wFPNe+09U9QuLw/MRCse/yriTSA9OqFUj3fMKueCsa1pcTEgRpfmfAz2BKvDo9
         zmPFFF/KkiKDp1n05va+lEzaHamjBvB/ebJ+IyDDxeoXQx5XmdaE17lG7+Gw7m7OCi4B
         OHDbmcEyyFdQSc5SCuG9JaZVTiYImYKHE36sN2kh5ezTzbn8K6/iZYhD+e+QxALJFMsa
         YX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VdRBbwSHXA2hZ9q0dYrm3zPKzbn5novCr9BGWMdAXZc=;
        b=lv9ADVZs2yv/EVrzfL/IwG2b74F5g61NAX/CQXFcFBX9LZ4cmFYZZTSfYD7NGxVViA
         AV0uIlwWRcuqyaN5IY340zRFFgger4mVxVlYs7b35MS3Uj63n+SaiI0LQQDT5RtfGG8U
         LPiewz55WiYAw0sZSjaGV7TU8i04NHU+dDyuZDMeqQszT2r0QPAOYmFPyJ14v8IeF0tL
         IRbqiyaWHQreKYL9qTVPtUVDnvN62qxnG4BMY4c4sQxa7D5c6AJReOAv1gp6PjdADBVI
         7VykRo40IyixS5yVY3vRb6VeaL2MKnbsBNLSMHTx+M1O+k2V1Gb/pKNCGZPdwHIyw51B
         DC7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="zyoC3s/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr11-20020a0562142a8b00b004af9fdf84basi13022234qvb.111.2022.10.21.21.56.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 21:56:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="zyoC3s/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1om6LA-0005it-HC; Sat, 22 Oct 2022 00:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6L2-0005gC-Al
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:42:24 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6L0-0003YQ-Qu
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:42:24 -0400
Received: by mail-pf1-x433.google.com with SMTP id 67so4393677pfz.12
 for <qemu-arm@nongnu.org>; Fri, 21 Oct 2022 21:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VdRBbwSHXA2hZ9q0dYrm3zPKzbn5novCr9BGWMdAXZc=;
 b=zyoC3s/705vxSDukPcuD0Ov1B7hqKtjGdDgiQG+3kdDvfPIvdiU12lcG7tUG3atihm
 1NorqQGEZ3YNGFeYYj0LjWNIf7lr/VNd6YO20uQRJMZ0ESwQMVKw9vXeUER0qnqd56gI
 WiReQvplu/vl0obBGGbW2NjYk+VZAkb21P/M6cBQja+R/28K9xgLsa2mnC8ABpQWJ7zN
 afKwQeRJX5MShPGO84J/CV0qu5bKWgXsZ0/wy6zdpbE36SS8Z8fctv+uhMeDmIl77aWC
 hdbubTgW0GB0IdopOHEPyV1Lo81spo8VmIzRb0yIyoTNoLfTS4JjbDnNjtnon3120GKZ
 gt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VdRBbwSHXA2hZ9q0dYrm3zPKzbn5novCr9BGWMdAXZc=;
 b=xBWyTKERJq1pxFg6Vq36c6Vu1jhusxGi9IBe3bddpbDScqaqZkpJxoaKVaiJWM8UOl
 d0CATyLx4OP/f+S4lk6ndCyu5L34MjhxWVtBRCjPv25sZijBZxW8qGQ0ne/xcu+FEfr3
 pIDg38mXa6DBk0mS8+QntUkXHgMu+2lhbN8MKaMaz0LIUvFQusTT3IvIPimlj5hhxZvt
 HOR7AS7BiGnsF4bJDDn2B2ZAfHOrUJdHt/XkG5G42PU57CHRrZB8ntBhj8b6jhX35XIs
 eWpV+KarYN+FdhLelZyHsGV6AJgmfMCEz0X5imGGYqc1bKwUJGRq3rwRjqfc+lfFED6j
 k7tg==
X-Gm-Message-State: ACrzQf1phjS7a6JmthzUxYhhTmuWbyQAwhikrf+rba/bxXny8/XwDhjl
 LhKN7tvTT1xjZgazldlVhnTleA==
X-Received: by 2002:a63:91ca:0:b0:460:c58f:3127 with SMTP id
 l193-20020a6391ca000000b00460c58f3127mr19221946pge.31.1666413742187; 
 Fri, 21 Oct 2022 21:42:22 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:42:21 -0700 (PDT)
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
Subject: [PATCH v2 14/17] hw/vfio/pci-quirks: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:50 +0900
Message-Id: <20221022044053.81650-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::433;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x433.google.com
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
X-TUID: LQmGdCbJZ1MM

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/vfio/pci-quirks.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

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
-- 
2.37.3

