Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp923524wrp;
        Thu, 19 Sep 2019 05:22:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy1Pz/Ho0+7AkppVRodChnfeAZWrwjPXyXIXVtM+7pcRQYSWF6LPn/98LJwEGQWoRr32D3O
X-Received: by 2002:a17:906:234e:: with SMTP id m14mr1553095eja.118.1568895766745;
        Thu, 19 Sep 2019 05:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568895766; cv=none;
        d=google.com; s=arc-20160816;
        b=xs4gijKXfaw3Vhw3RQqmIqB/RQJwlft4VfEhr6Kzpsz9kM2NIt4OscA5ZYJNsoCor6
         RVwnYOedIM1InWWBgCFJjACvdWB7EijorrKpea09h9YGR/CKex5dME+7L20dPMg11/J4
         J/8AIYGAQM67LAjZk5iG6TvujEhna6qr5f+l26s/GJMYBKTKGd5C360i0mh5bPFB+Iro
         berbV0FDAyA9WLmj10l3fDZOpGHZnE2LUYs0UIDUMHXnmyJ+GPlkU2/HmC2ITauZXzam
         1rWF08/AfQXfHGr4fni7KK3hkLbXyPF3OTJrKJxjn77N55MXcFweyG8I1HmoAS7Va0I5
         qSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=vcc28BwxLNfNT2It+VAFt4c/0L40zv4cz8x35B/F/gc=;
        b=DRAt982fj8M1ilp2oBEawbYcfoX1OfpIKDf3Yxz0c6KFM1H0Rj8YNh2VigR6PMUkMH
         L/6EVxduVyrWmHm2pbpGfbdA6h3UdgAWi2ZwYUsFx8hwN+1t3fjetKBnVwm1k2am7DNI
         VMxMrrDqcbk8kOj7KyxleQlOtNv8P+0CCcKycdkXXr8gkaabbr1QaiIILWezyQmDcCZL
         iS+/bZeduAxLFpuuxG+cRKBo9YLEZ+PseA6/+2yZOELuNpGjARzWxN+PFZ+iBVWhKr/K
         pGcKyAmSymXfTqSnhTeJDZ+kePW6M531E2XFAcg5hXnE9WgccVa/j4TqpBUlBELm18hF
         3AuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24si5415735ede.119.2019.09.19.05.22.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 05:22:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAvSP-0000g2-K6
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 08:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37693)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iAvOy-0005F4-Vf
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 08:19:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iAvOx-0003yP-TX
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 08:19:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64579)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iAvOx-0003xf-LX; Thu, 19 Sep 2019 08:19:11 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E52AE3D962;
 Thu, 19 Sep 2019 12:19:10 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-220.ams2.redhat.com [10.36.117.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 239A660BF1;
 Thu, 19 Sep 2019 12:19:05 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Thu, 19 Sep 2019 14:18:43 +0200
Message-Id: <20190919121845.29520-4-eric.auger@redhat.com>
In-Reply-To: <20190919121845.29520-1-eric.auger@redhat.com>
References: <20190919121845.29520-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 19 Sep 2019 12:19:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 3/5] exec: assert on
 memory_region_register_iommu_notifier() failure
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
Cc: mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uk9FFP2HBU2/

memory_region_register_iommu_notifier now returns an error
in case of failure. Assert in such a case.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- add assert(!ret)
---
 exec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/exec.c b/exec.c
index 8b998974f8..5be8db6253 100644
--- a/exec.c
+++ b/exec.c
@@ -663,7 +663,7 @@ static void tcg_register_iommu_notifier(CPUState *cpu=
,
      */
     MemoryRegion *mr =3D MEMORY_REGION(iommu_mr);
     TCGIOMMUNotifier *notifier;
-    int i;
+    int i, ret;
=20
     for (i =3D 0; i < cpu->iommu_notifiers->len; i++) {
         notifier =3D g_array_index(cpu->iommu_notifiers, TCGIOMMUNotifie=
r *, i);
@@ -692,7 +692,9 @@ static void tcg_register_iommu_notifier(CPUState *cpu=
,
                             0,
                             HWADDR_MAX,
                             iommu_idx);
-        memory_region_register_iommu_notifier(notifier->mr, &notifier->n=
);
+        ret =3D memory_region_register_iommu_notifier(notifier->mr,
+                                                    &notifier->n);
+        assert(!ret);
     }
=20
     if (!notifier->active) {
--=20
2.20.1

