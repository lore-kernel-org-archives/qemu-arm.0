Received: by 10.25.0.6 with SMTP id 6csp1836145lfa;
        Tue, 30 May 2017 07:08:58 -0700 (PDT)
X-Received: by 10.200.57.57 with SMTP id s54mr24678754qtb.53.1496153338352;
        Tue, 30 May 2017 07:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496153338; cv=none;
        d=google.com; s=arc-20160816;
        b=aul65jQpMn4LocY+/CgRr0TzHlzlzAiVj8ylckKVqzAdggckiwxFegYnYjyMvYCTzG
         /fagGhzORwkXB2fY4FFPqAeU0HWSWfnfu2dpPAh62vwiMacV02fszgEouRRwxdnGAUyc
         ir6XcPwcvIVQ/TWRYZ4MDaX5UoTpQH0e+8sxfDxUNLhWxTaK9p9YlfB+3Q9XYxefNqQj
         WP06IYSdq858VDTDsm0NDaz3fP9bYyDl9Oe5afEmK40kJDJ1fJ2lMrdSWC9zCRaTcIxL
         QMaN8zaewleV0G/e31kAoxc55WnV7iCq0abWYmOcDP3osgNTMjx+M70NIVxf7mcNcdtr
         yDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=Yv6Wr2c3Lh2E3ur1dKq87lfSQzacDHriex7RLtPh5Sg=;
        b=vSahjUY1/BodUu/+Fb2FjwQfWgsMMxJ9xWg+DVCXyxLTMmAXcUUl7KcDPZlM05OI3M
         2QIq7g86haRan2H9ZWPpWQVEd+E6Mojfy6c+VC7xp3lYW7E7DRIuwly9Yne6bh/JMTc1
         gG6/Qqa3RoW1s0vJL0xOZSFmSPrOkE+XH8S2tYXn9kvh46yKdBczujf1UVpzICEDH/CI
         hghLkg4mUL2u4xM9yhIzG8/HpZkOgLXdn4VXRK40noQL8aHW1bVPfS61NZnp+aDY1+aY
         SeUhyLdYIGkvRWaTsqofPe6xPTpv5zl8+EXUmh8vhXfKW2KWmjb5oUvxG60uVxgtcP8n
         9vsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d1si12208849qtg.163.2017.05.30.07.08.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 07:08:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54035 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFhpR-00053v-LY
	for alex.bennee@linaro.org; Tue, 30 May 2017 10:08:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dFhkx-0001aJ-CT
	for qemu-devel@nongnu.org; Tue, 30 May 2017 10:04:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dFhkp-0000Qn-Mn
	for qemu-devel@nongnu.org; Tue, 30 May 2017 10:04:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33850)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dFhkj-0000PF-1l; Tue, 30 May 2017 10:04:05 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC51880F96;
	Tue, 30 May 2017 14:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DC51880F96
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com DC51880F96
Received: from localhost (ovpn-116-43.gru2.redhat.com [10.97.116.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 07F559D99C;
	Tue, 30 May 2017 14:04:02 +0000 (UTC)
Date: Tue, 30 May 2017 11:04:01 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170530140401.GJ32274@thinpad.lan.raisama.net>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
	<1494415802-227633-7-git-send-email-imammedo@redhat.com>
	<20170526154625.GI22043@thinpad.lan.raisama.net>
	<20170530141329.60d728c6@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170530141329.60d728c6@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 30 May 2017 14:04:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 06/18] numa: mirror cpu to node mapping
 in MachineState::possible_cpus
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NXy/ORnXK07u

On Tue, May 30, 2017 at 02:13:29PM +0200, Igor Mammedov wrote:
> On Fri, 26 May 2017 12:46:25 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > On Wed, May 10, 2017 at 01:29:50PM +0200, Igor Mammedov wrote:
> > [...]
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index 2482c63..420c8c4 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -389,6 +389,102 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)  
> > [...]
> > > +void machine_set_cpu_numa_node(MachineState *machine,
> > > +                               const CpuInstanceProperties *props, Error **errp)
> > > +{  
> > [...]
> > > +    /* force board to initialize possible_cpus if it hasn't been done yet */
> > > +    mc->possible_cpu_arch_ids(machine);  
> > [...]
> > > diff --git a/numa.c b/numa.c
> > > index 7182481..7db5dde 100644
> > > --- a/numa.c
> > > +++ b/numa.c
> > > @@ -170,6 +170,7 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
> > >          exit(1);
> > >      }
> > >      for (cpus = node->cpus; cpus; cpus = cpus->next) {
> > > +        CpuInstanceProperties props;
> > >          if (cpus->value >= max_cpus) {
> > >              error_setg(errp,
> > >                         "CPU index (%" PRIu16 ")"
> > > @@ -178,6 +179,10 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
> > >              return;
> > >          }
> > >          bitmap_set(numa_info[nodenr].node_cpu, cpus->value, 1);
> > > +        props = mc->cpu_index_to_instance_props(ms, cpus->value);
> > > +        props.node_id = nodenr;
> > > +        props.has_node_id = true;
> > > +        machine_set_cpu_numa_node(ms, &props, &error_fatal);  
> > 
> > This triggers a call to possible_cpu_arch_ids() before
> > nb_numa_nodes is set to the actual number of NUMA nodes in the
> > machine, breaking the "node_id = ... % nb_numa_nodes"
> > initialization logic in pc, virt, and spapr.
> Looking at it more, in current code this problem theoretically
> affects only partial mapping case. And even there it's masked by 
> fixup to 0 node for non explicitly mapped CPUs and the bug which
>  *) "[PATCH v2 3/5] numa: make sure that all cpus in has  has_node_id set if numa is enabled"
> fixes. So invalid default values for non mapped cpus are stored
> in possible_cpus but not used nor visible elsewhere.
> 
> [*] as side effect fixes invalid defaults in possible_cpus as well
> by fixup to 0 node that's moved from pre_plug handler.
> 
> In future we are going to remove partial mapping with fixup to 0
> and fetch default mappings from possible_cpus where these wrong
> defaults won't exists (or matter) as CPUs are going to either
>  1) be all explicitly mapped (so all node_id values are overwritten)
> or
>  2) all default mapped (where defaults will be correct since no
>     -numa cpu=/-numa node,cpus= were called), but that's fragile
>     so I'd add calculate defaults at machine_run_board_init()
>     time anyway.

Your analysis seems correct: it looks like just a case of fragile
code, not a bug that can be triggered with the current code.

-- 
Eduardo
