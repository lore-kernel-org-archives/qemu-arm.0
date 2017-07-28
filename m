Received: by 10.25.44.15 with SMTP id s15csp29279lfs;
        Thu, 27 Jul 2017 22:37:08 -0700 (PDT)
X-Received: by 10.55.46.196 with SMTP id u187mr3205283qkh.156.1501220227805;
        Thu, 27 Jul 2017 22:37:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501220227; cv=none;
        d=google.com; s=arc-20160816;
        b=N5+oriPQ0/orRePqtDSww+/SfTALoXJp0nnJJvsbzD02tFmVrTlQ9FOGxa/IHBg7J3
         /gf+y3vJLjg0Q8lc9b4ozExXB0dTOvguLWXB+/RVFJw7ltEMZMgxz309JmG1SyMj7Kmo
         NbLJgp1zsETxK+1ileCHkU/9JQmoVLmGQ32SwPHClyf99GY3/ous8Xa4OSvSGzaK8nke
         TMj/v/QWAdMBH/HwG9ts+0Q28r+CZFAXXb2SMXjGsSlWJK4t2ZyKHEIpyjDmd4oZ078V
         h2fK8vp6W/bma98+jgC/cM0PRWeKGtcYqNZVUQEvnw2I5kWQnWg7zeWGF5DdsA8LPgOD
         FNGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=5cmeS5eQ5lUiIR4OIGCUylj6OJg0ex+IV26QCYh2rnc=;
        b=ERn1CLRBs9iggTYRmkodTc6KRfG1lkoALV6A1ysc4WQB8iskZ3KlSXvZ81WiajQWm2
         RvhyuvXw5r99cZcdRcZZzahmQX3rvY0Mjal3hD239qE2yTdzK8CLTHSJheKygTaH15xf
         LqBv44SZRWpcSLkThaDt1E4T8mzaJ25F8MitBqRGPRa6LvsNp3hryOq2/eXqFkm3nJ90
         xs5ZpR0mPnf8G/b14p8WDMGgWjmKR9IHaaxdkmasZ5aDHLHKujVx4eqELTykh+PFx2jy
         pxbzHxqaBeBegW4TwGD/hLT2roJRzJoSq1RTc7ArJurJDgNOzUs5S/Gy692x5LvxDHmh
         7oNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ZHhEojZb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 76si17962698qky.11.2017.07.27.22.37.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 22:37:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ZHhEojZb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45971 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1daxxR-0004KS-3W
	for alex.bennee@linaro.org; Fri, 28 Jul 2017 01:37:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwx-0003xv-TC
	for qemu-arm@nongnu.org; Fri, 28 Jul 2017 01:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwv-0002wU-4k
	for qemu-arm@nongnu.org; Fri, 28 Jul 2017 01:36:35 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33868)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwp-0002r5-RA; Fri, 28 Jul 2017 01:36:27 -0400
Received: by mail-qt0-x242.google.com with SMTP id i19so11806972qte.1;
	Thu, 27 Jul 2017 22:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5cmeS5eQ5lUiIR4OIGCUylj6OJg0ex+IV26QCYh2rnc=;
	b=ZHhEojZbYZfbrXUR658g+d7dKiO9FOrYD43U/ik2XHA0o5xFCShZJ/veFSw45D4E3r
	QABLsou/qb9cgawQYFFj2NBBcFpSDlZ2Z48UDsBnpeH4TCumRWA7O1T9Rv/UB0JkdGZ/
	6MkV2pXLdxpTZaTUSjW085CKE9TjhehZUbwhbJZsa1CCMuMPSK4lwsptm/EkP0eM+efo
	9WMOOjk3dS5jXIrpFxhfQ1G+7P2ZR2i4Xs9k7+JPQMq07Og16/nNXtLB2FmnFY8gWvq0
	7WjQS02GQv2b5CC+hzfeE0L28xFdtR7cIwfnUngSX/L4jBOAB8NMp187CHkX+IQudtkb
	FDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=5cmeS5eQ5lUiIR4OIGCUylj6OJg0ex+IV26QCYh2rnc=;
	b=lYIR/8VqWioGj9+G+VLKJf48zWK+P/1tTqYA7XPBBsQFPaZz1cmOU3UFrH4JGsFgMK
	MOfA2Q3tVAsXnrO0oWJqna3jhaW2P9jK2fLKijxq3QPyMRQbJSnTkt9n2jMLnmgTkBdc
	ZIMph48tj6baXAx21WWpmpypeHiCa20u7g89tSG3xgRbZBlBedQA4mG+QPCqLhIfe1XG
	RhapmdohkQ3dWDVOIXh0N+H6J8NBm0vzbqgbDPpiAk/7tz90c32yw8b6HOOlg1gNKw2Z
	8Wyd1+dXegnyon9G6gC9xOxcHdH3gn/HNzmUtmeLcmpBkjP7kbTGpeM0D1egP0Dzk9mq
	9F4Q==
X-Gm-Message-State: AIVw111YGXWDKNdReYcNjMwRwxEhO9d3V9aGHV30gZvbJe/1ck9buZrh
	e1IVB9Lkdaf8Gw==
X-Received: by 10.200.4.4 with SMTP id v4mr9364624qtg.23.1501220187340;
	Thu, 27 Jul 2017 22:36:27 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jul 2017 02:35:25 -0300
Message-Id: <20170728053610.15770-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [PATCH 02/47] MAINTAINERS: add missing ARM entries
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H+sRMdgZVXtp

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 972118e70b..795f89f709 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -120,6 +120,8 @@ F: include/hw/cpu/a*mpcore.h
 F: disas/arm.c
 F: disas/arm-a64.cc
 F: disas/libvixl/
+F: default-configs/arm-softmmu.mak
+F: default-configs/aarch64-softmmu.mak
 
 CRIS
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
@@ -380,6 +382,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/char/pl011.c
+F: include/hw/char/pl011.h
 F: hw/display/pl110*
 F: hw/dma/pl080.c
 F: hw/dma/pl330.c
@@ -402,14 +405,19 @@ F: hw/intc/arm*
 F: hw/intc/gic_internal.h
 F: hw/misc/a9scu.c
 F: hw/misc/arm11scu.c
+F: hw/misc/arm_sysctl.c
 F: hw/timer/a9gtimer*
 F: hw/timer/arm_*
+F: hw/timer/armv7m_systick.c
 F: include/hw/arm/arm.h
+F: include/hw/arm/armv7m*.h
 F: include/hw/intc/arm*
 F: include/hw/misc/a9scu.h
 F: include/hw/misc/arm11scu.h
 F: include/hw/timer/a9gtimer.h
 F: include/hw/timer/arm_mptimer.h
+F: include/hw/timer/armv7m_systick.h
+F: tests/test-arm-mptimer.c
 
 Exynos
 M: Igor Mitsyanko <i.mitsyanko@gmail.com>
-- 
2.13.3

