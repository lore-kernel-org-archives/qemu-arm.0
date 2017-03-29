Received: by 10.25.15.230 with SMTP id 99csp2038526lfp;
        Wed, 29 Mar 2017 04:48:21 -0700 (PDT)
X-Received: by 10.55.10.20 with SMTP id 20mr35020qkk.119.1490788101795;
        Wed, 29 Mar 2017 04:48:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v4si5982635qtc.277.2017.03.29.04.48.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Mar 2017 04:48:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58432 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ctC5N-0008OM-7t
	for alex.bennee@linaro.org; Wed, 29 Mar 2017 07:48:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ctC5G-0008Ma-N7
	for qemu-arm@nongnu.org; Wed, 29 Mar 2017 07:48:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ctC5C-0002EA-PK
	for qemu-arm@nongnu.org; Wed, 29 Mar 2017 07:48:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47258)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ctC5C-0002Dx-H5; Wed, 29 Mar 2017 07:48:10 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 670D84DD55;
	Wed, 29 Mar 2017 11:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 670D84DD55
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 670D84DD55
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F9F59133A;
	Wed, 29 Mar 2017 11:48:07 +0000 (UTC)
Date: Wed, 29 Mar 2017 13:48:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20170329134806.60e75dcc@nial.brq.redhat.com>
In-Reply-To: <20170329022449.GN21068@umbus.fritz.box>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-6-git-send-email-imammedo@redhat.com>
	<20170328041920.GC21068@umbus.fritz.box>
	<20170328125310.4fa3da50@Igors-MacBook-Pro.local>
	<20170329022449.GN21068@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 29 Mar 2017 11:48:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-2.10 05/23] numa: move source of default
 CPUs to NUMA node mapping into boards
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
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VWfiYamMKchS

On Wed, 29 Mar 2017 13:24:49 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Mar 28, 2017 at 12:53:10PM +0200, Igor Mammedov wrote:
> > On Tue, 28 Mar 2017 15:19:20 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Wed, Mar 22, 2017 at 02:32:30PM +0100, Igor Mammedov wrote:  
> > > > Originally CPU threads were by default assigned in
> > > > round-robin fashion. However it was causing issues in
> > > > guest since CPU threads from the same socket/core could
> > > > be placed on different NUMA nodes.
> > > > Commit fb43b73b (pc: fix default VCPU to NUMA node mapping)
> > > > fixed it by grouping threads within a socket on the same node
> > > > introducing cpu_index_to_socket_id() callback and commit
> > > > 20bb648d (spapr: Fix default NUMA node allocation for threads)
> > > > reused callback to fix similar issues for SPAPR machine
> > > > even though socket doesn't make much sense there.
> > > > 
> > > > As result QEMU ended up having 3 default distribution rules
> > > > used by 3 targets /virt-arm, spapr, pc/.
> > > > 
> > > > In effort of moving NUMA mapping for CPUs into possible_cpus,
> > > > generalize default mapping in numa.c by making boards decide
> > > > on default mapping and let them explicitly tell generic
> > > > numa code to which node a CPU thread belongs to by replacing
> > > > cpu_index_to_socket_id() with @cpu_index_to_instance_props()
> > > > which provides default node_id assigned by board to specified
> > > > cpu_index.
> > > > 
> > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> [snip]
> > > > +static CpuInstanceProperties
> > > > +virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> > > > +{
> > > > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> > > > +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
> > > > +
> > > > +    assert(cpu_index < possible_cpus->len);
> > > > +    return possible_cpus->cpus[cpu_index].props;;
> > > > +}
> > > > +  
> > > 
> > > It seems a bit weird to have a machine specific hook to pull the
> > > property information when one way or another it's coming from the
> > > possible_cpus table, which is already constructed by a machine
> > > specific hook.  Could we add a range or list of cpu_index values to
> > > each possible_cpus entry instead, and have a generic lookup of the
> > > right entry based on that?  
> 
> [snip]
> > > > -static unsigned pc_cpu_index_to_socket_id(unsigned cpu_index)
> > > > +static CpuInstanceProperties
> > > > +pc_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> > > >  {
> > > > -    X86CPUTopoInfo topo;
> > > > -    x86_topo_ids_from_idx(smp_cores, smp_threads, cpu_index,
> > > > -                          &topo);
> > > > -    return topo.pkg_id;
> > > > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> > > > +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
> > > > +
> > > > +    assert(cpu_index < possible_cpus->len);
> > > > +    return possible_cpus->cpus[cpu_index].props;;  
> > > 
> > > Since the pc and arm version of this are basically identical, I wonder
> > > if that should actually be the default implementation.  If we need it
> > > at all.  
> > ARM is still moving target and props are not really defined for it yet,
> > so I'd like to keep it separate for now and when it stabilizes we can think
> > about generalizing it.  
> 
> Fair enough.
> 
> Any thoughts on my more general query above
None so far.

