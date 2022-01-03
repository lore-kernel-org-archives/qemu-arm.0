Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp10234936lfb;
        Mon, 3 Jan 2022 03:29:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsyWM8dBffzD9fbKgGcF91Q9m7ohC8p4+tNwOUrhXc4jms46n+AWRd56m3UL/cYwP+LOd9
X-Received: by 2002:ac8:5c08:: with SMTP id i8mr39933623qti.457.1641209364545;
        Mon, 03 Jan 2022 03:29:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641209364; cv=none;
        d=google.com; s=arc-20160816;
        b=Fy7LHW2aFyzKFmQy8jrGtg6hdCo8qh+UMWkj3kx5ICZsh0IuaeApmP7WF4pWcIVQj+
         JEttI+h7gx4qZy46jthVLOZL3NxDg48LqN8a185JLRnc+sKB7DkfIaBfmy+sFbRgUuj7
         oaLxiMW6YQhVbc6+9yV4Ayhzpl/uiDji1c0thLGc3Rai06XjbD+TMw69/e30FhAVTrEQ
         7uLdU1y2CiKyNL0gZSAXB7Qa8a5K3I31h6S4c5UNe/6cMacG1LRWO43p0aJSUAZ6CpIy
         2RYsKqixF5BvNQtUok99xe47AYTjnK2G8U1GDjLUXd4vqH85FQKPr0H90lzAa3AUrX2W
         CKsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=pC9O6tJM+BPo6eDubYV03H6gARf8SbN10d8Rk6tr5ig=;
        b=ENctnwiiu+gYplBMmmz4w32K3XsnU31Ql8w5oYxgHQCEowAaAiko7jfflcsKzhBOIr
         +izwSOzPdHF+R/pAywNr5sZutTZuBovMIPGsPI+aDu/wQO/tmaeOyJrEXgrg4ySA+Y7m
         50se2qmsHQ/zGZntJaqHWWRoNlxbc1fpWj8w8mFpkCHGVRRkKT4/CUS5ZuooM4whB4lC
         L/6lcrj3yK1Xo8Pa2sFCQrdtbep6/joWcclniAprAPZz4dkYwEjVri5YJ4gFOM9hYbuh
         e5NYYk+8n9RU5QQ0Sx1M6o4jwLWtVqKdw+sDe2wAktWHy6saVYoM5c+g3R2uuwC8fXwV
         X1nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ea+e5fi+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv8si15916019qvb.239.2022.01.03.03.29.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jan 2022 03:29:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ea+e5fi+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n4LWk-0002DP-Ot
	for alex.bennee@linaro.org; Mon, 03 Jan 2022 06:29:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4LT2-0005R3-QR
 for qemu-arm@nongnu.org; Mon, 03 Jan 2022 06:25:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4LSu-0002F0-60
 for qemu-arm@nongnu.org; Mon, 03 Jan 2022 06:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641209123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pC9O6tJM+BPo6eDubYV03H6gARf8SbN10d8Rk6tr5ig=;
 b=Ea+e5fi++EBCfxUaxmGiJ539YvJbFipmm0cz48dvNBu3n8L1J2iMqv7SZKyu3J24ue5B4M
 Wq5tnqK8igGF1FkFRrI6xz8lBvrnuco2tT0+CIyZCP9TxX3Y4GmBHEagFfFHQ0JljUKlCP
 gPRyJ2cVwFK4DctAvBNAiBoXMwQ5XLw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-nyc5semHP3SSGekwnwO7Nw-1; Mon, 03 Jan 2022 06:25:20 -0500
