Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp5156606lfg;
        Wed, 12 May 2021 09:12:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHAFZaYxcEZaMU5KyTuSjxBqo7w4y3Ky0WXz0fAQv7psUKY1JVTqMPrcpepLdN2K75OE//
X-Received: by 2002:a05:651c:3cf:: with SMTP id f15mr12338074ljp.404.1620835932454;
        Wed, 12 May 2021 09:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620835932; cv=none;
        d=google.com; s=arc-20160816;
        b=CJbspSrXitj/eK9nPOBoKkJ8b821maoKKSQo9KR1P1JWuJOyHmsF98hswpKaew0et+
         7996DEq+ST8l0SE/DmqBQ9zlXve/aE5p1XMW6vZjPTXmeDxdNb1WdGIyTiiw8hyGc/f2
         VvccJXsz7kH6rPlEjiJmH9aQNrqKEctPN9l8QW9d/n38c+mtQJode1LFocHiwn/SEQAG
         ao8Ulp5lnPW86ooGYXQBXwmoS1L6SvO2JWFAmv4f6aN84g5cqytwj7Olx7ZAyhFuEQjh
         Q7IHFiWlc8B8WJLf17aW/M9wNoRp0JXIoRgP/f3Q82LY9pUrhSFKOpVA/AEX8+GfzBdB
         W5gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Rhx/vEPkUE5wAJhRa9puML+p8F5Gzc4gc+uQHKDiogk=;
        b=l46up3DcraEvkVFn4Dk1ugsFrRYUBF6NZNA0GMOEfXYuCg4R6kvCKfcJpQRFz/eTS4
         Tg74Ny+UGMzAN/JTtBOcxFV9THE23zAs+0ofc8x2IA1wLnND/KNgYbKiTGWlkjaW0nol
         UQFgelI442ZAZ9EsKs4efAJYBeqNLLBVxGTEiCI2R82Tc5ChYygpCL7IJ7TL1+9thkQI
         drJ+yVMMpgvrw6UGAa72TROU11bYVoV0Hmk+Fe6kY6Cl6ZSAfdRJy/K9sIKFNewDYXp3
         7eRj6erDXj4n2h3HF46vXHOsPCMXyY1NAoGBJ787YfL6eBYW6u17dNQCf0lz5mvJC/DV
         ijjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mef7YJzC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si249016ljo.310.2021.05.12.09.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 09:12:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mef7YJzC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgrT1-0007Pe-7V
	for alex.bennee@linaro.org; Wed, 12 May 2021 12:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgrOQ-0006FY-BV
 for qemu-arm@nongnu.org; Wed, 12 May 2021 12:07:26 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:42534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgrOO-0004je-Fl
 for qemu-arm@nongnu.org; Wed, 12 May 2021 12:07:26 -0400
Received: by mail-qt1-x82c.google.com with SMTP id k10so4038561qtp.9
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 09:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rhx/vEPkUE5wAJhRa9puML+p8F5Gzc4gc+uQHKDiogk=;
 b=Mef7YJzCBYuctaK+Nb+A74j/5Lyun1498jBPRhBliSB22pkjTqKpbD2r2ZuVm98PXN
 EswqeTntOR7gfKCP5x6zdRrh0MMsPpYxQfUj1IVe9u0Bkb9rL18jov4MP32aXCGbRbWw
 LLqKHBj2K6SRyJu1m0lY9rJXGnlt7qu0rwgcEzZQaA+V02pnvS+O0pvx4W6BUmnR446S
 HcevYG6DFS7+ii4cjcgSd8es2yYxzkOhJ1XUEvCoUxyo2Gr8UNZEM788raPg0qJEgSMj
 OExKkRg6ObDb/YAIT2x4qRDAPUhZfq40peXF53XUfzgfCZoGYvoNgBFdU09f6PmDTURu
 qJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rhx/vEPkUE5wAJhRa9puML+p8F5Gzc4gc+uQHKDiogk=;
 b=HnHFx2+y3sMOy+6uVz3a37gfUd6G1SduPOt74UeQTWTHIEOKf5v5gWbKvgD6nGaL+e
 7Csly09LWgtEqiun5JJUCaTaxFJWXMFmmr21SdyYP1sAgndW05Ul313K5NXna7zr4q6u
 bFRNc66noNVPnD71x1BEurgR9eeQVsPN0L3/htlXWDboxI2FZn5wT/vM2fkTxQNeh6rA
 2LoBA1ibC//RdtT73dCM7Fc6y2Ra7mX78I+/4MGsba0fP72y85fBOR25gOWSkexIUsJW
 mVKEFnE52nZ7D0nJqi5pnGzSrTZePiaPg2vgGZdYF/RKUV1n6R7BqlKMmPrJ/iUUNrp4
 OfdA==
