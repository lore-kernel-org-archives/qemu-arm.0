Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp955471lfb;
        Wed, 30 Mar 2022 06:40:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlnso/89vCQi97JAQLLWHhGxiNIxRdT811kyMv2Ue/M/K8TU8MESGwkwtIeqnW80oklKA2
X-Received: by 2002:a05:622a:1c7:b0:2e1:ed8b:7180 with SMTP id t7-20020a05622a01c700b002e1ed8b7180mr32431302qtw.305.1648647652463;
        Wed, 30 Mar 2022 06:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648647652; cv=none;
        d=google.com; s=arc-20160816;
        b=hExA0kBVUtTIa3bs4aeeyoqRe6R11qkpI9rRFdqJ02Qw/JswaZr6rphN4kiekLXtGm
         rckba5HLMm4m46FZWRjK9CQ/pMs2nIAyQlePR4KJrBujM/9LJGVIlusGrv0JtKWIxlGo
         TYOWimf/2HKLBpAFlFUueeZ/A38Jq9d4kdsco+zTziydhA1ve+AppOmNi82Y1p2J967z
         +cl6OpDStTmj9nII8Pw1L/9tobxSmpVrV2IiBmFWD5C2xtpDa4LOQIW8ulz/LP9MoTFP
         nvCkE8wM8H32oF0LHU/KcG4cckfm4NWRHHNmAepkopv1KBVqz1efFa89E328IGlHI/CR
         1gTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=2H0wXRYGcGQ5YQxaZ9slxAvUc3QH95pa8E2l1hYYsKQ=;
        b=k03LziAFllvYH0jAYy2s3Rja8nBPKe4uE8fTZfYxYeqh/lPqKrvNIqNPy/7mt6pgBI
         K3vdkKPhA1JBRxsbGcixjQ3nf7XGzgThp5ZEkumY4d3VTS/a8y5BNDgWLGQUJyotWx2e
         3xI3Hx+RG7ezCafLKAHcBpZobcqusHWEgDLkYgqdi78rswbks3p9rXd4cz4ZzzcS8VVq
         pwGYyCA6cYSruppy2YjKm0x1VrEsgTa3GishYdl/7k6gfItp+awH4WBrEkaU2myUjf5u
         72nG+69m6yIysF1Ull6nJkkb/wq1yiW4jwKc5RFnjnY/kmi+2ZD9EojkF18LJyMYLsHL
         ytjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MjV7XuoL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w127-20020a379485000000b0067e4be23a1fsi10346074qkd.612.2022.03.30.06.40.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Mar 2022 06:40:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MjV7XuoL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZYZ9-0008A9-VX
	for alex.bennee@linaro.org; Wed, 30 Mar 2022 09:40:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZYDo-0006TA-H4
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 09:18:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZYDk-0000Al-3K
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 09:18:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648646319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2H0wXRYGcGQ5YQxaZ9slxAvUc3QH95pa8E2l1hYYsKQ=;
 b=MjV7XuoLT8P42LmniFpTAjWb7JKvaCcDcg/JS9WsN07e0c98NKhZtIRGUHtkpuK4CASZRY
 LodQ1Zn2kVzx4HG0P6hBPEdGmLXh7VcMUXCZ7O48tDT0zywBBNG/CNkB8dRUqQQDXLVdY9
 ANMlYp7GxklJwChPA8GYhRn2MQjvsQU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-PSMG59dvOHauNEKtCXJ2Aw-1; Wed, 30 Mar 2022 09:18:38 -0400
X-MC-Unique: PSMG59dvOHauNEKtCXJ2Aw-1
Received: by mail-ed1-f69.google.com with SMTP id
 n4-20020a5099c4000000b00418ed58d92fso12960364edb.0
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 06:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2H0wXRYGcGQ5YQxaZ9slxAvUc3QH95pa8E2l1hYYsKQ=;
 b=2ZUtRVKWaAVfTwm/dNPj6xvrJIwPQ5g8IpC/EP0KM0K9LgPel8Bs45GOkOrAuGS6d5
 jnQi7xmSHF2VqTRIGaBEk6xtmijl469YWOc9WQ1AHAHekLzePagPyx3bmZyiia/wuP/w
 od0O84Uc1lS5YKvvBt164je4YgUhwGep+OgrYHKJOIWzcTwNqH58RmYA8vTA27mnFdmF
 o3y9aAMZlPOPCj4h/fw7AvOCJB886CRHsjcMcvA6Is9ZMV/7jY8+kyZfJI/0kSoh668y
 dAxIHAB5tsWQjZDlQHRIHiSdDFpcHuZXjqgFYpLCAVe6fgdQj9ZmseW3VGm6o004t/B+
 DS4A==
