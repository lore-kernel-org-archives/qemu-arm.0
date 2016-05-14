Received: by 10.25.208.137 with SMTP id h131csp443828lfg;
        Fri, 13 May 2016 22:39:44 -0700 (PDT)
X-Received: by 10.141.28.204 with SMTP id f195mr19872843qhe.59.1463204384387;
        Fri, 13 May 2016 22:39:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g82si14390956qke.151.2016.05.13.22.39.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 May 2016 22:39:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b1SIh-0000s4-O7
	for alex.bennee@linaro.org; Sat, 14 May 2016 01:39:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>) id 1b1RnI-0005c4-BI
	for qemu-arm@nongnu.org; Sat, 14 May 2016 01:07:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>) id 1b1RnF-0005q8-3K
	for qemu-arm@nongnu.org; Sat, 14 May 2016 01:07:16 -0400
Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241]:35104)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>)
	id 1b1RnE-0005pL-FF; Sat, 14 May 2016 01:07:13 -0400
Received: by mail-pa0-x241.google.com with SMTP id zy2so11703339pac.2;
	Fri, 13 May 2016 22:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rbkQCPt2btdpeH5U+WDwISbipdE44lF+PCIv1kHxTfE=;
	b=bG8J0heHt3X+EuoJ8VyXBNFXeFEsiULhhSDFB8zviIS4AgpvNn+jVXVjlnc+TXauG5
	HrNXHXeIuHyX6l1xATVeD4TUw3N0+pimQ6TE9FXfAFS7ZWy1aIjeVWYIg2MEhAslXuMR
	ym7tfdxW/l23hFotL3x0kEtxChHeMxxr7k8to7Lu3OxKLpAIOJK9QkTh+Qu7acrKenEJ
	d+809XHAtcP/ACPa4HRgRIQo+7kyzcWSjvZekqR6S43F73Ftc2iaoAG+ncJUDtQAyVI3
	Vj5xLDffKr/cXGGQUQUpMDAUR4LxJqqqdh1rVK7Ty8iGYw3FYTT7DxwYOMVkvVJqv+3/
	3yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rbkQCPt2btdpeH5U+WDwISbipdE44lF+PCIv1kHxTfE=;
	b=RXKGIo4z4OBxUbYhhs444I/mYNh+HBwIdehMylB5Mg9rUuH2OCPv3JQsZ9eRINFec+
	RpEXhaWGwYDT5t2b7i5gCPmXOEPMyxNBFMt541QuJbuiSl6R/s+wP6vqqVxs18V/j1+j
	PG7n3dJ5eZUUUeCegen55zQ6tw32NIFnWZdq1JBCkIaot8FYCBhu3J/xk9oUlenCYpWe
	ORSsVz2MLnMeYHDYzLLBNUKgybWbDlOKFJffddGOyru7UOroS/65nuksTBJ08/9RYTrt
	mMRh+oPHdfdIHBrYsPo40DyeNnjHPQ1qfT+nqVTJtwjw/OaliAfdm8Ib01mHHP726th1
	1zlA==
X-Gm-Message-State: AOPr4FVYgfEmGNp39iHaP67GyvT0TV6I/VdPqoV7X3nJam7VSi/saxELoQg/kGm0wFbayQ==
X-Received: by 10.66.154.233 with SMTP id vr9mr4353883pab.69.1463202430263;
	Fri, 13 May 2016 22:07:10 -0700 (PDT)
Received: from Tari7Braves.flets-east.jp (p3b93c7bf.tokynt01.ap.so-net.ne.jp.
	[59.147.199.191]) by smtp.googlemail.com with ESMTPSA id
	b19sm31118202pfj.41.2016.05.13.22.07.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 22:07:09 -0700 (PDT)
From: Tsung-Han Lin <tsunghan.tw@gmail.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Date: Sat, 14 May 2016 14:07:03 +0900
Message-Id: <1463202423-19943-1-git-send-email-tsunghan.tw@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::241
X-Mailman-Approved-At: Sat, 14 May 2016 01:39:41 -0400
Subject: [Qemu-arm] [PATCH] target-arm/helper.c: fix access rights of SP_ELs
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CJl509NcSzX7

Fix the access rights of SP_EL2 and SP_EL1, which should be able to be
accessed from EL2 and EL1 respectively.

Signed-off-by: Tsung-Han Lin <tsunghan.tw@gmail.com>
---
 target-arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index a2ab701ca5c2..8d4b03b5141b 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -3326,7 +3326,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, sp_el[0]) },
     { .name = "SP_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 1, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_ALIAS,
+      .access = PL1_RW, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, sp_el[1]) },
     { .name = "SPSel", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 2, .opc2 = 0,
@@ -3526,7 +3526,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .resetvalue = 0 },
     { .name = "SP_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 4, .crm = 1, .opc2 = 0,
-      .access = PL3_RW, .type = ARM_CP_ALIAS,
+      .access = PL2_RW, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, sp_el[2]) },
     { .name = "CPTR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 2,
-- 
2.7.4

