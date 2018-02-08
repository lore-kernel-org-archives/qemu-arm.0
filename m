Received: by 10.28.71.27 with SMTP id u27csp2581903wma;
        Thu, 8 Feb 2018 13:49:42 -0800 (PST)
X-Received: by 2002:a17:902:8c81:: with SMTP id t1-v6mr371033plo.363.1518126582673;
        Thu, 08 Feb 2018 13:49:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518126582; cv=none;
        d=google.com; s=arc-20160816;
        b=gdG+yf2X9KaWUk0xNCkXJLVR0mPVAKDgGeeXny3Y7+JNqHt4dAXTKvrgPAqOedDQP4
         sW3XGMT3xCGCkgbyS9MOpLmYi5BCKfu8Ss/QJE4SFHh/0ku7/CptGkTTSLy2lR/fo/1+
         pL3dawC14LlyPj+Tq33u6UZYDL5MHcvUaHCNDmjbt0JMZgLv5qarTao2EsSmUPA1aQyl
         Ja/V5z4YmSbIoKoEtr6fbaYpTmOMm700CpxO8UX7ODwx6jOcydfQuoD66L2qFlafT9S6
         Zp/QRYlv2t9uAdiPUFPqgB04zlPXwpZA6Ntbys4EspXn0GbmExxURcN0wtHCiMG1fewJ
         GxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=xBxU+/oq8im58n10OSUf8ZKdQC6+L9N431q8a+5SDxc=;
        b=1HVxiprGo7icQmCFdAxRPEEUXpah+Q/LfZNAnguq9RITXibpL+JWc7HINAjdpOL9IQ
         mRt0X4KeGmm7gm5J9rVfqBLlY38SbUbBT5vvZIAMVj40cCIzy9yHeRsh9Bm1gikuzT1N
         OAdzbjqQotgARnRAdTo/MDmLUT+sX76/9GTqkvItSW23cdg3yQzWYnnJL0VHQbr0ZEBG
         Ne7VEGb7Bv/NV0n4pXaUAao77qzrfVXSxXL4NwDFcLQxfSB9o+YDuFJG2bhe4/FSo04/
         2s3FCtpUSI3WIccEXwGrBo0mois4euQ+FKA4PxbYauom0MBTW/nAayStwkA5IZNgEXFx
         4ATQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AgwoSkK7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s13sor271608pfg.56.2018.02.08.13.49.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 13:49:42 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AgwoSkK7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xBxU+/oq8im58n10OSUf8ZKdQC6+L9N431q8a+5SDxc=;
        b=AgwoSkK7G9SAkbW2bGWmRJHZUGeG4Ntcbr/gjyyYei1XYIYMunQ769lNz2bbKkWgz9
         uBR480trRdxtWfOohNDdlfixmVh/Kuvi9GAIL3KkkzRagN32tEDIMbNGQgOTIv9tDY3W
         Eq7G+TdR+uUuzb1T8EMNLlxJFKl44ZKVBJK0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xBxU+/oq8im58n10OSUf8ZKdQC6+L9N431q8a+5SDxc=;
        b=sueIl8u/nrNDc/WTQKEtUmVXX/GbrujYJq7T503QTiRfZKEbPhPRyF0AkfdmoLESg0
         4Q+L/ef7GLnEHN/E8V3RKLXXefz/LDDfLpcu5lMr26HLWXfCnM6ZdDA8r9nu9ArNgQAi
         FGQrsDcPVoBbk79gCzVDYRsfXG6OZFLxaLaMw4qrY0CCPDWTflyquYe4pSB6dIXZB+c4
         L+MHenNrXiW0908W+/i3lwcNsp5tixxJELL9kQ784l9TuCJKXclOqgGFNdevm8YbvlZ+
         YLzcRYh/f6NDiaVeYLsc+GOfa/i0lL3BqvoNbmBtl3ffD7PBbdqiUB2Nd6fMoNudumI6
         1eRA==
X-Gm-Message-State: APf1xPDiQGxqmA/FNt2Wzqxepl69+O26Dfz+MA12wa/MCFTvl1GZB19Q
	ue7Xla75ZNAD12o55k7Q9fccA/rHNiapsg==
X-Google-Smtp-Source: AH8x224MNEu3R0uqQYdbwcztREj87oMvsk6kaE3DJ7P8A/Xw2kmJ4eIha2mARUZiWjDSQa04ChJeGA==
X-Received: by 10.98.130.193 with SMTP id w184mr443984pfd.111.1518126581985;
        Thu, 08 Feb 2018 13:49:41 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id s23sm1670167pgn.26.2018.02.08.13.49.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 13:49:40 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 15/32] arm/translate-a64: add FP16
 FMULX/MLS/FMLA to simd_indexed
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-16-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f9f6893b-3fd7-69ed-c7ae-c54d67897955@linaro.org>
Date: Thu, 8 Feb 2018 13:49:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: MeoLjcJurn5D

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> The helpers use the new re-factored muladd support in SoftFloat for the 
> float16 work.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org> --- 
> target/arm/translate-a64.c | 69 
> ++++++++++++++++++++++++++++++++++++---------- 1 file changed, 54 
> insertions(+), 15 deletions(-)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c index 
> 3a2be1e016..83a1fa3116 100644 --- a/target/arm/translate-a64.c +++ 
> b/target/arm/translate-a64.c @@ -10804,7 +10804,7 @@ static void 
> disas_simd_indexed(DisasContext *s, uint32_t insn) } /* fall through */
> case 0x9: /* FMUL, FMULX */ -        if (!extract32(size, 1, 1)) { +
> if (size == 1 || (size < 2 && !arm_dc_feature(s, ARM_FEATURE_V8_FP16))) { 
> unallocated_encoding(s); return; } @@ -10816,18 +10816,30 @@ static void 
> disas_simd_indexed(DisasContext *s, uint32_t insn) }
> 
> if (is_fp) { -        /* low bit of size indicates single/double */ - size =
> extract32(size, 0, 1) ? 3 : 2; -        if (size == 2) { +        /* convert
> insn encoded size to TCGMemOp size */ +        switch (size) { + case 0: /*
> half-precision */ +            size = MO_16; +            index = h << 2 | l
> << 1 | m; +            break;

FWIW, the size check for the integer insns is done in this block (in the !is_fp
side of course).  I think it makes sense to do the size check for FP insns down
here too.  So, e.g.

    if (is_fp) {
        switch (size) {
        case 2: /* single precision */
            ...
        case 3: /* double precision */
            ...
        case 0: /* half precision */
            size = MO_16;
            index = ...
            is_fp16 = true;
            if (arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
                break;
            }
            /* fallthru */
        default: /* unallocated */
            unallocated_encoding(s);
            return;
        }
    }

Just below, you have not updated the call to get_fpstatus_ptr.
For the record, for fcmla I needed to introduce an "is_fp16" bool here.
(Since of course a complex fp16 is 32-bits wide.)


r~
