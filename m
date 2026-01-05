Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C41C98324
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Jan 2026 20:06:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vcqpm-00044M-Sd; Mon, 05 Jan 2026 15:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vcqpk-00043U-BM
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 15:05:45 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vcqpi-0002xj-O8
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 15:05:44 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so2325515e9.2
 for <qemu-arm@nongnu.org>; Mon, 05 Jan 2026 12:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767643541; x=1768248341; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3bkBOF6PfXakxek8BKFF8yQ1t3i1ev7+5afmBB8BdfE=;
 b=GaHRTQXQL+Ub1654kZtmtZ1VhW0tdU4JnO+aJvEdA0TFIi+pkaXjFLCI5bkZz7quoP
 kpcQPrF5u/qHoK0okSIhYHbRa/Vk8VjH9vzUM1G5eI/Smnjknq/qPaDnMXCYHEt6QCgr
 V6qkWi1eIHp8S2tfNlvixRkvt+Pc4CDmLBKligcO8TDqxlFH3tsfnkp5LnucY3OfY2bD
 iYlQFdaGrNU59TZc0E5cAn76FM79j5UIYq4j1CotZEFJdZD+LJDq69DTuiCI9QB4TZ07
 4kts4LR3N6BBwDjuUAWm/F3jU8UXRVHX9PXBKcO99JGJlZG0DmaMq0sSUfLk//goE88o
 1kzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767643541; x=1768248341;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3bkBOF6PfXakxek8BKFF8yQ1t3i1ev7+5afmBB8BdfE=;
 b=NIlbAap7GEtSrcUaETv0kXGw+/quCShoAad0fuLVhSoq11ejlySXKhaQrdWp4zwbuw
 lTnHh2JhG91H+QK7O8ylb+NCTd3mfVOC2vmXf11HqzknLD36ie1ZDT/0S36y+ELCLrOe
 2+wP/4GVj3TQ9+yZpP9VWTX6VBAVl66WyEgjoKgLk1VCj3hR4fcDp+pTWTGx+LWETdQC
 3+QSD7G75Tx6M3yI2XVzwVnO/QVQjKio2hrVrEukjHgY67SfTUbVL8JZ2IPNzwV9X4Bj
 pXqyEtHrq3iob6F6G0e956G87JYMC4LXW+v88X8laUbNljWhP/uLUz7xKfg8xqQPAfJf
 X2mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrxK18iFrHLjwytWU9+6A1dfxSQjR+0/0o68Exeql2t0o6e9nu25b0Pv7zgaXRA01aMoIUBf6Qig==@nongnu.org
X-Gm-Message-State: AOJu0YxAltxVfr1cfjyMhAgpkSEJ0qR5zENRSL4l15f2+y0C0n81N3Sr
 RjxmWK8oGponhP92ps61giSMAtAdgv9MO/cZVzR/nc0yK7joWXt0KJj3b/tqetAH6gk=
X-Gm-Gg: AY/fxX6uK3kf5Hv9z4YhaQlS9TRHlYsL5r5ZcsZKYgtUPk1gxWzzlWkfc8ws/IHaaW8
 +simlsHv4D43GBpY6g3HTqLSJ/QfW71zfqNlIhEs69WlRTziB15Zrqu5ZFuIr+UxkH/w5AjIjtz
 rj4Pox9CAkmYWB9KvvfmZyJzjdGfT0SsQRvc7m+wuqXLPyCsIHYJ8597rF+Q29ygOaXWscjekjq
 SBGEFjIk3cSfMBHBoQj/q5Lx5i3G+9SsFsIrQz4sxalrfKB8FTN3NUWxymuffXgisq6Fn9d/QSr
 N0nMCuZmWqrw5gN4GuX+S3O1cKSRCAeS8J4GI4cz0wb3v0sJsgrBSZCAlHU8eWkgdfV+McWWHLV
 tIwCNXIXZywGzR3Wj4JrHagVNXm2o1o//TwTiRPTFw08w9O/filgnJZ5dcTSV/lIBc+PJXYknLw
 310gdSqfI1m+bQe8ziiBPOS1eQ5XyTr2Hom0jb7feogI4i+r/s9fPl8COvU6kaJ78=
