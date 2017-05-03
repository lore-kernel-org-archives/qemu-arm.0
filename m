Received: by 10.25.0.198 with SMTP id 189csp84515lfa;
        Wed, 3 May 2017 05:57:34 -0700 (PDT)
X-Received: by 10.237.36.212 with SMTP id u20mr33704812qtc.217.1493816254355;
        Wed, 03 May 2017 05:57:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p126si1620678qkb.278.2017.05.03.05.57.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 05:57:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5tqX-0007uv-OU
	for alex.bennee@linaro.org; Wed, 03 May 2017 08:57:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5tqS-0007tT-Fp
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:57:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5tqP-0000Vb-Di
	for qemu-arm@nongnu.org; Wed, 03 May 2017 08:57:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51770)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d5tqP-0000Ty-0i; Wed, 03 May 2017 08:57:25 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B20F461EA;
	Wed,  3 May 2017 12:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1B20F461EA
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1B20F461EA
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CAFA17C5A;
	Wed,  3 May 2017 12:57:20 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 May 2017 14:56:54 +0200
Message-Id: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 03 May 2017 12:57:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 00/24] numa: add '-numa cpu' option
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vqPulEyC28V3

Changes since v1:
   * arm (Drew)
       - s/virt_idx2mp_affinity/virt_cpu_mp_affinity/
       - add arm_cpu_mp_affinity() to reduce code duplication
       - use cpu list returned by possible_cpu_arch_ids() instead of
         directly accessing MachineState::possible_cpus field
   * various checkpatch/cleanups/spelling fixes (Eric/Drew)
   * simplify spapr_cpu_index_to_props() (David)
   * add/use numa_[has_]node_id() wrappers (Drew)
   * use new NumaCpuOptions instead of CpuInstanceProperties
     in NumaOptions (Eduardo)
   * better documment NumaCpuOptions.node-id in qapi-schema.json (Eduardo)
Changes since RFC:
    * convert all targets that support numa (Eduardo)
    * add numa CLI tests
    * support wildcard matching with "-numa cpu,..." (Paolo)

Series introduces a new CLI option to allow mapping cpus to numa
nodes using public properties [socket|core|thread]-ids instead of
internal cpu_index and moving internal handling of cpu<->node
mapping from cpu_index based global bitmaps to MachineState.

New '-numa cpu' option is supported only on PC and SPAPR
machines that implement hotpluggable-cpus query.
ARM machine user-facing interface stays cpu_index based due to
lack of hotpluggable-cpus support, but internally cpu<->node
mapping will be using the common for PC/SPAPR/ARM approach
(i.e. store mapping info in MachineState:possible_cpus)

It only provides CLI interface to do mapping, there is no QMP
one as I haven't found a suitable place/way to update/set mapping
after machine_done for QEMU started with -S (stopped mode) so that
mgmt could query hopluggable-cpus first, then map them to numa nodes
in runtime before actually allowing guest to run.

Another alternative I've been considering is to add CLI option
similar to -S but that would pause initialization before machine_init()
callback is run so that user can get CPU layout with hopluggable-cpus,
then map CPUs to numa nodes and unpause to let machine_init() initialize
machine using previously predefined numa mapping.
Such option might also be useful for other usecases.


git repo for testing:
   https://github.com/imammedo/qemu.git cphp_numa_cfg_v2
reference to v1:
   https://www.mail-archive.com/qemu-devel@nongnu.org/msg438955.html

CC: Eduardo Habkost <ehabkost@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>
CC: Andrew Jones <drjones@redhat.com>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Eric Blake <eblake@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Shannon Zhao <zhaoshenglong@huawei.com>
CC: qemu-arm@nongnu.org
CC: qemu-ppc@nongnu.org

Igor Mammedov (24):
  tests: add CPUs to numa node mapping test
  hw/arm/virt: extract mp-affinity calculation in separate function
  hw/arm/virt: use machine->possible_cpus for storing possible topology
    info
  hw/arm/virt: explicitly allocate cpu_index for cpus
  numa: move source of default CPUs to NUMA node mapping into boards
  spapr: add node-id property to sPAPR core
  pc: add node-id property to CPU
  virt-arm: add node-id property to CPU
  numa: add check that board supports cpu_index to node mapping
  numa: mirror cpu to node mapping in MachineState::possible_cpus
  numa: do default mapping based on possible_cpus instead of node_cpu
    bitmaps
  numa: add numa_[has_]node_id() wrappers
  pc: get numa node mapping from possible_cpus instead of
    numa_get_node_for_cpu()
  spapr: get numa node mapping from possible_cpus instead of
    numa_get_node_for_cpu()
  virt-arm: get numa node mapping from possible_cpus instead of
    numa_get_node_for_cpu()
  QMP: include CpuInstanceProperties into query_cpus output output
  tests: numa: add case for QMP command query-cpus
  numa: remove no longer used numa_get_node_for_cpu()
  numa: remove no longer need numa_post_machine_init()
  machine: call machine init from wrapper
  numa: use possible_cpus for not mapped CPUs check
  numa: remove node_cpu bitmaps as they are no longer used
  numa: add '-numa cpu,...' option for property based node mapping
  tests: check -numa node,cpu=props_list usecase

 include/hw/boards.h             |  11 +-
 include/hw/ppc/spapr_cpu_core.h |   1 +
 include/qom/cpu.h               |   2 +
 include/sysemu/numa.h           |  16 ++-
 target/arm/cpu.h                |   2 +
 cpus.c                          |  10 ++
 hw/acpi/cpu.c                   |   7 +-
 hw/arm/virt-acpi-build.c        |  19 +--
 hw/arm/virt.c                   | 123 +++++++++++++---
 hw/core/machine.c               | 132 ++++++++++++++++++
 hw/i386/acpi-build.c            |  11 +-
 hw/i386/pc.c                    |  54 +++++--
 hw/ppc/spapr.c                  |  44 +++++-
 hw/ppc/spapr_cpu_core.c         |  21 ++-
 numa.c                          | 157 +++++++++------------
 qapi-schema.json                |  27 +++-
 qemu-options.hx                 |  23 ++-
 target/arm/cpu.c                |  13 +-
 target/i386/cpu.c               |   1 +
 tests/Makefile.include          |   5 +
 tests/numa-test.c               | 302 ++++++++++++++++++++++++++++++++++++++++
 vl.c                            |   6 +-
 22 files changed, 796 insertions(+), 191 deletions(-)
 create mode 100644 tests/numa-test.c

-- 
2.7.4

