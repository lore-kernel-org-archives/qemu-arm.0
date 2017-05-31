Received: by 10.25.0.6 with SMTP id 6csp324523lfa;
        Wed, 31 May 2017 06:32:22 -0700 (PDT)
X-Received: by 10.237.54.193 with SMTP id f59mr28584745qtb.63.1496237542496;
        Wed, 31 May 2017 06:32:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496237542; cv=none;
        d=google.com; s=arc-20160816;
        b=MUJfu42S0nQRjdFE3inP/dWYFqQCftsef4Qs6xhFfOWUM9NF7jlNQS6nc7gzvdohys
         qDlsEWXHLwFBGDNDIqMns0C2qo/4fcqHLnhSvM/qL/GQ9DWyHsrl2gchsSQRNSzQu3hg
         FIukaE5SnPjGx5/DVvM6GpvFjnCN8LongywU3QopRuJo70tAgV8rAOnPahNJncjLywyO
         wwzF6XY3+iUELSQWSTJfpy0Vk6XqqHCYlYfZIln7Vbcv2izegKMA4c/tVj4YHDlMVmJ5
         v6Zflps5J1t0YRYbfPANnBQiqaFsqltNwmBhRkmSnyEcGUtldADBt36XjrUn/7uh5g9e
         Jt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=TG9/A0hhgvktpdpQjD1FDJ4FjmNynlwo+WXCo+YQSDA=;
        b=u/R2snOOiAWs8b7/F5N6AKoaHmrbHJpejSFQi4DoAsd7TcqNY9POvEMexw2JRDRVtZ
         5CDlnUSZY79A4N3PCidHVJVFhCeFY17yd7wbwvoAxjkNAE2VFBBj4pg/ur+ZDLlNMql+
         h3iJWTpkMf6gHPHSO38nD6LsTNtzBcO0YkFrST25vjfxfGZuXZx4OK+hECgkh8xphhMZ
         ce3uJo/znE0H0iMFHRhpmmQ+l4iTkNTzH4Opx/uouQVAPfi2zJ4Ptx08hBlkKcVDxr9C
         dPODLfqM2L8ug5meBmUp1YvKvs8iLRJs0tT77BA2+TJQDQH/UikIwtH3A7JzsaIFC51J
         iWsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d27si16238415qtb.47.2017.05.31.06.32.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 May 2017 06:32:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59455 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dG3jX-0001Bz-P2
	for alex.bennee@linaro.org; Wed, 31 May 2017 09:32:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dG3jM-00017D-Pd
	for qemu-arm@nongnu.org; Wed, 31 May 2017 09:32:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dG3jJ-0002pn-Eu
	for qemu-arm@nongnu.org; Wed, 31 May 2017 09:32:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46750)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dG3jJ-0002pS-6P; Wed, 31 May 2017 09:32:05 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A9CC47248A;
	Wed, 31 May 2017 13:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A9CC47248A
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A9CC47248A
Received: from localhost (ovpn-116-43.gru2.redhat.com [10.97.116.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 04E881963C;
	Wed, 31 May 2017 13:32:02 +0000 (UTC)
Date: Wed, 31 May 2017 10:32:01 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170531133201.GS32274@thinpad.lan.raisama.net>
References: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
	<1496161442-96665-8-git-send-email-imammedo@redhat.com>
	<20170530200332.GR32274@thinpad.lan.raisama.net>
	<20170531105027.4dc177f6@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170531105027.4dc177f6@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 31 May 2017 13:32:04 +0000 (UTC)
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
X-TUID: jPkUV1jBCpHX

On Wed, May 31, 2017 at 10:50:27AM +0200, Igor Mammedov wrote:
> On Tue, 30 May 2017 17:03:32 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > On Tue, May 30, 2017 at 06:24:02PM +0200, Igor Mammedov wrote:
> [...]
> > > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > > index 76ce021..063f329 100644
> > > --- a/include/hw/boards.h
> > > +++ b/include/hw/boards.h
> > > @@ -94,6 +94,8 @@ typedef struct {
> > >   *    Returns an array of @CPUArchId architecture-dependent CPU IDs
> > >   *    which includes CPU IDs for present and possible to hotplug CPUs.
> > >   *    Caller is responsible for freeing returned list.
> > > + * @get_default_cpu_node_id:
> > > + *    returns default board specific node_id value for CPU
> > >   * @has_hotpluggable_cpus:
> > >   *    If true, board supports CPUs creation with -device/device_add.
> > >   * @minimum_page_bits:
> > > @@ -151,6 +153,7 @@ struct MachineClass {
> > >      CpuInstanceProperties (*cpu_index_to_instance_props)(MachineState *machine,
> > >                                                           unsigned cpu_index);
> > >      const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
> > > +    int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);  
> > 
> > Aren't we trying to move away from cpu_index-based CPU
> > identification?  Shouldn't we make this get a CPUArchId argument?
> it's not cpu-index but index in possible_cpus[],
> it's possible to pass in CPUArchId argument and then in callbacks
> compute it's index in possible_cpus[] but that seems
> a bit unnecessary and would complicate callback impl.
> 
> Probably I should add doc comment explaining 'idx' meaning.
> 
> > >  };
> > >  
> > >  /**
> > > diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> > > index 610eece..ea123ef 100644
> > > --- a/include/sysemu/numa.h
> > > +++ b/include/sysemu/numa.h
> > > @@ -36,4 +36,13 @@ void numa_legacy_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
> > >  void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
> > >                                    int nb_nodes, ram_addr_t size);
> > >  void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp);
> > > +
> > > +static inline void assert_nb_numa_nodes_change(void)  
> > 
> > Can you document the purpose of this function?
> > 
> > > +{
> > > +    static int saved_nb_numa_nodes;
> > > +    assert(nb_numa_nodes);
> > > +    assert(saved_nb_numa_nodes == 0 || saved_nb_numa_nodes == nb_numa_nodes);
> > > +    saved_nb_numa_nodes = nb_numa_nodes;
> > > +}
> > > +
> > >  #endif
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index ce676df..74f1453 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -1553,6 +1553,13 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> > >      return possible_cpus->cpus[cpu_index].props;
> > >  }
> > >  
> > > +static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
> > > +{
> > > +    assert(nb_numa_nodes);
> > > +    assert_nb_numa_nodes_change();  
> > 
> > I would move this assert to common code instead of copying it to
> > all implementations.
> > 
> > A machine_get_default_cpu_node_id() wrapper that calls
> > assert_nb_numa_nodes_change() and mc->get_default_cpu_node_id()
> > would be enough, and it wouldn't even need to be declared in a
> > header as the only caller would be at hw/core/machine.c.
> > 
> > (Or, if you prefer to simply drop the assert(), I think that
> > would be OK too.)
> Callbacks are 'public' API and potentially could be called from anywhere.

I don't think that's true.  Just like some struct fields aren't
supposed to be touched by other code, a callback can be
considered private and not supposed to be called from other code.

e.g.: it is invalid to call DeviceClass::realize directly outside
device_set_realized(), or to call MachineClass::init outside
machine_run_board_init().


> Putting asserts inside of callbacks instead of the current single call site
> should help to catch errors/wrong usage in future if callback were called
> from elsewhere.
> 
> So I'd prefer to keep it where it's now or drop it altogether
> as it's not much of use at the current call site.

I think it's unnecessary complexity.  But if you insist, I won't
mind as long as you document the purpose of
assert_nb_numa_nodes_change() clearly.


>  
> > > +    return idx % nb_numa_nodes;
> > > +}
> > > +
> > >  static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> > >  {
> > >      int n;
> [...]
> 
> 

-- 
Eduardo
