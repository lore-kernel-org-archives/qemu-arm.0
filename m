Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp441866ejb;
        Thu, 25 May 2023 06:30:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4e+S1FeHG/XYubyBUF5bAqrLgzrByaURoyn+zmQAiT99lNpTPb2o/aacFGMdIv00lCpmgU
X-Received: by 2002:a05:6214:e8e:b0:625:95f1:eb47 with SMTP id hf14-20020a0562140e8e00b0062595f1eb47mr1651690qvb.20.1685021441278;
        Thu, 25 May 2023 06:30:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685021441; cv=none;
        d=google.com; s=arc-20160816;
        b=V6/yMSMU1GtrM6f4+R6fbE8GqdL2g0APGpeLP7D6ngYIju2R5OhiTBZxEByU5SVE9L
         AjW3x0pz7zkXmouPieN5xjonVa64DALfaa/Ei/Q8vJbqT93Jwg/PITcuFAKzNzpraAe8
         UDOfx4OPcmCfYOfY0TpLiTY72ptuwzSFSFUSdeTwSUsBZFR9RXmu8jPmsVjloq3qPmVz
         unmh4XE9wjjpGBNcxm6LRR2rqB9wOo77qLgqL7Y9R/hkPkHMeIn6kc9ssIUuGoKIGiKj
         HpaYz4pXO78IfqpIXuj4/DWykvEFI2ccBnsBN0sFGEb3FFtPUHRhhB6wF2yFk0MY/2Ib
         LJEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=d+L/OmLfMMjzY1hSnnDaGxrLkcQDsPU5Pyru/t0KJIo=;
        b=N+v/jMns8MTlELIYh1JsiItA7Bt60YL+ycZh5ZRlCHi3iTqqsbbA/nMLdnJgeBTDL8
         29fjFkTSbqQ1w8VSIydbnFJrtZUKj74sJ914na0bgP054hVaVvHkLBa6DCYm8hp6wcl1
         h6nbZ3jWNX6gF8mXxrYpo2la1wayoKDspb/YQ17U5XuBuD1mVpqQS5Zgpgp9eTDKD6nO
         bOPpr4ZZy53pFnNN82BZfCmvo7yuP3Z325tJajMsHA4pigyWpwQn3MAofOUcF5nlZYsD
         9WxIxFfqBktMp/CMiiOJDMqJLCb9y1KRWm5V/V/UJ/RV5RQFVDFUSQy3IqmJk1L3Uw7S
         ACUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D00+uq9P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020ad45b8c000000b006259fcebfdbsi475761qvp.189.2023.05.25.06.30.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 06:30:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D00+uq9P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2B2z-0005x7-HW; Thu, 25 May 2023 09:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q2B2w-0005vK-Co
 for qemu-arm@nongnu.org; Thu, 25 May 2023 09:30:26 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q2B2l-0005Vf-1T
 for qemu-arm@nongnu.org; Thu, 25 May 2023 09:30:25 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30a8dc89c33so1413639f8f.0
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685021408; x=1687613408;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d+L/OmLfMMjzY1hSnnDaGxrLkcQDsPU5Pyru/t0KJIo=;
 b=D00+uq9PlaTC2y9z/mIc5SqQTrpc12nXMk8mwOBRxGAhaY7/PU9oAF6NoqIQoiLjYm
 GBXBnHL5lt3QhpoSEkTNuOdE1mG+/VYRLylvlHEgt3888/sGenFv9NSOPh7U+7nCI2Bn
 rhHiJTPY1KBWaLo3QgjonpLPiQ/iUUKpbZWIZpZv6Pq2aInO8Z7CuSXXgMeGvNzG3Cts
 IVB5paOSYlaCvnldAIVt/j9l/MsxswRWwveszmNulwGz5pWa0OiIh6Jz9P6pC0SvW5rN
 IWJq1jfVpGnkokaUeYYl1FnJM5JJesLiLv0XSIhZlakE7ISGUyvNyOGEBA0E7JJ4zxJO
 9Adw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685021408; x=1687613408;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d+L/OmLfMMjzY1hSnnDaGxrLkcQDsPU5Pyru/t0KJIo=;
 b=ilTm9XnevfknJHkkhsPzH9HqeqUhnaE+CcY3cTljKbxrNg7SgmvVFjPjHFGPbZhwLY
 zo+OgRASdz6bbuL5dFXDERRAgTaGrma7+O8RhmaI14bl7dxP2UVLaWO7wC+n8vdFKTA8
 exZmLUDJKBnNsWhhH+3Ta4QJRkU3E7Zo1P39udE/icsjS8e9BXb2d13HTFYZSO57JuFD
 iqLoGlKjOkyR8MspH9R4fhsNKIZMPe9U4wsGDgJkXVD36qrc/BZGusaDow17iP6FFUVn
 T2V/E1pvxQfwQ2CAb8MsWlCw/TbKqf0U2Yk4N96jLFL8HxZyeNeXCfd9Fx+XV1mBZoFR
 +WmA==
