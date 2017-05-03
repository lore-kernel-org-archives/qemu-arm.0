Received: by 10.25.0.198 with SMTP id 189csp177729lfa;
        Wed, 3 May 2017 09:20:39 -0700 (PDT)
X-Received: by 10.55.99.87 with SMTP id x84mr3548398qkb.86.1493828438925;
        Wed, 03 May 2017 09:20:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p41si5308485qtf.66.2017.05.03.09.20.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 09:20:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5x12-0004bT-3w
	for alex.bennee@linaro.org; Wed, 03 May 2017 12:20:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5x0S-00042v-B9
	for qemu-arm@nongnu.org; Wed, 03 May 2017 12:20:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5x0O-0002En-BW
	for qemu-arm@nongnu.org; Wed, 03 May 2017 12:20:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53764)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d5x0O-0002Ec-5U; Wed, 03 May 2017 12:19:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 675CDC04B94F;
	Wed,  3 May 2017 16:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 675CDC04B94F
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 675CDC04B94F
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 08B3717976;
	Wed,  3 May 2017 16:19:51 +0000 (UTC)
Date: Wed, 3 May 2017 18:19:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170503181950.3aed0972@nial.brq.redhat.com>
In-Reply-To: <20170503150429.GO3482@thinpad.lan.raisama.net>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-10-git-send-email-imammedo@redhat.com>
	<20170503150429.GO3482@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 03 May 2017 16:19:55 +0000 (UTC)
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
X-TUID: SrKxrfMvgrE3

On Wed, 3 May 2017 12:04:29 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Wed, May 03, 2017 at 02:57:03PM +0200, Igor Mammedov wrote:
> > Default node mapping initialization already checks that board
> > supports cpu_index to node mapping and refuses to start if
> > it's not supported. Do the same for explicitly provided
> > mapping "-numa node,cpus=..."
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  numa.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/numa.c b/numa.c
> > index ab1661d..b517870 100644
> > --- a/numa.c
> > +++ b/numa.c
> > @@ -140,10 +140,12 @@ uint32_t numa_get_node(ram_addr_t addr, Error **errp)
> >      return -1;
> >  }
> >  
> > -static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
> > +static void numa_node_parse(MachineState *ms, NumaNodeOptions *node,
> > +                            QemuOpts *opts, Error **errp)
> >  {
> >      uint16_t nodenr;
> >      uint16List *cpus = NULL;
> > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> >  
> >      if (node->has_nodeid) {
> >          nodenr = node->nodeid;
> > @@ -162,6 +164,10 @@ static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
> >          return;
> >      }
> >  
> > +    if (!mc->cpu_index_to_instance_props) {
> > +        error_report("CPUs to NUMA node mapping isn't supported");
> > +        exit(1);
> > +    }  
> 
> The error message sounds very confusing me. Maybe this could
> become just: "NUMA is not supported by the %s machine-type"?
If I replace this specific error message with a generic one and do
the same in 5/24, it will be harder for us/user to figure out
where exactly error happened.

Would be following clearer:
"option -numa node,cpus= is not supported by the %s machine-type"

