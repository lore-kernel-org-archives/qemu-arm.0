Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp933025ejc;
        Mon, 31 Oct 2022 05:38:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Jn+42fxH1a0meNLZEW9cxzl5TSNYQoRBCrsGI6COMs/0fpsBNgIwKzq3c4XuC09zmuBQE
X-Received: by 2002:a05:620a:f06:b0:6f6:4a82:171 with SMTP id v6-20020a05620a0f0600b006f64a820171mr8992529qkl.357.1667219926884;
        Mon, 31 Oct 2022 05:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667219926; cv=none;
        d=google.com; s=arc-20160816;
        b=KSXGstLmGEGcwwmm6KTeDUoxk98caS/fdyIYr4/NPQVvQKoxlgJx1xcMsPO1YAWxMf
         /t/O7hLLZ3IJ4pbkG+wK3YcfFx3NLV2aDXVScHKV07quIAT8NbWjY6Y336/MKTG4PfsH
         IyHfdU9txsPZRNPFI6bwBnGHVeYc3Uiem8l22PtQo2f5YMSPj9CSbs9Nrd0HfMC1FzVU
         N1PHlYPisiZaPWIRtaJP78Whtzi+ZOrerRaNLXLkl4TaImk1O4GjpPV1mpOy5RmCc6VU
         ZyonYab8zTtKPmQnFpTwwVbCdDIPU+fqOMQ8DZ+EupTcAUdBRIwzNX6qEz+Y4vcUh+xQ
         lyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=X6IxClWqWb6CZpSBnvYuO1So2GK7x/G/Cu2kKWY3Y/g=;
        b=g0KbayrVq+IkGbENzRuwmj2qUJwsK6t30srqHJZM9eXXx3jhW85wrvKtcDPZAbgcyV
         heV4zsOP+nZRLkU1sBDG72/lvwg2iqCe5wjkIvl5axKDu+2nixY1iDpwUcKtsQXnosJ5
         SiHyb4x05SbpWyQNHGblIXHl7bwNAAz3nNv/kU1CVoNKZLoEKb0VIsxVE9fBPH/ZTBb5
         LNfjyNPMgJuj06ZAWvj3pjpgmb4WJ6kFwQe3k6+2p7PsZCSFH8rLyjZBGqVRNY2nR+O/
         XsD2ER5FOCv0QFSA6Ri7/7IaNRxIN1p9yLeP8tN7ju8fm91nPcwQ5zoBUG4BRS8bt6vS
         hxdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=m3p4+wzC;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21-20020a05620a249500b006ced0d02b95si3817415qkn.72.2022.10.31.05.38.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:38:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=m3p4+wzC;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opU1F-0007KG-JD; Mon, 31 Oct 2022 08:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opU0O-00057Q-Ku
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:35:04 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opU08-0004Qf-6i
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:35:04 -0400
Received: by mail-pg1-x535.google.com with SMTP id r18so10547687pgr.12
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X6IxClWqWb6CZpSBnvYuO1So2GK7x/G/Cu2kKWY3Y/g=;
 b=m3p4+wzCN51/W4ls7oV3xOsRrjPaftqnO6iji8OLULaXW+zLyffD7DMS3REv8Ah/ga
 CukiG6bMVfh+gVP16RhaHKr6p99/DktpbbncepksWBB2Xn/54gZVZ6OIwmehe9iS3jDK
 ekNJ3XpXQ+0tLkJW/nyaDJTEsenYIg+LhOeooBOrAnGt3PRls/wLZOC6h0A7N3P6q8t6
 1yVluRhC8cEbCfes43hWKqxAmBWH9+SacvTyRzbHliTazCvUphp8t8v9tf47o8R0c1C/
 eQiJlXahUlsxYgi41aXmBefv25kKaDWGVNwXeiDW7Olq0rtOMsj7zHZTVyQ18zP5eeBQ
 UzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X6IxClWqWb6CZpSBnvYuO1So2GK7x/G/Cu2kKWY3Y/g=;
 b=FWwKevce8Rm573z2HcU3jtMHaknQzn30rpP8UMTSAD8Vzzo9r/p4B2zzSzuMVSQzXs
 D8ML9MNjANDNV1nGT7nxHIqDaQeOUKUZQhde9xUhtRTUfMJYbgUaI/ES1GWffVEgPehK
 jCT3gyfiLcRHbcJzFXKJVRgBDLTccMlIV0COkFpkv6qgYrlFnTCzsh2iTOzuPGkrR/xV
 795PWG0rzRb3YBMsLsy9a66/6vmXhVnBIdRVlfaOnubMwPExn5VzKNohCw2fFtIw9sxZ
 BVhwIsA4JLkF2MjzzU0F1c26Hl51ycAoRBdPRgwMCQDA7lRt7Rq8y+ipvcE858X02xdd
 hq2A==
X-Gm-Message-State: ACrzQf0CwXQCdk5OEqLtK/uI9tC9BKNOZ0C68biLBGsR8Fnz7KET0pzm
 AxidH/Dnf3zaJ+gYwKC0VAZYX7p8Vjr7yTl5
X-Received: by 2002:a63:5f54:0:b0:462:1149:f3b3 with SMTP id
 t81-20020a635f54000000b004621149f3b3mr12364519pgb.445.1667219687133; 
 Mon, 31 Oct 2022 05:34:47 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a6545ca000000b0042b5095b7b4sm4093810pgr.5.2022.10.31.05.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:34:46 -0700 (PDT)
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
Subject: [PATCH v6 15/17] hw/vfio/pci: Omit errp for pci_add_capability
Date: Mon, 31 Oct 2022 21:33:17 +0900
Message-Id: <20221031123319.21532-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031123319.21532-1-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::535;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-TUID: 4Adf0yKfwRQd

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
index c7e3ef95a7..cad5850f5e 100644
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
 
@@ -2080,14 +2076,14 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
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

