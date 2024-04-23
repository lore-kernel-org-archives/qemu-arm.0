Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp188688ejb;
        Tue, 23 Apr 2024 14:19:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0dPJcnp2O0dIx7Hz5PN4Vz0hoz9qRghNIEx1VlxAM207an6QL76vVj5JeUNUKfIn66Tb1k9LMnnMHuluX3uv4mDXoo73R
X-Google-Smtp-Source: AGHT+IEhc7gb5oo8GoGo4qIH26WDSHqWGpn4LbYFU8yFqZ8Bm5jABlMNzbN41Q20Ck4RIdYzuHLZ
X-Received: by 2002:a05:620a:1a08:b0:790:5e59:c712 with SMTP id bk8-20020a05620a1a0800b007905e59c712mr829195qkb.3.1713907172889;
        Tue, 23 Apr 2024 14:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713907172; cv=none;
        d=google.com; s=arc-20160816;
        b=EBWjrdyNa/hjX10TgbHqgfVNbz6/UMnADGSWHYXaxSIt+2HBvKXZ48RhyUoOQt76Cb
         0QO2UAPTbfowBTeeFJaDm5yiPTpUjxZfcP7ZOQwTdHPUpQOq22+GuWSynx291HWwFNum
         b+cZdwM5AWM0MCtovV+S12mLHyLfGSCSj8GAn7ueEP49Q9sUSWR6aAlOhwr9vWhjlB7+
         cgMgh8GfmuljeGYKt2p14ZG+SVfHMX6MNd3Pduesk31E015NSFYuEsn4I9di29qdVDoQ
         hPqVCDjZWoPRJeMaA1yWfIXPBl8cUm9fJOePmLzZDZFIMVkTmAuRU8zVGs9JXGi7MtOH
         YIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HFw+OdKdBqF7hH7LaA4LY0DEgVmFb8k1himgrIYg2oc=;
        fh=GQwEoSPW6iwcusIGy9dcgIxBl9UP8XLFmvil8YIKdrs=;
        b=YC4xHFT1Q82oom3ertfoy2kU2XRRo6gCiylTMmoDGivKYJwHjs9oZbTYHopJZarfEF
         Bhi4hibwVvdx1zn10oOKN4Y2FARbps7QpAFaOykJMrKEZinOD5gnO+QRl56uHwkjcvp2
         8dGbkwBKzsZFLI932htVWh18IFG4ZAqnfEhonYWRuX7AehE23yNx5HbETcgld6peC3Rn
         vwyG8JVTd5YH3zNMNJIH9OF9fZ50IDCaL9qD0jDCGBLea1EkW+1NxX1l2Nnc6fkhDGzc
         t9XX1YPTmC15LEmQoLQV71YsB/mEAxqE2+AnN6EGy9GpNQhipTVXsvTsAJsHOQgQg3Dk
         2RTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PTsFOLP2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wk12-20020a05620a578c00b0078ec559475esi13261040qkn.750.2024.04.23.14.19.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2024 14:19:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PTsFOLP2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzNXb-0004AG-9o; Tue, 23 Apr 2024 17:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzNXa-00049x-PJ
 for qemu-arm@nongnu.org; Tue, 23 Apr 2024 17:19:02 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzNXV-0000Zd-Sm
 for qemu-arm@nongnu.org; Tue, 23 Apr 2024 17:19:01 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-571be483ccaso7338066a12.2
 for <qemu-arm@nongnu.org>; Tue, 23 Apr 2024 14:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713907133; x=1714511933; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HFw+OdKdBqF7hH7LaA4LY0DEgVmFb8k1himgrIYg2oc=;
 b=PTsFOLP22+cV4S9Uds9sfAnY28h3BhvPFR9B07qZnac+5G60W5msJ5xA2al5kZYZS/
 ikcBEVhBnGSDJy7V0IDyhVOiQuxr2qo8k6+MlbOayX+pzp/LKwxKETXugyoXcL8ncxwg
 fe1cQWsxpsXhxhR15jqcS77H9MRtkMp+6y14E6Zyn1YOHNey9pnMSi/Wxndbgq5wMFUe
 Tp0rczK5UTzSqPHxMGBpBU8lwKiBrCqt7/vP+bLSFAmUV6OQ/4/oy5CNYijetP5qKN3O
 Eq+KeX3T75lv86E1uJtb7MD2ZDvERBu9rUDKIKkU7NvEA5PC87hwkfOkGFlknnxTPCZa
 DOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713907133; x=1714511933;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HFw+OdKdBqF7hH7LaA4LY0DEgVmFb8k1himgrIYg2oc=;
 b=NmRk1FswhLDlYucifxRghv+9Mlmnf1D6LWjQbwbfQ21K6qtiLwTsp58S32zgsvWJLw
 uANNfLayAd/ww0/syiMZjvt0EVFVUcLBFaBsnTuSk438pg47vphK48VX8W4VN4lEUAss
 +XIXMib3AGzWzdyrVt/ID0lcnL8Wukk/WkODUdQTe2HuqDB0tYYU2U0JK28oRtG2kRjH
 RcVpZf+9jJZMml508CkCm7OG/ft9iwIX23vKmMak8sL1Gc1Ak7qTqW0eHu8R1JKj12bW
 PLXRSF1sAf+3C0EAiCGGidHmE3C2d/gCHXQyxxxQ9/J8bWPJO3/DPTeGL7bDfLh7rNYt
 Mo6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzjmLcGP7bpPKe6xRBA3FeYDyaamUNv4RM/2xbYUlTt04erVuxD5omyLMX7YEOvZoVza7B+SYp8LhwwwYg3b770AV/
