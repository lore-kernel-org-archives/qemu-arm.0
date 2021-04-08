Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp517673lfr;
        Thu, 8 Apr 2021 07:25:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYMWmENUB1uuxlhSzIu9jBwIjtJRu9cYOS1UXdqndpwn90rbhkC8Eqc0hrlw/kARnyF0qF
X-Received: by 2002:a05:6e02:18ce:: with SMTP id s14mr7231255ilu.195.1617891936314;
        Thu, 08 Apr 2021 07:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617891936; cv=none;
        d=google.com; s=arc-20160816;
        b=Rs0SIyVZUNudWhqkk4fO5qiiwd+lu20TlfHqeE7bnUk5OhOtvFspIX/HewwdivTFeg
         /8sL/6z7sr2rzzvzmBVljCJuhh1qnvLbg1tj54/iqWVRn4ZFdujGZfI7eB7Ni71puP1f
         GAq6UlEW9qMF0z4S17CK2PrBbRk88iU8RMyjU5Mhbi1lqPe4iG7q+J52ILjIkS1ZZlnC
         RLlNyDbuSwr3Rni7629TCLEmWoMUv3kr1JAMv4wIv+S7g163wnjV/6fZwctp4sKg001a
         6Ut7l8RK5taM9aUzG/XFwmPaDa0S3w5nQ8vczlHRTqopTAeCsXMPidNLs+09XPdn+79Q
         sELA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZFnbHYILMcI/VEmTPpT71qfojBQq5RkqI/zyNRTGWwE=;
        b=kDuy42BZD2Tnxe/ENilTaY14a0AyKHlwxWlQGzabNOuxLLzlhS5nFJw9PxiwZbuywP
         4fAsNVM31kNrLuhSPZJGLlOvTX8yxosxjpcFu3VEprKJWRwrthWZpd9S9hvAaNKs65r2
         qyjcxs7/d6c58/2So+WA1hkNu/lBmc0fInJNfDyo+eJ8XjDVShicCXlCzATqi4+HOjY8
         xXH/P6WTNRECLeu1vE4kUG0pWNl+3zxkdLeQmultlCPl5uFYronNrZStMZvZEhWnfowv
         DjEr8BNIafasc0gIm6i1kMXQXqIp4rSJp7TCUw6f+InOkxx1n+gXfv4f3CVm6+0HeNye
         hrjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bVsm12VB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18si24910809jat.92.2021.04.08.07.25.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Apr 2021 07:25:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bVsm12VB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUVbD-0004vS-Fd
	for alex.bennee@linaro.org; Thu, 08 Apr 2021 10:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUVb4-0004to-96
 for qemu-arm@nongnu.org; Thu, 08 Apr 2021 10:25:26 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUVb2-0001T5-K5
 for qemu-arm@nongnu.org; Thu, 08 Apr 2021 10:25:25 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so3288859pjh.1
 for <qemu-arm@nongnu.org>; Thu, 08 Apr 2021 07:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZFnbHYILMcI/VEmTPpT71qfojBQq5RkqI/zyNRTGWwE=;
 b=bVsm12VBGDYBAOiNIsFHwGKi128vH4KrJmaH/wPMuTIEMn1Mpg4s8vp1n1qaAgH05K
 xdCjewBu3cS7pXZvwKNW9nV5n0Yj9atXgFlEnjn03ffjqI5lvuJvScBlxAidT8YEzjDU
 KCFgKrC9KZWOqNwNg3iVf6u2/3KBhM+DForWtONsVTWXa9iQdunLox9r6Mi1Juse0Vvr
 LxonAmHVPaUiXNgduG95k/8RJYIBCVGGz/+6n35ZS6CRywNR9x4q3aiSKzNnhGSB8N6Q
 IlqrMH2PvOwfL+IvEgJqo040xTPMRPNa6h7d+IkafWdHFb1B4h9uwgffr8wFQV1DgDoe
 CcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZFnbHYILMcI/VEmTPpT71qfojBQq5RkqI/zyNRTGWwE=;
 b=dZX6eAEN6YOOZEhsWNYj1yuwxTYS/bW10MFe0Yk7zKatSTCZHxw+NoxQ4ANOq/ysmr
 rEQGC41eL9BBgKmxRhC84AvC6gYHg4COa1tLRLr/tFpUgWyij0QYh+MKuY8UIiq6gmkW
 e+RWktBss/XrF+HAu27Gnq56+N3eCasxFlzMolN6KCNOHP0dSH3DnRQVKsLlrxr8h+jn
 dmFcUM/xQiM+HuQCYJ8ECgXFeaHvT5rkpihLRZh3OLXsfhhBvlVsynBYZb5wtPMCRRoH
 VKrjn3G7hXK3TCz+lP9IZ7Bpiii4OyHiQFaPc2h1Osy87FyhmLeP3RqbvDeTHPwoXOEs
 oTfA==
X-Gm-Message-State: AOAM531UGvMKdTkjomurMMH2PR91wJCsDbQeuzLgbngCUJdnmK/HIEkt
 vhgeQFc7vjhystuvV5BxhmkZqtUT4KuOPw==
X-Received: by 2002:a17:90a:5407:: with SMTP id
 z7mr8929509pjh.228.1617891922818; 
 Thu, 08 Apr 2021 07:25:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w203sm24151236pfc.188.2021.04.08.07.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 07:25:22 -0700 (PDT)
Subject: Re: [PATCH v4 00/12] target/arm mte fixes
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <CAFEAcA_9v7i1p59EThNPfuJHxXqwgavupV4otqaZMt9Q5d=SsA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <18c76f1b-cba5-8205-b945-bb908d460bf2@linaro.org>
Date: Thu, 8 Apr 2021 07:25:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_9v7i1p59EThNPfuJHxXqwgavupV4otqaZMt9Q5d=SsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iycaHkQ8jWWJ

On 4/8/21 5:47 AM, Peter Maydell wrote:
>> Richard Henderson (12):
>>    accel/tcg: Preserve PAGE_ANON when changing page permissions
>>    target/arm: Check PAGE_WRITE_ORG for MTE writeability
>>    target/arm: Fix mte_checkN
>>    target/arm: Split out mte_probe_int
>>    target/arm: Fix unaligned checks for mte_check1, mte_probe1
>>    test/tcg/aarch64: Add mte-5
>>    target/arm: Replace MTEDESC ESIZE+TSIZE with SIZEM1
>>    target/arm: Merge mte_check1, mte_checkN
>>    target/arm: Rename mte_probe1 to mte_probe
>>    target/arm: Simplify sve mte checking
>>    target/arm: Remove log2_esize parameter to gen_mte_checkN
>>    exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1
> 
> So, what should we do with this series for 6.0 ? We'll be at rc3
> next week, and this big a change seems risky at this point
> in the cycle. Is there anything in here that's worth extracting
> as a for-6.0 change? (maybe patches 1, 2, 12?)

Definitely 12, since that broke BTI.

Patches 1 and 2 are certainly simple enough.

Otherwise... the rest would be nice to have.  It's quite isolated to mte=on. 
If you defer, I guess that's fine too -- the bug report did come in quite late.


r~
