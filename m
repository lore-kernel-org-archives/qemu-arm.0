Received: by 10.223.150.237 with SMTP id u100csp2688178wrb;
        Mon, 6 Nov 2017 06:10:46 -0800 (PST)
X-Google-Smtp-Source: ABhQp+QSzDO1991hRKX6InaBNpRIMxEfv0PSW/BDp8hEeINhPJb/IJsgoMEgIljlFBZ0+lBFv9zJ
X-Received: by 10.129.229.2 with SMTP id s2mr9623249ywl.90.1509977445920;
        Mon, 06 Nov 2017 06:10:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509977445; cv=none;
        d=google.com; s=arc-20160816;
        b=hjj0LQJhbjKQgr3RHUuYgNmDZr0/yOitFjPLmjerytpG+6symeL3qw7NKEjeN41X4B
         /QIyp398cdUNX3o2R5L0Jqi7cB1ECHFAOb0yGMXa3gOTLp9093uKUXkYPh1WQQQO2CLX
         ZQeMYZQEyeeRdgVfoYAn0vafFZLb3xhkGYthGYVvzAEzmDjj4I/vGuVOIveFfTU0ZcYW
         wfMCBjV2L2gmcncKporHNzKcTkl+kVSPbhAYq6IX+RQq1SPnfI3Dk4lM8l/4DOINzhr6
         ly/QEM766eXHNjX+Btyg/av6Cs7UxdqRARmGSVAsHbvOnbF9u3t1LsOizVuuGR4lNAl8
         CHpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=OiOXhq0GR8aWM7MHWLc0dW/Z/NfsdODoSZPmzVXjmF0=;
        b=lNf1D7n3GIOJE5LNmBl/4ALeiERAOEGmvI3ve/CfUNbqejTcRhPTHU0lTTfo4vsYSA
         Rn3OYeRo0eeNk5nK3iT65i/Vl7oZAqxkDGbxUO8zFJxje9gxq/8KyPAeQNWmfUJJlXsQ
         Kd/t+Tr+QJ7wPo5ZrOCUNKFDGoS8B6XRM6cxrazixVxIQsj1qGw4nX3KVSkr37PE3gva
         eM72SgcRJTnomQmrmFwtly4wFGNjLHbDjoJ5yq/a5Mm5RBDsrdYEBxkssGPNv35RPyjO
         njWHxM/g/rqqeHXPh0G4vf3i4uJKVD3ClyX4I+DRcmR9QcB9o246WFFwVPoCDG1Bxqyb
         aIkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t7si2747557ywh.747.2017.11.06.06.10.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 06:10:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBi6v-0002df-9l
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 09:10:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eBi6k-0002dY-WE
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 09:10:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eBi6g-0000CL-LK
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 09:10:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53498)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1eBi6g-0000Bh-BJ; Mon, 06 Nov 2017 09:10:30 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 711A57F7DA;
	Mon,  6 Nov 2017 14:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 711A57F7DA
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-35.gru2.redhat.com [10.97.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED1EE60C91;
	Mon,  6 Nov 2017 14:10:23 +0000 (UTC)
Date: Mon, 6 Nov 2017 12:10:22 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Emilio G. Cota" <cota@braap.org>
Message-ID: <20171106141022.GO3111@localhost.localdomain>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
	<20171103185610.GA3907@flamenco>
	<20171103200233.GI3111@localhost.localdomain>
	<20171103222407.GA22411@flamenco>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171103222407.GA22411@flamenco>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 06 Nov 2017 14:10:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw: add .min_cpus and .default_cpus fields
 to machine_class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NKrioKvlGxy8

On Fri, Nov 03, 2017 at 06:24:07PM -0400, Emilio G. Cota wrote:
> On Fri, Nov 03, 2017 at 21:02:33 +0100, Eduardo Habkost wrote:
> > On Fri, Nov 03, 2017 at 02:56:10PM -0400, Emilio G. Cota wrote:
> > > On Fri, Nov 03, 2017 at 14:47:33 -0400, Emilio G. Cota wrote:
> > > > diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> > > > index e2d15a1..395d1b5 100644
> > > > --- a/hw/arm/xlnx-zcu102.c
> > > > +++ b/hw/arm/xlnx-zcu102.c
> (snip)
> > > 
> > > Should we update max_cpus to just NUM_APU_CPUS as well for these boards?
> > > -smp 5 or 6 (NUM_APU + NUM_RPU) still gets us 4 vCPUs.
> > > 
> > > I see there's code for RPU cpus but it seems disabled at compile-time
> > > at xlnx-zynqmp.c:431:
> > >    DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false)
> > > Or is there a run-time way to override this?
> > 
> > Device properties can be overridden using -global, e.g.:
> > 
> >   -global driver=xlnx,,zynqmp,property=has_rpu,value=on
> > 
> > (",," is how commas are escaped in QEMU options)
> 
> Very interesting! This raises two separate issues.
> 
> 1. Using this feature breaks 55c3cee ("qom: Introduce CPUClass.tcg_initialize",
>   2017-10-24). For instance:
> 	qemu-system-aarch64 -machine xlnx-zcu102 \
> 	 -global driver=xlnx,,zynqmp,property=has_rpu,value=on
>   This will try to initialize TCG twice. The reason is that the second
>   set of CPUs (the "RPUs") is of a different "object type name", which ends
>   up as a different CPUClass. In xlnx-zynqmp.c:
> 
>     for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
>         char *name;
> 
>         object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
>                           "cortex-r5-" TYPE_ARM_CPU);
>   This hunk only runs when we use the -global override.
> 
>   This other hunk always runs. It initializes the "APUs":
>       for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
>         object_initialize(&s->apu_cpu[i], sizeof(s->apu_cpu[i]),
>                           "cortex-a53-" TYPE_ARM_CPU);
> 
>   A trivial, ugly fix would be to either use the same "object name"
>   for both sets of CPUs or (re)introduce a static variable in
>   arm_translate_init.
>   I'd prefer to be able to set tcg_initialized field directly for
>   the RPU's CPUClass. Is that possible? I don't know much about
>   qom/object code, so any good suggestion here would be appreciated.

