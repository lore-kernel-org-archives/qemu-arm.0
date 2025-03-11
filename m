Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1882643njc;
        Tue, 11 Mar 2025 07:13:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURkumUNt+0sLhmro8cT6Q+bUxM8r32/3MXMy5mGRCyR703QcGkiX6oT8whYjI9ekSaz1xHtr4SNXW+1w==@linaro.org
X-Google-Smtp-Source: AGHT+IEIjX6EViRZCEg6r2oChTZn7cX8qdXXF2tpC6Qe00eKscovXiv6YMGal4nuH4cTWbuNq44c
X-Received: by 2002:a17:907:8318:b0:ac2:972c:f732 with SMTP id a640c23a62f3a-ac2972d0214mr924112566b.33.1741702421970;
        Tue, 11 Mar 2025 07:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741702421; cv=none;
        d=google.com; s=arc-20240605;
        b=NoKuJB2wWuqY9MLa2EuQoDw5kpeEEe3/t94VfUp7R/jPwa9rza7hQl3B4CsoUm80Tn
         i41Ih/BBmCd4L6NOhJXjELkVSoCtblhLpzmJDyec9C5IdRMG6U+rUzeZ2zopTSPWY07d
         WCxTAHCZF8cMluEWMd6oLlEiUxziXBKGbWNLxhug9D6asumyYiS3O7fODJkLanY7TqIh
         ZQTjRwwp83MPX12Nnc3/ZbN7H1gsvrJulJjUzY8a98wqYiEHEssVYzEwemzCFGB7i/du
         gSoIXyXexCvVqMRGzol6X4xi4Eq/IoWDeSlWJIzTZ8H8zXwNOd7j8YuOS58xZOMMOQX2
         Hf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=rtHvLcVu9UM+iGiSX/4f2MoBi5KGjfENs08W+Da/+Oc=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=PGQ+0ZZTmoAogaY8yul0nzGIJ2/jEimcnyAwJ8b1715zeslzyqXwQmu2jrAcKiIl5i
         ZD5iOV64DEJswB+gNZuWFfifvpn4oYfdCb5imzEOpweJh49EtwxDAB6/VffoiWb0iTEn
         4Z8VECikx5w/G/q1ScHdlD2GljgXYhTTIpy0eETI2930NTrl0ciU0/sZ6KwNW2x/+/ks
         KB82zLuEAN7u6O2iYL9kpBrx2vxphsQckFJs5CpUamHdqQAf37kwnRv9UF3DFm5lEehp
         JuHkNKK9DaXC+6pG2FQztAzAYycovNaigafHnEWpSouoU5NreeC+gDXIXzskOVCOulVB
         Bzyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a640c23a62f3a-ac25ab1dd80si899079666b.325.2025.03.11.07.13.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 07:13:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ts0MK-0003ip-SW; Tue, 11 Mar 2025 10:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0ME-0003QO-GL; Tue, 11 Mar 2025 10:13:24 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0MB-00072v-3w; Tue, 11 Mar 2025 10:13:22 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBwdG1bclz6D9dy;
 Tue, 11 Mar 2025 22:10:10 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 07C451404F5;
 Tue, 11 Mar 2025 22:13:17 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Mar 2025 15:13:09 +0100
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [RFC PATCH v2 09/20] hw/arm/smmuv3-accel: Add set/unset_iommu_device
 callback
Date: Tue, 11 Mar 2025 14:10:34 +0000
Message-ID: <20250311141045.66620-10-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: taOmX1Rl1MKH

From: Nicolin Chen <nicolinc@nvidia.com>

Implement a set_iommu_device callback:
 -Find an existing S2 hwpt to test attach() or allocate a new one
   (Devices behind the same physical SMMU should share an S2 HWPT.)
 -Attach the device to the S2 hwp
 -Allocate a viommu with the returned s2 hwpt.
 -Allocate bypass and abort hwpt and attach bypass hwpt.
 -and add it to its device list