X-MC-Unique: nyc5semHP3SSGekwnwO7Nw-1
Received: by mail-ed1-f72.google.com with SMTP id
 d7-20020aa7ce07000000b003f84e9b9c2fso22492680edv.3
 for <qemu-arm@nongnu.org>; Mon, 03 Jan 2022 03:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pC9O6tJM+BPo6eDubYV03H6gARf8SbN10d8Rk6tr5ig=;
 b=j79hiuD0zcJVLVZUabWvKkoMSNq3u5eCueDbzYcRNgBNgcD/U6GwepPQ3GSDVpMyGI
 m5iaoxgUvSzN5VpAx5MAZ8tSRFKttviGwInCGBfK+QM6KMZWMlozSW4C29KTJtHkPzey
 QpCRTUDnQKMtgY0X2uY7Of0zqfIjQ6VAbzMHTdXaalm9Le429YZaVD1b/GV5VDSapQ5Z
 uZpb0s4wC4wTCIhpZP7hU/9QFQzeZERexeXTzZy5iI85QNAMwrxrU67H8ncSDKZpB4Ns
 1zXFmhNqP91ICoOE1wy6SW31Z7/ZnsTl1cPRKsG9mrgwQVKIWlX0j9V5tVRuWLkM33gA
 ORgA==
X-Gm-Message-State: AOAM531DNN+nrws/p1q1IztTZjMHstf/w4FCAVzL1pmsk0oNpsb7bkbm
 kBE8XEJjo6+TrIKlD/4/2H+xVRPsTN/QEkDeYmzFQAYOKd7ENdGI7V06lhnluLfx08n0vNvmjKG
 mkkLXpjC0dffo
X-Received: by 2002:a17:907:96a4:: with SMTP id
 hd36mr35406070ejc.574.1641209118928; 
 Mon, 03 Jan 2022 03:25:18 -0800 (PST)
X-Received: by 2002:a17:907:96a4:: with SMTP id
 hd36mr35406062ejc.574.1641209118715; 
 Mon, 03 Jan 2022 03:25:18 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id dd6sm10579108ejc.212.2022.01.03.03.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 03:25:18 -0800 (PST)
Date: Mon, 3 Jan 2022 12:25:16 +0100
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 2/7] hw/arm/virt: Support cluster level in DT cpu-map
Message-ID: <20220103112516.xgc7jhzb6d734jmy@gator>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220103084636.2496-3-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
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
X-TUID: DZfuEcMClFsT

On Mon, Jan 03, 2022 at 04:46:31PM +0800, Yanan Wang wrote:
> Support one cluster level between core and physical package in the
> cpu-map of Arm/virt devicetree. This is also consistent with Linux
> Doc "Documentation/devicetree/bindings/cpu/cpu-topology.txt".
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f413e146d9..fc5eea8c8c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -430,9 +430,8 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>           * can contain several layers of clustering within a single physical
>           * package and cluster nodes can be contained in parent cluster nodes.
>           *
> -         * Given that cluster is not yet supported in the vCPU topology,
> -         * we currently generate one cluster node within each socket node
> -         * by default.
> +         * Note: currently we only support one layer of clustering within
> +         * each physical package.
>           */
>          qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
>  
> @@ -442,14 +441,16 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>  
>              if (ms->smp.threads > 1) {
>                  map_path = g_strdup_printf(
> -                    "/cpus/cpu-map/socket%d/cluster0/core%d/thread%d",
> -                    cpu / (ms->smp.cores * ms->smp.threads),
> +                    "/cpus/cpu-map/socket%d/cluster%d/core%d/thread%d",
> +                    cpu / (ms->smp.clusters * ms->smp.cores * ms->smp.threads),
> +                    (cpu / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters,
>                      (cpu / ms->smp.threads) % ms->smp.cores,
>                      cpu % ms->smp.threads);
>              } else {
>                  map_path = g_strdup_printf(
> -                    "/cpus/cpu-map/socket%d/cluster0/core%d",
> -                    cpu / ms->smp.cores,
> +                    "/cpus/cpu-map/socket%d/cluster%d/core%d",
> +                    cpu / (ms->smp.clusters * ms->smp.cores),
> +                    (cpu / ms->smp.cores) % ms->smp.clusters,
>                      cpu % ms->smp.cores);
>              }
>              qemu_fdt_add_path(ms->fdt, map_path);
> -- 
> 2.27.0
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

