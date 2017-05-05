Received: by 10.25.0.198 with SMTP id 189csp285447lfa;
        Fri, 5 May 2017 10:04:37 -0700 (PDT)
X-Received: by 10.237.38.103 with SMTP id z94mr42564260qtc.215.1494003877586;
        Fri, 05 May 2017 10:04:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 47si5370228qtq.103.2017.05.05.10.04.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 May 2017 10:04:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48183 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6geg-0008Ip-V1
	for alex.bennee@linaro.org; Fri, 05 May 2017 13:04:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d6geZ-0008If-Bf
	for qemu-arm@nongnu.org; Fri, 05 May 2017 13:04:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d6geU-0007fT-N4
	for qemu-arm@nongnu.org; Fri, 05 May 2017 13:04:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37046)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d6geU-0007fD-E2; Fri, 05 May 2017 13:04:22 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F69E4E4E6;
	Fri,  5 May 2017 17:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3F69E4E4E6
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3F69E4E4E6
Received: from localhost (ovpn-116-28.gru2.redhat.com [10.97.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A836171E8;
	Fri,  5 May 2017 17:04:20 +0000 (UTC)
Date: Fri, 5 May 2017 14:04:15 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170505170415.GH3482@thinpad.lan.raisama.net>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-11-git-send-email-imammedo@redhat.com>
	<20170503152022.GQ3482@thinpad.lan.raisama.net>
	<20170505141648.35ba172f@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170505141648.35ba172f@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 05 May 2017 17:04:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 10/24] numa: mirror cpu to node mapping in
 MachineState::possible_cpus
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
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: puRBsW4sC71m

On Fri, May 05, 2017 at 02:16:48PM +0200, Igor Mammedov wrote:
> On Wed, 3 May 2017 12:20:22 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > On Wed, May 03, 2017 at 02:57:04PM +0200, Igor Mammedov wrote:
> > > Introduce machine_set_cpu_numa_node() helper that stores
> > > node mapping for CPU in MachineState::possible_cpus.
> > > CPU and node it belongs to is specified by 'props' argument.
> > > 
> > > Patch doesn't remove old way of storing mapping in
> > > numa_info[X].node_cpu as removing it at the same time
> > > makes patch rather big. Instead it just mirrors mapping
> > > in possible_cpus and follow up per target patches will
> > > switch to possible_cpus and numa_info[X].node_cpu will
> > > be removed once there isn't any users left.
> > > 
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> > > ---
> > >  include/hw/boards.h |  2 ++
> > >  hw/core/machine.c   | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++++
> > >  numa.c              |  8 +++++++
> > >  3 files changed, 78 insertions(+)
> > > 
> > > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > > index 5d6af21..1f518a1 100644
> > > --- a/include/hw/boards.h
> > > +++ b/include/hw/boards.h
> > > @@ -42,6 +42,8 @@ bool machine_dump_guest_core(MachineState *machine);
> > >  bool machine_mem_merge(MachineState *machine);
> > >  void machine_register_compat_props(MachineState *machine);
> > >  HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine);
> > > +void machine_set_cpu_numa_node(MachineState *machine,
> > > +                               CpuInstanceProperties *props, Error **errp);
> > >  
> > >  /**
> > >   * CPUArchId:
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index ada9eea..a63f17b 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -388,6 +388,74 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
> > >      return head;
> > >  }
> > >  
> > > +void machine_set_cpu_numa_node(MachineState *machine,
> > > +                               CpuInstanceProperties *props, Error **errp)  
> > 
> > As the semantics of this function aren't trivial, it would be
> > nice to have a comment explaining what exactly this function do.
> > 
> > e.g.:
> > * make it clear that it could affect multiple CPU slots;
> > * make it clear what does it mean to have props->has_node_id=false as
> >   argument (is it really valid?);
> > * make it clear that it will refuse to change an existing mapping.
> Will be following comment sufficient?
> 
> +/**
> + * machine_set_cpu_numa_node:
> + * @machine: machine object to modify
> + * @props: specifies which cpu objects to assign to
> + *         numa node specified by @props.node_id
> + * @errp: if an error occurs, a pointer to an area to store the error
> + *
> + * Associate NUMA node specified by @props.node_id with cpu slots that
> + * match socket/core/thread-ids specified by @props. It's recommended to use
> + * query-hotpluggable-cpus.props values to specify affected cpu slots,
> + * which would lead to exact 1:1 mapping of cpu slots to NUMA node.
> + *
> + * However for CLI convenience it's possible to pass in subset of properties,
> + * which would affect all cpu slots that match it.
> + * Ex for pc machine:
> + *    -smp 4,cores=2,sockets=2 -numa node,nodeid=0 -numa node,nodeid=1 \
> + *    -numa cpu,node-id=0,socket_id=0 \
> + *    -numa cpu,node-id=1,socket_id=1
> + * will assign all child cores of socket 0 to node 0 and
> + * of socket 1 to node 1.
> + *
> + * Empty subset is disallowed and function will return with error in this case.
> + */
>  void machine_set_cpu_numa_node(MachineState *machine,
>                                 CpuInstanceProperties *props, Error **errp)

Sounds good to me.

While at it, we could make 'props' const, as it's not going to be
touched by the function.

-- 
Eduardo
