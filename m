Received: by 10.25.0.144 with SMTP id 138csp754850lfa;
        Thu, 13 Apr 2017 06:58:19 -0700 (PDT)
X-Received: by 10.55.217.205 with SMTP id q74mr2457755qkl.136.1492091899665;
        Thu, 13 Apr 2017 06:58:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h89si10242702qtd.269.2017.04.13.06.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Apr 2017 06:58:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cyfGN-0004X1-4s
	for alex.bennee@linaro.org; Thu, 13 Apr 2017 09:58:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cyfGJ-0004Ww-OT
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 09:58:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cyfGE-0004dn-Sm
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 09:58:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41306)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1cyfGE-0004cS-Ju; Thu, 13 Apr 2017 09:58:10 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 437EB8E251;
	Thu, 13 Apr 2017 13:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 437EB8E251
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 437EB8E251
Received: from localhost (ovpn-116-31.gru2.redhat.com [10.97.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F26839FDEB;
	Thu, 13 Apr 2017 13:58:06 +0000 (UTC)
Date: Thu, 13 Apr 2017 10:58:05 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170413135805.GE27126@thinpad.lan.raisama.net>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-11-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1490189568-167621-11-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 13 Apr 2017 13:58:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.10 10/23] numa: mirror cpu
 to node mapping in MachineState::possible_cpus
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
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A3zbHM4Ve8oH

On Wed, Mar 22, 2017 at 02:32:35PM +0100, Igor Mammedov wrote:
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
> ---
>  include/hw/boards.h |  2 ++
>  hw/core/machine.c   | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  numa.c              |  8 +++++++
>  3 files changed, 78 insertions(+)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 1dd0fde..40f30f1 100644
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
> index 0d92672..6ff0b45 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -388,6 +388,74 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
>      return head;
>  }
>  
> +void machine_set_cpu_numa_node(MachineState *machine,
> +                               CpuInstanceProperties *props, Error **errp)

If you change this to:

  void cpu_slot_set_numa_node(CPUArchId *slot, uint64_t node_id,
                              Error **errp);

and move the CPU slot lookup code from machine_set_cpu_numa_node()
to a helper:

  CPUArchId *machine_get_cpu_slot(MachineState *machine,
                                  CpuInstanceProperties *props, Error **errp);

and change cpu_index_to_cpu_instance_props to return CPUArchId:

  CPUArchId *cpu_index_to_cpu_slot(MachineState *machine, int cpu_index);

We could simply have this on "-numa cpu" code:

    slot = machine_get_cpu_slot(machine, props);
    cpu_slot_set_numa_node(slot, node_id);

and this on the legacy "-numa node,cpu=..." code:

    slot = mc->cpu_index_to_cpu_slot(machine, i);
    cpu_slot_set_numa_node(slot, node_id);

I believe we will be able to reuse machine_get_cpu_slot() to
replace pc_find_cpu_slot() and spapr_find_cpu_slot() later.

(I also suggest renaming "CPUArchId" and "possible CPUs" to
"CPUSlot" and "CPU slots" in the code and comments. This would
help people reviewing the code, but it can be done later if you
prefer.)

[...]
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
> 

-- 
Eduardo
