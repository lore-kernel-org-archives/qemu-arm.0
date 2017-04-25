Received: by 10.25.0.144 with SMTP id 138csp1917359lfa;
        Tue, 25 Apr 2017 08:07:29 -0700 (PDT)
X-Received: by 10.55.166.5 with SMTP id p5mr16922803qke.132.1493132849832;
        Tue, 25 Apr 2017 08:07:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m123si22253582qkc.25.2017.04.25.08.07.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Apr 2017 08:07:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49844 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d323t-0005Dx-7o
	for alex.bennee@linaro.org; Tue, 25 Apr 2017 11:07:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d323m-0005Db-Vg
	for qemu-arm@nongnu.org; Tue, 25 Apr 2017 11:07:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d323j-00018z-OY
	for qemu-arm@nongnu.org; Tue, 25 Apr 2017 11:07:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39202)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d323j-00018d-IS; Tue, 25 Apr 2017 11:07:19 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E0FF3DBD4;
	Tue, 25 Apr 2017 15:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1E0FF3DBD4
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1E0FF3DBD4
Received: from Igors-MacBook-Pro.local (ovpn-112-47.ams2.redhat.com
	[10.36.112.47])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C186903E8;
	Tue, 25 Apr 2017 15:07:11 +0000 (UTC)
Date: Tue, 25 Apr 2017 17:07:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20170425170706.58f59d36@Igors-MacBook-Pro.local>
In-Reply-To: <20170425144830.3gesewid2vwkyqix@kamzik.brq.redhat.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-6-git-send-email-imammedo@redhat.com>
	<20170425144830.3gesewid2vwkyqix@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 25 Apr 2017 15:07:18 +0000 (UTC)
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6TyD6JcWryx1

On Tue, 25 Apr 2017 16:48:30 +0200
Andrew Jones <drjones@redhat.com> wrote:

> On Wed, Mar 22, 2017 at 02:32:30PM +0100, Igor Mammedov wrote:
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 0cbcbc1..8748d25 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
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
> > +            ms->possible_cpus->cpus[n].props.node_id = n % nb_numa_nodes;;
> 
> extra ;
fixed in v2

> 
> drew

