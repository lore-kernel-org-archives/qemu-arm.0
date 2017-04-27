Received: by 10.25.0.144 with SMTP id 138csp766138lfa;
        Thu, 27 Apr 2017 06:14:50 -0700 (PDT)
X-Received: by 10.237.62.150 with SMTP id n22mr4972610qtf.70.1493298890400;
        Thu, 27 Apr 2017 06:14:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x55si2879572qta.329.2017.04.27.06.14.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Apr 2017 06:14:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d3jFx-0002gP-Ol
	for alex.bennee@linaro.org; Thu, 27 Apr 2017 09:14:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d3jFT-0002ND-Kg
	for qemu-arm@nongnu.org; Thu, 27 Apr 2017 09:14:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d3jFQ-0007zl-AE
	for qemu-arm@nongnu.org; Thu, 27 Apr 2017 09:14:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d3jFQ-0007zP-0X; Thu, 27 Apr 2017 09:14:16 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EACB2C001098;
	Thu, 27 Apr 2017 13:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com EACB2C001098
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com EACB2C001098
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5E7E89EE7;
	Thu, 27 Apr 2017 13:14:07 +0000 (UTC)
Date: Thu, 27 Apr 2017 15:14:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170427151406.57fbfa79@nial.brq.redhat.com>
In-Reply-To: <20170426122138.GU3482@thinpad.lan.raisama.net>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-8-git-send-email-imammedo@redhat.com>
	<20170412210239.GC27126@thinpad.lan.raisama.net>
	<20170419131458.59e2d00e@nial.brq.redhat.com>
	<20170426122138.GU3482@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 27 Apr 2017 13:14:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.10 07/23] pc: add node-id
 property to CPU
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
	Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fClzMxzhSvlV

On Wed, 26 Apr 2017 09:21:38 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

adding Peter to CC list

[...]

> On Wed, Apr 19, 2017 at 01:14:58PM +0200, Igor Mammedov wrote:
> > On Wed, 12 Apr 2017 18:02:39 -0300
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> >   
> > > On Wed, Mar 22, 2017 at 02:32:32PM +0100, Igor Mammedov wrote:  
> > > > it will allow switching from cpu_index to property based
> > > > numa mapping in follow up patches.    
> > > 
> > > I am not sure I understand all the consequences of this, so I
> > > will give it a try:
> > > 
> > > "node-id" is an existing field in CpuInstanceProperties.
> > > CpuInstanceProperties is used on both query-hotpluggable-cpus
> > > output and in MachineState::possible_cpus.
> > > 
> > > We will start using MachineState::possible_cpus to keep track of
> > > NUMA CPU affinity, and that means query-hotpluggable-cpus will
> > > start reporting a "node-id" property when a NUMA mapping is
> > > configured.
> > > 
> > > To allow query-hotpluggable-cpus to report "node-id", the CPU
> > > objects must have a "node-id" property that can be set. This
> > > patch adds the "node-id" property to X86CPU.
> > > 
> > > Is this description accurate? Is the presence of "node-id" in
> > > query-hotpluggable-cpus the only reason we really need this
> > > patch, or is there something else that requires the "node-id"
> > > property?  
> > That accurate description, node-id is in the same 'address'
> > properties category as socket/core/thread-id. So if you have
> > numa enabled machine you'd see node-id property in
> > query-hotpluggable-cpus.  
> 
> I agree that we can make -numa cpu affect query-hotpluggable-cpus
> output (i.e. affect some field on HotpluggableCPU.props).
> 
> But it looks like we disagree about the purpose of
> HotpluggableCPU.props:
> 
> I believe HotpluggableCPU.props is just an opaque identifier for
> the location we want to plug the CPU, and the only requirement is
> that it should be unique and have all the information device_add
> needs. As socket IDs are already unique on our existing machines,
> and socket<=>node mapping is already configured using -numa cpu,
> node-id doesn't need to be in HotpluggableCPU.props. (see example
> below)
node-id is also location property which logically complements
to socket/core/thread properties.  Also socket is not necessarily
unique id that maps 1:1 to node-id from generic pov.
BTW -numa cpu[s] is not the only way to specify mapping,
it could be specified like we do with pc-dimm:
   device_add pc-dimm,node=x

Looking at it more genericly, there could be the same
socket-ids for different nodes, then we would have to add
node-id to props anyway and end up with 2 node-id, one in props
and another in the parent struct.


