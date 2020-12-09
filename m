Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5185842lfb;
        Wed, 9 Dec 2020 10:24:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxapUASRW77m6t+wW/30Afgl3998hPhyiSK3xNgNJi83ioQhi2154dNwoEp47Wuvm4fy45F
X-Received: by 2002:a5b:3d2:: with SMTP id t18mr5290214ybp.474.1607538287822;
        Wed, 09 Dec 2020 10:24:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607538287; cv=none;
        d=google.com; s=arc-20160816;
        b=d0c5JnHGEibsQos9bizC/NTJURXypGyR/SWaaWsq3bpCKjkeeYfIXaHqaefW7klWCA
         Ihz+Vu1GCkZcfoMh0zANqOBSQ53dK0oFv9pcSiWSN/JAa6gONCQ8h5V4oT0EVJm5ZUkH
         gz35pw3Q/HwVQPnV3Vet1xMonr7tctkvfECIR0M1BysO5rKQ7C6zAiWrHxPrvVSxAu9s
         Am0C8o1Gd42oNVU5ewEKHhbXZ5tx8gNlj1EiOs6ofneYuUHkWUPXQ4gTz0meFsFn8bVe
         LaB+G3gZtlWQYkQYZtDIdRBmt3012BJ6RmlEGzZ/FkgtGPYYk72McheI7MuSgfCLaTRF
         J1YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=eNcV8yenr5e4/gQuOd0WGDeItExL2HtrnjnsPaPv3a0=;
        b=acp36jlGKLWs9/RmnWJu6mKfjmSDnhXeNZCta9jrhoh/ATvU4pCjY3THzObBfe4f0P
         6OH7vA5Agp8qYKLFiwl4/BeU3T83Y3QmMKgchPxohuw3cdef1tl4J/wORc9dJEnITA7G
         8/rC3P/Z4Fwfz0WPKTu40LXQvWWgGFCwvCTscDDXqQlTwDDjfSH3XaCH5/4WEYiz9zb6
         PGlX7pTSNq9l1156yWk27z37mg4IQtFt4eva81jI8zyt3f1prIBaKk1CTvGNGQY6AT4q
         HH3e0Mwo+QbDfyekqgua3C2bl682iDZPxy1oCvZHA2sE97EwOYpYuaF5BrMUEE3DUvCR
         lYew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CKedmBXu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o83si2714231ybc.486.2020.12.09.10.24.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Dec 2020 10:24:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CKedmBXu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kn48t-00089y-6B
	for alex.bennee@linaro.org; Wed, 09 Dec 2020 13:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sL-0001tJ-KN
 for qemu-arm@nongnu.org; Wed, 09 Dec 2020 13:07:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sI-0007sF-EU
 for qemu-arm@nongnu.org; Wed, 09 Dec 2020 13:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eNcV8yenr5e4/gQuOd0WGDeItExL2HtrnjnsPaPv3a0=;
 b=CKedmBXugKdjUAcOGwpg8pW5qEAFOTL7s9vRvif/TqTQH+9UUHlmz1EgNNGxzTksFKbz5N
 feHkm5I0crIytm5EGE2Dr1dq0XS0Q7iQtoyXMC9IZsc9VHxEgOdyTbwhC+9MU2DtyLsGgE
 a+lAEkxWgReY6Bj9iBb4x6Bq07rv9FA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-XqJlSY7_Mf6a9HWNjHARow-1; Wed, 09 Dec 2020 13:07:35 -0500
X-MC-Unique: XqJlSY7_Mf6a9HWNjHARow-1
Received: by mail-wr1-f70.google.com with SMTP id i4so943717wrm.21
 for <qemu-arm@nongnu.org>; Wed, 09 Dec 2020 10:07:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eNcV8yenr5e4/gQuOd0WGDeItExL2HtrnjnsPaPv3a0=;
 b=rylJ6h04Z4XAeFYPH2OE0RtCCsTmFTdDnP7+9C0Y/UGy9WonUWVNG8vxcf+vBPqi3c
 Wa8ufQGtEbINNlGR7gYuJik+6yTkL+qy8OsgPfEMebLLRdB73jOJjkxjcrxkl8pOBLwM
 LpUEXezNFjDZFU0++CHta4eaQCbrycsYzZStC5R348o0GceLDcdjYGw0QWaPlJ5ihNys
 9H/rtJligHySY1RW3Xp2DbSTrTAQbGgdpTeh0lo5KhQaD2tM6C6e31oGbirfCkfUtrko
 urYCyC7b00TTb1fryhcM9KUBzYsHu1vSPOn+jyFowqX5kdxnOsJGHql/weE4agcTLNJz
 OGaw==
X-Gm-Message-State: AOAM530uSToDnw1/y2Iv52xsKHZqiKFGOy4LSqghJ392vk8FyeBLJoH0
 3NVJw0OPzTWfHQxXuQ36WdYP1+KyXDuBSSMVVjnAzVVDOZ/OKJcDOX8Kgt9J0MZ5n2JXIcVvSXy
 PTAZiI6Swo1RZ
X-Received: by 2002:a7b:c182:: with SMTP id y2mr4041421wmi.57.1607537253523;
 Wed, 09 Dec 2020 10:07:33 -0800 (PST)
X-Received: by 2002:a7b:c182:: with SMTP id y2mr4041407wmi.57.1607537253397;
 Wed, 09 Dec 2020 10:07:33 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id z17sm4488154wrh.88.2020.12.09.10.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:07:32 -0800 (PST)
Date: Wed, 9 Dec 2020 13:07:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/65] hw/arm/virt: Write extra pci roots into fw_cfg
Message-ID: <20201209180546.721296-11-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wxqqNonXJ9ju

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

