Received: by 10.25.0.6 with SMTP id 6csp219807lfa;
        Wed, 31 May 2017 01:50:47 -0700 (PDT)
X-Received: by 10.55.22.84 with SMTP id g81mr24149756qkh.110.1496220647332;
        Wed, 31 May 2017 01:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496220647; cv=none;
        d=google.com; s=arc-20160816;
        b=bbbCLV6LkDgwsJTD3mDin8PL8PK5pKIkybMtFzGFkTyYv8sxpt2R/wjrH8a4zsUX6/
         7bR0cneAtRDr9cepx+4F4ntvAovYASrYiGgB2IQHLFKlGqdWxX3UF0aVUKbGryVQTmaE
         hKLrzfmyNKt8yTcIOgFnhJJW5WqHFgSEESqM+SjQNzidRYq+F/+2srOy1RJyPdpavnMD
         YNK1/k64ca4CACchVonLOsZnvBPFwYtVfIRz5liiFdD4NKx3NscMHjYj8fRSWz+iG5g5
         OqSH3dG23OiP8pqrC1v/+CCc64b0vG3vDNelHB76WPl1ek2l5Z8EJvqZfmYnNXRSZcMb
         6KUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=uXxfzbNmptpv27diUbmlk3JEtayAxtevIAgcl65Vt/A=;
        b=G0amANR+xg8XdOOc73Fdk/9EcNTAfqgEwOQUq1kXyKa6bLWNDCYyaU96CpWPkcv/HT
         bF+dKIeEvfAtRPS2+P0Jm9vYTBJUpGddEQUEYkhFsgsj0jqFkvnudinLSjOeOb+TlkQr
         V8GxN3ZLany/N8EirgVq+fbWY2SW72Y2BiAIzyurDxvmBsW4cUmR0K2t2rq4IzroYzgf
         df+U3nAK6uI4GvlByC0uFpFZDxQ/mLXqo/bL/7spCuLsu0KoN+evwQdkltpXyKrpJGEd
         FrzgCWbMiKIyvb6cO+lEO4SrWV/+WupeURmKDN2V+5nEZhn6LD40efy8TXdmOZh4mqAv
         q3Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o51si15650210qtc.263.2017.05.31.01.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 May 2017 01:50:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFzL2-0007LM-Kh
	for alex.bennee@linaro.org; Wed, 31 May 2017 04:50:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFzKr-0007Ig-5L
	for qemu-arm@nongnu.org; Wed, 31 May 2017 04:50:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFzKq-0003eE-61
	for qemu-arm@nongnu.org; Wed, 31 May 2017 04:50:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39250)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dFzKp-0003dw-Uc; Wed, 31 May 2017 04:50:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D53E28124A;
	Wed, 31 May 2017 08:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D53E28124A
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D53E28124A
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6593E183F0;
	Wed, 31 May 2017 08:50:29 +0000 (UTC)
Date: Wed, 31 May 2017 10:50:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170531105027.4dc177f6@nial.brq.redhat.com>
In-Reply-To: <20170530200332.GR32274@thinpad.lan.raisama.net>
References: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
	<1496161442-96665-8-git-send-email-imammedo@redhat.com>
	<20170530200332.GR32274@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 31 May 2017 08:50:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 7/7] numa: cpu: calculate/set
 default node-ids after all -numa CLI options are parsed
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PolTfc78S0G1

On Tue, 30 May 2017 17:03:32 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Tue, May 30, 2017 at 06:24:02PM +0200, Igor Mammedov wrote:
[...]
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index 76ce021..063f329 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -94,6 +94,8 @@ typedef struct {
> >   *    Returns an array of @CPUArchId architecture-dependent CPU IDs
> >   *    which includes CPU IDs for present and possible to hotplug CPUs.
> >   *    Caller is responsible for freeing returned list.
> > + * @get_default_cpu_node_id:
> > + *    returns default board specific node_id value for CPU
> >   * @has_hotpluggable_cpus:
> >   *    If true, board supports CPUs creation with -device/device_add.
> >   * @minimum_page_bits:
> > @@ -151,6 +153,7 @@ struct MachineClass {
> >      CpuInstanceProperties (*cpu_index_to_instance_props)(MachineState *machine,
> >                                                           unsigned cpu_index);
> >      const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
> > +    int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);  
> 
> Aren't we trying to move away from cpu_index-based CPU
> identification?  Shouldn't we make this get a CPUArchId argument?
it's not cpu-index but index in possible_cpus[],
it's possible to pass in CPUArchId argument and then in callbacks
compute it's index in possible_cpus[] but that seems
a bit unnecessary and would complicate callback impl.

Probably I should add doc comment explaining 'idx' meaning.

> >  };
> >  
> >  /**
> > diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> > index 610eece..ea123ef 100644
> > --- a/include/sysemu/numa.h
> > +++ b/include/sysemu/numa.h
> > @@ -36,4 +36,13 @@ void numa_legacy_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
> >  void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
> >                                    int nb_nodes, ram_addr_t size);
> >  void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp);
> > +
> > +static inline void assert_nb_numa_nodes_change(void)  
> 
> Can you document the purpose of this function?
> 
> > +{
> > +    static int saved_nb_numa_nodes;
> > +    assert(nb_numa_nodes);
> > +    assert(saved_nb_numa_nodes == 0 || saved_nb_numa_nodes == nb_numa_nodes);
> > +    saved_nb_numa_nodes = nb_numa_nodes;
> > +}
> > +
> >  #endif
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index ce676df..74f1453 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1553,6 +1553,13 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> >      return possible_cpus->cpus[cpu_index].props;
> >  }
> >  
> > +static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
> > +{
> > +    assert(nb_numa_nodes);
> > +    assert_nb_numa_nodes_change();  
> 
> I would move this assert to common code instead of copying it to
> all implementations.
> 
> A machine_get_default_cpu_node_id() wrapper that calls
> assert_nb_numa_nodes_change() and mc->get_default_cpu_node_id()
> would be enough, and it wouldn't even need to be declared in a
> header as the only caller would be at hw/core/machine.c.
> 
> (Or, if you prefer to simply drop the assert(), I think that
> would be OK too.)
Callbacks are 'public' API and potentially could be called from anywhere.
Putting asserts inside of callbacks instead of the current single call site
should help to catch errors/wrong usage in future if callback were called
from elsewhere.

So I'd prefer to keep it where it's now or drop it altogether
as it's not much of use at the current call site.
 
> > +    return idx % nb_numa_nodes;
> > +}
> > +
> >  static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> >  {
> >      int n;
[...]


