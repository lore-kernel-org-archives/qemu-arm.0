Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp400742njb;
        Fri, 7 Feb 2025 10:34:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWJexCazYV6ho/95e829D+Zukzu2yy7GxGDgBiZs6WdcP/9tjpo0/NDTSFepOr8fTfCrGT2jHjaBx7bdA==@linaro.org
X-Google-Smtp-Source: AGHT+IGDClpWKgSfsmu6LzkwvinFiLlJIouRZyfxIzbhM+yXdFcVxK2b2XjUrOwX4bn8I31yfgHE
X-Received: by 2002:a05:622a:260b:b0:46c:82dd:9a64 with SMTP id d75a77b69052e-47168917a72mr64516891cf.22.1738953297022;
        Fri, 07 Feb 2025 10:34:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738953297; cv=none;
        d=google.com; s=arc-20240605;
        b=Ax2MObbspRn0PCYrWqcjHvIIht6F++1GYJ6hw7queBnoRs1rzbRdgEb+yZ7W+5j04x
         LPEsNtT4vDX/M4Kk4SI+i1UCKRphoUKALsdGVKauEzxrN68oqRYvNUVYP4Alb7iBYmpJ
         38/rgRiWqRKK2r/aBTJZFwRElFxXVdKrPg0L0RSba29Vmw9AwNhnKkwJ9+OVYdfdX6ok
         VxtCA+cNttFTttWhktNi9/qo2uzd+joY1uG12CqyaZLsSRx5SzMvTzuKIoGLg9AngTLx
         JrJnhOewESS7IjovKGPUmpmpC0ojbHnHkrIGGERXArmMW6VQxTM93k7ePP7ExhMJRKms
         digQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=scCLt4lohbE1AQx25ta1VXQZLYDsS2XoZD8uXI6vaAo=;
        fh=uHjdNY3fP2n9r8EqF6MBg8FNKMR7npWmW9M/G34CR2I=;
        b=PtAIYOVycUng+EOJ0thru/9ih03jxR2ADhYNz8rc8g1DtRdS8tZ0f2ORQNjmEf2w0U
         MuLA8NcAn4AXr1om4c2yxZIRQCE8nqWSwinFnlUDT91XO1AjMMU1f4BhZS4ua3Ygheww
         OgiKAfruCRLIDx51Z+Y0Av84pNvRGxJuHRnMad3eOICd9afqYMIXmVXTJ/F/XegRs92K
         zca6txY4w5b1ynv+GhIER1XOMg12ThrPE87exuQOSExHpd3RPC6RUmTVgF7Ga1oxDgUz
         yygbdswrC43yP7KrYheNAVfceTPCYaulhSNQTMNqzQuQ84aKV63qFD4O6HmCCJFLDFri
         r85g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B7inJ+fH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153b6f6a1si38072901cf.333.2025.02.07.10.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 10:34:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B7inJ+fH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgTBS-0003D1-Jr; Fri, 07 Feb 2025 13:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tgTBP-0003C2-E9
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 13:34:31 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tgTBN-0001vq-OL
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 13:34:31 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-21f4a4fbb35so26190685ad.0
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2025 10:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738953268; x=1739558068; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=scCLt4lohbE1AQx25ta1VXQZLYDsS2XoZD8uXI6vaAo=;
 b=B7inJ+fHYtyuznPGwfQ7/aVOPzrVXJsRymBTl1oV5lWdzLbGAVpY/FjGEkJKHaRtsX
 A8XaxqlDZIOphBKV5baDiF+1EvOM/ZlQCTk4FMSo2DbASWyt9Q4nNVkLShrI3F6FiS1T
 VfrJwrdRJLpMKjF13Uqzp+mmcL0Hf2bYymfSEhgNlLzyR+7JugWnEU4y496kVWM7wf7j
 u8frQSbyAkLF9HEVYtb8zNO2ib4WcudrhP0FytQ4GPTOv2fmXzTP/VGpcXPgwG/Yh6M1
 nKBaupVK9xRSL9NR9hCjDmeZUBOv8GkCKcqJOAfvdWCqGaQKdvNDYIjWC0CtXWkmzC0a
 cWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738953268; x=1739558068;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=scCLt4lohbE1AQx25ta1VXQZLYDsS2XoZD8uXI6vaAo=;
 b=sRNxMAPi1fZTslmglrYDXefcAZAhXt+VLNQJEWTiUB7yY2lWurTxcYzzBZuKJ27Bph
 ezizpROhYNYsBCJQJP1zwDyDNOX+qbAQisp0kaqi+Shy9/lFQ/NBsy5oqSsLetphFpsN
 Rbs8e9XpbOZWv7wX5/0nR+wVupU3yIOIv+9fjuoVCtSZLSIc6w+HCbQ2HI9uPGaGxvOg
 PgQvLi0+IgCNDIoN3wtulFgl1QOuFh0Gwwr43mo6VzMJ1Msz7VE6rPg3NA2sZ7JOslJV
 DpKOhSDpBJcGVkXawZAl5onxVC9JQdDWYzhbfk8TuXaUY6C7Tai0u4jO8id+IbGxmjfJ
 L22Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/PNtVRZo/1cQbMSiva5S2akOLqiX8gbZnpBIhStX3DTMlhILjLDYJIA4rxkV2dJoRnTO+KfCrQg==@nongnu.org
