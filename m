Received: by 10.28.71.27 with SMTP id u27csp2112909wma;
        Sat, 17 Feb 2018 11:25:36 -0800 (PST)
X-Google-Smtp-Source: AH8x225NGqjt5Q87OeiZFcWQ0Uc8nPsTJhrvcYqNpWCI/OQsLlq55H7NBcY49eEaBwc5XT/CKHLa
X-Received: by 10.129.38.214 with SMTP id m205mr7511696ywm.436.1518895536039;
        Sat, 17 Feb 2018 11:25:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518895536; cv=none;
        d=google.com; s=arc-20160816;
        b=l04MMPTsoVgPQyl7bl/vgqwWrfDVTMyrrOufAK6ejPaxeOY2HA7rX1G38eWDB2i9gt
         alE6zlcv3/2oKskHj96zHu57ibItm3UE/6FEdxQjRSqmi2qZ5J0MRTa7tJGJb+nWnWTE
         kZt1sue3o8jSr1spy5fpLgVqZjN3O9DIEPjINYci8K45F/K85UU4FC+lm06ICqBbMb2h
         8OarezTWl7fDxrHY4nYXMBjb4dA/+K8sxF5G08dZWKxu3FMKh+i3wOO2y5z6pHON4QuG
         Rf/WHoOJ79XDNgMcUa4qxR5m7kb61DIdPFnFue0DL2yOEcj44XmHjjxUI1PSHgrpOldl
         DlZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=MZMW18/mnlwksMUZ3mIGPAg6UK47iRoIU3NT/Um5Pt8=;
        b=FqcEuXVuAI8F/gxBwOQP456cDbOL6VhTEn2pLa9dkbzpXzsav49ApHAFXb1gz58Qo5
         Sda9xo94ox0NLfzeJMOdOfHZ7eRdhNFQEV+18872n7yD9OC8VuQZ67wTIL6ntnBuAWQE
         NlSSVSy2Aabb1OycWdD9Mcx7BzXd2lk9pYUC6gZfkCONL6jWSn69VeVPKlJ8JEmr7F1O
         Sjv2dFCcfUv/njybEn9MRZWJ/Eod2Iv8cY6GGwowWCMuxtcXp7S4r2wtkDI0zm11Ghl7
         5GD++qVA2VV7LP+gIWxSMrTtCj2Qtu8OXqyYM40uFf0Mjs2+CF74EB6EvauQjIrOIEHJ
         CyOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c205si362149yba.694.2018.02.17.11.25.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:25:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en875-0003eg-Cn
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:25:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1en7WO-0003dJ-PT
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:47:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1en7WN-0002X1-Ct
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:47:40 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56746 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1en7WJ-00029t-IB; Sat, 17 Feb 2018 13:47:35 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E5D98185322;
	Sat, 17 Feb 2018 18:47:35 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 70DEC2024CA2;
	Sat, 17 Feb 2018 18:47:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Sat, 17 Feb 2018 19:46:52 +0100
Message-Id: <1518893216-9983-11-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Sat, 17 Feb 2018 18:47:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Sat, 17 Feb 2018 18:47:35 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v9 10/14] hw/arm/smmuv3: Abort on vfio or vhost
 case
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
Cc: mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	peterx@redhat.com, edgar.iglesias@gmail.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2d4baLTsxUhM

At the moment, the SMMUv3 does not support notification on
TLB invalidation. So let's abort as soon as such notifier gets
enabled.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 384393f..5efe933 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1074,12 +1074,23 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
     dc->realize = smmu_realize;
 }
 
+static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
+                                       IOMMUNotifierFlag old,
+                                       IOMMUNotifierFlag new)
+{
+    if (old == IOMMU_NOTIFIER_NONE) {
+        error_setg(&error_fatal,
+                   "SMMUV3: vhost and vfio notifiers not yet supported");
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

