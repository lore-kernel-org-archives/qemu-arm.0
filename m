Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp802111ejf;
        Fri, 23 Feb 2024 12:35:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVrC6RjbMu4PCPnfIpSzQAob6cMHZh2bcQp0VcZT7I15iQusiDmocnjJflxk9NCZdXxesYeuplCkv5ACr3jMTeD7zxBFJlT
X-Google-Smtp-Source: AGHT+IFjUpYtt1XuTCGVvVa0xWl079pxh2Y3W481iq/JuehcvkF3Iu6uyxSndP5Nx5a3x28Rm0fb
X-Received: by 2002:a0c:df92:0:b0:68f:6e4c:f6dc with SMTP id w18-20020a0cdf92000000b0068f6e4cf6dcmr790442qvl.61.1708720507765;
        Fri, 23 Feb 2024 12:35:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708720507; cv=none;
        d=google.com; s=arc-20160816;
        b=TdIg0RuUCaWZ/zfzuYCZZQ5bAJRkjmPi9y0XI8FS7SgCuE6K2kH59Kc5G8HRaqVn+v
         MLvoa7Qroo1HZg5GoQaL+IF7cxBOyqyxRYwqmUlkWzEppyqNJbIUR/cohGAPDaD0K761
         s9RujGij6+LPxMYqgiL+2ffw1cgl6O5aQC6oiWhlD36Z+ktCAs7dYoYjHtZHzMVpfRoi
         xgb6UGVU4MF+UYZFCQqWWY8/YzAIrbZCNDFdCeVGDNf/ITHWNaqp5G5AI6acgIA5BgAO
         ljSH/g5erC4ZpDGt1rFgtC+2/vyCOUzmA+FVZ8fIuYDOl8cSUJsQHx3A5+Xrgj0SGcon
         o1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=I700NpAcGVLc6L+nJDp9JAzh6V9ItdFTitqNh9gY0Zg=;
        fh=CMtYrfsoZ1W6vRBJ4+aBvgGneyimRb9tJIt3ChD9CrA=;
        b=GmKtIIyqhIaMr3O6oiWixfXsoRFaB9VD8eW4J95so1Y9q4fYdPZlsTu57z6ekvbghD
         8e+QBCs77/WxvvhrUDZCdjEiSI+YDhDjbFEFUfMcMnvt7j2lzFUGDHDhT4W0lJFzeyV1
         glgj7UZm4lNyVbz9/DmGZXwigqIV1Nd1L/JSasxosyFo68HdP+mGSnfr/5x0oHqIchsN
         Y5E32RDYOkSwmE39xxnnmihUskEI4IgTlNw10/Mexp2vKSMrdGmNynf/HikmKs3fuDB+
         x9kTajUYVFlFtrmDy9iI/0SMQibeP0aaSN8nw6QsQfG5P1T04whKBKcI0PTqO8Cjp0Ul
         kjRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oItaXYxV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020a0562140dac00b0068f85ca0a1asi10342724qvh.231.2024.02.23.12.35.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 12:35:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oItaXYxV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdcFY-00008g-6L; Fri, 23 Feb 2024 15:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdbvu-0002zx-Eh
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 15:14:15 -0500
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdbvt-0005sU-0g
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 15:14:10 -0500
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-364f791a428so2695665ab.3
 for <qemu-devel@nongnu.org>; Fri, 23 Feb 2024 12:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708719246; x=1709324046; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I700NpAcGVLc6L+nJDp9JAzh6V9ItdFTitqNh9gY0Zg=;
 b=oItaXYxVYAcMC898XqkMWQN3mal/g0g1K9PH8V42U5KOvuuzJKoOP/aM5d+G+lGoNQ
 fw9Erl+xEsa7EvyGJAxKlV9tf+U9D2BZM4oS2g0x4eZP6iuLHVL39FfbQ4iChIFB9Uau
 plvzcY/rOhD3axSQVIV2iwJA6zEsh/g2xVDqoINhieLQu5yLyOXDRd2Cxu1kkxUmxNA3
 pq+B8O93DgyZuxeaAD/drOJInbJwkwPVONXgEhqExaztF1oX+jcO9FSC3A5gN216FUIV
 LGvooDWXkQAeBUn/fGSLvrwSOrmD55jy6D9WDicjj/Mod/gdNIjWNOUDOAAh8iUsB/Tj
 LMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708719246; x=1709324046;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I700NpAcGVLc6L+nJDp9JAzh6V9ItdFTitqNh9gY0Zg=;
 b=SDm0qpH8F9QiQCfzsJ+w1yeyrXpBODrEnbdKxatE/UNuPHaDSkI0SIiAMhqcECxdan
 nZtH7VQ1bC1Zh35nXgXtdr7yylC9OcaBO/omoHFbiT3IAR+vNSsHq2gk6fsmY2QA4rZ8
 fZCHksvkP7qZSSyQNZf97fI7BOJNr7UN6ZpS3jyifX/z4W+Ki5NiP6CMhWeqvsB3Jb64
 Xq2bP6LGVR4z145JI9AWESveE6fUYkEOnRhA3yQKzv47a8lISSKuW5DD5UETfyTMfPYW
 JL9x9Ev6SFmvdcANbOv2oEcBLpsS75H/syTAKLhItxtBEmBHWXuybgneRpFhn+aLAleu
 jlXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVGHSlbSioSNeSDJgZkXJSJ4n11ykFXL2CoHSys6teaMO776XrKz/lTvyrky2ffepxIwxF3vMavNmuzE6U9ANzs9vZ7CY=
