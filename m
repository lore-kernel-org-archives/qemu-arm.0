Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp6677107lfb;
        Tue, 28 Dec 2021 11:18:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzddIZIl5iQ49QdPD9Nh0IYdPxqgSJs9DS6Wxmp/tzhDwmGG1S6H4S3NnnUd3bKf/RHXhGf
X-Received: by 2002:a25:cd47:: with SMTP id d68mr29313911ybf.537.1640719093648;
        Tue, 28 Dec 2021 11:18:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640719093; cv=none;
        d=google.com; s=arc-20160816;
        b=uz435/9J/B6GG65Ec4o5v7HdLO85l7L4LwHIWrUwswl5wcsDUYUtcUGC90MVW2b2R8
         qjK8timEsgBM8CfQtT0zujRuYoezndv/M8aERcR7ugOmODDL14mSMk0XOeV+pO4zpsA4
         Nqozc24BbT3o2iQyc8lvhx0voKaP0q4jwE4AVg6Qf2TYYtu+zHm1FQJj8TZriarsxlEx
         Jbn8Ngyct+81GwtQs3//OxuLNKACr+a5zRDfpFJlZy6/ij3AiTWqwtL7nKNpcl1tcNmP
         QlwrqCz6LUWNqTFsDhs02LTLSPwMri/ARk2jstc+tPOT3ejOAmICs/2Fg+Tvd2E9yYf9
         9nvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Js4t0jQJWnGTvWLylhheiLko/KNFgBwnGYBU+uEJwH0=;
        b=rTnlE1Co4dtwfaM2Vom5J32uWOYQdf2Jn3SfPkJrdo3RT0VzkEW8sgY19kKfSMivF1
         hjAmv+X1vD7yw3RzkgfVF10lJXN+pLiYj7YOf+CnFPY5Tq5Ch+O+pIBbQK3fZ5K0qrOI
         lQ3KPsHbdu7GWsiEDtGwIzyNNSuHbG2r+c4Wy5t59CijtvFf9Nqc6kJGUY0c3Po5Lasb
         F8frwZvS/hMvdA6j6AK5vBybPS3Ih7FnIDNsulDaJrA1tPzKgseXaIce8cCLbnHHYnKd
         /ONR6gjZmgCIyE7h4PNRfS7Uq6bWbrgwbicix9VUhsMGMAfYsuTXr+nDNSaOT/21cEGN
         iGwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J4FdoO48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si20321307ybu.97.2021.12.28.11.18.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Dec 2021 11:18:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J4FdoO48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n2HzB-0001Ye-2x
	for alex.bennee@linaro.org; Tue, 28 Dec 2021 14:18:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2HyU-0001JH-8G
 for qemu-arm@nongnu.org; Tue, 28 Dec 2021 14:17:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2HyR-0001hc-OY
 for qemu-arm@nongnu.org; Tue, 28 Dec 2021 14:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640719046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Js4t0jQJWnGTvWLylhheiLko/KNFgBwnGYBU+uEJwH0=;
 b=J4FdoO48qi0fRjpYVJcUViMDaysWsk9siy+Agyf88iNBILnoKNtbH3Q7PAbnfxNRROX5Oo
 x+Sz5F8etwbvGsllS//lXy8TN7Iu47J4+PHXJj+drty8WCAAWi7XgTdfaFrIJlHAZFh9ha
 4EyRzGg17Rd9QSDTbcbcocwfrmCPOBE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-b4fxrgHyOPu53TXpwc5sIw-1; Tue, 28 Dec 2021 14:17:25 -0500
X-MC-Unique: b4fxrgHyOPu53TXpwc5sIw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r2-20020a05600c35c200b00345c3b82b22so9683336wmq.0
 for <qemu-arm@nongnu.org>; Tue, 28 Dec 2021 11:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Js4t0jQJWnGTvWLylhheiLko/KNFgBwnGYBU+uEJwH0=;
 b=amQEhLWUJQsPfdgno28yh5udLlNHXO/A62VzynMZwdBHcAyS21lT+xohWFR+85MS8C
 0lynP+9Zrhb2BNQSNE8rpg8tZ8WLCm6/C2JyYLnZWfY69yAosqaJT/86t9j4XveN8ztd
 0137D/rnqNcWF+Pl9B8m5MjE8VFbfbebyEJfKSzHl2u1davYqLAF336LIAOOZzxfo3CK
 Azq7l3vxXXelVROHrvYKNguM736OxNOf5VquO6E/n8DT036PJqQ4WU0fuwg1knf4/n7c
 d+NuC2+4XEA78SQAmHX7uZOnWbepsIG7dBbeGCovCr16Ah9ejgFyFq8MeHQK6bOKekPH
 ZMuw==
