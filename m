Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3346733ejb;
        Mon, 19 Dec 2022 01:53:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuc9Q8nIFPDSo8RArrOMEZhesmA4xt+arBC6TXAN3Z/LYua2BBZJilWpw93ESY7MKy3k93v
X-Received: by 2002:ac8:66d4:0:b0:3a5:faa7:3601 with SMTP id m20-20020ac866d4000000b003a5faa73601mr12508911qtp.1.1671443633472;
        Mon, 19 Dec 2022 01:53:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671443633; cv=none;
        d=google.com; s=arc-20160816;
        b=DoKWEks/wMogFxYkeODaOtcl/KM5i0I/NGE0JnWKJGPwZDKKAEBq1w4qBwxivT9dXX
         zsrbE6N/Z3Ns5g37v7m8yqA56P9weNw2Y+p97WX1vOUYvYCOsB7y3iq+QGCXRf7hNfiU
         efaJ4cS3hiLiqm8z80+YavObAZUImCWaxHtIrYH5hH+f5olY2+A5uLKj2qxzvnXgmnlu
         RwB9sDd43i6Z6z/creHZlqm7Oe5RcDfmttyGrndI31JZIfO+WOq5KF/NxXQs6GfE+IjY
         L3m34T8riyIU1Wkfbdtzrapq9yCOlz3uzh+9UXmSetwQRDrJZ0S0vCsBWt6uqFb46zqd
         kgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=eCiHn2upUuu7++TpX87sQgO6F2dE2X13ckHZBaYnvPo=;
        b=dDHyt8qqNhztar8IdsE6TQfu0NgiAObIsWaDZQgpSi6kwWXTEjC39I+q7fK84VIPXr
         ecQ8cAwhTaYkyQux2I4L0tK2zhiI8jfdpQCbe1GXjkrieGouH3n8+pBvOK6N6OXVQS4p
         aS9mI39rNdxBLesy0v7KN5ussYwmrR51JywLKDdKxI7lTnx3PmvaAID7/DWihZjTBZYW
         RTpRVFycQJzNehIJElG9Wbc+8KdqUnTbNMDrVa6O5hY71IvcxgV1x8Ys3RFS3UKzKCD3
         p4NsX5/XWoT8b2wk4Vm02rmuoFQwArMc+MhTc1YRkfhNlMBKMKCLkFOG+Cd7VJLmloMo
         /F9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wZ9wV58+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9-20020ac80549000000b003a7e04d07afsi3658584qth.466.2022.12.19.01.53.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Dec 2022 01:53:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wZ9wV58+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7Cpp-000144-KY; Mon, 19 Dec 2022 04:53:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Cpl-00013e-6D
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 04:53:21 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Cpi-0002O7-VN
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 04:53:20 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 o5-20020a05600c510500b003d21f02fbaaso8365830wms.4
 for <qemu-arm@nongnu.org>; Mon, 19 Dec 2022 01:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eCiHn2upUuu7++TpX87sQgO6F2dE2X13ckHZBaYnvPo=;
 b=wZ9wV58+qb9NMGdw5/7nzXOTzx8aAcfn010tKbswFaO9WA4y9o6Oi5D25ujYYaGWzZ
 Dsci3ZxuVgGkZGmZEVEIncHDCKbgjy6SEMHJW3Yusy/dHPCeDEemfvM38WIREqetxnSG
 noC/FT4oyUBSMJCRR2iftr7L4b8q3oCVKpMwJW9R3ZuvpJ/jNGTz/NWlItBpJrd3NDEs
 JPEOSiuFsj33mXOW7lHsfWUDQxbQL7Zdab+maEb6aZm9kfgX1JUKdZCiqqLrtgwlOJ6x
 z0+cHCiRMxh56h3GVhnGuoH7K/YUJBPKmkodBeyicHCXqO8p4Jbkv3M1KnqVn6g9Z1r1
 UHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eCiHn2upUuu7++TpX87sQgO6F2dE2X13ckHZBaYnvPo=;
 b=uQ12pkNk+yONaHT4UCOTR+QcjBnrehgFMHgYcl1c3bB7JkXlmQdyVi8Y5EZ+9jdwcz
 LmQPtWkkQzuafXk0nRC/0IElOHQ4qsqqHDC7kfMurgSgLAXVePOHvULyMBaAs7uwMmjv
 vkLfN+cwPZ8Pmm5avggMI6Pt55OUmZUoMuqfpd3F+FA2Tp8G5rpTKfkllTZlXB8Zk+XD
 1CQdeRoa0INs8b7HdMQ5fnONCDgQ7d6k8W0OyBeTlV/bAP1rG7OsiI9kBOFbzWgDY4Ll
 O5pts6ADnP7t8jp1e6R54CdxCsTpJXXCnKDLFaJRr3vrvBrPwSRfqh1o8NBq3IO/hVjw
 YEmg==