X-Gm-Message-State: AC+VfDztrqWOrZyEzRXcXFbDnHrO9uvRhlcqch1GlYb37YWxm14+3d8E
 7SJXv6SrqWicQlMJfv1u2lt3/g==
X-Received: by 2002:adf:f404:0:b0:306:36e7:db27 with SMTP id
 g4-20020adff404000000b0030636e7db27mr2360790wro.16.1685021408076; 
 Thu, 25 May 2023 06:30:08 -0700 (PDT)
Received: from [192.168.69.115] (cor91-h02-176-184-30-254.dsl.sta.abo.bbox.fr.
 [176.184.30.254]) by smtp.gmail.com with ESMTPSA id
 a13-20020adffacd000000b003064600cff9sm1863160wrs.38.2023.05.25.06.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 06:30:07 -0700 (PDT)
Message-ID: <d2b91574-a6cb-32be-2713-ba6bf6b7e565@linaro.org>
Date: Thu, 25 May 2023 15:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v1 2/3] memory-device: Factor out device memory
 initialization into memory_devices_init()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20230523185144.533592-1-david@redhat.com>
 <20230523185144.533592-3-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230523185144.533592-3-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8xptnMsq28eZ

Hi David,

On 23/5/23 20:51, David Hildenbrand wrote:
> Let's factor the common setup out, to prepare for further changes.
> 
> On arm64, we'll add the subregion to system RAM now earlier -- which
> shouldn't matter, because the system RAM memory region should already be
> alive at that point.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/arm/virt.c                  |  9 +--------
>   hw/i386/pc.c                   | 17 ++++++-----------
>   hw/loongarch/virt.c            | 14 ++++----------
>   hw/mem/memory-device.c         | 20 ++++++++++++++++++++
>   hw/ppc/spapr.c                 | 15 ++++++---------
>   include/hw/mem/memory-device.h |  2 ++
>   6 files changed, 39 insertions(+), 38 deletions(-)

Split in boring 'first add method then use it for each arch'
would be easier to review.

> diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
> index 6c025b02c1..d99ceb621a 100644
> --- a/hw/mem/memory-device.c
> +++ b/hw/mem/memory-device.c
> @@ -17,6 +17,7 @@
>   #include "qemu/range.h"
>   #include "hw/virtio/vhost.h"
>   #include "sysemu/kvm.h"
> +#include "exec/address-spaces.h"
>   #include "trace.h"
>   
>   static gint memory_device_addr_sort(gconstpointer a, gconstpointer b)
> @@ -333,6 +334,25 @@ uint64_t memory_device_get_region_size(const MemoryDeviceState *md,
>       return memory_region_size(mr);
>   }
>   
> +void memory_devices_init(MachineState *ms, hwaddr base, uint64_t size)
> +{
> +    g_assert(!ms->device_memory);
> +    ms->device_memory = g_new0(DeviceMemoryState, 1);
> +    ms->device_memory->base = base;
> +
> +    /*
> +     * See memory_device_get_free_addr(): An empty device memory region
> +     * means "this machine supports memory devices, but they are not enabled".
> +     */
> +    if (size > 0) {
> +        memory_region_init(&ms->device_memory->mr, OBJECT(ms), "device-memory",
> +                           size);
> +        memory_region_add_subregion(get_system_memory(),
> +                                    ms->device_memory->base,
> +                                    &ms->device_memory->mr);

What about always init/register and set if enabled?

   memory_region_set_enabled(&ms->device_memory->mr, size > 0);

Otherwise why allocate ms->device_memory?

> +    }
> +}

