Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6309142wrg;
        Mon, 27 May 2019 04:44:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyfyfImwAP8AXjWESOBPwIYY5Amz2WAtrAeNvW8/wsKXOuWzp4jAMuobVJEOSGxZWG2cneP
X-Received: by 2002:aed:2de7:: with SMTP id i94mr2518518qtd.129.1558957494628;
        Mon, 27 May 2019 04:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558957494; cv=none;
        d=google.com; s=arc-20160816;
        b=aa5L1JPHizNHP03ObJe8p5vocV20pnELZ5iXvooqYQdKbx9N9qWmV7VOEO2iGoNcoy
         gg2cu4wykXaOzdMIzLgn8xlRmPLZKkIeMnychIVuUUrwFYC6CWvyrpIbVOPLYd6FrvSa
         nS5Kx+AiorBP6ZLcx4h0gmfAWhbrbpImVuQOtdndmbN4u09cGd71yrNcSU/xSprIDhza
         AsSVNHQ6ReEcAdXD/AgXbrCTCb66AtHdZW/C7+/poOEjQhex6INQdEHw3lqiG2CzkZqB
         Jn6x8V+XylClIcjpOMAfovJur/AVvaM4GItcLWDLl5TjHvZcdJf1xFeXDnBZcCxKkdNZ
         H/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=2ud7miD3hv8oyFKQaq1ZZmU5YdGSRmc3ihfycLgoemY=;
        b=FvU8E9zq43YDs4oNYfzYkjlPdM8tlWxbqlfjpceOsa/PPhLmMFlaak6SQEOaT/B4kt
         qZRyY/UanLkuDgtGswK6/oJY1vKPeSRT2I3pSfCwSmMuzlpWC5/QrI1neHjeC1Dep4Ri
         Z+IAab6mxnbvLGadt8fFLyQGgORs/ZmtUFaJG/oIs3hkyj2HPVRFR42rK5lAvCKChkGv
         lxot/1RuUdLi4AuXmhodpozxzrQLfnNeMn4K3nOCYYUKEgGAU3JuQB38v8IDteHxoqVm
         Ze4gIYanmoONAzv3pMrDAvzH/5L6vn7mVadpMlB2ZuMt0z7jh9OScc0jqsjyVa8BBRvB
         JKag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si1003253qke.159.2019.05.27.04.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 04:44:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVE3i-0004Ss-3b
	for alex.bennee@linaro.org; Mon, 27 May 2019 07:44:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE2A-0003LM-1u
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:43:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE29-0003YV-7L
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:43:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43880)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE29-0003Y5-32; Mon, 27 May 2019 07:43:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 546773079B92;
	Mon, 27 May 2019 11:43:16 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 410A45D962;
	Mon, 27 May 2019 11:43:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:43 +0200
Message-Id: <20190527114203.2762-8-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 27 May 2019 11:43:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 07/27] hw/arm/smmuv3: Advertise VFIO_NESTED and
 MSI_TRANSLATE attributes
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VG1aXsspD7aU

Virtual SMMUv3 requires physical nested stages for VFIO integration
and translates MSIs. So let's advertise those attributes.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- also advertise MSI_TRANSLATE
---
 hw/arm/smmuv3.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index fd8ec7860e..761d722395 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1490,6 +1490,20 @@ static void smmuv3_notify_flag_changed(IOMMUMemory=
Region *iommu,
     }
 }
=20
+static int smmuv3_get_attr(IOMMUMemoryRegion *iommu,
+                           enum IOMMUMemoryRegionAttr attr,
+                           void *data)
+{
+    if (attr =3D=3D IOMMU_ATTR_VFIO_NESTED) {
+        *(bool *) data =3D true;
+        return 0;
+    } else if (attr =3D=3D IOMMU_ATTR_MSI_TRANSLATE) {
+        *(bool *) data =3D true;
+        return 0;
+    }
+    return -EINVAL;
+}
+
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
 {
@@ -1497,6 +1511,7 @@ static void smmuv3_iommu_memory_region_class_init(O=
bjectClass *klass,
=20
     imrc->translate =3D smmuv3_translate;
     imrc->notify_flag_changed =3D smmuv3_notify_flag_changed;
+    imrc->get_attr =3D smmuv3_get_attr;
 }
=20
 static const TypeInfo smmuv3_type_info =3D {
--=20
2.20.1

