Received: by 10.25.21.156 with SMTP id 28csp434970lfv;
        Thu, 21 Jul 2016 07:34:42 -0700 (PDT)
X-Received: by 10.200.47.92 with SMTP id k28mr81799983qta.50.1469111681500;
        Thu, 21 Jul 2016 07:34:41 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l32si5159476qtl.100.2016.07.21.07.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jul 2016 07:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41179 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bQF3g-0004I0-N7
	for alex.bennee@linaro.org; Thu, 21 Jul 2016 10:34:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1Y-000311-HZ
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1T-0003ig-Va
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:28 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:33553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bQF1T-0003hy-Nb; Thu, 21 Jul 2016 10:32:23 -0400
Received: by mail-lf0-x243.google.com with SMTP id f93so5656648lfi.0;
	Thu, 21 Jul 2016 07:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=NGnoNi8Yh7MRdXAL7gP6Pc4iAbAv6yECZcUx3na12FA=;
	b=j3/Gb79mSsL1sUIpuqSYHkZCo88k5YaRSrVXlpy+WIvNr0fSyPlTfxRt8FRXdP+FMW
	AU6qt8oEtSBluP3mFcYqmAwdOxWGKcHBmx7vQCEYkbpXYISljXGlbvc38FivtgkVUmyn
	VOry77pOEBX3Whz+bCZOrxnR8oAgrr5ve/VQOiRDRIVhLxh9nPC+rabwCgManA3Yt7rB
	eOHbj1ifyxULaqwsvc6W5DOv/dnXVjFveLPaW9aX40IqnL1nKIk5KDYJ/jxUf2o85Mcm
	eH6IaIw3rsIQZbLGfuNLRHduWNbgvnUvzgFp0xE6erg6IyPtJnokCeW20YZ7/0m9DBme
	gigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=NGnoNi8Yh7MRdXAL7gP6Pc4iAbAv6yECZcUx3na12FA=;
	b=E6Js3T0QqE8rebL0mcXZCDi3BhdBnIDYV0/q8COt6jRzOxU2F90ChwCMkNHcQ0ndvE
	ccl0Dtx4HMfqGijAOn1lSaMlVcYyMAOtHL62p5aF3AfAnz2SDbKykiwGVkbQjtL/QmIl
	AyxikHMHJkOfM2JKgMrCfq0/mWc95qPhhSrTB3daQgQMDlpOfOQkMTq4B8Xk8AlTrmv1
	VWhJOaonPh6FXFZjHIfQx/EUoMA+QR9DMNZzvMg7mav5Pm1S1NCjTdSWWFauxtNDrAKK
	dPHfpgQbdtb9+he4CBD/Gdtr7Za/TE7ksfyokcEvME7iXoWnrO76S8a7tKHX+08rafmx
	Sa/g==
X-Gm-Message-State: ALyK8tLDLEOVJ5YWXAJLO2OByL7rWjXVAKFhVxZz5KTUdgIgdTbmk93nX6VLyoCQyX+zuQ==
X-Received: by 10.25.0.149 with SMTP id 143mr6983751lfa.71.1469111541502;
	Thu, 21 Jul 2016 07:32:21 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.gmail.com with ESMTPSA id
	c12sm1887932lfc.40.2016.07.21.07.32.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 07:32:20 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jul 2016 17:31:12 +0300
Message-Id: <776fdb54f6bbd9050f68136b646e8080eb77a45b.1469110137.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-devel] [PATCH v15 01/15] hw/ptimer: Change ptimer_get_count
 to return "1" for the expired timer
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f4RzS78xiWGj

Software shouldn't see counter eq to "0" before timer IRQ trigger happened,
as it could be wrong behaviour for some of the emulated platforms. In order
to maintain deterministic behaviour, change returned counter value to "1"
for the expired timer.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 30829ee..9dc2bb0 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -96,7 +96,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
         if (expired) {
             /* Prevent timer underflowing if it should already have
                triggered.  */
-            counter = 0;
+            counter = 1;
         } else {
             uint64_t rem;
             uint64_t div;
-- 
2.9.2

