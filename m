Received: by 10.25.0.198 with SMTP id 189csp192419lfa;
        Tue, 2 May 2017 01:32:57 -0700 (PDT)
X-Received: by 10.55.105.6 with SMTP id e6mr24176748qkc.252.1493713977354;
        Tue, 02 May 2017 01:32:57 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u6si16925366qkd.285.2017.05.02.01.32.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 May 2017 01:32:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5TEu-0000FA-PL
	for alex.bennee@linaro.org; Tue, 02 May 2017 04:32:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5TAn-0005ag-9I
	for qemu-devel@nongnu.org; Tue, 02 May 2017 04:28:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5TAm-0007hO-5L
	for qemu-devel@nongnu.org; Tue, 02 May 2017 04:28:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d5TAf-0007dQ-Q0; Tue, 02 May 2017 04:28:34 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1444926BC21;
	Tue,  2 May 2017 08:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1444926BC21
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1444926BC21
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7A735C6D7;
	Tue,  2 May 2017 08:28:28 +0000 (UTC)
Date: Tue, 2 May 2017 10:28:26 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20170502102826.01d2373b@nial.brq.redhat.com>
In-Reply-To: <20170502042712.GF10741@umbus.fritz.box>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-8-git-send-email-imammedo@redhat.com>
	<20170412210239.GC27126@thinpad.lan.raisama.net>
	<20170419131458.59e2d00e@nial.brq.redhat.com>
	<20170426122138.GU3482@thinpad.lan.raisama.net>
	<20170427151406.57fbfa79@nial.brq.redhat.com>
	<20170427163225.GE3482@thinpad.lan.raisama.net>
	<20170502042712.GF10741@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 02 May 2017 08:28:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-2.10 07/23] pc: add node-id property to
 CPU
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
	Peter Krempa <pkrempa@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mSWjBoe5vikc

On Tue, 2 May 2017 14:27:12 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Thu, Apr 27, 2017 at 01:32:25PM -0300, Eduardo Habkost wrote:
> > On Thu, Apr 27, 2017 at 03:14:06PM +0200, Igor Mammedov wrote:  
> > > On Wed, 26 Apr 2017 09:21:38 -0300
> > > Eduardo Habkost <ehabkost@redhat.com> wrote:
> > > 
> > > adding Peter to CC list
> > > 
> > > [...]
> > >   
> > > > On Wed, Apr 19, 2017 at 01:14:58PM +0200, Igor Mammedov wrote:  
> > > > > On Wed, 12 Apr 2017 18:02:39 -0300
> > > > > Eduardo Habkost <ehabkost@redhat.com> wrote:
> > > > >     
> > > > > > On Wed, Mar 22, 2017 at 02:32:32PM +0100, Igor Mammedov wrote:    
> > > > > > > it will allow switching from cpu_index to property based
> > > > > > > numa mapping in follow up patches.      
> > > > > > 
> > > > > > I am not sure I understand all the consequences of this, so I
> > > > > > will give it a try:
> > > > > > 
> > > > > > "node-id" is an existing field in CpuInstanceProperties.
> > > > > > CpuInstanceProperties is used on both query-hotpluggable-cpus
> > > > > > output and in MachineState::possible_cpus.
> > > > > > 
> > > > > > We will start using MachineState::possible_cpus to keep track of
> > > > > > NUMA CPU affinity, and that means query-hotpluggable-cpus will
> > > > > > start reporting a "node-id" property when a NUMA mapping is
> > > > > > configured.
> > > > > > 
> > > > > > To allow query-hotpluggable-cpus to report "node-id", the CPU
> > > > > > objects must have a "node-id" property that can be set. This
> > > > > > patch adds the "node-id" property to X86CPU.
> > > > > > 
> > > > > > Is this description accurate? Is the presence of "node-id" in
> > > > > > query-hotpluggable-cpus the only reason we really need this
> > > > > > patch, or is there something else that requires the "node-id"
> > > > > > property?    
> > > > > That accurate description, node-id is in the same 'address'
> > > > > properties category as socket/core/thread-id. So if you have
> > > > > numa enabled machine you'd see node-id property in
> > > > > query-hotpluggable-cpus.    
> > > > 
> > > > I agree that we can make -numa cpu affect query-hotpluggable-cpus
> > > > output (i.e. affect some field on HotpluggableCPU.props).
> > > > 
> > > > But it looks like we disagree about the purpose of
> > > > HotpluggableCPU.props:
> > > > 
> > > > I believe HotpluggableCPU.props is just an opaque identifier for
> > > > the location we want to plug the CPU, and the only requirement is
> > > > that it should be unique and have all the information device_add
> > > > needs. As socket IDs are already unique on our existing machines,
> > > > and socket<=>node mapping is already configured using -numa cpu,
> > > > node-id doesn't need to be in HotpluggableCPU.props. (see example
> > > > below)  
> > > node-id is also location property which logically complements
> > > to socket/core/thread properties.  Also socket is not necessarily
> > > unique id that maps 1:1 to node-id from generic pov.
> > > BTW -numa cpu[s] is not the only way to specify mapping,
> > > it could be specified like we do with pc-dimm:
> > >    device_add pc-dimm,node=x
> > > 
> > > Looking at it more genericly, there could be the same
> > > socket-ids for different nodes, then we would have to add
> > > node-id to props anyway and end up with 2 node-id, one in props
> > > and another in the parent struct.  
> > 
> > This is where my expectations are different: I think
> > HotpluggableCPU.props is just an identifier property for CPU
> > slots that is used for device_add (and will be used for -numa
> > cpu), and isn't supposed to be be interpreted by clients.
> > 
> > The problem I see is that the property has two completely
> > different purposes: identifying a given CPU slot for device_add
> > (and -numa cpu), and introspection of topology information about
> > the CPU slot. Today we are lucky and those goals don't conflict
> > with each other, but I worry this might cause trouble in the
> > future.  
> 
> Yeah, I share your concern.  And even if we allow that the topology
> information may be read by the user, at the moment the
> socket/core/thread values are "read only" in the sense that the client
> should do nothing by read them from the query (possibly look at them
> for its own interest) and echo them back verbatim to device_add.
> 
> node id is different because it's something the user/management might
> want to actually choose.  So it seems dubious to me that it's in the
> same structure.
node-id is 'read only' when it comes to device_add so far.