Also add an unset_iommu_device doing the opposite cleanup routine.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/meson.build            |   2 +-
 hw/arm/smmuv3-accel.c         | 183 ++++++++++++++++++++++++++++++++++
 hw/arm/trace-events           |   4 +
 include/hw/arm/smmuv3-accel.h |  23 +++++
 include/system/iommufd.h      |   6 ++
 5 files changed, 217 insertions(+), 1 deletion(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index e8593363b0..dd41a86619 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -55,7 +55,7 @@ arm_ss.add(when: 'CONFIG_MUSCA', if_true: files('musca.c'))
 arm_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
-arm_ss.add(when: 'CONFIG_ARM_SMMUV3_ACCEL', if_true: files('smmuv3-accel.c'))
+arm_ss.add(when: ['CONFIG_ARM_SMMUV3_ACCEL', 'CONFIG_IOMMUFD'], if_true: files('smmuv3-accel.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 arm_ss.add(when: 'CONFIG_XEN', if_true: files(
diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
index 6610ebe4be..1c696649d5 100644
--- a/hw/arm/smmuv3-accel.c
+++ b/hw/arm/smmuv3-accel.c
@@ -7,6 +7,8 @@
  */
 
 #include "qemu/osdep.h"
+#include "trace.h"
+#include "qemu/error-report.h"
 
 #include "hw/arm/smmuv3-accel.h"
 #include "hw/pci/pci_bridge.h"
@@ -30,6 +32,185 @@ static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *s, SMMUPciBus *sbus,
     return accel_dev;
 }
 
+static bool
+smmuv3_accel_dev_attach_viommu(SMMUv3AccelDevice *accel_dev,
+                               HostIOMMUDeviceIOMMUFD *idev, Error **errp)
+{
+    struct iommu_hwpt_arm_smmuv3 bypass_data = {
+        .ste = { 0x9ULL, 0x0ULL },
+    };
+    struct iommu_hwpt_arm_smmuv3 abort_data = {
+        .ste = { 0x1ULL, 0x0ULL },
+    };
+    SMMUDevice *sdev = &accel_dev->sdev;
+    SMMUState *s = sdev->smmu;
+    SMMUv3AccelState *s_accel = ARM_SMMUV3_ACCEL(s);
+    SMMUS2Hwpt *s2_hwpt;
+    SMMUViommu *viommu;
+    uint32_t s2_hwpt_id;
+    uint32_t viommu_id;
+
+    if (s_accel->viommu) {
+        accel_dev->viommu = s_accel->viommu;
+        return host_iommu_device_iommufd_attach_hwpt(
+                       idev, s_accel->viommu->s2_hwpt->hwpt_id, errp);
+    }
+
+    if (!iommufd_backend_alloc_hwpt(idev->iommufd, idev->devid, idev->ioas_id,
+                                    IOMMU_HWPT_ALLOC_NEST_PARENT,
+                                    IOMMU_HWPT_DATA_NONE, 0, NULL,
+                                    &s2_hwpt_id, errp)) {
+        return false;
+    }
+
+    /* Attach to S2 for MSI cookie */
+    if (!host_iommu_device_iommufd_attach_hwpt(idev, s2_hwpt_id, errp)) {
+        goto free_s2_hwpt;
+    }
+
+    if (!iommufd_backend_alloc_viommu(idev->iommufd, idev->devid,
+                                      IOMMU_VIOMMU_TYPE_ARM_SMMUV3,
+                                      s2_hwpt_id, &viommu_id, errp)) {
+        goto detach_s2_hwpt;
+    }
+
+    viommu = g_new0(SMMUViommu, 1);
+    viommu->core.viommu_id = viommu_id;
+    viommu->core.s2_hwpt_id = s2_hwpt_id;
+    viommu->core.iommufd = idev->iommufd;
+
+    if (!iommufd_backend_alloc_hwpt(idev->iommufd, idev->devid,
+                                    viommu->core.viommu_id, 0,
+                                    IOMMU_HWPT_DATA_ARM_SMMUV3,
+                                    sizeof(abort_data), &abort_data,
+                                    &viommu->abort_hwpt_id, errp)) {
+        error_report("failed to allocate an abort pagetable");
+        goto free_viommu;
+    }
+
+    if (!iommufd_backend_alloc_hwpt(idev->iommufd, idev->devid,
+                                    viommu->core.viommu_id, 0,
+                                    IOMMU_HWPT_DATA_ARM_SMMUV3,
+                                    sizeof(bypass_data), &bypass_data,
+                                    &viommu->bypass_hwpt_id, errp)) {
+        error_report("failed to allocate a bypass pagetable");
+        goto free_abort_hwpt;
+    }
+
+    /*
+     * Attach the bypass STE which means S1 bypass and S2 translate.
+     * This is to make sure that the vIOMMU object is now associated
+     * with the device and has this STE installed in the host SMMUV3.
+     */
+    if (!host_iommu_device_iommufd_attach_hwpt(
+                idev, viommu->bypass_hwpt_id, errp)) {
+        error_report("failed to attach the bypass pagetable");
+        goto free_bypass_hwpt;
+    }
+
+    s2_hwpt = g_new0(SMMUS2Hwpt, 1);
+    s2_hwpt->iommufd = idev->iommufd;
+    s2_hwpt->hwpt_id = s2_hwpt_id;
+    s2_hwpt->ioas_id = idev->ioas_id;
+
+    viommu->iommufd = idev->iommufd;
+    viommu->s2_hwpt = s2_hwpt;
+
+    s_accel->viommu = viommu;
+    accel_dev->viommu = viommu;
+    return true;
+
+free_bypass_hwpt:
+    iommufd_backend_free_id(idev->iommufd, viommu->bypass_hwpt_id);
+free_abort_hwpt:
+    iommufd_backend_free_id(idev->iommufd, viommu->abort_hwpt_id);
+free_viommu:
+    iommufd_backend_free_id(idev->iommufd, viommu->core.viommu_id);
+    g_free(viommu);
+detach_s2_hwpt:
+    host_iommu_device_iommufd_attach_hwpt(idev, accel_dev->idev->ioas_id, errp);
+free_s2_hwpt:
+    iommufd_backend_free_id(idev->iommufd, s2_hwpt_id);
+    return false;
+}
+
+static bool smmuv3_accel_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
+                                          HostIOMMUDevice *hiod, Error **errp)
+{
+    HostIOMMUDeviceIOMMUFD *idev = HOST_IOMMU_DEVICE_IOMMUFD(hiod);
+    SMMUState *s = opaque;
+    SMMUv3AccelState *s_accel = ARM_SMMUV3_ACCEL(s);
+    SMMUPciBus *sbus = smmu_get_sbus(s, bus);
+    SMMUv3AccelDevice *accel_dev = smmuv3_accel_get_dev(s, sbus, bus, devfn);
+    SMMUDevice *sdev = &accel_dev->sdev;
+
+    if (!idev) {
+        return true;
+    }
+
+    if (accel_dev->idev) {
+        if (accel_dev->idev != idev) {
+            error_report("Device 0x%x already ha an associated idev",
+                         smmu_get_sid(sdev));
+            return false;
+        } else {
+            return true;
+        }
+    }
+
+    if (!smmuv3_accel_dev_attach_viommu(accel_dev, idev, errp)) {
+        error_report("Unable to attach viommu");
+        return false;
+    }
+
+    accel_dev->idev = idev;
+    QLIST_INSERT_HEAD(&s_accel->viommu->device_list, accel_dev, next);
+    trace_smmuv3_accel_set_iommu_device(devfn, smmu_get_sid(sdev));
+    return true;
+}
+
+static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
+                                            int devfn)
+{
+    SMMUDevice *sdev;
+    SMMUv3AccelDevice *accel_dev;
+    SMMUViommu *viommu;
+    SMMUState *s = opaque;
+    SMMUv3AccelState *s_accel = ARM_SMMUV3_ACCEL(s);
+    SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_pcibus_by_busptr, bus);
+
+    if (!sbus) {
+        return;
+    }
+
+    sdev = sbus->pbdev[devfn];
+    if (!sdev) {
+        return;
+    }
+
+    accel_dev = container_of(sdev, SMMUv3AccelDevice, sdev);
+    if (!host_iommu_device_iommufd_attach_hwpt(accel_dev->idev,
+                                               accel_dev->idev->ioas_id,
+                                               NULL)) {
+        error_report("Unable to attach dev to the default HW pagetable");
+    }
+
+
+    accel_dev->idev = NULL;
+    QLIST_REMOVE(accel_dev, next);
+    trace_smmuv3_accel_unset_iommu_device(devfn, smmu_get_sid(sdev));
+
+    viommu = s_accel->viommu;
+    if (QLIST_EMPTY(&viommu->device_list)) {
+        iommufd_backend_free_id(viommu->iommufd, viommu->bypass_hwpt_id);
+        iommufd_backend_free_id(viommu->iommufd, viommu->abort_hwpt_id);
+        iommufd_backend_free_id(viommu->iommufd, viommu->core.viommu_id);
+        iommufd_backend_free_id(viommu->iommufd, viommu->s2_hwpt->hwpt_id);
+        g_free(viommu->s2_hwpt);
+        g_free(viommu);
+        s_accel->viommu = NULL;
+    }
+}
 static AddressSpace *smmuv3_accel_find_add_as(PCIBus *bus, void *opaque,
                                               int devfn)
 {
@@ -77,6 +258,8 @@ static void smmu_accel_realize(DeviceState *d, Error **errp)
         return;
     }
     bs->get_address_space = smmuv3_accel_find_add_as;
