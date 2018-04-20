Received: by 10.28.4.212 with SMTP id 203csp925420wme;
        Fri, 20 Apr 2018 08:57:48 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqsEq9vtJ7ZAawop5jjUupsAjHrBpYpwp0kOn5tQwLZ7rcwUFkAPFdliNvZLDDc7ZZPMP5m
X-Received: by 2002:ac8:424f:: with SMTP id r15-v6mr5469803qtm.395.1524239868449;
        Fri, 20 Apr 2018 08:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524239868; cv=none;
        d=google.com; s=arc-20160816;
        b=CJEU/tkZt0jAc+pC4vu1qGOZXMEMmDKiNZFdK3FYvawZQDZNsAy+sQDZp2UBiEktJs
         dnsDihv9HqmhRuhi+6IGCx05wuXWdIImDga3XQ1YulsU6uIA9CG7+mE4xSPl0Uku7Yhz
         97I4Z/57NDPjUQLudb9XVAGXmIp5XjF1tlWh5UXLJ+oXarZT1IJo5r5GuNajnkn0h3bJ
         opsYU9xK47K4stbJ+eenfs8BOdzPHy8A6A8LupyCm+QWdNfbQYzJbIRXwrDi9/msYUPf
         y6ExKszfEqsaM2VWO3NCsjGnOKbxLLFjOYhfYcRVOPRlmqK+sEAlXjhnk9fLBFaLJEtX
         sAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=x64wu9paW0rkvW76CIBZWD+msqV2gD6zV6b4bOujsiU=;
        b=gJP1eGslFSeSKFJpNuY6NWack/UTWO4QiXw4bC31cXW9EiPhumYpcBvKgh/Hool8YS
         HFSHoexTYTPH76lmkQcidFh1LWL681ZFzIK3U9u7t9walBOtnL1AmxkdCPvjrH4RqD6B
         XrrVQoQmNwj3pIbv3SItibolkOHi92lfZgntcEalAnp0MYaU/oBiSjR5pfdToKDrGo+z
         E9fH9P3f51bjKTly8fAJtKF/RePnVVoHBYZQf/TP+PnxJqG5yvS0bnfL1P4qn8LbKSrI
         63z39TaSZtlrY6KJo2kV6Pg5kznhWVHBKLQlKIIbs2jtuAmajZgK/1qU/UJ2PtHQnGeT
         Z5Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u10si7692063qkk.323.2018.04.20.08.57.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Apr 2018 08:57:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9YPz-000327-S2
	for alex.bennee@linaro.org; Fri, 20 Apr 2018 11:57:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f9YOB-0001qZ-2A
	for qemu-devel@nongnu.org; Fri, 20 Apr 2018 11:55:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f9YOA-0000z1-9g
	for qemu-devel@nongnu.org; Fri, 20 Apr 2018 11:55:55 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:41084)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1f9YO8-0000xb-0f; Fri, 20 Apr 2018 11:55:52 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1f9YO5-0007Yo-17; Fri, 20 Apr 2018 16:55:49 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Apr 2018 16:55:47 +0100
Message-Id: <20180420155547.9497-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH] hw/arm/raspi: Don't bother setting
 default_cpu_type
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P/f4Oj+dVVE6

In commit 210f47840dd62, we changed the bcm2836 SoC object to
always create a CPU of the correct type for that SoC model. This
makes the default_cpu_type settings in the MachineClass structs
for the raspi2 and raspi3 boards redundant. We didn't change
those at the time because it would have meant a temporary
regression in a corner case of error handling if the user
requested a non-existing CPU type. The -cpu parse handling
changes in 2278b93941d42c3 mean that it no longer implicitly
depends on default_cpu_type for this to work, so we can now
delete the redundant default_cpu_type fields.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Tidying up a loose end from the raspi changes I did last month...

 hw/arm/raspi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 955a7c4e80..66899c28dc 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -226,7 +226,6 @@ static void raspi2_machine_init(MachineClass *mc)
     mc->no_parallel = 1;
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
     mc->max_cpus = BCM283X_NCPUS;
     mc->min_cpus = BCM283X_NCPUS;
     mc->default_cpus = BCM283X_NCPUS;
@@ -249,7 +248,6 @@ static void raspi3_machine_init(MachineClass *mc)
     mc->no_parallel = 1;
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
     mc->max_cpus = BCM283X_NCPUS;
     mc->min_cpus = BCM283X_NCPUS;
     mc->default_cpus = BCM283X_NCPUS;
-- 
2.17.0

