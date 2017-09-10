Received: by 10.223.172.38 with SMTP id v35csp3592305wrc;
        Sat, 9 Sep 2017 19:44:10 -0700 (PDT)
X-Received: by 10.101.67.72 with SMTP id k8mr7647104pgq.188.1505011450468;
        Sat, 09 Sep 2017 19:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505011450; cv=none;
        d=google.com; s=arc-20160816;
        b=IQOcyiqg8CLciONmtLPmXYW1BNYUHLMvEQervvuN+hbfXUZwvAnJkieOXVuLl+PD5H
         QF5WclofnzhRS8Tn2U8Vzmmllhic2HoFVeMgdOdihA0WOCbYoV+mR/+d3nRE/llOgY/L
         +Bp9qmJdcOtZKKIJwaGFtiV/GyFMhndroqBXVO11tY2//aCFk/Fo9M4YbaIYBH65/t6W
         wqkBpAKDMEB4KEmJs/OPXG347r272+L3Xu5rfhCbe1yoZuBwFSWcC/cQIgtdsn82D9SQ
         OMIE2NGhzUTkC5sOTmQZ7DRoGfS9LtrYbxWeDnZfKaqNzDGSm9SahROI4fDWL/GMJKvQ
         wx8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=dIIuMDa6pSTlf9qg5tazOlnXJyZYCO+98bOrE16JdLE=;
        b=oN8ZhwC7KJhhYzK8Smf6UFbKbWGKLEawd3oK7l6v2p8dpJ4GhNjbH3kOMiOWa3NRtd
         j/Y864wqhF+lYwxPA1v8SiJ0ZR1d0w5RgF/9YLd88M1tfZ8SIOLgJPFv1RWZ8fuH5ULX
         lCBDdWNbwTFQHaxKUi2vexBAT/0XaxXlsTi88t+3BfgloAU80O0/zExI1mocYInEDQUp
         bxf9F6G15mC/tuAEG+y6i7rB9oN6atMAL60+ylTa1D2x5DYNyt9+FqS3MN0nTrQ4vlIt
         04O35uImTqPbozXOLAj5Eqh5V30GngrYgn6WC3c6m+SDTCotMiwSJ0j+P6FGLwNx49lp
         PcxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K97HoLN6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n16sor2550725pgd.297.2017.09.09.19.44.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 09 Sep 2017 19:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K97HoLN6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dIIuMDa6pSTlf9qg5tazOlnXJyZYCO+98bOrE16JdLE=;
        b=K97HoLN6l9ts0ex093zJwIaBNhVpI3H1GmJ6EYXw9LzNs1k1FCZKRJ7JOSyb1bwHYE
         vC9BzqxCjvxwO5p8oeUGdW5sKZjU5WFs+8W0yOPbx5XAnxP7MK47CA5K4VuvtrJ4Caxh
         SVf/rt4LQJ7F5auNiooZzeogIjYVFHwypY+XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dIIuMDa6pSTlf9qg5tazOlnXJyZYCO+98bOrE16JdLE=;
        b=axdUTloX26qbMxTD9pak9OzqlrOvNpVMNocU00dXqCYTwiJngRdkaObe9/PKzlLiD0
         Z2xfTZOP/ruDNQaoWLuHUmjTTJcapj3+KS6hrLqDQTO4lW8MFlJnlenRaYjsytYvZINu
         IOEejESGFGUmFzn5yAS8RW6t9fTNRjbPOjlm2n5uOSNty9qxHRrROtHYXYRnofUAyDOU
         XYaKxmTjRn/IUE4Ip0Mr5msaGvgDREHY8Znfm/rQb01IzaN2ob75xFC3R2Pkq21QXCn1
         W9sS/7HTIleXZ9ZGGaAL9weQHz0FWMmAVNAtlPmahIMcC5TVQRxQmBTgcN2ALqum/NrM
         48PQ==
X-Gm-Message-State: AHPjjUgN1edZZc9J1liVMglg6mRjEyIa9NNwZf8e4cbI9Mlgo9beQshk
	a8yTyFIEvBKti5VUtHO0cOJd
X-Google-Smtp-Source: ADKCNb6diJ/LVkOzpRoa/YzlZAd/2k0vCDoFBBOInNr2jhTCRyrDxkW1ng0miwpEIW6zrqFsgClWZQ==
X-Received: by 10.99.102.131 with SMTP id a125mr2447218pgc.96.1505011450112;
        Sat, 09 Sep 2017 19:44:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-103-167.tukw.qwest.net. [97.126.103.167])
        by smtp.gmail.com with ESMTPSA id y129sm9018477pgb.16.2017.09.09.19.44.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 09 Sep 2017 19:44:09 -0700 (PDT)
Subject: Re: [PATCH 8/8] tcg/i386: Add vector operations
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20170817230114.3655-1-richard.henderson@linaro.org>
 <20170817230114.3655-9-richard.henderson@linaro.org>
 <87377xijkt.fsf@linaro.org> <871snhibdr.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <889b3e05-64f6-8eb6-0c22-87b09b86b7b8@linaro.org>
Date: Sat, 9 Sep 2017 19:44:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <871snhibdr.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: /eKiSOIzLpbu

On 09/08/2017 06:10 AM, Alex Bennée wrote:
> Also this commit breaks RISU:
> 
>  qemu-aarch64 build/aarch64-linux-gnu/risu
>     testcases.aarch64/insn_ANDSi_RES8_ANDS_RES_ANDv_ASRV__INC.risu.bin \
>     -t testcases.aarch64/insn_ANDSi_RES8_ANDS_RES_ANDv_ASRV__INC.risu.bin.trace
> 
> Gives:
> 
> mismatch detail (master : apprentice):
>   V29   : 000000000000000005388083c1444242 vs 00000000000000002a000e0416a30018
> 
> The insn is:
> 
>   37c:       6f56a29d        umull2  v29.4s, v20.8h, v6.h[1]
> 
> Which is odd because I didn't think we'd touched that.

Indeed we didn't.  Still, I'll check it out next week.


r~
