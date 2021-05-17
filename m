Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1081688lfm;
        Mon, 17 May 2021 02:07:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ1B/SrlJFt3IzfYmdbUmZa42gYlEtJ/hVmnrxCq9pJcaNVWBCyR7YDgC4rXvU9Ih5huvU
X-Received: by 2002:a0c:9e0f:: with SMTP id p15mr59409253qve.33.1621242449913;
        Mon, 17 May 2021 02:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621242449; cv=none;
        d=google.com; s=arc-20160816;
        b=i/hJW4TL4Mt3Dacf0R0Bh7FF68PFVPgV4mN8belxG7vzTzUaJLgXTTiMRXsP9xV5xB
         It2z2nPcihiX4HNAGd9bdk0ekwdvQU5xm3AK0dnHdA8q+3hZjcKODIDuKEDtq96gBBu7
         45Kew5kJNrM6OIUSsZxHHXGW2gjNtOg+AFmhG6e+0vgvQgci2V6hSCR9mv7G1qeiQyB/
         qtQkcHiOGLYMzHWG3dO5XYxKFaA1v0n4nkCjJjyhplceWmtQfhpiOIjj9b2trYD8w78z
         zPpXPLI6paeDD/+rhKbCW5Ot/cvg1IqDCUPDUvBlTMj1o0+Iu4QFRzY0flwxbmKukYIh
         GTcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=/AwbT1o8x4LK9y06yHXiYUlDQnftMDiKSuFN6QDyzb0=;
        b=Mm0hRsTArnqe0+r8XGAhbnrqRWcfhYLAdgakOFmUqZBv+DxWTP/wzKb4L+HjPXa2gH
         3THexEhNB3yG+NaIBuWGYYtuvckCcydefGDmbBaKKOLR9sY+oIgHsgjfSEEUrxG1rwsh
         97VQUV2kZwnOy8HNtjOx6fameP1kuLM57oOVRCHoDWTni/x3FawE0Bfy0tTrExp/Rh6y
         7kip02VViQ3Rofa8lAIlurwksG3s88cHWuAQauJkjFNBRwu95i8MPA69i+0ccf+xwwMb
         NBWiH8SW/h0RzhiXYARP3ljQae+v+FP7n3I+6ccZ8pUOmBaIF5j0jFa1mtl4msV8LbtH
         +B+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d8Aq8EL2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6si10560978qtx.312.2021.05.17.02.07.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 02:07:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d8Aq8EL2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liZDl-0006Gn-4r
	for alex.bennee@linaro.org; Mon, 17 May 2021 05:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liZDc-0006EP-AX
 for qemu-arm@nongnu.org; Mon, 17 May 2021 05:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liZDZ-0007m5-Ap
 for qemu-arm@nongnu.org; Mon, 17 May 2021 05:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621242436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/AwbT1o8x4LK9y06yHXiYUlDQnftMDiKSuFN6QDyzb0=;
 b=d8Aq8EL2IZnwyoCKYC4QQItEZgyi4PztG5kGH1dqQcIYWZqNw/bo9xIAv0C6Ux7zG9L1hf
 PpUdIJ4gQX70V5Kxj3v1ffCfvi4VyQ/53jEktgQWpyg4VS/7YS5fMVCKk6qFkc+jagBoO7
 vqO8zqzz1ptvNph5qaumhzZvimBsgg0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-Is2bod43OCaxFJZAZOUEqA-1; Mon, 17 May 2021 05:07:12 -0400
X-MC-Unique: Is2bod43OCaxFJZAZOUEqA-1
Received: by mail-ej1-f70.google.com with SMTP id
 h18-20020a1709063992b02903d59b32b039so589982eje.12
 for <qemu-arm@nongnu.org>; Mon, 17 May 2021 02:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/AwbT1o8x4LK9y06yHXiYUlDQnftMDiKSuFN6QDyzb0=;
 b=nrjiStWdeYD0U6tFYqM7XkrOLA5fu39VybOu6SESRhIjx/zsQlYchwul6F8uu23s/w
 zqAR5J+5sscTHuN9w56JAK+ddwM4bFXd11Wsd8769spfoKxTrtoJuKaamBkrd4FecCcE
 yw7ai16ptxjGffbY09UZGlN5VR21xEs1uoa3LtCg6UPXbm0VKYcbvd/Ay85Pi79+K6O/
 Y1M2u7BediUjG/gUi1Y9ZMsAK8Lcoydl60+j+y4CNQB6lPn1GIDfCMc4Tdd53aLyXVAV
 M8gPKQ5ERtSUtaLZE39gibIVtUTABgsx+R90QTkjgIFwOeUGIVHE5uLgcSOFkTDSgAnR
 XjfA==
X-Gm-Message-State: AOAM53029daQqJumNw3mScLPGYNGD0ckvAQpEm0J2+w9UEpBIbHhgAkO
 n+wHRUXD8xS8peyCj0zraNwWNfkreujtOyjR+hmVK9WEaPEEq3tBwsZJJC5F8uwE3wpvePQDzGQ
 384BmGnm//OpT
X-Received: by 2002:aa7:c0c4:: with SMTP id j4mr11493273edp.168.1621242431704; 
 Mon, 17 May 2021 02:07:11 -0700 (PDT)
X-Received: by 2002:aa7:c0c4:: with SMTP id j4mr11493228edp.168.1621242431410; 
 Mon, 17 May 2021 02:07:11 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id p14sm6934045ejz.51.2021.05.17.02.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 02:07:11 -0700 (PDT)
