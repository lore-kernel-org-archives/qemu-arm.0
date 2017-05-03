Received: by 10.25.0.198 with SMTP id 189csp136174lfa;
        Wed, 3 May 2017 07:47:04 -0700 (PDT)
X-Received: by 10.55.97.76 with SMTP id v73mr3197348qkb.241.1493822824830;
        Wed, 03 May 2017 07:47:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 46si19836185qte.210.2017.05.03.07.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 07:47:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37187 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5vYW-0002T3-AZ
	for alex.bennee@linaro.org; Wed, 03 May 2017 10:47:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d5vYP-0002Sr-Ib
	for qemu-arm@nongnu.org; Wed, 03 May 2017 10:46:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d5vYL-0000K9-1a
	for qemu-arm@nongnu.org; Wed, 03 May 2017 10:46:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37624)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d5vYK-0000Jj-Ny; Wed, 03 May 2017 10:46:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8593880C0A;
	Wed,  3 May 2017 14:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8593880C0A
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8593880C0A
Received: from localhost (ovpn-116-4.gru2.redhat.com [10.97.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0EDB317DF5;
	Wed,  3 May 2017 14:46:50 +0000 (UTC)
Date: Wed, 3 May 2017 11:46:44 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170503144644.GM3482@thinpad.lan.raisama.net>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-7-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493816238-33120-7-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 03 May 2017 14:46:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 06/24] spapr: add node-id property to
 sPAPR core
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
X-TUID: S7lUv+QyRq2D

On Wed, May 03, 2017 at 02:57:00PM +0200, Igor Mammedov wrote:
> it will allow switching from cpu_index to core based numa
> mapping in follow up patches.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Have you considered adding this to TYPE_CPU instead of
duplicating the same code on multiple architectures/boards?

> ---
>  include/hw/ppc/spapr_cpu_core.h |  1 +
>  include/qom/cpu.h               |  2 ++
>  hw/ppc/spapr.c                  | 17 +++++++++++++++++
>  hw/ppc/spapr_cpu_core.c         | 11 ++++++++---
>  4 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
> index 3c35665..93051e9 100644
> --- a/include/hw/ppc/spapr_cpu_core.h
> +++ b/include/hw/ppc/spapr_cpu_core.h
> @@ -27,6 +27,7 @@ typedef struct sPAPRCPUCore {
>  
>      /*< public >*/
>      void *threads;
> +    int node_id;
>  } sPAPRCPUCore;
>  
>  typedef struct sPAPRCPUCoreClass {
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 5d10359..55214ce 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -258,6 +258,8 @@ typedef void (*run_on_cpu_func)(CPUState *cpu, run_on_cpu_data data);
>  
>  struct qemu_work_item;
>  
> +#define CPU_UNSET_NUMA_NODE_ID -1
> +
>  /**
>   * CPUState:
>   * @cpu_index: CPU index (informative).
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 33405a0..7f58ee4 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2824,9 +2824,11 @@ static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>      MachineClass *mc = MACHINE_GET_CLASS(hotplug_dev);
>      Error *local_err = NULL;
>      CPUCore *cc = CPU_CORE(dev);
> +    sPAPRCPUCore *sc = SPAPR_CPU_CORE(dev);
>      char *base_core_type = spapr_get_cpu_core_type(machine->cpu_model);
>      const char *type = object_get_typename(OBJECT(dev));
>      CPUArchId *core_slot;
> +    int node_id;
>      int index;
>  
>      if (dev->hotplugged && !mc->has_hotpluggable_cpus) {
> @@ -2861,6 +2863,21 @@ static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>          goto out;
>      }
>  
> +    node_id = numa_get_node_for_cpu(cc->core_id);
> +    if (node_id == nb_numa_nodes) {
> +        /* by default CPUState::numa_node was 0 if it's not set via CLI
> +         * keep it this way for now but in future we probably should
> +         * refuse to start up with incomplete numa mapping */
> +        node_id = 0;
> +    }
> +    if (sc->node_id == CPU_UNSET_NUMA_NODE_ID) {
> +        sc->node_id = node_id;
> +    } else if (sc->node_id != node_id) {
> +        error_setg(&local_err, "node-id %d must match numa node specified"
> +            "with -numa option for cpu-index %d", sc->node_id, cc->core_id);
> +        goto out;
> +    }
> +
>  out:
>      g_free(base_core_type);
>      error_propagate(errp, local_err);
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index 4389ef4..9de7a56 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -176,7 +176,6 @@ static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
>      const char *typename = object_class_get_name(scc->cpu_class);
>      size_t size = object_type_get_instance_size(typename);
>      Error *local_err = NULL;
> -    int core_node_id = numa_get_node_for_cpu(cc->core_id);;
>      void *obj;
>      int i, j;
>  
> @@ -194,10 +193,10 @@ static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
>  
>          /* Set NUMA node for the added CPUs  */
>          node_id = numa_get_node_for_cpu(cs->cpu_index);
> -        if (node_id != core_node_id) {
> +        if (node_id != sc->node_id) {
>              error_setg(&local_err, "Invalid node-id=%d of thread[cpu-index: %d]"
>                  " on CPU[core-id: %d, node-id: %d], node-id must be the same",
> -                 node_id, cs->cpu_index, cc->core_id, core_node_id);
> +                 node_id, cs->cpu_index, cc->core_id, sc->node_id);
>              goto err;
>          }
>          if (node_id < nb_numa_nodes) {
> @@ -263,6 +262,11 @@ static const char *spapr_core_models[] = {
>      "POWER9_v1.0",
>  };
>  
> +static Property spapr_cpu_core_properties[] = {
> +    DEFINE_PROP_INT32("node-id", sPAPRCPUCore, node_id, CPU_UNSET_NUMA_NODE_ID),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
>  void spapr_cpu_core_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
> @@ -270,6 +274,7 @@ void spapr_cpu_core_class_init(ObjectClass *oc, void *data)
>  
>      dc->realize = spapr_cpu_core_realize;
>      dc->unrealize = spapr_cpu_core_unrealizefn;
> +    dc->props = spapr_cpu_core_properties;
>      scc->cpu_class = cpu_class_by_name(TYPE_POWERPC_CPU, data);
>      g_assert(scc->cpu_class);
>  }
> -- 
> 2.7.4
> 

-- 
Eduardo
