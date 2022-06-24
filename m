Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp369604lft;
        Fri, 24 Jun 2022 07:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v4ZqJdR3O1VkAZ75mDKzqyb0awKcBz+++PsUgMqTtL4aDY22b2OnMQglZg5jv+lvx9CMm4
X-Received: by 2002:a37:bc03:0:b0:6ae:dad9:4df1 with SMTP id m3-20020a37bc03000000b006aedad94df1mr10827803qkf.734.1656081439314;
        Fri, 24 Jun 2022 07:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656081439; cv=none;
        d=google.com; s=arc-20160816;
        b=A1FrIsTE2QgDW0sfkHt1qPD6z59Q/OaQf5d15PxqPAsBYYb78+41ZAhX9zbwCaVHA7
         Qo6t7yKig0vBKvOLpcWXwJKOdNY2CSPzw9p1rAKvrqaJfOM0fCHWl49Jhq+ScSXjAjuB
         Tyq9g+J/btagJtxygHVWs35BnX3rU41XeXR8TrhNnNPsCwrTZpjDe0jPmnVbSkPy4C8d
         FNTdMSfEY0ldC03c7evoZ+/Rgwiji3uoOoe5UDxFxp8xVraYWUOf2emwaWAzJ2WMV4q8
         o0Cj8BsgcpFMpwCok7L7ZqHqMo/z5lS+kZbap6rbokSelCJEkIX75qn1p/+X+Ssx8II6
         el1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3jJQAusAk2c0Q/A4meJ6eTMz3NMMwKmecYfR4GUNgck=;
        b=CNgGvlmxNEPtkNMjhT6bWTjkLuJM9ZgaJP84YqBGDUJjS4selVylVpAilJj8Z7h2+f
         FsTVnnKzWZk1Hj341Zb2P8D0bs5Zxmz3R1n6QqMemoADbHg8nfEVIY/ArKKxm0uBlnyT
         QxD2r2QJqQy9sYTcSzvWmXB6mk2AzUY07dQB8WseQuRcitcWs5L32akKcpv0YXwuur74
         2DRvLeZtB1OjCwIHXab5zaBraJ3TOAuODG4VMMeBksvT3XOAsPkFT25WWx1sHblG5OFq
         XsYJ+BZPFz2JqfMbTSIzgdH35WcQwCdmBy2kGD4nJjrbMgbTcSblL0eoQ3HubYDaknPt
         9miA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hZIs6V5Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr8-20020a0562142a8800b004705caabd15si1510745qvb.251.2022.06.24.07.37.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 07:37:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hZIs6V5Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4kQw-0004ao-PQ
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 10:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4k7M-0002UQ-Es
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 10:17:05 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4k7K-0002Te-NH
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 10:17:04 -0400
Received: by mail-pg1-x535.google.com with SMTP id g186so2572206pgc.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 07:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3jJQAusAk2c0Q/A4meJ6eTMz3NMMwKmecYfR4GUNgck=;
 b=hZIs6V5ZhGehLmFWTr2S1puNyt8BFgfXoqA57Xyu4DSB7Sv/RP9FElBBsW5w8kuvCo
 u22Zcbnh2aYXO3B12OdvLQVYEajhztSJVJvdgve59nC/JHl3DvqIJYNJOEL6I+E4SK7e
 h67TiCXcDEacC9AVZRtae0coI4Y7lQ/qrXpxIZGq0hVIGEITvQUYbpvfJe3NIMcXxZGq
 m6ctLVcf2Q8AQ7AUUwQwLtfQfwRBt5QDdXx3yQ2aG++phCC3v4CNUJDSWd8fD2Bm88xw
 OUts3F2Iw22l8BuEb+v3RzAMg7dc0hAX0SLrZpbG4eY/+F3bolf8Ywr8gehsdv8iclWz
 wwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3jJQAusAk2c0Q/A4meJ6eTMz3NMMwKmecYfR4GUNgck=;
 b=TLwjHCwFLf2lIAwd/+drIVTQYqRJND3KsiXSAplO1+bJPFzOc1rF1Apm4ZWgSTrw+0
 6kZUuzNXWIHcWKmf0zwMkLdEgy0BzsaQT8hUXLfHnFD8ZLOrrnEFsA024XQoFg8Xqssq
 QO3G3CiOqB6DoK2tAa5fE1O0vg/CzeCxndyb3ZMy9DTjCfvQzwB4Vxto9EezLi0iReJr
 jP5KzFZ2ebVERTQA7LVSmy57TaeRlmDZwwjA6Gtxfbv+TK1xL+3dtXJrQKaJIdOoz+K5
 cCcpaA4aN+1yHi0spIwE7AC+JTOgKzn6qbKjBNs3bIjqQJm0CI3+PXDRCzRdeXntfBSy
 qAYA==
