Received: by 10.25.0.6 with SMTP id 6csp1395202lfa;
        Mon, 29 May 2017 06:14:54 -0700 (PDT)
X-Received: by 10.237.39.195 with SMTP id m3mr17139125qtg.164.1496063694761;
        Mon, 29 May 2017 06:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496063694; cv=none;
        d=google.com; s=arc-20160816;
        b=lE+4l48+4DuL9K2OIKniab2E1bHF9HmrE2sKDgou2L12VzUjLO+vdpTaS9SK9yOqJw
         DQlQI+KfmRTlw1YgBNK1kHB7opw2jBJLGSKscwK1LdqpxzFY9F4/XiLOlLB9aiF6Xlu4
         1niK0siZYtlQHpE3W+BD5RIrgWEqA7hNibOhvay8paZnPE5yeHj2qkrHbayW7MPgXnLC
         /kqXA11wko2M0YoibZ1EiusTbkJRHrnVdEtFxjbieiIDjVGfh2RIZSq/shKXaG3i0sBD
         k1nEdO8DHrLuSz5Pb+nTVwLFf3BgcbALxvbIhlDyKtlAolTXGVBVgXmiuTsCT7lBAGZi
         f0Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=r8tpy9ulYFXH+qFnuvErcENHLnZmtfKnOkAznK98EbU=;
        b=NzUhuvzy4ME0vvCtp3ywXf52kZTJ4WS7pB1VYikYv4npo4a/RWZffLR8yG7ZyKbg90
         iEfJyR9TJg6UV7qKJ5XTrLpkZbiQnPERIF1XpZzX72Ag3IkmVEbPjE5KtQY7Kwj+9Adf
         /s/1wqZ6sekOM/DMyDodJm1ML8MfIguwHef0dNX4gXki1zAlTUOcGIFI4vJXozln0M4H
         V75d449Nxua6BpEuKLMoJnJqqWbInadyXMQkv58b+1ZjdnPTzxo54Db5YUxwuY6T8+5R
         +8jMPC7DXIIDvGktEJeaI3/3J0pIMG0K/A8IpFqfuvnlJVe9CIwcsVvpzlggqzBYLmzd
         97NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r83si2072076qkl.309.2017.05.29.06.14.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 May 2017 06:14:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48727 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFKVa-0003Q0-7p
	for alex.bennee@linaro.org; Mon, 29 May 2017 09:14:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFKTb-0001pf-Qu
	for qemu-arm@nongnu.org; Mon, 29 May 2017 09:12:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFKTa-0002a1-ST
	for qemu-arm@nongnu.org; Mon, 29 May 2017 09:12:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57218)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dFKTa-0002Zw-J3; Mon, 29 May 2017 09:12:50 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F0B0C056820;
	Mon, 29 May 2017 13:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3F0B0C056820
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3F0B0C056820
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 47809189B5;
	Mon, 29 May 2017 13:12:47 +0000 (UTC)
Date: Mon, 29 May 2017 15:12:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170529151245.3fba6db4@nial.brq.redhat.com>
In-Reply-To: <20170526154625.GI22043@thinpad.lan.raisama.net>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
	<1494415802-227633-7-git-send-email-imammedo@redhat.com>
	<20170526154625.GI22043@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 29 May 2017 13:12:49 +0000 (UTC)
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
X-TUID: Mmde3rtZmfCT

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
> 
> The initialization ordering between possible_cpus and NUMA data
> structures looks very subtle and fragile.  I still don't see an
> obvious way to untangle that.
It's unfixable unless we require specific ordering on CLI,
i.e. first go all '-numa node,nodeid=[...]' options and only then
the rest of [-numa node,cpus|cpu].
We can do that for '-numa cpu' (probably should do enforce it for
this new option anyway for saner CLI)

but not for '-numa node,cpus' as it will break existing users
that do not declare nodes first.

> I suggest moving the default-NUMA-mapping code to a separate
> machine class method, instead of relying on
> possible_cpu_arch_ids() to initialize node_id.
So as you suggest we have to postpone default values initialization
till all the options are parsed:

1: strait-forward additional machine callback called from
   machine_run_board_init()

or:

2: save extra callback and recalculate not yet set props.node_id-s
   in possible_cpu_arch_ids() if nb_numa_nodes is changed since
   the last invocation of possible_cpu_arch_ids()

which one would you prefer?
