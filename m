Received: by 10.28.91.67 with SMTP id p64csp3779661wmb;
        Tue, 20 Mar 2018 05:41:14 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsGi3Bn0gx2T3I50Ptf27XDDoWEWlqMxFF/GFEATQY2DTtdTVcefnB9fYvIleImmEwqUoCw
X-Received: by 10.55.110.4 with SMTP id j4mr23835297qkc.272.1521549674635;
        Tue, 20 Mar 2018 05:41:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521549674; cv=none;
        d=google.com; s=arc-20160816;
        b=SJzxgFkQf5VCrKKsU9etz1VZbAof6GlQ7Lywf6auLITueKtJt8MREYYs28Sr1glF6n
         elfFNEYhgRoex1XJOCW550KRdBmF2Zebza7J9ZxwvX+ErJwVwBiv70KXuRRj5N/0zsDo
         vmD+MQXlzh5FY6hSqcwE9m/w3xuYFcEwnoLilxjxQsL88PV/m3APhUc+DRFgEyJY3/v5
         9NGDsRLXhiFUJQ33a0Yal0P+MTt0dIkdMdNp3wMagLSdM3XqKKyWAlt34tDRKTx87R9d
         k/VUhQ8A+s+uoEGcJ7Xwh1mATioz1hfBeq+WVrRTQvpwL772hDOU1aIhfArFCB7jW9yG
         E3gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Hbs4ZterowA5s0rh1wJxmrQKyH6dSZV/bPXd29NjDTk=;
        b=HZh52mFs9h2swMhbxm7x6CtugZVvHldOb5mjbQrTx9NxpiO142LB5F/8ISko5jScAr
         m7GiOg4nATqWfHR6Vi1azWOARY99+UyxgDUN6vXHTzA5mYT1aToVN/gFQYTz6ebiS0FI
         OylPNFykfhHF+1inpgJNL0/C66TGvaH5u2+lWFOcwwCB36NSf7JnZmdYmbTNvRkTRUpD
         D1kFRqzwvcfGtm4dBt5CencmZNJQ9kVI6yu3DrgAN/cxqiSPryJTXxOX3wN7LkhHwXGj
         p9qZ9m70SyO9DELbFIkrXdrw3T86xObJomQ4hlBGLgdAlUgLTjDIP+udiT+Z7Eyh10Q3
         6/7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o37si1848973qte.241.2018.03.20.05.41.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 05:41:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyGZm-0001fK-0E
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 08:41:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGXJ-0007ot-JE
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:38:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGXH-0003fn-Co
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:38:41 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39110 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eyGXH-0003fT-8F; Tue, 20 Mar 2018 08:38:39 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB75A4040853;
	Tue, 20 Mar 2018 12:38:38 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29B2A94583;
	Tue, 20 Mar 2018 12:38:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Tue, 20 Mar 2018 13:37:32 +0100
Message-Id: <1521549456-14072-11-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
References: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 12:38:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 12:38:38 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v10 10/14] hw/arm/smmuv3: Abort on vfio or vhost
 case
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
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fFke1BFFzgfh

At the moment, the SMMUv3 does not support notification on
TLB invalidation. So let's log an error as soon as such notifier
gets enabled.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 4f5186d..c9d6e21 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1151,12 +1151,23 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
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

