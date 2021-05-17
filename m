Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1055763lfm;
        Mon, 17 May 2021 01:24:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNV7nvwklFTGavwX8/delbwZnRJP9T0vXv+JBQILTaxlU5Q/92yCvnEgQO3mtthcJZu6/N
X-Received: by 2002:a6b:e719:: with SMTP id b25mr42143043ioh.49.1621239890662;
        Mon, 17 May 2021 01:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621239890; cv=none;
        d=google.com; s=arc-20160816;
        b=MMXfiB/9jrUMU54JIakzAbHWIitLs2vwxyQ0FwvSyNNfnZx532b83+NWiEDHS8bvKh
         hfhoMfOplmqG3E7ZQv2p93+4BtVDYpd/jAqOW9Xt7954WlxtZK+eSI4qy3yZT4woEo4z
         WTDd4j/+zwImllvTKcv7xucFJe1LmsdibcyX03PIwGnf1nHG9LW/YUGZJYWrb5nEg15Q
         tfShv9G/Pk92QqsgGlPl/pyrkFcXjzDMgtJ3+VJmvcTYUvklfhWBX5J9kxlgAdkPM3/C
         S8ZoAMJ115a91alNYV5BxAQinu0ATLqnbOit8PN476Y0vA2j9wdDZciThB1rNOzyQLHK
         2B8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=RAY/STklRhEtkmz763WFv7u+EqzwIWHqYI9xpqKJ8I0=;
        b=uZZNrl4wDtlZ7c7QrkIlHnrhIiSOdolMf4WejlmlNvL5g/A1FTj85lGKHF6LhcEOpY
         hN5h7mPT6IgYVS0p2NQc0WiHydwzAUcFKXx5sTWrZrZS2dftz6x+NOwTOZr1itkMiZVO
         VG11iNfjSHklGeNhSbXLc5CtC9i04mmg2O2GSXPjtrR9C8BJO4x9SAIyGL8esn6lcA9O
         qln7J4wMACaZowYVFypVLHS3iDMhXUgu032R4Y2mLBofqlRZQkRuNUZImtpIRpRKBI0J
         2fhpwP/NLbD861vn1TUsh8aCnPSLe1H0UlIpq8apd6ePK4ilxUbPZW++cCG3NROkzs9q
         Rt8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QIbvaWrK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si18094875ilv.15.2021.05.17.01.24.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 01:24:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QIbvaWrK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liYYU-0001bY-06
	for alex.bennee@linaro.org; Mon, 17 May 2021 04:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liYYL-0001ay-IY
 for qemu-arm@nongnu.org; Mon, 17 May 2021 04:24:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liYYI-0005nJ-Qb
 for qemu-arm@nongnu.org; Mon, 17 May 2021 04:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621239877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RAY/STklRhEtkmz763WFv7u+EqzwIWHqYI9xpqKJ8I0=;
 b=QIbvaWrKhgs1RxDaybAN+EDa5pBmNcrnFQ6Y8rpFhCSOVIPORxQwSuTD++Lz6askMacH26
 QLO0crnV2gnrJttz9q+KMCxucZKbfMMZaxuYnPcdMBCygvH2mnn4oLqGakKsvj6rPyrQfs
 NuPkHSOLomtGJvy1aQlB2HGxO4PBPpg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-ib3JcB0LPjatJZ5UOe6UUw-1; Mon, 17 May 2021 04:24:35 -0400
X-MC-Unique: ib3JcB0LPjatJZ5UOe6UUw-1
Received: by mail-ed1-f69.google.com with SMTP id
 r19-20020a05640251d3b02903888eb31cafso3488924edd.13
 for <qemu-arm@nongnu.org>; Mon, 17 May 2021 01:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RAY/STklRhEtkmz763WFv7u+EqzwIWHqYI9xpqKJ8I0=;
 b=dZ4N/dHged2R53ExCCX+E+el9qrW8dAGL+3quWu4AqrLr5joQiL1pFwrXtcGNdb/ET
 Hm8BWl5zNbVwHgpL3/opLr7s2gxH8gwx496ds8AwVM5zQMOex83ZA5B/hWv6qWzPR7hB
 /IP8b4m18tNy781ONp6lIL6s3joycoKs+FN6Aak2AnGmwTdpxIJbK4Dypl4ichRUHCPw
 C7EIlqwNsIqCOCx09F4Gnucs4vhKGa1rw9ym8l6KhlQZKYUOGZzRyf75i7r6FXZf2vcV
 83tSFVI2Zdxm4VSMVXxCwR8Djzh/rGa5okaitROkTVSWHYJmybOCPww50AoPAprsf7UI
 YNVA==
