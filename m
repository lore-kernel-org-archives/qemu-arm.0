Received: by 10.25.0.198 with SMTP id 189csp1396501lfa;
        Mon, 8 May 2017 07:47:17 -0700 (PDT)
X-Received: by 10.55.58.199 with SMTP id h190mr25008769qka.262.1494254837637;
        Mon, 08 May 2017 07:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494254837; cv=none;
        d=google.com; s=arc-20160816;
        b=K8BtmHV13oLizkMSsXOAc1N5KzN4PAgWKLRp2EohNUD3OUg6Qcsbdkm6aSCfQOVfDl
         qz0m0NGlfEmm2QF0NpR4q0U9i8BgdRUNMPjJDG3H/zBg2IgRcDYG/A2fELchKXvmAf37
         BTVLOy++1uE8ojEzd95J4kk179TBLj88gswglXFVHE+LdULLTUJIlRk0A0scVGG8cx5/
         zDZ8+6QRuGpdfcEW7LJBcJmQfXsS312AvMgqmrCjvY/ZTiT92tTxgVNHvfPCU6bgJQK9
         cEXuPodlPH62E7cGvYGIHvMaBGm4qAFp/de1D91SDq1BfVCB7TFNcXd2nnyjx4smrvSG
         QzyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=715QtUMjAsGElgPZRZnHudOogT30NuEoqoI0pJbf6R0=;
        b=bNatHrUo4ArpYPbq9ncLwDXAi9n5VABOWw5jZa46Hra8+cLsa+BU5T18ceH8nVl8WD
         493daEhoz32Oo9OX7MguvMKxuq6MQQxeoyOxkN6btD46MTXSlLEpIQC1WkUbopK1XfSN
         Pc0stAj+nyf0YK2hQVPT2oR11zrwlqu6Fr3m0Qo25qgii1yzI4yXEZx4SeFJrdksU/5u
         ORiaQSagM5IClxtwLPpVltjUVM1imw9HpQXzhmgO1PnRmq06ZjG6PzxXDc69rU+XL9Ts
         0edJnERTiPzftGO06UFH1lFtNmhMbiIqn0lWPfuZN/qH7JxDsP11xewnD7T0Vs8BEIPt
         9MBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r187si12161941qkd.247.2017.05.08.07.47.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 May 2017 07:47:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59879 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7jwT-0008E9-3K
	for alex.bennee@linaro.org; Mon, 08 May 2017 10:47:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d7jwM-0008D4-SP
	for qemu-arm@nongnu.org; Mon, 08 May 2017 10:47:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d7jwJ-0007uM-JS
	for qemu-arm@nongnu.org; Mon, 08 May 2017 10:47:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44226)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d7jwJ-0007uI-9x; Mon, 08 May 2017 10:47:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7452C80C09;
	Mon,  8 May 2017 14:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7452C80C09
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7452C80C09
Received: from localhost (ovpn-116-2.gru2.redhat.com [10.97.116.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3CDC87444;
	Mon,  8 May 2017 14:47:04 +0000 (UTC)
Date: Mon, 8 May 2017 11:47:02 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20170508144702.GT3482@thinpad.lan.raisama.net>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-24-git-send-email-imammedo@redhat.com>
	<20170508054004.GE25748@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170508054004.GE25748@umbus.fritz.box>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 08 May 2017 14:47:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 23/24] numa: add '-numa cpu,
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
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IijAPAmYAi9h

On Mon, May 08, 2017 at 03:40:04PM +1000, David Gibson wrote:
> On Wed, May 03, 2017 at 02:57:17PM +0200, Igor Mammedov wrote:
> > legacy cpu to node mapping is using cpu index values to map
> > VCPU to node with help of '-numa node,nodeid=node,cpus=x[-y]'
> > option. However cpu index is internal concept and QEMU users
> > have to guess /reimplement qemu's logic/ to map it to
> > a concrete cpu socket/core/thread to make sane CPUs
> > placement across numa nodes.
> > 
> > This patch allows to map cpu objects to numa nodes using
> > the same properties as used for cpus with -device/device_add
> > (socket-id/core-id/thread-id/node-id).
> > 
> > At present valid properties/values to address CPUs could be
> > fetched using hotpluggable-cpus monitor/qmp command, it will
> > require user to start qemu twice when creating domain to fetch
> > possible CPUs for a machine type/-smp layout first and
> > then the second time with numa explicit mapping for actual
> > usage. The first step results could be saved and reused to
> > set/change mapping later as far as machine type/-smp stays
> > the same.
> > 
> > Proposed impl. supports exact and wildcard matching to
> > simplify CLI and allow to set mapping for a specific cpu
> > or group of cpu objects specified by matched properties.
> > 
> > For example:
> > 
> >    # exact mapping x86
> >    -numa cpu,node-id=x,socket-id=y,core-id=z,thread-id=n
> > 
> >    # exact mapping SPAPR
> >    -numa cpu,node-id=x,core-id=y
> > 
> >    # wildcard mapping, all cpu objects that match socket-id=y
> >    # are mapped to node-id=x
> >    -numa cpu,node-id=x,socket-id=y
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v2:
> >   - use new NumaCpuOptions instead of CpuInstanceProperties in
> >     NumaOptions, so that in future we could decouple both
> >     if needed. (Eduardo Habkost <ehabkost@redhat.com>)
> >   - clarify effect of NumaCpuOptions.node-id in qapi-schema.json
> > ---
> >  numa.c           | 25 +++++++++++++++++++++++++
> >  qapi-schema.json | 21 +++++++++++++++++++--
> >  qemu-options.hx  | 23 ++++++++++++++++++++++-
> >  3 files changed, 66 insertions(+), 3 deletions(-)
> > 
> > diff --git a/numa.c b/numa.c
> > index 40e9f44..61521f5 100644
> > --- a/numa.c
> > +++ b/numa.c
> > @@ -227,6 +227,7 @@ static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
> >      NumaOptions *object = NULL;
> >      MachineState *ms = opaque;
> >      Error *err = NULL;
> > +    CpuInstanceProperties cpu;
> >  
> >      {
> >          Visitor *v = opts_visitor_new(opts);
> > @@ -246,6 +247,30 @@ static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
> >          }
> >          nb_numa_nodes++;
> >          break;
> > +    case NUMA_OPTIONS_TYPE_CPU:
> > +        if (!object->u.cpu.has_node_id) {
> > +            error_setg(&err, "Missing mandatory node-id property");
> > +            goto end;
> > +        }
> > +        if (!numa_info[object->u.cpu.node_id].present) {
> > +            error_setg(&err, "Invalid node-id=%" PRId64 ", NUMA node must be "
> > +                "defined with -numa node,nodeid=ID before it's used with "
> > +                "-numa cpu,node-id=ID", object->u.cpu.node_id);
> > +            goto end;
> > +        }
> > +
> > +        memset(&cpu, 0, sizeof(cpu));
> > +        cpu.has_node_id = object->u.cpu.has_node_id;
> > +        cpu.node_id = object->u.cpu.node_id;
> > +        cpu.has_socket_id = object->u.cpu.has_socket_id;
> > +        cpu.socket_id = object->u.cpu.socket_id;
> > +        cpu.has_core_id = object->u.cpu.has_core_id;
> > +        cpu.core_id = object->u.cpu.core_id;
> > +        cpu.has_thread_id = object->u.cpu.has_thread_id;
> > +        cpu.thread_id = object->u.cpu.thread_id;
> > +
> > +        machine_set_cpu_numa_node(ms, &cpu, &err);
> 
> It's possible I've confused myself by not looking at this whole series
> at once.
> 
> But, would it be possible to make a single machine hook which maps a
> constructed cpu property set to a "canonical" cpu property set from
> the table of CPU slots (or errors, of course).  That would let you do
> what you need here, and I suspect in other places, without multiple
> hooks.

I think I understand your point, but I don't see where any
opportunities to reuse a more generic hook in the current series.

I see only two new hooks added by this series:
1) MachineClass::cpu_index_to_instance_props()
2) machine_set_cpu_numa_node()

The former takes only one cpu_index argument as input. As it
needs to be a machine-specific hook, I think it's good to keep
its input as simple and specific as possible.

The latter could use a generic lookup function to map
CpuInstanceProperties to a set of CPU slots. But I don't see any
case where that logic would be reused by now, so I don't think
it's worth the extra complexity.

-- 
Eduardo
