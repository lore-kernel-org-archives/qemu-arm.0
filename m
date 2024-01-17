Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp1392310ejf;
        Wed, 17 Jan 2024 00:05:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKfAzQB2J/Cz/Ko3ifaRIuJd9wRKamsKXGyzyYrT3OuSb119Sge34DzV2UfI7mI8S61HLx
X-Received: by 2002:a05:620a:4904:b0:783:3388:cd46 with SMTP id vy4-20020a05620a490400b007833388cd46mr9977672qkn.82.1705478745302;
        Wed, 17 Jan 2024 00:05:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705478745; cv=none;
        d=google.com; s=arc-20160816;
        b=OhNgcAJ1ET9qmOByb1klaDXKH8q4HB1mmynCo2ff8diC4NY//dGGejhi074An3pMAm
         J4vi09w9rOaFTc+W4cU9fxS3WHtXkhHy5fNrBviqb0/ecWTGXqVvQXD3aZl6cuWmwCIv
         MbsEOPRT0qLARNrkynPVfEOnT/jzY/B9ifbLQn+HaLYyEwleZjtjxMgOZMErIlQUc0qv
         N3BLbZaRGEAsRfk+s+XAOZKU+IF2i4+NeDQ8Exvt8Uz1Qi7SfImlJQk69Et+Wwuss5rN
         rjBrhhPZr/o27D4akVdZ98a11NQ19e9jtgLKzhKafOL2KhGYYM8fn0Y36fFSIeWMhnjI
         5rHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XLDP4eW2xkgtMCC/IcVRlbka3/PL5Xups7xg3OV5U4E=;
        fh=E3c4Lx6w2odu/6SlG6b7ImsRAg1mlDohYwN4BQaBgGo=;
        b=Gb+tNHucvHGC+J4nS7AqwPDMLAE5iyL/tGecYVUAXAnOSxmuvGsP7hYj7F3YFJ/kVE
         UCZ7sfMkrafA+rPyj/adDsuVrTXgAVEWevxsL5bowRTxukn3ONmaxyYQrBUF3T2QmmDZ
         Gbw2L1l8er6Ypqt+XberR8Ih8vTSCqPhH16/NNiu5/PIs6V5TEPkyUSYGcJKTHz6yzpn
         roptL87DhkmZ979DR5CZTLY/LzB9c+mwrTV3wiam2E3yi3/1ujpX15xRfjOKj2F0vsVZ
         EvQ5UrsOgvI5Kf+TJJgIM/kXiC01+Srqz7Tlx2V+otnr0wcAKCahMrpHL1a9EEh0SPSn
         qxTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cd8r+6vv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17-20020a37e111000000b007832de14c10si11231944qkm.585.2024.01.17.00.05.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jan 2024 00:05:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cd8r+6vv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQ0uf-0002AG-Kp; Wed, 17 Jan 2024 03:04:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rQ0ud-00028p-3D
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:04:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rQ0ub-00033L-Ce
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705478675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLDP4eW2xkgtMCC/IcVRlbka3/PL5Xups7xg3OV5U4E=;
 b=Cd8r+6vvNQaZJysk8l3CGjnGKxDp6sb2xp9Bs+xWjS84GJMFNUgqbajsAYoWtkQgz8r0oP
 xKwIWDrKaoByYpfcaAWoWrnj8c6V6oF03pASXl6HgwjuJSdkpCAzPqk/cxtPqXc6OMxOtN
 Yghv8HUnfAttuEM1QzdkzFFMBQueYkU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-3QDMzPqQNkGZ5z8l9WGP9Q-1; Wed, 17 Jan 2024 03:04:30 -0500
X-MC-Unique: 3QDMzPqQNkGZ5z8l9WGP9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 073481064D7F;
 Wed, 17 Jan 2024 08:04:30 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B8301BDB0;
 Wed, 17 Jan 2024 08:04:27 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, alex.williamson@redhat.com,
 peter.maydell@linaro.org, zhenzhong.duan@intel.com, peterx@redhat.com,
 yanghliu@redhat.com, pbonzini@redhat.com
Cc: mst@redhat.com,
	clg@redhat.com
Subject: [RFC 2/7] hw/pci: Introduce pci_device_iommu_bus
Date: Wed, 17 Jan 2024 09:02:06 +0100
Message-ID: <20240117080414.316890-3-eric.auger@redhat.com>
In-Reply-To: <20240117080414.316890-1-eric.auger@redhat.com>
References: <20240117080414.316890-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.806,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: M6xyLdn9WSP+

This helper will allow subsequent patches to retrieve the IOMMU bus
and call its associated PCIIOMMUOps callbacks.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/pci/pci.h |  1 +
 hw/pci/pci.c         | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 63c018b35a..649b327f9f 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -403,6 +403,7 @@ typedef struct PCIIOMMUOps {
 } PCIIOMMUOps;
 
 AddressSpace *pci_device_iommu_address_space(PCIDevice *dev);
+PCIBus *pci_device_iommu_bus(PCIDevice *dev);
 
 /**
  * pci_setup_iommu: Initialize specific IOMMU handlers for a PCIBus
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 76080af580..5bf07662fe 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2672,6 +2672,22 @@ static void pci_device_class_base_init(ObjectClass *klass, void *data)
     }
 }
 
+PCIBus *pci_device_iommu_bus(PCIDevice *dev)
+{
+    PCIBus *bus = pci_get_bus(dev);
+    PCIBus *iommu_bus = bus;
+
+    while (iommu_bus && !iommu_bus->iommu_ops && iommu_bus->parent_dev) {
+        PCIBus *parent_bus = pci_get_bus(iommu_bus->parent_dev);
+
+        iommu_bus = parent_bus;
+    }
+    if (pci_bus_bypass_iommu(bus)) {
+        return NULL;
+    }
+    return iommu_bus;
+}
+
 AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
 {
     PCIBus *bus = pci_get_bus(dev);
-- 
2.41.0

