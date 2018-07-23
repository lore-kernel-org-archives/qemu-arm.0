Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5641390wru;
        Mon, 23 Jul 2018 06:10:28 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcUvPFlI1k5+hAYkIFJn42zMIPCW7pmnxPmaA+xsR9/d9fEiNdsb3N6V61mWvVgTqmVaNge
X-Received: by 2002:aed:3aa4:: with SMTP id o33-v6mr11987243qte.359.1532351427998;
        Mon, 23 Jul 2018 06:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532351427; cv=none;
        d=google.com; s=arc-20160816;
        b=f3GO2YzorOea48VqguSHTSMCloz8qd+6/Wont1FLYLlT8iIwsbsA3ja4JUzCtK86bU
         3zuunFjxijhcyzSOEceJpMMOCXfgGYdbr4qgznOamNZkgyfGfqEbPgXd4HkJWszNZrRI
         S6TMGez89JoXtdyIt/egmi/G+yMwv0udfChMBDGgfz52ryT1AKFOaXPWwrmEVHI2HJtZ
         anmZknRSLyIp+2SrTyeaFD+7cOY8CKhWU5QA3v8EjYSE4ViHOihO/ye+rVApVfEbjI70
         aaUKHDYiULdL3YBTbU7a8h0wK/9fThJYeL59HLZpwboNMLQigjo+y13ckj4/SwR1wcYK
         OSxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=+Y1dx9xfgwA2dyGmWRj2Ie5D5AD7LFgnpZpIhv2jt+k=;
        b=M6aSV9oK0a+fZK4FnvflvfX8JVbvkRCybdGinDqtGwuCzY3WmVEyEFOzx7Gx+mFoJT
         bnoTn49XXCov5aJmPBY3OWFQYDPNaGX3bOBMV1nsnzNWD/6amx2+2tWdMin6pa92p72N
         3w3A2g4AOqfY22X5bgxnh3qcysIxBaNf8lj2cg28+C3pzV2dGbSmRp76iKD1e1TkKJwt
         beDNdylhuGzgxffz12WCo57vhwffF7ktcOw4XSlEvAXviocmgXC+PFS7O18zDFECd5vk
         3TFcH5LFIQNcgP0CQfAAFhxcH986bDWJnM+ZurSNZtnbkoh2RjHnhtu4H4f+tNyYHctz
         3/uA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h128-v6si8626863qkc.16.2018.07.23.06.10.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jul 2018 06:10:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34559 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhabb-0001Pp-G8
	for alex.bennee@linaro.org; Mon, 23 Jul 2018 09:10:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fhabU-0001Nz-CM
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 09:10:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fhabO-0003lY-9F
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 09:10:20 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33986 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fhabO-0003lR-2n; Mon, 23 Jul 2018 09:10:14 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63E254059FE3;
	Mon, 23 Jul 2018 13:10:13 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30B2A2026D65;
	Mon, 23 Jul 2018 13:10:12 +0000 (UTC)
Date: Mon, 23 Jul 2018 15:10:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20180723151010.7b4bfd8c@redhat.com>
In-Reply-To: <20180704124923.32483-4-drjones@redhat.com>
References: <20180704124923.32483-1-drjones@redhat.com>
	<20180704124923.32483-4-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 23 Jul 2018 13:10:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 23 Jul 2018 13:10:13 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC PATCH 3/6] hw/arm/virt: DT: add cpu-map
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 95c2ZwPeCorI

On Wed,  4 Jul 2018 14:49:20 +0200
Andrew Jones <drjones@redhat.com> wrote:

> Support devicetree CPU topology descriptions.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt.c         | 35 +++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 36 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 880441275031..6c5fecdd61df 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -40,6 +40,7 @@
>  #include "hw/devices.h"
>  #include "net/net.h"
>  #include "sysemu/device_tree.h"
> +#include "sysemu/cpus.h"
>  #include "sysemu/numa.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
> @@ -302,6 +303,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>      int cpu;
>      int addr_cells = 1;
>      const MachineState *ms = MACHINE(vms);
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>  
>      /*
>       * From Documentation/devicetree/bindings/arm/cpus.txt
> @@ -358,8 +360,38 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>                  ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
>          }
>  
> +        qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle",
> +                              qemu_fdt_alloc_phandle(vms->fdt));
it's not obvious how this hunk is related to patch
(also it affects ignore_cpu_topology = true which probably isn't intended)

>          g_free(nodename);
>      }
> +
> +    if (!vmc->ignore_cpu_topology) {
> +        /* From Documentation/devicetree/bindings/arm/topology.txt
> +         */
> +        qemu_fdt_add_subnode(vms->fdt, "/cpus/cpu-map");
> +
> +        for (cpu = vms->smp_cpus - 1; cpu >= 0; cpu--) {
I'd iterate over possible_cpus array instead

> +            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
> +            char *map_path;
> +
> +            if (smp_threads > 1) {
> +                map_path = g_strdup_printf(
> +                               "/cpus/cpu-map/%s%d/%s%d/%s%d",
> +                               "cluster", cpu / (smp_cores * smp_threads),
> +                               "core", (cpu / smp_threads) % smp_cores,
> +                               "thread", cpu % smp_threads);
> +            } else {
> +                map_path = g_strdup_printf(
> +                               "/cpus/cpu-map/%s%d/%s%d",
> +                               "cluster", cpu / smp_cores,
> +                               "core", cpu % smp_cores);
> +            }
not sure about direct calculation of numbers here,
do they relate in any way to ms->possible_cpus->cpus[].props.(socket|core|thread-id) ?


> +            qemu_fdt_add_path(vms->fdt, map_path);
> +            qemu_fdt_setprop_phandle(vms->fdt, map_path, "cpu", cpu_path);
> +            g_free(map_path);
> +            g_free(cpu_path);
> +        }
> +    }
>  }
>  
>  static void fdt_add_its_gic_node(VirtMachineState *vms)
> @@ -1839,7 +1871,10 @@ static void virt_3_0_instance_init(Object *obj)
>  
>  static void virt_machine_3_0_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_3_1_options(mc);
> +    vmc->ignore_cpu_topology = true;
>  }
>  DEFINE_VIRT_MACHINE(3, 0)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 9a870ccb6a57..deb8bee72cda 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -94,6 +94,7 @@ typedef struct MemMapEntry {
>  typedef struct {
>      MachineClass parent;
>      bool disallow_affinity_adjustment;
> +    bool ignore_cpu_topology;
missing doc comment for the knob

>      bool no_its;
>      bool no_pmu;
>      bool claim_edge_triggered_timers;

