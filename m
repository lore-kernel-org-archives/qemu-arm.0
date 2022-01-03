Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp10233831lfb;
        Mon, 3 Jan 2022 03:27:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqNHfMFIv4PF+3TtMTHnkWkNCHK68DSdwHKr2E3EOEqZ63Qul6dKAm5RcIz7MtR2SVVZwj
X-Received: by 2002:a25:e601:: with SMTP id d1mr42534478ybh.645.1641209224457;
        Mon, 03 Jan 2022 03:27:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641209224; cv=none;
        d=google.com; s=arc-20160816;
        b=KJxVZP+XGk9mpYshMlAS14nGMCYsYUNMeq4kZlF/ghnY3Cp/VLTsyS8PtZ9X3Cr4VT
         THpu+4cSyFMFcYyQcXw+AlEW1ycawb47vcul9VB1UVe5j/EA2kMB0XRnYrcJoWrO1r49
         UXMx6jGoJhW+sG72uzFyBsRZk6xACHsSEfKrKagf809kyguGJKXbTYKkueRuLU6xFTwl
         Eq2i1/ERkGOMkNBAgx3YeN2C7+cVToVpkFhmGeeO0wFNizI7/gaPKsWzbYO0q+xNFhQT
         n00jOuO9hwEs8KjNKRjq+9yN69sTYstoePxTTK+2nOLgFaDaHskXmrTMKlfMuupOcBiR
         slxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=rhbKdI2L+n64FvniTwVs30EHeKvUt3sJZ/iH19/8KUs=;
        b=XdWNmssOgAUgarmEt3d0TmYM4oBXpQmbagTLGi2aF+NnHyNKpaHrWNz+1++k4TcZnT
         +iNXOCb+Itm5tsqwEtGD+esxwPM5tEqKgaeW6IosZ1LZggk/Uh4OL98oAM6qtzO9dgM6
         c74QkAckaJzjFH8DsP4pdFUL6wCnLidBRk2/KGvvQP19480uj2ckz1OmKjdtJqf0IQqT
         2xDF5yOsRxkXJtedSfPo9dgbf9IQ8Mue08nXtEQPJ17cRmc8AJFucplNYkHbfK+6YGt7
         CjnMzT6kBdpdnAQIXNKuSJn9y1JICKYXQ4IxkOhKnz7I9gOWHMo+/v+wTpl2h0R0XzOa
         A3Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PVq9ibc+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si1001624ybi.695.2022.01.03.03.27.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jan 2022 03:27:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PVq9ibc+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n4LUV-0005sk-Rq
	for alex.bennee@linaro.org; Mon, 03 Jan 2022 06:27:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4LSu-0005Jz-Ef
 for qemu-arm@nongnu.org; Mon, 03 Jan 2022 06:25:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4LSi-0001nL-Px
 for qemu-arm@nongnu.org; Mon, 03 Jan 2022 06:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641209101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rhbKdI2L+n64FvniTwVs30EHeKvUt3sJZ/iH19/8KUs=;
 b=PVq9ibc+5qAyf/khDPgG7pDTBA1RIwp1nr1EGcdnOoklBicoM5HQiWewmAyf35f68BZeMV
 xZHBSqGeowA/mA6Ur0Jk1dVerziXf5FR7Uz5tNZ97rsW4N7t0JKO3Jm2lTae5WsQNyBUZJ
 LWFb9qhwK08RG85H4+zQctcUpCQKjqA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-Pl0pMrr5NtuRmoL_d0DbVQ-1; Mon, 03 Jan 2022 06:25:00 -0500
X-MC-Unique: Pl0pMrr5NtuRmoL_d0DbVQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 ch27-20020a0564021bdb00b003f8389236f8so22441281edb.19
 for <qemu-arm@nongnu.org>; Mon, 03 Jan 2022 03:25:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rhbKdI2L+n64FvniTwVs30EHeKvUt3sJZ/iH19/8KUs=;
 b=AfdyhkzLWOmgSI/CEUqfkJ1tEF5N6Dz07bUv4yj3UnHvwdt1a/XXTQ0bzm1XhuePfo
 y90eFK3/KQ++H+3OZrkPKC27Vt7C0lPmwS5KB9acx/+rH1gu0SEmDJKBGxw6JMa+a024
 7jJu4Bxbrf4GyZe+FWDTFnHmSw+P+dsvzfOcy5CUu2alyJvdgeRUpi4BAyxmUApzc9Pc
 LzMrJs6dfqeqVgUEWglQDRYKmNzH64dU75WJtAQzH7bzjsvqdjQhlkGv/qczrIzmfxM6
 Xx5PjfkTaJP9Ffsvay3u0c1FT7htbi26UHi/6qLOYpNSFbjgA6YLBtZkS0oiOCvdb49L
 Al4w==
