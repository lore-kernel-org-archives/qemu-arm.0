Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2449186wru;
        Mon, 1 Jul 2019 02:35:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxc5I7mmZrcxbzE/g1gUubvJ1hKZG77HydEv/s4QWiHPUl2yRqvLTUKbTKc8xH4Grogo2hk
X-Received: by 2002:a17:906:4bcb:: with SMTP id x11mr22356065ejv.1.1561973735976;
        Mon, 01 Jul 2019 02:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561973735; cv=none;
        d=google.com; s=arc-20160816;
        b=GpKdneVJwNYInzDfJi12AN/ki68XM2AfWrlhOqDgfBAnI6Z6tnU312P1xDHgtFM1ep
         e3LCY0/if9y08jQU2Jw4tDI5UaLefp3YcX/FtjBcdpGusLIm6Lp/XtVqzXjTwzK9ffEd
         ymQMVgpiElWpfo99Oykmpot0dgipovh15DukroW2kf/sIxXc9ZqiSD5lTrEjVaYciTtx
         9fjMN19f4ToW5kuhanxtPaiSBZpGKJ4pmkLwBbsvV+NcK2fnr5n2bMZQpEqm+fFWznm4
         qJKqHMw+i7tHnAYSsn+urp1lW5u4zgHpBsArv8+nZv0tUv8RIUimCdkIzCeEvkZkkWW1
         JIXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=pabV38g8QCRy3q6HCUUzmZ2WX+hWBxP6m49weAbNxkY=;
        b=x/ei2d2bNOVwN8186TkkxJPihNxFife/plvvnFcabYEKmpb3lWKlsbahi8NijYEjQe
         YWYo2N9ueor5c4TaMyP+Q00GI0jT1lHFMGztq1HD4u+ruLpXuZ2qGCSJqU4GytMlkiYy
         4IoPAuPtOTxIDGLhwKpDR+I4TCEPRFAIn6jwMdyKGo1k6MRH11o4wkh1ZtDM1In0Hl53
         eL2k4NSa4fdVD9Lh1bHn5YxifljoF3c+kD4Cjhu505kec2Cif+SZoTlHVgvryH1SktQa
         QrvKk1sJWkoxn48K/C4S+eccoFpzVJdkujrvPYQujMbiHRo4tngiiK4RlUAMQqTfL1x8
         vTDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16si8469572eda.244.2019.07.01.02.35.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 02:35:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhsil-0003pg-0S
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 05:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49587)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hhsef-0002Jf-La
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 05:31:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hhsee-0000MJ-EO
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 05:31:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41908)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hhsee-0000LP-6b; Mon, 01 Jul 2019 05:31:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 50F17308FE9A;
 Mon,  1 Jul 2019 09:31:09 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-89.ams2.redhat.com [10.36.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBCB4BA4D;
 Mon,  1 Jul 2019 09:30:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Mon,  1 Jul 2019 11:30:32 +0200
Message-Id: <20190701093034.18873-5-eric.auger@redhat.com>
In-Reply-To: <20190701093034.18873-1-eric.auger@redhat.com>
References: <20190701093034.18873-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 01 Jul 2019 09:31:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 4/6] hw/arm/smmuv3: Advertise VFIO_NESTED
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
X-TUID: lyX/quLufCDd

Virtual SMMUv3 requires physical nested stages for VFIO integration.
Advertise this attribute.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 hw/arm/smmuv3.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index e96d5beb9a..384c02cb91 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1490,6 +1490,17 @@ static void smmuv3_notify_flag_changed(IOMMUMemory=
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
+    }
+    return -EINVAL;
+}
+
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
 {
@@ -1497,6 +1508,7 @@ static void smmuv3_iommu_memory_region_class_init(O=
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

