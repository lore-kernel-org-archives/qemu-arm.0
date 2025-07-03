Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp655630dyc;
        Thu, 3 Jul 2025 09:25:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUF6RplrrHwlTzl6SoD0oeC3xBmLsA4+hfsRGc30+DwrSoG8SkjemttVGMVo8KxR0UwRhUzQMMTFIeI0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHGDCm9Q3X4h5bbEvyl/4d4FsOgkywDT/Ig1KExRdXXuT6QCTmNUO/1YMuVkvhJyXFO6xP9
X-Received: by 2002:a05:6102:8021:b0:4e7:7146:a9e with SMTP id ada2fe7eead31-4f160fa9c2emr6470665137.6.1751559954239;
        Thu, 03 Jul 2025 09:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751559954; cv=none;
        d=google.com; s=arc-20240605;
        b=XTXcm9e32hmDe/iqda4DrpBotXGzqW3NRRmv/9CnkGaeI1+uRrlZ4Gy1uIxYdtDxfz
         W7r+KuO5IErB0HnGJwu5/uil1G/Ar5EBAB7JSGDTudTfgNT1P1KZnyNYBqWgbO2b4TGw
         UWUcV+zycBOg0LCk/ntClUPyetEY5YRmkdHK0NVGhk5rs1ZjO07CYJSzsjPzJgl8ZurP
         BEZasWxg2v6faJdWynyTEL9lFbzwYPcxqb+f0kECdQ9YfyPxvUIW8zQaebe0Gbrw+5DN
         s35UxgvGKmmUeKj3AJamh/s/0RmxiomBIGIaJHyNdaNDhMx3rDPxW7yFR7A+8s4+Y1G3
         IrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iuA9MTMi0aNFWovQAIYAzCslGaCVz5WTerEbR0coeMw=;
        fh=Akz3M6uWd5xviziEOgqZHvH56BwfcISj6EpQ/dPtIeI=;
        b=axBS/KKJYvWiR7WfWOZz8LDc5siOCZZKttvu8ADHmmFRWWcXiLHWSxex7vbtGLfnn9
         imu3TEaaOJ6TBkO49EAfu1MhCQHxbjpcsDoc0S8Kq36mPTsWAyLCu8jY0cBJSzGnnqPM
         fUt+zDTWZdVoCdVqWmrI/bDqauCat+r54fFWpR0AYx8sYT5qHA5yMI+XO6YBELstiG0+
         UlUUupfNFa3yB0nt101jo7rOesIrKIkgnTOGVGjYAR7gTSonySIyIbr2btEwP20S9Eck
         gHBQPNYT13jqWKxo4MW+9ai0ng19H+5+CEshPy5nwcfpx1OolwHptoVW/QksE7EjdpRs
         Q/2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G0uxV/Ir";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea4e8ee9si147825137.49.2025.07.03.09.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 09:25:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G0uxV/Ir";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXMko-0002X8-KB; Thu, 03 Jul 2025 12:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXMkn-0002Rw-9O
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 12:25:41 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXMkg-0007Ir-0u
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 12:25:41 -0400
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-4080548891fso45430b6e.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 09:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751559931; x=1752164731; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iuA9MTMi0aNFWovQAIYAzCslGaCVz5WTerEbR0coeMw=;
 b=G0uxV/Iryxe9k7FQyNnn3sgHap/fSEJYIAP4lIOzfzF/32OCYBOOsmFGP+kj+HV7O6
 XmyvBWSj1pFLoSMoMkNikfBGGnzPtBB1Xa/IHwYwJ+0jQt6eZ0wrIXoX5QLx5wPXt8oV
 /xpfZAqtIBW+zIafLmZj9gzqMc2M6raoP/+YeP3xq+EBU5I53UZ/4jeUZCAXDyaxF6hu
 anUD6eSAaEWzbxR2cAaPvSFz1EXbDiNNVHjCyNk+8z1EzazHQ/arOwXF7unXok0FBZcZ
 bRf77TqT8Qo3VwJX/lt3dSyKCFf6DE7Jf4+2dfeXXs8b/C8DStKFxtt1RzsfeVMu6heo
 7LVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751559931; x=1752164731;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iuA9MTMi0aNFWovQAIYAzCslGaCVz5WTerEbR0coeMw=;
 b=UyJxnhHa+X2wDYVxcR4NDSSkRghVZnEtPMEPV5/usRfuPcXZAcyDaYt6kQxvu2WxiT
 zJUz2+/mV5BFOewA9XTT4vNUnf79x2AaCFG0IQ1P1dz4RMP6v+LU+HtklnDRbIHEejw9
 w/vmySJ7YEP95W4afERJfr9vFzVgrpqTvweC4joa1DeXTRsHzViZhvIHOVxniIDTL+Cx
 ICbceWz+TreHj7r6Npgm/KOK7kuUrWFFog3v3wdF/1RwXt+aRxd4yFgLKV/P4wb5tMOZ
 zJggDGCByjMEGY8kY+q9O8kzPZ5itI+LrTblX9xvzOYNtZfUJJSF4lCBrVn4uutCJ6Zy
 Y2NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCYgazcs7vCKozc+bbXNLHSzMr0g5GNH8MZJXtP5n7PFILDYW0/cSuYUgs88YQvext8kxlSpG/YQ==@nongnu.org
