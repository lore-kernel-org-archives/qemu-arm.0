Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5414676lfp;
        Tue, 11 Feb 2020 10:41:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqyvH/lWj0rXUf7xmiAlXMkZX5ZFWM1N30RUsWRsecFvjzTzTSQJ7lk1CDQfqbBPZJzhCJai
X-Received: by 2002:ac8:16ca:: with SMTP id y10mr3899691qtk.340.1581446489799;
        Tue, 11 Feb 2020 10:41:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581446489; cv=none;
        d=google.com; s=arc-20160816;
        b=EgjLLLeUUep/evazqCXaWkznSnvrNNqCyC/qDk4chv0JNL4xmPbr5HUNCXEnor0wru
         dzkKL41zAyG1tLcIZm4GFroBOk0iRnkBkXSRcXUNEki0wqscpm6E1IWIu/nwVnX5jHpq
         5A5LUD7wk2xjTv1VvoROr0ibHLbW7DwOgkiMuahddgxM1TwxeS5eoPCiioStFMVLivm1
         XMZC5xRxwh9Aaerz6TxyTF/bBhJLZW2B/zXRiY8/5EFKlMgtGQRGEurprPdoJszX4V7B
         m/X0+GnkP2zlogK8x9aI42cWQ+UjGyvn2KZveg0RhBLiO5ehndf2I/YmXMracBzkSBgE
         yr7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CsEraNL+eCiliAYsnik2Wjy5DfmaIOa1lMicG/YV6+8=;
        b=daKZnXg8pdR/PrbAtpJnQQXcut4fGa3oFQ+Wu/9PJR39egE2FPGd8togl6bv5RhSM2
         6MihrBdpcmaS9Hg58wGWxSIFPPXGVJb4jfQnzNgCoUmW2mYlI0U+0ikuVZulaqYLygsb
         AwUHFDKvnrsbD2jzXUrZ7xdYdsbkNG5saCdy8AsrwME4IX7I7Anrhb2Qj88uKMLQircx
         S/G3bCx/9iAOT5QcKn7BRMYMMymICkcN/WrgZJu3jl/Y5U85bqaCcdI/fTZmgWCl0I1G
         e3QAHxVqe6JRmpX4hlGJebYuurUdCoRHq5PksYln9HZ5ZDuwMH6IQENj9t17IVzE9IzI
         hTzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r8e5AkJW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si2186264qto.220.2020.02.11.10.41.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 10:41:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r8e5AkJW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1aTR-0002Mi-8d
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 13:41:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40883)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aT2-0002Jx-A8
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:41:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aT1-0002Ne-Av
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:41:04 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33359)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1aT1-0002LX-3X
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:41:03 -0500
Received: by mail-pl1-x641.google.com with SMTP id ay11so4625238plb.0
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 10:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CsEraNL+eCiliAYsnik2Wjy5DfmaIOa1lMicG/YV6+8=;
 b=r8e5AkJWTHWNzM5tg2EVsBP38ngyLPTOCHCIsAXf531bVkYUIhaUmEfhTkzxQcX6Rn
 JM9qbEeZiHFgHOn59LqpvLgeQmBdeRu3H/ILCaU+7jL+5iIJu+9ntKxnj1qchm7pJvW4
 YpO4JY55m7D3h8GbIaWGiKQ42bldNr6yUpOwWWgK2cdT4gqbSIUV2gjtAaMNTGULqwNI
 sGkTsNpjnRSiWQKvmpoxj3pX4RZMAWB/k9IALYKLLLn46qpxQ0VcJEfAE/Q9sq+w/vIH
 NraH0em32ylJAIN0mX8XlbeQdeRu/DdIrEIYnlJQEU+pcu4CepyJehaPREQiWBcrJK0t
 d/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CsEraNL+eCiliAYsnik2Wjy5DfmaIOa1lMicG/YV6+8=;
 b=WAUdxpIKagFUpDZ0fO8zamag31NNifpbhjcCg6rOvzUDlRNvPsOIVoikt7FPzAYsIo
 5XbK6WQDhUkKomypnFuNO97ypUMM57V37w7FBZKrklVbTitClDiIbfL4SFPMExpfyjvQ
 hdIIObemjfw7kbYy6J6PLruBi9eEz7HLtn0r58lUcNuX1Kf00dUmZvkrfcE9CIP88yAa
 OO454qftw1oCAZnMJNcRFbmV6VPlUYTMXa7lyREjA4BWt5bBdgc3HoK9xmTWIkK5aPcD
 wETWIEB74r3YMw/1IiO2M4W+cVrF8FGxnvyVY0tvhiUKVXTPU4qVcxL2Y8fEQqzzYZ0x
 dSUg==
X-Gm-Message-State: APjAAAWbllbz2wXLL0lM/aaIZnkM+csfFqWvU+PNh0tLvfJOapfxukEV
 ZflcvCi5n0rMvvR/YzzVP0aflg==
X-Received: by 2002:a17:90a:26e1:: with SMTP id
 m88mr5168859pje.101.1581446461925; 
 Tue, 11 Feb 2020 10:41:01 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 s130sm5628290pfc.62.2020.02.11.10.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:41:01 -0800 (PST)
Subject: Re: [PATCH 08/13] target/arm: Add _aa64_ and _any_ versions of
 pmu_8_1 isar checks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b7f2e055-d61b-d19e-598f-8d94fca6c1dd@linaro.org>
Date: Tue, 11 Feb 2020 10:40:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: udx5JuHxRfQR

On 2/11/20 9:37 AM, Peter Maydell wrote:
> Add the 64-bit version of the "is this a v8.1 PMUv3?"
> ID register check function, and the _any_ version that
> checks for either AArch32 or AArch64 support. We'll use
> this in a later commit.
> 
> We don't (yet) do any isar_feature checks on ID_AA64DFR1_EL1,
> but we move id_aa64dfr1 into the ARMISARegisters struct with
> id_aa64dfr0, for consistency.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h    | 15 +++++++++++++--
>  target/arm/cpu.c    |  3 ++-
>  target/arm/cpu64.c  |  6 +++---
>  target/arm/helper.c | 12 +++++++-----
>  4 files changed, 25 insertions(+), 11 deletions(-)

Normally we also read the value of the ISAR registers for KVM.  I know these
tests don't apply along these paths, but for consistency...

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

