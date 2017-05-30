Received: by 10.25.0.6 with SMTP id 6csp1894730lfa;
        Tue, 30 May 2017 09:24:24 -0700 (PDT)
X-Received: by 10.55.107.70 with SMTP id g67mr15752114qkc.107.1496161464295;
        Tue, 30 May 2017 09:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496161464; cv=none;
        d=google.com; s=arc-20160816;
        b=G3dG060A3q2SYjbI2nbrJealjasSoQ7L+Lml0sdKJgcQCg+vyJp+d2aCoVJd+toBid
         VtSx93NQS2XRigBR69Bgdqx+da2LmnJBDUm0oseLXg1X05fLrLKcAFxDOWISQ75Wq0Px
         wfdE3j9Jt2MD1hzKtnpjva7HcEPJROlogYACeMKY/MKNlsLeE1oG9+4ObrcdddDK6Ika
         oAsJi877pkNpzFXf+i/fJNOQ0v0fIvrs5lNtqKlQJPCMF/PKKwIdLbAtVwBHIGwdq250
         1+Rr9VW5pE1g5foLUoBjCHI9K4Imj6j71jHQHPss+kpjGIzgIrIC20p+rRtEW7XnSfvP
         KfLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=A5BHGi18aUexT5ClafX6e23Z/N1+lfaSvEAEUz7SWb4=;
        b=xSXT/pfJmrLtYwMG3fgN2anNa+CfN9tSLpyaQbNkiIvsOB0gGPicmVnXwcGGjXkx+R
         qtbsveH7hf4J7flwYPi7oHqr9+5ZbN5b2zDR8vHxfHi9Spwq9C43TreFiIKwfUCq6fJW
         akSAO4yCQzxRn2CvpiXQSh/WElQD5NwulLnSRedqTmNjMogMuz5mZEOKISm//ecGiB8g
         0Be7Eiub7Cb/3now8Ezc8rxc2sk88zZQVNN7iLVUsDbf2ChFOzI1i40LTaFIX4qTNmCq
         fJlIq3NVX2Qs4wlrMIEgJOwnBW2RYeQpRM89SHu5Eea3qvsG/pNNlCQjK1/Kw+WI/cif
         rdhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i6si13014949qta.64.2017.05.30.09.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 09:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54935 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFjwV-0005rL-NC
	for alex.bennee@linaro.org; Tue, 30 May 2017 12:24:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFjwK-0005pL-Sc
	for qemu-arm@nongnu.org; Tue, 30 May 2017 12:24:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFjwH-00051w-N6
	for qemu-arm@nongnu.org; Tue, 30 May 2017 12:24:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44226)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dFjwH-00051q-Gl; Tue, 30 May 2017 12:24:09 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A79CC04B320;
	Tue, 30 May 2017 16:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7A79CC04B320
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7A79CC04B320
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1161774ABF;
	Tue, 30 May 2017 16:24:06 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 30 May 2017 18:23:55 +0200
Message-Id: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 30 May 2017 16:24:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 0/7] numa: code consolidation and fixes
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
X-TUID: 6QSllwms4Vk4

changelog since v2:
  (Eduardo)
     - keep original logic in when moving numa part into helper
        numa: consolidate cpu_preplug fixups/checks for pc/arm/spapr
     - drop "numa: fallback to default NUMA node instead of node 0"
     - split out monitor hunk into separate patch
     - split out spapr_fixup_cpu_numa_dt refactoring into separate patch
     - add extra patch to make default node-id calculation more robust
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
   https://github.com/imammedo/qemu.git cphp_numa_cfg_follow_up_v3_cleanups_v3

CC: qemu-arm@nongnu.org
CC: qemu-ppc@nongnu.org
CC: Eduardo Habkost <ehabkost@redhat.com>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Andrew Jones <drjones@redhat.com>


Igor Mammedov (7):
  numa: consolidate cpu_preplug fixups/checks for pc/arm/spapr
  numa: move default mapping init to machine
  numa: make sure that all cpus have has_node_id set if numa is enabled
  numa: make hmp 'info numa' fetch numa nodes from qmp_query_cpus()
    result
  numa: move numa_node from CPUState into target specific classes
  spapr: cleanup spapr_fixup_cpu_numa_dt() usage
  numa: cpu: calculate/set default node-ids after all -numa CLI options
    are parsed

 include/hw/boards.h      |  3 +++
 include/qom/cpu.h        |  2 --
 include/sysemu/numa.h    | 10 +++++++++
 target/arm/cpu.h         |  2 ++
 target/i386/cpu.h        |  1 +
 target/ppc/cpu.h         |  1 +
 hw/arm/virt-acpi-build.c |  4 +---
 hw/arm/virt.c            | 32 +++++++++------------------
 hw/core/machine.c        | 38 +++++++++++++++++++++++---------
 hw/i386/acpi-build.c     |  3 +--
 hw/i386/pc.c             | 42 ++++++++++++-----------------------
 hw/ppc/spapr.c           | 57 ++++++++++++++++--------------------------------
 hw/ppc/spapr_cpu_core.c  |  4 +++-
 monitor.c                | 11 ++++++----
 numa.c                   | 43 +++++++++++++++---------------------
 target/arm/cpu.c         |  2 +-
 target/i386/cpu.c        |  2 +-
 17 files changed, 119 insertions(+), 138 deletions(-)

-- 
2.7.4

