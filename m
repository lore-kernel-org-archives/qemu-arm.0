Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp945599njb;
        Fri, 6 Dec 2024 07:52:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUNYypMX+hW+cwoK0A7sE0GFye03lKBXnusLFMCOUf20d5ONZnP5zFDdq08ucv6/mSfcGdP0wYYgnQoLg==@linaro.org
X-Google-Smtp-Source: AGHT+IEEj46MJ3HUOdW4S36Fd3a3Ofr6Y64uqFEj6p/Qu5KK6HS6pN9XxUUs26nVx34f5TddDYQN
X-Received: by 2002:ac8:5793:0:b0:463:59f2:1835 with SMTP id d75a77b69052e-46734f9f50cmr45849491cf.54.1733500352523;
        Fri, 06 Dec 2024 07:52:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733500352; cv=none;
        d=google.com; s=arc-20240605;
        b=SMWI0tIL9u9NJ9rgUgrjHN30Lid2cpo4Sw41cazMn/IYDdHuVG5MJ2l1BCo1V8OzWk
         oN1Scdc/5+/zjHoGBZfsmr0PcymbpMU8lSZoaacp4KgLuczNhRX2idyeUAbUUAtO1IXW
         YVvbH/XYq4CST2wq3tQgFpnaC3U6NkB21Rk+x3Eeajcn8eC6ndc87Sva17tekS0eHLDc
         hT8mGCf25fKLk9pMYY3V0+Enx84JNwp2mcVJvONXf9Y02YGK3goI4OZIOIThsQpbkSxP
         vEZoieaRqLdzKktMBtvqE/Fc8e2gsccEnTj1Zd+4kGVw6iQ64Fm95FOsrV92E+UYbQon
         /glg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XdltCTPHzLMm1n4AZMtJeV/UGx6c3dxI1zrnE7uPklM=;
        fh=FnK8dbTifbWQlofkVA1umhEsummmSi9v4ridbxDwJFg=;
        b=hVNPW+ML+jzPujwp+4VpT2u6P0StZ+rynO/1WQZEZxKVp+R3Xw3SAV/GJqyFn00yQA
         mlOstJk4AhlFyvD5UmocpKjMtEi/1oJ0ZR6oC+rk2dcX9691oVpRR/Ql7kgimzBmIFzo
         g6vVhkp4lcbQ8V2VJ05vNgHO0gtfUwL4pYr7dHZr4PSt4DfC03dcQv1xRm6lX02CT4UV
         rmf3b/CgRsX9qqISOEMUijh3CJ/Mc51dzaNjqj66A5B90gETDicM+9RlOkpJETDlCCDq
         By09NPTcUoroGFNAPd7LN83W1evJDvYcjaILuBTTVbuge9UOg3lYMURXi5sJTVGW0T7B
         HfWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qt1pDWOm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46729867f24si51651661cf.668.2024.12.06.07.52.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 07:52:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qt1pDWOm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJacu-0000xT-88; Fri, 06 Dec 2024 10:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJacr-0000x9-Dq
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:52:18 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJacp-0005Ay-V1
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:52:17 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-29e49376462so1400075fac.0
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 07:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733500334; x=1734105134; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XdltCTPHzLMm1n4AZMtJeV/UGx6c3dxI1zrnE7uPklM=;
 b=Qt1pDWOmJqPZyMK0bjLBKu/w7vUGdSteG2zw99OvfpWimQdDxx2q827/KnQLV/rPts
 mNBj+3xHp4GWoYhhZysD/gq2BgGjTmOAzhXbavT1YLrBxA9ECDjeFPpL17GRwhLlHp0M
 UGaau6r/kor32SEEGYGJk9ZJjFqSLgimfMK+2sPtq5Gr5eBvZOqjupWAXOAFA9lQqqaJ
 R9MHsVN5FXt0taIiEkhlLpiZikZfSCkCqkOR1VhSsxknfWpPSTnYECwNrV8YqI3vPdVf
 hVJGGGbBWF9NhDqTKIMs0336IY4z9+w4WqjGAasRec6GolCRPHMp2t3Ljt1iAda45TPx
 YTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733500334; x=1734105134;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XdltCTPHzLMm1n4AZMtJeV/UGx6c3dxI1zrnE7uPklM=;
 b=HWclJMPTK6H4/a2b1ic61wl7kgLaENUvAz6Xu8UskqpZxCBx2HkmwUeI6GvdYjqJtw
 zbd1IfJuCyxvK6yg6pcI8KBGH50Qi4d24mQl5o8s3DMDYQOaxe+B+EunXkcWK5d1cXKm
 alVvu0kyEKX6ImZlhtuDLuzbR+SDIo0zvt6abTSXx2b0djN9zgR853gs/Hdd6nH1l94F
 6dEKtbezA3lOzIc2Xe9g0FLpfJc9zH6Ov+pNHBu4dbowdJ99eomabCPqv/Y48h+dvXR+
 BwL5VgrkbEqtn5lUjnGIqUzGRKn9g59KizkjijMt9w+0DCrRVnjF43yZ4MCQRHI29Cud
 0xDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2xAY9OtDij62boY8YPmuFhE5LcAzNL23A4u+5sT7ifi/MExl++VGmee0jJh/HgVBZD7EcPyVseA==@nongnu.org
