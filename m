Received: by 10.25.0.6 with SMTP id 6csp1787233lfa;
        Tue, 30 May 2017 05:13:42 -0700 (PDT)
X-Received: by 10.200.41.247 with SMTP id 52mr22113657qtt.168.1496146422190;
        Tue, 30 May 2017 05:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496146422; cv=none;
        d=google.com; s=arc-20160816;
        b=GwvEDL4NLLkQkHUmAWuE/TH2cD/TQ4/pbkqTc+gECDB/9YTaE24Dg35eXjaefWbcjJ
         UXX9KbHK/utTT1oaaxbfPAWaHzKdeb/t7JBUwdo6sZKgoA4xct4HSfmirByDrba3dKUw
         gQ/oZYlyK24DLlK6WY3J6X65oEsc4zK41avaMnhnJrdVmIbtEzNA0NN0pQNBY6d7/+Qn
         LeRiq67RVg6rixW8MVzFsm1dz1bN6F2mC90e0mYH3c4nfoyAxsbCHD2G1p8NHR6EG1sF
         /prax1n6uOjNwbhDHnzkc5LLSeawfVGQU4zFRIJjpnUw38aITNnmURJ2je5wnEo6Jltu
         QnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=uRtGwsvtPwvDIodD0E3FqOEbNF3SKgi6iZHemx3k1Ks=;
        b=F5JDO4ffJQhEkCxZ3lB+OTJDveJ7IFetTnTkCyZRXQ5P7naQTST1KWM8wk33hl8saB
         QySwrgcY37vAz1n9PKMZ99hqs7lj9MKfVIgwFdll8ZTadd+pL+Bw/RtU0RPFv15w7q0N
         K0y+/PmgWYsoZmfjn4ByKmQv4T7IWd16712TThEOVIWkliPLv3Gt5dpD5cB5jZeWBmab
         21fqWI8+tLwdSTjoBZUo13R6d30sPyILWSOZaeVFXKoArHcxYnvT4pSCN/OkzYEcqSLg
         cMaumzttbhx9is8PHtdu9t62ewSnXHrwQeB2tyO1BExnPPlK7drqmxZ+j48GjLeuKZQF
         YcOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x27si12630746qtc.283.2017.05.30.05.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 05:13:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53481 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFg1t-00071Y-Nf
	for alex.bennee@linaro.org; Tue, 30 May 2017 08:13:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFg1q-00071S-IR
	for qemu-arm@nongnu.org; Tue, 30 May 2017 08:13:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFg1n-0003gX-D9
	for qemu-arm@nongnu.org; Tue, 30 May 2017 08:13:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41958)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dFg1n-0003fE-47; Tue, 30 May 2017 08:13:35 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9E0B72467;
	Tue, 30 May 2017 12:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D9E0B72467
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D9E0B72467
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F86A5C8A6;
	Tue, 30 May 2017 12:13:31 +0000 (UTC)
Date: Tue, 30 May 2017 14:13:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170530141329.60d728c6@nial.brq.redhat.com>
In-Reply-To: <20170526154625.GI22043@thinpad.lan.raisama.net>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
	<1494415802-227633-7-git-send-email-imammedo@redhat.com>
	<20170526154625.GI22043@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 30 May 2017 12:13:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 06/18] numa: mirror cpu to
 node mapping in MachineState::possible_cpus
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
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WnX/20SzmNqE

On Fri, 26 May 2017 12:46:25 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Wed, May 10, 2017 at 01:29:50PM +0200, Igor Mammedov wrote:
> [...]
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index 2482c63..420c8c4 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -389,6 +389,102 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)  
> [...]
> > +void machine_set_cpu_numa_node(MachineState *machine,
> > +                               const CpuInstanceProperties *props, Error **errp)
> > +{  
> [...]
> > +    /* force board to initialize possible_cpus if it hasn't been done yet */
> > +    mc->possible_cpu_arch_ids(machine);  
> [...]
> > diff --git a/numa.c b/numa.c
> > index 7182481..7db5dde 100644
> > --- a/numa.c
> > +++ b/numa.c
> > @@ -170,6 +170,7 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
> >          exit(1);
> >      }
> >      for (cpus = node->cpus; cpus; cpus = cpus->next) {
> > +        CpuInstanceProperties props;
> >          if (cpus->value >= max_cpus) {
> >              error_setg(errp,
> >                         "CPU index (%" PRIu16 ")"
> > @@ -178,6 +179,10 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
> >              return;
> >          }
> >          bitmap_set(numa_info[nodenr].node_cpu, cpus->value, 1);
> > +        props = mc->cpu_index_to_instance_props(ms, cpus->value);
> > +        props.node_id = nodenr;
> > +        props.has_node_id = true;
> > +        machine_set_cpu_numa_node(ms, &props, &error_fatal);  
> 
> This triggers a call to possible_cpu_arch_ids() before
> nb_numa_nodes is set to the actual number of NUMA nodes in the
> machine, breaking the "node_id = ... % nb_numa_nodes"
> initialization logic in pc, virt, and spapr.
Looking at it more, in current code this problem theoretically
affects only partial mapping case. And even there it's masked by 
fixup to 0 node for non explicitly mapped CPUs and the bug which
 *) "[PATCH v2 3/5] numa: make sure that all cpus in has  has_node_id set if numa is enabled"
fixes. So invalid default values for non mapped cpus are stored
in possible_cpus but not used nor visible elsewhere.

[*] as side effect fixes invalid defaults in possible_cpus as well
by fixup to 0 node that's moved from pre_plug handler.

In future we are going to remove partial mapping with fixup to 0
and fetch default mappings from possible_cpus where these wrong
defaults won't exists (or matter) as CPUs are going to either
 1) be all explicitly mapped (so all node_id values are overwritten)
or
 2) all default mapped (where defaults will be correct since no
    -numa cpu=/-numa node,cpus= were called), but that's fragile
    so I'd add calculate defaults at machine_run_board_init()
    time anyway.
