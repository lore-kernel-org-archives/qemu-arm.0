Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp362720wrx;
        Fri, 12 Apr 2019 03:07:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMTwDWTvTaQNiWhLe2OFMRd/sC2odcIhblA3S0N2w93WCPy/Gm7f/aAoXkyky2L9l6RAot
X-Received: by 2002:a1c:208c:: with SMTP id g134mr10488704wmg.70.1555063644297;
        Fri, 12 Apr 2019 03:07:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555063644; cv=none;
        d=google.com; s=arc-20160816;
        b=r8mpabIzguKhWRstijsj2OMNiGcUIjYFEmqjgwL+/jmIxB75vNNjbSy9/zdRErLBIi
         eWoLCHAjqC/J/i7Q0dvf3ai9F9yzsNDmF9g6LnrdB2zQrggjCJvSwJzTqhUfaVw2hsOv
         uwKSbfNnKfZtablKuHNJUQrHYOQxtllXIvvpkd0nLh7B58UuwN1k2ve8Vj1P0oXR4cbB
         SAObZFib3IJBW082pvFvBwDyf7P1Dn2JVF2x9f82/2ut5ZazXdRw+Ab6uvrVanSxZsje
         1vQdylpHk9jbblNI17Sd0mHkmFLijDhd1ehn12QFAaLDD7wcJDbhc0CExKfxVJvP2Lfg
         T+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=2ud7miD3hv8oyFKQaq1ZZmU5YdGSRmc3ihfycLgoemY=;
        b=FHqDOlt06jpx1cUr4WHJbA/DquSifsv+DzgEE/Cm/xxyLl6LUP+CakPf/lcfJCtyWo
         C+Mr8YJU5DtAcctE6OkDzuKuKoXOdwWvgGaMTYgA0JgCA/5zXYVjVus9An2gQn7OKt6p
         iYOMbQxzpxEemf85VsWsG+W+166zr6hgHGUrmysJCqcVEkHBAqH0UzNrNXgCeGzsCMr8
         IwE4cgdCtquhOlAOyN5cVw1/kxNMgwISGr7bi1d20rhfju8oB51NCMgxL3+v1QLpIjDp
         3Mei0k1WFKBf8gDJ1TxNzqhvoNgKngvaZTmm1qqasqwbxT2Nv2ehveO42ZC+6ONmTlyp
         sCYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14si4943884wmb.11.2019.04.12.03.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:07:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEt5f-00032r-7J
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:07:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt3O-00019a-L5
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 06:05:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt3M-0003xH-Uk
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 06:05:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58870)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hEt3I-0003tv-Kt; Fri, 12 Apr 2019 06:04:56 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BE7881DFE;
	Fri, 12 Apr 2019 10:04:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-161.ams2.redhat.com [10.36.117.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA5CC19728;
	Fri, 12 Apr 2019 10:04:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 12 Apr 2019 12:03:34 +0200
Message-Id: <20190412100354.6409-8-eric.auger@redhat.com>
In-Reply-To: <20190412100354.6409-1-eric.auger@redhat.com>
References: <20190412100354.6409-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 12 Apr 2019 10:04:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v3 07/27] hw/arm/smmuv3: Advertise VFIO_NESTED
 and MSI_TRANSLATE attributes
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
Cc: yi.l.liu@intel.com, mst@redhat.com, jean-philippe.brucker@arm.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 13L40y6//BCt

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