X-Gm-Message-State: AOAM533QKh/wb4VIQfIbH3xfc9neMSC2rrxuyvB3boOnmxH5Taf8qlwy
 agLgnuTALFFUFUu6WKQKrPtGpRfia9JCrpt2qcA8BDIw7uJbFvtjS2r14jrRqobUMFud9mua1C4
 ViKZeQN2HfivF
X-Received: by 2002:aa7:d6d6:: with SMTP id x22mr44544466edr.132.1641209099564; 
 Mon, 03 Jan 2022 03:24:59 -0800 (PST)
X-Received: by 2002:aa7:d6d6:: with SMTP id x22mr44544454edr.132.1641209099415; 
 Mon, 03 Jan 2022 03:24:59 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id e4sm10832046ejs.13.2022.01.03.03.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 03:24:59 -0800 (PST)
Date: Mon, 3 Jan 2022 12:24:57 +0100
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 1/7] hw/arm/virt: Support CPU cluster on ARM virt
 machine
Message-ID: <20220103112457.56iglr2wbcrbws2y@gator>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220103084636.2496-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Eric Auger <eauger@redhat.com>, wanghaibin.wang@huawei.com,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: chs3fw8en6sH

On Mon, Jan 03, 2022 at 04:46:30PM +0800, Yanan Wang wrote:
> ARM64 machines like Kunpeng Family Server Chips have a level
> of hardware topology in which a group of CPU cores share L3
> cache tag or L2 cache. For example, Kunpeng 920 typically
> has 6 or 8 clusters in each NUMA node (also represent range
> of CPU die), and each cluster has 4 CPU cores. All clusters
> share L3 cache data, but CPU cores in each cluster share a
> local L3 tag.
> 
> Running a guest kernel with Cluster-Aware Scheduling on the
> Hosts which have physical clusters, if we can design a vCPU
> topology with cluster level for guest kernel and then have
> a dedicated vCPU pinning, the guest will gain scheduling
> performance improvement from cache affinity of CPU cluster.
> 
> So let's enable the support for this new parameter on ARM
> virt machines. After this patch, we can define a 4-level
> CPU hierarchy like: cpus=*,maxcpus=*,sockets=*,clusters=*,
> cores=*,threads=*.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c   |  1 +
>  qemu-options.hx | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 6bce595aba..f413e146d9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2700,6 +2700,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      hc->unplug_request = virt_machine_device_unplug_request_cb;
>      hc->unplug = virt_machine_device_unplug_cb;
>      mc->nvdimm_supported = true;
> +    mc->smp_props.clusters_supported = true;
>      mc->auto_enable_numa_with_memhp = true;
>      mc->auto_enable_numa_with_memdev = true;
>      mc->default_ram_id = "mach-virt.ram";
> diff --git a/qemu-options.hx b/qemu-options.hx
> index fd1f8135fb..69ef1cdb85 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -277,6 +277,16 @@ SRST
>  
>          -smp 16,sockets=2,dies=2,cores=2,threads=2,maxcpus=16
>  
> +    The following sub-option defines a CPU topology hierarchy (2 sockets
> +    totally on the machine, 2 clusters per socket, 2 cores per cluster,
> +    2 threads per core) for ARM virt machines which support sockets/clusters
> +    /cores/threads. Some members of the option can be omitted but their values
> +    will be automatically computed:
> +
> +    ::
> +
> +        -smp 16,sockets=2,clusters=2,cores=2,threads=2,maxcpus=16
> +
>      Historically preference was given to the coarsest topology parameters
>      when computing missing values (ie sockets preferred over cores, which
>      were preferred over threads), however, this behaviour is considered
> -- 
> 2.27.0
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

