Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB10FEDEC01
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Mar 2026 02:39:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxc8z-0005ko-2W; Tue, 03 Mar 2026 21:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vxc8r-0005kB-5m
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 21:39:17 -0500
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vxc8n-00021s-3P
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 21:39:15 -0500
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-94ab69af6c8so4380396241.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 18:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772591951; x=1773196751; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T2Hy5vODgk0ZornaPFlnwaS9qH3Awx2gy0GqbKNWQqc=;
 b=hdXoF0p0W88HxcqcUauKfOp++FtmfS/GSHuxq7Umue3I1W+RrlZqjrCYtUYFHg+eMa
 S3S50CjFysDZ8ak3HmwqhoQvCuNJGTZxH2IYeCgvlqPZnszYPjNiyvNShIe3CXZRQvaq
 GbC9LZLacULBh3XGWKoIEVthviDtN+KEZ6GI3r7l1SOE8/LjEW/E5ZX91QWsjMox2Gvp
 SXamYBvt6AmO4PWDZdV5c4jFXc7rUMtKcZY6yui0JGe8NBAKkZ+kS8muyxp5CXwoexuN
 XhsWy6uC71NmLDNcsXKOlpIEezHA1sDH7C4BpyjbE8Y5oBJFw0QYWpW8iN8rFu/uS2rm
 inzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772591951; x=1773196751;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T2Hy5vODgk0ZornaPFlnwaS9qH3Awx2gy0GqbKNWQqc=;
 b=YWR07DZumb4tmA4drhqKL1rzzpKFyCnJ+6B+lqf0Oh96HZhGthwEX8Tj7jJzgZDG2b
 0iBLekMz4ThG2WhpCIxMNqV/9o8MtkF0UaPwAurM4LCVT28eZXd4TZJ2vi+7sM7PIYQT
 ykvCTmNAd0bxlnFciwbm5p+jFG3+SjsUU1JbB+cr/UtWNRk9tjtS7ahplXGu3Z9CZCmg
 inEURBAfHz+eRSvf/+KvLTqoFPi3XHRtEUru1c5H5aaT/O7OmJtmxQ0lnVTgZOw/WAkw
 T7OZt/kMTdpzYGrNC0NgnjmP/VihewfcHcl4NjoVVC1Htjz3K6uD0ej4+WTfAzLQwDJO
 v9UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbrQ8jd/H7Xp42/WGY9HvvMUJhfLugtCQfJrUG4N72nTrmYBjmN74Vh9DROjWIvbWD4H9HKWCSSw==@nongnu.org
X-Gm-Message-State: AOJu0Yx783PS6DbYMSE2tlQvnbkLO0sLdIImCyAeFjE3CvQmQj/dcS7E
 LeRydowy6Nr9FrrB4RwArc5FhoBrQpV2FlYV+prhEGjxt6nH60wzZjRGBG1FQvWOJ2c=
X-Gm-Gg: ATEYQzy3UgztfEtLrOJk4LrbGkrxzqf279w5rbtkItSxg5Tb6tPiNxW677y4XsSufQn
 5stb4MSvX+mtybEUjHd/U4szpNtdR+/nss3PLtM2qQ0vnBZdoaQ1fsPBaiythc0OWMiurgQC8oT
 FIl8NAon3vE8L0Ap5feb6zmdnpC0Lkneib/yBcE3MW+n1WgmsM/ucPR+e1bbeMmstBKJEVpVqV3
 c/K0oQB9fSGGA6RMKEECADOT9J1tpU+iUEofA3kUwfvcMC/KjXgZRb13bqEBxS7OJHGigmogZxw
 /mYMq/+qY4X8hIZsgVV4jxiWpdE4/xfKInwLVKZpXY24VG5XtMUIDZJcShJ5V8IslJeJ1CHOSbE
 KJcx0X6RaQ2AdwgxZ81YRw5w3FGsbXZrXcsgHl/0XGexZzlGp+saM3ItIEvIgz+2sYxqXI4UTH/
 PwCmLUSlZYkFfy+lA1xpFyE8rwa/OY5V/e
X-Received: by 2002:a05:6102:c04:b0:5f5:3739:100d with SMTP id
 ada2fe7eead31-5ff8f555c1fmr2036577137.0.1772591951183; 
 Tue, 03 Mar 2026 18:39:11 -0800 (PST)
