Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp367263wrx;
        Fri, 12 Apr 2019 03:11:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqynE3mKXt17cJ3Jcnvz6Zzo/Tkp5/bbSuoT1Hbr4+6brZ77LB1tvkal0krw2FEvQUUMe3Su
X-Received: by 2002:adf:f30a:: with SMTP id i10mr34428540wro.111.1555063899694;
        Fri, 12 Apr 2019 03:11:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555063899; cv=none;
        d=google.com; s=arc-20160816;
        b=IBmlqvuP/nbI7e3cgfBjatlJga9lrZhvZics076zXb7qqnOd7+YpownezFSkQ5anSz
         ra5o0+x/qvbJklG8f1O2xt9Oljmo5RctK3j4ifV+wCyjfgtEbD1Di9Jqf5YOsArf5eYX
         82KGtfJVtizi9AHvKFljqTzZewS3w2gbAakl0Fwbz9qCI1zLQ7agRe3x2PZjUpPMaqYi
         gVeLahmx+Kqpllenzka/FotLc++8VJTHvHmYSmFiEjw5NMAT4fMKZuLmEZCv3QyCCGV7
         4fDIDPVY8fUmb2Pa8AtReC+FcI1cfzk4S3r2dRSzzu7CIt0ApP1J4GglOt2DtDKVG3dk
         2hiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=8yafO1UoJpDkvcZ0yQ3B/TTuMVSrE3mmIZszdQJd8kQ=;
        b=nLO7ukWAZNINc8glf+iMZyGLcl+BFGdiy6Y8M19gt2x1QwDzZzI/FaKFl6Wl0LIUFs
         dYO/J8KUVTyyFJKsBEcckqdSPooHKNGJI3jP0rqPD5sZe8ih7BV1DnNxKBqEX0z5HWDz
         gAwUbT7HGEa9mFnRGcn6/3t06Caz48XgCPfbP9gyHO3kzoQouFRNdDT5namrEBoJNBr4
         xL1QeQsGPCCTav65VO+SqKvR13t8BJqw9pXGV9BnCGXjH/KyrfW0M9GPA024UJeVH/nK
         acyrfSH6F7hI5ljqlyvKoApKw4oNsV/sTSp555Z6NzWScCfYJD/KWH4fi+Px+Vmm4uTh
         KaCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1si22295709wro.290.2019.04.12.03.11.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:11:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEt9m-0007vO-Ol
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:11:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt3o-0001bd-Lp
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:05:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt3m-0004Kc-Ol
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:05:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53444)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hEt3l-0004Il-0h; Fri, 12 Apr 2019 06:05:26 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40A13306BB6E;
	Fri, 12 Apr 2019 10:05:24 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-161.ams2.redhat.com [10.36.117.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABB6A19746;
	Fri, 12 Apr 2019 10:05:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 12 Apr 2019 12:03:40 +0200
Message-Id: <20190412100354.6409-14-eric.auger@redhat.com>
In-Reply-To: <20190412100354.6409-1-eric.auger@redhat.com>
References: <20190412100354.6409-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 12 Apr 2019 10:05:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 13/27] hw/arm/smmuv3: Implement dummy replay
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
X-TUID: S/dd7uAtnmAP

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

