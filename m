Received: by 10.25.0.198 with SMTP id 189csp493908lfa;
        Thu, 4 May 2017 02:57:45 -0700 (PDT)
X-Received: by 10.200.37.70 with SMTP id 6mr38132639qtn.130.1493891865252;
        Thu, 04 May 2017 02:57:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b35si1478276qte.271.2017.05.04.02.57.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 May 2017 02:57:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6DW2-0005I3-L0
	for alex.bennee@linaro.org; Thu, 04 May 2017 05:57:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6DVt-0005GP-5y
	for qemu-arm@nongnu.org; Thu, 04 May 2017 05:57:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6DVo-0002kO-5W
	for qemu-arm@nongnu.org; Thu, 04 May 2017 05:57:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49300)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1d6DVn-0002k0-Sk; Thu, 04 May 2017 05:57:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 903654E047;
	Thu,  4 May 2017 09:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 903654E047
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 903654E047
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39C1E18386;
	Thu,  4 May 2017 09:57:23 +0000 (UTC)
Date: Thu, 4 May 2017 11:57:20 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170504095720.eof3a7nguug6ehzv@kamzik.brq.redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-9-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493816238-33120-9-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 04 May 2017 09:57:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 08/24] virt-arm: add node-id property to
 CPU
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BDrM4ouQNejp

On Wed, May 03, 2017 at 02:57:02PM +0200, Igor Mammedov wrote:
> it will allow switching from cpu_index to property based
> numa mapping in follow up patches.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/arm/virt.c    | 15 +++++++++++++++
>  target/arm/cpu.c |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 3e19b5f..05a2822 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1350,6 +1350,7 @@ static void machvirt_init(MachineState *machine)
>      for (n = 0; n < possible_cpus->len; n++) {
>          Object *cpuobj;
>          CPUState *cs;
> +        int node_id;
>  
>          if (n >= smp_cpus) {
>              break;
> @@ -1362,6 +1363,20 @@ static void machvirt_init(MachineState *machine)
>          cs = CPU(cpuobj);
>          cs->cpu_index = n;
>  
> +        node_id = numa_get_node_for_cpu(cs->cpu_index);
> +        if (node_id == nb_numa_nodes) {
> +            /* by default CPUState::numa_node was 0 if it's not set via CLI
> +             * keep it this way for now but in future we probably should
> +             * refuse to start up with incomplete numa mapping */
> +             node_id = 0;
> +        }
> +        if (cs->numa_node == CPU_UNSET_NUMA_NODE_ID) {
> +            cs->numa_node = node_id;
> +        } else {
> +            /* CPU isn't device_add compatible yet, this shouldn't happen */
> +            error_setg(&error_abort, "user set node-id not implemented");
> +        }
> +
>          if (!vms->secure) {
>              object_property_set_bool(cpuobj, false, "has_el3", NULL);
>          }
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ee1406d..c185eb1 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1573,6 +1573,7 @@ static Property arm_cpu_properties[] = {
>      DEFINE_PROP_UINT32("midr", ARMCPU, midr, 0),
>      DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
>                          mp_affinity, ARM64_AFFINITY_INVALID),
> +    DEFINE_PROP_INT32("node-id", CPUState, numa_node, CPU_UNSET_NUMA_NODE_ID),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> -- 
> 2.7.4
>

Reviewed-by: Andrew Jones <drjones@redhat.com> 