X-Google-Smtp-Source: AGHT+IEW23tuBXk1g4KTtJMHXdh8hoFU87hJIubNhrE+jic/6I3C81dW5Nb0MKNV5oT3iCcnhkqP+A==
X-Received: by 2002:a05:600c:6289:b0:477:9a28:b0a4 with SMTP id
 5b1f17b1804b1-47d7f00e96bmr7573295e9.0.1767643540632; 
 Mon, 05 Jan 2026 12:05:40 -0800 (PST)
Received: from [10.247.174.66] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f6f0e15sm3880305e9.10.2026.01.05.12.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 12:05:40 -0800 (PST)
Message-ID: <a8afadf0-fcec-444a-86d8-a75676f8bd76@linaro.org>
Date: Mon, 5 Jan 2026 21:05:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hw/arm/smmu: add memory regions as property for an
 SMMU instance
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Radoslaw Biernacki <rad@semihalf.com>,
 tangtao1634@phytium.com.cn, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>
References: <20251216235731.1793908-1-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251216235731.1793908-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 17/12/25 00:57, Pierrick Bouvier wrote:
> This will be used to access non-secure and secure memory. Secure support
> and Granule Protection Check (for RME) for SMMU need to access secure
> memory.
> 
> As well, it allows to remove usage of global address_space_memory,
> allowing different SMMU instances to have a specific view of memory.
> 
> User creatable SMMU are handled as well for virt machine,
> by setting the memory properties when device is plugged in.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/hw/arm/smmu-common.h |  4 ++++
>   include/hw/arm/virt.h        |  2 ++
>   hw/arm/sbsa-ref.c            | 16 ++++++++++++----
>   hw/arm/smmu-common.c         | 25 +++++++++++++++++++++++++
>   hw/arm/virt.c                | 13 +++++++++++--
>   5 files changed, 54 insertions(+), 6 deletions(-)


> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 62a76121841..9a67ce857fe 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -944,6 +944,13 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> +    g_assert(s->memory);
> +    address_space_init(&s->memory_as, s->memory, "smmu-memory-view");
> +    if (s->secure_memory) {
> +        address_space_init(&s->secure_memory_as, s->secure_memory,
> +                           "smmu-secure-memory-view");

Else, are we sure the SMMU implementations will behave correctly?

> +    }
> +
>       /*
>        * We only allow default PCIe Root Complex(pcie.0) or pxb-pcie based extra
>        * root complexes to be associated with SMMU.
> @@ -1008,10 +1015,28 @@ static void smmu_base_class_init(ObjectClass *klass, const void *data)
>       rc->phases.exit = smmu_base_reset_exit;
>   }
>   
> +static void smmu_base_instance_init(Object *obj)
> +{
> +    SMMUState *s = ARM_SMMU(obj);
> +
> +    object_property_add_link(obj, "memory",
> +                             TYPE_MEMORY_REGION,
> +                             (Object **)&s->memory,
> +                             qdev_prop_allow_set_link_before_realize,
> +                             OBJ_PROP_LINK_STRONG);
> +
> +    object_property_add_link(obj, "secure-memory",
> +                             TYPE_MEMORY_REGION,
> +                             (Object **)&s->secure_memory,
> +                             qdev_prop_allow_set_link_before_realize,
> +                             OBJ_PROP_LINK_STRONG);

Why can't we use device_class_set_props(&static_properties)
in smmu_base_class_init()?

> +}
> +
>   static const TypeInfo smmu_base_info = {
>       .name          = TYPE_ARM_SMMU,
>       .parent        = TYPE_SYS_BUS_DEVICE,
>       .instance_size = sizeof(SMMUState),
> +    .instance_init = smmu_base_instance_init,
>       .class_data    = NULL,
>       .class_size    = sizeof(SMMUBaseClass),
>       .class_init    = smmu_base_class_init,

Anyhow this is functional and I suppose this can be improved on top, so:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