X-Gm-Message-State: AOAM5307a7usNU3++3ynD5KTMt/s1eZTRQzi6uAI0Z0EyrGr66Z8cmjC
 QZkgo6gi0zMlPBDSb/vytNdYOY/iv2wC3UipFjs=
X-Received: by 2002:ac8:5dcc:: with SMTP id e12mr22394488qtx.70.1620835643371; 
 Wed, 12 May 2021 09:07:23 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id z11sm285525qto.95.2021.05.12.09.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 09:07:23 -0700 (PDT)
Subject: Re: [PATCH v6 26/82] target/arm: Implement SVE2 SHRN, RSHRN
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-27-richard.henderson@linaro.org>
 <CAFEAcA_OknopgKOtwAoiLrKEXmtNDYpQ5EycnkzBuNbc7WLWag@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2aaae8fa-a3d9-a88e-53f8-eba2c789e55c@linaro.org>
Date: Wed, 12 May 2021 11:07:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_OknopgKOtwAoiLrKEXmtNDYpQ5EycnkzBuNbc7WLWag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
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
X-TUID: HcJbsfm8GuIv

On 5/12/21 3:52 AM, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 21:49, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> v2: Fix typo in gen_shrnb_vec (laurent desnogues)
>> v3: Replace DO_RSHR with an inline function
>> ---
>>   target/arm/helper-sve.h    |  16 ++++
>>   target/arm/sve.decode      |   8 ++
>>   target/arm/sve_helper.c    |  54 ++++++++++++-
>>   target/arm/translate-sve.c | 160 +++++++++++++++++++++++++++++++++++++
>>   4 files changed, 236 insertions(+), 2 deletions(-)
> 
>> -#undef DO_SHR
>> -#undef DO_SHL
> 
> Did we want to move the #undef DO_SHR/DO_SHL rather than just deleting them ?
> (I have to admit I'm not sure to what extent undeffing all of these macros is
> worth the effort -- I ran into similar minor awkwardness in the MVE
> helper .c file.)

Yeah, I'm not sure.  I've vaguely been thinking that the "operation" defines, 
such as this one, should stay defined
but that the expansion ones, such as...

> 
>>   #undef DO_ASRD
>>   #undef DO_ZPZI
>>   #undef DO_ZPZI_D

... these should only stay for their "scope".  But even that could be 
considered pointless.

AFAIR, DO_SHR/DO_SHL are pre-existing from the SVE1 work?

>> +#define DO_SHRNB(NAME, TYPEW, TYPEN, OP) \
>> +void HELPER(NAME)(void *vd, void *vn, uint32_t desc)         \
>> +{                                                            \
>> +    intptr_t i, opr_sz = simd_oprsz(desc);                   \
>> +    int shift = simd_data(desc);                             \
>> +    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {            \
>> +        TYPEW nn = *(TYPEW *)(vn + i);                       \
>> +        *(TYPEW *)(vd + i) = (TYPEN)OP(nn, shift);           \
>> +    }                                                        \
>> +}
> 
> Doesn't this need some H() macros, the way the T version does ?

No.  In the "B" version, we're manipulating strict columns (TYPEW in both VN 
and VD), and do not care in which order the columns are processed.

The "T" version reads TYPEW and writes TYPEN, which makes us have to care more 
about addressing.


r~
