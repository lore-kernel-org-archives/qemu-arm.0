Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp794135ejc;
        Sun, 10 Mar 2024 11:14:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6RkhONdzpHMCf2b7ZdF7ep2BLECcQ+aAo2NzZPs9xtFSfNFmPair5L2afCSynV1ixp8hBPFKPn2zw8BtTL/cWJFVy51Fg
X-Google-Smtp-Source: AGHT+IGUnc8nemZencS50ieYM82tZ6RQP0mETW4JHMC2KysxOWqO9PSkTsqAIoi8WZzaIrHwEE3F
X-Received: by 2002:a05:6808:24a:b0:3c2:3131:65db with SMTP id m10-20020a056808024a00b003c2313165dbmr4741979oie.50.1710094459883;
        Sun, 10 Mar 2024 11:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710094459; cv=none;
        d=google.com; s=arc-20160816;
        b=m3cHP+6URq/IJgHsnS9VEA1Jp6o8wD044S1PB/5qnlN+JFjaK4hrZOTZDOpRk18HGV
         2TGKqZ/FRMH2jg+z0hQH4she6WnpGRhK3cPs3cY/9pAtXOQfQy8nstS773L3vK3RvGZN
         xc47H5kDhSdULdi7n37kDlBUnNn9mkZsdg6t3wQPeuJD00QL55JQNLrSQOj0rnOb0t8v
         UexHU2R3BjUGYwYXdPlbq98Pjj97Zp6ol7Tv4t22qDBxjIHFs3XDUNfQDAq+N24x28LF
         j4I6ePqg/F46NFS5dGB7J6Z7SNspo9yqJmtMTQ4JuYZPAomMMWfLJRxvaa9LDUjV5jcG
         BAZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OXt91NIiTjKQaj0RlZZ6mADCIBVYFAJXW1zt0xhpVfk=;
        fh=X5p6klwmSHZDNBLOgBqEh7912ad/1z5iSapkOab19JQ=;
        b=hKjyVRZBhzQraN8TLN/NI8c7eC+xINQbREOacEVTCBafQKlL0WsQ7IN8IWTC7vwHU5
         2GMn3cHNJH5veK+ID5kRecKh1AiWFb9y2C0tSVQMMFzdcSJBGIXIHIDXWUz/PpBq+3lo
         csxrhMDLbT3ffWkUBCpfuXbrR9wUiI+DlWTtqJCucYAPGtRiNSrtiFD5caq33aESbPik
         M5Jg+u45nQeafyARu7cdyB5yeVukgg9Q6hQX34RyZMq6IheacADdfP+rPgxpb54U5jfV
         K1ZVVvzSNreU6ND38THbY+xQLP04ImwsymfRRPdNuHQQmXhTnqyzznfsQES/o2reBbuu
         seTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LVpgFeHP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12-20020ac85f0c000000b0042eb8eb101esi3947429qta.633.2024.03.10.11.14.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Mar 2024 11:14:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LVpgFeHP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjNgU-0001T3-9k; Sun, 10 Mar 2024 14:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rjNgS-0001SX-ND
 for qemu-arm@nongnu.org; Sun, 10 Mar 2024 14:14:04 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rjNgQ-00009T-VX
 for qemu-arm@nongnu.org; Sun, 10 Mar 2024 14:14:04 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-5d8ddbac4fbso3172136a12.0
 for <qemu-arm@nongnu.org>; Sun, 10 Mar 2024 11:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710094441; x=1710699241; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OXt91NIiTjKQaj0RlZZ6mADCIBVYFAJXW1zt0xhpVfk=;
 b=LVpgFeHPrgLlXKauo65lvTQsEm1oiLPM6FNGtClcrtHvXhr8s3m2uApC9EjRfNoY3t
 eaNh4Be66mduZaBl17L/2gjVRht5u7snaaevmL3noFGEtcuvq0dMx9TEEMaCwpPt3HVo
 jUNt7UjYCoZG62UDvt4lX2eZvhAiRwkKPM9REUpth5pjb7wh6Y9vzBBdO/tgLmzbVFvo
 otjO5xmbx/IUt1TALaS2eEwhR+A6koCURmUhPAS89FRgfpnXUwxb8ljY10OJL5nmDx9w
 79OxN3zWpUnt0VC1rxyLMAe+nggbmxtrP+v/7Wm1bC52ykQTZPhDeTg3V3fxc5wT7rtC
 hWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710094441; x=1710699241;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OXt91NIiTjKQaj0RlZZ6mADCIBVYFAJXW1zt0xhpVfk=;
 b=H4gxx28yOW/j0qM46jXyr2T7NE8TjdDEC1Vbcq8EQZnIl3H9XI61RlmlHQ0Wiu54Fe
 USSNQb7HMWZkQiRhJ9uK4B1mslj+0qrXWFHBsITgPh7Vg5cCrfYXmiPQc2R5e0kXObb9
 2Lra1OBChIZphKvJFT+IR0EUhpdq1LLMcCV/3eZm8laXwfmfEIt96lTwnbq25Lcf7Oer
 l2vV3d9KvvHbeYmBMqX3yNqlIwygGeC+075rHAPrNXW40gcNNEX9cTsrru4QfpdhjSlj
 ALLH7qMKtoHuIIObCVE9UmW9pzf4XfMIu2MITmUKqIH3b2DQbhgcyUagYDHbxcjMocPZ
 wqrA==
