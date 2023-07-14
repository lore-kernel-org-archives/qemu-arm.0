Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3843465eje;
        Thu, 13 Jul 2023 23:58:19 -0700 (PDT)
X-Received: by 2002:a05:6808:192a:b0:3a4:26d1:4a9e with SMTP id bf42-20020a056808192a00b003a426d14a9emr5580607oib.38.1689317899700;
        Thu, 13 Jul 2023 23:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689317899; cv=none;
        d=google.com; s=arc-20160816;
        b=SfTAzxAU4niFhtxLuwWU5NqUbhDK9SgRT869jqGl/9EegLK4BXebjDoabxCf+XFdNE
         MRJuENOBRHa4nh9gstnECoPGKcAt0bMVTSNfGsr0z5e4859iVGdWcib00l5ogs+FmqxN
         XXQGDq1JJizZDoW8mdSyujgzWiMYmpT2ZAaedUTVxwH0iF8EZfm4naf+VCiCk/hw2DEQ
         nkye12Q+/9XVgAqEi3N4zmrfY6gWxAy+dK1viJA5wSHk77pzU1Co5vF9zqTCH6WquYQu
         upp8OZVqgMT8y6DAGJq4cCuyekPbXjzxBcPmP0FyVy1v4QYV0HNBPRedq+lQoKoy4I8Q
         iRkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QmnCzcmepWJ9jFZ9N1npnKPGO126GU6O8MnKz9oa1P8=;
        fh=7xRdbyAJIZ4GsNLuMi8tzUCGyvR1ri+VlSyqfzUHa6k=;
        b=llJPFoHMlTTq1T3Df+GdpOgG9D2ZRokqsLT5vQPqD5KOfXM5E2sOePrIk4uvEndgtA
         Ed7AaVZBWG1XanICOHmqped5UM0799E8tjlFT8+SAbTG7mfufcUhFxsOyHRRzRWT/4D/
         iAEo6z9REC1XkDn8YOvZfNm388PW7rjGUzsz1MS3IUP6uk+FQYWBheKN4CSmHcwQIAgz
         sKfqjbz3YZxFpLw33D82RZ6gBTKHOJy2S/Pqi5WSe7B1IeHrEDjle8pPMoAlBBk1yL3c
         6VXWZlrj5UDN29Hl3RjoL9jnrHoBI5tvl8PfQwFv0IfFBpwi8gctZBcV9NZY1mmiPH1H
         D8KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dOhuEIrv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id fa8-20020a0568082a4800b003a429269c51sor4585088oib.0.2023.07.13.23.58.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 13 Jul 2023 23:58:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dOhuEIrv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689317899; x=1691909899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QmnCzcmepWJ9jFZ9N1npnKPGO126GU6O8MnKz9oa1P8=;
        b=dOhuEIrvXJMAeMxVhL1z3yCU+zLJQJnqaV0z0j9Z/098oVO6GCIFErpxbeGYlayCTQ
         klprQByUanBzCJ4Rn/RWCtC/WdyFmo4vn+et1/FSF/dCfb+IXl7af6Ap1Kp+Ubpqq+pI
         3cNrUQzdDQ1SaCdCCd4ET0sV74nd9m3RVspHLuzOpISbp4UTnjS66zGjnKbpv7v87JLA
         AupiWwxI9PNsy63VGUjrbxBlcrx2Mc/sgZJlcgpz0gtgTuYbm0tJgm2teSDLUxJMA6AR
         VIjzNg49D/IPWZNZGzg02ALbimV1v6bN/8tfI+XXQZqaylRK1mi5dZJORxN8y5HH+ob5
         TL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689317899; x=1691909899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QmnCzcmepWJ9jFZ9N1npnKPGO126GU6O8MnKz9oa1P8=;
        b=Rv3Rb2QTPK+dx5OTClfN60+yMndIk073hM2AaZQNmR9t50RD9nssXvlQUfzsRV+X2E
         N2UgbtvFFPvBOc7+K6hmAzw9+gTUzds2olWYP94QDH67KL1r0WdCaYvQi2zTcTkhd6yj
         8GcET3YCfgg3wXyeiW+lLLPS8Pbx1GqgNjTfNA8Ujj5o1C4WskPIyexSWdtt2Uf6zVXP
         fkdMW/UH/7irJWUVbCT7WB/u5HqAdW5PHR+VEnDlVMOs0XKJhE8cOsJEAWH2d/q4OXmp
         V3t//vjfpZmMXODAdUiR64Os/aP+bKRDpGNU+WNG6hFr3/N01raskZF+49iIpP7iAZMx
         dHvQ==
X-Gm-Message-State: ABy/qLb9smS98vd8P0lhEOpuDQGlyh0mvgfkmQwCyKUBl4+WY2saxmJj
	X1AzEZAgEu7y5gHG1/EOgPmHRXEW
X-Google-Smtp-Source: APBJJlH5Foh8SLcvIM95/uxkfGG/nmZef4Qb78O9MuADZ6W4DtPbJpf7m7iOVX54Ntz7jWK96ehbQQ==
X-Received: by 2002:a05:6358:99a8:b0:134:e549:50d6 with SMTP id j40-20020a05635899a800b00134e54950d6mr4726592rwb.10.1689317899240;
        Thu, 13 Jul 2023 23:58:19 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.149.227] ([172.58.27.104])
        by smtp.gmail.com with ESMTPSA id e23-20020a62aa17000000b00679fef56287sm6666817pff.147.2023.07.13.23.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 23:58:18 -0700 (PDT)
Message-ID: <49918fad-56fc-150e-bb9c-bd00dc67df05@linaro.org>
Date: Fri, 14 Jul 2023 07:58:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 06/11] hw/char/pl011: Extract pl011_write_txdata() from
 pl011_write()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org
References: <20230710175102.32429-1-philmd@linaro.org>
 <20230710175102.32429-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230710175102.32429-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: AD2YWpsQCAjv

On 7/10/23 18:50, Philippe Mathieu-Daudé wrote:
> +static void pl011_write_txdata(PL011State *s, const uint8_t *buf, int length)
> +{
> +    /* ??? Check if transmitter is enabled.  */
> +
> +    /* XXX this blocks entire thread. Rewrite to use
> +     * qemu_chr_fe_write and background I/O callbacks */
> +    qemu_chr_fe_write_all(&s->chr, buf, 1);

Not using length?


> +        pl011_write_txdata(s, (uint8_t *) &value, 1);

Host endianness error.  Copy to local uint8_t first.


r~
