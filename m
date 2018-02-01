Received: by 10.28.71.27 with SMTP id u27csp1311104wma;
        Thu, 1 Feb 2018 09:34:25 -0800 (PST)
X-Google-Smtp-Source: AH8x227/tqPq0FBdo816kMQA358G1+uyAvbsjEnZf+SwZfayjNRxP4XmzVy3Y4YstYjqx977zGDi
X-Received: by 10.129.155.78 with SMTP id s75mr25554318ywg.358.1517506465236;
        Thu, 01 Feb 2018 09:34:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517506465; cv=none;
        d=google.com; s=arc-20160816;
        b=kt6FKuCrgGg8IUVn9Mgh7KcCu2JrLczk9m/ljoFBT8waezcSJuMVn+0zzDJYubDSEk
         jXQ2mZs5vbUJESQTBtTA6ZFoWOk7SsrdD834RTVDNJHGl+ENEHLjJkNVjhuJ4vm8u9yX
         3AXN6s+ccgItGz5Br+yN0Q8Oy4/wlWB02imaJq6bFRFtxLxcCVxT6Qxdvi4feu5rbHvL
         A40K/fav8rp9YFNVegTLG10jd33fCfj3x2bbDfGbMVAqEUgXyz1O46k7aA2EgeAmdkHN
         zfGSIQfe0BRt1EeqFafgD5RLZuuf1Qa/pvdQRh6vP1+9D2mPDX6/tOMBJfZ6hIEXrbxZ
         XPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=4jOP9V/oujNJIsZE09Gt8WUabVq+sA1+r9L5Y6dLLyI=;
        b=iz67UOa6Vp+b8u9uUVtu5TsGlUyGJD1iFzjd4gu9ZxsQBwIxsUNPBRBXA3XGvWAjuN
         GXllYuxkVz7a3hiB+cRGNiBdpJnR52qQh4ZZ9+LtWbCTTbo4sj5e9kdJUtVoierB8aPV
         rpn3c2ud7ItokRU279ikGYh1Xfh+x30d2B8neo+bWtIGy1Ensffd1Z52/i6HSavGQOA9
         7sTghO/1XnftHQ8ELup4ZuRduGX5jWjhNESVY2LpglNBsZvURIOXjh6EehZZHiK+ICOu
         4MeP+ylI68MLixa/mVDLkp8WZa7LowcAfyAVHVUA3x9JuIBdY+hoFV0a3iDFztG/DMLZ
         MLiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w130si12035ywg.719.2018.02.01.09.34.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Feb 2018 09:34:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ehIki-00008L-O2
	for alex.bennee@linaro.org; Thu, 01 Feb 2018 12:34:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ehIgW-0003xc-SL
	for qemu-arm@nongnu.org; Thu, 01 Feb 2018 12:30:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ehIgR-0005wa-Va
	for qemu-arm@nongnu.org; Thu, 01 Feb 2018 12:30:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48440)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1ehIgR-0005wG-PK; Thu, 01 Feb 2018 12:29:59 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0CC8C5FB28;
	Thu,  1 Feb 2018 17:29:59 +0000 (UTC)
Received: from amd-seattle-09.khw.lab.eng.bos.redhat.com
	(amd-seattle-09.khw.lab.eng.bos.redhat.com [10.16.184.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 015675D9C7;
	Thu,  1 Feb 2018 17:29:44 +0000 (UTC)
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Feb 2018 12:28:11 -0500
Message-Id: <1517506091-10396-4-git-send-email-wei@redhat.com>
In-Reply-To: <1517506091-10396-1-git-send-email-wei@redhat.com>
References: <1517506091-10396-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 01 Feb 2018 17:29:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 4/4] tests: Enable xhci test arm/aarch64
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yIOsi4fyoaIb

Signed-off-by: Wei Huang <wei@redhat.com>
---
 tests/Makefile.include | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index e28277c..a79a7b8 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -366,10 +366,12 @@ check-qtest-arm-y += tests/test-arm-mptimer$(EXESUF)
 gcov-files-arm-y += hw/timer/arm_mptimer.c
 check-qtest-arm-y += tests/boot-serial-test$(EXESUF)
 check-qtest-arm-y += tests/drive_del-test$(EXESUF)
+check-qtest-arm-y += tests/usb-hcd-xhci-test$(EXESUF)
 
 check-qtest-aarch64-y = tests/numa-test$(EXESUF)
 check-qtest-aarch64-y += tests/boot-serial-test$(EXESUF)
 check-qtest-aarch64-y += tests/drive_del-test$(EXESUF)
+check-qtest-aarch64-y += tests/usb-hcd-xhci-test$(EXESUF)
 
 check-qtest-microblazeel-y = $(check-qtest-microblaze-y)
 
-- 
1.8.3.1

