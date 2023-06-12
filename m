Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp166254ejb;
        Mon, 12 Jun 2023 15:31:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ42MUwsLpYnI0zh/6gjoBdwI7FSgMx3oLysv6EUs7BeOlBKAaOVwH4rzojLcqurR/qfn3Vj
X-Received: by 2002:a05:622a:1991:b0:3f9:b57f:32fb with SMTP id u17-20020a05622a199100b003f9b57f32fbmr11210642qtc.68.1686609095378;
        Mon, 12 Jun 2023 15:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686609095; cv=none;
        d=google.com; s=arc-20160816;
        b=jlE9WrwC/VD0vyQv9npnwAMTzQ84KpPCAtj/+WCMKps7XRRlREXgddoNQ7fU6+3EzH
         7fOzGlVqa5MKkzD3j0R0JuG7wpqSEKN5flCyT+4jtILRLL+XWpxcpnXI7/dZvL1bDVTd
         56+UzAJGHfQZPIpmx9EHnQEUyih4lJ0q4UuXuyoDlOSTZfsW20iq5aCY5/S659ejTeXj
         BX4S73K3Vph/I5K390W3C2lk4VfuvAEJGC2RfCLk7TUf5J3GUhk+LW3TMHUzOYTKBI2i
         m5vzCINIVo/1G3abvTK8Af5rDrfC4XlpaLr/3LUjH3oUzx860P2wEES9EOObuLw1oZ5O
         +KUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tr/KRiX+6SzDsT1HgRQhYPL6bZhcCPkCG5AWun5VaoM=;
        b=qWGaFSpeSk3nkzdnmtqSbHpO1yKGhDu1GAsE8jEkR4YnBd7AbeqTQXMHzk923nIfVz
         9MUVrlUA2VK3TH0O1dKjbrN/z3U/z0mv2NAw70OodlgWfsF0q2N9SIH0fCp6IMvXP0wu
         YUNCJArbEe2SxLu4bjmnkVlJJTux7CQekAehkB+UqNztpEJEoPWpDdXd5vx6+V/au5iU
         gfvxeF8xjazmPu5TPrvpIZ4rBTWEZF6PvDQA9PtSMcd4gbBQV/d5vNStN6LQaAMtHN9K
         v2CGu9tVDaWBsE2KLX1STISZV3gQqWoBXfFZhRQ3YijRfdeHONMA5YKEZ2mxaIywUWBG
         Z9tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KHL7v8xR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10-20020a05622a190a00b003b86b6c1502si7058105qtc.225.2023.06.12.15.31.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Jun 2023 15:31:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KHL7v8xR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8q3y-0000cQ-S0; Mon, 12 Jun 2023 18:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8q3v-0000by-5C
 for qemu-arm@nongnu.org; Mon, 12 Jun 2023 18:31:00 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8q3s-0007DX-J6
 for qemu-arm@nongnu.org; Mon, 12 Jun 2023 18:30:58 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-977c88c9021so800781666b.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jun 2023 15:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686609055; x=1689201055;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tr/KRiX+6SzDsT1HgRQhYPL6bZhcCPkCG5AWun5VaoM=;
 b=KHL7v8xRJE90HXXASdyOxJIVSXJ6PXsxC0Mip80YOsmQnCYhKSi0bWNl2qD5X5RFU/
 9PDZpwHKbEVU46yKVz91GmQ9e3mc37fs3uOV2L2yS9tgooUKzNztYTKqL4PXsEVVTiOo
 fIb4EAvITid4isL/e4dt0TDyxQNZYWxM9t5ve25GSWETz2lV6FfWVZIcgoQO++AYnOY3
 wIe8wFRLTFiolcr/nXlLuIm67KXSgWv67x7DH2YzQapSX/K7qYAhaqJwcCBsCrmtX6K/
 k37vla+jMDugehiPD01oBaaolPDfEKiRU27DN95uPquxdZlT3/JYBstBe6V8afKsxpWd
 TM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686609055; x=1689201055;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tr/KRiX+6SzDsT1HgRQhYPL6bZhcCPkCG5AWun5VaoM=;
 b=hAmzT0B9hjMCCxTqMGLI3EvHUsl/Jf1qgxiUE97vyhkJOT8hRnkGgKLbSfgaxF+Nyq
 h2I6QV8xxmzVFdfRNg6bUjb4bxvGaRMf2XX4mdeO2owt/Y8PHNYGMFrvAsVQJ1OGuHL/
 foPUGHnCwvRnXQh+ZvtF4j8gur6wew2asMN9qkQx8CWxU+82Sd9KIwMoWXU5EPJqTMFD
 E7yUUT3rmkt/4gkZVuiC0iP3WPdv9NZCu2szMh7AGBmPsSwMm+sN2IoraPHhPfxvKCLj
 91oxgVBBFdjDzmdbivGKJFOZ8/RkgjOHhSl/T6xPDghRbEKNEByVLanLGe3MqglvY8gW
 oTtw==
