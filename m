Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp546964njb;
        Thu, 5 Dec 2024 17:31:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW8kekggE/QmhqaV2SJG9kVq8jmKucQbdAHyzUqWusp1kZgYExgPnSOXwQS1J8oO1dcBvdx6GSCXia6KA==@linaro.org
X-Google-Smtp-Source: AGHT+IHi+z7h9P9VzEIvM5PLLVm2sI4PWxtdiUb5RblgTdQgJyogyfQWJbEr2iVWnvCogfvSooTm
X-Received: by 2002:a05:6214:ac2:b0:6d8:8e0f:8c03 with SMTP id 6a1803df08f44-6d8e70e4e87mr28224966d6.18.1733448708839;
        Thu, 05 Dec 2024 17:31:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733448708; cv=none;
        d=google.com; s=arc-20240605;
        b=TnlVJc6RAYzxYeDR2qTHthIedthseUP53Ozrqe+mT44tmqCp5m6e6ENP4ZsvexCT8d
         GrQo9nNfzmLgEMKkiupRvkVnvXSiK9hLAhr6zfSw9fOq9s0UO8bVHwjC+ZJqE/8sEdBn
         QPVZSg2Pl0QE+dHB49j00KBCf0+WdxEEtIsuMw+ae9v6oF1/pl5JAvLNFCptI2opsJp8
         msvxhxsrt7WcNtkD8bD39UqbP0kHsVWhVgM/2jXbed4PtQfA0h6br/dTZetod/1oYduo
         z6v35Ty8pgh8tK8rLXZUEavzr3VndQEwYTtPCLy5eiT+PplQeZ+NcTyFMLIY6QI4oAV2
         p5pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GnEYhcml5UWVpnIefmzzVe9HES3yWRFsa/RIrskuy0Y=;
        fh=njcb6o23g/djvzScXqn5U/tjr+a9LWw+4ZKhEc1awes=;
        b=a9Q4mVeF59TDadCPneDgSQ4AfDtBLXgY+bvLHWBGxMlKsE77+jaZYWXKpnmtDynsnN
         dGjZniav+XZ5SXIuxQzldqPsrXcdMMowEY6IwO0hlwW6Inpz8vAAcSFRso3SsP1bkZ/M
         QTLVNthGEGSo/6kQLdaGr//jSgPYJEynEwyKDMO2+5P9QG2E5F3+M6XQ01C/zGfl8mqe
         tOwhOEG1oZvMAegq8V16yEcbOoO2DKv4R6/b90dlywnig/NNeubKBN4267QMgEwyjEev
         zc69/bktu7Ermm1b/qXx8yQ2srJ8e5owbvgpyeJWYNaVAFnh33qypJjPpJBglQK+zHec
         AlTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C4oFrVSE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8daa07efcsi30968206d6.182.2024.12.05.17.31.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 17:31:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C4oFrVSE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJNBo-0003Ft-7e; Thu, 05 Dec 2024 20:31:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJNBj-0003FA-QL
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 20:31:24 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJNBi-0006a1-1Z
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 20:31:23 -0500
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3ea53011deaso452828b6e.1
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 17:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733448680; x=1734053480; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GnEYhcml5UWVpnIefmzzVe9HES3yWRFsa/RIrskuy0Y=;
 b=C4oFrVSEOXqL+BST2IOYWiGPwR087Y5/t0AembPnbuBsMYECVQA53tsQZFnUnjagMy
 bl8zZAWO1O8WRvPx64hcgB42MVXo5U8Z8X/cojOJJloZ3M3cJCW8kSc8m7Zw0AEbQz0l
 ySGvQkl5VKfy/A3np9+H8IIP5IVXegVjVgZNUyHb3jMU4Wpaieczg+PBNxSa+gFmvLjH
 orhKfxuVDua+u7do7apRe3kNNQY/UnA4hyvNtc7u6Qz8NZK5+K9fs0xv/7iA77jNRcmI
 X541sO2SAGoCsD9k1hFaQmtJfW+eGwtkSpICIezuVzuPX0DpN5z+aX+qxEXvjSDsv9Zs
 WQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733448680; x=1734053480;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GnEYhcml5UWVpnIefmzzVe9HES3yWRFsa/RIrskuy0Y=;
 b=QqCUa1F2h+zDZMr2GL11Aa6Puzfc9PmUpNjMGOCQdZNYWTRcfh8h89sVi8aa3xHMox
 MfsJ9DRHB/hkIpz3MHXBh6i4cKrbeqDaoh1DJwmPeJBlGE4QR6vurPAP9ASghA8RJ/PK
 1lrOOZGzMQdCMNxOtiVp55Fmrv4IvfumrYq5LfUMLp0ojJGalemS2XPnweuzC2sdrlIL
 pD1UqRsPtWDxfPAvoPUwpgOvlePvPX5HeHUlCwUGG2WX7lg8S1He9XaGf0dKUn2H7mka
 PgSvz8vMMwfoa+UB+yRa4EZPExRw2M8/qmSiDXEKfJsa67Oea4f/eicgwVsStRPR16Ic
 Qm1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2Ox0LHp5Ess0HXLUXWLS63lp/8fUECozlNRs/avDgJOIgGuKlmS0TmNGV+SSOCgjpFIPEIte+AA==@nongnu.org
