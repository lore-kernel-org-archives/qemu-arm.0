Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp467521lfb;
        Wed, 28 Apr 2021 03:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPF/rfk6poD9cZmdvctKze+IBSW83RcQKX2SwHLKik8566+jm7He5xe7TCEyXVJATLeOWv
X-Received: by 2002:a67:c203:: with SMTP id i3mr23411272vsj.28.1619606799141;
        Wed, 28 Apr 2021 03:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619606799; cv=none;
        d=google.com; s=arc-20160816;
        b=jFkgMI80XTWGDoYdlUgo/PZ5g8UHTlMl7SXX+cJXG+t+XFya2GmriBaGljA37l65/N
         fTfRlyi04CMkLV61EoR3U1mDmrUXy/zra529/v0gEndQumvqaKkyaCRkD12E4fJ+vsAc
         DxwtIQOJeeiETfqQAgZKTfuJGG8S5kEkgNuek1gqFDCqjJj22z3JztVn/J3gLSsAqrKQ
         uXAm0JzZ/fUb2iTlEK0yU6HsHzj605UHYTv/GTz8NsmZfX6YV801nEY/jDY76w9uD9xW
         zW5FLRzOjtRXZrbVWlbrqo+bgxgONtGR/cOfZy6Rl7E1rOlC1XPahuqTvNqu77cBvVI1
         7+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=dkYwtjYQp9GbaATbUTgk4o5+Cte5U7wMpoOzlm+VwJQ=;
        b=NtouaOYxu8keRJqiLD5HE9cST+Dh2+50dfkxkk34NutswAS+hBea6CiMT5fYl7keoq
         5/FB98dRNVOz6QeWZkX4EsPb8W52bLm23ef8nNRd+3kQSoqC3aLPLM4obFxOos12F5Ju
         Js79oCPjT5M9CLdlXAUI1aHudTiKNWs4atjB+QwOKJFNYcytKYTiCRgBKd3AF2XeTx8Z
         M8yzepqPQ9VtwkpwGBXeT62oI9AVsZlzAVJzAF66rvP2zopW5EReNbIHD7sCdNf2dXPy
         aARirfSxqmIhGN5fGEMsNEymBQ26UzxcGAs8jFIHenly4ZTinjUY+DkS2jQpEE20C9mz
         2J1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dn9iO2nM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16si2409646uaj.150.2021.04.28.03.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Apr 2021 03:46:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dn9iO2nM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbhiI-0002QV-Fg
	for alex.bennee@linaro.org; Wed, 28 Apr 2021 06:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbhhv-0002QM-9U
 for qemu-arm@nongnu.org; Wed, 28 Apr 2021 06:46:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbhht-000493-Np
 for qemu-arm@nongnu.org; Wed, 28 Apr 2021 06:46:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619606773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dkYwtjYQp9GbaATbUTgk4o5+Cte5U7wMpoOzlm+VwJQ=;
 b=dn9iO2nMWEq2kUYRQ0toqX4cA79/fo4zsIH2Z0MKfR4/A+ibmG+ISqN0ymuvje6qUXUV/2
 SiAXfFBLtNXhyL7UmCLrFPHJe4SIJs4ngxGA6iFxUm7c5GuIBKTvP0dRrXl1f7BF5IFIzD
 NHojrC0qqF9fFWzgGO9yhYTP461sPEE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-ojeqcRbIP5CMRWjOie11BQ-1; Wed, 28 Apr 2021 06:46:09 -0400
X-MC-Unique: ojeqcRbIP5CMRWjOie11BQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 d16-20020a1709066410b0290373cd3ce7e6so12183431ejm.14
 for <qemu-arm@nongnu.org>; Wed, 28 Apr 2021 03:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dkYwtjYQp9GbaATbUTgk4o5+Cte5U7wMpoOzlm+VwJQ=;
 b=h2jrmnlMY/3bN3nmZx8weqQla+st8/S7vbOizcFvAg5hYNlEAD6x6l/3JJP+HysuCz
 X3p6kAgznmWixTf+QCRn/WUValpQfW8rgCZXifUQyen76BA95PRa6AFRFEK2rlOJrflG
 bSQZSxo1OMjmYAiKWPcsHjg1uUmlfU5/87M/R95iz0kRL68LoCfGftiQ5XV1syE0Z0W3
 KAIdKmeGq5a5s7mAi65DSTAUcVzrbUd+1/IzAeozBcDSBDUWYnWJoMNgxoa5aiPpNcDD
 R6rNmlU03+Cyfu8cfg/kXXdE1xXkIYFz3+vtGEqPgxZJ8AlRICduLYWsZNzqy1OR91Vb
 ZOHA==
X-Gm-Message-State: AOAM5335M6KXYcbMuCqCrOifimgVPlB87c9Do9RxfKHUXEC4WY8mkwej
 e+2ywqRVwdxqF1RCuEkuLwYpUNwEWB6/oLAQyNzIgnOa0p/4lF57FuSDxURm3cavEIveQ4vP3qo
 AhcnqjlEsBfIS
X-Received: by 2002:a17:906:5487:: with SMTP id
 r7mr28409047ejo.550.1619606768031; 
 Wed, 28 Apr 2021 03:46:08 -0700 (PDT)
X-Received: by 2002:a17:906:5487:: with SMTP id
 r7mr28409018ejo.550.1619606767840; 
 Wed, 28 Apr 2021 03:46:07 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id j4sm1004087ejk.37.2021.04.28.03.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 03:46:07 -0700 (PDT)
Date: Wed, 28 Apr 2021 12:46:05 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 4/4] hw/arm/virt: Add cluster level for device tree
Message-ID: <20210428104605.nt7274cduqjk376g@gator>
References: <20210413083147.34236-1-wangyanan55@huawei.com>
 <20210413083147.34236-5-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413083147.34236-5-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZqIegOVkHv7C

On Tue, Apr 13, 2021 at 04:31:47PM +0800, Yanan Wang wrote:
> Add a cluster level between core level and package level for
> ARM device tree.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 51797628db..4468a4734b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -434,14 +434,18 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>  
>              if (ms->smp.threads > 1) {
>                  map_path = g_strdup_printf(
> -                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
> -                    "socket", cpu / (ms->smp.cores * ms->smp.threads),
> +                    "/cpus/cpu-map/%s%d/%s%d/%s%d/%s%d",
> +                    "socket", cpu / (vms->smp_clusters * ms->smp.cores *
> +                    ms->smp.threads),
> +                    "cluster", (cpu / (ms->smp.cores * ms->smp.threads)) %
> +                    vms->smp_clusters,
>                      "core", (cpu / ms->smp.threads) % ms->smp.cores,
>                      "thread", cpu % ms->smp.threads);
>              } else {
>                  map_path = g_strdup_printf(
> -                    "/cpus/cpu-map/%s%d/%s%d",
> -                    "socket", cpu / ms->smp.cores,
> +                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
> +                    "socket", cpu / (vms->smp_clusters * ms->smp.cores),
> +                    "cluster", (cpu / ms->smp.cores) % vms->smp_clusters,
>                      "core", cpu % ms->smp.cores);
>              }
>              qemu_fdt_add_path(ms->fdt, map_path);
> -- 
> 2.19.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

