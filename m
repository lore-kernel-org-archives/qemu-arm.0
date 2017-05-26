Received: by 10.25.0.6 with SMTP id 6csp362759lfa;
        Fri, 26 May 2017 08:46:47 -0700 (PDT)
X-Received: by 10.200.1.72 with SMTP id f8mr3398962qtg.172.1495813606947;
        Fri, 26 May 2017 08:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495813606; cv=none;
        d=google.com; s=arc-20160816;
        b=uXPsEbQvwKyW3Rwm1TNr0ZB/zPPBO2QWTy69BwvbSGyC9QJ1M3/T8L2fEn7y1wy0tg
         BDeZnRbQY7jEVKFKeQUcWIjGUx2xqYhaPvKD57xAH5ghuP06mDyflCp+XNfpf8TY/wY3
         IE18wjhyw55zkJg4yWxMftnM81/8qfuCS8pUDt9iWmuc/07p7CQ9e12W1zZfgABCbDvT
         UB/oluiiDt3IGG30/frk/9qllusFARkW6aaIwChpf1piqll8CrpPvJKI75DKNjLz3+JQ
         Lv2Le9QueCa6jFn6E2cF2F96YD6jIZol/iUc4RslRe1EaoIrjKeGAtllAgWbLl4RWLl1
         EP0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=h0eYPe66QdnSinhvhdAO0OyfPTg2KPp/+me1ehCPVa8=;
        b=Tfn49c0XpUS2npxHWBVUALzByDaoQ/2wDt3Vfwny5LInQHyBjNyDi8BiYbkrXhOLiV
         xOSMXK+FoQWGNgeD3egCswZWPnujIUFiYIIeO26VifrlOt1JrXfi+18h/jq/Y233vJh1
         HiWNjTdS6wrTOeXkKOSxpmPWCtHwM1gA+FCxuvIHRHeneeNcZu68PaPJ7yQ+y58w9mfx
         SSaQKmIcjRaEr0dkl1dher0dR26eTZj+cIuU0c/hJWQzUrVPGBWx8JMBc8skhtdXEZK2
         IPHcznRRLFuiv3umiM71a5ipIENxZ+dM805wcMJe/Dx1ZNdxfPlLHcUXfgUcDVmBw8Uz
         0K9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13si1113923qkm.226.2017.05.26.08.46.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 May 2017 08:46:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dEHRu-0005Pp-Bw
	for alex.bennee@linaro.org; Fri, 26 May 2017 11:46:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dEHRn-0005Pc-Dn
	for qemu-arm@nongnu.org; Fri, 26 May 2017 11:46:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dEHRk-0001xn-2i
	for qemu-arm@nongnu.org; Fri, 26 May 2017 11:46:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55872)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dEHRj-0001xU-SB; Fri, 26 May 2017 11:46:36 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6A9D4C057FA6;
	Fri, 26 May 2017 15:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6A9D4C057FA6
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6A9D4C057FA6
Received: from localhost (ovpn-116-57.gru2.redhat.com [10.97.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E5B6757C1;
	Fri, 26 May 2017 15:46:26 +0000 (UTC)
Date: Fri, 26 May 2017 12:46:25 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170526154625.GI22043@thinpad.lan.raisama.net>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
	<1494415802-227633-7-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1494415802-227633-7-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 26 May 2017 15:46:34 +0000 (UTC)
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
X-TUID: aF3bMRoynM6Y

On Wed, May 10, 2017 at 01:29:50PM +0200, Igor Mammedov wrote:
[...]
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 2482c63..420c8c4 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -389,6 +389,102 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
[...]
> +void machine_set_cpu_numa_node(MachineState *machine,
> +                               const CpuInstanceProperties *props, Error **errp)
> +{
[...]
> +    /* force board to initialize possible_cpus if it hasn't been done yet */
> +    mc->possible_cpu_arch_ids(machine);
[...]
> diff --git a/numa.c b/numa.c
> index 7182481..7db5dde 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -170,6 +170,7 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
>          exit(1);
>      }
>      for (cpus = node->cpus; cpus; cpus = cpus->next) {
> +        CpuInstanceProperties props;
>          if (cpus->value >= max_cpus) {
>              error_setg(errp,
>                         "CPU index (%" PRIu16 ")"
> @@ -178,6 +179,10 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
>              return;
>          }
>          bitmap_set(numa_info[nodenr].node_cpu, cpus->value, 1);
> +        props = mc->cpu_index_to_instance_props(ms, cpus->value);
> +        props.node_id = nodenr;
> +        props.has_node_id = true;
> +        machine_set_cpu_numa_node(ms, &props, &error_fatal);

This triggers a call to possible_cpu_arch_ids() before
nb_numa_nodes is set to the actual number of NUMA nodes in the
machine, breaking the "node_id = ... % nb_numa_nodes"
initialization logic in pc, virt, and spapr.

The initialization ordering between possible_cpus and NUMA data
structures looks very subtle and fragile.  I still don't see an
obvious way to untangle that.

I suggest moving the default-NUMA-mapping code to a separate
machine class method, instead of relying on
possible_cpu_arch_ids() to initialize node_id.

-- 
Eduardo
