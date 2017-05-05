Received: by 10.25.0.198 with SMTP id 189csp50030lfa;
        Fri, 5 May 2017 01:09:41 -0700 (PDT)
X-Received: by 10.55.68.84 with SMTP id r81mr11185133qka.250.1493971781488;
        Fri, 05 May 2017 01:09:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a201si3961261qkb.299.2017.05.05.01.09.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 May 2017 01:09:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6YJ0-0003mG-Oo
	for alex.bennee@linaro.org; Fri, 05 May 2017 04:09:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d6YIp-0003m5-7J
	for qemu-arm@nongnu.org; Fri, 05 May 2017 04:09:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d6YIl-0001vh-8l
	for qemu-arm@nongnu.org; Fri, 05 May 2017 04:09:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40320)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d6YIl-0001vM-1l; Fri, 05 May 2017 04:09:23 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDBA98553D;
	Fri,  5 May 2017 08:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DDBA98553D
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com DDBA98553D
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 387B15C546;
	Fri,  5 May 2017 08:09:20 +0000 (UTC)
Date: Fri, 5 May 2017 10:09:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20170505100918.181acc8b@nial.brq.redhat.com>
In-Reply-To: <20170505014522.GK14413@umbus.fritz.box>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-13-git-send-email-imammedo@redhat.com>
	<20170505014522.GK14413@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 05 May 2017 08:09:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 12/24] numa: add
 numa_[has_]node_id() wrappers
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
X-TUID: XEpM2f2aIExR

On Fri, 5 May 2017 11:45:22 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, May 03, 2017 at 02:57:06PM +0200, Igor Mammedov wrote:
> > wrappers should make access to [has]node_id fields more readable
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> 
> Correct, though I'm not sure it actually simplifies things that much.
> Maybe more in future patches, though.
that's what Drew insisted on, and even though I prefer other way around
I won't stall series arguing about styling issues,
so here this patch goes.

> 
> > ---
> >  follow up patches will use this wrappers
> >  v2:
> >     - add wrappers (Drew)
> > ---
> >  include/sysemu/numa.h | 10 ++++++++++
> >  numa.c                |  2 +-
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> > index 46ea6c7..98d01e6 100644
> > --- a/include/sysemu/numa.h
> > +++ b/include/sysemu/numa.h
> > @@ -35,4 +35,14 @@ uint32_t numa_get_node(ram_addr_t addr, Error **errp);
> >  /* on success returns node index in numa_info,
> >   * on failure returns nb_numa_nodes */
> >  int numa_get_node_for_cpu(int idx);
> > +
> > +static inline bool numa_has_node_id(const CPUArchIdList *possible_cpus, int idx)
> > +{
> > +    return possible_cpus->cpus[idx].props.has_node_id;
> > +}
> > +
> > +static inline int numa_node_id(const CPUArchIdList *possible_cpus, int idx)
> > +{
> > +    return possible_cpus->cpus[idx].props.node_id;
> > +}
> >  #endif
> > diff --git a/numa.c b/numa.c
> > index c7e3e0a..872ee0d 100644
> > --- a/numa.c
> > +++ b/numa.c
> > @@ -394,7 +394,7 @@ void parse_numa_opts(MachineState *ms)
> >  
> >          possible_cpus = mc->possible_cpu_arch_ids(ms);
> >          for (i = 0; i < possible_cpus->len; i++) {
> > -            if (possible_cpus->cpus[i].props.has_node_id) {
> > +            if (numa_has_node_id(possible_cpus, i)) {
> >                  break;
> >              }
> >          }  
> 

