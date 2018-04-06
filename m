Received: by 10.28.71.155 with SMTP id m27csp175676wmi;
        Thu, 5 Apr 2018 18:27:44 -0700 (PDT)
X-Received: by 2002:a17:902:bc41:: with SMTP id t1-v6mr24885708plz.56.1522978064775;
        Thu, 05 Apr 2018 18:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522978064; cv=none;
        d=google.com; s=arc-20160816;
        b=Q197fsGfZMGFAvfgn+SLqtFOS92jtmhno+q7DcWT+/HzQkP79EghfyVchtAc7ff4Nl
         xj4aVNyTON5EhODqw7D3/knqKUNXDe76+01rcttLj9/+BB+t4nVGbzGARXuYoVpNuyKb
         wQF2ukYU4OfTi7MVbx9tL+eibhlMgD5X7Y35basKEOEK6DL1hjnbaiFiebGcUUpU7/Uv
         m6blRx1aY+DAwUSqvo4AQ1yLBzfxjfDYnOY9hMFyt6SJ2EXxfw47PWYuy+C3lQxd99zl
         Xr61adt8tDLrh2gM2bVB5mqbPALqiwceo/L6fHybXrQrxNszPCOyFZy7v2HJ8aXJmDIc
         Tdcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=Mzq7SaMvnTcSuKXob7A4WqYiQAMlCcTOP+TJ+wq7k48=;
        b=pRy+VERb6CellyYw6asbEkQxgh6Ib3VUOrYj491gGjF6S3fT3NezMkmbqVUiAXLvir
         a0zdY5LMzS0xc42hB5rc/LCAjU8JbE/IE5XxKQtBzz9oDwR+nvsLWiTLBlkSKvQ/htZC
         jrL7RZB6ipQHOohMaOFMlU6R8yvfgZ7pDNnxp5PYv41OiTyRUhDwbpSvWAdUtMkkJaqV
         VKuiHWIW8isSk6RUVTRbs08r3QFU+51l1dECnRkken+4/IcQvJPfhJixWJ4NksOCvg84
         9MK3DifLs6JfhkeP7MDMDgRyTjscxq0YGQreOv1pF4O9GI5nwpCZUx7IN4frc/l2SMq1
         Z/Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i0FeYeIN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m12sor2011219pgt.219.2018.04.05.18.27.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Apr 2018 18:27:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i0FeYeIN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Mzq7SaMvnTcSuKXob7A4WqYiQAMlCcTOP+TJ+wq7k48=;
        b=i0FeYeINtnyLUgkgkp9yqdcRhY+z+CE99cou669xSlvMnINVnbAY9aC8Wf2HvHxUm4
         guYqymaaPtM599CufBXej7vJ4vNu1zQkw6yS65TunzXi+z4QL+6ETxw+u7WgL1ZwE01s
         9g6mW9ozphyrU8Ka4/T6RBOAOP7feT6WhRfQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mzq7SaMvnTcSuKXob7A4WqYiQAMlCcTOP+TJ+wq7k48=;
        b=YC0Tc1HCh2Q4x9eAIFaqYmu07/1ek0LaWQ9IanDxGpl0OjK8cALGgBEf+yBgB+dzUJ
         f7ZMT+DZw1eBURsuae7yMwW+d/6U8TyHUROxZ4DrlyyQPgWx2r0NBjIQd+afJ2Bjd9Ty
         zB8GyCEqGk/+VNXj92fTrBkf8BCFW04g6rJZxz1hz7flqqiCchAs8mXtYsgWPLu2gkTM
         nQUNK49++LrU/eS15WpGrLbDCkH2r7QAfVPwme5OZMfBNXo2PahL0tyXhda6t9l5AMKp
         TtG/MGjlJBCtUM51rf2nbi79p0jQqfesXLtopY2pKkUY32rheRzJpE1QWJeQfJs4Dq53
         VmYA==
X-Gm-Message-State: ALQs6tCqyeLAxo6G7G1TxQHwbekwxTS4n7PLjchAhe8SwTxtU98Kylze
	kLmIPoLnaACi4tXjhJJpE6JpagG3qMsngw==
X-Google-Smtp-Source: AIpwx49JA0fj6uwBAFWvt3pgkm81Slueu03qOJs2upSehgS3qUePgDRuitQUSNHf41q2NkZOcy2dxg==
X-Received: by 10.101.102.211 with SMTP id c19mr6031920pgw.78.1522978064329;
        Thu, 05 Apr 2018 18:27:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (2001-44b8-2176-c800-8cc6-2630-7d99-5ef1.static.ipv6.internode.on.net. [2001:44b8:2176:c800:8cc6:2630:7d99:5ef1])
        by smtp.gmail.com with ESMTPSA id v7sm11474843pfm.147.2018.04.05.18.27.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Apr 2018 18:27:43 -0700 (PDT)
Subject: Re: [Qemu-arm] [PATCH v2 06/67] target/arm: Implement SVE predicate
 test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20180217182323.25885-1-richard.henderson@linaro.org>
 <20180217182323.25885-7-richard.henderson@linaro.org>
 <87zi2kd4zf.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fd60ffee-7a2e-9815-c8ae-d7bcc355cdc8@linaro.org>
Date: Fri, 6 Apr 2018 11:27:38 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87zi2kd4zf.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: HkJRHsnfSqL3

On 04/03/2018 07:16 PM, Alex Bennée wrote:
>> +/* Set the cpu flags as per a return from an SVE helper.  */
>> +static void do_pred_flags(TCGv_i32 t)
>> +{
>> +    tcg_gen_mov_i32(cpu_NF, t);
>> +    tcg_gen_andi_i32(cpu_ZF, t, 2);
>> +    tcg_gen_andi_i32(cpu_CF, t, 1);
>> +    tcg_gen_movi_i32(cpu_VF, 0);
>> +}
> 
> Why bother returning a value from the helper to then spend time
> shuffling it into env->cpu_FLAG when we could do this directly? Does
> this aid code generation when flag values are queried?

It means that the helper itself clobbers no TCG global temps, and so does not
invalidate any of the guest integer registers that might be live in host registers.

The arithmetic above is approximately as efficient as plain moves, so I don't
see this as "spending time shuffling" per se.

> Also from above:
> 
>> + * The return value has bit 31 set if N is set, bit 1 set if Z is clear,
>> + * and bit 0 set if C is set.
> 
> So there is assumed knowledge in the encoding of cpu_NF here - maybe a
> reference to cpu.h where this is codified.

I suppose, sure.


r~
