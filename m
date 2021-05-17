Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1085610lfm;
        Mon, 17 May 2021 02:13:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz7X7j7FUod3Q+EEjHsnU2jlduc1uQ5HHZpo+sIRkqSFDh4GgR1ZPz72HRGMYbzMRupYFe
X-Received: by 2002:a37:e216:: with SMTP id g22mr8838111qki.254.1621242799935;
        Mon, 17 May 2021 02:13:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621242799; cv=none;
        d=google.com; s=arc-20160816;
        b=cmwUnif6fYj5wBQzFtlR0dZP6ynRk+YXVfPIM37dRwiMuRMfakmChIbjLwxLN1uEZw
         q0+Zi7kN3+8bvd1Q2MOFRq/NeJOCVtPiWorSWrJLziRlfduQUoKFcaX8Nk2XBS63AQIq
         2KuAbteFZjaIBaSoZET9F6v0G5TFCm0voP5atb6deqr2iQk+Rq7dplol6naecKuOAFKi
         fgOWrzCxt3ElFPe4vNwLw6FOWT3iEBhkDEl17M7vsO99IR8ZFRV7p+Dv5Vfha/zrUPl8
         MMWH1W/cFjXkENTWDWj+bUa9sw2bYpkkef65VaHkLYoXfLQguAnr9o2FULDPY+ZiMLIh
         Afdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=F8MjbIydaLqn6zbj1dVRThKUPv6asqcIFlg6xdXtG0g=;
        b=dUV0pnLrNvSo4Jmk85dot6RMcdesWaNf7N5dUYMNS7dRJDaFqcqV6Q16VRqWgKyPTq
         /FI8uIbIa/ziKVd2VwjNd8sBEPohPUHYAczbAqeTbJirTC+d/E7gia+l/lqJsyndElXB
         Z5uuq69ZY059bTqmCI0XVeIrPvQdcgcjAslESMsptv1iisp4MReyvPrra42YlfaXUi76
         +MpZYS6MUGJFSoH+BMgjww/rCdC7hraf99CkGMc5QJ/+agjPKvtCRPnglveP1uqE4cJa
         iMZrIICmkKOd6122WDbjogT2Us0YHqgxB/yWtQg8ME4xUKcbN0LStAn8CZZxl+PqKX2u
         4Dxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M6CKqA89;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15si10854864qti.203.2021.05.17.02.13.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 02:13:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M6CKqA89;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liZJP-0000zR-8a
	for alex.bennee@linaro.org; Mon, 17 May 2021 05:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liZJD-0000y5-Iu
 for qemu-arm@nongnu.org; Mon, 17 May 2021 05:13:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liZJB-0002gV-Ub
 for qemu-arm@nongnu.org; Mon, 17 May 2021 05:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621242785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F8MjbIydaLqn6zbj1dVRThKUPv6asqcIFlg6xdXtG0g=;
 b=M6CKqA89GeHWsNlzcyGoHsI132kLbdO58aBdhnkk0OBDx6IxTkwtJVbSxLICMEkjKxOOUQ
 ggYPqhZoE73oqBIgctsLThQsnooozXqTqGJfYMOInZqZ0T0P4bld7jrXTX5W9eEpv9ObMz
 GHswVeOFRe1P442PEPr5rs+OcdLZ9iI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-v0siKAFVMfSM0TOXB2u4bQ-1; Mon, 17 May 2021 05:13:01 -0400
X-MC-Unique: v0siKAFVMfSM0TOXB2u4bQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 cn20-20020a0564020cb4b029038d0b0e183fso3535905edb.22
 for <qemu-arm@nongnu.org>; Mon, 17 May 2021 02:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F8MjbIydaLqn6zbj1dVRThKUPv6asqcIFlg6xdXtG0g=;
 b=kspw+eDg55a8AV03ELQfafW7XbUZyPv3X2cWIxn0FmaQjidEetERu8Qeb6er13VDuu
 NyG4fVXivJAUvRSSBdIu0N55eDu3Ru2B1F4rNHaq74YTEYtw1aydOL7/z1jP436+PJ9k
 VhHlgXMyCnfjaMozCvSoQ4QZbmoWaLs6V15umYDEZ+9T/1RXMrMGRZQs9j+fi61+d43H
 2xtXnW5ZcxRjAHbtqW/punQ3mmgVCyZJ7tTVTryL9+UVhBKh8JBm4V5wyWf903wv+XKk
 iZDETNWT55N29fy0yWrwPQALIOzUpjMCbsbY9SW1FwzHTWD4AfErljbd3OcZyTSZF7p7
 sQpw==
X-Gm-Message-State: AOAM530298bY+8ieXbSaXD+IjdlqTyuSRSmmKzAyDkzRz6+PJBp3/4QT
 jGb4+kfwFyBAbM8hmUo0PoCCBM6tsAduFQ0VAPmkBw08Rff8fYNY8+oB7z1q5CsRfIIDBjk0IWb
 hqW4lpbatz7x/
X-Received: by 2002:a17:906:938a:: with SMTP id
 l10mr4305301ejx.540.1621242780005; 
 Mon, 17 May 2021 02:13:00 -0700 (PDT)
