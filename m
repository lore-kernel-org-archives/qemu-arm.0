Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp4083398lfb;
        Fri, 25 Mar 2022 06:26:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwe+TJRLfovwoIE4BR9uQD+qSUD10w4eLZzunWVYGZn9+VUvfAEN9JhMSmG22oWFGjtpUVK
X-Received: by 2002:a05:622a:18a4:b0:2e1:e7a5:98ba with SMTP id v36-20020a05622a18a400b002e1e7a598bamr9270979qtc.424.1648214760669;
        Fri, 25 Mar 2022 06:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648214760; cv=none;
        d=google.com; s=arc-20160816;
        b=dYl7ibBTCUuiSKrhM2nO8oVlin49+3osOEg936SWdlwgB2PFRTFGms3ea/3HIZd38r
         DNg4bxwveySYETqbfAG2QCmvwiZDYODmnn0cPRYzULM3riN8/7rlR5MJZcDqfQSR/C4H
         TEleeH70FGGJDafUbUtwDX1Osq0F4uEEOAd7627g1bUU6njF+sQ1yIXsOcHgL5yYtJJG
         c5boLXZkv7BCjhEWGhUdM0qXYU9kERt648fMCkzGPLtf6MSF4IIGhzkZn9viFIdmwUEX
         KFtphlDB1+w9DG0/VUqpxP/CHwzbBvtbzDZOANtUAD4wOikEB+qWphTY1Yj8XvR2HrHc
         GE1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=GfKBGOEQBA2Txhn6QZ/ZHqP0pM/ldEA4/cud1eQo11I=;
        b=BBzSLkqbOjM1VJKo7Hehtv7U29zlM/w6av9Bem9fgzfl3jqXDGtwJTiLfUJddPQCoP
         7dM9sRxvo64GMb1rFuc5CWu0MCDF5WFO4RmJ9lM0VzLphjY0VL/Thh9how4XRiC2a+Bn
         lEq6qBKrT8gWHC9+EVFjGDlNkII4YhmOXc8+cFduBaO+5gN6hGd1g0/55o4u/YUd68rI
         OLLHPPqS3GBjDeJ/YnE5ojGDtX6FNfDYRzj5tsADZXKuesFOo5LYpeGjclMHz6WwRqva
         eAZ6aXubzXjlC6vBxGmb4FibNsH8r8zSNLAFNixS8u/N0pwazHYAA+nlZxYl9zfqAtfq
         M8HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fWoI+HyX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w67-20020a376246000000b00680a624e5a6si1205457qkb.704.2022.03.25.06.26.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Mar 2022 06:26:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fWoI+HyX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nXjx2-0005w6-1t
	for alex.bennee@linaro.org; Fri, 25 Mar 2022 09:26:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nXjwU-0005va-JN
 for qemu-arm@nongnu.org; Fri, 25 Mar 2022 09:25:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nXjwR-00047A-SR
 for qemu-arm@nongnu.org; Fri, 25 Mar 2022 09:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648214722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GfKBGOEQBA2Txhn6QZ/ZHqP0pM/ldEA4/cud1eQo11I=;
 b=fWoI+HyXq9aGzVvZwstDmulkWGNE4Clo8qLTajNkVvkJf1ApEAkcD0C2hUVHi7FOnyjsIX
 Uv/bZV3TZuyR9l3TY4zWeehnjQGAb+PfW0hcFgRYnHGkvmuBbRQRbRpxO/n8HgiZMtW17Z
 OF9GPSlEje+6/iuJVtchC0/6TYm2Mvc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-BeGdaoWTOZ21_1MFV7z_Mg-1; Fri, 25 Mar 2022 09:25:21 -0400
X-MC-Unique: BeGdaoWTOZ21_1MFV7z_Mg-1
Received: by mail-ej1-f70.google.com with SMTP id
 jl19-20020a17090775d300b006dff5abe965so4118425ejc.18
 for <qemu-arm@nongnu.org>; Fri, 25 Mar 2022 06:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GfKBGOEQBA2Txhn6QZ/ZHqP0pM/ldEA4/cud1eQo11I=;
 b=vFRiNvht8V9AXIdxM9wwXf4M6WYshNI6RSrtRP1+YGwZlZjL1oJt6BZ1lKZVzebVbs
 sI+7Dx3kKdWjYID2Wbbgilya5Ty0NgX3vD7XJc50M5qIHri4h07Nhw7mvkWxkKq4jK7M
 tb8734joLEgUxAxPomBxtHFfkGS5hafi+JHtVY5tTTuVF2H3zmhCsCvhUBRIkjZi94c4
 psRz7fRdbaFOaylc1ZpD5Ku/cUYCSOe4OXVQll5O0rAvaZqChsDLiUJqI6WWekrlROYv
 /f4/wrw6qhzOrsjMY5x0oP1mP3bZwTKvMhXwnCjQFZinx3JkbqLb9ecaManyiImnMIpI
 l9Pg==
