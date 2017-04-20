Received: by 10.25.0.144 with SMTP id 138csp760540lfa;
        Thu, 20 Apr 2017 07:29:29 -0700 (PDT)
X-Received: by 10.200.4.140 with SMTP id s12mr8822285qtg.35.1492698569001;
        Thu, 20 Apr 2017 07:29:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x67si6012520qkd.274.2017.04.20.07.29.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Apr 2017 07:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d1D5M-0007fA-DS
	for alex.bennee@linaro.org; Thu, 20 Apr 2017 10:29:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d1D5E-0007ex-U6
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 10:29:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d1D5B-0002hy-Kg
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 10:29:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41066)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d1D5B-0002hc-9g; Thu, 20 Apr 2017 10:29:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C44D9C05493A;
	Thu, 20 Apr 2017 14:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C44D9C05493A
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C44D9C05493A
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2CB7118204;
	Thu, 20 Apr 2017 14:29:13 +0000 (UTC)
Date: Thu, 20 Apr 2017 16:29:12 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20170420162912.52241bfe@nial.brq.redhat.com>
In-Reply-To: <20170328041920.GC21068@umbus.fritz.box>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-6-git-send-email-imammedo@redhat.com>
	<20170328041920.GC21068@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 20 Apr 2017 14:29:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.10 05/23] numa: move
 source of default CPUs to NUMA node mapping into boards
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
X-TUID: aODy5RJycbfx

On Tue, 28 Mar 2017 15:19:20 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Mar 22, 2017 at 02:32:30PM +0100, Igor Mammedov wrote:
[...]
answering to questions that I forgot to answer before

> > @@ -1554,6 +1554,16 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
> >      }
> >  }
> >  
> > +static CpuInstanceProperties
> > +virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> > +{
> > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> > +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
> > +
> > +    assert(cpu_index < possible_cpus->len);
> > +    return possible_cpus->cpus[cpu_index].props;;
> > +}
> > +  
> 
> It seems a bit weird to have a machine specific hook to pull the
> property information when one way or another it's coming from the
> possible_cpus table, which is already constructed by a machine
> specific hook.  Could we add a range or list of cpu_index values to
> each possible_cpus entry instead, and have a generic lookup of the
> right entry based on that?
Mainly I dislike the idea because it adds duplicate data to manage
that could be computed from already stored there CpuInstanceProperties.

And secondly if it were just 1 number then generic lookup would be trivial
but with list it becomes cumbersome to manage and implementation
larger then 3 *_cpu_index_to_props() hooks combined, it's not worth it
in foreseeable future.
 
> >  static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> >  {
> >      int n;
> > @@ -1573,8 +1583,12 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> >          ms->possible_cpus->cpus[n].props.has_thread_id = true;
> >          ms->possible_cpus->cpus[n].props.thread_id = n;
> >  
> > -        /* TODO: add 'has_node/node' here to describe
> > -           to which node core belongs */
> > +        /* default distribution of CPUs over NUMA nodes */
> > +        if (nb_numa_nodes) {
> > +            /* preset values but do not enable them i.e. 'has_node_id = false',
> > +             * board will enable them if manual mapping wasn't present on CLI */  
> 
> I'm a little confused by this comment, since I don't see any board
> code altering has_node_id.
it happens in the last 2 hunks of patch 10/23
may be I should write it like this:

+            /* preset values but do not enable them i.e. 'has_node_id = false',
+             * numa initialization code will enable them later if manual mapping
+             * wasn't present on CLI */

> 
> > +            ms->possible_cpus->cpus[n].props.node_id = n % nb_numa_nodes;;
> > +        }
> >      }
> >      return ms->possible_cpus;
> >  }
[...]
