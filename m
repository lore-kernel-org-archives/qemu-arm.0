Received: by 10.25.0.198 with SMTP id 189csp205934lfa;
        Wed, 3 May 2017 10:31:24 -0700 (PDT)
X-Received: by 10.237.33.69 with SMTP id 63mr23387693qtc.251.1493832684181;
        Wed, 03 May 2017 10:31:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j2si19671725qtb.221.2017.05.03.10.31.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 10:31:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37969 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5y7V-0000xJ-IR
	for alex.bennee@linaro.org; Wed, 03 May 2017 13:31:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d5y7R-0000wz-4M
	for qemu-arm@nongnu.org; Wed, 03 May 2017 13:31:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d5y7O-0007Ni-1a
	for qemu-arm@nongnu.org; Wed, 03 May 2017 13:31:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36118)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d5y7N-0007NV-PB; Wed, 03 May 2017 13:31:13 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DA91C057FA7;
	Wed,  3 May 2017 17:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9DA91C057FA7
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9DA91C057FA7
Received: from localhost (ovpn-116-40.gru2.redhat.com [10.97.116.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5CB6717262;
	Wed,  3 May 2017 17:31:11 +0000 (UTC)
Date: Wed, 3 May 2017 14:31:09 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170503173109.GS3482@thinpad.lan.raisama.net>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-10-git-send-email-imammedo@redhat.com>
	<20170503150429.GO3482@thinpad.lan.raisama.net>
	<20170503181950.3aed0972@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170503181950.3aed0972@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 03 May 2017 17:31:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 09/24] numa: add check that board supports
 cpu_index to node mapping
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
X-TUID: bKkjrfXZwLQa

On Wed, May 03, 2017 at 06:19:50PM +0200, Igor Mammedov wrote:
> On Wed, 3 May 2017 12:04:29 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > On Wed, May 03, 2017 at 02:57:03PM +0200, Igor Mammedov wrote:
> > > Default node mapping initialization already checks that board
> > > supports cpu_index to node mapping and refuses to start if
> > > it's not supported. Do the same for explicitly provided
> > > mapping "-numa node,cpus=..."
> > > 
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > ---
> > >  numa.c | 13 ++++++++++---
> > >  1 file changed, 10 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/numa.c b/numa.c
> > > index ab1661d..b517870 100644
> > > --- a/numa.c
> > > +++ b/numa.c
> > > @@ -140,10 +140,12 @@ uint32_t numa_get_node(ram_addr_t addr, Error **errp)
> > >      return -1;
> > >  }
> > >  
> > > -static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
> > > +static void numa_node_parse(MachineState *ms, NumaNodeOptions *node,
> > > +                            QemuOpts *opts, Error **errp)
> > >  {
> > >      uint16_t nodenr;
> > >      uint16List *cpus = NULL;
> > > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> > >  
> > >      if (node->has_nodeid) {
> > >          nodenr = node->nodeid;
> > > @@ -162,6 +164,10 @@ static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
> > >          return;
> > >      }
> > >  
> > > +    if (!mc->cpu_index_to_instance_props) {
> > > +        error_report("CPUs to NUMA node mapping isn't supported");
> > > +        exit(1);
> > > +    }  
> > 
> > The error message sounds very confusing me. Maybe this could
> > become just: "NUMA is not supported by the %s machine-type"?
> If I replace this specific error message with a generic one and do
> the same in 5/24, it will be harder for us/user to figure out
> where exactly error happened.

I don't think we need to change the message in 5/24 if we change
this one.

> 
> Would be following clearer:
> "option -numa node,cpus= is not supported by the %s machine-type"

It would work if this was really the case. But the error message
is unconditional here, appearing even if cpus= is not set:

  $ qemu-system-x86_64 -m 1G -smp 1 -numa node,mem=1G -machine none
  qemu-system-x86_64: -numa node,mem=1G: CPUs to NUMA node mapping isn't supported

-- 
Eduardo
