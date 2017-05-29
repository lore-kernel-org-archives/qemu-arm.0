Received: by 10.25.0.6 with SMTP id 6csp1403732lfa;
        Mon, 29 May 2017 06:37:10 -0700 (PDT)
X-Received: by 10.55.65.22 with SMTP id o22mr7355168qka.158.1496065030545;
        Mon, 29 May 2017 06:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496065030; cv=none;
        d=google.com; s=arc-20160816;
        b=S/LTzWNaUFv0CI6O7joI/bCcd5h026IWxnMEM+uu8eTBmvGFt4iV6Ks9GSZO/8r+SS
         7e1Q46wpOvPSfM/TaIxErNe4XDIH+XSF8kfuwRXbek54Tqp5gRq1eK8BUc4wJbgoBtVH
         huy0e6R2Tc6Sv6u4X90Bi03Ydw2ENqRCuYynEL7A1BalpiW+iX8YTbC5ql2biaM85t6T
         BUZKpa9Dq82uRW7cPXw/uqg5qMT743FzDxORecrqTWLUB8c5YhPgmcgXtrDNmXEj+KB3
         etnEUHw3s3Kw97HQ5d+gwEVkJc+jiFyy9GJykdcfgy54KIvDp4V8vA7cPSew+tXtZ9BS
         /QoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=RxpdSYc3RgxWcYamnDQPelodAlMPLdVHJfntLY7hPJI=;
        b=h2b8hQmju0yHzGZnH1FNv4DqOVE2KoeotpeDk08fEvgIvjj9LiKCkudhOdSyjtAavE
         gJQisMwDIwYhjyPubyj/qlneZGQ9Jxhdx4+l9DgOBPXtT6+k69t2g+xw/848ttdNr7jg
         p8H60ej6T7kVhItmr0I0K+imIvdEuXfN/LRfoAlfVjHyNGBMkn0BpzeiG4s6d4D9LwBP
         92kNtIrCjaCgok3/Jh4v1om++e/d/krmEsET091JgJ++6XycMnkaWRNAb33ifAgFJ+fr
         7FrcZxNx6SuLOdTe6hOvAJ6lPqXQkde7FvLjW0Q7GKHjYnmG5FDLh1vEORj+MdqTedrz
         rnlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q1si9657454qte.107.2017.05.29.06.37.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 May 2017 06:37:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFKr8-0001jV-1v
	for alex.bennee@linaro.org; Mon, 29 May 2017 09:37:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dFKqv-0001gQ-09
	for qemu-arm@nongnu.org; Mon, 29 May 2017 09:37:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dFKqq-00006V-3D
	for qemu-arm@nongnu.org; Mon, 29 May 2017 09:36:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48044)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dFKqp-00006P-Q3; Mon, 29 May 2017 09:36:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FB5180F6D;
	Mon, 29 May 2017 13:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5FB5180F6D
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5FB5180F6D
Received: from localhost (ovpn-116-57.gru2.redhat.com [10.97.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED18C777C0;
	Mon, 29 May 2017 13:36:48 +0000 (UTC)
Date: Mon, 29 May 2017 10:36:47 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170529133647.GD32274@thinpad.lan.raisama.net>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
	<1494415802-227633-7-git-send-email-imammedo@redhat.com>
	<20170526154625.GI22043@thinpad.lan.raisama.net>
	<20170529151245.3fba6db4@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170529151245.3fba6db4@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 29 May 2017 13:36:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 06/18] numa: mirror cpu to
 node mapping in MachineState::possible_cpus
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
X-TUID: V7l1zX5AaHP+

On Mon, May 29, 2017 at 03:12:45PM +0200, Igor Mammedov wrote:
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
> > 
> > The initialization ordering between possible_cpus and NUMA data
> > structures looks very subtle and fragile.  I still don't see an
> > obvious way to untangle that.
> It's unfixable unless we require specific ordering on CLI,
> i.e. first go all '-numa node,nodeid=[...]' options and only then
> the rest of [-numa node,cpus|cpu].
> We can do that for '-numa cpu' (probably should do enforce it for
> this new option anyway for saner CLI)
> 
> but not for '-numa node,cpus' as it will break existing users
> that do not declare nodes first.
> 
> > I suggest moving the default-NUMA-mapping code to a separate
> > machine class method, instead of relying on
> > possible_cpu_arch_ids() to initialize node_id.
> So as you suggest we have to postpone default values initialization
> till all the options are parsed:
> 
> 1: strait-forward additional machine callback called from
>    machine_run_board_init()
> 
> or:
> 
> 2: save extra callback and recalculate not yet set props.node_id-s
>    in possible_cpu_arch_ids() if nb_numa_nodes is changed since
>    the last invocation of possible_cpu_arch_ids()
> 
> which one would you prefer?

Option 1 sounds simpler to me.

-- 
Eduardo