X-Gm-Message-State: AOAM532vGh4hbbUMlooA2pxqGmhUgtGflk1YdmTzxKGvRQJj1e3OkyXi
 ASKwdJEHoKHWnb3RauLFiIJKkLfk/zL+DeiTDL/JC9BITVPAjEMSPxl5UnPp/Cx6F6e/TXXIbFs
 AIBFGlAoNiSwq
X-Received: by 2002:a05:600c:1c9f:: with SMTP id
 k31mr18514455wms.159.1640719044214; 
 Tue, 28 Dec 2021 11:17:24 -0800 (PST)
X-Received: by 2002:a05:600c:1c9f:: with SMTP id
 k31mr18514426wms.159.1640719043964; 
 Tue, 28 Dec 2021 11:17:23 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id v1sm21597088wru.45.2021.12.28.11.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 11:17:23 -0800 (PST)
Message-ID: <fa7f67b2-ca1d-bd95-1a33-534a50b2d4c8@redhat.com>
Date: Tue, 28 Dec 2021 20:17:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 02/14] hw/core/machine: Introduce CPU cluster topology
 support
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-3-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211228092221.21068-3-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.573,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OsQVFf3hPQ5V

Hi,

On 12/28/21 10:22, Yanan Wang wrote:
> The new Cluster-Aware Scheduling support has landed in Linux 5.16,
> which has been proved to benefit the scheduling performance (e.g.
> load balance and wake_affine strategy) on both x86_64 and AArch64.
> 
> So now in Linux 5.16 we have four-level arch-neutral CPU topology
> definition like below and a new scheduler level for clusters.
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
> A cluster generally means a group of CPU cores which share L2 cache
> or other mid-level resources, and it is the shared resources that
> is used to improve scheduler's behavior. From the point of view of
> the size range, it's between CPU die and CPU core. For example, on
> some ARM64 Kunpeng servers, we have 6 clusters in each NUMA node,
> and 4 CPU cores in each cluster. The 4 CPU cores share a separate
> L2 cache and a L3 cache tag, which brings cache affinity advantage.
> 
> In virtualization, on the Hosts which have pClusters, if we can

Maybe [*] -> reference to pClusters?

> design a vCPU topology with cluster level for guest kernel and
> have a dedicated vCPU pinning. A Cluster-Aware Guest kernel can
> also make use of the cache affinity of CPU clusters to gain
> similar scheduling performance.
> 
> This patch adds infrastructure for CPU cluster level topology
> configuration and parsing, so that the user can specify cluster
> parameter if their machines support it.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine-smp.c | 26 +++++++++++++++++++-------
>  hw/core/machine.c     |  3 +++
>  include/hw/boards.h   |  6 +++++-
>  qapi/machine.json     |  5 ++++-
>  qemu-options.hx       |  7 ++++---
>  softmmu/vl.c          |  3 +++
>  6 files changed, 38 insertions(+), 12 deletions(-)

> diff --git a/qapi/machine.json b/qapi/machine.json
> index edeab6084b..ff0ab4ca20 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1404,7 +1404,9 @@
>  #
>  # @dies: number of dies per socket in the CPU topology
>  #
> -# @cores: number of cores per die in the CPU topology
> +# @clusters: number of clusters per die in the CPU topology

Missing:

   #            (since 7.0)

> +#
> +# @cores: number of cores per cluster in the CPU topology
>  #
>  # @threads: number of threads per core in the CPU topology
>  #
> @@ -1416,6 +1418,7 @@
>       '*cpus': 'int',
>       '*sockets': 'int',
>       '*dies': 'int',
> +     '*clusters': 'int',
>       '*cores': 'int',
>       '*threads': 'int',
>       '*maxcpus': 'int' } }
If you want I can update the doc when applying.

Thanks,

Phil.