+    bs->set_iommu_device = smmuv3_accel_set_iommu_device;
+    bs->unset_iommu_device = smmuv3_accel_unset_iommu_device;
 }
 
 static void smmuv3_accel_class_init(ObjectClass *klass, void *data)
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 7790db780e..17960794bf 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -58,6 +58,10 @@ smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s
 smmuv3_inv_notifiers_iova(const char *name, int asid, int vmid, uint64_t iova, uint8_t tg, uint64_t num_pages, int stage) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" stage=%d"
 smmu_reset_exit(void) ""
 
+#smmuv3-accel.c
+smmuv3_accel_set_iommu_device(int devfn, uint32_t sid) "devfn=0x%x (sid=0x%x)"
+smmuv3_accel_unset_iommu_device(int devfn, uint32_t sid) "devfn=0x%x (sid=0x%x"
+
 # strongarm.c
 strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
 strongarm_ssp_read_underrun(void) "SSP rx underrun"
diff --git a/include/hw/arm/smmuv3-accel.h b/include/hw/arm/smmuv3-accel.h
index 86c0523063..aca6838dca 100644
--- a/include/hw/arm/smmuv3-accel.h
+++ b/include/hw/arm/smmuv3-accel.h
@@ -12,16 +12,39 @@
 #include "hw/arm/smmu-common.h"
 #include "hw/arm/smmuv3.h"
 #include "qom/object.h"
