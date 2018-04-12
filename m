Received: by 10.28.71.155 with SMTP id m27csp1609991wmi;
        Thu, 12 Apr 2018 00:46:55 -0700 (PDT)
X-Google-Smtp-Source: AIpwx499WGg1KzU+fLFzTl1pnTxynwJK/kzZzXt4hP65sWM5vpGmR7YRtuG9lCmaJbYx7kcZsEWd
X-Received: by 10.55.109.4 with SMTP id i4mr2755731qkc.104.1523519215269;
        Thu, 12 Apr 2018 00:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523519215; cv=none;
        d=google.com; s=arc-20160816;
        b=dGSepd3PfJXHAxoUrFz+GiB5GBmvp4jlUtINELLvBqor+Vyrw9lFPa3ZyTQqyh+ZRM
         zMNcPhWqhoWEOhieVXelVC5lk6gOsTa8Cxn9Vm5ZPW1QI/IUBk9mCCTADRABKxxq7Yz3
         CJ2Bftypo/zhkvwniHJa0yUYGTFxYnz7wtvL0J1tCg8wgcldMBI6QU+YsVHk2hhRaWG/
         eaILbVp3YHRa4XoUCYzk86YlIJ7WzVnTwhmWPNeXnOyVlHmVCQzVA4h8AmIBQbGeWokf
         XBdDvKtVgl3Z+BzrFcf8i876RzFhIYESCCHx4WyNdwqqlh75Ran7qo2/hyR1zSBbAUQD
         EEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=fjg7PyCmfI42JtQMvcAxdHy5T7kiSz/Jygs+3gYqk0k=;
        b=bN5jPmGiLtvvH8Gs9XjnGgjLMcUtz1BYgKGHV+3O7tDFTMTTT7mW4vZlYkMU45M6Ue
         +r7ZlU2EbOjXJrB98rRpDThY6cVASuR/FsKoViEVxSL5mZPAlag5z1/0wNGoXIwqibPF
         qEWOL98mpmPNUSKIhQl4UpEsIO6TSAYECswe0uxDbfw2UzhKC2J3J2fP8zAVfHd4Sl3S
         l8xEW/fGDuXn6kXj59gqtDNZi/vP3P+zUBt94ZNPYwFNO/peQ/HtG/93HJ/Ax8zl7aYy
         f50RDSddKjfxnHhxVqVVME6pxasVz6fgLHkk52H+k3huQX/JZTlAeEnpbj3FRjTyJJOt
         /yHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 70si1447856qta.152.2018.04.12.00.46.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 00:46:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6WwY-0006ON-Mx
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 03:46:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6Wop-0006qF-SH
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 03:38:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6Won-0003HE-60
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 03:38:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34388 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f6Won-0003Go-1V; Thu, 12 Apr 2018 03:38:53 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CE0D4075A67;
	Thu, 12 Apr 2018 07:38:52 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-192.ams2.redhat.com
	[10.36.116.192])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2DDF215CDC6;
	Thu, 12 Apr 2018 07:38:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Thu, 12 Apr 2018 09:38:01 +0200
Message-Id: <1523518688-26674-11-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 12 Apr 2018 07:38:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 12 Apr 2018 07:38:52 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v11 10/17] hw/arm/smmuv3: Abort on vfio or vhost
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
X-TUID: C1r0Dmt43djZ

At the moment, the SMMUv3 does not support notification on
TLB invalidation. So let's log an error as soon as such notifier
gets enabled.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 4be676b..6e0d7ad 100644
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