X-Gm-Message-State: AOJu0YwQJwnbExJ7MQEDuJ+ldp+r3kR/UL7E5GiUmfM62Rh8OhFUAlhz
 7DwTK1y9ovY3vUxbv1nVp8y7HrTeH2d7x/yFsx4qSseJRRE+wEuloLw5AwsiFyE=
X-Received: by 2002:a17:903:192:b0:1dd:5f85:1197 with SMTP id
 z18-20020a170903019200b001dd5f851197mr6414049plg.64.1710094441540; 
 Sun, 10 Mar 2024 11:14:01 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 12-20020a170902c10c00b001dc3916853csm2952200pli.73.2024.03.10.11.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Mar 2024 11:14:01 -0700 (PDT)
Message-ID: <1f5e8229-18d5-46e5-afba-3fecf2c5504b@linaro.org>
Date: Sun, 10 Mar 2024 08:13:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/arm: Fix 32-bit SMOPA
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Zhuojia Shen <chaosdefinition@hotmail.com>
References: <20240305163931.242795-1-richard.henderson@linaro.org>
 <ffe7207d-c88f-444f-804f-a3597976ee3e@tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ffe7207d-c88f-444f-804f-a3597976ee3e@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: uryTAk2mB+V4

On 3/9/24 08:40, Michael Tokarev wrote:
> 05.03.2024 19:39, Richard Henderson wrote:
>> While the 8-bit input elements are sequential in the input vector,
>> the 32-bit output elements are not sequential in the output matrix.
>> Do not attempt to compute 2 32-bit outputs at the same time.
>>
>> Cc: qemu-stable@nongnu.org
>> Fixes: 23a5e3859f5 ("target/arm: Implement SME integer outer product")
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2083
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> ...
>> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
>> index cded1d01fc..ea3e232e65 100644
>> --- a/tests/tcg/aarch64/Makefile.target
>> +++ b/tests/tcg/aarch64/Makefile.target
>> @@ -67,7 +67,7 @@ endif
>>   # SME Tests
>>   ifneq ($(CROSS_AS_HAS_ARMV9_SME),)
>> -AARCH64_TESTS += sme-outprod1
>> +AARCH64_TESTS += sme-outprod1 sme-smopa-1 sme-smopa-2
>>   endif
> 
> I tried to pick this one up for stable-7.2 (since the fix is for older commit),
> and faced a fun issue in this change to tests/tcg/aarch64/Makefile.target,
> since 7.2. doesn't have CROSS_AS_HAS_ARMV9_SME yet.  I went on and found out
> that the following commits:
> 
> v7.2.0-374-gbc6bd20ee3  target/arm: align exposed ID registers with Linux
> v8.0.0-2358-g3dc2afeab2 tests/tcg/aarch64/sysregs.c: Use S syntax for id_aa64zfr0_el1
>                          and id_aa64smfr0_el1
> v8.0.0-2361-g1f51573f79 target/arm: Fix SME full tile indexing
> 
> applies to 7.2, and lets this "Fix 32-bit SMOPA" change to apply cleanly,
> including this very change in Makefile.target.
> 
> Now, 1f51573f79 "Fix SME full tile indexing" is Cc'd qemu-stable already, but
> it is not in 7.2.x for some reason which I don't remember anymore, so it is
> a good one to pick up already.  3dc2afeab is tests-only.

Oh wow, I didn't expect the fix to get propagated back that far.
I was expecting only back into the 8.x series...

> And bc6bd20ee3 (from Dec-2022) seems like a good candidate too, is it not?

Sure, couldn't hurt.

If it all applies without drama, all is well.


r~