X-Gm-Message-State: AJIora+KoB5bhJpldktUY0retqf4IVd4Mc+hMqtVUXcYCLBEETM1Lpnu
 tb9OwquTtOplA4displeRv58pg==
X-Received: by 2002:a63:4643:0:b0:3fe:e16a:a01f with SMTP id
 v3-20020a634643000000b003fee16aa01fmr11911793pgk.91.1656080220548; 
 Fri, 24 Jun 2022 07:17:00 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:b25a:9949:8352:ec5d?
 ([2602:ae:1543:f001:b25a:9949:8352:ec5d])
 by smtp.gmail.com with ESMTPSA id
 rm10-20020a17090b3eca00b001df264610c4sm11513383pjb.0.2022.06.24.07.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 07:17:00 -0700 (PDT)
Message-ID: <c2eae981-55e4-0430-ee56-ac853cfc930d@linaro.org>
Date: Fri, 24 Jun 2022 07:16:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 30/51] target/arm: Implement FMOPA, FMOPS (non-widening)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-31-richard.henderson@linaro.org>
 <CAFEAcA-y99PmUdPbdrWSj=_vUy35tRRFOJgkG2Lyg1A_iK6qRQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-y99PmUdPbdrWSj=_vUy35tRRFOJgkG2Lyg1A_iK6qRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pYPkmmikSh2z

On 6/24/22 05:31, Peter Maydell wrote:
> On Mon, 20 Jun 2022 at 19:07, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> +void HELPER(sme_fmopa_s)(void *vza, void *vzn, void *vzm, void *vpn,
>> +                         void *vpm, void *vst, uint32_t desc)
>> +{
>> +    intptr_t row, col, oprsz = simd_maxsz(desc);
>> +    uint32_t neg = simd_data(desc) << 31;
>> +    uint16_t *pn = vpn, *pm = vpm;
>> +
>> +    bool save_dn = get_default_nan_mode(vst);
>> +    set_default_nan_mode(true, vst);
>> +
>> +    for (row = 0; row < oprsz; ) {
>> +        uint16_t pa = pn[H2(row >> 4)];
>> +        do {
>> +            if (pa & 1) {
>> +                void *vza_row = vza + row * sizeof(ARMVectorReg);
>> +                uint32_t n = *(uint32_t *)(vzn + row) ^ neg;
>> +
>> +                for (col = 0; col < oprsz; ) {
>> +                    uint16_t pb = pm[H2(col >> 4)];
>> +                    do {
>> +                        if (pb & 1) {
>> +                            uint32_t *a = vza_row + col;
>> +                            uint32_t *m = vzm + col;
>> +                            *a = float32_muladd(n, *m, *a, 0, vst);
>> +                        }
>> +                        col += 4;
>> +                        pb >>= 4;
>> +                    } while (col & 15);
>> +                }
>> +            }
>> +            row += 4;
>> +            pa >>= 4;
>> +        } while (row & 15);
>> +    }
> 
> The code for the double version seems straightforward:
> row counts from 0 up to the number of rows, and we
> do something per row. Why is the single precision version
> doing something with an unrolled loop here? It's confusing
> that 'oprsz' in the two functions isn't the same thing --
> in the double version we divide by the element size, but
> here we don't.

It's all about the predicate addressing.  For doubles, the bits are spaced 8 bits apart, 
which makes it easy as you see.  For singles, the bits are spaced 4 bits apart, which is 
inconvenient.  Anyway, just as over in sve_helper.c, I load uint16_t at a time and shift 
to find each predicate bit.

So it's not unrolled, exactly.  There's second loop over predicates.  And since this is a 
matrix op, we get loops nested 4 deep.

> The pseudocode says that we ignore floating point exceptions
> (ie do not accumulate them in the FPSR) -- it passes fpexc == false
> to FPMulAdd(). Don't we need to do something special to arrange
> for that ?

Oops, somewhere I read that as "do not trap" not "do not accumulate".
But R_TGSKG is very clear on this as accumulate.


r~

