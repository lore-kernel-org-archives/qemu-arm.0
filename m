Received: by 10.25.0.6 with SMTP id 6csp868794lfa;
        Thu, 18 May 2017 11:51:15 -0700 (PDT)
X-Received: by 10.200.36.10 with SMTP id c10mr5377278qtc.160.1495133475335;
        Thu, 18 May 2017 11:51:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495133475; cv=none;
        d=google.com; s=arc-20160816;
        b=lNQToHBvzq7eGDkdsvx0KtM2W0byhz6hhOjjpglwnBaYGpuXyIRdqiMiQIR8C2sYbV
         clRWQGxh+/+Ym7IcAs1b2ZWxZSJhPy1EFJPTUDITHQjqn1zcjfHeoqWPRWOt11kEg/Pt
         Vn6s7kzThFTU5DjZg4F+mgR44rktu3p8CYBfNNPEE3ZcsXWVUDJCf4CR/hAa8k0UZ3qI
         QlVtB4mRFESUgcrk14xA0PuRXRR+PtJk0jewF67B5gon8yoeOOA9aedXSXvdhxNBw73q
         sjn3QoGi2RYOK2YHc6gVmSLqjkNL/IIOhn54xrNwZHAtEjMTKq0vzpmaptWkXQDQ9OSn
         7DeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=MCFZZpLU9LrmbDDfQZcuOtM3gZU7s3yDOiScVCaUk3U=;
        b=bMeMQRyVFsB1FG7inpR6DwH3NTVhIaOO9I53ZLuoin+cZajHL/QmffqMv+81emA0GH
         qgL9XgbjYSVuebQHers4+rmfaoKLq/JQAYjw/3rtTMEuBt6dnoCB9NzRAPbePsrEXDEq
         HFfQTBmKu3PXIIw8G2CkPMM3y/nrwkqC92hWTOMetvw1QrBiKXJb/e759alYXRAxOfBU
         GxYhE9C05BK7bMxicAG8DFWes1vi3LprJnx6GjDQGgH4FPhPY04bxdfWfaN327XNFF9U
         yTedr7Q7xHfdbfj/RE4NZUenJqRje6rYlYhiAXmexQpMtPJGsq6Atgweqt6goyExevHV
         RPSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s32si3443826qts.244.2017.05.18.11.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 May 2017 11:51:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBQW2-0002wN-R9
	for alex.bennee@linaro.org; Thu, 18 May 2017 14:51:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dBQVu-0002wC-JV
	for qemu-arm@nongnu.org; Thu, 18 May 2017 14:51:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dBQVr-0000pO-9N
	for qemu-arm@nongnu.org; Thu, 18 May 2017 14:51:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60616)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dBQVq-0000p5-Qh; Thu, 18 May 2017 14:51:03 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6211F804FC;
	Thu, 18 May 2017 18:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6211F804FC
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6211F804FC
Received: from localhost (ovpn-116-71.gru2.redhat.com [10.97.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E11B18225;
	Thu, 18 May 2017 18:50:59 +0000 (UTC)
Date: Thu, 18 May 2017 15:50:58 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170518185058.GP4748@thinpad.lan.raisama.net>
References: <1495094971-177754-1-git-send-email-imammedo@redhat.com>
	<1495094971-177754-3-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1495094971-177754-3-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 18 May 2017 18:51:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 2/3] numa: move default mapping init to
 machine
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
	qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aJZ5UGHD3RZA

On Thu, May 18, 2017 at 10:09:30AM +0200, Igor Mammedov wrote:
> there is no need use cpu_index_to_instance_props() for setting
> default cpu -> node mapping. Generic machine code can do it
> without cpu_index by just enabling already preset defaults
> in possible_cpus.
> 
> PS:
> as bonus it makes one less user of cpu_index_to_instance_props()
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/core/machine.c | 32 +++++++++++++++++++++-----------
>  numa.c            | 26 --------------------------
>  2 files changed, 21 insertions(+), 37 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index fd6a436..2e91aa9 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -700,26 +700,36 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
>      return g_string_free(s, false);
>  }
>  
> -static void machine_numa_validate(MachineState *machine)
> +static void machine_numa_finish_init(MachineState *machine)
>  {
> -    int i;
> +    int i, default_mapping;

I suggest bool instead of int.

>      GString *s = g_string_new(NULL);
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>      const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(machine);
>  
>      assert(nb_numa_nodes);
> +    for (i = possible_cpus->len;
> +         i && !possible_cpus->cpus[i - 1].props.has_node_id;
> +         i--)
> +        ;;

I believe the original code was more readable, and it had only 1
more line than this version. i.e.:

    for (i = 0; i < possible_cpus->len; i++) {
        if (possible_cpus->cpus[i].props.has_node_id) {
            break;
        }
    }
    default_mapping = (i == possible_cpus->len);

> +    default_mapping = !i; /* i == 0 : no explicit mapping provided by user */
> +
>      for (i = 0; i < possible_cpus->len; i++) {
>          const CPUArchId *cpu_slot = &possible_cpus->cpus[i];
>  
> -        /* at this point numa mappings are initilized by CLI options
> -         * or with default mappings so it's sufficient to list
> -         * all not yet mapped CPUs here */
> -        /* TODO: make it hard error in future */

Did we change our mind about making it a hard error in the
future?

>          if (!cpu_slot->props.has_node_id) {
> -            char *cpu_str = cpu_slot_to_string(cpu_slot);
> -            g_string_append_printf(s, "%sCPU %d [%s]", s->len ? ", " : "", i,
> -                                   cpu_str);
> -            g_free(cpu_str);
> +            if (default_mapping) {
> +                /* fetch default mapping from board and enable it */
> +                CpuInstanceProperties props = cpu_slot->props;
> +                props.has_node_id = true;
> +                machine_set_cpu_numa_node(machine, &props, &error_fatal);

Is a machine_set_cpu_numa_node() call really necessary here, if
we are already looking at cpu_slot->props directly?

> +            } else {
> +                /* record slots with not set mapping */
> +                char *cpu_str = cpu_slot_to_string(cpu_slot);
> +                g_string_append_printf(s, "%sCPU %d [%s]",
> +                                       s->len ? ", " : "", i, cpu_str);
> +                g_free(cpu_str);
> +            }
>          }

What about doing this instead:

        if (default_mapping) {
            /*
             * Default mapping was already set by board at
             * cpu_slot->props.node_id, just enable it
             */
            cpu_slot->props.has_node_id = true;
        } else if (!cpu_slot->props.has_node_id) {
            char *cpu_str = cpu_slot_to_string(cpu_slot);
            g_string_append_printf(s, "%sCPU %d [%s]", s->len ? ", " : "", i,
                                   cpu_str);
            g_free(cpu_str);
        }

>      }
>      if (s->len) {
> @@ -737,7 +747,7 @@ void machine_run_board_init(MachineState *machine)
>      MachineClass *machine_class = MACHINE_GET_CLASS(machine);
>  
>      if (nb_numa_nodes) {
> -        machine_numa_validate(machine);
> +        machine_numa_finish_init(machine);
>      }
>      machine_class->init(machine);
>  }
> diff --git a/numa.c b/numa.c
> index 0115bfd..796cd7d 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -427,7 +427,6 @@ void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
>  void parse_numa_opts(MachineState *ms)
>  {
>      int i;
> -    const CPUArchIdList *possible_cpus;
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
>  
>      if (qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, NULL)) {
> @@ -485,31 +484,6 @@ void parse_numa_opts(MachineState *ms)
>  
>          numa_set_mem_ranges();
>  
> -        /* assign CPUs to nodes using board provided default mapping */
> -        if (!mc->cpu_index_to_instance_props || !mc->possible_cpu_arch_ids) {
> -            error_report("default CPUs to NUMA node mapping isn't supported");
> -            exit(1);
> -        }
> -
> -        possible_cpus = mc->possible_cpu_arch_ids(ms);
> -        for (i = 0; i < possible_cpus->len; i++) {
> -            if (possible_cpus->cpus[i].props.has_node_id) {
> -                break;
> -            }
> -        }
> -
> -        /* no CPUs are assigned to NUMA nodes */
> -        if (i == possible_cpus->len) {
> -            for (i = 0; i < max_cpus; i++) {
> -                CpuInstanceProperties props;
> -                /* fetch default mapping from board and enable it */
> -                props = mc->cpu_index_to_instance_props(ms, i);
> -                props.has_node_id = true;
> -
> -                machine_set_cpu_numa_node(ms, &props, &error_fatal);
> -            }
> -        }
> -
>          /* QEMU needs at least all unique node pair distances to build
>           * the whole NUMA distance table. QEMU treats the distance table
>           * as symmetric by default, i.e. distance A->B == distance B->A.
> -- 
> 2.7.4
> 

-- 
Eduardo
