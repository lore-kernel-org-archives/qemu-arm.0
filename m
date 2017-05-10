Received: by 10.25.0.6 with SMTP id 6csp237563lfa;
        Wed, 10 May 2017 04:30:26 -0700 (PDT)
X-Received: by 10.237.53.114 with SMTP id b47mr5538187qte.135.1494415825910;
        Wed, 10 May 2017 04:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494415825; cv=none;
        d=google.com; s=arc-20160816;
        b=vSmBf0eI/n86kA1TQVBw8Ow5yv/L79k7VorhBiDEFIuz9Nok+KwMgA2I3ViqA2fW8L
         Ues0hhbm26CjXqe4RbZnkrK28e6k/kvNOXOKOtz6jv0upEo90EHtQFIN+CSkSmAaLM5q
         QgM/BWlEw+FVR/7dK3sXar65HCsel0zW6B1nvv35tS8TZrQX4+p5ussJzId3vKA6cwL9
         FDxv1KFVrSapgcppeGclfqgoqLdFygBxYzexCTi7O8jTEzlsM+gIbjAf4jsjXVV9l9lb
         vNXHNPVAwG9j5BrCl4aVvx0OeFOWSWs0/b5jBMGxI2zbwBHNpejK3wLzr0DlpWAIqZJU
         cPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=pHsKrHyZ9f55pCpOd+EWxMF6knLZ5kNRjUOeoKKlDEQ=;
        b=cUKkthK82ui24A3GovquJpRy0eVMNRltQdw7BFAx05h/hOnFl5ga6AeEXKGbQARp7i
         oAUdU/PpxMzdRptT7oRlZYQlY/RfCcSYgNtrn5swqIIAEa6nSvyxv1HMxkcG3YnzUcNu
         6orQEBjTRNf9Ts7iWM0I7acwntAp/3k2ug/zEsezf0hE+0u6Mj+R8T2C3TLcZbbnrcNH
         NTY0U97Aq4QV9oEi3UNxygz7AfXttXY8gzjWjfn8KlWQ3gKm23LBBynWb4KliYnV2tyI
         4UAVBV7fIj5EtVgVYo13w692n/3jXKEg38YnLgNq2nhNp4skZfqAS7TvahJt8O3DxhCr
         w/IA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w18si2787207qtc.83.2017.05.10.04.30.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:30:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Pp3-0007RN-8F
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:30:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8Pou-0007R4-Jp
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8Por-0001ff-E4
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34932)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d8Por-0001fD-4t; Wed, 10 May 2017 07:30:13 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40BD2C059755;
	Wed, 10 May 2017 11:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 40BD2C059755
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 40BD2C059755
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F0448854F;
	Wed, 10 May 2017 11:30:04 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 May 2017 13:29:44 +0200
Message-Id: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 10 May 2017 11:30:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 00/18] numa: add '-numa cpu' option
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
X-TUID: OIsiZviR4VwW

Changes since v2:
   * rebased on top of numa-next tree
   * add comment to spapr_cpu_index_to_props() explaining why
     cpu_index can't used as index in possible_cpus[] (Eduardo)
   * remove obsolete comment in parse_numa_opts() (Eduardo)
   * add to commit message of "pc: add node-id property to CPU"
     why changing CPUState::numa_node default is safe (Eduardo)
   * amend error msg to print:
      "NUMA is not supported by this machine-type" (Eduardo)
   * add comment documenting machine_set_cpu_numa_node() semantics (Eduardo)
   * assert if props->has_node_id == false (Eduardo)
   * drop numa_[has_]node_id() wrappers (ehabkost, dwg)
   * use qapi_NumaCpuOptions_base() instead of copying fields manually (Eduardo)
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
   https://github.com/imammedo/qemu.git cphp_numa_cfg_v3
reference to v2:
   http://lists.gnu.org/archive/html/qemu-devel/2017-05/msg00526.html

CC: Eduardo Habkost <ehabkost@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>
CC: Andrew Jones <drjones@redhat.com>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Eric Blake <eblake@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Shannon Zhao <zhaoshenglong@huawei.com>
CC: qemu-arm@nongnu.org
CC: qemu-ppc@nongnu.org

Igor Mammedov (18):
  numa: move source of default CPUs to NUMA node mapping into boards
  spapr: add node-id property to sPAPR core
  pc: add node-id property to CPU
  virt-arm: add node-id property to CPU
  numa: add check that board supports cpu_index to node mapping
  numa: mirror cpu to node mapping in MachineState::possible_cpus
  numa: do default mapping based on possible_cpus instead of node_cpu
    bitmaps
  pc: get numa node mapping from possible_cpus instead of
    numa_get_node_for_cpu()
  spapr: get numa node mapping from possible_cpus instead of
    numa_get_node_for_cpu()
  virt-arm: get numa node mapping from possible_cpus instead of
    numa_get_node_for_cpu()
  QMP: include CpuInstanceProperties into query_cpus output output
  tests: numa: add case for QMP command query-cpus
  numa: remove no longer need numa_post_machine_init()
  machine: call machine init from wrapper
  numa: use possible_cpus for not mapped CPUs check
  numa: remove node_cpu bitmaps as they are no longer used
  numa: add '-numa cpu,...' option for property based node mapping
  tests: check -numa node,cpu=props_list usecase

 include/hw/boards.h             |  12 ++-
 include/hw/ppc/spapr_cpu_core.h |   1 +
 include/qom/cpu.h               |   2 +
 include/sysemu/numa.h           |   9 +-
 cpus.c                          |  10 ++
 hw/acpi/cpu.c                   |   7 +-
 hw/arm/virt-acpi-build.c        |  19 ++--
 hw/arm/virt.c                   |  44 +++++++--
 hw/core/machine.c               | 160 ++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c            |  11 +--
 hw/i386/pc.c                    |  54 ++++++++---
 hw/ppc/spapr.c                  |  45 +++++++--
 hw/ppc/spapr_cpu_core.c         |  21 ++---
 numa.c                          | 150 ++++++++++--------------------
 qapi-schema.json                |  27 +++++-
 qemu-options.hx                 |  20 ++++
 target/arm/cpu.c                |   1 +
 target/i386/cpu.c               |   1 +
 tests/numa-test.c               | 196 ++++++++++++++++++++++++++++++++++++++++
 vl.c                            |   6 +-
 20 files changed, 618 insertions(+), 178 deletions(-)

-- 
2.7.4