> I don't think clients should assume topology information in
> HotpluggableCPU.props is always present, because the field has a
> different purpose: letting clients know what are the required
> device_add arguments. If we need introspection of CPU topology,
> we can add new fields to HotpluggableCPU, outside 'props'.
looking at existing clients (libvirt), it doesn't treat 'props'
as opaque set, but parses it into topology information (my guess
is that because it's the sole source such info from QEMU).
Actually we never forbade this, the only requirement for
props was that mgmt should provide those properties to create
a cpu. Property names where designed in topology/location
friendly terms so that clients could make the sense from them.

So I wouldn't try now to reduce meaning of 'props' to
opaque as you suggest.

[..]
> My question is: if we use:
> 
>  -numa cpu,socket=2,core=1,thread=0,node-id=3
> 
> and then:
> 
>  device_add ...,socket=2,core=1,thread=0
>  (omitting node-id on device_add)
> 
> won't it work exactly the same, and place the new CPU on NUMA
> node 3?
yep, it's allowed for compat reasons:
  1: to allow DST start with old CLI variant, that didn't have node-id
     (migration)
  2: to let old libvirt hotplug CPUs, it doesn't treat 'props'
     as opaque set that is just replayed to device_add,
     instead it composes command from topo info it got
     from QEMU and unfortunately node-id is only read but is
     not emitted when device_add is composed
    (I consider this bug but it's out in the wild so we have to deal with it)

we can't enforce presence in these cases or at least have to
keep it relaxed for old machine types.
 
> In this case, if we don't need a node-id argument on device_add,
> so node-id doesn't need to be in HotpluggableCPU.props.
I'd say we currently don't have to (for above reasons) but
it doesn't hurt and actually allows to use pc-dimm way of
mapping CPUs to nodes as David noted. i.e.:
  -device cpu-foo,node-id=x,...
without any of -numa cpu[s] options on CLI.
It's currently explicitly disabled but should work if one
doesn't care about hotplug or if target doesn't care about
mapping at startup (sPAPR), it also might work for x86 as
well using _PXM method in ACPI.
(But that's out of scope of this series and needs more
testing as some guest OSes might expect populated SRAT
to work correctly).

[...]
> > 
> > In future to avoid starting QEMU twice we were thinking about
> > configuring QEMU from QMP at runtime, that's where preconfigure
> > approach could be used to help solving it in the future:
> > 
> >   1. introduce pause before machine_init CLI option to allow
> >      preconfig machine from qmp/monitor
> >   2. make query-hotpluggable-cpus usable at preconfig time
> >   3. start qemu with needed number of numa nodes and default mapping:
> >          #qemu -smp ... -numa node,nodeid=0 -node node,nodeid=1
> >   4. get possible cpus list  
> 
> This is where things can get tricky: if we have the default
> mapping set, step 4 would return "node-id" already set on all
> possible CPUs.
that would depend on impl.
 - display node-id with default preset values to override
 - do not set defaults and force user to do mapping

> >   5. add qmp/monitor command variant for '-numa cpu' to set numa mapping  
> 
> This is where I think we would make things simpler: if node-id
> isn't present on 'props', we can simply document the arguments
> that identify the CPU for the numa-cpu command as "just use the
> properties you get on query-hotpluggable-cpus.props". Clients
> would be able to treat CpuInstanceProperties as an opaque CPU
> slot identifier.
> 
> i.e. I think this would be a better way to define and document
> the interface:
> 
> ##
> # @NumaCpuOptions:
> #
> # Mapping of a given CPU (or a set of CPUs) to a NUMA node.
> #
> # @cpu: Properties identifying the CPU(s). Use the 'props' field of
> #       query-hotpluggable-cpus for possible values for this
> #       field.
> #       TODO: describe what happens when 'cpu' matches
> #       multiple slots.
> # @node-id: NUMA node where the CPUs are going to be located.
> ##
> { 'struct': 'NumaCpuOptions',
>   'data': {
>    'cpu': 'CpuInstanceProperties',
>    'node-id': 'int' } }
> 
> This separates "what identifies the CPU slot(s) we are
> configuring" from "what identifies the node ID we are binding
> to".
Doesn't look any simpler to me, I'd better document node-id usage
in props, like

 #
 # A discriminated record of NUMA options. (for OptsVisitor)
 #
+# For 'cpu' type as arguments use a set of cpu properties returned
+# by query-hotpluggable-cpus[].props, where node-id could be used
+# to override default node mapping. Since: 2.10
+#
 # Since: 2.1
 ##
 { 'union': 'NumaOptions',
   'base': { 'type': 'NumaOptionsType' },
   'discriminator': 'type',
   'data': {
-    'node': 'NumaNodeOptions' }}
+    'node': 'NumaNodeOptions',
+    'cpu' : 'CpuInstanceProperties' }}
 
 ##
 # @NumaNodeOptions:


> In case we have trouble making this struct work with QemuOpts, we
> could do this (temporarily?):
> 
> ##
> # @NumaCpuOptions:
> #
> # Mapping of a given CPU (or a set of CPUs) to a NUMA node.
> #
> # @cpu: Properties identifying the CPU(s). Use the 'props' field of
> #       query-hotpluggable-cpus for possible values for this
> #       field.
> #       TODO: describe what happens when 'cpu' matches
> #       multiple slots.
> # @node-id: NUMA node where the CPUs are going to be located.
> #
> # @socket-id: Shortcut for cpu.socket-id, to make this struct
> #             friendly to QemuOpts.
> # @core-id: Shortcut for cpu.core-id, to make this struct
> #           friendly to QemuOpts.
> # @thread-id: Shortcut for cpu.thread-id, to make this struct
> #             friendly to QemuOpts.
> ##
> { 'struct': 'NumaCpuOptions',
>   'data': {
>    '*cpu': 'CpuInstanceProperties',
>    '*socket-id': 'int',
>    '*core-id': 'int',
>    '*thread-id': 'int',
>    'node-id': 'int' } }
> 
> >   6. optionally, set new numa mapping and get updated
> >      possible cpus list with query-hotpluggable-cpus
> >   7. optionally, add extra cpus with device_add using updated
> >      cpus list and get updated cpus list as it's been changed again.
> >   8. unpause preconfig stage and let qemu continue to execute
> >      machine_init and the rest.
> > 
> > Since we would need to implement QMP configuration for '-device cpu',
> > we as well might reuse it for custom numa mapping.
> > 
> >  [...]  
> 

