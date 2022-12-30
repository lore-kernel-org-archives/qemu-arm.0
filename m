Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4976937ejb;
        Fri, 30 Dec 2022 07:43:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMEp7EXfjDoaQerUdDtVeQJuM9h3OJLEbm9FW5AyZXYckcBSRD95WURKBG++NaXK4Xdxeg
X-Received: by 2002:a05:622a:5144:b0:3ab:7e41:5bb2 with SMTP id ew4-20020a05622a514400b003ab7e415bb2mr27658857qtb.38.1672415027848;
        Fri, 30 Dec 2022 07:43:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672415027; cv=none;
        d=google.com; s=arc-20160816;
        b=DH88lf+LIPe5MSgEcTFA1eGSlG5hTpOTl2CQWessW5PGXkabTHKu2QRhK4Ps2g3wQr
         wlRzlSAfI+lToF/s/Y8+Th12KoushI26RyzF5UVIc5CK+ehpZFrCbwC9sz6EqM2MeJr/
         ifjQgAv4XTNQgiYhhgwIfr734A4vkMoXzw2UaqTCqEe4Mz3MPrZMTQpcBVDfGAlrvUha
         fSWxlM7X2tmOUq/U4gNEi94MxK8kLqckmoKPWKjYzMRkbvCKt6X4pCqFsx5R0K3dQg+8
         szmKtRiRcDMpaklM75CrwWcwKVKyEZX7hvXgW2/ZQwfgKY6sBQ2R7bYhNUVwdukooRff
         hLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=m80Xl48AvNuUlY0gKwkHRMMfXe4ur38qDJmDxDx1KRk=;
        b=f3HVbh13CPanxAMjYBIzKYGkFtQdzrONzKjAGxSQHcathcVscnoYaaCeoAJLsw807o
         ldZYT/Vg3ubsNJQrmDOzZcwrBYUjGEw4etEfboYPOAUN+m2Xc3MUZv+BIPH6k96IPk/2
         VgnwuAmY/ZqOujzRlRUE/EpFC6AxEZQITUWgRWmLVLFOXyeomIyqS1gSyneIJEXDTE3N
         cMb56+3QDYWppZrA7BbQxoOpF6bF2BEmZ6EE/AvV6H4Bz+kVb2YzqRO0qaX+yzcFbZQ0
         P5kM2aZnN71sZx5MqOJwWPr5Ox3K9PPk8P0SdCrjNFdpFN9+l+3Iceo5CMHriM7lwafW
         9K+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xXyiZIX3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cf14-20020a05622a400e00b003975927b01asi10384111qtb.336.2022.12.30.07.43.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Dec 2022 07:43:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xXyiZIX3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pBHXe-0000xR-5z; Fri, 30 Dec 2022 10:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBHXc-0000tz-EV
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 10:43:28 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBHXZ-00021r-6G
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 10:43:28 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso8875553wms.5
 for <qemu-arm@nongnu.org>; Fri, 30 Dec 2022 07:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m80Xl48AvNuUlY0gKwkHRMMfXe4ur38qDJmDxDx1KRk=;
 b=xXyiZIX3K72kMULDnCCXPkVrRDkVvwpZ4v1zG/SyJocjzPwXVHMsxUB34cvyEtLLAh
 cQUjjtdzBMoQpbIyjp8YroZtha+UuQ5w71HRqC6LhaWV6n8fhP639eyBDgrqEjOzYDcF
 Gdl/UVb7H2dhH9opruH/uCSY9IGIlycNYnehbdadKdwn7250tZiV5x6PZ6jF5dkzBcfa
 ULYiN3GHwTEE06e9EX/RDUL0zhujjzRLt7QqabkdWV2Lihs+fr6x2fl77Vsiq2ZvKZUM
 B+OGyT4/L+1OmkMZ4aVgqYerF+aSr1TiiaWhBV87rg/MuXK7hSpf2t2oxHoGx9yRxYSX
 wtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m80Xl48AvNuUlY0gKwkHRMMfXe4ur38qDJmDxDx1KRk=;
 b=RSUNyyknDuRyLbsOMt9UKfqG9nWmpTZxM16ZAbX8K7M97VuGG2hmCGxUTCpY6VrJst
 frs3LlT1wDyPUCchAZ+odyXWefi63+/sg/WYZgBYYaLAmxaOZdl0S6FZCoVYxYr9zVck
 88Vq58Iaj1dBPWQf4Dlxj/F5Ic8UbBMzX2DDzZoIQKfWmagF461et3nJd9KwzE7m84IL
 GLiAigEJtxi2pEx1jVH7WulWVNk6XnUGcCMETfuGaQBXE++g2KiH+AC4ZohfJniuev8b
 TnVhpf1lNURDqBnMFmX39qf674pV6MF+Am9cQHABCGbBcB/e8FdABTZnTKfLZsMsXK/K
 TUsQ==
X-Gm-Message-State: AFqh2kocGsIxRJu7GPbp7y9CRXgV2NRV7Nn60Q1U4vXGD83vKMGvySJY
 RmUFjO3eWQDhbAFBMUz9ZFoXKA==
X-Received: by 2002:a05:600c:510e:b0:3d3:4406:8a2e with SMTP id
 o14-20020a05600c510e00b003d344068a2emr26005732wms.15.1672415002152; 
 Fri, 30 Dec 2022 07:43:22 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b003d9980c5e7asm8323369wmq.21.2022.12.30.07.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 07:43:21 -0800 (PST)
Message-ID: <258e42aa-1c32-15ac-137b-3d328fcf5106@linaro.org>
Date: Fri, 30 Dec 2022 16:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/2] hw/arm: Add Olimex H405
Content-Language: en-US
To: Felipe Balbi <balbi@kernel.org>, Alistair Francis
 <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221230145733.200496-1-balbi@kernel.org>
 <20221230145733.200496-3-balbi@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221230145733.200496-3-balbi@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e8IgWXK3t8c5

On 30/12/22 15:57, Felipe Balbi wrote:
> Olimex makes a series of low-cost STM32 boards. This commit introduces
> the minimum setup to support SMT32-H405. See [1] for details
> 
> [1] https://www.olimex.com/Products/ARM/ST/STM32-H405/
> 
> Signed-off-by: Felipe Balbi <balbi@kernel.org>
> ---
> 
> Changes since v1:
> 	- Add a note in stm32.rst
> 	- Initialize default_cpu_type to cortex-m4
> 	- 0-initialize default_ram_size
> 
>   MAINTAINERS                             |  6 +++
>   configs/devices/arm-softmmu/default.mak |  1 +
>   docs/system/arm/stm32.rst               |  1 +
>   hw/arm/Kconfig                          |  4 ++
>   hw/arm/meson.build                      |  1 +
>   hw/arm/olimex-stm32-h405.c              | 69 +++++++++++++++++++++++++
>   6 files changed, 82 insertions(+)
>   create mode 100644 hw/arm/olimex-stm32-h405.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