X-Gm-Message-State: AOJu0Yw8OJD9hD2laaFrHHEqXGnr9PgpANUB1PKzDaXGhZ67ovl4YI/d
 Cbxh7CSl7YZp3eDDkAZuPh6lZekP/Q6CLg7syQSepM6kVVhDvX9wVgSKtIVQid0=
X-Received: by 2002:a05:6e02:522:b0:363:bb5a:3329 with SMTP id
 h2-20020a056e02052200b00363bb5a3329mr984256ils.1.1708719246654; 
 Fri, 23 Feb 2024 12:14:06 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 z28-20020a637e1c000000b005dccf9e3b74sm12361418pgc.92.2024.02.23.12.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 12:14:06 -0800 (PST)
Message-ID: <ca6cd116-8dae-4ddc-95ae-db19e18ae5b5@linaro.org>
Date: Fri, 23 Feb 2024 10:14:02 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 14/21] hw/intc/arm_gicv3_redist: Implement
 GICR_INMIR0
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
 <20240223103221.1142518-15-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240223103221.1142518-15-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cqRW15XoeDkY

On 2/23/24 00:32, Jinjie Ruan via wrote:
> Add GICR_INMIR0 register and support access GICR_INMIR0.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   hw/intc/arm_gicv3_redist.c | 23 +++++++++++++++++++++++
>   hw/intc/gicv3_internal.h   |  1 +
>   2 files changed, 24 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 8153525849..87e7823f34 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -35,6 +35,15 @@ static int gicr_ns_access(GICv3CPUState *cs, int irq)
>       return extract32(cs->gicr_nsacr, irq * 2, 2);
>   }
>   
> +static void gicr_write_bitmap_reg(GICv3CPUState *cs, MemTxAttrs attrs,
> +                                  uint32_t *reg, uint32_t val)
> +{
> +    /* Helper routine to implement writing to a "set" register */
> +    val &= mask_group(cs, attrs);
> +    *reg = val;
> +    gicv3_redist_update(cs);
> +}
> +
>   static void gicr_write_set_bitmap_reg(GICv3CPUState *cs, MemTxAttrs attrs,
>                                         uint32_t *reg, uint32_t val)
>   {
> @@ -406,6 +415,13 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
>           *data = value;
>           return MEMTX_OK;
>       }
> +    case GICR_INMIR0:
> +        if (!cs->gic->nmi_support) {
> +            *data = 0;
> +            return MEMTX_OK;
> +        }
> +        *data = gicr_read_bitmap_reg(cs, attrs, cs->gicr_isuperprio);
> +        return MEMTX_OK;

Clearer as

     *data = (cs->gic->nmi_support
              ? gicr_read_bitmap_reg(cs, attrs, cs->gicr_isuperprio)
              : 0);
     return MEMTX_OK;

> +    case GICR_INMIR0:
> +        if (!cs->gic->nmi_support) {
> +            return MEMTX_OK;
> +        }
> +        gicr_write_bitmap_reg(cs, attrs, &cs->gicr_isuperprio, value);
> +        return MEMTX_OK;

Likewise,

     if (cs->gic->nmi_support) {
         gicr_write_bitmap_reg(cs, attrs, &cs->gicr_isuperprio, value);
     }
     return MEMTX_OK;


r~
