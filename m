Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp355862lfu;
        Sat, 30 Apr 2022 17:10:29 -0700 (PDT)
X-Received: by 2002:a63:2215:0:b0:3c1:fd25:b6a1 with SMTP id i21-20020a632215000000b003c1fd25b6a1mr692230pgi.406.1651363829565;
        Sat, 30 Apr 2022 17:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651363829; cv=none;
        d=google.com; s=arc-20160816;
        b=RGdWe52pCHopCkRpvsD8dZiKLPZpj1v4rktACyxkqcGDmHAt1eFpzMUoPoenm0YOJ+
         mpLHqZAX+87a12Hac0/st5ISwh6uZ+0VJkIMAa+KqErUT6fEexIpM35SNTO4jQ41tm9C
         XGbeKcd570svxbTnl/PvRepAdlt1j7bggnPyZfobV1UBP/fZr1q2I1OaXTKO3AIDmutQ
         N3lli7sBxfJj9Fogb0HwJuBNnHy8673GPP/7jNtpRMpKih0NnJFXrJ21MOBMnDmKeI6N
         HCWyAQXuYcWnPq8P89NTukT3R/+07FGv6Rh/TByx02p4EYgB7Tc4u1Ujoudh8tHDPXF1
         dgDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UftRT56jgY+IMH+cE4HSGOtY4vSPK7FNsVF72hSXwkI=;
        b=dz3aFYXMypaaDntLOigN48X8oR9crgrw/KLBmoV408++5fCPVMR0s+cKaXheQ3mgob
         sa4ADHDexVor2T5iVDk5snJJiaLqrrB0Y0jtPPwdI01Kemdd17QZOIdLyC3bGd8XbzNH
         1s60yph/HOlDM3Vu9FYL0yBPykD2LZrjLCswkx0/0hMafXmrAuFxOV/kI6DgeLZIyK9I
         zPhmiFnr/jVlKK9qqLjsFuOJFaGJLreoZgk6mZWNgGdbkNLFFdz2kxUNB4t1XdmCeaD+
         GTQ3gHHZ4eUwchGVtFchVIH6eV6iKXHroFFvj0Ze5xrMa2sSM9tWwEZc18AkMMPQXVWA
         V9kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VIwlB/fh";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x21-20020a170902b41500b0014fe9289981sor4837099plr.49.2022.04.30.17.10.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 30 Apr 2022 17:10:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VIwlB/fh";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UftRT56jgY+IMH+cE4HSGOtY4vSPK7FNsVF72hSXwkI=;
        b=VIwlB/fh3V8cYzA0Z7PurEQ5Lc0dj3p+34OR7hNKh1IwnWQJwTa3HDUeeh1opSaulk
         hx6Z+LSYPoHgUzR6fRVL6DMSMhGB05MnCBUQnNGiIElPIcIsvY/CNL98YNUxo066jndq
         avMRa4tFXfea87xJVM4X7q4gIY/34eBqwyej5lYGv9sIZZebwU1/egCJ381nC6bpv753
         X/bBhXAXnd3kixzTMZkpOm2IzqAB3yAK1gzXnexrrQbZW5YCIeUCawyy57c7WUrgchqL
         Blu+SG9hgTVZvXIX4oHmNvpbPiemDrc/xJQBmxFue74j58noPmHZV84IhRDVYqD6iwQb
         FDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UftRT56jgY+IMH+cE4HSGOtY4vSPK7FNsVF72hSXwkI=;
        b=m3y7Bw9Ry4aeEDcwkJS8gETS2x1MuhNZehhkn5eQvGK4mT02kHNeXa6KtBBIg0DLQ0
         abMQ6iZHcvWUFCJId/Ug0uLHklb5LbyTD4KgIq1Xetwh7UMIKVHE/3hvKM/cbDL7DBXg
         LnVdBIQyPGy0MD7BOpLkGW8FIYzllYtLdvbEL0/nzJY75K8DGA5sFaJbbbIv8tl8QP+L
         TVPxVcui5/46jtxUHgPcOmnxnjlcrSJOLJ1WwCZw7xSS7M0/sC3FKwA6dNu5XVOGjvHp
         Hdp35KB0YlrT2miZTRZjwYU2j9nDdZ/EnA8whLpl+4AnUUEhAGxxsPyALF1Ie56DEHy5
         euUw==
X-Gm-Message-State: AOAM533GcqDNWY7V5VAQmA9pp0F2Tz8CaPxHHVaWO6Xj+L8o+DFhDl6A
	iHst+hawfPBh54X5QzYK9W7p4WaOXc21qvkH
X-Google-Smtp-Source: ABdhPJzjA0mfyxwku2IROuEagugQDBSD/UkOISbS1iw/jv3pJ+6XYPJ+/8NcQqMlSpq/gKrSh1yUyg==
X-Received: by 2002:a17:902:f64c:b0:156:4349:7e9b with SMTP id m12-20020a170902f64c00b0015643497e9bmr5484500plg.139.1651363829053;
        Sat, 30 Apr 2022 17:10:29 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.6] ([71.212.142.129])
        by smtp.gmail.com with ESMTPSA id x21-20020a62fb15000000b0050dc7628155sm2054282pfm.47.2022.04.30.17.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Apr 2022 17:10:28 -0700 (PDT)
Message-ID: <42effcff-0ef2-3e4a-be27-bcf359f1c2a1@linaro.org>
Date: Sat, 30 Apr 2022 17:10:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 26/60] target/arm: Replace sentinels with ARRAY_SIZE in
 cpregs.h
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-27-richard.henderson@linaro.org>
 <CAFEAcA98sjUhUccvEAjAWeK+Z7-HER9LDz6LMSFMNuVnBSPW=Q@mail.gmail.com>
 <20b109b9-81fe-e8df-bada-c3a0ce920c45@linaro.org> <87k0bht9fu.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87k0bht9fu.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: enK4lRBPskZ0

On 4/22/22 08:36, Alex Bennée wrote:
>>>> +#define define_arm_cp_regs_with_opaque(CPU, REGS, OPAQUE)               \
>>>> +    do {                                                                \
>>>> +        QEMU_BUILD_BUG_ON(ARRAY_SIZE(REGS) == 0);                       \
>>>> +        if (ARRAY_SIZE(REGS) == 1) {                                    \
>>>> +            define_one_arm_cp_reg_with_opaque(CPU, REGS, OPAQUE);       \
>>>> +        } else {                                                        \
>>>> +            define_arm_cp_regs_with_opaque_len(CPU, REGS, OPAQUE,       \
>>>> +                                               ARRAY_SIZE(REGS));       \
>>>> +        }                                                               \
>>>> +    } while (0)
>>> Do we actually need to special case "array has one element" here,
>>> or is this just efficiency?
>>> Anyway
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> Just efficiency.  There seem to be a lot of these.
> 
> If you moved define_arm_cp_regs_with_opaque_len into the header as an
> inline surely the compiler could figure it out when presented with a
> constant i? The would avoid the need for the special casing in the macro
> expansion right?

I didn't want to expand the code size with so many loops.
Anyway, I'm dropping the special case entirely for v4.


r~