X-Gm-Message-State: AC+VfDw4/zeI9czZZA5jHuP6O0Je1RqwwITWfR6i6FjBF4SpN17x4vL2
 rcyfg9KzVIkrYj2cHKEjqiC0TQ==
X-Received: by 2002:a17:906:99c1:b0:973:ca9c:3e43 with SMTP id
 s1-20020a17090699c100b00973ca9c3e43mr11771630ejn.45.1686609054558; 
 Mon, 12 Jun 2023 15:30:54 -0700 (PDT)
Received: from [10.10.0.115] ([185.140.244.249])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170906710f00b009745bac0567sm5675048ejj.126.2023.06.12.15.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 15:30:54 -0700 (PDT)
Message-ID: <6fe833be-d884-663d-a58e-d3716e52e3d9@linaro.org>
Date: Tue, 13 Jun 2023 00:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v2] Use named constants in BCM props
Content-Language: en-US
To: Sergey Kambalin <serg.oker@gmail.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Sergey Kambalin <sergey.kambalin@auriga.com>
References: <5b407848-2a4c-6447-6726-cf85f278f3e7@linaro.org>
 <20230612115950.5002-1-sergey.kambalin@auriga.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230612115950.5002-1-sergey.kambalin@auriga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: i1IsL+lPpDdi

On 12/6/23 13:59, Sergey Kambalin wrote:
> ping
> 
> - PI_FIRMWARE_*_RATE constsnts were moved to raspberrypi-fw-defs.h
>    (seems more suitable place for them)
> - inclusion of "qemu/osdep.h" has been removed
> - year in copyright header has been updated
> 
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>   hw/misc/bcm2835_property.c            | 120 ++++++++++---------
>   include/hw/arm/raspi_platform.h       |   6 +
>   include/hw/misc/raspberrypi-fw-defs.h | 163 ++++++++++++++++++++++++++
>   3 files changed, 236 insertions(+), 53 deletions(-)
>   create mode 100644 include/hw/misc/raspberrypi-fw-defs.h


> diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
> index 4a56dd4b89..92a317950a 100644
> --- a/include/hw/arm/raspi_platform.h
> +++ b/include/hw/arm/raspi_platform.h
> @@ -170,4 +170,10 @@
>   #define INTERRUPT_ILLEGAL_TYPE0        6
>   #define INTERRUPT_ILLEGAL_TYPE1        7
>   
> +/* Clock rates */
> +#define RPI_FIRMWARE_EMMC_CLK_RATE    50000000

OK.

> +#define RPI_FIRMWARE_UART_CLK_RATE    3000000

OK.

> +#define RPI_FIRMWARE_CORE_CLK_RATE    350000000

Seems VC4 frequency range, adapted for raspi3 (BCM2837).

IIUC the VC6 (raspi4) is clocked at 500MHz.

> +#define RPI_FIRMWARE_DEFAULT_CLK_RATE 700000000

Seems VC4 freq for raspi1 (BCM2835)

Likely we don't want to use a default, but the correct per-soc
value...