IMO, initialization state doesn't belong to CPUClass.  We already
have a single accelerator object in MachineState::accelerator,
and tcg_initialized could be moved to a AccelState::initialized
field.

> 
> 2. Coming back to the original problem: given that we can get
>   additional vCPUs, I think we need an additional flag to signal
>   this. Otherwise we'll have to always do "max_cpus = mc.max_cpus",
>   which for most machines would be a huge waste of TCG regions.
>   See delta below.
> 
> Thanks,
> 
> 		Emilio
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 62f160e..8c8ce51 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -103,6 +103,7 @@ typedef struct {
>  /**
>   * MachineClass:
>   * @max_cpus: maximum number of CPUs supported. Default: 1
> + * @force_max_cpus: if set, force the global max_cpus to match @max_cpus
>   * @min_cpus: minimum number of CPUs supported. Default: 1
>   * @default_cpus: number of CPUs instantiated if none are specified. Default: 1
>   * @get_hotplug_handler: this function is called during bus-less

If we have a field containing the default value for smp_cpus
(default_cpus), what about a default_max_cpus field for the
default value of max_cpus?  This could make the rules a bit
easier to follow.

(But I wonder if there's a way we can do this without introducing
another MachineClass field and making the initialization code
more complex.)

The fact that MachineClass::max_cpus and the 'max_cpus' globals
have completely different meanings makes this confusing enough.
Maybe we should rename the 'max_cpus' global variable to
'max_hotplug_cpus'.


> @@ -181,7 +182,8 @@ struct MachineClass {
>          no_sdcard:1,
>          has_dynamic_sysbus:1,
>          pci_allow_0_address:1,
> -        legacy_fw_cfg_order:1;
> +        legacy_fw_cfg_order:1,
> +        force_max_cpus;
>      int is_default;
>      const char *default_machine_opts;
>      const char *default_boot_order;
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 395d1b5..e406dc3 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -186,6 +186,7 @@ static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
>      mc->units_per_default_bus = 1;
>      mc->ignore_memory_transaction_failures = true;
>      mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
> +    mc->force_max_cpus = 1;
>      mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>      mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>  }
> @@ -244,6 +245,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
>      mc->units_per_default_bus = 1;
>      mc->ignore_memory_transaction_failures = true;
>      mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
> +    mc->force_max_cpus = 1;
>      mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>      mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
>  }
> diff --git a/vl.c b/vl.c
> index 3ca5ee8..a21183d 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4339,6 +4339,15 @@ int main(int argc, char **argv, char **envp)
>          max_cpus = machine_class->default_cpus;
>      }
>  
> +    /*
> +     * Some boards can instantiate additional CPUs, e.g. by overriding
> +     * device params via -global arguments, so they enforce the value
> +     * that max_cpus should take.
> +     */
> +    if (machine_class->force_max_cpus) {
> +        max_cpus = machine_class->max_cpus;
> +    }
> +
>      /* sanity-check smp_cpus and max_cpus */
>      if (smp_cpus < machine_class->min_cpus) {
>          error_report("Invalid SMP CPUs %d. The min CPUs "

-- 
Eduardo
