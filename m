Received: by 10.25.0.198 with SMTP id 189csp482325lfa;
        Thu, 4 May 2017 02:19:32 -0700 (PDT)
X-Received: by 10.55.42.225 with SMTP id q94mr6686077qkq.178.1493889572176;
        Thu, 04 May 2017 02:19:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g65si613224qke.238.2017.05.04.02.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 May 2017 02:19:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6Cv3-000841-Gw
	for alex.bennee@linaro.org; Thu, 04 May 2017 05:19:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d6Cuv-00083u-Oo
	for qemu-arm@nongnu.org; Thu, 04 May 2017 05:19:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d6Cur-00042f-QG
	for qemu-arm@nongnu.org; Thu, 04 May 2017 05:19:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55096)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d6Cur-00042J-G7; Thu, 04 May 2017 05:19:17 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5265083F43;
	Thu,  4 May 2017 09:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5265083F43
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5265083F43
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 437021834D;
	Thu,  4 May 2017 09:19:14 +0000 (UTC)
Date: Thu, 4 May 2017 11:19:12 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170504111912.37001878@nial.brq.redhat.com>
In-Reply-To: <20170503151321.GP3482@thinpad.lan.raisama.net>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-6-git-send-email-imammedo@redhat.com>
	<20170503151321.GP3482@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 04 May 2017 09:19:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 05/24] numa: move source of default CPUs
 to NUMA node mapping into boards
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
X-TUID: JvxEgDSH8woL

On Wed, 3 May 2017 12:13:21 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Wed, May 03, 2017 at 02:56:59PM +0200, Igor Mammedov wrote:
> [...]
> > diff --git a/numa.c b/numa.c
> > index 6fc2393..ab1661d 100644
> > --- a/numa.c
> > +++ b/numa.c
> > @@ -294,9 +294,10 @@ static void validate_numa_cpus(void)
> >      g_free(seen_cpus);
> >  }
> >  
> > -void parse_numa_opts(MachineClass *mc)
> > +void parse_numa_opts(MachineState *ms)
> >  {
> >      int i;
> > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> >  
> >      for (i = 0; i < MAX_NODES; i++) {
> >          numa_info[i].node_cpu = bitmap_new(max_cpus);
> > @@ -378,14 +379,16 @@ void parse_numa_opts(MachineClass *mc)  
> 
> 
> Expanding diff context:
> 
> >          /* Historically VCPUs were assigned in round-robin order to NUMA
> >           * nodes. However it causes issues with guest not handling it nice
> >           * in case where cores/threads from a multicore CPU appear on
> >           * different nodes. So allow boards to override default distribution
> >           * rule grouping VCPUs by socket so that VCPUs from the same socket
> >           * would be on the same node.
> >           */  
> 
> The above comment looks obsolete, as we are removing the code inside
> parse_numa_opts() that deals with grouping VCPUs by socket.
> 
> (Can be fixed by a follow-up patch, if necessary.)
it looks like, I'll respin series.
So I'll drop it on respin.

Looking at setting default mapping more,
it should be possible to remove it from parse_numa_opts()
altogether after this series.
Enable predefined by machine default mapping won't need
cpu_index_to_instance_props() translation. We just need
to set 'has_node_id = true' in possible_cpus for all cpus.

But I'd like to do this cleanup on top of this series.

> 
> > +        if (!mc->cpu_index_to_instance_props) {
> > +            error_report("default CPUs to NUMA node mapping isn't supported");
> > +            exit(1);
> > +        }
> >          if (i == nb_numa_nodes) {
> >              for (i = 0; i < max_cpus; i++) {
> > -                unsigned node_id = i % nb_numa_nodes;
> > -                if (mc->cpu_index_to_socket_id) {
> > -                    node_id = mc->cpu_index_to_socket_id(i) % nb_numa_nodes;
> > -                }
> > +                CpuInstanceProperties props;
> > +                props = mc->cpu_index_to_instance_props(ms, i);
> >  
> > -                set_bit(i, numa_info[node_id].node_cpu);
> > +                set_bit(i, numa_info[props.node_id].node_cpu);
> >              }
> >          }
> >    
> [...]
> 

