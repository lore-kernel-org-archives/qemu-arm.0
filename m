Received: by 10.28.4.212 with SMTP id 203csp179743wme;
        Wed, 18 Apr 2018 07:29:34 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+KCtRHKOGtt1NYk+EYS1piUqVhSx1M82BHKn0qzbl19aNbijPHIF5GXURJ2GlFkzuG549V
X-Received: by 2002:aed:3bcc:: with SMTP id s12-v6mr2426192qte.83.1524061774686;
        Wed, 18 Apr 2018 07:29:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524061774; cv=none;
        d=google.com; s=arc-20160816;
        b=P0M0a3Ek2Eohi4HMvmebY/dfhvpAWBSeHC1HYc2P8Grt8rigN6bYBE20+kifxK27XN
         GWeg5WVgvpniXvi93ZBFJziL7Jx4wyPs3kl+dxQ9oX3+BYzScsn0px4ZecX7/p4EVioQ
         qgC2lJAu0ehYl8iplkSFz/WK1jBHikomw7I37TQDhyMzT8f3pBjH0SqRTs1OTcbK7sSB
         U+YfkluhW5c3oLYGQihrmjSxS3OHr9l6RrJxRQuEpwNA0spZ+NlTpf1LgvSArRvBbT4y
         aGlr8g6zGNAzb998qvyV1uCJlUY1punEMrrxA0bEz8snOPtHTGuYgLlc1MnJFqf56+Vg
         TKqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=DiwODCoZalfaR3l0uaSXEjkUgLih5Ag8IFxTI19efwE=;
        b=piKVW8gm33T81UH4TOcmH8kbtR1RieQIRZDKXQUT6tV55i2Rtw0JzEQJWb/6hfBoUE
         2Aa/FPKXh6srhqJRoF6wagluSLr30MsPsrNEh9HGHXoU+EK6ynXZo2S8zhCMeXTYWziK
         wxGtSx7b4gV6h2QZPYkae1CMlHSTNFhATOMkpQTmA6FRPJMcMpeOAznPX3CK3WOFrge0
         k988JhCPwTYZZ9Z+vasKgoE4rR01ZXWPdJuVxbruo6tFTI+5o9uLtrDGa0hfahlT3+tB
         YHLizYj1jAsFTse8sS6A/jzOjV6bBB/AD2w2QEstd4cudFNdjZP55xy9ZAbcYsini50A
         gAMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z56-v6si534966qta.94.2018.04.18.07.29.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Apr 2018 07:29:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59912 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8o5W-000707-4Y
	for alex.bennee@linaro.org; Wed, 18 Apr 2018 10:29:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f8o56-0006jN-Bp
	for qemu-arm@nongnu.org; Wed, 18 Apr 2018 10:29:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f8o53-0003tk-M0
	for qemu-arm@nongnu.org; Wed, 18 Apr 2018 10:29:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59900 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1f8o53-0003tZ-HK; Wed, 18 Apr 2018 10:29:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1ED31402314E;
	Wed, 18 Apr 2018 14:29:05 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57C352166BB2;
	Wed, 18 Apr 2018 14:29:04 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 18 Apr 2018 16:28:01 +0200
Message-Id: <1524061685-83305-2-git-send-email-imammedo@redhat.com>
In-Reply-To: <1524061685-83305-1-git-send-email-imammedo@redhat.com>
References: <1524061685-83305-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 18 Apr 2018 14:29:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 18 Apr 2018 14:29:05 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH for-2.13 v2 1/5] arm: always start from first_cpu
 when registering loader cpu reset callback
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QXtYd8bz5hZV

if arm_load_kernel() were passed non first_cpu, QEMU would end up
with partially set do_cpu_reset() callback leaving some CPUs without it.

Make sure that do_cpu_reset() is registered for all CPUs by enumerating
CPUs from first_cpu.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 26184bc..9ae6ab2 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1188,7 +1188,7 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
      * actually loading a kernel, the handler is also responsible for
      * arranging that we start it correctly.
      */
-    for (cs = CPU(cpu); cs; cs = CPU_NEXT(cs)) {
+    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
         qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
     }
 }
-- 
2.7.4

