Received: by 10.28.71.27 with SMTP id u27csp2519022wma;
        Mon, 5 Feb 2018 05:50:30 -0800 (PST)
X-Google-Smtp-Source: AH8x225aWsoCxNbYhl9myGb63oiBfrSDBljRsvu7vC7Nb22sCBZkuwBVz3VOh8HRboq78mqbQuef
X-Received: by 10.37.160.197 with SMTP id i5mr5179046ybm.42.1517838630152;
        Mon, 05 Feb 2018 05:50:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517838630; cv=none;
        d=google.com; s=arc-20160816;
        b=PO2URVt+lCO1Id8KnWa7P1sUR2onohUvjRCibE9M5/5YekFYbtql3tS2dohqPtNKBY
         YoLtCM7q6SzDa2yO5o7kntcG5J06SaPONuggDSta84lcSu/QouSL9VQj/3hZZ2bSy9Pc
         KMW9frzYiNqHYF2q50jXTBAndYpfHnC+fxcAB1/+bAWNA7bjxzbOQYIMTzLKlNpfcJGF
         rIdzHAOyS1QXA2bdoQXEm4ukXTkwGlhBAILcpF6wwPoOKfg0WyvUFGBJByOxzn+6RosQ
         UC8bmmxgDyOiFZ3t5CASp5efFIOfW/ins8k1wwiEoXCx6EEf485ovnVmHSKDK3KGDMM7
         0MUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=qQFQK5+mLnESjXut1tIwDy59Ly4g3mVJGL+nVtczyI4=;
        b=ITD1/A/8wEc1W5ULAHsIuDnL9HH2Zkk/kuqL42r55LBpYwf5mf2LOIc3tGg7AG4IWP
         8a3sT+P1hM86HBbc/DS1TiFz9UxfUTZMSulCHig2b6OKpEDp9RnR61owieg3jHIQA6r+
         u7eu2Sk2pTZsxXjkysVmSVIAHMDN7iMY1CXRgtMC+L2oVsIui5ybhe95xLhcxHzRS5po
         JJ8e0tsrDlB2LORWelK4f6aXWh0sO4f3aVZwSZgN5JRHkwnUJC8XKhch51LwIfJxXVg4
         3Tw7Cf0zgNTotO7HvyNyNAU2hLSLiE+1SoT9GrUORzvc/lQ7NJLG8d5ZRFN0s0va/9pM
         ON2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s68si1497535ywf.291.2018.02.05.05.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 05:50:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eihAD-0004ck-KP
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 08:50:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eih2Y-0006UB-Lr
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 08:42:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eih2V-0007K6-CB
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 08:42:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eih2V-0007JC-5Y; Mon, 05 Feb 2018 08:42:31 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 42EB778238;
	Mon,  5 Feb 2018 13:42:30 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-112.ams2.redhat.com
	[10.36.116.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA10A17240;
	Mon,  5 Feb 2018 13:42:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Mon,  5 Feb 2018 14:39:28 +0100
Message-Id: <1517837972-1904-11-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1517837972-1904-1-git-send-email-eric.auger@redhat.com>
References: <1517837972-1904-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 05 Feb 2018 13:42:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v8 10/14] hw/arm/smmuv3: Abort on vfio or vhost
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
Cc: mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5PCy8CCPurpS

At the moment, the SMMUv3 does not support notification on
TLB invalidation. So let's abort as soon as such notifier gets
enabled.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index da05d47..0753208 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1044,12 +1044,23 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
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

