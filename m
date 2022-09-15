Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp213460ejy;
        Thu, 15 Sep 2022 01:16:16 -0700 (PDT)
X-Received: by 2002:a6b:6f0d:0:b0:6a1:1ee9:2d4c with SMTP id k13-20020a6b6f0d000000b006a11ee92d4cmr8557013ioc.206.1663229776000;
        Thu, 15 Sep 2022 01:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663229775; cv=none;
        d=google.com; s=arc-20160816;
        b=SgCtq5UY1Pm2U6+493Co/ODf/gP/JxF4De94pGNYjXTH1drau4pUX9fofo2NlVBqX/
         90T5E+56eil8Xqsrtap5QevH1iICSFlirevj7toFqBFO/+t7nWzBAH1FGz3JAJkBpitz
         aW5bOmDx1e3ehumqhE0vNh9IaCok8p2ffDiTqb7MITe6Zj07vHvMvtfaUOs+GPl+s9lG
         7fk/h1zcCGfvoxisbKuqH1Dyizg8mIT5kE5zVSY/r2qASh6Ql3o/WKBEFAipKDWHLwA+
         VUiSRLsppOTmlF+bTCxxMLoWeUO5zs25C1KreCi9lmk2ymhsbG6+x3C4fieEa1b7pooU
         0EBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tKKlnH5HP/sD3yLbjv2y4G50e4xRU+1fe4XOCijvhGc=;
        b=HXNvTq6SZDEwxahb1EnkE521BEjrTAe9GH78Hj/1+zJ96lxBe3rJYFtu7lBGocmuHR
         HkKkrVLzS5vvNPN6h98oE5Nz9Me8YICxBczZHJ4KPeHapxzhTsNKSIy2zPO9FXu7IP83
         JhBrtHelpy1SMnMIoSKtEjlLnJ58MG10vDYll43oDpIg+Cxf5An9cJRlR4HAXbRLzgPB
         XdekrwG3dVMh1xCrQrrNijFuQpytAVAemLT93qIil2ZG1aPEHTMQF7Tmep9RM+cy98A5
         4FV7Fk/Bo+kH6+O961bo+fz5/8/B7vZtMsITcc9szQBS39cGO7Wc7iB9LZ1sjoKhdMuf
         OcGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UzU2gF7I;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u24-20020a022e58000000b0035a33d274besor504916jae.38.2022.09.15.01.16.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Sep 2022 01:16:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UzU2gF7I;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=tKKlnH5HP/sD3yLbjv2y4G50e4xRU+1fe4XOCijvhGc=;
        b=UzU2gF7IZLNlVrTwio4LVvIrhFJJvVDANO4BfLkgtlMaBlRJjVnTJWSre/L1QCSE1N
         FZl5tKfoKGdgqlhKw5SkTgOr/NB7Fh13O3tRr+xIpkYeKfBQSrNRRXKFYobtyfEVDeIp
         NskBxdcaozXhayKBAz06PfmBURilVDw6XLDCgXQbdkFp8x8f8nBLak1RtmpdXYPrtMT4
         xwXfLtCJD6rd2dxN9/s93vUckvK0gabSQocRgA7Fc8FeW+f7+vy71qZlskFYZkyZ0MVd
         qyRqfuledbdSk9lOPzExVWiT1xOLa0RGJEyl3HaeivC7DYNag1MDo5STF6JaDnw+Pd3W
         wZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=tKKlnH5HP/sD3yLbjv2y4G50e4xRU+1fe4XOCijvhGc=;
        b=Grgt5dkt2JEp0sjiVIkxZL61gMg2pdHlBmyVw1SbqSEs0piqx4SaZ4/uJVcwsxHRYp
         DUg0rDeaDB7XGO486pciLiw9ZNzamZOjbqBmgWia+SxlMEdX2RbeF177T4szuJeN0PPk
         DtcGIsHFUf/7TwYxTb6Bx+88bbx/vzTsC6/vKHrHN38bBAyq6lRBCWQsBDkmn/qaIzxa
         iboL9yGK0fVEEeYrrZzB7E+yJlaStznwQhDr32e2oNyT/HZvfv+O4vgo25eBeebIOLeN
         XUM6pf/Oh+IfRm6+3WUdEddvlz9Qq/mqra6qJs2uNJasY4ughbKwm2IINicr/j6fLNSh
         40Nw==
X-Gm-Message-State: ACgBeo1QZiIR32GocIQsVsmNPie+SRabummmj+zqpj8RtWTAGvbOIfXL
	fFUaWcDGIvyndgq6yJaSeowBQqkDr1zK7Gzcw0E=
X-Google-Smtp-Source: AA6agR7vR+FWHBQKKQpyvIu7Mfw522rxWUnOLNsmlx509fs4LL6BI76XV0ZwLU8fBqk3V+1cTiwPWA==
X-Received: by 2002:a02:6386:0:b0:349:d0b1:bb7 with SMTP id j128-20020a026386000000b00349d0b10bb7mr21108183jac.172.1663229775653;
        Thu, 15 Sep 2022 01:16:15 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf? ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
        by smtp.gmail.com with ESMTPSA id q16-20020a056e02079000b002eb75fb01dbsm7695827ils.28.2022.09.15.01.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 01:16:15 -0700 (PDT)
Message-ID: <ab834948-3bd9-8e42-f13d-de0a3c573cf1@linaro.org>
Date: Thu, 15 Sep 2022 09:16:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 3/4] hw/intc/gic: use MxTxAttrs to divine accessing
 CPU
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914160955.812151-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: b16O0I7GP/JL

On 9/14/22 17:09, Alex Bennée wrote:
> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
> This solves edge cases like accessing via gdbstub or qtest.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
> ---
>   hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
>   1 file changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 492b2421ab..7feedac735 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -56,17 +56,22 @@ static const uint8_t gic_id_gicv2[] = {
>       0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, 0xb1
>   };
>   
> -static inline int gic_get_current_cpu(GICState *s)
> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
>   {
> -    if (!qtest_enabled() && s->num_cpu > 1) {
> -        return current_cpu->cpu_index;
> -    }
> -    return 0;
> +    /*
> +     * Something other than a CPU accessing the GIC would be a bug as
> +     * would a CPU index higher than the GICState expects to be
> +     * handling
> +     */
> +    g_assert(attrs.requester_cpu == 1);

Better without "== 1" -- this field ought to be boolean.

> +    g_assert(attrs.requester_id < s->num_cpu);

Do we still need the qtest_enabled test to short circuit the num_cpu test within the 
assert?  I guess if tests aren't failing then perhaps we don't...

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
