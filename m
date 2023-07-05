Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3626990ejy;
        Wed, 5 Jul 2023 07:45:24 -0700 (PDT)
X-Received: by 2002:a05:6512:3b0f:b0:4f8:5ade:44b5 with SMTP id f15-20020a0565123b0f00b004f85ade44b5mr13426545lfv.53.1688568324278;
        Wed, 05 Jul 2023 07:45:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688568324; cv=none;
        d=google.com; s=arc-20160816;
        b=TV+VwceIxTM4xZLOeZFb1V23bHpxKgjykva0Rvjdb1r+edbkqJNuJcRKzmBdJmhsX3
         jFS3bIPyGaSq+yIZ6SEKKc67Mg6203Ih0gEPovhZsqbnhFXggru+W0t+erTiCW4h250h
         qy89kPMW3NGjFs63pqRcrrJFi1Ghi5thF7g6I6pbLmXoVXKasGZBZwZOWDwl6W9UZxe8
         sqAQ7mz1F5cinOln4UvJXGcuxQIY0XnGavlz24Im6KO9ZF6/jNaNQOQLsgyF1RLp1IED
         B4THJmT6OHg4CixD1MCF7CoRcGgIJxixWj8rV3JBRxNOhibVr8jej46mnGr2jLn4g7+J
         DrWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Tl2AskdNCf03W6dDZ14SDintwMW6XEoJs3CByzgxNoA=;
        fh=IyHxBIV1HNtY9DtLymvZmkrRiEQad8bLsCFl9C45SM4=;
        b=Ccct/pbgkzDEMTPtquHEp/OYVreM6ICUhQpWev/zw0alWxsIfZZS6lL8fQnsHvwTtk
         J4SOSD3zagrbVYZkKH5SK0+toRrDXg3p4yggVSiEyMnp2/+06titexZpmMlNpWh9gnA6
         mHAfI1dVT4sQJskwZrOBRjVCkzR5io5Xqn+mCdGqfRmgpxA0OlkBRUJjpfutRqdxwq4h
         BHjNVcPkZtSCj8kttImuWK+JFs7ugq32DwP+zzZlhtmPX6p8B21QRbpqwXNC++KXZRV+
         jU6huSsN+2xdOObUZMPnyju8VUx/prA+X6SV6kokDEAgHTtl3zl6Dti1KON7C49odjGj
         eKRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v4UVc4AQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i6-20020ac25b46000000b004f870f42c3dsor9473970lfp.8.2023.07.05.07.45.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Jul 2023 07:45:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v4UVc4AQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688568324; x=1691160324;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tl2AskdNCf03W6dDZ14SDintwMW6XEoJs3CByzgxNoA=;
        b=v4UVc4AQ/ovoSV9touIg4srcKrE/2pOcu1he4jvAKSbHz7j9BxWjXH1Vat2ZWsdkrx
         hyk8jusKVdvT57v2/Q+29HxFqJYRdM0obszObGjPL4YnhD4aGWO7r0wdKS2yABdn7Y68
         2jZyIgpcGypy23hGdEpERhHmmmSqWZb9aAH12tdXF8mNVqai2Xr8c9M3lfyxA3n+mZov
         Vsxwy3vSLGVlRqjuYwcx70Ue13lLppVbPk5dv/VFeBNEiAWdy+Di4n8sDfTge1FgeYyT
         cVQN7JpUb9NIFwOEK2NU7Wt2lEU/aRXhJVuSbACbdzocYL8sFbUTaQRtxRSNE0+p354Z
         kwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688568324; x=1691160324;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tl2AskdNCf03W6dDZ14SDintwMW6XEoJs3CByzgxNoA=;
        b=iu567W3ATXVAWAHu4u6LR2QSDtYVe2PHYrTxtCzBZZ6I3U99ZXUBSEVUTTCIiDFm3x
         OzoDp//0bN0L21hmLIr+n/wJCbEJPnyPBuJD8BTYIS9z26aHv8YLHAVNB47N/BNogjJU
         bi7heJOA4Kjsski1drOPcH3/tJMWicGWmkM44Cfaz1o5+rdkqP7fTHniqhiNHcMhQgYF
         nlUMLpbun2IW8dpwYqUAOogTsviF4cstJhKtfjgMgMwI3Wb5+FdC0K+DR0MPKkhCiCbr
         MXTRyFpGPr8JOQ4JXhTOYAI/O6LOCPg0yvzPv3sc2XhaaoKva3sErBe6C1s2k6cor6ci
         h71w==
X-Gm-Message-State: ABy/qLYC1H1xrJs8xhqpfsXhynQWVt9o/KNSsTsR0hYY5WsOxaCEP5/n
	VcZgvGC5ptGtaFo5LW4uB45aZEavqPX8yMK2skg6KdaW
X-Google-Smtp-Source: APBJJlGu/tGi8FN4Awg8+1+xOn2/b4sUy4lEpOir/9O5QHsU1SEJJr+9i1Xepexq7Cydo4bMc8oxRg==
X-Received: by 2002:a05:6512:2386:b0:4fb:8987:734e with SMTP id c6-20020a056512238600b004fb8987734emr13394389lfv.68.1688568323807;
        Wed, 05 Jul 2023 07:45:23 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.82.227] ([91.223.100.51])
        by smtp.gmail.com with ESMTPSA id o10-20020ac2494a000000b004fbac2646e3sm2473663lfi.195.2023.07.05.07.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 07:45:23 -0700 (PDT)
Message-ID: <c90fd4c8-59a4-e4b9-544b-8eb6cd03b4d3@linaro.org>
Date: Wed, 5 Jul 2023 16:45:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] target/arm: Avoid over-length shift in
 arm_cpu_sve_finalize() error case
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230704154332.3014896-1-peter.maydell@linaro.org>
 <87jzvffywd.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87jzvffywd.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7A2cX518fxQE

On 7/4/23 18:00, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> If you build QEMU with the clang sanitizer enabled, you can see it
>> fire when running the arm-cpu-features test:
>>
>> $ QTEST_QEMU_BINARY=./build/arm-clang/qemu-system-aarch64 ./build/arm-clang/tests/qtest/arm-cpu-features
>> [...]
>> ../../target/arm/cpu64.c:125:19: runtime error: shift exponent 64 is too large for 64-bit type 'unsigned long long'
>> [...]
>>
>> This happens because the user can specify some incorrect SVE
>> properties that result in our calculating a max_vq of 0.  We catch
>> this and error out, but before we do that we calculate
>>
>>   vq_mask = MAKE_64BIT_MASK(0, max_vq);$
>>
>> and the MAKE_64BIT_MASK() call is only valid for lengths that are
>> greater than zero, so we hit the undefined behaviour.
> 
> Hmm that does make me worry we could have more land mines waiting to be
> found. Would converting MAKE_64BIT_MASK into an inline function and
> asserting be a better solution?

I'd be tempted to keep a macro, and use __builtin_constant_p to make sure this expands to 
a constant if possible.  Ideally constants would be diagnosed at compile-time and runtime 
values get runtime asserts.


r~
