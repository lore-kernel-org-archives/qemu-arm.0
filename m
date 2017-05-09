Received: by 10.25.0.6 with SMTP id 6csp122585lfa;
        Tue, 9 May 2017 06:14:36 -0700 (PDT)
X-Received: by 10.200.52.85 with SMTP id v21mr17110713qtb.45.1494335676474;
        Tue, 09 May 2017 06:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494335676; cv=none;
        d=google.com; s=arc-20160816;
        b=jWUHd51zXjS7WEP50K2XygjoquJ3bxs3lZpDJXhb/gOMknuQGipkCEEShcrajuErq3
         d3qUSng798EAi4dsIfmegDSEFroeUPxtK3tWMJ23gIFjmyN0MgRwC00q26U2lIK26ZWp
         jpBLPFGh3qplSbfbBfnaV6/WKQacjc4IJpxn77eQQyBlAlRwSMtuhPcF0IOvT0abaBEa
         dVg1Pa9UHIioK4aprnsZs0dltylAtY2IRub9d9ZYvPYmjsuW/VsFEm2PWBd4cBNxCynT
         pecmHKGb8X6eBakX7kRcBWY+I9ycz/ZL1k1UuhTZo4qHMne9BXPT7Om55HBFvGL+eWUk
         4Lnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=tv0aa//iOrK6Mz60VGvrRhS/jVc1Sv/jAhhVEOjyn/Y=;
        b=fHcUZKzbNZbpY77cnSmZRQeGwmlQLLz9s4qwarCYRayTUrXN1XbmdahbJbJnqJKesN
         ZalFYUbxo37k3K4IMf0QGY94hSZ5OsAMElzEsTevwqdyBg3G6G5lw3SHyvNBs5j6Wk8l
         0Tar2p6p7YwIfuAoHQT31B347mcLKQK8Qs8cu78Is3PClNajkSFRvQocu3Frzc5D/4Z9
         7eLwWNgE1hsPIa6ysC/axsikdooeG0kubhMtj2njdSalQNm84sElkSS7y+Ogt+tTKzKQ
         Wi7NtcODDRuPy0zQGzapabgcSCSllW6dtPiY6r2lK45Om/Rg7eLdUxwLVxpSnsr+3rFg
         5ERg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t1si14220945qtc.9.2017.05.09.06.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 May 2017 06:14:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37194 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d84yI-0001Li-VZ
	for alex.bennee@linaro.org; Tue, 09 May 2017 09:14:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d84yF-0001IK-MW
	for qemu-arm@nongnu.org; Tue, 09 May 2017 09:14:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d84yC-00031n-FT
	for qemu-arm@nongnu.org; Tue, 09 May 2017 09:14:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43200)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d84yC-00031S-4e; Tue, 09 May 2017 09:14:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF583C059740;
	Tue,  9 May 2017 13:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com EF583C059740
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com EF583C059740
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C854D87F9D;
	Tue,  9 May 2017 13:14:23 +0000 (UTC)
Date: Tue, 9 May 2017 15:14:21 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170509151421.0b51e1f2@nial.brq.redhat.com>
In-Reply-To: <20170505202923.GM3482@thinpad.lan.raisama.net>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-8-git-send-email-imammedo@redhat.com>
	<20170505202923.GM3482@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 09 May 2017 13:14:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 07/24] pc: add node-id property to CPU
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
X-TUID: apXlqIHFBh7m

On Fri, 5 May 2017 17:29:23 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Wed, May 03, 2017 at 02:57:01PM +0200, Igor Mammedov wrote:
> > it will allow switching from cpu_index to property based
> > numa mapping in follow up patches.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  hw/i386/pc.c      | 17 +++++++++++++++++
> >  target/i386/cpu.c |  1 +
> >  2 files changed, 18 insertions(+)
> > 
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 9cec0c1..4a4fb1c 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -1893,6 +1893,7 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
> >                              DeviceState *dev, Error **errp)
> >  {
> >      int idx;
> > +    int node_id;
> >      CPUState *cs;
> >      CPUArchId *cpu_slot;
> >      X86CPUTopoInfo topo;
> > @@ -1982,6 +1983,22 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
> >  
> >      cs = CPU(cpu);
> >      cs->cpu_index = idx;
> > +
> > +    node_id = numa_get_node_for_cpu(cs->cpu_index);
> > +    if (node_id == nb_numa_nodes) {
> > +        /* by default CPUState::numa_node was 0 if it's not set via CLI
> > +         * keep it this way for now but in future we probably should
> > +         * refuse to start up with incomplete numa mapping */
> > +        node_id = 0;
> > +    }
> > +    if (cs->numa_node == CPU_UNSET_NUMA_NODE_ID) {
> > +        cs->numa_node = node_id;  
> 
> I suggest moving the above lines to cpu_common_realizefn(), and
> deleting the code in numa_post_machine_init().
> 
> If you want to do this in v3 of this series, or as a follow-up
> patch, it's up to you.
maybe not to realize time, but yep I'm thinking about moving
this whole hunk into a helper function that could be reused
by pc/arm/spapr without duplicating.
I'd do it as follow-up.


> > +    } else if (cs->numa_node != node_id) {
> > +            error_setg(errp, "node-id %d must match numa node specified"
> > +                "with -numa option for cpu-index %d",
> > +                cs->numa_node, cs->cpu_index);
> > +            return;
> > +    }
> >  }
> >  
> >  static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 13c0985..007a5bd 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -3982,6 +3982,7 @@ static Property x86_cpu_properties[] = {
> >      DEFINE_PROP_INT32("core-id", X86CPU, core_id, -1),
> >      DEFINE_PROP_INT32("socket-id", X86CPU, socket_id, -1),
> >  #endif
> > +    DEFINE_PROP_INT32("node-id", CPUState, numa_node, CPU_UNSET_NUMA_NODE_ID),  
> 
> This changes the default from 0 to CPU_UNSET_NUMA_NODE_ID, but it
> looks like there's no existing i386 or PC code that ever looks at
> CPUState::numa_node. Maybe worth mentioning in the commit
> message.
In preceding hunk there is code which still effectively keeps it 0 by default
with comment explaining that it's so for legacy reasons.
I can copy comment in commit message as well if that's what you've meant.

for PC it would affect only HMP 'info numa' output,
but pc_cpu_pre_plug() in this patch takes care of it
to ensure that old behavior is preserved.

> 
> >      DEFINE_PROP_BOOL("pmu", X86CPU, enable_pmu, false),
> >      { .name  = "hv-spinlocks", .info  = &qdev_prop_spinlocks },
> >      DEFINE_PROP_BOOL("hv-relaxed", X86CPU, hyperv_relaxed_timing, false),
> > -- 
> > 2.7.4
> >   
> 

