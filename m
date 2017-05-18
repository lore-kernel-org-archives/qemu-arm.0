Received: by 10.25.0.6 with SMTP id 6csp604754lfa;
        Thu, 18 May 2017 01:12:17 -0700 (PDT)
X-Received: by 10.55.105.2 with SMTP id e2mr2459878qkc.48.1495095137599;
        Thu, 18 May 2017 01:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495095137; cv=none;
        d=google.com; s=arc-20160816;
        b=LQ3kDLlZCwB4Howk2q+alDHIza6faYW1a6UNc6UNg7MuPc70nxyE87hLuXwC3EtUZz
         Ftk898vFLOdHzMjq5LCMvl5JeWBrSOtHbG7G3EwNOK2/MGvq6qTA+lV7NMNxHPgtD2Oo
         AvRcOPMx4Si9TWP1rRkfmfHA1IVHnW8wDt0Gxas3jgHx+YIEZ4eJg7y4Ouo6fuK1R8V+
         3t6OZl8BRn8S8PoD7mONZ1o7UjS1+PUoZR069XHcCKq08+he/6ZCC888uxS+koolu6EI
         nkYI1RrYu5Vv1VeQg69ViTQtIs9vCfzKLBTw646fJdVZduJ4IDia3AfPZEB9FUEBzYSu
         vgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=PfcAULpqYSC5+li+sZytywlxuF9fNvirExHVh+5siHY=;
        b=Jk/ZcNYVmJmJ3btSz+MSyNEk36u0skT+5wuq6tGn9xaFBHkAKy4+qqy3c1bLqUHfUi
         H36HF/TqcuxBrMjQu3oWGAN+yzB6BE21sczVn8CH5x1oYutuAqI73YrGi2hD+c0Q46wn
         xS/IkR/7yJRjRXCNRQkUNLHKPZnNnsVWCSvo2KoS5E1/lB8L2VrfsqPyDzwuWOOUnqac
         dijIRQ03Q4Fpc1bO4+WsKR9zPSCdC17KNjFnrMQmjHoTf5lL0Xxf+jHhdVBdbE4Vx55g
         s/iICN6OeyrK4png99SOoOZuTl6D94+9/86TEQNO1WoZdhWg/dSt5g+oJwXCLiFpxg7f
         Iljg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r17si4946382qkh.119.2017.05.18.01.12.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 May 2017 01:12:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52329 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBGXg-0005Fn-VK
	for alex.bennee@linaro.org; Thu, 18 May 2017 04:12:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dBGVE-0003SN-Al
	for qemu-devel@nongnu.org; Thu, 18 May 2017 04:09:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dBGVD-00028Z-J7
	for qemu-devel@nongnu.org; Thu, 18 May 2017 04:09:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44076)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dBGVB-00027P-BY; Thu, 18 May 2017 04:09:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CA7683F3A;
	Thu, 18 May 2017 08:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7CA7683F3A
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7CA7683F3A
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 379A9627DD;
	Thu, 18 May 2017 08:09:38 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 18 May 2017 10:09:31 +0200
Message-Id: <1495094971-177754-4-git-send-email-imammedo@redhat.com>
In-Reply-To: <1495094971-177754-1-git-send-email-imammedo@redhat.com>
References: <1495094971-177754-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 18 May 2017 08:09:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/3] numa: silence incomplete mapping warning
 under qtest
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3JDx3BV4P8Bi

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Markus Armbruster <armbru@redhat.com>

---
 hw/core/machine.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 2e91aa9..21ebef8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -21,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "qemu/cutils.h"
 #include "sysemu/numa.h"
+#include "sysemu/qtest.h"
 
 static char *machine_get_accel(Object *obj, Error **errp)
 {
@@ -732,7 +733,7 @@ static void machine_numa_finish_init(MachineState *machine)
             }
         }
     }
-    if (s->len) {
+    if (s->len && !qtest_enabled()) {
         error_report("warning: CPU(s) not present in any NUMA nodes: %s",
                      s->str);
         error_report("warning: All CPU(s) up to maxcpus should be described "
-- 
2.7.4

