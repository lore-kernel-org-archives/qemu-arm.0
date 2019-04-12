Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp374806wrx;
        Fri, 12 Apr 2019 03:19:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqztE8mPBsQp+aVQliWauWC2Qrszyu0GQ4WisS2T7JbAZB/V7UOPMUdf9d0jFPHLBeE04xf1
X-Received: by 2002:a1c:f205:: with SMTP id s5mr10710050wmc.124.1555064340526;
        Fri, 12 Apr 2019 03:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555064340; cv=none;
        d=google.com; s=arc-20160816;
        b=JpEK76OONkWOwqcTjtJ8SRHdHK3b6WH/vUw/tBZ99PDSKfTdYs6SNfKcDvwH9+HWPy
         DZH/WYaj4dy8+WlR7hZDSHq/2KrAkaINm4wPI4TFMRoiuofMhCOOYhHFouo+uv0KnDSn
         4c0nUjDMhwTyE7Rg97kKUKP40clTDbE5C3WdC3XeBdS4J8RgVkVaDp4jjhXEI13kd3Fc
         FX9MMG5RGNplZH62gcvDV2sNv8pmNO5lIusR3++gkGLefWOMPXg1oB2h8N2nW5IQhzuz
         2n53IOoDkfTgT+PVOtLkIEJRVwvXzl3GU/MzkHkHiReeo9MnP8gJk1pOMs0uwfmwQpu9
         VpbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=D6806+p8u7Y+oBNRbObNo/Eb6EMRowQRyV0raJsWi3o=;
        b=Dv82otET+NlmLuvImS3xA+PxJ5u17TPxyprsoaYuyviCawjffvpRE1USltyR+8KoE+
         7nrPt4wWMhpchh3hFr1TCi+f0bbEGeQdLdGKy3djYM/Z3Fghzay2trnda76plx6+exxj
         eCj30wyZwipEdYUzdJmnHeL6m6YXG2sJMveDsnydJK9fP5FuFezKDlJYG5Pk/eat/s4z
         5CU7WUQGkmIo5ooyG9m/5Uc+53CSucKVF6qK8M0a0+Bbnm4cu0jrspRxAHvI28MZXQas
         J3WWfzxbGse73bhOR53NHDVg1NXyuzwLNQx1b1aelUiyNL+8xjE+35l1KMyGz+X9ADEp
         x9ug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si13211827wrv.267.2019.04.12.03.19.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:19:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEtGt-00060J-Io
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:18:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt56-0003Lz-Uj
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:06:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt55-0005RT-Sm
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:06:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54976)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hEt55-0005Qh-HF; Fri, 12 Apr 2019 06:06:47 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE2E53082E5F;
	Fri, 12 Apr 2019 10:06:46 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-161.ams2.redhat.com [10.36.117.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 216D519C65;
	Fri, 12 Apr 2019 10:06:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 12 Apr 2019 12:03:51 +0200
Message-Id: <20190412100354.6409-25-eric.auger@redhat.com>
In-Reply-To: <20190412100354.6409-1-eric.auger@redhat.com>
References: <20190412100354.6409-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 12 Apr 2019 10:06:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 24/27] hw/arm/smmuv3: Implement fault injection
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: yi.l.liu@intel.com, mst@redhat.com, jean-philippe.brucker@arm.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1izO3K8AZFEe

We convert iommu_fault structs received from the kernel
into the data struct used by the emulation code and record
the evnts into the virtual event queue.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

Exhaustive mapping remains to be done
---
 hw/arm/smmuv3.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index a7e48e7972..ddd6564001 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1545,6 +1545,70 @@ smmuv3_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNo=
tifier *n)
 {
 }
=20
+static inline int
+smmuv3_inject_faults(IOMMUMemoryRegion *iommu_mr, int count,
+                     struct iommu_fault *buf)
+{
+    SMMUDevice *sdev =3D container_of(iommu_mr, SMMUDevice, iommu);
+    SMMUv3State *s3 =3D sdev->smmu;
+    uint32_t sid =3D smmu_get_sid(sdev);
+    int i;
+
+    for (i =3D 0; i < count; i++) {
+        SMMUEventInfo info =3D {};
+        struct iommu_fault_unrecoverable *record;
+
+        if (buf[i].type !=3D IOMMU_FAULT_DMA_UNRECOV) {
+            continue;
+        }
+
+        info.sid =3D sid;
+        record =3D &buf[i].event;
+
+        switch (record->reason) {
+        case IOMMU_FAULT_REASON_PASID_INVALID:
+            info.type =3D SMMU_EVT_C_BAD_SUBSTREAMID;
+            /* TODO further fill info.u.c_bad_substream */
+            break;
+        case IOMMU_FAULT_REASON_PASID_FETCH:
+            info.type =3D SMMU_EVT_F_CD_FETCH;
+            break;
+        case IOMMU_FAULT_REASON_BAD_PASID_ENTRY:
+            info.type =3D SMMU_EVT_C_BAD_CD;
+            /* TODO further fill info.u.c_bad_cd */
+            break;
+        case IOMMU_FAULT_REASON_WALK_EABT:
+            info.type =3D SMMU_EVT_F_WALK_EABT;
+            info.u.f_walk_eabt.addr =3D record->addr;
+            info.u.f_walk_eabt.addr2 =3D record->fetch_addr;
+            break;
+        case IOMMU_FAULT_REASON_PTE_FETCH:
+            info.type =3D SMMU_EVT_F_TRANSLATION;
+            info.u.f_translation.addr =3D record->addr;
+            break;
+        case IOMMU_FAULT_REASON_OOR_ADDRESS:
+            info.type =3D SMMU_EVT_F_ADDR_SIZE;
+            info.u.f_addr_size.addr =3D record->addr;
+            break;
+        case IOMMU_FAULT_REASON_ACCESS:
+            info.type =3D SMMU_EVT_F_ACCESS;
+            info.u.f_access.addr =3D record->addr;
+            break;
+        case IOMMU_FAULT_REASON_PERMISSION:
+            info.type =3D SMMU_EVT_F_PERMISSION;
+            info.u.f_permission.addr =3D record->addr;
+            break;
+        default:
+            warn_report("%s Unexpected fault reason received from host: =
%d",
+                        __func__, record->reason);
+            continue;
+        }
+
+        smmuv3_record_event(s3, &info);
+    }
+    return 0;
+}
+
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
 {
@@ -1554,6 +1618,7 @@ static void smmuv3_iommu_memory_region_class_init(O=
bjectClass *klass,
     imrc->notify_flag_changed =3D smmuv3_notify_flag_changed;
     imrc->get_attr =3D smmuv3_get_attr;
     imrc->replay =3D smmuv3_replay;
+    imrc->inject_faults =3D smmuv3_inject_faults;
 }
=20
 static const TypeInfo smmuv3_type_info =3D {
--=20
2.20.1