X-Gm-Message-State: AOJu0YyIWmi13X0gYfnWo3Lt0LyHwEV/RJykkIjMZ3kp+CMIrtqfrRsa
 tAc4BrsxQf9WZ5zbidoZwgmymAepk0IGvecXQNKkLAKMqYvU4IN2hte5anlCCFs=
X-Gm-Gg: ASbGnctz/Lunm7K+0rGIPhTV7K2DkuTzqbqYgRZODZmQbGhylH/27VnPAJAzofot7b3
 T0uu+Zzy8+giFS5qfEf7/tcSDRriutpBgIjMrH6xDNuVo0K0VGElymHjrw5HatQs8i0wFmDJO2A
 3hTfqNOvVgEaGb8VDNqdDuAsHOYTQExQTI5mJS/MwrbSc+GniTPbsrKlODoylxGr1q8KDrgJI0C
 A5HcnaYqDA1T99bcj+vrMyHSKWWkpmi60QlbsGi20ldK/i2/OXi4Cln8XUbyL5JCpbCkNWbtZ8H
 jqR2mVQ5XjDGOKZIEQl0qZC/HgMf
X-Received: by 2002:a05:6808:e86:b0:3e5:fd5a:c39b with SMTP id
 5614622812f47-3eb19c08616mr606628b6e.4.1733448680510; 
 Thu, 05 Dec 2024 17:31:20 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3eb077fb103sm563754b6e.41.2024.12.05.17.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 17:31:19 -0800 (PST)
Message-ID: <98336171-866a-4204-abef-c29d05073d15@linaro.org>
Date: Thu, 5 Dec 2024 19:31:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/67] target/arm: Convert FCMP, FCMPE, FCCMP, FCCMPE to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-23-richard.henderson@linaro.org>
 <CAFEAcA-2nA_UYVt+U5hkngxxNEEUmLa6EBkt18v2=zv6PUMMnA@mail.gmail.com>
 <CAFEAcA_aaioxN2_ePCcMBLkaXVoUx1mR8-MmAar9tVNJMtAa1Q@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_aaioxN2_ePCcMBLkaXVoUx1mR8-MmAar9tVNJMtAa1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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
X-TUID: 7WzyJ0lhQY8Q

On 12/5/24 15:27, Peter Maydell wrote:
> On Thu, 5 Dec 2024 at 21:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Sun, 1 Dec 2024 at 15:17, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   target/arm/tcg/translate-a64.c | 287 +++++++++++++--------------------
>>>   target/arm/tcg/a64.decode      |   8 +
>>>   2 files changed, 116 insertions(+), 179 deletions(-)
>>
>>
>>> +/* FCMP, FCMPE */
>>> +static bool trans_FCMP(DisasContext *s, arg_FCMP *a)
>>> +{
>>> +    int check;
>>> +
>>> +    if (a->z && a->rm != 0) {
>>> +        return false;
>>
>> We did not check this case before, and the pseudocode in the
>> Arm ARM doesn't check it either (there's a comment for the rm
>> field that says "ignored when opc<0> == '1'").
> 
> ...this probably falls under the "RES0 UNPREDICTABLE" handling,
> but "ignore the field" is permitted for that. If we really want
> to change our choice of UNPREDICTABLE here I think we should do
> it separately from this refactoring.

Fair.  I've removed it for now.

r~