X-Gm-Message-State: AOJu0YwEqKt40U2YtZxBuSNPnrdyunEEXR2sBlWeuDWQrC5SUjn7B8fV
 2/G+sUGMDq9Wkvjdmmt8MPo6KjZ5Wibh3nMTb6PvFLNNcBW3F4feflAl5EdKoD8=
X-Gm-Gg: ASbGncunbJPmk+VYxq320kJFP7yk0OZDLJZ7tCbS8jPZe6ukXCqAGSc+mCB9laQL/So
 5OFYsykyivdRY9E7dAOJAqJluW8t4ZbY6T+wrAcFcXOcvq30MFdZPQSO2ool4C9pTSkkRLD05+q
 IovuZqEvlBdvQ5Aoi5aT4hP/MoDtJXBL1cHRppWuEIxZs1blNI5Lx5obedOfUlxO8Em0tkHeaR7
 HcqqodwMT8lLnXXK85NxJKptENyprZBMvUSEB3GUfIM7K8oqP+D26ejff21Hhew39D+pjJhaai2
 h/NN6dvsU0wJKTIpcJ5XhdAVY4FBxFVIkBBE7jnhQwzqWqJmJSV5BWI=
X-Received: by 2002:a17:902:d4c9:b0:21f:3352:8f64 with SMTP id
 d9443c01a7336-21f50158c3emr66489165ad.26.1738953268080; 
 Fri, 07 Feb 2025 10:34:28 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f36535f0fsm33991975ad.56.2025.02.07.10.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 10:34:27 -0800 (PST)
Message-ID: <997aeb8d-ffb5-43f2-a6f4-767e66a19494@linaro.org>
Date: Fri, 7 Feb 2025 10:34:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] arm/cpu: Add sysreg definitions in cpu-sysregs.h
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
References: <20250207110248.1580465-1-cohuck@redhat.com>
 <20250207110248.1580465-2-cohuck@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250207110248.1580465-2-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zJSW9qpkcSPI

On 2/7/25 03:02, Cornelia Huck wrote:
> diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
> new file mode 100644
> index 000000000000..de09ebae91a5
> --- /dev/null
> +++ b/target/arm/cpu-sysregs.h
...
> +static const uint32_t id_register_sysreg[NUM_ID_IDX] = {

You can't place the data into a header like this.

> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 2213c277348d..4bbce34e268d 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -30,6 +30,7 @@
>   #include "qapi/qapi-types-common.h"
>   #include "target/arm/multiprocessing.h"
>   #include "target/arm/gtimer.h"
> +#include "target/arm/cpu-sysregs.h"

The data will be replicated into *every* user of cpu.h.

> +static inline uint64_t _get_idreg(uint64_t *idregs, uint32_t index)
> +{
> +    return idregs[index];
> +}
> +
> +static inline void _set_idreg(uint64_t *idregs, uint32_t index, uint64_t value)
> +{
> +    idregs[index] = value;
> +}

No leading underscores -- this is not a freestanding environment like the kernel.
We must respect the system implementation namespace.

> +/* REG is ID_XXX */
> +#define FIELD_DP64_IDREG(ARRAY, REG, FIELD, VALUE)              \
> +{                                                             \
> +    uint64_t regval = _get_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX);   \
> +        regval = FIELD_DP64(regval, REG, FIELD, VALUE);                 \
> +    _set_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX, regval);             \
> +}
> +
> +#define FIELD_DP32_IDREG(ARRAY, REG, FIELD, VALUE)              \
> +{                                                             \
> +uint64_t regval = _get_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX);       \
> +regval = FIELD_DP32(regval, REG, FIELD, VALUE);               \
> +_set_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX, regval);                 \
> +}
> +
> +#define FIELD_EX64_IDREG(ARRAY, REG, FIELD)                     \
> +FIELD_EX64(_get_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX), REG, FIELD)  \
> +
> +#define FIELD_EX32_IDREG(ARRAY, REG, FIELD)                     \
> +FIELD_EX32(_get_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX), REG, FIELD)  \
> +
> +#define FIELD_SEX64_IDREG(ARRAY, REG, FIELD)                     \
> +FIELD_SEX64(_get_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX), REG, FIELD)  \
> +
> +#define SET_IDREG(ARRAY, REG, VALUE)                            \
> +_set_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX, VALUE)
> +
> +#define GET_IDREG(ARRAY, REG)                                   \
> +_get_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX)

The casts look wrong, and seem very likely to hide bugs.
The macros should be written to be type-safe.

Perhaps like this:

#define FIELD_EX64_IDREG(ISAR, REG, FIELD) \
     ({ const ARMISARegisters *i_ = (ISAR); \
        FIELD_EX64(i_->idregs[REG ## _EL1_IDX], REG, FIELD); })


r~
