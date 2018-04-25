Received: by 10.28.4.212 with SMTP id 203csp880921wme;
        Wed, 25 Apr 2018 07:24:38 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrP7z4uqZxWJ1DQMr9hUgm6Dk3FuuDHy1y9cWcyyVrPtiRSF2VD5bI82nig+IREQKmvhYcK
X-Received: by 10.12.169.76 with SMTP id z12mr6663360qva.57.1524666278446;
        Wed, 25 Apr 2018 07:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524666278; cv=none;
        d=google.com; s=arc-20160816;
        b=o3QYZMoeohTCkTDdLqL+Hw2kYJ5/fTNoUW8LEWnpOeF2qKi3b/sFDEVzS+bMrnfCw0
         SXL3sbkIDsIhVwRlplS9Y/R4wx5CkTOiqBd6gha/raMiTfTHi5yqJmY9hS4s9a3x9dJf
         58yOWMeEQ5v0gHtdN7btNz5q6geRyIVVpHd4ZFsxwRieC+M7Ie47MrEWfrKH2dxDdf8r
         JDMzhQ48Zzu7zbImjQktmVxhwxQGqn4E+s3PAi5XBvrOeQveCQlIddTEVdi14VshcoOX
         sjQ/V1QOrz2ht3OMlZleNzfHcOkbmfOOYFAjsykpQ6x0HO0Njq8+2vjHRvl3UnKjYK2x
         P5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=KKz+8I1hYuA4hDRKgcTCWFIKXVu4H7wZ300ZBXrORu8=;
        b=YjDDrdnroHo4FRn+liInbgdiab7uq974cxjYEtJNDe/63UAD6NlXXRuQFtN6NSByGm
         nyk4QUQJeARfchc4G9CSj+9aYiD+UYXydhnyrk9CcujIQOwaRQ9aZ4mqUwv1vC353zOD
         IuzSzNtETKwXPraAh8BrrOhWfBtiplJSy/khvd09uoarJ8vgrQ6IY5pV65PYUrdi9K//
         gN9DaHi+RqYL5LzkrqpeB4kVhdq1VCLUnaXQGke9L1MwqegqeN3JP77UShBOlGIp8dpG
         kvEiKwy0LoHvrBtW+OXPF0e6lHKrTjVHARkffGGg3arGN5AlG3z6of1KA8RnIhLpoYC4
         ihlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i24-v6si8122683qti.36.2018.04.25.07.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Apr 2018 07:24:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBLLZ-0006Kv-T1
	for alex.bennee@linaro.org; Wed, 25 Apr 2018 10:24:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLDy-0000lD-R5
	for qemu-devel@nongnu.org; Wed, 25 Apr 2018 10:16:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLDx-00061e-Vp
	for qemu-devel@nongnu.org; Wed, 25 Apr 2018 10:16:46 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43402 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fBLDu-0005yb-SH; Wed, 25 Apr 2018 10:16:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 78D21EBFF0;
	Wed, 25 Apr 2018 14:16:42 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-141.ams2.redhat.com
	[10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 950692023239;
	Wed, 25 Apr 2018 14:16:39 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Wed, 25 Apr 2018 16:15:55 +0200
Message-Id: <1524665762-31355-11-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
References: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 25 Apr 2018 14:16:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 25 Apr 2018 14:16:42 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v12 10/17] hw/arm/smmuv3: Abort on vfio or
 vhost case
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
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /q0d0FhfIXrW

At the moment, the SMMUv3 does not support notification on
TLB invalidation. So let's log an error as soon as such notifier
gets enabled.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v11 -> v12:
- Added Peter's R-b
---
 hw/arm/smmuv3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index d896834..b3026de 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1147,12 +1147,23 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
     dc->realize = smmu_realize;
 }
 
+static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
+                                       IOMMUNotifierFlag old,
+                                       IOMMUNotifierFlag new)
+{
+    if (old == IOMMU_NOTIFIER_NONE) {
+        warn_report("SMMUV3 does not support vhost/vfio integration yet: "
+                    "devices of those types will not function properly");
+    }
+}
+
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
 {
     IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
 
     imrc->translate = smmuv3_translate;
+    imrc->notify_flag_changed = smmuv3_notify_flag_changed;
 }
 
 static const TypeInfo smmuv3_type_info = {
-- 
2.5.5