X-Gm-Message-State: AOJu0YyVV+3sUbk7V+faSsajq/RqUxIg+jMuL/Id6wkW9IxDe9USxwNR
 sDlvUZ92gfRNuP7UF4f3lPaRN5or48SvurDFAxr8+fJOjX+o/qR1ByDjDy3Sw++67RdUKt9HUny
 v6ZWPVl0=
X-Gm-Gg: ASbGncscczSAxci8kC8UkZXxmw5VlHE+HTlEWcS+UacP+9zdoqntmGuinLfFJdoAOzT
 sITi0Jiorjj/tXtM18lq/fxd3PDC6FKVUl8KEsYqzbUKx64rVsjPcm/erDifGIdBJAl2vCWliBG
 zF/5p+XMUBBhua9fzRDGMkGxORzjXvxuRJBRJlmTs8vxK88qkJz/uty0t3v2CfQSfTby7D1x3/w
 WA2dCIN/H7RgQOE7GDQwKLErRQ4PgyYs+4nuf9r9u1ZRMC3EZJ23EHmTW1u8VlPlZ0Oy8hn0gKp
 c2qUeNndNAXsVXMiTUle12QbCCSBlR+bAqzK/RWQUfq9FTAF9rhCG8Vp3eZwzN6aFxkJHGw9R6B
 ggyXOPimhUKQ=
X-Received: by 2002:a05:6808:1691:b0:40a:532a:7102 with SMTP id
 5614622812f47-40b88789c19mr5626321b6e.16.1751559931383; 
 Thu, 03 Jul 2025 09:25:31 -0700 (PDT)
Received: from [10.25.6.71] ([187.210.107.185])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40b3243dd8csm3031351b6e.47.2025.07.03.09.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 09:25:31 -0700 (PDT)
Message-ID: <2767ec10-d08d-4de0-95f1-3362e2acf15e@linaro.org>
Date: Thu, 3 Jul 2025 10:25:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 31/97] target/arm: Implemement SME2 SDOT, UDOT, USDOT, 
 SUDOT
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-32-richard.henderson@linaro.org>
 <CAFEAcA8szLP4mEvkatHhbBJzU5A6w0XGcMRRJYr_HPSNgZmU7Q@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8szLP4mEvkatHhbBJzU5A6w0XGcMRRJYr_HPSNgZmU7Q@mail.gmail.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: AE/ZWqfiZZJJ

On 7/3/25 03:45, Peter Maydell wrote:
> On Wed, 2 Jul 2025 at 13:34, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> 
>> +/* Similar for 2-way dot product */
>> +#define DO_DOT(NAME, TYPED, TYPEN, TYPEM) \
>> +void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
>> +{                                                                         \
>> +    intptr_t i, opr_sz = simd_oprsz(desc);                                \
>> +    TYPED *d = vd, *a = va;                                               \
>> +    TYPEN *n = vn;                                                        \
>> +    TYPEM *m = vm;                                                        \
>> +    for (i = 0; i < opr_sz / sizeof(TYPED); ++i) {                        \
>> +        d[i] = (a[i] +                                                    \
>> +                (TYPED)n[i * 2 + 0] * m[i * 2 + 0] +                      \
>> +                (TYPED)n[i * 2 + 1] * m[i * 2 + 1]);                      \
> 
> Don't we need some H macros here for the big-endian host case?
> (For that matter, the existing 4-way dot product helpers also
> look like they won't work on big-endian...)

The logic here is that all columns are treated identically.

...a0... ...a1...
.n0..n1. .n2..n3.
.m0..m1. .m2..m3.

vs

...a1... ...a0...
.n3..n2. .n1..n0.
.m3..m2. .m1..m0.

d0 = a0 + n0 * m0 + n1 * m1 -- it doesn't matter if n0 or n1 is at the lowest or highest 
address, because it still gets multiplied by the corresponding element in m, and then the 
two products are added to the sum that is addressed the same way.

The existing 4-way dot product uses the same endian independent logic, fwiw.


r~