X-Gm-Message-State: AOAM532g+U9YmXT7rqv1p56yssWP64bKpmnO+g8FZC2LMM8tF9tf0Dmc
 w083iDxdZTY3t6aJquJHqvunnr/oVoHDUvnMKtFWxjpkI2Oi2g33PsOqoZBHXfHUVH71HzI5pal
 IqUf3Aj7RWs4V
X-Received: by 2002:a05:6402:40cb:: with SMTP id
 z11mr73175612edb.25.1621239874458; 
 Mon, 17 May 2021 01:24:34 -0700 (PDT)
X-Received: by 2002:a05:6402:40cb:: with SMTP id
 z11mr73175580edb.25.1621239874200; 
 Mon, 17 May 2021 01:24:34 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id n8sm8271648ejl.0.2021.05.17.01.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 01:24:33 -0700 (PDT)
Date: Mon, 17 May 2021 10:24:31 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 9/9] hw/arm/virt: Add separate -smp parsing
 function for ARM machines
Message-ID: <20210517082431.lz7zmtpcnezbmo6t@gator.home>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-10-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210516102900.28036-10-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gsgNmijGSxmF

On Sun, May 16, 2021 at 06:29:00PM +0800, Yanan Wang wrote:
> The cpu hierarchy topology information parsed out from QEMU -smp
> command line will be exposed to guest kernel through ACPI and DT
> since machine type 6.1, so we will expect more detailed topology
> descriptions and will be more strict with the -smp cmdlines when
> parsing them.
> 
> Compared with the default smp_parse() where all missing values
> are automatically calculated in turn, there is some difference
> in ARM specific virt_smp_parse(). The parsing logic is like:
> At least one of cpus or maxcpus must be provided. Threads will
> default to 1 if not provided (assume not support SMT). Sockets
> and cores must be either both provided or both not.
> 
> Note, if neither sockets nor cores are provided, we calculate
> all the missing values like smp_parse() did before, but will
> disable support of exposing these auto-populated descriptions
> to guest. Then guest will populate its topology by default.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c   | 95 +++++++++++++++++++++++++++++++++++++++++++++++++
>  qemu-options.hx |  4 +++
>  2 files changed, 99 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 50e324975f..44e990e3be 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -76,6 +76,8 @@
>  #include "hw/virtio/virtio-iommu.h"
>  #include "hw/char/pl011.h"
>  #include "qemu/guest-random.h"
> +#include "qapi/qmp/qerror.h"
> +#include "sysemu/replay.h"
>  
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -2627,6 +2629,98 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>      return fixed_ipa ? 0 : requested_pa_size;
>  }
>  
> +/*
> + * virt_smp_parse - Used to parse -smp command line for ARM machines.
> + *
> + * Compared with the default smp_parse where all the missing values
> + * are automatically calculated in turn, in this function, we expect
> + * more detailed topology information provided and are more strict
> + * with the -smp cmdlines when parsing them.
> + *
> + * We require that at least one of cpus or maxcpus must be provided.
> + * Threads will default to 1 if not provided. Sockets and cores must
> + * be either both provided or both not.
> + *
> + * Note, if neither sockets nor cores are specified, we will calculate
> + * all the missing values just like smp_parse() does, but will disable
> + * exposure of cpu topology descriptions to guest.
> + */
> +static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
> +{
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(ms);
> +
> +    if (opts) {
> +        unsigned cpus = qemu_opt_get_number(opts, "cpus", 0);
> +        unsigned maxcpus = qemu_opt_get_number(opts, "maxcpus", 0);
> +        unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
> +        unsigned cores = qemu_opt_get_number(opts, "cores", 0);
> +        unsigned threads = qemu_opt_get_number(opts, "threads", 0);
> +
> +        /* Default threads to 1 if not provided */
> +        threads = threads > 0 ? threads : 1;

Can't do this yet, need to do it later, because...

> +
> +        if (cpus == 0 && maxcpus == 0) {
> +            error_report("at least one of cpus or maxcpus must be provided");
> +            exit(1);
> +        }
> +
> +        if (sockets == 0 && cores == 0) {
> +            /* Disable exposure of topology descriptions to guest */
> +            vmc->no_cpu_topology = true;

...we should do ensure threads == 0 here, otherwise provide another error
message.

> +
> +            /* Compute missing values, prefer sockets over cores */
> +            cores = 1;

Now threads = 1 is good here.

> +            if (cpus == 0) {
> +                sockets = 1;
> +                cpus = sockets * cores * threads;

This should be

  cpus = maxcpus;
  sockets = cpus;

> +            } else {
> +                maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +                sockets = maxcpus / (cores * threads);

We know cores and threads should both be 1 here, so just do

 sockets = maxcpus;

> +            }
> +        } else if (sockets > 0 && cores > 0) {

Now 
        threads = threads > 0 ? threads : 1;

is good here.

> +            cpus = cpus > 0 ? cpus : sockets * cores * threads;
> +            maxcpus = maxcpus > 0 ? maxcpus : cpus;

We should calculate maxcpus first based on the topology,

  maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
  cpus = cpus > 0 ? cpus : maxcpus;

Please do comprehensive testing to ensure everything works as it
should. You can drop this function into a standalone executable
and run it for all possible inputs, maxcpus=0, maxcpus < cpus, maxcpus ==
cpus, maxcpus > cpus, sockets = 0, sockets < cpus, sockets == cpus, etc.

> +        } else {
> +            error_report("sockets and cores must be both provided "
> +                         "or both not");
> +            exit(1);
> +        }
> +
> +        if (maxcpus < cpus) {
> +            error_report("maxcpus must be equal to or greater than smp");
> +            exit(1);
> +        }
> +
> +        if (sockets * cores * threads < cpus) {
> +            error_report("cpu topology: "
> +                         "sockets (%u) * cores (%u) * threads (%u) < "
> +                         "smp_cpus (%u)",
> +                         sockets, cores, threads, cpus);
> +            exit(1);
> +        }
> +
> +        if (sockets * cores * threads != maxcpus) {
> +            error_report("cpu topology: "
> +                         "sockets (%u) * cores (%u) * threads (%u) "
> +                         "!= maxcpus (%u)",
> +                         sockets, cores, threads, maxcpus);
> +            exit(1);
> +        }
> +
> +        ms->smp.cpus = cpus;
> +        ms->smp.max_cpus = maxcpus;
> +        ms->smp.sockets = sockets;
> +        ms->smp.cores = cores;
> +        ms->smp.threads = threads;
> +    }
> +
> +    if (ms->smp.cpus > 1) {
> +        Error *blocker = NULL;
> +        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
> +        replay_add_blocker(blocker);
> +    }
> +}
> +
>  static void virt_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> @@ -2652,6 +2746,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
> +    mc->smp_parse = virt_smp_parse;
>      mc->kvm_type = virt_kvm_type;
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 635dc8a624..bd97086c21 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -203,6 +203,10 @@ SRST
>      computed. If any on the three values is given, the total number of
>      CPUs n can be omitted. maxcpus specifies the maximum number of
>      hotpluggable CPUs.
> +
> +    For the ARM target, at least one of cpus or maxcpus must be provided.
> +    Threads will default to 1 if not provided. Sockets and cores must be
> +    either both provided or both not.
>  ERST
>  
>  DEF("numa", HAS_ARG, QEMU_OPTION_numa,
> -- 
> 2.19.1
> 