Received: from [192.168.0.103] ([191.8.216.93])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-94df645b877sm16831501241.8.2026.03.03.18.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 18:39:10 -0800 (PST)
Message-ID: <91570f1c-3579-4b82-8252-6d29bc7d2f6e@linaro.org>
Date: Tue, 3 Mar 2026 23:39:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 2/8] hw/core/machine: topology functions capabilities
 added
To: Alireza Sanaee <alireza.sanaee@huawei.com>, mst@redhat.com,
 qemu-devel@nongnu.org
Cc: anisinha@redhat.com, armbru@redhat.com, berrange@redhat.com,
 dapeng1.mi@linux.intel.com, eric.auger@redhat.com, farman@linux.ibm.com,
 imammedo@redhat.com, jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 linuxarm@huawei.com, maobibo@loongson.cn, mtosatti@redhat.com,
 peter.maydell@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, shannon.zhaosl@gmail.com, zhao1.liu@intel.com
References: <20260220141128.789-1-alireza.sanaee@huawei.com>
 <20260220141128.789-3-alireza.sanaee@huawei.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20260220141128.789-3-alireza.sanaee@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=gustavo.romero@linaro.org; helo=mail-ua1-x930.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi,

On 2/20/26 11:11, Alireza Sanaee wrote:
> Add two functions one of which finds the lowest cache level defined in
> the cache description input, and the other checks if a given cache
> topology is defined at a particular cache level
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>   hw/core/machine-smp.c    | 52 ++++++++++++++++++++++++++++++++++++++++
>   include/hw/core/boards.h |  5 ++++
>   2 files changed, 57 insertions(+)
> 
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index 189c70015f..bef04aa2d7 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -406,3 +406,55 @@ bool machine_check_smp_cache(const MachineState *ms, Error **errp)
>   
>       return true;
>   }
> +
> +/*
> + * This function assumes L3 and L2 have unified cache and L1 is split L1d and
> + * L1i.
> + */
> +bool machine_find_lowest_level_cache_at_topo_level(const MachineState *ms,
> +                                                   int *lowest_cache_level,
> +                                                   CpuTopologyLevel topo_level)
> +{
> +    enum CacheLevelAndType cache_level;
> +    enum CpuTopologyLevel t;
> +
> +    for (cache_level = CACHE_LEVEL_AND_TYPE_L1D;
> +         cache_level < CACHE_LEVEL_AND_TYPE__MAX; cache_level++) {
> +        t = machine_get_cache_topo_level(ms, cache_level);
> +        if (t == topo_level) {
> +            /* Assume L1 is split into L1d and L1i caches. */
> +            if (cache_level == CACHE_LEVEL_AND_TYPE_L1D ||
> +                cache_level == CACHE_LEVEL_AND_TYPE_L1I) {
> +                *lowest_cache_level = 1; /* L1 */
> +            } else {
> +                /* Assume the other caches are unified. */
> +                *lowest_cache_level = cache_level;
> +            }
> +
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +/*
> + * Check if there are caches defined at a particular level. It supports only
> + * L1, L2 and L3 caches, but this can be extended to more levels as needed.
> + *
> + * Return True on success, False otherwise.
> + */
> +bool machine_defines_cache_at_topo_level(const MachineState *ms,
> +                                         CpuTopologyLevel topology)
> +{
> +    enum CacheLevelAndType cache_level;
> +
> +    for (cache_level = CACHE_LEVEL_AND_TYPE_L1D;
> +         cache_level < CACHE_LEVEL_AND_TYPE__MAX; cache_level++) {
> +        if (machine_get_cache_topo_level(ms, cache_level) == topology) {
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> diff --git a/include/hw/core/boards.h b/include/hw/core/boards.h
> index edbe8d03e5..af5fd9f3cd 100644
> --- a/include/hw/core/boards.h
> +++ b/include/hw/core/boards.h
> @@ -60,6 +60,11 @@ void machine_set_cache_topo_level(MachineState *ms, CacheLevelAndType cache,
>                                     CpuTopologyLevel level);
>   bool machine_check_smp_cache(const MachineState *ms, Error **errp);
>   void machine_memory_devices_init(MachineState *ms, hwaddr base, uint64_t size);
> +bool machine_defines_cache_at_topo_level(const MachineState *ms,
> +                                         CpuTopologyLevel level);
> +bool machine_find_lowest_level_cache_at_topo_level(const MachineState *ms,
> +                                                   int *level_found,
> +                                                   CpuTopologyLevel topo_level);
>   
>   /**
>    * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

