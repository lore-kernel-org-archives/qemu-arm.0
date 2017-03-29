Received: by 10.25.15.230 with SMTP id 99csp2047325lfp;
        Wed, 29 Mar 2017 05:09:17 -0700 (PDT)
X-Received: by 10.233.232.88 with SMTP id a85mr182455qkg.104.1490789356974;
        Wed, 29 Mar 2017 05:09:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v91si6032248qte.144.2017.03.29.05.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Mar 2017 05:09:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ctCPc-0003XH-Dn
	for alex.bennee@linaro.org; Wed, 29 Mar 2017 08:09:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ctCPW-0003XC-67
	for qemu-arm@nongnu.org; Wed, 29 Mar 2017 08:09:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ctCPR-00020y-H2
	for qemu-arm@nongnu.org; Wed, 29 Mar 2017 08:09:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42954)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ctCPR-00020q-8A; Wed, 29 Mar 2017 08:09:05 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16E3E8C550;
	Wed, 29 Mar 2017 12:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 16E3E8C550
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 16E3E8C550
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D4AFB23F2;
	Wed, 29 Mar 2017 12:09:00 +0000 (UTC)
Date: Wed, 29 Mar 2017 14:08:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20170329140858.0e8b7e24@nial.brq.redhat.com>
In-Reply-To: <20170329022723.GO21068@umbus.fritz.box>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-23-git-send-email-imammedo@redhat.com>
	<20170328051602.GK21068@umbus.fritz.box>
	<20170328130911.78c2edc6@Igors-MacBook-Pro.local>
	<20170329022723.GO21068@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 29 Mar 2017 12:09:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-2.10 22/23] numa: add '-numa cpu,
 ...' option for property based node mapping
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
X-TUID: H/wghP+/+g6H

On Wed, 29 Mar 2017 13:27:23 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Mar 28, 2017 at 01:09:11PM +0200, Igor Mammedov wrote:
> > On Tue, 28 Mar 2017 16:16:02 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Wed, Mar 22, 2017 at 02:32:47PM +0100, Igor Mammedov wrote:  
> > > > legacy cpu to node mapping is using cpu index values to map
> > > > VCPU to node with help of '-numa node,nodeid=node,cpus=x[-y]'
> > > > option. However cpu index is internal concept and QEMU users
> > > > have to guess /reimplement qemu's logic/ to map it to
> > > > a concrete cpu socket/core/thread to make sane CPUs
> > > > placement across numa nodes.
> > > > 
> > > > This patch allows to map cpu objects to numa nodes using
> > > > the same properties as used for cpus with -device/device_add
> > > > (socket-id/core-id/thread-id/node-id).
> > > > 
> > > > At present valid properties/values to address CPUs could be
> > > > fetched using hotpluggable-cpus monitor/qmp command, it will
> > > > require user to start qemu twice when creating domain to fetch
> > > > possible CPUs for a machine type/-smp layout first and
> > > > then the second time with numa explicit mapping for actual
> > > > usage. The first step results could be saved and reused to
> > > > set/change mapping later as far as machine type/-smp stays
> > > > the same.
> > > > 
> > > > Proposed impl. supports exact and wildcard matching to
> > > > simplify CLI and allow to set mapping for a specific cpu
> > > > or group of cpu objects specified by matched properties.
> > > > 
> > > > For example:
> > > > 
> > > >    # exact mapping x86
> > > >    -numa cpu,node-id=x,socket-id=y,core-id=z,thread-id=n
> > > > 
> > > >    # exact mapping SPAPR
> > > >    -numa cpu,node-id=x,core-id=y
> > > > 
> > > >    # wildcard mapping, all cpu objects that match socket-id=y
> > > >    # are mapped to node-id=x
> > > >    -numa cpu,node-id=x,socket-id=y
> > > > 
> > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> > > 
> > > What's the rationale for adding a new CLI, rather than adding node-id
> > > properties to the appropriate objects with -device, -global or -set as
> > > appropriate?  
> >  '-global' applies to all cpus, while '-device,-set' applies to present
> >  at boot time cpus only. So they do not work for the case of possible but
> >  not present at boot time objects.  
> 
> Ah!  Of course.
> 
> > For ACPI based targets, we need to have
> >  numa mapping at boot time to build ACPI SRAT table.
> >  I don't know if it's important for spapr/fdt,  
> 
> Not in the same way.  For spapr the device tree fragment for the new
> cpu is supplied to the guest at hotplug time rather than having to be
> in the initial device tree.  So for us, node could be supplied with
> device_add.
I've implemented cpu.node-id check in the same way for all targets
for spapr it's patch patch 06/23 which forces cpu.node-id to match
whatever mapping has been provided with -numa cpu[s]
OR
with implied default /0/ if mapping for cpu hasn't been specified
with -numa explicitly.

That way it won't break legacy machines and on compat code is necessary,
I'd would leave it up to you with patch on top of this to lift restriction/make
it more relaxed for spapr if you think it won't break anything.

Although from libvirt pov, I'd prefer to treat all targets uniformly,
which narrows choice down to '-numa' mapping approach that it uses now.

> > but it uses current predefined
> >  mapping with -numa node,cpus=x-y and new CLI hides from user internal
> >  cpu_index and allows to use the same properties as we use for -device cpu,...
> >  to define mapping to numa nodes for present/possible cpus.
...
