Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp990905wrv;
        Thu, 11 Jul 2019 10:44:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1XDmO5Tin5nuYOm2qwCfq9m02tj0rsIJB0xzS8zxq9PI+pNYhF9bn1ckRHdjux+SV4MVX
X-Received: by 2002:aa7:d297:: with SMTP id w23mr4779758edq.128.1562867097908;
        Thu, 11 Jul 2019 10:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562867097; cv=none;
        d=google.com; s=arc-20160816;
        b=SaW18H/aZ6ctqCMLOsXD/ipRMKzfRBLeZ53YiTBg6wfbAOpmF3v0WsSsvdK32cO4T4
         hhXgOYh0dCNSBtd4e4pl5aVz7PgNLbeKKhaqqihR9nJIxJFhHLlY2Kh8JdmjTK84CIiL
         LOu36PkkU26XQjPe4nRrBcl6LnO5ov3u5r0zf0n1Thum3Ng5eb1ZSgTZqlLFP4EYcPLe
         FCiq17tNBDjXTa52A7QODLLXbyIVKf1WlMSOu0s/hoGsvNS4607Q6MgcYUKxBoKaiFTO
         tGLQrJ0FXAZwGAEEos3a9kGFUISi4oSv1Cd5ilTDWDi0Xv8NCkISu4NyR3DHtv5s3EO4
         rTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=5DuWOFUZGb8d9Y4yMWi9r4Tm9/qJbyAp9ujINI8Vrl0=;
        b=FHj1NFMwqkImuepSRaaGa1XrV1CZPS1lwxTzdn3L/PspiiEjPCqbIez8r0O4UAbZCc
         C/UzzZ8sPHHMl5MUQfjr0vAOZrnsFpX2TS4ju+JY/VXlf30whwQuLNvablvNSqmhtNRj
         QgAtkujWfWECp1/E7AOXV+LxiTcSVwpGsYZs7hvGw2s7m8ZqgQxdFZlTf2JcwZ/S9fsf
         CLuEBh4f5Va2FMPn9LOP3mHZpbBw839pcrG4c1FZCrvWDVglS8ScLJWR8S+GcNPskBjY
         EGXxRfHEJHiktTY8HY+NdchJ9kFmA3VT1oyQ6uo+L63HSK5uAsDHvSry+WF4vOGDQAcZ
         bT/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t24si3467063ejo.92.2019.07.11.10.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:44:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld7l-0003Id-IU
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39413)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld5z-0004DY-UU
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:43:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld5y-0006gS-Q3
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:43:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39174)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld5w-0006d2-Mu; Thu, 11 Jul 2019 13:43:02 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B5FBA81F33;
 Thu, 11 Jul 2019 17:42:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5111B60600;
 Thu, 11 Jul 2019 17:42:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:32 +0200
Message-Id: <20190711173933.31203-29-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 11 Jul 2019 17:42:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 28/29] hw/arm/smmuv3: Implement fault injection
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e6rPIwmSjVi9

We convert iommu_fault structs received from the kernel
into the data struct used by the emulation code and record
the evnts into the virtual event queue.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3 -> v4:
- fix compil issue on mingw

Exhaustive mapping remains to be done
---
 hw/arm/smmuv3.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 4474682a33..bca7ecb147 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1553,6 +1553,76 @@ static int smmuv3_get_attr(IOMMUMemoryRegion *iomm=
u,
     return -EINVAL;
 }
=20
+struct iommu_fault;
+
+static inline int
+smmuv3_inject_faults(IOMMUMemoryRegion *iommu_mr, int count,
+                     struct iommu_fault *buf)
+{
+#ifdef __linux__
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
+#else
+    return -1;
+#endif
+}
+
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
 {
@@ -1561,6 +1631,7 @@ static void smmuv3_iommu_memory_region_class_init(O=
bjectClass *klass,
     imrc->translate =3D smmuv3_translate;
     imrc->notify_flag_changed =3D smmuv3_notify_flag_changed;
     imrc->get_attr =3D smmuv3_get_attr;
+    imrc->inject_faults =3D smmuv3_inject_faults;
 }
=20
 static const TypeInfo smmuv3_type_info =3D {
--=20
2.20.1