Date: Mon, 17 May 2021 11:07:09 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 1/4] vl.c: Add -smp, clusters=* command line
 support for ARM cpu
Message-ID: <20210517090709.u5fjdmarrpeb345y@gator.home>
References: <20210516103228.37792-1-wangyanan55@huawei.com>
 <20210516103228.37792-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210516103228.37792-2-wangyanan55@huawei.com>
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
X-TUID: LcGgL4trpkWP

On Sun, May 16, 2021 at 06:32:25PM +0800, Yanan Wang wrote:
> In implementations of ARM architecture, at most there could be a
> cpu hierarchy like "sockets/dies/clusters/cores/threads" defined.
> For example, ARM64 server chip Kunpeng 920 totally has 2 sockets,
> 2 NUMA nodes (also means cpu dies) in each socket, 6 clusters in
> each NUMA node, 4 cores in each cluster, and doesn't support SMT.
> Clusters within the same NUMA share a L3 cache and cores within
> the same cluster share a L2 cache.
> 
> The cache affinity of ARM cluster has been proved to improve the
> kernel scheduling performance and a patchset has been posted, in
> which a general sched_domain for clusters was added and a cluster
> level was added in the arch-neutral cpu topology struct like below.
> 
> struct cpu_topology {
>     int thread_id;
>     int core_id;
>     int cluster_id;
>     int package_id;
>     int llc_id;
>     cpumask_t thread_sibling;
>     cpumask_t core_sibling;
>     cpumask_t cluster_sibling;
>     cpumask_t llc_sibling;
> }
> 
> In virtuallization, exposing the cluster level topology to guest
> kernel may also improve the scheduling performance. So let's add
> the -smp, clusters=* command line support for ARM cpu, then users
> will be able to define a four-level cpu hierarchy for machines
> and it will be sockets/clusters/cores/threads.
> 
> Because we only support clusters for ARM cpu currently, a new member
> "smp_clusters" is only added to the VirtMachineState structure.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  include/hw/arm/virt.h |  1 +
>  qemu-options.hx       | 26 +++++++++++++++-----------
>  softmmu/vl.c          |  3 +++
>  3 files changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index f546dd2023..74fff9667b 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -156,6 +156,7 @@ struct VirtMachineState {
>      char *pciehb_nodename;
>      const int *irqmap;
>      int fdt_size;
> +    unsigned smp_clusters;
>      uint32_t clock_phandle;
>      uint32_t gic_phandle;
>      uint32_t msi_phandle;
> diff --git a/qemu-options.hx b/qemu-options.hx
> index bd97086c21..245eb415a6 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -184,25 +184,29 @@ SRST
>  ERST
>  
>  DEF("smp", HAS_ARG, QEMU_OPTION_smp,
> -    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"
> +    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,clusters=clusters][,dies=dies][,sockets=sockets]\n"
>      "                set the number of CPUs to 'n' [default=1]\n"
>      "                maxcpus= maximum number of total cpus, including\n"
>      "                offline CPUs for hotplug, etc\n"
> -    "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
> +    "                cores= number of CPU cores on one socket\n"
> +    "                (it's on one die for PC, and on one cluster for ARM)\n"
>      "                threads= number of threads on one CPU core\n"
> +    "                clusters= number of CPU clusters on one socket (for ARM only)\n"
>      "                dies= number of CPU dies on one socket (for PC only)\n"
>      "                sockets= number of discrete sockets in the system\n",
>          QEMU_ARCH_ALL)
>  SRST
> -``-smp [cpus=]n[,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]``
> -    Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
> -    are supported. On Sparc32 target, Linux limits the number of usable
> -    CPUs to 4. For the PC target, the number of cores per die, the
> -    number of threads per cores, the number of dies per packages and the
> -    total number of sockets can be specified. Missing values will be
> -    computed. If any on the three values is given, the total number of
> -    CPUs n can be omitted. maxcpus specifies the maximum number of
> -    hotpluggable CPUs.
> +``-smp [cpus=]n[,cores=cores][,threads=threads][,clusters=clusters][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]``
> +    Simulate an SMP system with n CPUs. On the PC target, up to 255
> +    CPUs are supported. On the Sparc32 target, Linux limits the number
> +    of usable CPUs to 4. For the PC target, the number of threads per
> +    core, the number of cores per die, the number of dies per package
> +    and the total number of sockets can be specified. For the ARM target,
> +    the number of threads per core, the number of cores per cluster, the
> +    number of clusters per socket and the total number of sockets can be
> +    specified. And missing values will be computed. If any of the five
                  ^ Why did you add this 'And'?
> +    values is given, the total number of CPUs n can be omitted.

The last two sentences are not valid for Arm, which requires most of its
parameters to be given.

> Maxcpus
> +    specifies the maximum number of hotpluggable CPUs.
>  
>      For the ARM target, at least one of cpus or maxcpus must be provided.
>      Threads will default to 1 if not provided. Sockets and cores must be
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 307944aef3..69a5c73ef7 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -719,6 +719,9 @@ static QemuOptsList qemu_smp_opts = {
>          }, {
>              .name = "dies",
>              .type = QEMU_OPT_NUMBER,
> +        }, {
> +            .name = "clusters",
> +            .type = QEMU_OPT_NUMBER,
>          }, {
>              .name = "cores",
>              .type = QEMU_OPT_NUMBER,
> -- 
> 2.19.1
>

Thanks,
drew

