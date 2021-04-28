Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp456950lfb;
        Wed, 28 Apr 2021 03:32:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPIxE2IXPRVdxJbQV5QoTF4+F/razaMfMernHVP9Vox75hgxqaAD0123p8z7vwWqqW4nZr
X-Received: by 2002:ab0:2eb8:: with SMTP id y24mr16637737uay.131.1619605925802;
        Wed, 28 Apr 2021 03:32:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619605925; cv=none;
        d=google.com; s=arc-20160816;
        b=a4rQqFTeU4adFNEDQFccEgagEqyrET1a0aeHs2QBwhyVOUT65h/lm7MtBW2B2FSnUd
         yTOo7y8WZnd0psRkKA/J5V22etOeLYqESH9NxTOnHZf0AKTGhFtxK+KkwXq6zSNgzKMi
         5M6rbUyJSRZn4qz8JkcZS20WEBkQ3aXpSYHugVy3wlusKdUcms4mDaAx6kQDSlIzz8hm
         PKoyHMpiYyTc/G8hcbYWK1c10QvECNcML5VZqSp38UFLjyl8xrapLF6LGf4snwv80eDG
         qI/zDDZxcmMZ6QJ4Cx6ocIh88Ff9m60J/9U+AeAH6t8aYvNIunnw1Zwi8ORK2qw6z6tE
         VY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=mjvmg9LlEpVSK1chOBrjgyfYfbujA4I0+6/VYY4DFgE=;
        b=GZ8ysJz9Xv9sfNkZK4z2d1dCje2tUYos/bMIWilYp6PtxPeg7pWV8aYmEDSe6IHPoD
         UgvsZMz/0H3lx4ekLJXsudoLBtLuQXQ2wIiE1sifacs1Uo+EDKW8pnLIfHzTES+ebZ1E
         Gjxw2le6mrU0nWxOQMkJ9MfRE28oCMXwsbUlWDAPMzTqJR746tQMn88zaPUfkyXPs56V
         2aI5VkDJDh5/E/eNwQOj1f2cCW3Ds+sLAAvwQcsFG+21YgmwPeNaI2LWoj4E9PJDhCcD
         MEr6ex5wEPu+WAgBOfme7fZy4dFHhY45z+H1zz7d+kTPymOGfdL+IUXv01PPT0uu0FPz
         X/ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=R9N+THAC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j143si2209192vsd.252.2021.04.28.03.32.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Apr 2021 03:32:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=R9N+THAC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbhUC-0005Ts-UR
	for alex.bennee@linaro.org; Wed, 28 Apr 2021 06:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbhTz-0005P7-JJ
 for qemu-arm@nongnu.org; Wed, 28 Apr 2021 06:31:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbhTx-0004LW-Pr
 for qemu-arm@nongnu.org; Wed, 28 Apr 2021 06:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619605909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mjvmg9LlEpVSK1chOBrjgyfYfbujA4I0+6/VYY4DFgE=;
 b=R9N+THACueiyUsfc4f7HpBh4uLtLfcqyZ6UfAqMRbZJ7m/9xD9tODU5eURKAzEv/kw8Yge
 aCzlrHaAmln7Cd4+8G/IagmeXHxKnmcgKswJzBd9ljTCvjQk3kLkBUs/I1sKd21KAGmVnq
 UXNIPcofAmJQGBUD4AsGJ1MT+0EHI+g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-jEyy8VLcNLOeABRCIfQdaA-1; Wed, 28 Apr 2021 06:31:45 -0400
X-MC-Unique: jEyy8VLcNLOeABRCIfQdaA-1
Received: by mail-ed1-f70.google.com with SMTP id
 o4-20020a0564024384b0290378d45ecf57so26786488edc.12
 for <qemu-arm@nongnu.org>; Wed, 28 Apr 2021 03:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mjvmg9LlEpVSK1chOBrjgyfYfbujA4I0+6/VYY4DFgE=;
 b=sThvdgW2Jkqnmupfz5WKvzQ1D9m3Jt/S4xiccJRmOX1yZH2P/IODqMTFH+/B6QKE3S
 mkqg4U+FD9WzC2JL0384TKvfdFh1bxj1RXq3hDZ1KCKFX4BgL5vmNbc8f9qx52xhKpre
 gwPacVRxv/3vPteX6Q0HQhZDpJ4Uf+Ippgo/IUJqQc0K++BCGVXqugCrq2/3Y6eF/jvY
 nHUhUb5nEeziAbyFj0zgKWv0aCA04hONCpktvxKhMhzEHuGxl4XWHgHsl45ivs78r/b2
 7T8uEVk776WpxymeSZAaYPja4XeYJZxt+5sNm7IcXUecSqDNX2bWPCU5bexi/zNqHYXg
 bmdQ==
X-Gm-Message-State: AOAM530UoVlFWUW5Y0apgWugV0UFTlyyeC1NiumL1G52AoFjenmfxESF
 2YnW9kFTFVw0h4+a7Jr4hCGgJf5n+aj6Kh4PbiUoNISHAGfMX4m+UlNu+t4YAryrjXWmpYhKrND
 wR+TWYD384GSl
