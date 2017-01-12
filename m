Received: by 10.25.205.13 with SMTP id d13csp1109724lfg;
        Wed, 11 Jan 2017 23:04:42 -0800 (PST)
X-Received: by 10.55.215.202 with SMTP id t71mr13811691qkt.114.1484204682285;
        Wed, 11 Jan 2017 23:04:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m53si5500203qta.127.2017.01.11.23.04.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jan 2017 23:04:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60101 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cRZRB-0001ap-Q4
	for alex.bennee@linaro.org; Thu, 12 Jan 2017 02:04:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cRZQw-0001UV-PG
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 02:04:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cRZQt-0005wO-8N
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 02:04:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40928)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1cRZQt-0005uy-36; Thu, 12 Jan 2017 02:04:23 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3982637E64;
	Thu, 12 Jan 2017 07:04:23 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0C74JTK008641; Thu, 12 Jan 2017 02:04:22 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Jan 2017 02:04:18 -0500
Message-Id: <1484204658-28058-5-git-send-email-wei@redhat.com>
In-Reply-To: <1484204658-28058-1-git-send-email-wei@redhat.com>
References: <1484204658-28058-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 12 Jan 2017 07:04:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH V1 4/4] target-arm: Hook up TCG vPMU with CPU pmu
 option
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qRY9cl/+eT5p

Remove the checking of kvm_enabled(). With this, .pmu option can also
control vPMU under TCG mode.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f5cb30a..2f87a4b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -692,7 +692,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->id_aa64pfr0 &= ~0xf000;
     }
 
-    if (!cpu->has_pmu || !kvm_enabled()) {
+    if (!cpu->has_pmu) {
         cpu->has_pmu = false;
         unset_feature(env, ARM_FEATURE_PMU);
     }
-- 
1.8.3.1