X-Received: by 2002:a17:906:938a:: with SMTP id
 l10mr4305267ejx.540.1621242779660; 
 Mon, 17 May 2021 02:12:59 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id c22sm10554531edy.59.2021.05.17.02.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 02:12:59 -0700 (PDT)
Date: Mon, 17 May 2021 11:12:57 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 4/4] hw/arm/virt: Parse -smp cluster parameter in
 virt_smp_parse
Message-ID: <20210517091257.wavp74sn37fh3nxf@gator.home>
References: <20210516103228.37792-1-wangyanan55@huawei.com>
 <20210516103228.37792-5-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210516103228.37792-5-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 prime.zeng@hisilicon.com, Paolo Bonzini <pbonzini@redhat.com>,
 yuzenghui@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eUyWYChZ2zQS

On Sun, May 16, 2021 at 06:32:28PM +0800, Yanan Wang wrote:
> There is a separate function virt_smp_parse() in hw/virt/arm.c used
> to parse cpu topology for the ARM machines. So add parsing of -smp
> cluster parameter in it, then total number of logical cpus will be
> calculated like: max_cpus = sockets * clusters * cores * threads.
> 
> Note, we will assume multi-cluster in one socket is not supported
> and default the value of clusters to 1, if it's not explicitly
> specified in -smp cmdline.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7de822e491..678d5ef36c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2642,8 +2642,8 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>   * with the -smp cmdlines when parsing them.
>   *
>   * We require that at least one of cpus or maxcpus must be provided.
> - * Threads will default to 1 if not provided. Sockets and cores must
> - * be either both provided or both not.
> + * Clusters and threads will default to 1 if they are not provided.
> + * Sockets and cores must be either both provided or both not.
>   *
>   * Note, if neither sockets nor cores are specified, we will calculate
>   * all the missing values just like smp_parse() does, but will disable
> @@ -2652,15 +2652,18 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>  static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
>  {
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(ms);
> +    VirtMachineState *vms = VIRT_MACHINE(ms);
>  
>      if (opts) {
>          unsigned cpus = qemu_opt_get_number(opts, "cpus", 0);
>          unsigned maxcpus = qemu_opt_get_number(opts, "maxcpus", 0);
>          unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
> +        unsigned clusters = qemu_opt_get_number(opts, "clusters", 0);
>          unsigned cores = qemu_opt_get_number(opts, "cores", 0);
>          unsigned threads = qemu_opt_get_number(opts, "threads", 0);
>  
> -        /* Default threads to 1 if not provided */
> +        /* Default clusters and threads to 1 if not provided */
> +        clusters = clusters > 0 ? clusters : 1;
>          threads = threads > 0 ? threads : 1;
>  
>          if (cpus == 0 && maxcpus == 0) {
> @@ -2676,13 +2679,13 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
>              cores = 1;
>              if (cpus == 0) {
>                  sockets = 1;
> -                cpus = sockets * cores * threads;
> +                cpus = sockets * clusters * cores * threads;
>              } else {
>                  maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -                sockets = maxcpus / (cores * threads);
> +                sockets = maxcpus / (clusters * cores * threads);
>              }
>          } else if (sockets > 0 && cores > 0) {
> -            cpus = cpus > 0 ? cpus : sockets * cores * threads;
> +            cpus = cpus > 0 ? cpus : sockets * clusters * cores * threads;
>              maxcpus = maxcpus > 0 ? maxcpus : cpus;
>          } else {
>              error_report("sockets and cores must be both provided "
> @@ -2695,25 +2698,26 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
>              exit(1);
>          }
>  
> -        if (sockets * cores * threads < cpus) {
> +        if (sockets * clusters * cores * threads < cpus) {
>              error_report("cpu topology: "
> -                         "sockets (%u) * cores (%u) * threads (%u) < "
> -                         "smp_cpus (%u)",
> -                         sockets, cores, threads, cpus);
> +                         "sockets (%u) * clusters (%u) * cores (%u) * "
> +                         "threads (%u) < smp_cpus (%u)",
> +                         sockets, clusters, cores, threads, cpus);
>              exit(1);
>          }
>  
> -        if (sockets * cores * threads != maxcpus) {
> +        if (sockets * clusters * cores * threads != maxcpus) {
>              error_report("cpu topology: "
> -                         "sockets (%u) * cores (%u) * threads (%u) "
> -                         "!= maxcpus (%u)",
> -                         sockets, cores, threads, maxcpus);
> +                         "sockets (%u) * clusters (%u) * cores (%u) * "
> +                         "threads (%u) != maxcpus (%u)",
> +                         sockets, clusters, cores, threads, maxcpus);
>              exit(1);
>          }
>  
>          ms->smp.cpus = cpus;
>          ms->smp.max_cpus = maxcpus;
>          ms->smp.sockets = sockets;
> +        vms->smp_clusters = clusters;
>          ms->smp.cores = cores;
>          ms->smp.threads = threads;
>      }
> -- 
> 2.19.1
>

After reworking "[RFC PATCH v3 9/9] hw/arm/virt: Add separate -smp parsing
function for ARM machines", this should also be reworked and fully tested,
possibly using a standalone test, as as I suggested in the other review.

Thanks,
drew