X-Gm-Message-State: AOJu0YyrIW2ud2smLxsGFZus4K23Qikcf4i/YKP3QERE4BE7QphPb7ON
 rM/x486cO+avari507MAFhzZc6ivAylhbMCg+SYKXea9CaZqr6opn2AMqNdxHNFkPUeGHFYpBMy
 EW44KV3ep
X-Gm-Gg: ASbGncvgch4qNCLLEKjRUrgTAo5jMyFMLB4tZVDfQ4JmIO+qJS7B6q865B60L67zftm
 E4nb88R1R0X9r+uRBx6TIx9CtSrrzbKh9FNrjQudAGEvRJIyINgTE3ngMBllShSo8cYzHcE2zQE
 oTaQQPNVYwnqY8lpuU9oVm+CG0t49xf3cvOa2fL+gymXdJRNmrPbgeBu8uIlVbOmw7ZKQeZDL3X
 uq0OaFKDXKSMcx9NBZH8WW9b4CzahR/JCVy4Jc/ozISsDW9+F6sc086JVbWo/NwC24KO9pdYxLd
 AgvuViOmJDw6pYm0NLWCygBktkfY
X-Received: by 2002:a05:6871:460f:b0:29e:6d29:d3ff with SMTP id
 586e51a60fabf-29f731de43cmr4037027fac.7.1733500334535; 
 Fri, 06 Dec 2024 07:52:14 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29f5666594dsm891598fac.9.2024.12.06.07.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 07:52:14 -0800 (PST)
Message-ID: <ca91f57b-1cb2-4867-b8ab-6255caec7fdc@linaro.org>
Date: Fri, 6 Dec 2024 09:52:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/67] target/arm: Convert CLS, CLZ (vector) to decodetree
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-38-richard.henderson@linaro.org>
 <CAFEAcA8-GkpSxLc98y8ZopV9PMej7U4+Ruk8D+zUoEDPZYJ8aA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8-GkpSxLc98y8ZopV9PMej7U4+Ruk8D+zUoEDPZYJ8aA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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
X-TUID: jdB42nJuaJKb

On 12/6/24 08:40, Peter Maydell wrote:
>> @@ -9219,13 +9233,6 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
>>       TCGCond cond;
>>
>>       switch (opcode) {
>> -    case 0x4: /* CLS, CLZ */
>> -        if (u) {
>> -            tcg_gen_clzi_i64(tcg_rd, tcg_rn, 64);
>> -        } else {
>> -            tcg_gen_clrsb_i64(tcg_rd, tcg_rn);
>> -        }
>> -        break;
>>       case 0x5: /* NOT */
> 
> This was dead code, right? We only call handle_2misc_64()
> for size == 3, but size == 3 is an unallocated encoding for
> "CLS/CLZ (vector)", which only deals with elements sizes up
> to 32 bits. Worth mentioning in the commit message, I think.
> 
> (I was wondering why the new code doesn't have any cases for
> operating on 64-bit elements whereas this old code did seem
> to handle it.)

I had been wondering if I had failed to remove it earlier, but this has been dead code 
since the day it was added: b05c3068577.


r~