X-Gm-Message-State: AOAM530WxJf1KYMPiYpHNywRT8CnE3ofMz11H6DRuPrS9nGSkeHv9/8I
 ZCSdusrXJqTCQRg63DwS0CQmJ9gfrGLSFDFoP7zVjgxXcpqAHHpedEgPgtz0xUdBgLTJ58DOJwR
 BfY/V/PLeWlrb
X-Received: by 2002:a05:6402:3712:b0:416:13bf:4fc5 with SMTP id
 ek18-20020a056402371200b0041613bf4fc5mr13108527edb.115.1648214720245; 
 Fri, 25 Mar 2022 06:25:20 -0700 (PDT)
X-Received: by 2002:a05:6402:3712:b0:416:13bf:4fc5 with SMTP id
 ek18-20020a056402371200b0041613bf4fc5mr13108496edb.115.1648214719991; 
 Fri, 25 Mar 2022 06:25:19 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 hr38-20020a1709073fa600b006e0280f3bbdsm2353225ejc.110.2022.03.25.06.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 06:25:19 -0700 (PDT)
Date: Fri, 25 Mar 2022 14:25:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 2/4] hw/arm/virt: Fix CPU's default NUMA node ID
Message-ID: <20220325142517.04aecd93@redhat.com>
In-Reply-To: <20220323072438.71815-3-gshan@redhat.com>
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-3-gshan@redhat.com>
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8RdDnJmlH9X2

On Wed, 23 Mar 2022 15:24:36 +0800
Gavin Shan <gshan@redhat.com> wrote:

> When CPU-to-NUMA association isn't explicitly provided by users,
> the default on is given by mc->get_default_cpu_node_id(). However,
> the CPU topology isn't fully considered in the default association
> and this causes CPU topology broken warnings on booting Linux guest.
> 
> For example, the following warning messages are observed when the
> Linux guest is booted with the following command lines.
> 
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>   -accel kvm -machine virt,gic-version=host               \
>   -cpu host                                               \
>   -smp 6,sockets=2,cores=3,threads=1                      \
>   -m 1024M,slots=16,maxmem=64G                            \
>   -object memory-backend-ram,id=mem0,size=128M            \
>   -object memory-backend-ram,id=mem1,size=128M            \
>   -object memory-backend-ram,id=mem2,size=128M            \
>   -object memory-backend-ram,id=mem3,size=128M            \
>   -object memory-backend-ram,id=mem4,size=128M            \
>   -object memory-backend-ram,id=mem4,size=384M            \
>   -numa node,nodeid=0,memdev=mem0                         \
>   -numa node,nodeid=1,memdev=mem1                         \
>   -numa node,nodeid=2,memdev=mem2                         \
>   -numa node,nodeid=3,memdev=mem3                         \
>   -numa node,nodeid=4,memdev=mem4                         \
>   -numa node,nodeid=5,memdev=mem5
>          :
>   alternatives: patching kernel code
>   BUG: arch topology borken
>   the CLS domain not a subset of the MC domain
>   <the above error log repeats>
>   BUG: arch topology borken
>   the DIE domain not a subset of the NODE domain
> 
> With current implementation of mc->get_default_cpu_node_id(),
> CPU#0 to CPU#5 are associated with NODE#0 to NODE#5 separately.
> That's incorrect because CPU#0/1/2 should be associated with same
> NUMA node because they're seated in same socket.
> 
> This fixes the issue by considering the socket ID when the default
> CPU-to-NUMA association is provided in virt_possible_cpu_arch_ids().
> With this applied, no more CPU topology broken warnings are seen
> from the Linux guest. The 6 CPUs are associated with NODE#0/1, but
> there are no CPUs associated with NODE#2/3/4/5.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 064eac42f7..3286915229 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2497,7 +2497,9 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>  
>  static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>  {
> -    return idx % ms->numa_state->num_nodes;
> +    int64_t socket_id = ms->possible_cpus->cpus[idx].props.socket_id;
> +
> +    return socket_id % ms->numa_state->num_nodes;
>  }
>  
>  static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)

