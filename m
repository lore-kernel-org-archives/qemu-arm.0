Received: by 10.25.0.6 with SMTP id 6csp204579lfa;
        Tue, 9 May 2017 08:58:47 -0700 (PDT)
X-Received: by 10.237.53.23 with SMTP id a23mr839918qte.171.1494345526923;
        Tue, 09 May 2017 08:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494345526; cv=none;
        d=google.com; s=arc-20160816;
        b=LcPerXdTDjaUcprE0S+LBSHiSfRaYhpyXokKwvRL63oAwKcNrzSRGWFIN/+ToWamaJ
         2QRg+BwhG+RQRiTg/8rjUVH2xvHc05KaKHdN7agLwKjGbAqS484jd7O6QhWyU8fk3IBk
         Q+23FxZI5jDLd1fj28b10JUtSKQMk5iSmPo7ZLF9JbJ7gBM491IC3GEuMPUA1A8q3PG+
         C1YP0gdH+gBQakuq7JJ4eiHTFKvvTtDo+5HVDXHk4vW7pu8PR401LSDBdt+Rn9S4QUHT
         fizil85Iy4vVluzV6g+/AZPyLwe5Z+e6TocC0tyibIGE/E9FcYL5QKLD/NbCdcmbDM41
         Nv1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=V+rYSzhPYZocluZDm19DtIQIOv1NqOWQgwngOJjDT8o=;
        b=NjTNHsKoOEm86fwsZu1BWZKnqgdaig4Mw1wbpkQIwCqIqA3phXRyDMviMVrf4/84Do
         cJ5Ks2lB3Qek/1hLzxdzToRaBfj4dwzl9/P17T+o6KHZyXlq8rHSPDgmUu2hQzRPVacE
         r6Dapm3Qs6JEuYRyOPB438s//eLksVV4ejl7o+79sYIlMemTBFlOLoxoDfXlynpH44Ti
         fKCw+riUsXFMPq/CW8kFpLhbAjX6fQPwOQMiYdMYwH9DX+hrLDAoiHSBHwR/znmkXrl+
         s67gfwir1AILk8UZJzWtbv8YNXF5TsPgRfWEvRuvVznavU/lj7VWdj+0wwfIuPy4RhPu
         qz2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f68si308727qtb.41.2017.05.09.08.58.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 May 2017 08:58:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d87XC-00042r-Bw
	for alex.bennee@linaro.org; Tue, 09 May 2017 11:58:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d87X5-00041Z-Ki
	for qemu-arm@nongnu.org; Tue, 09 May 2017 11:58:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d87X1-000838-5E
	for qemu-arm@nongnu.org; Tue, 09 May 2017 11:58:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57316)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d87X0-00081U-S8; Tue, 09 May 2017 11:58:35 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA3F980F8E;
	Tue,  9 May 2017 15:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com AA3F980F8E
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com AA3F980F8E
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B1EE25C881;
	Tue,  9 May 2017 15:58:31 +0000 (UTC)
Date: Tue, 9 May 2017 17:58:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20170509175829.23fcc112@nial.brq.redhat.com>
In-Reply-To: <20170508054004.GE25748@umbus.fritz.box>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-24-git-send-email-imammedo@redhat.com>
	<20170508054004.GE25748@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 09 May 2017 15:58:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 23/24] numa: add '-numa cpu,
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
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mJ/toHe1jHBJ

On Mon, 8 May 2017 15:40:04 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

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
Not sure that get question.

if it's about machine_set_cpu_numa_node() than it's a single generic
setter of MachineState::possible_cpus(node-id) from non machine code
and the only place it's supposed to be used is from numa configuration
code. I don't see any need to reuse it for something/somewhere else
so far.

More over it's not 1:1 mapping wrt input:affected slots,
it's 1:[1-n] where input could affect multiple slots.

I think I've tried to get machine return a list of cpu slots
and then deal with them in numa.c but result looked messy and
not to my liking.
Eventually I stopped on machine_set_cpu_numa_node() variant
as the cleanest for now.
