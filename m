Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2153129ejq;
        Mon, 8 May 2023 09:15:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6FYuctJ650uEx1TNgi+7fAJSCctwgEZRGqbwYEWmbiQHPp6rujVnUYb2J0Kvqx6PNeLqMh
X-Received: by 2002:a05:622a:1a27:b0:3f0:b57b:3714 with SMTP id f39-20020a05622a1a2700b003f0b57b3714mr16979262qtb.56.1683562534336;
        Mon, 08 May 2023 09:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683562534; cv=none;
        d=google.com; s=arc-20160816;
        b=uFKxY9kkZgMhep5uKnyjJQ+MQ1+deJpbCEbPDXM7E57D67IzpuD/39QO9M9f/sjxq8
         gbQLKqZcC6Glm6LtEgYicm0k2jGqOrIwh8CNS0oS3GJK1ti8sGrF5/VUvmwgeL1vKEmK
         Unkw+GJ/eHhYcvzAmcczhaFaYC3C3n9SYSMEcbtYgB1ZWi4TPJQQyK4tPc/CcNO4YV0t
         iCpvhnqbsF+CJ4S71JjWqYgOXHnmJVeV9y/rVgPFKmVTcOp4ko0ngYl4aU+3E8fz5/pv
         FbVaBuqlIuD7MNzC6EQx2SqVqPj3sr9899NgZt0tL/h1AFzOKXVFp83cMe4wJzA+5Alh
         ou0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5mj0ILx9D2Fcoo7Cz4Jz74MroLxEbqcUU9mXmi8udK8=;
        b=JD4eYuklYTYysgbnxLloAHGM+5zi2hE2cKCC9L48k0KirtPcG6joJIb6vd6qFEkmPA
         VjNy5HUZBwgepMS8Arxt8HtttIrEaPjC+ngma3zka4Td0tsHK7YbTmTecV6ZgOPxIQFu
         HgfDZsoKmWMmjsrQ0AJiam37zzu96vxszU+a5QZl8dl5yOVi9fmzGp4xrDVZ8JTfD8dx
         lEbXjZcZpMSxwm9ei2ScGperOFc4J7JyH48RQ5/d1d3Zly0PTcUxyDIJKvr3hFGSvUM6
         com58drZ2prYzspeGCx7djciN8scJO2YkQRSp4aRKsg/9CzM35jDMSM2dxqOpiNMsrQB
         2CdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r6GTTCFO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10-20020a05622a11ca00b003f3875db680si1810563qtk.610.2023.05.08.09.15.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 09:15:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r6GTTCFO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pw3WF-0004Zd-TU; Mon, 08 May 2023 12:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw3WE-0004Yw-Q1
 for qemu-arm@nongnu.org; Mon, 08 May 2023 12:15:22 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw3WD-0000UI-3y
 for qemu-arm@nongnu.org; Mon, 08 May 2023 12:15:22 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f1fe1208a4so2407432e87.2
 for <qemu-arm@nongnu.org>; Mon, 08 May 2023 09:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683562518; x=1686154518;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5mj0ILx9D2Fcoo7Cz4Jz74MroLxEbqcUU9mXmi8udK8=;
 b=r6GTTCFOU+L/0d1zibWYQWWfdQx7LdScmJF7mhbhU+qap/Nn6N/Ka3BIZHBmyQYIdV
 frAdpSlfrz63IMSu2/LLthVu0mFc/pDmBh708XwL1kWUZ3LxOWfxn17o3ojyGFdCV5Qm
 Xnw0BbUumtQJXMcHams6YvKoTDbtFzfBQ64lDcn6oChFGVzkW/Yvo78AW39sGUTc0YV+
 P3vW64pkKEF+fS8XYGcLHshcrONtRB9SCozQyo0l+z0ADaJL3VcwDMQRpU0U9uNxvq1/
 O0VSHDlsqr2c4X3gBuqK91HEeKu1ilk+QWmG3ULDevvYTXpeCeqvo1kzBOVC1bycc4i6
 OMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683562518; x=1686154518;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5mj0ILx9D2Fcoo7Cz4Jz74MroLxEbqcUU9mXmi8udK8=;
 b=JeOBIbSIIcKZrdGSscpnHkkTjJ5RSrjTC9g0CyYLOU0QWrIotGE3j/JDpF3tgRYrik
 gJfGzY9OGMcoa43AWk3eBh4pHHE8N1d1/B3andZEvmdWzwcN7BEesDeG8NxGiLOuyd33
 gXoEe40jRs2rcSb+mhH50e8L/iChQ0hhYEmu8b0Be11jbMl9nAniARH/dV0QdAuM8eej
 vFZFGRm1g3ss19cIJdUMUsKrflua0CpqydvUXVoz435k0O6HkiSfBzlGuXfuU6D1orGI
 IIeGusIj/UYO7IfqH+rdo47y9Hd6TWTL14IKxLLsn2d+y+femNDS8U0ra2xZWuo7PFGM
 xlMg==
X-Gm-Message-State: AC+VfDxysN6VAKw0ggtzIwRR9zE8IauqZGVJK90qeb8omihNJhu5myZo
 iL81oHiG0gH3+Fhtdd8ebJWsrg==
X-Received: by 2002:a05:6512:38c4:b0:4ef:f583:ee16 with SMTP id
 p4-20020a05651238c400b004eff583ee16mr2350546lft.57.1683562517953; 
 Mon, 08 May 2023 09:15:17 -0700 (PDT)
Received: from [192.168.110.227] ([91.209.212.34])
 by smtp.gmail.com with ESMTPSA id
 q30-20020ac2511e000000b004cca1658a41sm30923lfb.300.2023.05.08.09.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 09:15:17 -0700 (PDT)
Message-ID: <8def4794-3eb1-39df-56f3-a5d1b577ec93@linaro.org>
Date: Mon, 8 May 2023 17:15:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 52/57] tcg/i386: Honor 64-bit atomicity in 32-bit mode
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-53-richard.henderson@linaro.org>
 <CAFEAcA8XQ2_GFyBCqW4N7p32dvkWe6B21bpHhOf48xHyc_petw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8XQ2_GFyBCqW4N7p32dvkWe6B21bpHhOf48xHyc_petw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: hY8QKiaCMQcI

On 5/5/23 14:27, Peter Maydell wrote:
> On Wed, 3 May 2023 at 08:18, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Use the fpu to perform 64-bit loads and stores.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
>> @@ -2091,7 +2095,20 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
>>               datalo = datahi;
>>               datahi = t;
>>           }
>> -        if (h.base == datalo || h.index == datalo) {
>> +        if (h.atom == MO_64) {
>> +            /*
>> +             * Atomicity requires that we use use a single 8-byte load.
>> +             * For simplicity and code size, always use the FPU for this.
>> +             * Similar insns using SSE/AVX are merely larger.
> 
> I'm surprised there's no performance penalty for throwing old-school
> FPU insns into what is presumably otherwise code that's only
> using modern SSE.

I have no idea about performance.  We don't require SSE for TCG at the moment.

> I assume the caller has arranged that the top of the stack
> is trashable at this point?

The entire fpu stack is call-clobbered.


r~

