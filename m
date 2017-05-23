Received: by 10.103.124.15 with SMTP id x15csp1865449vsc;
        Tue, 23 May 2017 07:40:02 -0700 (PDT)
X-Received: by 10.200.53.54 with SMTP id y51mr29269513qtb.98.1495550402882;
        Tue, 23 May 2017 07:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495550402; cv=none;
        d=google.com; s=arc-20160816;
        b=nIQtpdInyPcS4vlDXHpK5BhFHr+zFwC3d3Cv4M82Zt3ADVUGSimx/JWcSTgJhmO+4h
         mlfqarYSE+61BmXBOrbcsvFKkgj7TmPYE/GF86UzFVpJgZfv4viagcYSxG6VRHpYPYdt
         +5coCAO+2/vBqtmmK1fWcbf9nQ/uDpU+KuKVyc3IDzfW97rs2j05A48H9rCE2EwbTKs0
         AGSEcYoLaH5ruIl/xaP7VkRdFUjNceBEFAzkQ4OvhDTDGMgzOYnEW9TrvPy3xvb5LOrV
         5t0BiOgAfY9KyWLOb5fXTVCOWxqWE50yPKT3pvrTG8nise1TWVzyp6AH4pwqAQqi1qh7
         j2Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=9EY9n+QMLxWbUEetCiCMy16cG4iTmcfKVrHC4nsbjYE=;
        b=DBj2rDQPRDLgsbPjqGWCBjNPjlQDcqnPSs74ur+xPM6+0cb/yRZXO6CydWQ1oOAtfR
         gSxp0Ek0Q7Y1OHjkEHQNzqcEXgXrFPi3+TkOHAkiWA8WHx1O+1qet2h6ouOux/260UC0
         CXtZKTtjhFQP+sPVGNS3rfAaAxJQF35jSHCSWxwsC2QFORiVjWPEUxWEQroyUxoq1Mxw
         vXD5XTWuUfSxRZioEP0LCZlqtjLl2Br7AvCtHQlDtimL5Lz8RCopNg5ii9ok/kYRKCzP
         x5cNeYjHqNtvusJT0f6lqG58i3UzTR2gTo33XenGKLsHrVrpwDuncf6vK69tX+hvTyIW
         sj/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v6si22047763qth.300.2017.05.23.07.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 May 2017 07:40:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dDAyg-0000jo-Cf
	for alex.bennee@linaro.org; Tue, 23 May 2017 10:40:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dDAxd-0008G1-MF
	for qemu-arm@nongnu.org; Tue, 23 May 2017 10:38:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dDAxb-0002Us-DE
	for qemu-arm@nongnu.org; Tue, 23 May 2017 10:38:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40000)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dDAxb-0002TK-4P; Tue, 23 May 2017 10:38:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B566C059729;
	Tue, 23 May 2017 14:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0B566C059729
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 0B566C059729
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7383F7B5FD;
	Tue, 23 May 2017 14:38:51 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 May 2017 16:38:45 +0200
Message-Id: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 23 May 2017 14:38:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 0/5] numa: code consolidation and fixes
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
X-TUID: iTqNXENPp5kJ

changelog since v1:
  (Eduardo)
     - user error_abort in numa_cpu_pre_plug()
     - make default_mapping boolean
     - redo default mapping detection loop as a combo of for/if
     - return back lost TODO comment
     - new patch removing numa_node from generic CPUState
  - drop silence test patch as it's already in pull req on list
  - new patch [3/5] to fix missing _PXM/fdt nodes for implicitly mapped CPUs
  - new patch dropping fallback to node 0


git repo for testing:
   https://github.com/imammedo/qemu.git cphp_numa_cfg_follow_up_v3_cleanups_v2

CC: qemu-arm@nongnu.org
CC: qemu-ppc@nongnu.org
CC: Eduardo Habkost <ehabkost@redhat.com>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Andrew Jones <drjones@redhat.com>

Igor Mammedov (5):
  numa: consolidate cpu_preplug fixups/checks for pc/arm/spapr
  numa: move default mapping init to machine
  numa: make sure that all cpus in has has_node_id set if numa is
    enabled
  numa: fallback to default NUMA node instead of node 0
  numa: move numa_node from CPUState into target specific classes

 include/qom/cpu.h        |  2 --
 include/sysemu/numa.h    |  1 +
 target/arm/cpu.h         |  2 ++
 target/i386/cpu.h        |  1 +
 target/ppc/cpu.h         |  1 +
 hw/arm/virt-acpi-build.c |  4 +---
 hw/arm/virt.c            | 16 ++--------------
 hw/core/machine.c        | 34 ++++++++++++++++++++++++----------
 hw/i386/acpi-build.c     |  3 +--
 hw/i386/pc.c             | 21 ++-------------------
 hw/ppc/spapr.c           | 41 ++++++++++++-----------------------------
 hw/ppc/spapr_cpu_core.c  |  4 +++-
 monitor.c                | 11 +++++++----
 numa.c                   | 43 +++++++++++++++++--------------------------
 target/arm/cpu.c         |  2 +-
 target/i386/cpu.c        |  2 +-
 16 files changed, 76 insertions(+), 112 deletions(-)

-- 
2.7.4

