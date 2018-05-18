Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp480414wme;
        Fri, 18 May 2018 08:32:25 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZq8GSLDK/YhEFqhR+LuZY8KGw3ILtG8xo+ZJW2PH9gM5lNr9IX1Pkv1rdKvPwetDLdms9tw
X-Received: by 2002:ac8:36ad:: with SMTP id a42-v6mr9714625qtc.13.1526657545466;
        Fri, 18 May 2018 08:32:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526657545; cv=none;
        d=google.com; s=arc-20160816;
        b=Ymhett1DCEX8Suqrs9YFFrl/1SsxSlTZYrweV2obi+8a4CzWjsYaqxLhWe68CssiE2
         v6HZRo+oFZbjuUEurwFSUlU2e4qv6KXBJF/S+xrqMt1lrlF+T3YwAi75ZGtLbK/ZMAeO
         Af43i5fDCVQXlHDF9CbBlS6v6WuDGbkgD5ddai916iLEr13BPgOhUBnTGroZ75DuSvmb
         e76+c/YYt8OWmUSvZJwkGAbx1Yka22sjdBLLHERgcMQHKQgWs0V7ogHmp5nQMt0m5dNi
         tPagK0mynEqB4H0TgIMXe/KrYb5PHFLdCphe8ImSYefplVVukQFnOIfIZ4vjg68jbC0Y
         xWpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=5KLxjM/SD0EyVdFBdGAqRn1ZWGaCIF8qgsC+3V5Y9kw=;
        b=oUuCKQql35FulmI+BWHHnmCFl654DvY3093lRg8A+2Scx6rvnIRI1sAYp0iunFvwhn
         GhL9J/Jq+flTOywlMaHEncSrEjtR7kVRwniRzBB3nccYrt+11Bho/FJderRyogaN3vjJ
         AXqxufaUAnl8g3EUtmqtcrNUzRd263Uml/HG5QP+pSoCGeik6MN0JBe3dS0z0UITfGEq
         Bza0HEMSlh/BESRh+HCK8S6HMD/f8ybIq27qx/5dT7QgcBGYhOYlriaXkcxj6RWRZ5Yw
         CUCePH73ZzI+t6aRzsUQgkcfyYQo7Zgb4oRZ099zkmFRlYeIJ1xLNoEmgikXZLo9YZcT
         TU8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p19-v6si2273603qke.372.2018.05.18.08.32.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 May 2018 08:32:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39553 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJhMm-0003mW-Uq
	for alex.bennee@linaro.org; Fri, 18 May 2018 11:32:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fJhMV-0003kV-SA
	for qemu-arm@nongnu.org; Fri, 18 May 2018 11:32:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fJhMU-0005jr-Sx
	for qemu-arm@nongnu.org; Fri, 18 May 2018 11:32:07 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:41774)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fJhMU-0005dc-MG; Fri, 18 May 2018 11:32:06 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fJhMM-0004go-2r; Fri, 18 May 2018 16:31:58 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 18 May 2018 16:31:57 +0100
Message-Id: <20180518153157.14899-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] MAINTAINERS: Add entries for newer MPS2 boards
 and devices
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3DJq3LO7gUd7

Add entries to MAINTAINERS to cover the newer MPS2 boards and
the new devices they use.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Oops, forgot these when we added the mps2-an505...

 MAINTAINERS | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e187b1f18f..1823f900b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -447,6 +447,8 @@ F: hw/timer/cmsdk-apb-timer.c
 F: include/hw/timer/cmsdk-apb-timer.h
 F: hw/char/cmsdk-apb-uart.c
 F: include/hw/char/cmsdk-apb-uart.h
+F: hw/misc/tz-ppc.c
+F: include/hw/misc/tz-ppc.h
 
 ARM cores
 M: Peter Maydell <peter.maydell@linaro.org>
@@ -515,8 +517,11 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/mps2.c
-F: hw/misc/mps2-scc.c
-F: include/hw/misc/mps2-scc.h
+F: hw/arm/mps2-tz.c
+F: hw/misc/mps2-*.c
+F: include/hw/misc/mps2-*.h
+F: hw/arm/iotkit.c
+F: include/hw/arm/iotkit.h
 
 Musicpal
 M: Jan Kiszka <jan.kiszka@web.de>
-- 
2.17.0

