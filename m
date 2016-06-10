Received: by 10.25.85.209 with SMTP id j200csp100707lfb;
        Fri, 10 Jun 2016 10:40:44 -0700 (PDT)
X-Received: by 10.55.27.98 with SMTP id b95mr3184963qkb.65.1465580444328;
        Fri, 10 Jun 2016 10:40:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e92si6883232qga.115.2016.06.10.10.40.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 10:40:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQQF-0006HT-OJ
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 13:40:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQA-0006HA-Rn
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:40:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQ7-0000Kg-Gn
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:40:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46022)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bBQQ7-0000KP-9o; Fri, 10 Jun 2016 13:40:35 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DCBE64DB08;
	Fri, 10 Jun 2016 17:40:33 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5AHeVPR032552; Fri, 10 Jun 2016 13:40:31 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 10 Jun 2016 19:40:11 +0200
Message-Id: <1465580427-13596-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 10 Jun 2016 17:40:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 00/16] Rework SMP parameters
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	pbonzini@redhat.com, dgibson@redhat.com, imammedo@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sv+ptYe2+9PA

This series is a first step in eliminating smp_* global
variables (the last patch gets rid of two of them!) And, it's
a first step in deprecating '-smp' in favor of using machine
properties, e.g.
 qemu -machine pc,sockets=2,cores=2,threads=2,maxcpus=8,cpus=8 ...

It's also a first step in allowing machine types to override
the default parameter parsing, which makes assumptions that
not all machine types may agree with. (mach-virt is coming...)

So, three first steps, I guess that's 3 steps. And a forth
thing it does is some fixes for the smp parsing and also for
SMBIOS use of cpu topology.

Tested with kvm-unit-tests on all five arches supported
there, x86_64 both with KVM and TCG, and booting an x86_64
guest (KVM) to check SMBIOS before and after in order to make
sure it was the same. Also compile tested all targets.

Thanks,
drew


Andrew Jones (15):
  vl: smp_parse: cleanups
  vl: smp: add checks for maxcpus based topologies
  hw/smbios/smbios: fix number of sockets calculation
  hw/core/machine: add smp properites
  vl: move smp parsing to machine pre_init
  qom/cpu: make nr-cores,nr-threads real properties
  hw/core/machine: set cpu global nr_cores,nr_threads in pre_init
  hw/i386/pc: don't use smp_cores,smp_threads
  hw/ppc/spapr: don't use smp_cores,smp_threads
  target-ppc: don't use smp_threads
  hw/arm/virt: rename *.smp_cpus to *.cpus
  hw/arm/virt: don't use smp_cpus,max_cpus
  hw/arm/virt: stash cpu topo info in VirtGuestInfo
  smbios: don't use smp_cores,smp_threads
  sysemu/cpus: bye, bye smp_cores,smp_threads

Igor Mammedov (1):
  hw/core/machine: Introduce pre_init

 cpus.c                           |   2 -
 hw/arm/virt-acpi-build.c         |  14 +--
 hw/arm/virt.c                    |  41 +++++---
 hw/core/machine.c                | 210 +++++++++++++++++++++++++++++++++++++++
 hw/i386/pc.c                     |  39 +++++---
 hw/ppc/spapr.c                   |   9 +-
 hw/ppc/spapr_rtas.c              |   2 +-
 hw/smbios/smbios.c               |  20 ++--
 include/hw/arm/virt-acpi-build.h |   6 +-
 include/hw/boards.h              |   7 ++
 include/hw/smbios/smbios.h       |  10 ++
 include/sysemu/cpus.h            |  10 --
 qom/cpu.c                        |   8 ++
 target-ppc/translate_init.c      |  15 ++-
 vl.c                             | 101 +++++++------------
 15 files changed, 356 insertions(+), 138 deletions(-)

-- 
2.4.11