X-Gm-Message-State: AOJu0YxcLzp79AnuJNU8GNWy5ayxXXkZd981vFhS6YO+NMI97g/0yTrQ
 X2nQxAbydLfpIcdMR3cjctceH7V5kPoiYUqC4W3kMPKUShscZE/q+w9mbaFkKWY=
X-Received: by 2002:a50:cd0f:0:b0:56e:2493:e3c2 with SMTP id
 z15-20020a50cd0f000000b0056e2493e3c2mr319795edi.37.1713907132878; 
 Tue, 23 Apr 2024 14:18:52 -0700 (PDT)
Received: from [192.168.69.100] (pas38-h02-176-184-5-107.dsl.sta.abo.bbox.fr.
 [176.184.5.107]) by smtp.gmail.com with ESMTPSA id
 u15-20020aa7d0cf000000b005704b18ed2fsm7029329edo.83.2024.04.23.14.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 14:18:52 -0700 (PDT)
Message-ID: <169a6afc-2dde-414e-a88b-04587722a530@linaro.org>
Date: Tue, 23 Apr 2024 23:18:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] hw/display : Add device DM163
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Samuel Tardieu <sam@rfc1149.net>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240421140604.111262-1-ines.varhol@telecom-paris.fr>
 <20240421140604.111262-2-ines.varhol@telecom-paris.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240421140604.111262-2-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1w3VX2gD3TD3

Hi Inès,

On 21/4/24 16:02, Inès Varhol wrote:
> This device implements the IM120417002 colors shield v1.1 for Arduino
> (which relies on the DM163 8x3-channel led driving logic) and features
> a simple display of an 8x8 RGB matrix. The columns of the matrix are
> driven by the DM163 and the rows are driven externally.
> 
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   docs/system/arm/b-l475e-iot01a.rst |   3 +-
>   include/hw/display/dm163.h         |  59 +++++
>   hw/display/dm163.c                 | 334 +++++++++++++++++++++++++++++
>   hw/display/Kconfig                 |   3 +
>   hw/display/meson.build             |   1 +
>   hw/display/trace-events            |  14 ++
>   6 files changed, 413 insertions(+), 1 deletion(-)
>   create mode 100644 include/hw/display/dm163.h
>   create mode 100644 hw/display/dm163.c


