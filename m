Received: by 10.28.91.67 with SMTP id p64csp2465288wmb;
        Mon, 19 Mar 2018 04:02:45 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuh69KUvakLWlc4t6kRN1rYBbGqJDjJxRTGI26i1JmXbNtK/eOz05Ijvw/1nAiokaXw8nMC
X-Received: by 10.237.38.135 with SMTP id q7mr17515922qtd.205.1521457365649;
        Mon, 19 Mar 2018 04:02:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521457365; cv=none;
        d=google.com; s=arc-20160816;
        b=wV1VO96eRYuqTv4a8hWj6xbfAkUEi3dOPLrLLQhe3hRmcposqgUQPEPrGYYLviV7OL
         sYyIHfLTyrkRpv2kE9hYpt60vK+mdSv8H9csENOvF2PSX7QHN9IQS07rJWwdoMhrPfoD
         0Izi7NGoXoimOoTsAOamioAUlN1Y6oCaR/imKTYEGUmbSZQmhY9iVmxKVSdvGwQzoe7W
         pGyICNdHKOQ6VjNQoTw9LC1RbyMEm2AzJK2MiOSbfslQDwr/2RcS8XaBTce/ahEJUCGe
         ufm8nA500JB8y2Ltx95wa4v8fwU0jIdordoaCcqX+4Ynxgcs7Tq7hCh21/IOwVQ4oC9/
         KMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=SBVtt5NuRg/pWHkQ9hW1kca8KomhKMvZsByc8mI5V1U=;
        b=H7kRxncuW2geycX/IqEPRH6leF4kJNQYpMW49rGytg33MTaGvLeDgU0iq5v/Q/m37i
         6yYET033S3zop9h2GanWTq9xfHdR38y87AjoffHFXIOUXdFaKETqfctvTIzzRbX6DiSe
         BXHJBTR+We2aFHGqfP9elTL0BJeIN5Ee2AMnS+Q8Z5U0ixvuy1lHAzg5gO1CLHD+p+V1
         tdIYwcNCt5mTzV3S9dz09ppcRIvUks+Mh0JmJpF3vg0lmS7aQqmAx1EwNPB6qZD3ylG1
         lXeOE0HqkWdq4I1vzkJ1o1L9NqDJpdvTQ4Im5/xCgZh2+clJRDGg0ToofGVcdBdIRznD
         XEGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o29si430404qtl.366.2018.03.19.04.02.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 04:02:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41287 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exsYv-0001QB-7X
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 07:02:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1exsYd-0001PN-IA
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 07:02:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1exsYc-0006zJ-D7
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 07:02:27 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40376)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1exsYc-0006ws-6G; Mon, 19 Mar 2018 07:02:26 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1exsYS-0002i4-U2; Mon, 19 Mar 2018 11:02:16 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 19 Mar 2018 11:02:15 +0000
Message-Id: <20180319110215.16755-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.12] hw/arm/bcm2836: Use the Cortex-A7
 instead of Cortex-A15
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MMhRaB1BSgPr

The BCM2836 uses a Cortex-A7, not a Cortex-A15. Update the device to
use the correct CPU.
https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2836/QA7_rev3.4.pdf

When the BCM2836 was introduced (bad5623690b) the Cortex-A7 was not
available, so the very similar Cortex-A15 was used. Since dcf578ed8ce
we can model the correct core.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This was originally done by a patch from Alistair:
http://lists.nongnu.org/archive/html/qemu-devel/2018-02/msg00311.html

The refactor of bcm2836 means the code is different, but I'm using
the same commit message.

Based-on: <20180313153458.26822-1-peter.maydell@linaro.org>

---
 hw/arm/bcm2836.c | 2 +-
 hw/arm/raspi.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 25e74b67d9..8c1e707d9c 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -32,7 +32,7 @@ struct BCM283XInfo {
 static const BCM283XInfo bcm283x_socs[] = {
     {
         .name = TYPE_BCM2836,
-        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a15"),
+        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a7"),
         .clusterid = 0xf,
     },
     {
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 06f1e08ca9..955a7c4e80 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -226,7 +226,7 @@ static void raspi2_machine_init(MachineClass *mc)
     mc->no_parallel = 1;
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
     mc->max_cpus = BCM283X_NCPUS;
     mc->min_cpus = BCM283X_NCPUS;
     mc->default_cpus = BCM283X_NCPUS;
-- 
2.16.2

