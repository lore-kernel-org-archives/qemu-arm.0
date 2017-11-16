Received: by 10.223.150.237 with SMTP id u100csp483864wrb;
        Thu, 16 Nov 2017 07:30:02 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYCMDPEAtBbay2n/DWIJvUV4cJqgYLUfWeF31JIBGgGmZEhm3/ynETulQ62qlXVJQJAcZ6R
X-Received: by 10.129.73.73 with SMTP id w70mr1151459ywa.414.1510846202183;
        Thu, 16 Nov 2017 07:30:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510846202; cv=none;
        d=google.com; s=arc-20160816;
        b=i1fBv1sI7gRtxzKSQz+s1+ftggKExpufKrCA1cIo1vSFfOcssqZZZlPPp50cAWd8UT
         1CLxv1rXDtMBo/5wnbwic17TixEz1R/eXJnEFdt3rqJBRyWmCun6rGDsciyfNn+Z/U9u
         HZYwLI5+Ar0UxBFTRh0I64bFn8qgQJTG/GB2dYqKvqNSVG0P8aQ8uy3+WHa5EGUAYl56
         2pBNn6RNVOQDXjoezmKqhK4y1Uj/1y7MyoqhHa5L+nzc6a/H9SUY+iOsbWc4CQ3DaL/r
         SMZKgo2ioRrQCjQor9bmzYEFize9QAeEL1qIl4d9JJkQZiKFOg53ktTAy5XyTA9ucA9D
         j2Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=gCNSdZZr/f5UMawTSeg3lOw3JhpSHmtFyFW0XeHlMBA=;
        b=MJUndSbRZLDhJgLD3ZjbWrmPeriHrTdwp6p8xScIyyP2OGxmwk+nuM7dZaZ4G/kXmc
         v+JCxK5YqeHf0W4rgvXylyHUMZflR/3uuRTZjMEjvdDwlV9rLrwPfDDeZuiTqN8n+oIv
         TQ2LFlvlAQXn86kwHxZEEWAVAMnGayi28vDeRCYKAJ6B8IEPhatQ1JU1y8cQfj4PJgZZ
         gy2kIdvWFMvHOON5khTNLT1np7y6Xi6+4yfkhlSag/oVTS6L8kor1Q4AjuoVTh5G4XAL
         S6CyzyS4jg+P/himXwbhs1hq9C7r4duDfyvTlLcDyf0b5/fdD8LzeiMobIjTyGB0xB8W
         oFWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 127si253843ybr.14.2017.11.16.07.30.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Nov 2017 07:30:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eFM77-0007jw-Ig
	for alex.bennee@linaro.org; Thu, 16 Nov 2017 10:30:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eFM6z-0007ij-28
	for qemu-arm@nongnu.org; Thu, 16 Nov 2017 10:29:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eFM6t-0004xs-3z
	for qemu-arm@nongnu.org; Thu, 16 Nov 2017 10:29:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41336)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eFM6s-0004wg-UL; Thu, 16 Nov 2017 10:29:47 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 090C6806A5;
	Thu, 16 Nov 2017 15:29:46 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-72.ams2.redhat.com [10.36.116.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6EFB78B11D;
	Thu, 16 Nov 2017 15:29:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 16 Nov 2017 16:29:43 +0100
Message-Id: <1510846183-756-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 16 Nov 2017 15:29:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/arm: Silence xlnx-ep108 deprecation warning
 during tests
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
Cc: qemu-arm@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: db8LTpl+YzIv

The new deprecation warning for the xlnx-ep108 machine also pops up
during "make check" which is kind of confusing. Silence it if testing
mode is enabled.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: I slightly shortened the message so that the code still fits
 into the 80-columns limit.

 hw/arm/xlnx-zcu102.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 9631a53..bbe7d04 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -24,6 +24,7 @@
 #include "qemu/error-report.h"
 #include "exec/address-spaces.h"
 #include "qemu/log.h"
+#include "sysemu/qtest.h"
 
 typedef struct XlnxZCU102 {
     MachineState parent_obj;
@@ -164,8 +165,10 @@ static void xlnx_ep108_init(MachineState *machine)
 {
     XlnxZCU102 *s = EP108_MACHINE(machine);
 
-    info_report("The Xilinx EP108 machine is deprecated, please use the "
-                "ZCU102 machine instead. It has the same features supported.");
+    if (!qtest_enabled()) {
+        info_report("The Xilinx EP108 machine is deprecated, please use the "
+                    "ZCU102 machine (which has the same features) instead.");
+    }
 
     xlnx_zynqmp_init(s, machine);
 }
-- 
1.8.3.1