+#include "system/iommufd.h"
+
+#include <linux/iommufd.h>
 
 #define TYPE_ARM_SMMUV3_ACCEL   "arm-smmuv3-accel"
 OBJECT_DECLARE_TYPE(SMMUv3AccelState, SMMUv3AccelClass, ARM_SMMUV3_ACCEL)
 
+typedef struct SMMUS2Hwpt {
+    IOMMUFDBackend *iommufd;
+    uint32_t hwpt_id;
+    uint32_t ioas_id;
+} SMMUS2Hwpt;
+
+typedef struct SMMUViommu {
+    IOMMUFDBackend *iommufd;
+    IOMMUFDViommu core;
+    SMMUS2Hwpt *s2_hwpt;
+    uint32_t bypass_hwpt_id;
+    uint32_t abort_hwpt_id;
+    QLIST_HEAD(, SMMUv3AccelDevice) device_list;
+    QLIST_ENTRY(SMMUViommu) next;
+} SMMUViommu;
+
 typedef struct SMMUv3AccelDevice {
     SMMUDevice  sdev;
+    HostIOMMUDeviceIOMMUFD *idev;
+    SMMUViommu *viommu;
+    QLIST_ENTRY(SMMUv3AccelDevice) next;
 } SMMUv3AccelDevice;
 
 struct SMMUv3AccelState {
     SMMUv3State smmuv3_state;
+    SMMUViommu *viommu;
 };
 
 struct SMMUv3AccelClass {
diff --git a/include/system/iommufd.h b/include/system/iommufd.h
index 53920bae5b..9c106ea078 100644
--- a/include/system/iommufd.h
+++ b/include/system/iommufd.h
@@ -37,6 +37,12 @@ struct IOMMUFDBackend {
     /*< public >*/
 };
 
+typedef struct IOMMUFDViommu {
+    IOMMUFDBackend *iommufd;
+    uint32_t s2_hwpt_id;
+    uint32_t viommu_id;
+} IOMMUFDViommu;
+
 bool iommufd_backend_connect(IOMMUFDBackend *be, Error **errp);
 void iommufd_backend_disconnect(IOMMUFDBackend *be);
 
-- 
2.34.1

