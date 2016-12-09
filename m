Received: by 10.25.159.131 with SMTP id i125csp321668lfe;
        Fri, 9 Dec 2016 06:37:20 -0800 (PST)
X-Received: by 10.55.42.197 with SMTP id q66mr69487610qkq.198.1481294240468;
        Fri, 09 Dec 2016 06:37:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 23si20217613qkd.84.2016.12.09.06.37.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Dec 2016 06:37:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cFMIa-0004pQ-0i
	for alex.bennee@linaro.org; Fri, 09 Dec 2016 09:37:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cFMIS-0004WP-LP
	for qemu-arm@nongnu.org; Fri, 09 Dec 2016 09:37:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cFMIP-0003o8-Jz
	for qemu-arm@nongnu.org; Fri, 09 Dec 2016 09:37:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53726)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cFMIP-0003o0-EL; Fri, 09 Dec 2016 09:37:09 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59F947F7CB;
	Fri,  9 Dec 2016 14:37:07 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uB9Eb59w017542; Fri, 9 Dec 2016 09:37:06 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Fri,  9 Dec 2016 15:37:03 +0100
Message-Id: <20161209143703.29457-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 09 Dec 2016 14:37:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/intc/arm_gicv3_common: fix aff3 in typer
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ee6Un7+JbYUW

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/intc/arm_gicv3_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 0f8c4b86e023..0aa9b9ca6655 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -204,7 +204,8 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
         /* The CPU mp-affinity property is in MPIDR register format; squash
          * the affinity bytes into 32 bits as the GICR_TYPER has them.
          */
-        cpu_affid = (cpu_affid & 0xFF00000000ULL >> 8) | (cpu_affid & 0xFFFFFF);
+        cpu_affid = ((cpu_affid & 0xFF00000000ULL) >> 8) |
+                     (cpu_affid & 0xFFFFFF);
         s->cpu[i].gicr_typer = (cpu_affid << 32) |
             (1 << 24) |
             (i << 8) |
-- 
2.9.3

