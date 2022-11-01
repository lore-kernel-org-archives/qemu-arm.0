Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1433019ejc;
        Mon, 31 Oct 2022 18:03:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM48lGH8yN9P5ahpVkI3pBhLt/Me0R2ubvaTvzJtaxVgDr7zvvBlc8zTeAJABzmthVu4OLxG
X-Received: by 2002:a37:98c2:0:b0:6f8:6a62:a195 with SMTP id a185-20020a3798c2000000b006f86a62a195mr11238202qke.245.1667264606863;
        Mon, 31 Oct 2022 18:03:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667264606; cv=none;
        d=google.com; s=arc-20160816;
        b=FDx917w261C/5MqlzEiUsR2uRtrGv14sF3PV5T7Z2eTz5u9srbKGBb4+prd65vIoOR
         8i92kZVoOKh/vnz+rkg6PJ0ZKKnJQ4O5PNgS8dDYcuK7O8XnR/xP9PwXDxS4eQQj5xXM
         iAvMNAdgKH6bjwHHoQPpVRklAOQEfozuCrMEhx9fhKkhY6Lp5QOBcElrz7oWPsNYNgHM
         Bdb7RBie4LTUODMOOomea0NmHAvv/o1webkmRvsZNQvzKCRMhps3OU1gtPmZnCKU9mRK
         emOBha6J9By5gmSzkWhyFSRiKAMmfjjqMMjol7uA1KgGKFsGS5YgHbkGRhnQsHXytgqx
         tKcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HE9eNBY7g78il39owcm9+qENzxyBHsC1WY0V/xnA/n4=;
        b=MFtnCTeqdAywNTh+haNRskOtphrZljPglr1lrdnWBM9cuSqkegEgFkCDDU5jsiTL4s
         OcFCSGqhKgZ6cYsFMrQUFdUtr0fgbGyzKaC7KAkfU0cJjHR2dFuRmL/iTUgr32vYaRXB
         Wg+Mbanl6jIYNeNq6/IzB39KEH+DAN4WR4ZUBO0eEYIQokOxW0L7vZ5HapG3n7n06FZ1
         p0rI9sEPyyChZnvGzpbIxStM860bYBYaAEZo6PpMhIQ5WGuMbf6n4wBv5R9GmBri/jbe
         4xDrr9tmS6IcbPJ150A3qy7086AlZXL7BuadL7iges91u/2P5bv3PNgDgCrB7A7vZFSY
         3dWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=7S0Qny8L;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11-20020ac84a0b000000b0039699a019e9si4557660qtq.70.2022.10.31.18.03.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 18:03:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=7S0Qny8L;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opfes-0006KW-52; Mon, 31 Oct 2022 21:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfdn-0004qt-2N
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 21:00:33 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfdj-0006e3-8q
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 21:00:29 -0400
Received: by mail-pl1-x62c.google.com with SMTP id l2so12199810pld.13
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 18:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HE9eNBY7g78il39owcm9+qENzxyBHsC1WY0V/xnA/n4=;
 b=7S0Qny8LAsoDGYn18UFJxdivyXaKR6cuxI3yy+Uo2AB/Z8TvguzbIkGNcrMF+VDd8L
 cf92eJsPB0mNWO7kQt6gh7L1EhPHZQ4xKODvVTy9+EzopDnqpKPz4CD69awm39DcSJai
 ahdSvb8o3usa8MV91WtXonbkncYNc6HdnK8l/TjWH3r8Eqjsxwqz+U7txiVFE/9V/u4C
 9tTUvW62fmSv9n6eafuU+TNl/x0+aRxY8R9hmn9/ohLxa4Lv+20Rc6GA19w/pUb6w8uJ
 yAOur0OKHaedbC0LWHIGPvtMokRjra0Uc3dSYev/ch78HmPzjmvcHp4yR0/ft0/vlJMd
 RYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HE9eNBY7g78il39owcm9+qENzxyBHsC1WY0V/xnA/n4=;
 b=DKA3asJFHvcmXu+snEGo3UQqJvWzcFWhedjdj5dWZSob9Wr8NkuR/q/PZ3SFefMu3a
 RRr0ZajcFvQiXCRtfktnq59IGjeLoBS5H4fzyBT645eVEK7L/tSavdbp3ZSBVMUDTl/i
 qZwK8FYzqn+K+fk4cCdpUa/DPkZEkHgWVSQxuPE3tNBZptZktxdE5QoNFAoTPF590m1f
 INPo2+QtxTIan9G/Qn9DKnl1vFtdVeTIGuEwTHmo7rbZKjqeGdfOZTyZV43TIDDjadeM
 Tm0X8P5FD5jgvd44SldzTL0wjYIys57OE7XuEwBRfHP4Q+chrDX7Z6M9yPY/Q5V0F+Y1
 mvWQ==
X-Gm-Message-State: ACrzQf24OCD7yBxR1uRRkgKKPAg4pLWQyINV/NyL1jjAXafpsfW1EXJj
 RJIE/obpeGbsMabZdxnqOe1JpUYB3FbWiTty
X-Received: by 2002:a17:902:e5cb:b0:187:2d8c:a4fa with SMTP id
 u11-20020a170902e5cb00b001872d8ca4famr4244426plf.151.1667264424843; 
 Mon, 31 Oct 2022 18:00:24 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.18.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 18:00:24 -0700 (PDT)
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
Subject: [PATCH v7 15/17] hw/vfio/pci: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 09:58:57 +0900
Message-Id: <20221101005859.4198-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: U9uJSSvqL6Hc

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
index 7ef1044f22..bd639a8fbb 100644
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

