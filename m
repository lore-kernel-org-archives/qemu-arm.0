Received: by 10.103.124.15 with SMTP id x15csp1866489vsc;
        Tue, 23 May 2017 07:42:45 -0700 (PDT)
X-Received: by 10.200.40.87 with SMTP id 23mr27573734qtr.37.1495550565150;
        Tue, 23 May 2017 07:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495550565; cv=none;
        d=google.com; s=arc-20160816;
        b=tClOha1Or+UQhDrsiWMu61m+w06snjn8Z20qKBhn8OqpP2Zafq6VbA8inERwziB+Hq
         RoedtUMa4gEZ49z4PKyEXbnvCNXIqQVDdH1tfdtI/VVNclCwqEMGDtv1gXQ5V3t+s0G6
         wr12ixu8wJFjOIYkakYaDEMKfZa1+kNgqe76RDX9pRgvPTzkYwE1nXSiXqbDdgYVqZ+y
         XS659j2ceqUgfM66JV8YR/QYICHGgKQpHQcEOCCUOK2Hv11ecNiRNpISgM45FEVJBu0b
         IKDdu7hWsSVwiNUX5TzJZ8arLNRcVNTSBLy83V7UmfLwgEJrlj6Vretfx/m9KYcjPOUO
         1CRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=9VAODmSJqsgWH9vI28Mv/20mBSyp3ukkNqhfyrZomKg=;
        b=I12c+vSGYcuxpzWZRUl7NT3juzZLhbri83y8s6YcAt91CbA6hKk4/n1UzlRWjxEY+B
         5/dQj1T+vaBFS/Q7N8gzagFLPvlMuSRJ/XGyJws3z21GQHYJs60OijRKoVDU/8PVGnLZ
         TnJlB3ZkbjUtowEToVemkaMXSfVeMeZVYnfnfjOnnKA3tgoK6eEHXIBd7OsurL/2XR92
         nv4K0JVDt0+KeXEVXuQvyi/nNv4UZTGhKYrLYeBXR4e2shStbVQSWY41upeBuVPqPFGa
         MB/DwyivHRsCOYEt+KarIxDVrwm5kBXOa/fm71l8dSR1wZFv/8gtNycHc3M06yAadZhL
         66eg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r190si21787993qkf.2.2017.05.23.07.42.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 May 2017 07:42:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dDB1I-00035w-N5
	for alex.bennee@linaro.org; Tue, 23 May 2017 10:42:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dDAxh-0008KM-PS
	for qemu-arm@nongnu.org; Tue, 23 May 2017 10:39:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dDAxg-0002dZ-W4
	for qemu-arm@nongnu.org; Tue, 23 May 2017 10:39:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dDAxg-0002cb-QT; Tue, 23 May 2017 10:39:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B173180483;
	Tue, 23 May 2017 14:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B173180483
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B173180483
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 476827BCB1;
	Tue, 23 May 2017 14:38:58 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 May 2017 16:38:49 +0200
Message-Id: <1495550330-34087-5-git-send-email-imammedo@redhat.com>
In-Reply-To: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
References: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 23 May 2017 14:38:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 4/5] numa: fallback to default NUMA node
 instead of node 0
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZuFNmBvK9Zli

Do the same as we did in commit
  (57924bcd8 numa: introduce machine callback for VCPU to node mapping)
but only for incomplete mapping usecase, falling back to board
provided default cpu to node mapping if user hasn't provided
mapping for CPU explicitly.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/core/machine.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 964b75d..b8df15f 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -730,9 +730,6 @@ static void machine_numa_finish_init(MachineState *machine)
                 g_string_append_printf(s, "%sCPU %d [%s]",
                                        s->len ? ", " : "", i, cpu_str);
                 g_free(cpu_str);
-
-                /* non mapped cpus used to fallback to node 0 */
-                props.node_id = 0;
             }
 
             props.has_node_id = true;
-- 
2.7.4