X-Received: by 2002:a17:906:8319:: with SMTP id
 j25mr21664387ejx.413.1619605904282; 
 Wed, 28 Apr 2021 03:31:44 -0700 (PDT)
X-Received: by 2002:a17:906:8319:: with SMTP id
 j25mr21664346ejx.413.1619605903990; 
 Wed, 28 Apr 2021 03:31:43 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id l7sm1719252ejk.115.2021.04.28.03.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 03:31:43 -0700 (PDT)
Date: Wed, 28 Apr 2021 12:31:41 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 2/4] hw/arm/virt: Parse -smp cluster parameter in
 virt_smp_parse
Message-ID: <20210428103141.5qfhzcqko6hxhxee@gator>
References: <20210413083147.34236-1-wangyanan55@huawei.com>
 <20210413083147.34236-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413083147.34236-3-wangyanan55@huawei.com>
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
 qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DVLxWBej+PAL

On Tue, Apr 13, 2021 at 04:31:45PM +0800, Yanan Wang wrote:
> There is a separate function virt_smp_parse() in hw/virt/arm.c used
> to parse cpu topology for the ARM machines. So add parsing of -smp
> cluster parameter in it, then total number of logical cpus will be
> calculated like: max_cpus = sockets * clusters * cores * threads.
> 
> In virt_smp_parse(), the computing logic of missing values prefers
> cores over sockets over threads. And for compatibility, the value
> of clusters will be set as default 1 if not explicitly specified.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 57ef961cb5..51797628db 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2639,35 +2639,38 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
>      if (opts) {
>          unsigned cpus = qemu_opt_get_number(opts, "cpus", 0);
>          unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
> +        unsigned clusters = qemu_opt_get_number(opts, "clusters", 1);
>          unsigned cores = qemu_opt_get_number(opts, "cores", 0);
>          unsigned threads = qemu_opt_get_number(opts, "threads", 0);
> +        VirtMachineState *vms = VIRT_MACHINE(ms);
>  
>          /*
> -         * Compute missing values; prefer cores over sockets and
> -         * sockets over threads.
> +         * Compute missing values; prefer cores over sockets and sockets
> +         * over threads. For compatibility, value of clusters will have
> +         * been set as default 1 if not explicitly specified.
>           */
>          if (cpus == 0 || cores == 0) {
>              sockets = sockets > 0 ? sockets : 1;
>              threads = threads > 0 ? threads : 1;
>              if (cpus == 0) {
>                  cores = cores > 0 ? cores : 1;
> -                cpus = cores * threads * sockets;
> +                cpus = sockets * clusters * cores * threads;
>              } else {
>                  ms->smp.max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
> -                cores = ms->smp.max_cpus / (sockets * threads);
> +                cores = ms->smp.max_cpus / (sockets * clusters * threads);
>              }
>          } else if (sockets == 0) {
>              threads = threads > 0 ? threads : 1;
> -            sockets = cpus / (cores * threads);
> +            sockets = cpus / (clusters * cores * threads);
>              sockets = sockets > 0 ? sockets : 1;

If we initialize clusters to zero instead of one and add lines in
'cpus == 0 || cores == 0' and 'sockets == 0' like
'clusters = clusters > 0 ? clusters : 1' as needed, then I think we can
add

 } else if (clusters == 0) {
     threads = threads > 0 ? threads : 1;
     clusters = cpus / (sockets * cores * thread);
     clusters = clusters > 0 ? clusters : 1;
 }

here.

>          } else if (threads == 0) {
> -            threads = cpus / (cores * sockets);
> +            threads = cpus / (sockets * clusters * cores);
>              threads = threads > 0 ? threads : 1;
> -        } else if (sockets * cores * threads < cpus) {
> +        } else if (sockets * clusters * cores * threads < cpus) {
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
> @@ -2678,11 +2681,11 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
>              exit(1);
>          }
>  
> -        if (sockets * cores * threads != ms->smp.max_cpus) {
> +        if (sockets * clusters * cores * threads != ms->smp.max_cpus) {
>              error_report("cpu topology: "
> -                         "sockets (%u) * cores (%u) * threads (%u)"
> -                         "!= maxcpus (%u)",
> -                         sockets, cores, threads,
> +                         "sockets (%u) * clusters (%u) * cores (%u) * "
> +                         "threads (%u) != maxcpus (%u)",
> +                         sockets, clusters, cores, threads,
>                           ms->smp.max_cpus);
>              exit(1);
>          }
> @@ -2691,6 +2694,7 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
>          ms->smp.cores = cores;
>          ms->smp.threads = threads;
>          ms->smp.sockets = sockets;
> +        vms->smp_clusters = clusters;
>      }
>  
>      if (ms->smp.cpus > 1) {
> -- 
> 2.19.1
>

Thanks,
drew 