X-Gm-Message-State: ANoB5plFaq0HVYE70LW6LJUWzwI2gn7EPT4y6lgLSX7rArTmJgRrOHXp
 DrjkWa5uA4+2k4/r+G6GoTIpdA==
X-Received: by 2002:a05:600c:4f96:b0:3d1:c895:930c with SMTP id
 n22-20020a05600c4f9600b003d1c895930cmr31727598wmq.35.1671443597345; 
 Mon, 19 Dec 2022 01:53:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s13-20020a5d510d000000b00241e5b917d0sm11211294wrt.36.2022.12.19.01.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 01:53:16 -0800 (PST)
Message-ID: <00539fb5-9e00-8010-4fe5-2902cee9891b@linaro.org>
Date: Mon, 19 Dec 2022 10:53:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] hw/arm/stm32f405: correctly describe the memory layout
Content-Language: en-US
To: Felipe Balbi <balbi@kernel.org>, Alistair Francis
 <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221218071229.484944-1-balbi@kernel.org>
 <20221218071229.484944-2-balbi@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218071229.484944-2-balbi@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: a+JQnzpy5rkH

Hi Felipe,

On 18/12/22 08:12, Felipe Balbi wrote:
> STM32F405 has 128K of SRAM and another 64K of CCM (Core-coupled
> Memory) at a different base address. Correctly describe the memory
> layout to give existing FW images have a chance to run unmodified.
> 
> Signed-off-by: Felipe Balbi <balbi@kernel.org>
> ---
>   hw/arm/stm32f405_soc.c         | 8 ++++++++
>   include/hw/arm/stm32f405_soc.h | 5 ++++-
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
> index c07947d9f8b1..cef23d7ee41a 100644
> --- a/hw/arm/stm32f405_soc.c
> +++ b/hw/arm/stm32f405_soc.c
> @@ -139,6 +139,14 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
>       }
>       memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
>   
> +    memory_region_init_ram(&s->ccm, NULL, "STM32F405.ccm", CCM_SIZE,

Including the machine name in the memory description seems a bad
habit from old days. What do you think about renaming as
'core-coupled-memory'?

> +                           &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(system_memory, CCM_BASE_ADDRESS, &s->ccm);
> +
>       armv7m = DEVICE(&s->armv7m);
>       qdev_prop_set_uint32(armv7m, "num-irq", 96);
>       qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
> diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_soc.h
> index 5bb0c8d56979..249ab5434ec7 100644
> --- a/include/hw/arm/stm32f405_soc.h
> +++ b/include/hw/arm/stm32f405_soc.h
> @@ -46,7 +46,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(STM32F405State, STM32F405_SOC)
>   #define FLASH_BASE_ADDRESS 0x08000000
>   #define FLASH_SIZE (1024 * 1024)
>   #define SRAM_BASE_ADDRESS 0x20000000
> -#define SRAM_SIZE (192 * 1024)
> +#define SRAM_SIZE (128 * 1024)
> +#define CCM_BASE_ADDRESS 0x10000000
> +#define CCM_SIZE (64 * 1024)

Since the CCM_SIZE won't be used elsewhere, we can simply use '64 * KiB'
in the memory_region_init_ram() in the source file. Up to the maintainer
:)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

