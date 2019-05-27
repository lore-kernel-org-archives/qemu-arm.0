Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6315531wrg;
        Mon, 27 May 2019 04:52:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzc4dFxV9cQclCwAupDQRZV3FgTwvpD+xkRiNP8rxLLR4/yCcn7wZer7G0eBFXe5yYapOlz
X-Received: by 2002:ae9:e903:: with SMTP id x3mr30161809qkf.128.1558957977708;
        Mon, 27 May 2019 04:52:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558957977; cv=none;
        d=google.com; s=arc-20160816;
        b=MtW+rern7Pq+NdLAUeFJ2euueMa4r8nv2O8NlRdVAGs1noQmf5ZzMGlHFgEX+QK0AQ
         Sg3cEjDr2vTL1/KbF8eXQGC1NK2nYZJ95aCIDyprDUktNviA3hn21s5vM2rqbxyqgsuW
         Z4k5DP6L9Id9E6ezzdN1WtVDVioDfPHQeB8V/ueQ/FGUKLpqiJ270S45F98jAUA0ydxH
         nQZ3O9jKn4hlx8uty3uZvSEFfoBzwmJd3HZrPICpj+iJjJzYUKZM6XZQtX8Gk/O0LMB9
         MJTi3CRrYvhAgv3su5wtcShJ43RbkrydwrZ7pd5RSFVkcY3Igcp/oad0iOELUnMQOyMt
         VBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=8yafO1UoJpDkvcZ0yQ3B/TTuMVSrE3mmIZszdQJd8kQ=;
        b=FkpLKvYfftsYDbKmMO64x5bauTobe7lVLXFDssmMwxD7SdNMTft3a8U2T/ud0ku+Ce
         tGyVJG6zEdmg9t/UmlnNWICMSyC+fYJVGM2G9JhbAFfXKCUo+KCh6zRX0Ocrd7wmfd1Q
         g6z1iHoS+StOvrxn0ytx1YhnelmSJy0ySqQPdX054ZdXZM66J3no/1EwiolT8UON0yb9
         MncfpfcVm+AB3PNqFQ1/CXZt6LfYpLz3HwzrPi5+5pYTGb+Qd10OVuZsgDV84af9NDjh
         VvH6WbnfxDerGIfYi4IIOF4OKlo0D1ZaODkWvGDfnqspUhPsmHiMUp7UBjgVIMjObYHh
         vScg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si1026776qtb.130.2019.05.27.04.52.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 04:52:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVEBV-0001rp-2y
	for alex.bennee@linaro.org; Mon, 27 May 2019 07:52:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE2m-0003sB-Vl
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:43:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE2m-0003wl-4k
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:43:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49770)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE2k-0003uw-0s; Mon, 27 May 2019 07:43:54 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C1F05946A;
	Mon, 27 May 2019 11:43:53 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 38D285D962;
	Mon, 27 May 2019 11:43:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:49 +0200
Message-Id: <20190527114203.2762-14-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 27 May 2019 11:43:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 13/27] hw/arm/smmuv3: Implement dummy replay
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mQs4KWN4nFgZ

The default implementation of memory_region_iommu_replay() shall
not be used as it forces the translation of the whole RAM range.
The purpose of this function is to update the shadow page tables.
However in case of nested stage, there is no shadow page table so
we can simply return.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 96d4147533..8db605adab 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1507,6 +1507,11 @@ static int smmuv3_get_attr(IOMMUMemoryRegion *iomm=
u,
     return -EINVAL;
 }
=20
+static inline void
+smmuv3_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
+{
+}
+
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
 {
@@ -1515,6 +1520,7 @@ static void smmuv3_iommu_memory_region_class_init(O=
bjectClass *klass,
     imrc->translate =3D smmuv3_translate;
     imrc->notify_flag_changed =3D smmuv3_notify_flag_changed;
     imrc->get_attr =3D smmuv3_get_attr;
+    imrc->replay =3D smmuv3_replay;
 }
=20
 static const TypeInfo smmuv3_type_info =3D {
--=20
2.20.1

