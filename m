Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3069112lfr;
        Sun, 11 Apr 2021 05:40:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6hDMQvAVpkgUvx/Spcha4QsgQNc9TVH7DuN+JlYLJE0BDGYmcYBpWFTDJFCUe1hLIwZ2A
X-Received: by 2002:a5d:9917:: with SMTP id x23mr18771762iol.22.1618144801432;
        Sun, 11 Apr 2021 05:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618144801; cv=none;
        d=google.com; s=arc-20160816;
        b=PesEqgctJCiGB8dA6rsWkolSrHBMZQzD9R9ZD11WmrBR1qQJnXhk28IyySzjZxc9w1
         MiSQlzOk9CdsU/XyzYmwGQ4FLdIC0c03BJt7DkBZ2LjOeDM6nSPJL5cBeh7MpJAnSUr0
         6beUI3/oEwK2CMTDho+Tp7MJtlZU67ThEjWhevHfAfXUM2kK3FL4p9YUNGvpP4tRbNjA
         QgE3pEdJiQMgLjvHgU2whBOE7V9QE1Y8N66nVdNI4wrmfQKMZzFBxl0G4Fr713l15ZHu
         Z/LwYDEZolDqcUrKTvD+P55vb0QYQ20Rm7HLJEnwGGGFr6OC0E3XoaonwwfRQz3ly4wa
         xu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xTINoGDPWuX2+Nz0S9JVj0aZyPSJcbNIUf+x1Iqhpw8=;
        b=H1P1dojbVf+mSSJE39qDDyk92PiB8b7skmiT/Y1owWwz3s0wDhGVibHNFcsd00lhrm
         FXQqryB1PBy6oQLYWZtGm1wrdHzZSYSzfHOkcl/HqkPaOinL/dL8i/1HxPPTesNMK6dx
         XSHIbpFYvCOGxQlSdXHeqkYSiEI0CZId9VQkz2UK+MnpsxBeLsxZAlecixh/91k7bXwl
         1q5zl1C1RS1oIWKfx3xIH/cAAwDz4A0sglP2DnHSzPWJ6mmX4qRFxHi0lSkJ422zE3Ib
         LnHc33HaBUYuQFqL1Ga+9mMKfi2FYe7a6ojcgCGLFJPzoYtEwDqyn0+y3QRvMArYtsyD
         AdmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aOx2xKcs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si9513209jan.58.2021.04.11.05.40.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Apr 2021 05:40:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aOx2xKcs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVZNg-0002VI-FE
	for alex.bennee@linaro.org; Sun, 11 Apr 2021 08:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYzO-0003ts-8A
 for qemu-arm@nongnu.org; Sun, 11 Apr 2021 08:14:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYzM-0004Oo-KS
 for qemu-arm@nongnu.org; Sun, 11 Apr 2021 08:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xTINoGDPWuX2+Nz0S9JVj0aZyPSJcbNIUf+x1Iqhpw8=;
 b=aOx2xKcsl+/dXVO4DIIQO73sPa8ElT4w9URG3ZCdGzI4AdcYYDlUCfZtX0BGDjfHzcgmDb
 /wzSsG44YLkQJu9swv11P6WjI2Azh2qRA/nFpZb+Lr3kfSROzwuLiLI+VpWAE2KsCp5vIx
 /axxB1ZnNqlWirWrWDV5iuL/E74RtP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-Oc75DSfZMGepu9mcYJvVyQ-1; Sun, 11 Apr 2021 08:14:48 -0400
X-MC-Unique: Oc75DSfZMGepu9mcYJvVyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A5CA8030A1;
 Sun, 11 Apr 2021 12:14:46 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5371110023B2;
 Sun, 11 Apr 2021 12:14:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 28/29] pci: Add return_page_response pci ops
Date: Sun, 11 Apr 2021 14:09:11 +0200
Message-Id: <20210411120912.15770-29-eric.auger@redhat.com>
In-Reply-To: <20210411120912.15770-1-eric.auger@redhat.com>
References: <20210411120912.15770-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6+kCh01TJznH

Add a new PCI operation that allows to return page responses
to registered VFIO devices

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/iommu/iommu.h |  8 ++++++++
 include/hw/pci/pci.h     |  4 ++++
 hw/pci/pci.c             | 16 ++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/include/hw/iommu/iommu.h b/include/hw/iommu/iommu.h
index 12092bda7b..5890f095b1 100644
--- a/include/hw/iommu/iommu.h
+++ b/include/hw/iommu/iommu.h
@@ -24,5 +24,13 @@ typedef struct IOMMUConfig {
           };
 } IOMMUConfig;
 
+typedef struct IOMMUPageResponse {
+    union {
+#ifdef __linux__
+        struct iommu_page_response resp;
+#endif
+          };
+} IOMMUPageResponse;
+
 
 #endif /* QEMU_HW_IOMMU_IOMMU_H */
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 1f73c04975..9bc0919352 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -268,6 +268,8 @@ typedef struct PCIReqIDCache PCIReqIDCache;
 
 struct PCIPASIDOps {
     int (*set_pasid_table)(PCIBus *bus, int32_t devfn, IOMMUConfig *config);
+    int (*return_page_response)(PCIBus *bus, int32_t devfn,
+                                IOMMUPageResponse *resp);
 };
 typedef struct PCIPASIDOps PCIPASIDOps;
 
@@ -501,6 +503,8 @@ void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn, void *opaque);
 void pci_setup_pasid_ops(PCIDevice *dev, PCIPASIDOps *ops);
 bool pci_device_is_pasid_ops_set(PCIBus *bus, int32_t devfn);
 int pci_device_set_pasid_table(PCIBus *bus, int32_t devfn, IOMMUConfig *config);
+int pci_device_return_page_response(PCIBus *bus, int32_t devfn,
+                                    IOMMUPageResponse *resp);
 
 static inline void
 pci_set_byte(uint8_t *config, uint8_t val)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 114855a0ac..18d84ff42e 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2765,6 +2765,22 @@ int pci_device_set_pasid_table(PCIBus *bus, int32_t devfn,
     return -ENOENT;
 }
 
+int pci_device_return_page_response(PCIBus *bus, int32_t devfn,
+                                    IOMMUPageResponse *resp)
+{
+    PCIDevice *dev;
+
+    if (!bus) {
+        return -EINVAL;
+    }
+
+    dev = bus->devices[devfn];
+    if (dev && dev->pasid_ops && dev->pasid_ops->return_page_response) {
+        return dev->pasid_ops->return_page_response(bus, devfn, resp);
+    }
+    return -ENOENT;
+}
+
 static void pci_dev_get_w64(PCIBus *b, PCIDevice *dev, void *opaque)
 {
     Range *range = opaque;
-- 
2.26.3

