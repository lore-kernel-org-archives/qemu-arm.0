Received: by 10.25.0.198 with SMTP id 189csp151953lfa;
        Wed, 3 May 2017 08:20:43 -0700 (PDT)
X-Received: by 10.237.45.194 with SMTP id i60mr30850816qtd.262.1493824843554;
        Wed, 03 May 2017 08:20:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o5si2012783qkd.300.2017.05.03.08.20.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 08:20:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5w52-0007NU-Tj
	for alex.bennee@linaro.org; Wed, 03 May 2017 11:20:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d5w4v-0007MF-1x
	for qemu-arm@nongnu.org; Wed, 03 May 2017 11:20:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d5w4p-0007zc-Gi
	for qemu-arm@nongnu.org; Wed, 03 May 2017 11:20:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57524)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d5w4p-0007yk-6a; Wed, 03 May 2017 11:20:27 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B96A0804EC;
	Wed,  3 May 2017 15:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B96A0804EC
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B96A0804EC
Received: from localhost (ovpn-116-4.gru2.redhat.com [10.97.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F02E617F55;
	Wed,  3 May 2017 15:20:23 +0000 (UTC)
Date: Wed, 3 May 2017 12:20:22 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170503152022.GQ3482@thinpad.lan.raisama.net>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-11-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493816238-33120-11-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 03 May 2017 15:20:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 10/24] numa: mirror cpu to node mapping in
 MachineState::possible_cpus
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
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BLYks5dRIXsA

On Wed, May 03, 2017 at 02:57:04PM +0200, Igor Mammedov wrote:
> Introduce machine_set_cpu_numa_node() helper that stores
> node mapping for CPU in MachineState::possible_cpus.
> CPU and node it belongs to is specified by 'props' argument.
> 
> Patch doesn't remove old way of storing mapping in
> numa_info[X].node_cpu as removing it at the same time
> makes patch rather big. Instead it just mirrors mapping
> in possible_cpus and follow up per target patches will
> switch to possible_cpus and numa_info[X].node_cpu will
> be removed once there isn't any users left.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  include/hw/boards.h |  2 ++
>  hw/core/machine.c   | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  numa.c              |  8 +++++++
>  3 files changed, 78 insertions(+)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 5d6af21..1f518a1 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -42,6 +42,8 @@ bool machine_dump_guest_core(MachineState *machine);
>  bool machine_mem_merge(MachineState *machine);
>  void machine_register_compat_props(MachineState *machine);
>  HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine);
> +void machine_set_cpu_numa_node(MachineState *machine,
> +                               CpuInstanceProperties *props, Error **errp);
>  
>  /**
>   * CPUArchId:
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index ada9eea..a63f17b 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -388,6 +388,74 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
>      return head;
>  }
>  
> +void machine_set_cpu_numa_node(MachineState *machine,
> +                               CpuInstanceProperties *props, Error **errp)

As the semantics of this function aren't trivial, it would be
nice to have a comment explaining what exactly this function do.

e.g.:
* make it clear that it could affect multiple CPU slots;
* make it clear what does it mean to have props->has_node_id=false as
  argument (is it really valid?);
* make it clear that it will refuse to change an existing mapping.


> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
> +    bool match = false;
> +    int i;
> +
> +    if (!mc->possible_cpu_arch_ids) {
> +        error_setg(errp, "mapping of CPUs to NUMA node is not supported");
> +        return;
> +    }
> +
> +    /* force board to initialize possible_cpus if it hasn't been done yet */
> +    mc->possible_cpu_arch_ids(machine);
> +
> +    for (i = 0; i < machine->possible_cpus->len; i++) {
> +        CPUArchId *slot = &machine->possible_cpus->cpus[i];
> +
> +        /* reject unsupported by board properties */
> +        if (props->has_thread_id && !slot->props.has_thread_id) {
> +            error_setg(errp, "thread-id is not supported");
> +            return;
> +        }
> +
> +        if (props->has_core_id && !slot->props.has_core_id) {
> +            error_setg(errp, "core-id is not supported");
> +            return;
> +        }
> +
> +        if (props->has_socket_id && !slot->props.has_socket_id) {
> +            error_setg(errp, "socket-id is not supported");
> +            return;
> +        }
> +
> +        /* skip slots with explicit mismatch */
> +        if (props->has_thread_id && props->thread_id != slot->props.thread_id) {
> +                continue;
> +        }
> +
> +        if (props->has_core_id && props->core_id != slot->props.core_id) {
> +                continue;
> +        }
> +
> +        if (props->has_socket_id && props->socket_id != slot->props.socket_id) {
> +                continue;
> +        }
> +
> +        /* reject assignment if slot is already assigned, for compatibility
> +         * of legacy cpu_index mapping with SPAPR core based mapping do not
> +         * error out if cpu thread and matched core have the same node-id */
> +        if (slot->props.has_node_id &&
> +            slot->props.node_id != props->node_id) {
> +            error_setg(errp, "CPU is already assigned to node-id: %" PRId64,
> +                       slot->props.node_id);
> +            return;
> +        }
> +
> +        /* assign slot to node as it's matched '-numa cpu' key */
> +        match = true;
> +        slot->props.node_id = props->node_id;
> +        slot->props.has_node_id = props->has_node_id;

Is it really valid to have has_node_id=false? Maybe an
assert(props->has_node_id) at the beginning of the function would
be useful.

> +    }
> +
> +    if (!match) {
> +        error_setg(errp, "no match found");
> +    }
> +}
> +
>  static void machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> diff --git a/numa.c b/numa.c
> index b517870..5ff1212 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -169,6 +169,7 @@ static void numa_node_parse(MachineState *ms, NumaNodeOptions *node,
>          exit(1);
>      }
>      for (cpus = node->cpus; cpus; cpus = cpus->next) {
> +        CpuInstanceProperties props;
>          if (cpus->value >= max_cpus) {
>              error_setg(errp,
>                         "CPU index (%" PRIu16 ")"
> @@ -177,6 +178,10 @@ static void numa_node_parse(MachineState *ms, NumaNodeOptions *node,
>              return;
>          }
>          bitmap_set(numa_info[nodenr].node_cpu, cpus->value, 1);
> +        props = mc->cpu_index_to_instance_props(ms, cpus->value);
> +        props.node_id = nodenr;
> +        props.has_node_id = true;
> +        machine_set_cpu_numa_node(ms, &props, &error_fatal);
>      }
>  
>      if (node->has_mem && node->has_memdev) {
> @@ -393,9 +398,12 @@ void parse_numa_opts(MachineState *ms)
>          if (i == nb_numa_nodes) {
>              for (i = 0; i < max_cpus; i++) {
>                  CpuInstanceProperties props;
> +                /* fetch default mapping from board and enable it */
>                  props = mc->cpu_index_to_instance_props(ms, i);
> +                props.has_node_id = true;
>  
>                  set_bit(i, numa_info[props.node_id].node_cpu);
> +                machine_set_cpu_numa_node(ms, &props, &error_fatal);
>              }
>          }
>  
> -- 
> 2.7.4
> 

-- 
Eduardo
