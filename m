Received: by 10.28.71.155 with SMTP id m27csp2119892wmi;
        Thu, 12 Apr 2018 09:41:55 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/0CX457GgR3qo5IvSq603nXt+CE8Hvbellyph1OgLSt2ZuvM1gpgn4rmO9wQB/GeU9/Lbq
X-Received: by 10.200.56.177 with SMTP id f46mr2388416qtc.9.1523551314512;
        Thu, 12 Apr 2018 09:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523551313; cv=none;
        d=google.com; s=arc-20160816;
        b=HBX4PKHBTHUNsxf83XLFEKS/YF+ymQYoKM3MpNC70JUzogxCnXrx59fJuheD6AVmXJ
         FbJl8nQPAKu55zigfJPOD5QzqfqbOed+MqvDHctJoPz4aYvSKtJ5dMGDKBxwzSfUvFD1
         IlynBF5DZol21MP2oeedMieIlpVD7QtYPRZOC1JXZIRf8nZTWlZHHX5ZYPRdBdE4gWWD
         Xb9OIoOumK/Cx+BCQlbw1tzhcoc/qgM51hnT/i6zMLuNaPU7Dy+EG/iPjnr86A9c6POX
         Szm9sx3khrkLjwDfOHxmEaMiuVLi8m3iZ0udt+F0CFtWgIlH8lunwrkwDHgLcfZicG8V
         A+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Vh/3bJViwQWa3KnjVvDjk+nT2BYsHfi8Yel5Fj19qCM=;
        b=uf0dYfUVJMgjCWMpXIfQ/5fBgF/EPYFRoNPfl8kQUaTeFXTtX3B4072Kwa82Ap/JTI
         yL7LWkaAqh6n8PwY2lvimJtBM2zpVZcBrcSuceY8ZMqBXTAqd1cWMjuQYKffS+i30G13
         nSWRwVAxHLG1e91rQQW1wWaeh3IHp+7Ah2s/GW+bfaJtqrr2wbtuL0PcKA5WcVRXmdQn
         Yd3vJdL4q0IdIBZmRFq9PDAnQpfvqxgcD1BWf2rX9cqGfRq51txrGiGhAnhPN2WxS/Sz
         upZ21BxUYPcM1xd+P12n6/qjigkySc0PU7D7JoLLino0Ngrwolq+ScBScAbntZLJxyYp
         DL2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p85si5216405qki.33.2018.04.12.09.41.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 09:41:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53481 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6fIH-00045p-Dc
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 12:41:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f6fI4-00043l-WF
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:41:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f6fI1-00014b-1i
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:41:40 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40716 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1f6fI0-00013p-Sc; Thu, 12 Apr 2018 12:41:36 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDBBB4074453;
	Thu, 12 Apr 2018 16:41:33 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A9BE1208F8D;
	Thu, 12 Apr 2018 16:41:33 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Apr 2018 18:40:20 +0200
Message-Id: <1523551221-11612-4-git-send-email-imammedo@redhat.com>
In-Reply-To: <1523551221-11612-1-git-send-email-imammedo@redhat.com>
References: <1523551221-11612-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 12 Apr 2018 16:41:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 12 Apr 2018 16:41:34 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH for-2.13 3/4] arm: always start from first_cpu
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
X-TUID: JIMrOPnt1sN9

if arm_load_kernel() were passed non first_cpu, QEMU would end up
with partially set do_cpu_reset() callback leaving some CPUs without it.

Make sure that do_cpu_reset() is registered for all CPUs by enumerating
CPUs from first_cpu.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 2f464ca..2591fee 100644
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

