Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1056360wrs;
        Thu, 22 Aug 2019 10:24:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqweFhKwjoldV553S97m8ScnlNhWVQPd7Nu+teTzzT25IKwICLd+ScEHSjAoUeVc49NYajN6
X-Received: by 2002:a17:906:68d9:: with SMTP id y25mr397790ejr.78.1566494671165;
        Thu, 22 Aug 2019 10:24:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566494671; cv=none;
        d=google.com; s=arc-20160816;
        b=RgYXCW8Ejf1vwnwAQ/+XBZPzyrW3IMDEF1FP0fDAWmsMSzMLyKbCRhcSBqYAVmqoSD
         GHDWabwxZF7zW65OCHbfuZhP5V3wi0vqtZ/YbTnwui/ynHAHqlgdA0BrT+PuKPC8KP/P
         F1fBo5ccQ/omJTNwmuJbmV8BNVPyK45rqObfwXQCny4q/0zywaZURsOf5jtOPr58EE1Q
         Ssl0HpxZ5ckCJHiPD1qbJMGxWim49dvYsXtdcwVAILow+2cfb8yb8dLquRwjlg/ioF6E
         Tixa7LBtXO72E7m9SIZ4e6NTmcwoB9SU04pf34jxifeWQnGiNVUF/v2cpm8q3eWV1sU/
         O4/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3J98Y0LsgBp6nD3DRXHV7rTG1hnpYz+kbljbtPXe3+0=;
        b=gAUC3BdPlyYqZHYZjVRmr7LxiE/86M54IQ+EnqIOUl1GilYXDkUes7WTykz+ntSlzx
         r1TO7VlmM+tmkVP03hgmdepfSdPSfDgVb6WuoTKWQi7rCIq69lxL4A5DiGxEd8OU6iJD
         6Myl7FZo3Mul0IRq/BlWJ4VSH1A8yZWj4k6LM6h/29hhFN5drYEz0k9jD14u6r1uRugX
         lD+LqEGU+D2nuevoThqgh6rc6oa8pnD63nN3PVtfmrqWAV1RjreBt+JdsQEy62Egmwrd
         u/TX95As+pcUN0WZdKqcAtEdqeO2USPY5uZVN1xTPIynJ4xOX5GGrJvExaZ6fve6xjgg
         P6Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s47si219753edb.351.2019.08.22.10.24.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2019 10:24:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0qp3-0005r7-DC
	for alex.bennee@linaro.org; Thu, 22 Aug 2019 13:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35566)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i0qon-0005ni-L6
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:24:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i0qom-000349-I3
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:24:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41760)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i0qom-00033h-AK; Thu, 22 Aug 2019 13:24:12 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9E561180158E;
 Thu, 22 Aug 2019 17:24:11 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE8A36092D;
 Thu, 22 Aug 2019 17:24:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Thu, 22 Aug 2019 19:23:47 +0200
Message-Id: <20190822172350.12008-3-eric.auger@redhat.com>
In-Reply-To: <20190822172350.12008-1-eric.auger@redhat.com>
References: <20190822172350.12008-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Thu, 22 Aug 2019 17:24:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 2/5] memory: Add IOMMU_ATTR_HW_NESTED_PAGING
 IOMMU memory region attribute
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
X-TUID: xqUoLyD/KsTD

We introduce a new IOMMU Memory Region attribute,
IOMMU_ATTR_HW_NESTED_PAGING that tells whether the virtual
IOMMU relies on physical IOMMU HW nested paging capability
when protecting host assigned devices.

Current Intel virtual IOMMU device supports "Caching
Mode" and does not require 2 stages at physical level to be
integrated with VFIO. However SMMUv3 does not implement such
"caching mode" and requires to use HW nested paging.

As such SMMUv3 is the first IOMMU device to advertise this
attribute.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3 -> v4:
- s/IOMMU_ATTR_VFIO_NESTED/IOMMU_ATTR_HW_NESTED_PAGING
- add comments related to the existing attributes
- fix space after the cast
---
 hw/arm/smmuv3.c       | 12 ++++++++++++
 include/exec/memory.h |  8 +++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 2eaf07fb5f..a37e3da240 100644
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
+    if (attr =3D=3D IOMMU_ATTR_HW_NESTED_PAGING) {
+        *(bool *)data =3D true;
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
diff --git a/include/exec/memory.h b/include/exec/memory.h
index ecca388e69..4342f16980 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -212,7 +212,13 @@ typedef struct MemoryRegionClass {
=20
=20
 enum IOMMUMemoryRegionAttr {
-    IOMMU_ATTR_SPAPR_TCE_FD
+    /* Retrieve an integer corresponding to the TCE file descriptor */
+    IOMMU_ATTR_SPAPR_TCE_FD,
+    /*
+     * Retrieve a boolean that indicates whether the virtual IOMMU relie=
s
+     * on physical IOMMU HW nested paging to protect host assigned devic=
es
+     */
+    IOMMU_ATTR_HW_NESTED_PAGING,
 };
=20
 /**
--=20
2.20.1

