Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1056700wrs;
        Thu, 22 Aug 2019 10:24:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw3fy3HMQ85G2IpPCTblk0VexagCAvcRo0hX2mcTOVICgt43b8K3foIBi5whY3+2PX8W1cr
X-Received: by 2002:a50:f315:: with SMTP id p21mr44458634edm.195.1566494691033;
        Thu, 22 Aug 2019 10:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566494691; cv=none;
        d=google.com; s=arc-20160816;
        b=FCS+LgGEbd9VW7uyhj+SUKwcewEE7wxpsSz4XqafH+yG3NmXEf+PM54/VOYoHhiBqd
         ZE0iCaFAZnala9u3kXuk0K3Q4PD39CC9B+HL6tPj7Zdg/ctSo6CW58jpsI3h1SGA4qop
         XFHfRw2IZeYpWZlMkKi2C5CzkqCxdlo8uEnzn+UyCOVaTGWuR1gwP0NNKT/XDa9ZsqoX
         KKvX/s+DjSKPtEWwYpXANX0zlgYplXfHd9FUJSldzAGAOKYxp455zLySbWTG2aBMWXUK
         PXUPRqeOm9U/cFAW6C0NNqLMVrDhag8EAWpI1gYtWE/o3hWvLjFVQlQw7tb5eCkEXFCq
         +VdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=9B9i4P7DdqEcEuWAULpyur09AeYtdX7UdECrYMeyr+0=;
        b=XMeQR+QFhPsxgvKyFpzd2IkCV9s+b0eCDOIYdhckRGt//kNdSi7sRusXnkg4nICivF
         fPV2R1uxKVTv413B36v1q1pPXWWmZ85RJZ0f4qzGz4a4q20vakuPEZtwuA8dozdf3Dor
         xLFQnvssXt39U+vjzbP1vSAKftETdeBLXrawHiu+TKhgjxsz5iwQd7+szqHlH1DUvFSI
         KlR9QnkxE7EZIvAgS3v/O/hWpRYn+ePDZ7vWniBMm4koUO9G7t9D7BMgUEVNbn3d54b9
         zkkIbJzw6vtMhjKWzv35FhF/SNK+n6JJtH20Eh2vS4TbSOnGzH8ctHqTcRcgejdUteBB
         P2OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si102995ejo.392.2019.08.22.10.24.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2019 10:24:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0qpN-0006Rp-SG
	for alex.bennee@linaro.org; Thu, 22 Aug 2019 13:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35719)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i0qp2-0006D2-EZ
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:24:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i0qp1-0003Et-4Y
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:24:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1638)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i0qp0-0003EJ-T7; Thu, 22 Aug 2019 13:24:27 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 332EF4E93D;
 Thu, 22 Aug 2019 17:24:26 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A74960603;
 Thu, 22 Aug 2019 17:24:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Thu, 22 Aug 2019 19:23:50 +0200
Message-Id: <20190822172350.12008-6-eric.auger@redhat.com>
In-Reply-To: <20190822172350.12008-1-eric.auger@redhat.com>
References: <20190822172350.12008-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 22 Aug 2019 17:24:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 5/5] hw/arm/smmuv3: Remove spurious error
 messages on IOVA invalidations
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yFJMoFYb3QJh

An IOVA/ASID invalidation is notified to all IOMMU Memory Regions
through smmuv3_inv_notifiers_iova/smmuv3_notify_iova.

When the notification occurs it is possible that some of the
PCIe devices associated to the notified regions do not have a
valid stream table entry. In that case we output a LOG_GUEST_ERROR
message, for example:

invalid sid=3D<SID> (L1STD span=3D0)
"smmuv3_notify_iova error decoding the configuration for iommu mr=3D<MR>

This is unfortunate as the user gets the impression that there
are some translation decoding errors whereas there are not.

This patch adds a new field in SMMUEventInfo that tells whether
the detection of an invalid STE must lead to an error report.
invalid_ste_allowed is set before doing the invalidations and
kept unset on actual translation.

The other configuration decoding error messages are kept since if the
STE is valid then the rest of the config must be correct.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3 -> v4:
- only remove the trace on !span path but keep the error value
---
 hw/arm/smmuv3-internal.h |  1 +
 hw/arm/smmuv3.c          | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index b160289cd1..d190181ef1 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -381,6 +381,7 @@ typedef struct SMMUEventInfo {
     uint32_t sid;
     bool recorded;
     bool record_trans_faults;
+    bool inval_ste_allowed;
     union {
         struct {
             uint32_t ssid;
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index c353e4c27b..dbcd0f2fe9 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -320,7 +320,9 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *c=
fg,
     uint32_t config;
=20
     if (!STE_VALID(ste)) {
-        qemu_log_mask(LOG_GUEST_ERROR, "invalid STE\n");
+        if (!event->inval_ste_allowed) {
+            qemu_log_mask(LOG_GUEST_ERROR, "invalid STE\n");
+        }
         goto bad_ste;
     }
=20
@@ -407,8 +409,10 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t si=
d, STE *ste,
=20
         if (!span) {
             /* l2ptr is not valid */
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "invalid sid=3D%d (L1STD span=3D0)\n", sid);
+            if (!event->inval_ste_allowed) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "invalid sid=3D%d (L1STD span=3D0)\n", sid=
);
+            }
             event->type =3D SMMU_EVT_C_BAD_STREAMID;
             return -EINVAL;
         }
@@ -603,7 +607,9 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegi=
on *mr, hwaddr addr,
     SMMUDevice *sdev =3D container_of(mr, SMMUDevice, iommu);
     SMMUv3State *s =3D sdev->smmu;
     uint32_t sid =3D smmu_get_sid(sdev);
-    SMMUEventInfo event =3D {.type =3D SMMU_EVT_NONE, .sid =3D sid};
+    SMMUEventInfo event =3D {.type =3D SMMU_EVT_NONE,
+                           .sid =3D sid,
+                           .inval_ste_allowed =3D false};
     SMMUPTWEventInfo ptw_info =3D {};
     SMMUTranslationStatus status;
     SMMUState *bs =3D ARM_SMMU(s);
@@ -796,16 +802,13 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *m=
r,
                                dma_addr_t iova)
 {
     SMMUDevice *sdev =3D container_of(mr, SMMUDevice, iommu);
-    SMMUEventInfo event =3D {};
+    SMMUEventInfo event =3D {.inval_ste_allowed =3D true};
     SMMUTransTableInfo *tt;
     SMMUTransCfg *cfg;
     IOMMUTLBEntry entry;
=20
     cfg =3D smmuv3_get_config(sdev, &event);
     if (!cfg) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s error decoding the configuration for iommu mr=3D=
%s\n",
-                      __func__, mr->parent_obj.name);
         return;
     }
=20
--=20
2.20.1

