Received: by 10.182.158.201 with SMTP id ww9csp730445obb;
        Tue, 17 Nov 2015 05:43:48 -0800 (PST)
X-Received: by 10.31.52.213 with SMTP id b204mr3846816vka.88.1447767828912;
        Tue, 17 Nov 2015 05:43:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v68si2727968vkd.25.2015.11.17.05.43.48
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 05:43:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZygY0-0003pR-FR
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 08:43:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZygX0-0001s3-Kq
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 08:42:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZygWZ-0004B9-0a
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 08:42:46 -0500
Received: from mail-lf0-x232.google.com ([2a00:1450:4010:c07::232]:35704)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1ZygTV-0003ad-Lw; Tue, 17 Nov 2015 08:39:09 -0500
Received: by lfdo63 with SMTP id o63so5540216lfd.2;
	Tue, 17 Nov 2015 05:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0FXTsI4MkuxsCS5JDhXADVjlbu+KIRyL1rZk0cMwm/8=;
	b=bKUIjyyV8D2o5kpPmMLSZ1JN52jfbbY0AIKVL1/h/7uEqIbcylCiuOJtsAOLyyA0dp
	EllHPrbU9hfwyBT4iF5srwjcoIYf0Beh35ZcAOVR/mFUl5JUoHhO1lt9toRhPV/RGz4X
	sWFbWO4LBaX/aB/Mv+vInjQvjjUEHDSPPP02f2JIE7rw3DMbdiMPtpDIqRaBhI0uNCa7
	G61iX+8ZoLQvtkDLZ2yT0yVTgATqgEA4v4WNebDrb1Kd/TcmFxn8vATfmHktt8/z5N+m
	YQNBza9iwkr69khZJmaV357cRtQTjSHWmthCZ0fwaPZi8UHSpcSMxTABMG23jiSKy/E+
	DfoA==
X-Received: by 10.25.135.136 with SMTP id j130mr19732975lfd.95.1447767549046; 
	Tue, 17 Nov 2015 05:39:09 -0800 (PST)
Received: from sfedorov-laptop.smware.local ([213.243.91.10])
	by smtp.gmail.com with ESMTPSA id
	u12sm6342000lbk.45.2015.11.17.05.39.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Nov 2015 05:39:08 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 17 Nov 2015 16:38:47 +0300
Message-Id: <1447767527-21268-3-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1447767527-21268-1-git-send-email-serge.fdrv@gmail.com>
References: <1447767527-21268-1-git-send-email-serge.fdrv@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c07::232
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-arm] [PATCH v2 2/2] target-arm: Update condexec before arch
	BP check in AA32 translation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: liiuQGKhlqnY

Architectural breakpoint check could raise an exceptions, thus condexec
bits should be updated before calling gen_helper_check_breakpoints().

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
---
 target-arm/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index 739f373..5d22879 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -11374,6 +11374,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
             QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
                 if (bp->pc == dc->pc) {
                     if (bp->flags & BP_CPU) {
+                        gen_set_condexec(dc);
                         gen_set_pc_im(dc, dc->pc);
                         gen_helper_check_breakpoints(cpu_env);
                         /* End the TB early; it's likely not going to be executed */
-- 
1.9.1

