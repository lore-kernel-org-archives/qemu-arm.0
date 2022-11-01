Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2049825ejc;
        Tue, 1 Nov 2022 10:26:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ZW0dl1RK3cnEAf73gZkg53KGhFut/TTKxHQNSmGqsH1i7piKmzuxCXfAUWocWHyvxBN3W
X-Received: by 2002:ac8:5751:0:b0:39c:b848:198f with SMTP id 17-20020ac85751000000b0039cb848198fmr15726422qtx.429.1667323612273;
        Tue, 01 Nov 2022 10:26:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667323612; cv=none;
        d=google.com; s=arc-20160816;
        b=mEaG06mGMeqs+dafHfNmDcGd/k55HhjqW+ieFiuXveb5jvMq1WHFnoa2DHh7zE12SM
         ym1X390U6qv1IEEMN76k1QU4Pq96N/fXY3da6JKr3DrOm5MZlf73AcBdkFPeXG+QOMaI
         EHuXuhlI5Pflh+UVo4k4VLMOnMEScH+y5K18e3DGZkNjniJSj6kupDgSUv3DR+D10OIo
         srqzw5Gi+0/j4eA2cHyBhXWOyUFS7uNhD4ts0io7UpV4pHxGfRFP1UKR1AXhX4IpvwAD
         N/LZe9nrO1PXUM9t97dP1rUf7sYh2w8ADv9uqkAkTFtEUiLnzaOmtx6k1XT1MOZastyZ
         jklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=At8j53igPyPAzDtB1h3pG2XsyNuLgQtuDuAHSF4bzEg=;
        b=eLb7MofLp2L7Jql1g97AAtdJLrEj/BdWMyCi9yBEYDu6Pd9eTBiovBM79lBSN5XNwe
         ZX/w0qhweGVW+E+f8pDrExxDqfCLfuTo4MBzCdlNEi7FR4PL5IXyRNWjFIfC28rqW5s3
         T8Uum8RUdLjyZFr1KYkn1jQBljxTq5iTqbUKj1cFiEl5ixZFFCW3EwxJldbU0J9/gunQ
         dc4UKM0Xr+jzYzGuz4y5tVMW8WJmyZuQKS9DtfxZwwLC3kOooCHkLs9fFi/ZMcGeQQxI
         7FRAjNs9iOixVDEXCSFK28MovCJr91SZ0VNNVeIQ2U8caCQin6hVrZITSHVdZaMJAPRq
         rU4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=5wIunFgw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8-20020ac860c8000000b0039999e2298asi6283595qtm.1.2022.11.01.10.26.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 10:26:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=5wIunFgw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oprnY-00068S-1A; Tue, 01 Nov 2022 09:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprnW-00067f-19
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:59:22 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprnT-0004bj-AB
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:59:21 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y13so13527349pfp.7
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 06:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=At8j53igPyPAzDtB1h3pG2XsyNuLgQtuDuAHSF4bzEg=;
 b=5wIunFgw1eDln8yWuTfJodkEkx/jEVGXuUMChmEHJ/srq5kZMwkUvUPVaYgEoQrVpg
 7uYN+cl1AnRKXh8uhaNFjFL+hBmoKw3BW4us1WEkMyeG+jV5BMXNgU2ZtRJ3kx4ImSJ7
 ZzdK7SkautFqZBSlnhKbjW0jT1DsAcQ8htAqrFKdagoZ3zA33VIGhEAPhOnRHE3AsJAk
 P5pj+/goCCRsvxWkvOBFw1KdQj5LFWWOZU5TCyWHcR1spxLUwkrGPXB134Nr5mza2wMk
 Tetwbzs3kO5PHGmdpokLe7xemJvdhZ72lTu5VV254SudX9+mWzIk+JDT0iGiUZRsoZqR
 u/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=At8j53igPyPAzDtB1h3pG2XsyNuLgQtuDuAHSF4bzEg=;
 b=BRUuW5BwPUpfCFxn+Wh8xWCVM/WNQPCmm2PGxVpNJejMWXMrgMzHRFQWiIheXeZrSQ
 Bq5kdb1HO1GNKzL63PTBa1EfNCV4yq2pbr//g5kA1UGZZpFe09wVfPX4FO9FVo1+A0Ac
 DvY3EqgvAFPHuOX6yr1MfrcvCdXg3/AXvLKZxGjKhVOYSPeuWME1LdoMTSMkjTSzHozl
 X2O+OMA+/w6aiQfEFUpW5VzUJqulpw9gFFZoJctdCcFMPhIqN4ecb497alflqbn2gZIY
 xr0jZcFuEKkdEwYsTFPqWSrgNO10f02nbUeGecgisQVFFBCSjnKgtIxVPKyDwvYIDg/u
 1TCQ==
X-Gm-Message-State: ACrzQf2KYXZJmBwFNZhqVtuk9SbHE7MczGRfzmIa9NHPBSToj0r8/iRD
 9tbPAb9jsEdlsHPUB3jvprwQhw==
X-Received: by 2002:a05:6a00:4c9c:b0:56b:a9bd:ee4f with SMTP id
 eb28-20020a056a004c9c00b0056ba9bdee4fmr20000641pfb.35.1667311158639; 
 Tue, 01 Nov 2022 06:59:18 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:59:18 -0700 (PDT)
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
Subject: [PATCH v8 15/17] hw/vfio/pci: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 22:57:47 +0900
Message-Id: <20221101135749.4477-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42a.google.com
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
X-TUID: Xc3u2BBkVbd1

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