X-Gm-Message-State: AOAM5316O3z+gDTShEI+V4sLqVEZv86QqOzMCuOhF5xjhYE1HhFtD8Bl
 kOKwh9Vwcfs9HMJEkRKV6TMQr9DY9AuRRimmwwBw/yM22sE5RKzQEro74ab2gqRbAb5Hu1vtDd6
 gRy5VTt1vM3uiQq4=
X-Received: by 2002:a17:907:6ea4:b0:6e1:260e:a232 with SMTP id
 sh36-20020a1709076ea400b006e1260ea232mr14235932ejc.15.1648646315799; 
 Wed, 30 Mar 2022 06:18:35 -0700 (PDT)
X-Received: by 2002:a17:907:6ea4:b0:6e1:260e:a232 with SMTP id
 sh36-20020a1709076ea400b006e1260ea232mr14235767ejc.15.1648646314020; 
 Wed, 30 Mar 2022 06:18:34 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a17090677cc00b006df85d9a924sm8312272ejn.217.2022.03.30.06.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 06:18:33 -0700 (PDT)
Date: Wed, 30 Mar 2022 15:18:32 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 1/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
Message-ID: <20220330151832.3da04abf@redhat.com>
In-Reply-To: <20220323072438.71815-2-gshan@redhat.com>
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-2-gshan@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qzUCtrREc+jD

On Wed, 23 Mar 2022 15:24:35 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Currently, the SMP configuration isn't considered when the CPU
> topology is populated. In this case, it's impossible to provide
> the default CPU-to-NUMA mapping or association based on the socket
> ID of the given CPU.
> 
> This takes account of SMP configuration when the CPU topology
> is populated. The die ID for the given CPU isn't assigned since
> it's not supported on arm/virt machine yet. Besides, the cluster
> ID for the given CPU is assigned because it has been supported
> on arm/virt machine.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c     | 11 +++++++++++
>  qapi/machine.json |  6 ++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d2e5ecd234..064eac42f7 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>      int n;
>      unsigned int max_cpus = ms->smp.max_cpus;
>      VirtMachineState *vms = VIRT_MACHINE(ms);
> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>  
>      if (ms->possible_cpus) {
>          assert(ms->possible_cpus->len == max_cpus);
> @@ -2518,6 +2519,16 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>          ms->possible_cpus->cpus[n].type = ms->cpu_type;
>          ms->possible_cpus->cpus[n].arch_id =
>              virt_cpu_mp_affinity(vms, n);
> +
> +        assert(!mc->smp_props.dies_supported);
> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
> +        ms->possible_cpus->cpus[n].props.socket_id =
> +            n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
> +        ms->possible_cpus->cpus[n].props.cluster_id =
> +            n / (ms->smp.cores * ms->smp.threads);
> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
> +        ms->possible_cpus->cpus[n].props.core_id = n / ms->smp.threads;
>          ms->possible_cpus->cpus[n].props.has_thread_id = true;
>          ms->possible_cpus->cpus[n].props.thread_id = n;

shouldn't be above values calculated similar to the way they are 
calculated in x86_topo_ids_from_idx()? /note '% foo' part/

>      }
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 42fc68403d..99c945f258 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -868,10 +868,11 @@
>  # @node-id: NUMA node ID the CPU belongs to
>  # @socket-id: socket number within node/board the CPU belongs to
>  # @die-id: die number within socket the CPU belongs to (since 4.1)
> -# @core-id: core number within die the CPU belongs to
> +# @cluster-id: cluster number within die the CPU belongs to
> +# @core-id: core number within cluster the CPU belongs to
>  # @thread-id: thread number within core the CPU belongs to
>  #
> -# Note: currently there are 5 properties that could be present
> +# Note: currently there are 6 properties that could be present
>  #       but management should be prepared to pass through other
>  #       properties with device_add command to allow for future
>  #       interface extension. This also requires the filed names to be kept in
> @@ -883,6 +884,7 @@
>    'data': { '*node-id': 'int',
>              '*socket-id': 'int',
>              '*die-id': 'int',
> +            '*cluster-id': 'int',
>              '*core-id': 'int',
>              '*thread-id': 'int'
>    }

