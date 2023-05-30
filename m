Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2306269ejb;
        Tue, 30 May 2023 09:43:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:e13:b0:64d:42b9:6895 with SMTP id bq19-20020a056a000e1300b0064d42b96895mr2923303pfb.5.1685464999013;
        Tue, 30 May 2023 09:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685464998; cv=none;
        d=google.com; s=arc-20160816;
        b=jp9QVDMfPb1zHWfy7VBgu/PKSx5tlCxS/SClSl6XxC5IfX2JVDaJH5WUwOs0BDSHir
         e4z9NMYBlMF6FY46yZA6AAn1DaioWwdMYJ6M9ZHM0Ybo3CFQkpwlkBRmgaozYDVS88oQ
         nk4nnQhTXSBSa/j0nSYl+kyTG8F5gDMswYsgnvztLmCegrb6AO39Qz0uwZke78QJCpMb
         g+pCg91nUPbecgpq4SgemyqSWEBaRjYClZqaalScVencXvmQy0TzNbbyUtQ5YEHFlhXv
         2MVn1x8wigT5ILUYHhL08HsxcJboviW63YrGET3YSYmwio7/y4Kvq/6b/L3rC1Ez7Aya
         WY5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oYKKJcIwvA4BWnLLgBDLEIzM820+dq4uOyDbON7XXKU=;
        b=Y81jOk+Ci11owkvEV6TTjkzSj6iOG541FvIruu+gKHhccZXn8+n2kgebbu1J/8R4PD
         nqoqCeylt7PZYksVDSw/kR3s5KkL16sEsiFVePykycf89ssJyfpO0m4QQ14OdRZoA997
         WYSyaKpdJT94OqNWxu/QDOzd2o33FNWg4+DTouMt5KxgzM0DAf3Eda/KtmZ1UUwuE9h/
         x+LkhAglBiB7ZBZSAV/BQSYyXTsZQKfRIux0kcn2TM7gSBuL/+hXvNVGtISCJPg8LzWX
         z8hbCexzzMlVHoQIt9XLzSViZHEeBn+8GfRvxy1aFpfsbBR0k3EZei826EZwp1nFLEMB
         XETA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i5SRWzHP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ck4-20020a056a00328400b006410a66a48fsor968833pfb.0.2023.05.30.09.43.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 30 May 2023 09:43:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i5SRWzHP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685464998; x=1688056998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYKKJcIwvA4BWnLLgBDLEIzM820+dq4uOyDbON7XXKU=;
        b=i5SRWzHPQKGUyuk36MzU9rgQNREpMs8QyJMK7O7Z2jGauIzfdiSCrE288HJ5oTk/M5
         BU/BlDxKVUQ2SoT/qNsHeuY2t9s1DIg4AEU28CkRApqKYLBrRNAPzZ6f5fyszG5JzmDI
         w/gBMjnFsUCdRUS1zf26TBUO2LF2pauYhMMcX+7aug85UgCy0xp3ld8l3ReP5EENs+c1
         hh/U9mCwiQu046vtBsard9bARB1SCPfSw+GDMwCZuRFsBk5tPzZWloB+OHuUccsrozSw
         aETqYboCwuybknJH9qpGIZw2lW52sIVUXTNM3PrbRr9rys4YbzgHfUrMrG6Pp0gw+XJp
         +05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685464998; x=1688056998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYKKJcIwvA4BWnLLgBDLEIzM820+dq4uOyDbON7XXKU=;
        b=UdDjDblmmbvz3e7ULnpbBwFuTsx2VttmfVFN0g+BzL7MjRxbbWZpgLbzMGsfMUdbOB
         mn14qt84/yALXUORn1aUXtxOOm2rHjY9KnxuQ+Yew5+hMd0qY/DDG8cDF5wyhWSzXAn6
         yIZtwa+cGcHLUUIPMk1I9r4WYZ87/voxAsSIgB+ZFPHgs67rMIEtbDWlaDyJqiGw+P+H
         1qs7dPmVQXrOmdq3NcAOxT6SpMEzfS0NyYUQiDBoKB5sku3WH42Dc9nDaBKRjTN/d8VF
         y1ZEH8AOv5ZDNe+nrngt/sXFTReaP5l5om6UUezisvG8em6p8vSz3Qa8W3dtPqrCS6TY
         Lfcw==
X-Gm-Message-State: AC+VfDyrP7eUgwBa3rMS2LVHrwQkFX4RitXlvduSWBOZtWHAEIx7GZPm
	B6UO8dPqnQ8LPaEG2Mvb37mMRCiU
X-Google-Smtp-Source: ACHHUZ7E7Pb8GWV1W/6bTp75RRwGIThf/2AjJxRYRQtE26mQfePfQif3f5J8n5ZIl1YF+oxVC7mZEA==
X-Received: by 2002:a05:6a20:728b:b0:f0:50c4:4c43 with SMTP id o11-20020a056a20728b00b000f050c44c43mr3248409pzk.5.1685464998462;
        Tue, 30 May 2023 09:43:18 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1598:4c01:35a2:c45d:7485:f488? ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
        by smtp.gmail.com with ESMTPSA id z5-20020aa791c5000000b0064fabbc047dsm1874032pfa.55.2023.05.30.09.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 09:43:18 -0700 (PDT)
Message-ID: <666b4b6c-380e-142e-9348-823006b35312@linaro.org>
Date: Tue, 30 May 2023 09:43:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH] target/arm: use x86 intrinsics to implement AES
 instructions
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20230530135204.2903761-1-ardb@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230530135204.2903761-1-ardb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: rg5tERYU2N0K

On 5/30/23 06:52, Ard Biesheuvel wrote:
> +#ifdef __x86_64__
> +    if (have_aes()) {
> +        __m128i *d = (__m128i *)rd;
> +
> +        *d = decrypt ? _mm_aesdeclast_si128(rk.vec ^ st.vec, (__m128i){})
> +                     : _mm_aesenclast_si128(rk.vec ^ st.vec, (__m128i){});

Do I correctly understand that the ARM xor is pre-shift

> +        return;
> +    }
> +#endif
> +
>       /* xor state vector with round key */
>       rk.l[0] ^= st.l[0];
>       rk.l[1] ^= st.l[1];

(like so)

whereas the x86 xor is post-shift

> void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
> {
>     int i;
>     Reg st = *v;
>     Reg rk = *s;
> 
>     for (i = 0; i < 8 << SHIFT; i++) {
>         d->B(i) = rk.B(i) ^ (AES_sbox[st.B(AES_shifts[i & 15] + (i & ~15))]);
>     }

(like so, from target/i386/ops_sse.h)?

What might help: could we do the reverse -- emulate the x86 aesdeclast instruction with 
the aarch64 aesd instruction?


r~
