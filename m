Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4307491lfb;
        Tue, 8 Dec 2020 11:47:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOfacrP9KowvdMUEHvMN73FaWdAljaHQ4aRh6voQvtzqR3Ar85907qDZ2x7GVv5LF3T8yM
X-Received: by 2002:a25:c711:: with SMTP id w17mr34069434ybe.132.1607456826558;
        Tue, 08 Dec 2020 11:47:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607456826; cv=none;
        d=google.com; s=arc-20160816;
        b=KVMjGr8et1dxBU21LoHQeXhbR0PvDF1ZCFxvByPqvktA60xDT6UZdHIsjWoxhsUqCl
         wNsMrAcU5MNTwBwr9nzQU41Y0sTFz/glEO9D4Y30sOCpYYBj8DW3IUSapYIpo8+c7kCk
         OJPw8i1YmGoXD7FzyBkVJOY6z7vGZWq24uXgAQaoAUy0RGvZ8bkhzrZLRzX+hjGLyrQr
         +0/afpTBgdYN+dx9TIvOISAcnBoPzUSMRerlPd6CSq9JEwFyQxmKG6bJYvpehJ8GYD9N
         NYhdrrNF6tO7qii4q2OCy/M4N/z0JxJx7Ex/h+pCtZUPIlQea6YTiF1/SKSHtCGAcjm6
         ubIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=eNcV8yenr5e4/gQuOd0WGDeItExL2HtrnjnsPaPv3a0=;
        b=E5zQeWFMLPRcF5j77yjiysdncmUrTONlDpCPNHXuRpWnqgqZNHUsuXf8bS+mg+ZpIq
         e3lMLHeOw7oSSQDSWAIJlL75k6ZXn613AGPLI/xxjHR8qi0DGqdMZMAaZu9rRAJii0Sa
         s/PtyY/7uzUFqMl3FRcmSDvPYiUS5z5zPF3HLpWVIVN16z2dAtiuMKx1ixYw1y0mPDEc
         FdPBoyfK0w0w5kpGUi95TxzjyxayMZZMGJXnIIQn5oGgpQAodV6FPZZZvpwq8AmQpYoF
         A9TM43PY3eDegxueD37n0ybs4+QQh355uvjOam8ZmdQ/2o4raUU/5aNYO6yi/CqJJVJa
         vEeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="U6gz+N/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si11710874ybp.242.2020.12.08.11.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 11:47:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="U6gz+N/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmiwz-00073F-T0
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 14:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikd-00054i-Vn
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 14:34:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikb-0004os-HF
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 14:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eNcV8yenr5e4/gQuOd0WGDeItExL2HtrnjnsPaPv3a0=;
 b=U6gz+N/Dy/kMqnHA81ApjiXMlmgsjFt7Ccj3D4YyaIj+/fWK/SgfQsMug7AK0575mOgCaJ
 ote8i0lB1nBQ483DGJ9Ci9Y+x37zpkcdcsJ5e/agDjVfTGVPezcCM06tz4ALux9yhYxGCb
 8me3yopKYCxhlVCcs6moS9DNS+ELblY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-ZbRGyI7dPGiJwXFt_UOVFQ-1; Tue, 08 Dec 2020 14:34:14 -0500
X-MC-Unique: ZbRGyI7dPGiJwXFt_UOVFQ-1
Received: by mail-wm1-f72.google.com with SMTP id a134so693653wmd.8
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 11:34:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eNcV8yenr5e4/gQuOd0WGDeItExL2HtrnjnsPaPv3a0=;
 b=sQ2bMKB/nCWgdRnxHnEKEUIoB+s0qmGvy0pBiKj7thT6nz6q5nzCPDWNG4q7rHD84d
 74dXhj5E8ONBucqTROTHqA+7eNdDIshxB30/Yvgdpnl+zElgJ70Ihbsa4gKHD6dK/tNj
 B4vmotC78QF0YE/XP3OYHFgFyBThtjv/R7pj/7hfpw03QxghUDwcB0kOJuOGZRowrQCT
 aVfBPDmZhyGIDcECT572VisAgPUR+O2rm03hnl9S2MPWDWSCKtdKeQpe65ltfVoSu4Fe
 gjvWYVE7u7LPWw8xGGQtbXz1Y/jLJZremdgUZQAwiOv/VOVLdkw1B2ojvbGIUpcp7j5G
 ykYA==
X-Gm-Message-State: AOAM531uCure8JHxTcIf7aXZrAIISTIOgGnqFI6R1X+qgA4gDCaFYe/f
 Gmj6nKBpeXegqtFhAARP0WDCExGDKdv5rQJD0mF8HrXrLK+6U9De6UPPwY9k7EWn1zl6oftSd9P
 7BrHD1/53fQrY
X-Received: by 2002:adf:e60e:: with SMTP id p14mr26033937wrm.188.1607456053188; 
 Tue, 08 Dec 2020 11:34:13 -0800 (PST)
X-Received: by 2002:adf:e60e:: with SMTP id p14mr26033926wrm.188.1607456053005; 
 Tue, 08 Dec 2020 11:34:13 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id o83sm4910349wme.21.2020.12.08.11.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:12 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/66] hw/arm/virt: Write extra pci roots into fw_cfg
Message-ID: <20201208193307.646726-11-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 qemu-arm@nongnu.org, Yubo Miao <miaoyubo@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pzt3EAF+TpCQ

From: Jiahui Cen <cenjiahui@huawei.com>

Add bus property to virt machine for primary PCI root bus and use it to add
extra pci roots behind it.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
Message-Id: <20201119014841.7298-4-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/arm/virt.h | 1 +
 hw/arm/virt.c         | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index aad6d69841..abf54fab49 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -163,6 +163,7 @@ struct VirtMachineState {
     DeviceState *gic;
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
+    PCIBus *bus;
 };
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 27dbeb549e..847257aa5c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1289,7 +1289,8 @@ static void create_pcie(VirtMachineState *vms)
     }
 
     pci = PCI_HOST_BRIDGE(dev);
-    if (pci->bus) {
+    vms->bus = pci->bus;
+    if (vms->bus) {
         for (i = 0; i < nb_nics; i++) {
             NICInfo *nd = &nd_table[i];
 
@@ -1346,7 +1347,7 @@ static void create_pcie(VirtMachineState *vms)
 
         switch (vms->iommu) {
         case VIRT_IOMMU_SMMUV3:
-            create_smmu(vms, pci->bus);
+            create_smmu(vms, vms->bus);
             qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
                                    0x0, vms->iommu_phandle, 0x0, 0x10000);
             break;
@@ -1481,6 +1482,8 @@ void virt_machine_done(Notifier *notifier, void *data)
         exit(1);
     }
 
+    fw_cfg_add_extra_pci_roots(vms->bus, vms->fw_cfg);
+
     virt_acpi_setup(vms);
     virt_build_smbios(vms);
 }
-- 
MST

