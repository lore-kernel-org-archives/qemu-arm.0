Received: by 10.28.173.206 with SMTP id w197csp6801440wme;
        Thu, 18 Jan 2018 09:36:04 -0800 (PST)
X-Google-Smtp-Source: ACJfBot6y8vQBWlOftifM1aI2mqpljdleFh5XzJm83ppaLxBWFZKGwS7Hh3Lx/Megpovhtz6vPa9
X-Received: by 10.37.185.140 with SMTP id r12mr10507806ybg.107.1516296964686;
        Thu, 18 Jan 2018 09:36:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516296964; cv=none;
        d=google.com; s=arc-20160816;
        b=vIjGfOby+9bZN7keBSlcTdbZPpZE6F8glTAsRpTT4vXcNW2d20CJeaS19dQxN9QX+H
         wW+8g7vYP36WD12lnXQbrS2IgGvhaOIR/z0uA+1utlhWQXMOrXRH5wl/N+J0ZU71goty
         NGBQAxyHfFO7TCz+UBz29K/Py1mqdhgSKscMKZRXkooEobSOFOA2zLHBB0H7BEJd1o3D
         nWWm3DRDyBx6zmug5DDu385hJpv+EKO1T1jP+01cqIlVLvCD+Ilddjw1qMbuAeCb71ZM
         4XeqOPeNjtkbaGQOyeaz95SxrM6Cn42h0khk8R95Z7yfUKsfVEMEy/pGSlL5LmX9pPaC
         Mv8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=Vp0F8laZjAMt4u1EOv/WgRW1ubPWScWKSWF5b6NNdb0=;
        b=nqzgkdA0TjXAPPrTVUaUGTPSBVOV4Or0DLR2uPA5hpuBnjjiY2Ta1ZtPRR/f5bJSfi
         Z7KrMcf8Xb/bgVQbt+fl2A/svQ3+Xh2+76hIRyN/TGb+KTM3fYVLIsunzkjt7/xIdLKj
         ETVJYDIxi/MaiyiSXATzVM4v3Z3C0MryYET4YLsc3kwPVrkmDv7SPPUmNGa6xA4lXGQJ
         g6GT68es1EtzNuYuXQ/WhwnSepHizBI1h6cufcbZ5CkzhO3J/fejf4oKDK88cOEogw4e
         xRTMXn4khsotZ0Ocvv9OkbwAymQDcxF5+g/iMBpUsL60uwsdJFFYXHLp8DTdXxDUfrB/
         WccA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d1si1791784ywa.786.2018.01.18.09.36.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 09:36:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecE6e-0004LB-1A
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 12:36:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ecE6Q-0004Ix-TY
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 12:35:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ecE6N-0007qX-Oc
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 12:35:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50152)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ecE6N-0007pv-HS; Thu, 18 Jan 2018 12:35:47 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5BC2C057F90;
	Thu, 18 Jan 2018 17:35:45 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 288D378E7D;
	Thu, 18 Jan 2018 17:35:44 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 18 Jan 2018 18:33:57 +0100
Message-Id: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 18 Jan 2018 17:35:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 0/5] generalize parsing of cpu_model (part 4)
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uE9Pw1IZae5V

Based in feedback I've got on v1
   https://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg04036.html

v2:
  - implemented new approach only for x86/ARM (will be done for all targets
    if approach seems acceptable)
  - add test case for '-M none -cpu FOO' case
  - redefine TARGET_DEFAULT_CPU_TYPE into CPU_RESOLVING_TYPE
  - scrape off default cpu_model refactoring, so it would cause
    less conflicts with Laurent's series where he tries to rework
    defaults to use ELF hints of executed program

End goal of series is still the same as v1, i.e. get rid of cpu_init() API
and limit cpu_model handling only to places where it must be done.

CC: Laurent Vivier <laurent@vivier.eu>
CC: Peter Maydell <peter.maydell@linaro.org>
CC: Eduardo Habkost <ehabkost@redhat.com>
CC: qemu-s390x@nongnu.org
CC: qemu-ppc@nongnu.org
CC: qemu-arm@nongnu.org

Igor Mammedov (5):
  tests: add machine 'none' with -cpu test
  machine: prepare machine 'none' to gradually switch to cpu_create()
    API
  linux-user: prepare for switching to cpu_create() API
  arm: cpu: add CPU_RESOLVING_TYPE macro
  x86: cpu: add CPU_RESOLVING_TYPE macro

 target/arm/cpu.h       |  3 ++
 target/i386/cpu.h      |  3 ++
 hw/core/null-machine.c | 13 ++++++++-
 linux-user/main.c      | 15 ++++++++--
 tests/Makefile.include |  2 ++
 tests/machine-none.c   | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++
 vl.c                   |  8 +++++-
 7 files changed, 114 insertions(+), 5 deletions(-)
 create mode 100644 tests/machine-none.c

-- 
2.7.4

