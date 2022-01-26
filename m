Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp3174548lfk;
        Tue, 25 Jan 2022 23:44:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZRPOZksJaQLAb8HL+cwMmotIszqrV5C0mwfMAQzzb/73q0ngXCkQilgMXuKiodnLmc0ik
X-Received: by 2002:a05:620a:44cc:: with SMTP id y12mr17581905qkp.79.1643183099723;
        Tue, 25 Jan 2022 23:44:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643183099; cv=none;
        d=google.com; s=arc-20160816;
        b=iGCm7qMAqWthgUP8VEVUiHuegR+XaB26etpL+WQcmnb4JLX7yzF/6je8g9hgsQta3p
         B95H/8cq/fMuHrdXI7npMyjDyieGlIkYGpyjh1afsp+pXsU+Vwl+17ePoFkB9vdoIVQX
         d8ODJjDFLASan7CmVnfouq1PzCD6wqPwEP60HSGnKQEQpwsvThyAxTqupgztsbjeOWYk
         rtrUrh+KdED7omlzMYJ/yQXBjVr4sNSoWOG837vYfGNNx1qSTx4tm0PiN82BBVePjrgE
         ALbO8lmEUTFetcws0rA0yqtoRWZGNyl7hiBd7Yd47R9IcuCBHxpDGUUG7H53ML8d0FHs
         SzfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=h8TX9lWvMUa/9+p2TzMHAMy1MtuPsfO8IzjYSVB8cfg=;
        b=ePTNDYMQi/44kJEc4FyVkBpTiP1MENVYCBfz6MoGf8h+eLTBONAJg2rFf/n3Qzo9wv
         Bngx3mbICk7KLreRUknj7+oyi25XzkRsOCNdkZi+T0RRngJc5eP2qGTSaHfZvZ2IpNzq
         kC1L7LyE7HfPvWS0aFPsgKQ5nGcadN+6ZYX8ZCOLRjEk+VWU3Jhdh2bTSYoJ9+yHjZuG
         vdd0Nx0BU/k+90yzrqLdAneDzgll/VAJ448bOIdqg31v2gUPQTOV17qN9WrhKHY8jlf2
         3b8a0omHFP93hzk6pHuVdt2wV/H6sEybcAZrkzvv7oGo/aia6Jkg9BlyIrtiomfPVBVZ
         3O5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="SOcQf//1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15si7367929qti.411.2022.01.25.23.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jan 2022 23:44:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="SOcQf//1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nCczD-0008Ve-7V
	for alex.bennee@linaro.org; Wed, 26 Jan 2022 02:44:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nCcwE-0008U4-Mp
 for qemu-arm@nongnu.org; Wed, 26 Jan 2022 02:41:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nCcwA-0002XI-Iu
 for qemu-arm@nongnu.org; Wed, 26 Jan 2022 02:41:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643182909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h8TX9lWvMUa/9+p2TzMHAMy1MtuPsfO8IzjYSVB8cfg=;
 b=SOcQf//1AFHXsli+sQxveAgy/0OlLlEd36Ayx8wSsz2agPskssubv8PKksqlh8e9cRJmfN
 sYTeKTiqlHPrcQRHFLloJ7Nr8eQmVq0He2VaF+WJpyP0K8lE/w/aOWwUirGlYCI2tRRRED
 zVbByZSxLeUvjCnY+W6Ckf7GdJNRev4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-2t3vilFROL2gPPmkDMDtlA-1; Wed, 26 Jan 2022 02:41:48 -0500
X-MC-Unique: 2t3vilFROL2gPPmkDMDtlA-1
Received: by mail-ed1-f69.google.com with SMTP id
 eg24-20020a056402289800b00407f95c4c35so5766382edb.10
 for <qemu-arm@nongnu.org>; Tue, 25 Jan 2022 23:41:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h8TX9lWvMUa/9+p2TzMHAMy1MtuPsfO8IzjYSVB8cfg=;
 b=5VekX6V7MaBrGv7FiCRxca/4tuzq9l25piPjQH1hiU7d1pxDacZPlbr/2m6Fc3FehI
 3zf8rAKaI36UEc+bPbF2W85yJ2D8sn0gW62/3C28Sa1gv2hAn2x+BJFtHH+SQGdMw0jT
 fJH+WfCwIpTvwtFsz457qYJNDnzmryoI6/n/nVhVJEzZwwbnDuA+qdKkPayithxWcUFR
 6GXFBjB0v+0IK16Yq2M+UnG+ktWdKhCsWLJRp5/l2sD6kaLheF/X6O/BBdl231SDusGe
 hW10NzwJjUvK0ILFOlUMAgYiDEzs0LdNTWfy3icgD81t+cXGI3nRZVfwEiJUmqBP6p+p
 Mo2Q==
X-Gm-Message-State: AOAM533KyI7ccr4Z9IeJCO0glAKPFv5Fffe/383LUUOCXmI9osOlv593
 xCCG1Sms6codPeF6QPZQ0WE0WOl5E8GonQ6PMxvT74S7CSjklIq15TgEBaCEeZJ3Q3F8fInAwdF
 rs8dhtaXkIKz2
X-Received: by 2002:a17:907:2daa:: with SMTP id
 gt42mr18654500ejc.704.1643182907457; 
 Tue, 25 Jan 2022 23:41:47 -0800 (PST)
X-Received: by 2002:a17:907:2daa:: with SMTP id
 gt42mr18654471ejc.704.1643182907130; 
 Tue, 25 Jan 2022 23:41:47 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id n25sm5677730ejx.92.2022.01.25.23.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 23:41:46 -0800 (PST)
Date: Wed, 26 Jan 2022 08:41:44 +0100
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Fix CPU's default NUMA node ID
Message-ID: <20220126074144.hq2vvnex6ajg4pe7@gator>
References: <20220126052410.36380-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220126052410.36380-1-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AMnXHBbjDCqr


CCing Igor.

Thanks,
drew

On Wed, Jan 26, 2022 at 01:24:10PM +0800, Gavin Shan wrote:
> The default CPU-to-NUMA association is given by mc->get_default_cpu_node_id()
> when it isn't provided explicitly. However, the CPU topology isn't fully
> considered in the default association and it causes CPU topology broken
> warnings on booting Linux guest.
> 
> For example, the following warning messages are observed when the Linux guest
> is booted with the following command lines.
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
> With current implementation of mc->get_default_cpu_node_id(), CPU#0 to CPU#5
> are associated with NODE#0 to NODE#5 separately. That's incorrect because
> CPU#0/1/2 should be associated with same NUMA node because they're seated
> in same socket.
> 
> This fixes the issue by considering the socket when default CPU-to-NUMA
> is given. With this applied, no more CPU topology broken warnings are seen
> from the Linux guest. The 6 CPUs are associated with NODE#0/1, but there are
> no CPUs associated with NODE#2/3/4/5.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 141350bf21..b4a95522d3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2499,7 +2499,7 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>  
>  static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>  {
> -    return idx % ms->numa_state->num_nodes;
> +    return idx / (ms->smp.dies * ms->smp.clusters * ms->smp.cores * ms->smp.threads);
>  }
>  
>  static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> -- 
> 2.23.0
> 

