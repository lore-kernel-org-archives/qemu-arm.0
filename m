Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp327073wrv;
        Wed, 10 Jul 2019 23:19:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDHxCBtrM61oqOb42pyVi5P1ZvFoJukHL9uXdhOVRxdREPOJcEl6cHj8ZdDqpaAe/0Tbhg
X-Received: by 2002:a17:906:94ce:: with SMTP id d14mr1666186ejy.251.1562825999228;
        Wed, 10 Jul 2019 23:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562825999; cv=none;
        d=google.com; s=arc-20160816;
        b=JQyAg1tfwMeGiEo4G2gde6N9CpsKyCjCYlWRiaGAmJ7y8sANXNtpiRkPOjJW3Q9NkT
         gxuEPg8ye+HfT7XN0vdcEJzVtjCs8bZsCp6GglUjgDZ4Ahwm7bC2mgp3nHCXuZRKlMoD
         e+Umj6Em38n+2QCHZ/pzEIVqf2tBx7FoeJOp+l89vz/7UOD7TC3cfjqfoVIwE65MHZ+M
         rq8+n7+fbwZ57lfxyYWhwzOed8BCmHkW652gO2ymaGCAvINeeYoQnTFWZ4kRm2zAhpej
         N7CSaflmH/5cCIKDDAWd7X967YrRTHyHYEiRd8dqmghZhcU/BK7I0mqv1tKIAee+QfGq
         8sjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=A+7bFOOS+65Wzg26Gg2GEjYXIVMhJIlEl1cvI9iiFZc=;
        b=c0Hg8pQChLTj5ErEMf7t6RjkXWiDy2oYG9xOKgrpcaIwTcQpUHf6a2dWQrlXvwmNZd
         5HtGppU0BB/tO5J50fHRXDjB/QShXjOXY1GXtXuU1BB56IKk6cG9bHmf3SjqhfkPM4Cd
         0K7jlPaURtFgDMTmqDBoTEg7IGnuE5qZap7HeV8hDjTwqBzp7kl7A3VrW/Os6OymRj3d
         DRtGu8+bOdr9s9vOER2qjC8EWvCgl+jp0tGbMdxy6PStqwBhaJpjM7201KwLWegv0DqR
         rsaY4QnNH9JRECJBPL9qRYBuoBfBbZc6x4O9Z9Lp584m7CbUVJ8y3ezGA7msUJ5S/jSU
         cujQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l42si2993476edc.120.2019.07.10.23.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2019 23:19:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlSQw-0006ET-2y
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 02:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41524)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlSQe-0005xj-MX
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 02:19:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlSQd-0000at-Gb
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 02:19:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39926)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlSQd-0000To-8U; Thu, 11 Jul 2019 02:19:39 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F346E59461;
 Thu, 11 Jul 2019 06:19:30 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A691C60A97;
 Thu, 11 Jul 2019 06:19:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Thu, 11 Jul 2019 08:18:57 +0200
Message-Id: <20190711061857.13086-6-eric.auger@redhat.com>
In-Reply-To: <20190711061857.13086-1-eric.auger@redhat.com>
References: <20190711061857.13086-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 11 Jul 2019 06:19:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.2 v3 5/5] hw/arm/smmuv3: Remove spurious
 error messages on IOVA invalidations
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
X-TUID: baEaULZf8+MY

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
 hw/arm/smmuv3-internal.h |  1 +
 hw/arm/smmuv3.c          | 15 ++++++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

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
index 2e270a0f07..517755aed5 100644
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
@@ -405,7 +407,7 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid=
, STE *ste,
=20
         span =3D L1STD_SPAN(&l1std);
=20
-        if (!span) {
+        if (!span && !event->inval_ste_allowed) {
             /* l2ptr is not valid */
             qemu_log_mask(LOG_GUEST_ERROR,
                           "invalid sid=3D%d (L1STD span=3D0)\n", sid);
@@ -603,7 +605,9 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegi=
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
@@ -796,16 +800,13 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *m=
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

