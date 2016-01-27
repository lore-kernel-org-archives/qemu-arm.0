Received: by 10.25.159.19 with SMTP id i19csp60179lfe;
        Wed, 27 Jan 2016 15:44:03 -0800 (PST)
X-Received: by 10.55.79.134 with SMTP id d128mr38745851qkb.73.1453938243046;
        Wed, 27 Jan 2016 15:44:03 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z66si9081369qgd.22.2016.01.27.15.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jan 2016 15:44:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOZko-0004jw-L1
	for alex.bennee@linaro.org; Wed, 27 Jan 2016 18:44:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aOZkG-0003oF-FZ
	for qemu-devel@nongnu.org; Wed, 27 Jan 2016 18:43:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aOZkF-0006Sn-K7
	for qemu-devel@nongnu.org; Wed, 27 Jan 2016 18:43:28 -0500
Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244]:36604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aOZkF-0006Sa-D5; Wed, 27 Jan 2016 18:43:27 -0500
Received: by mail-pa0-x244.google.com with SMTP id a20so1046654pag.3;
	Wed, 27 Jan 2016 15:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uaKZiIAsZFXLvpgE1q7dUucx9LE6+IxA7M/UqwGahFA=;
	b=aBRTlH0gEcV/hnAdWL9oaQIbLV0crFfF+QjlIxSXX+NbhSyR8yMmHPmjf4bZeVsYs2
	HvAkP4lmLRaPcwcYpZRp6tAeSFBjkzjg4wmbCId/DFJuu5qDemagyRwy3YdcjDRIAx/G
	haduXAU3pIuCSc+8KFRvpwSuV06xZxcwEpw6PYWeQ1BVH9QxplZc+EPtbxVmh5fIaZW8
	bKoAcPjfr+tUgF8LYt3wHZk24+EiNQQ7yokJABL/L+gW/x0Awb5wVkqR1IyOCJkL1/a5
	4YQgSrJmOaS8vVkuPzFgQ0FWtFy66hVAYTWpXAv5EGSOpT2tpEHEY+xk40Or2sfrcqEM
	OvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uaKZiIAsZFXLvpgE1q7dUucx9LE6+IxA7M/UqwGahFA=;
	b=dJEQrUj8UddmFk6B8sIPEem9xYZRbU7nOpf2Xt07vCAOZ0CqKhoymOGY7obzoz2nhN
	2BQegr8+Ubl5FQRd36Jy+zU48XiVY9DB6p8ixhJv6m0+GzexWhz1ZrKddqT/M0Y3fFvD
	LKVmwG/MjpbDpwVFc6EMjBKa8bG8BiH9ank9P9oKOECfV07FK2gpdoBdUkYC6JmOj4Bz
	rGlc53bDbYfj5up5OEOpC6UCcfFzBsFuAlVzLNi56eeHX20BnY6HR0O86TVzCLvzxnOh
	YUpDcNmUFTtWa5Lu5gk0l1QOnI91c8VtPBdoxpEsZ9ArKKmNkK9Al9GM2qmenB3KcscX
	tlIQ==
X-Gm-Message-State: AG10YOR95cOpEq2Shxs5B/UrCGmiZ2fxcP+RuTGeglJRLvW/812LKJZYdhYu8Q9P3Pltug==
X-Received: by 10.66.90.166 with SMTP id bx6mr47110547pab.75.1453938206701;
	Wed, 27 Jan 2016 15:43:26 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	s65sm1943243pfi.12.2016.01.27.15.43.23
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 15:43:26 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Thu, 28 Jan 2016 00:42:51 +0100
Message-Id: <1453938171-13665-2-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453938171-13665-1-git-send-email-edgar.iglesias@gmail.com>
References: <1453938171-13665-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::244
Cc: edgar.iglesias@xilinx.com, qemu-arm@nongnu.org
Subject: [Qemu-devel] [RFC 1/1] hw/arm: Setup EL1 and EL2 in AArch64 mode
	for 64bit Linux boots
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9xkN8Jov+wLL

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

When booting Linux on AArch64 enabled cores, setup EL1 and
EL2 to use AArch64.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/boot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 7742dd3..d05a998 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -488,7 +488,9 @@ static void do_cpu_reset(void *opaque)
                  * adjust.
                  */
                 if (env->aarch64) {
+                    env->cp15.scr_el3 |= SCR_RW;
                     if (arm_feature(env, ARM_FEATURE_EL2)) {
+                        env->cp15.hcr_el2 |= HCR_RW;
                         env->pstate = PSTATE_MODE_EL2h;
                     } else {
                         env->pstate = PSTATE_MODE_EL1h;
-- 
1.9.1

