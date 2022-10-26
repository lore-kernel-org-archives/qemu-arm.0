Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp829924ejn;
        Wed, 26 Oct 2022 13:23:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM60dCVy2jypyyOmECExNWd8QX/W5iyacTmgaBx+bhg6+B/XzUyWZNlQ/beo0ReanNtuQVip
X-Received: by 2002:a37:be07:0:b0:6ee:d079:ce00 with SMTP id o7-20020a37be07000000b006eed079ce00mr31711456qkf.525.1666815826845;
        Wed, 26 Oct 2022 13:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666815826; cv=none;
        d=google.com; s=arc-20160816;
        b=DfnW8smFO5Sx1cj8yIzt9j/sPWr04BaEpM3rRVG1kYneLsQYUF+sFuhxGWUktStRcA
         d/SHvd0wAjhD4RsRD+5w0H/X9mBp8/VXa9hm1envgZz76tjYT5j//FXTFS9jFGsivvA+
         5ilWpj9XgBxoU1/VWRBDhCNL+QDzPGZXLBRwDAj0nNWcuRQq6118Fc4qZw5lRRVZnE2+
         Xa4crseBzj/R4Bzjtt8XigTfNreONbzL7Y/D2wiywwRECv/osPVfmGomT7RioqzIBfh/
         bdbIoyu3DJTra2t8+IZa8aNItTQNTZG9TIuoQSXnRTUffDoAgeal5el91M9aoyzEOa3k
         XKSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uZ+rbtMJHioQ9msZsjYArFAk2F7yFVCrTnD/IAdjoug=;
        b=RRvdevLowQ0Zvpm1ksJhT2rEesuoyXeWOisydFs6KC+mEcWbWoqx5lutU5W7z1LWhb
         cc4umr7TBiD71aIMzptmuoZbWVW+UP3GulzHodAm/kFFdDA/HcnNV623KW/viSbQLVRY
         XN1KC5d4+MkQB7i17Qt8ob/XJwbKxs2XpYOTtB2BixCB9EXibEagVc/mDLB8wEw2RPjz
         wt/dlqairUkgeryHHOFNENhNDDRRDGySQd4OjkS76LNvCS0ko3//mOst4XzXHWuSgGda
         keGxHrd4fdZjtyv3fu5rJJ9u6VZyZj+rSsgze/Ircds07MIH1bHszbPZp2Lh3MZ2Bj7h
         +vHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=zqvt772H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gh4-20020a05621429c400b004bb9e59d7e0si401627qvb.586.2022.10.26.13.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 13:23:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=zqvt772H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmqd-0003P5-Ka; Wed, 26 Oct 2022 16:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmpd-0001y2-Rw
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:16:59 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmpa-0003Kh-S0
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:16:57 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 d13-20020a17090a3b0d00b00213519dfe4aso3252188pjc.2
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uZ+rbtMJHioQ9msZsjYArFAk2F7yFVCrTnD/IAdjoug=;
 b=zqvt772HiKf9DvnOyMFznUjuBDA7I+zzIHvXslbPRzBEsCyNancK0mTZKKN13fxn2u
 lH/YxWaUXuf0jZRyWjWIAfAB2HeKRFPwQ9JlFdENuxB+UPKu39AXDAbyWo2ZSF6yLaT6
 BR4JSNYxIbIWQKUir1wbkTEan92rXGuZP2V99Ni9PEhcqm1EqvnI3d2l3McMdqWLJHWW
 ++ytVQxcR5hxQBMXVnF/BSGshe68EIE+vM/0aQ01OVrM5a9YDOOc3/rgUT0omfH8nmh3
 kbWp91kiHDmV15LAz80oFKbFI4igTUc9DYxkNBVH+Mnc/N29wySHRDHtFYe1bteJaWI7
 NjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uZ+rbtMJHioQ9msZsjYArFAk2F7yFVCrTnD/IAdjoug=;
 b=cCltSuDanhQbtUxiXkIAlbZgSEFAnkFhyQ2mc3yvHMvMkLfInGxG07P2jacwl1a5Kb
 h5k34VWmwl3qmgFjMKj77bL18rMCXLfZOpr1tPIHlgkofHa45Mb4W77K6V/ZCkM8bthy
 QtDRHd0sfa1/uwX7H5VUtCFWWvorxcDMpFHcUCCc+KiYDIoCk4XemISvPHEmW/3JZtJE
 n7o2YNSeL13DY/2uJ8TnCujGFDf0VTMljzY47LwIjhzFOu6jkTxN+IQInV01ys4qXnmg
 UvJQ5bNx5cjHtWUBfUlxwOAR+JWzFALkWVc/3FrpabSCV90eoAHxyuPQ662WSCh0NNuG
 kyBg==
X-Gm-Message-State: ACrzQf1alMatbTYofqbuICeqSN1+68EvSWwO8e5J/d+49NoZMRToyqUe
 4y5uGvFvtPbhFi3g2UPjqBM/1A==
X-Received: by 2002:a17:90a:9902:b0:213:1122:feb9 with SMTP id
 b2-20020a17090a990200b002131122feb9mr5989086pjp.58.1666815412574; 
 Wed, 26 Oct 2022 13:16:52 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b00541c68a0689sm3375770pfr.7.2022.10.26.13.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:16:52 -0700 (PDT)
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
Subject: [PATCH v3 14/16] hw/vfio/pci: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 05:15:25 +0900
Message-Id: <20221026201527.24063-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026201527.24063-1-akihiko.odaki@daynix.com>
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
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
X-TUID: T9YPtVAFyFM8

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
index 939dcc3d4a..2b653d01e3 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1826,7 +1826,7 @@ static void vfio_add_emulated_long(VFIOPCIDevice *vdev, int pos,
     vfio_set_long_bits(vdev->emulated_config_bits + pos, mask, mask);
 }
 
-static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, int pos, uint8_t size,
+static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, uint8_t pos, uint8_t size,
                                Error **errp)
 {
     uint16_t flags;
@@ -1943,11 +1943,7 @@ static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, int pos, uint8_t size,
                                1, PCI_EXP_FLAGS_VERS);
     }
 
-    pos = pci_add_capability(&vdev->pdev, PCI_CAP_ID_EXP, pos, size,
-                             errp);
-    if (pos < 0) {
-        return pos;
-    }
+    pos = pci_add_capability(&vdev->pdev, PCI_CAP_ID_EXP, pos, size);
 
     vdev->pdev.exp.exp_cap = pos;
 
@@ -2045,14 +2041,14 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
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

