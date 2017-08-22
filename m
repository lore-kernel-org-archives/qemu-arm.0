Received: by 10.223.188.70 with SMTP id a6csp4922729wrh;
        Tue, 22 Aug 2017 06:15:32 -0700 (PDT)
X-Received: by 10.55.93.67 with SMTP id r64mr855125qkb.194.1503407732742;
        Tue, 22 Aug 2017 06:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503407732; cv=none;
        d=google.com; s=arc-20160816;
        b=eFswV7cojp2iywIRvzQ7xj46k2Wx94odn68fQ3NktEy59kf5mWRHuoTwFuy6945hVN
         k5D9seeiuHqmKCE5L6sV4uOXE314x7FLcG6SjOc/Kh1ik/ZtV0H492ib2NPLykDaa37/
         F8Hqa99EW80UfMVnbpV8yYOAS7mx7hKWHqq1vjwrZEUlFm7WaxjoEhwnCyur7ZRZRUkg
         MZfD6qB1MkGQp3HSvzdfxlZng7Ui70CAAYZTeeIPhpyEGIw2d54fCEN6VC2JFZ85gn1M
         zmU9utByY+2KAiObcgdp80OvN7njBSWua4hVwjlhs3fB2pYu9oK/wkgAs6ZYpRmK5gLS
         Tn4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=Q3rxw9GemBOLjyPtPjxINuYxWS1vhBNSlLSDviVMJYc=;
        b=nne5HdrGdnPw5bYG0gcUzbHG57JXAPuoveS5CXgGJR4LLepQiHSpsdwKR9F2KoqFpO
         iiAOBAWb2yb3LQSd2Zcii1kUNsG3i0+xDuy7wHHI3Wv05qX44eETVC0N2UQcIz/yU+Xl
         iSXVhU/CzboDKYGnEbhmYPAr0+Cmjml377vMLTMm8Mqaq99sSrT2iMReIeKmesZ/e7LX
         2py840C1gIXHL/6YryaxKNvzrRviaCHRLlTvezjhExdirOLosqDvP+gVAPZo1se1tKJi
         jBMBj1HWFw+i1NU3fyZY6cG51CKxkhTRRfLLjOSK46cEFZ24ctd2MkLzP9Lvu2yfQPU9
         CQ7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f56si13786677qta.386.2017.08.22.06.15.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 06:15:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dk91m-0008Qd-It
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 09:15:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dk91d-0008Lo-7x
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 09:15:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dk91Y-0002sC-Sk
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 09:15:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39144)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dk91Y-0002rq-MQ; Tue, 22 Aug 2017 09:15:16 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A9F161479;
	Tue, 22 Aug 2017 13:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5A9F161479
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0778C17F55;
	Tue, 22 Aug 2017 13:15:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 15:15:12 +0200
Message-Id: <1503407712-9894-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 22 Aug 2017 13:15:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/arm/digic: Mark device with user_creatable =
 false
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
Cc: Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vySzta2wRwHL

QEMU currently hangs completely when the user is trying to do a
"device_add digic" on an unrelated ARM machine like integratorcp.
Looks like this device is not meant to be hot-pluggable at all, so
let's simply mark it with "user_creatable = false" to avoid the hang.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/digic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/digic.c b/hw/arm/digic.c
index 94f3263..208dfb3 100644
--- a/hw/arm/digic.c
+++ b/hw/arm/digic.c
@@ -101,6 +101,8 @@ static void digic_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = digic_realize;
+    /* Reason: Hangs QEMU when trying to device_add this directly */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo digic_type_info = {
-- 
1.8.3.1

