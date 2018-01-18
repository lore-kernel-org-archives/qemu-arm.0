Received: by 10.28.173.206 with SMTP id w197csp6893263wme;
        Thu, 18 Jan 2018 11:06:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBosCaEPI3YqpYqRMPWfpYFDdp+vtqDg2Z9uKw0JQe/DknZfK5thH6lZc0rPjZLPu97mCIl4q
X-Received: by 10.37.96.214 with SMTP id u205mr2072185ybb.296.1516302401839;
        Thu, 18 Jan 2018 11:06:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516302401; cv=none;
        d=google.com; s=arc-20160816;
        b=atxsB3gznjMOlhpY/Ze2L7aLcGpDSoJLtmfkUybZrr/aM6MELQLjdYFXjD68VAfEol
         Hi5DSjC4vWsoCGIbc86vjE1Bz1ZPiedt6aWgSP2TNlin5HK16FHek4rnm95HSVKerywg
         YVjgAOl1/j/slAwTP3cu2tjQv/iNQaWJEiH9tY45fyQXGCkPYjwD4mlwDUecnyaT3a9+
         5IQSqYyOa1LMvbhJiJ1FKDzKMhLYjZRouD5gnKVkLW83qoAqXUJFRtKMXihSpxNHqu8+
         7dRuw4hVik+l0HBjRjsJxG4HGsE2pApvmjxdveRuVGXrBTrUldHIwZChNkW5Cxm0KTkt
         nlyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Nto7SxTRoht1qIdgMM51irOJ7DIXlsDVHPvLjUuxbc0=;
        b=bhOI1xoCC8O097P5X6jradshZ7PTCHh19BBeoji/lgUpho/QCHV24QXJ8/Ru0hTYn3
         om8pNKTSAX133zVrCVSj/25xo30yv4eI7wZRpk1FCfdIw7v3Pz2ZuY+k4hLpba/EcWHu
         96cttzV0wHhVpmmZakwfM6rx6dE0saViprvLuK4Vnim+Hq9g9I8pSKDLh87MhAO7cEvB
         H83z1QCI+DePY8WfYBQPy2k054LrwsyDwNKhBxF53/+DaBhcuDt9uFzW6LowfERUWjEH
         2YGb6mddSTZDyHtATY5KB3crBKuTlsXbX9d0CGiAuVvycU8X0S1TuiYsy23ILIsuS/IH
         PrDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n82si251652ybf.539.2018.01.18.11.06.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 11:06:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecFWL-0000hR-2R
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 14:06:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ecFWA-0000gs-4K
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 14:06:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ecFW6-0006fN-5L
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 14:06:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52656)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ecFW5-0006fC-Ro; Thu, 18 Jan 2018 14:06:26 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0DEC143A31;
	Thu, 18 Jan 2018 19:06:25 +0000 (UTC)
Received: from [10.40.204.87] (ovpn-204-87.brq.redhat.com [10.40.204.87])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 246085DD6C;
	Thu, 18 Jan 2018 19:06:06 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
	<1516296842-136976-3-git-send-email-imammedo@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <33aa0c19-59ec-7063-f638-884fe2249aee@redhat.com>
Date: Thu, 18 Jan 2018 20:06:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1516296842-136976-3-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 18 Jan 2018 19:06:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-ppc] [RFC v2 2/5] machine: prepare machine
 'none' to gradually switch to cpu_create() API
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kW6gsu5Y4xsU

On 18.01.2018 18:33, Igor Mammedov wrote:
> temporarily add #ifdef CPU_RESOLVING_TYPE in null-machine.c,
> so that each target could gradually switch to cpu_create() and
> not converted yet could continue to use cpu_init().
> 
> Once all targets are converted
>    temporary ifdefs, MachineState::cpu_model and cpu_init() API
> will be removed
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/core/null-machine.c | 13 ++++++++++++-
>  vl.c                   |  8 +++++++-
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
> index 864832d..3cc6a49 100644
> --- a/hw/core/null-machine.c
> +++ b/hw/core/null-machine.c
> @@ -23,10 +23,18 @@
>  static void machine_none_init(MachineState *mch)
>  {
>      CPUState *cpu = NULL;
> +#ifdef CPU_RESOLVING_TYPE
> +    MachineClass *mc = MACHINE_GET_CLASS(mch);
>  
> -    /* Initialize CPU (if a model has been specified) */
> +    /* Initialize CPU if cpu_type pointer is user provided
> +     * (i.e. != to pointer tot static default cpu type string)

s/tot/to/ ?

> +     */
> +    if (mch->cpu_type != mc->default_cpu_type) {
> +        cpu = cpu_create(mch->cpu_type);
> +#else
>      if (mch->cpu_model) {
>          cpu = cpu_init(mch->cpu_model);
> +#endif
>          if (!cpu) {
>              error_report("Unable to initialize CPU");
>              exit(1);
> @@ -54,6 +62,9 @@ static void machine_none_machine_init(MachineClass *mc)
>      mc->init = machine_none_init;
>      mc->max_cpus = 1;
>      mc->default_ram_size = 0;
> +#ifdef CPU_RESOLVING_TYPE
> +    mc->default_cpu_type = CPU_RESOLVING_TYPE;
> +#endif
>  }
>  
>  DEFINE_MACHINE("none", machine_none_machine_init)
> diff --git a/vl.c b/vl.c
> index 2586f25..8aa0131 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4609,7 +4609,6 @@ int main(int argc, char **argv, char **envp)
>      current_machine->maxram_size = maxram_size;
>      current_machine->ram_slots = ram_slots;
>      current_machine->boot_order = boot_order;
> -    current_machine->cpu_model = cpu_model;
>  
>      parse_numa_opts(current_machine);
>  
> @@ -4619,6 +4618,13 @@ int main(int argc, char **argv, char **envp)
>          if (cpu_model) {
>              current_machine->cpu_type =
>                  cpu_parse_cpu_model(machine_class->default_cpu_type, cpu_model);
> +
> +            /* machine 'none' depends on default cpu type pointer not being
> +             * equal to resolved type name pointer to fugure out if type was

s/fugure/figure/

> +             * user provided, make sure that if it becomes not true in future
> +             * it won't beark silently */

s/beark/break/

> +            g_assert(
> +                current_machine->cpu_type != machine_class->default_cpu_type);
>          }
>      }

 Thomas


