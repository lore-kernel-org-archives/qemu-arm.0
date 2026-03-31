Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F8A1061B2B
	for <qemu-arm@archiver.kernel.org>; Tue, 31 Mar 2026 02:38:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7Ozt-0006sf-Cm; Mon, 30 Mar 2026 22:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1w7Ozr-0006rj-GL
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 22:38:27 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1w7Ozp-0000Np-HO
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 22:38:26 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-56ce44a204dso3885127e0c.1
 for <qemu-arm@nongnu.org>; Mon, 30 Mar 2026 19:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774924704; x=1775529504; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AXJdbmxcRc3f4tsmVFMrmidZK7fpR1ZazMMEzbNhj38=;
 b=HmgnU1TGrgeG+tQO2dLyYcP4+cqBTIueKNKa2mvTu/WjCw5VVLFfm48aH9KMUUEA0t
 oZJc6pt421+TlDJwOgB2FCEXnceZg8YEhjE5UOmwD8QBInp+ouhytK5OWpAxnOboYK6A
 7mKLcKvEHaP38qLufUWwkt1Pobk/p3ODnj+aVODo//aGfZVv2e75mk4BSrdqen/lX+e7
 WfxBrWhPUY+yzTDuGZP3HXAISJ25eJ+40yOEOJZVloHCYFRxUR8/AAB7x/VW8KVqod1y
 LfXF9/wotwD7XmY6VMCRfFhRQMTrxxWsEtdLp2F+HvgTWrlaWjyXdhiXzgQpjcZ4P0Gs
 HHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774924704; x=1775529504;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AXJdbmxcRc3f4tsmVFMrmidZK7fpR1ZazMMEzbNhj38=;
 b=EdIDxwXGOaQ+VupPo4DUVYeRJ/WI4/eowhsJe2ehi4ag6MFAS72fz5BHUM/Ym/uTrc
 p+wGjSO9IeiqH0AUyYk6NPV5Dd98GWpxn3XLH+0SYDujQ1Dme/7+h83Wp/maqX+RFgxr
 PCO+1iwRr6wSQRmSoeX5SIMxcc/bsjxaxCHvgZcK48QBCXkRVft345nNFW0Ig3fHdBcM
 9X4kRTGrNXdJOb3A/TVz2LixrCML4XXIO2mUmbhrf7m+N9c3Qu5QDfLAOOxi6i3OMuVk
 /VQXxT24FeKTG/2bzjW2wc07KWo8pAvXDVbF2k+8XTJauvSquFOMI6NvobEVKG2gb9FK
 R1wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeKG97r09R+E9n2se22XSDXXRD8yomWwVOwq6kfs1S6++1ntroTjnAKN2tdUtalmKbiy5j2us6lw==@nongnu.org
X-Gm-Message-State: AOJu0YwSRgRHptrjaifFWALemcFQbVPsdkM8hzx6x6l1Xddu2LHtpV+q
 PqMkCCSn999HY0qasT6LMuKSFIxVgIfiyVtQ+m4qJKWllhNtn7LW1gLz7+89dfibySg=
X-Gm-Gg: ATEYQzw1NffvtI7zD+MWiCDmUq4gkLRe6jFFAVszQqrxyBijJAujS0svM7sH7E1E/so
 +B4NfPHc7hW64bnvUVTzvvsr80/Ny2otZlc9f/6+mAWmvpgV0YO3TTGWdfUYI2BwO/plopOasO/
 BPMiGSts3VN7f/QR9szPzSikyCbxh+akvI4r6pzUqiuAqmCEq400zUx0SN39XOGAvU58UBlWBSH
 hMudAcx4wToGNmp0X7qmZ/UdQmBmrbHPoPd0vyfGnShh679Bl3N17prCBmMjEFsiZ9O4tZ6VRkc
 KFPRsPJo85ogJhHKszDxLY91vH8Zw+ortlv8ybEYhyewZrUm2BO+L8T5abogKzUoHGCZOJBOb7u
 ypLqigm2Aruc9jxzcw1dYgRvxCrOVr9gk2kDTaEMOEhlVufDyvtzNUSCUUKw1TjGcEqHEJDfiED
 h7TD7qqKGa9i+DzbtHHjj8KLDq3y/ExnDMJWkPT8CvWIr8HQ==
X-Received: by 2002:a05:6122:8b1b:b0:56b:7d4d:4d11 with SMTP id
 71dfb90a1353d-56d4a4d1be0mr6004130e0c.1.1774924703683; 
 Mon, 30 Mar 2026 19:38:23 -0700 (PDT)
Received: from [192.168.0.104] ([186.215.53.158])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56d58a33bf3sm10950211e0c.14.2026.03.30.19.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 19:38:23 -0700 (PDT)
Message-ID: <9919ab33-6a56-4a3f-9426-3d4702d1ca29@linaro.org>
Date: Mon, 30 Mar 2026 23:38:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 2/8] hw/core/machine: topology functions capabilities
 added
To: Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
 mst@redhat.com
Cc: anisinha@redhat.com, armbru@redhat.com, berrange@redhat.com,
 dapeng1.mi@linux.intel.com, eric.auger@redhat.com, farman@linux.ibm.com,
 imammedo@redhat.com, jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 linuxarm@huawei.com, maobibo@loongson.cn, mtosatti@redhat.com,
 peter.maydell@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, shannon.zhaosl@gmail.com, zhao1.liu@intel.com
References: <20260311160609.358-1-alireza.sanaee@huawei.com>
 <20260311160609.358-3-alireza.sanaee@huawei.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20260311160609.358-3-alireza.sanaee@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Alireza,

Thanks for addressing my comments in v18.

On 3/11/26 13:06, Alireza Sanaee wrote:
> Add two functions one of which finds the lowest cache level defined in
> the cache description input, and the other checks if a given cache
> topology is defined at a particular cache level
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
> Thanks for the review Gustavo.
> 
> Change log:
>       v18->v19:
>            Fixing the naming of the parameters.
> 
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
> index f85f31bd90..eaf78e1886 100644
> --- a/include/hw/core/boards.h
> +++ b/include/hw/core/boards.h
> @@ -60,6 +60,11 @@ void machine_set_cache_topo_level(MachineState *ms, CacheLevelAndType cache,
>                                     CpuTopologyLevel level);
>   bool machine_check_smp_cache(const MachineState *ms, Error **errp);
>   void machine_memory_devices_init(MachineState *ms, hwaddr base, uint64_t size);
> +bool machine_defines_cache_at_topo_level(const MachineState *ms,
> +                                         CpuTopologyLevel topology);
> +bool machine_find_lowest_level_cache_at_topo_level(const MachineState *ms,
> +                                                   int *lowest_cache_level,
> +                                                   CpuTopologyLevel topo_level);
>   
>   /**
>    * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