> +static void dm163_propagate_outputs(DM163State *s)
> +{
> +    s->last_buffer_idx = (s->last_buffer_idx + 1) % RGB_MATRIX_NUM_ROWS;
> +    /* Values are output when reset is high and enable is low. */
> +    if (s->rst_b && !s->en_b) {
> +        memcpy(s->outputs, s->latched_outputs, sizeof(s->outputs));
> +    } else {
> +        memset(s->outputs, 0, sizeof(s->outputs));
> +    }
> +    for (unsigned x = 0; x < RGB_MATRIX_NUM_COLS; x++) {
> +        trace_dm163_channels(3 * x, (uint8_t)(s->outputs[3 * x] >> 6));
> +        trace_dm163_channels(3 * x + 1, (uint8_t)(s->outputs[3 * x + 1] >> 6));
> +        trace_dm163_channels(3 * x + 2, (uint8_t)(s->outputs[3 * x + 2] >> 6));
> +        s->buffer[s->last_buffer_idx][x] =
> +            (s->outputs[3 * x + 2] >> 6) |
> +            ((s->outputs[3 * x + 1] << 2) & 0xFF00) |
> +            (((uint32_t)s->outputs[3 * x] << 10) & 0xFF0000);

Alternatively easier to review as:

           uint16_t x0 = extract16(s->outputs[3 * x + 0], 6, 8);
           uint16_t x1 = extract16(s->outputs[3 * x + 1], 6, 8);
           uint16_t x2 = extract16(s->outputs[3 * x + 2], 6, 8);
           uint32_t val = 0;

           trace_dm163_channels(3 * x + 0, x0);
           trace_dm163_channels(3 * x + 1, x1);
           trace_dm163_channels(3 * x + 2, x2);

           val = deposit32(val,  0, 8, x2);
           val = deposit32(val,  8, 8, x1);
           val = deposit32(val, 16, 8, x0);

           s->buffer[s->last_buffer_idx][x] = val;

> +    }
> +    for (unsigned row = 0; row < RGB_MATRIX_NUM_ROWS; row++) {
> +        if (s->activated_rows & (1 << row)) {
> +            s->buffer_idx_of_row[row] = s->last_buffer_idx;
> +            s->redraw |= (1 << row);
> +            trace_dm163_redraw(s->redraw);
> +        }
> +    }
> +}

> +static uint8_t dm163_bank0(const DM163State *s, uint8_t led)
> +{
> +    /*
> +     * Bank 1 uses 6 bits per led, so a value may be stored accross
> +     * two uint64_t entries.
> +     */
> +    const uint8_t low_bit = 6 * led;
> +    const uint8_t low_word = low_bit / 64;
> +    const uint8_t high_word = (low_bit + 5) / 64;
> +    const uint8_t low_shift = low_bit % 64;

FYI note the BIT* macros in "qemu/bitops.h" (but you'd need to
use arrays of unsigned long instead of uint64_t).

> +
> +    if (low_word == high_word) {
> +        /* Simple case: the value belongs to one entry. */
> +        return (s->bank0_shift_register[low_word] &
> +                MAKE_64BIT_MASK(low_shift, 6)) >> low_shift;
> +    }
> +
> +    const uint8_t bits_in_low_word = 64 - low_shift;
> +    const uint8_t bits_in_high_word = 6 - bits_in_low_word;
> +    return ((s->bank0_shift_register[low_word] &
> +             MAKE_64BIT_MASK(low_shift, bits_in_low_word)) >>
> +            low_shift) |
> +           ((s->bank0_shift_register[high_word] &
> +             MAKE_64BIT_MASK(0, bits_in_high_word))
> +         << bits_in_low_word);

Splitting this (assigning intermediate variables) could benefit
code review (see earlier suggestion).

> +}
> +
> +static uint8_t dm163_bank1(const DM163State *s, uint8_t led)
> +{
> +    const uint64_t entry = s->bank1_shift_register[led / RGB_MATRIX_NUM_COLS];
> +    const unsigned shift = 8 * (led % RGB_MATRIX_NUM_COLS);
> +    return (entry & MAKE_64BIT_MASK(shift, 8)) >> shift;

Or simply:

       return extract64(entry, 8 * (led % RGB_MATRIX_NUM_COLS), 8);

> +}

Anyhow, I only gave nitpicking comments to improve readability,
model LGTM! :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Regards,

Phil.
