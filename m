Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1206235ejn;
        Fri, 28 Oct 2022 05:35:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM71dAJ0h0b9a3p/adqykq4CuerJphAfFr3T/4OmGlGoCou7jwp7bBIn+bRancVEDjJkkKhn
X-Received: by 2002:ad4:5ecd:0:b0:4b7:c95c:2c0c with SMTP id jm13-20020ad45ecd000000b004b7c95c2c0cmr37169907qvb.60.1666960502468;
        Fri, 28 Oct 2022 05:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666960502; cv=none;
        d=google.com; s=arc-20160816;
        b=Iu7Hecf31eZ00Mlr8/rRPT0G4A5CaV0kZDsHEu1usTl69LvGddiDlhocQxQ65p4O0Y
         X8aCOzxDRTfeseFMPyKIhklBjMfhvLWppSnJ9J2yDETIARMU2khoPUouLvKupr1t5hy5
         M0LKzFXQZJBraxet+8d0C2IpzdT4TY/N9EogHuSC/Lt/TZA6urkrk+uvOZZKLMjzj0qg
         fh5hAB4d3blc232+g0jsFAYtR7fVoZNFcq3rLHDg3e5tZ6jsJ86akGemyEK32CFXAH2h
         iaQLojZGnfUnGhzvTiyA9Ah7+psWPCfoQdHcRYDWupjJcrDwNiwfGhJ/n17T9u/iB1mQ
         ZMMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EVokE4R9Xx9n+WSbmmY8Tccb41N3IfXDM+3TW4qLs/Q=;
        b=XthZ6Ev+GqwdvzDrxjPN/zv+wA8IMm/p9VE81ClQfBZrCVtGi+BeSB1BMt13ktPQ/h
         f2j7XPKEUEH1mWnhXVF8fvBaIrMaiWjeAkPOEFmP0uMVih0ZRjYu7qZcIH6ETCVZVkLC
         5i2Ezco4o3lJoVgE51ABAsvJFQV4RQcFIveqUY4RQGwzkpLGjndJsEnhEKqrOB8MEVCs
         6d4bq2i+gqn2nG7RpF9NwNt1ha6lK7uwcqxyyBnnk/01Q695T2ugRZRUGN6gjr+QLdlM
         Sg2WH/RQEU6a8/lJx6KXlw9604qDfVKnX1+rn//nt7I1lroy2tjoc6J6GvR1kMoHFjjS
         oCmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=48ImfAtY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15-20020ac8738f000000b0039cd019d35asi2566072qtp.537.2022.10.28.05.35.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 05:35:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=48ImfAtY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooOZf-00015U-QH; Fri, 28 Oct 2022 08:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOTJ-0004Kh-3S
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 08:28:26 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOTE-0003a7-Vt
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 08:28:23 -0400
Received: by mail-pg1-x536.google.com with SMTP id h2so4708440pgp.4
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 05:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EVokE4R9Xx9n+WSbmmY8Tccb41N3IfXDM+3TW4qLs/Q=;
 b=48ImfAtY+siUX8xbNY7x+LHZA0vI7iGyF/dqXmRCvdK1XHHQE7t/4eUJ0rHjYzXySf
 0ZP0FAjgCNglPs7aaIodc1ovTmwTD7rxlQ2tC4v1+ZGjbfHoOVTHZDBu3WYvTwqEOawc
 ve1qWMFM1q7A0NJSTmFDdeTs0JIjQDCxYmxLXJgCWuCw5zJXhEkRXVl4+1kM7RGVNj5b
 xhb36ztJP/K4fZbOzUvFli0u+sut7zvhlMyJ7jnd2Ld0/SJTDtlsC8Yl2v5zQF4naNT8
 9T9GwBPotxkBJTZTi1Q2NwcDc90UmpFGjqSACVOfTJejQREu3xtO2mfwOKJ7f56oPE7I
 PhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EVokE4R9Xx9n+WSbmmY8Tccb41N3IfXDM+3TW4qLs/Q=;
 b=Dg3IUwbdJV0XZiHoVJ9oJITrJhIlQTwCI5GsqkdLNhuCRPKbW09zRs5HkQaT0Rxlr8
 HREdaccjM/nvw71oWCxAQ76+QbfIAlSjQTDyu0yokwVNJp4FCBR0Ir/ImXOa48P4hGYq
 HIz6WVLAgSWVK+JnvaALcissXu6bPKXxf5O36kwFVgt13CTiaqsRMkFOt6OHjXbvKe9c
 Re7KwLgskWIHu9d9GRq3nu2T97Oa8Ekuyd08l4rCFmeYZHPRbuvpv+hOaMD2K1zCfHCK
 QLnNH93Cg5DYJbA14y0vYHwlQxDwvjEsRM3QsG8hIfNWxd1eYcMja2XGXrlmjiw3XlPj
 d9bg==
X-Gm-Message-State: ACrzQf3GO5CA6yTk0Ru5tFQkSFabY77rw3Y9bVStqj+OF1MVc1UxlCrA
 mmlkduc8ZDgK0/S6SgdJ8yyunxnmGQGIvq5+
X-Received: by 2002:a17:903:2014:b0:186:8937:28a6 with SMTP id
 s20-20020a170903201400b00186893728a6mr33205089pla.39.1666960079705; 
 Fri, 28 Oct 2022 05:27:59 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:27:59 -0700 (PDT)
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
Subject: [PATCH v5 15/17] hw/vfio/pci: Omit errp for pci_add_capability
Date: Fri, 28 Oct 2022 21:26:27 +0900
Message-Id: <20221028122629.3269-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028122629.3269-1-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::536;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x536.google.com
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
X-TUID: AKdQ/Qaz54/H

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
index 36c8f3dc85..d043289f78 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1845,7 +1845,7 @@ static void vfio_add_emulated_long(VFIOPCIDevice *vdev, int pos,
     vfio_set_long_bits(vdev->emulated_config_bits + pos, mask, mask);
 }
 
-static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, int pos, uint8_t size,
+static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, uint8_t pos, uint8_t size,
                                Error **errp)
 {
     uint16_t flags;
@@ -1962,11 +1962,7 @@ static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, int pos, uint8_t size,
                                1, PCI_EXP_FLAGS_VERS);
     }
 
-    pos = pci_add_capability(&vdev->pdev, PCI_CAP_ID_EXP, pos, size,
-                             errp);
-    if (pos < 0) {
-        return pos;
-    }
+    pos = pci_add_capability(&vdev->pdev, PCI_CAP_ID_EXP, pos, size);
 
     vdev->pdev.exp.exp_cap = pos;
 
@@ -2082,14 +2078,14 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
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
2.37.3

