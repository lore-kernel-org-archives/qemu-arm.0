Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4425867wrg;
        Tue, 11 Jun 2019 07:38:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2w3Oqa/OLzD33evb7tbZ6FwpQLIuUmGHCvaxgrRHvzp1z65GRCmxgFvoQ1CrlrAmNUBfI
X-Received: by 2002:a05:620a:12db:: with SMTP id e27mr49437577qkl.352.1560263886354;
        Tue, 11 Jun 2019 07:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560263886; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQOh8tU0HCSq9OH/gWDlvUS0QZsIpFWqlfuAY1gxMdiI1OM1WplCOGaq9j+TWMqfLl
         EALtnM/0WFfFq8K7gSxA2RD3w/Wxp9kaFXCLclXvx6jex5K3aq455V5Zgq9IODUPd16C
         FPKNTqW0JVFvy6y2j0vA0jSdTicEP/sObpMVl/K++tbMB0uVJVcA/3Bg+h6BG/WIL8Xl
         Elcd5oRXPPYzj4cxPldaM/LY5lFrq4GnUWBRMz/XPPbtE5lS9/DHRDWNhQ5rZXkiBc1Z
         z6RsN0vlDy1C2NcUIQl6+4hTwAm9zNjjlEj/qwvKJ4tLkLsj5A0J7Ex1c848qnnbTisq
         vdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=LVHAOnINpQ+ARgTVVSfoPs7+FJBG+THGsJnpBH/at5o=;
        b=gTttL0JAPEICiL2ohUM19izVSrkWY5w+7IVALFcTiAMemkRUdoGQQFDb+FNiXGySPP
         nFFssMNSxdlKaVfoQEfeGHNvON/zCNh05bnJOJw3IsWZZLQHnoDiVcCiFcJkAv9MhmHU
         MFgObs2xj9BdSXc1H9Mp/EO0GdjiXv8YAXgCVCmZfNbwsywCyqSBx0zIugilwZAXZwvs
         tqsYfkwPBSgzlkFrH8XPwyEAt7PwMxhbL8NQ6MABIIZIsFC5HIca3SOphsWKxyn/oZD2
         QPDIYSlYnpIpuPkzzrZuPAmc/+sN+5h3EbNNTjajik9FvKFN8z6fcEUv8suanJ11BMCk
         7azw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b24si1322814qta.178.2019.06.11.07.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 07:38:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hahuX-0005dO-Pn
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 10:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40547)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hahmC-0001U9-Nf
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 10:29:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hahmB-0002hC-Gn
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 10:29:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33204)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hahmB-0002Np-8q; Tue, 11 Jun 2019 10:29:27 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3D6B78553D;
 Tue, 11 Jun 2019 14:28:46 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36CCD17F41;
 Tue, 11 Jun 2019 14:28:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Tue, 11 Jun 2019 16:28:20 +0200
Message-Id: <20190611142821.3874-2-eric.auger@redhat.com>
In-Reply-To: <20190611142821.3874-1-eric.auger@redhat.com>
References: <20190611142821.3874-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 11 Jun 2019 14:28:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/2] hw/arm/smmuv3: Remove spurious error
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
Cc: peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jpu2Fmbl//p6

An IOVA/ASID invalidation is notified to all IOMMU Memory Regions
through smmuv3_inv_notifiers_iova/smmuv3_notify_iova.

When the notification occurs it is possible that some of the
PCIe devices associated to the notified regions do not have a
valid stream table entry. In that case we output a LOG_GUEST_ERROR
message.

invalid sid=3D<SID> (L1STD span=3D0)
"smmuv3_notify_iova error decoding the configuration for iommu mr=3D<MR>

This is unfortunate as the user gets the impression that there
are some translation decoding errors whereas there are not.

This patch adds a new field in SMMUEventInfo that tells whether
the detction of an invalid STE msut lead to an error report.
invalid_ste_allowed is set before doing the invalidations and
kept unset on actual translation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

I also experimented to pass Error handles to all the subfunctions
and handle the Error at top level but that's intricate to sort
out the various kinds of errors, whether they need to be logged,
and if so if they match LOG_GUEST_ERRoR mask or unimplemented
mask. So I think just passing this boolean has a lesser impact on
the code base.
---
 hw/arm/smmuv3-internal.h |  1 +
 hw/arm/smmuv3.c          | 11 +++++------
 2 files changed, 6 insertions(+), 6 deletions(-)

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
index fd8ec7860e..e2f07d2864 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -404,7 +404,7 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid=
, STE *ste,
=20
         span =3D L1STD_SPAN(&l1std);
=20
-        if (!span) {
+        if (!span && !event->inval_ste_allowed) {
             /* l2ptr is not valid */
             qemu_log_mask(LOG_GUEST_ERROR,
                           "invalid sid=3D%d (L1STD span=3D0)\n", sid);
@@ -602,7 +602,9 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegi=
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
@@ -795,16 +797,13 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *m=
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

