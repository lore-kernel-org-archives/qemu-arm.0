Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp893696lfm;
        Fri, 19 Jun 2020 12:45:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypHa4x8gIA9JPynb+P/piIzDFqox8e2PwT4zB1Sx/YvqoPsXrDI60+r/H+kBBsZjE9CNVO
X-Received: by 2002:a25:d088:: with SMTP id h130mr8701877ybg.451.1592595924014;
        Fri, 19 Jun 2020 12:45:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592595924; cv=none;
        d=google.com; s=arc-20160816;
        b=GfMR/L31BWCVNV8NMPDhUquLbSJT5gzArOISs9BsKontiRngUv5RFgjjGWbGMWQQ1W
         Ib3a3cQak0jvlPQxKitmM5mwElimLNdSts+GrdtFO6j333LoH0kWvAAjR44p79eIyf7M
         M0jb6rfORIwHdLbowKTrKqYzYEUaIZb/y+nL0vhfO7p6T1ERBta6qwJp2qZGfWMjidJe
         Qv5D27eR01QL9v3jm2denXzGWAv5+/YzOLDVuUo7qy4AB+lJhkOawTJPSbBrwONRlIZM
         UxMvwMgo1rPHtaNXnmnk0hXKJsc5I4/3RmrAu36p0n4QMHPbCpclnI/3soIQKybCBoqn
         JG2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Lo+f81iqbjMelgFVu9zSInVEJjPZTe6mOs11ccnBRuQ=;
        b=JABndzZbvEROjGoJhDa4F+27KDcNH0Y4sN9q8KhkHR6JMHnT6sN/CBqSa6fOe71kVQ
         a3gU7qWOWLQjBWS7jWC0HQLgI98+hLB/szSXr51ZrYF9UJA51+tpa4gWk9EDYT4unCsK
         W9UUhBuID1+0nqARqYU98e1plcp3qwzcCFt98FJV9RHPshMaykSBO0GRs9PclG2i/cVL
         87Zi9+cXfayl+MPzihSEaWYMCiuvLawPTps3WQsZr707gzPll7YSSQPC+dZmP7FxtJEf
         ZLyHVfo8LJKJJJ+YVcUHNxokHYrWTCqJm9kcX+wW0LNdhiMm8Gsv0Ys+xaw6yAICHGXl
         Beew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KGzl57pm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c203si5882601yba.431.2020.06.19.12.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 12:45:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KGzl57pm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmMx1-0005UW-DZ
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 15:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmMwu-0005TB-Ce
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 15:45:16 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:40919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmMws-00066B-Ji
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 15:45:16 -0400
Received: by mail-pl1-x643.google.com with SMTP id x11so4309522plo.7
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 12:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lo+f81iqbjMelgFVu9zSInVEJjPZTe6mOs11ccnBRuQ=;
 b=KGzl57pm2iA6vG3M+8YqVviH4kcpmdfxU/Ipy0sMwMsupdbsdGxfX+WQpWUkf6TaGS
 GcjPQQrnqYex87M/EQLB+UdWTwOird/C3Qpenbw/jAKlgj4VWQxxD6/U2GXlPJo/EXmp
 kstK5XOUHau/8CZSZ51RdhXxQqliz8A74Krzv2V8+b7s57v3BfnUtWf9VALOcFWhA8ZH
 5sEMgpFeQ3sJUkTcaAe6CjoH1nUFDa3JI56yYPpx9Ev9DwU/f8LDT59623OKFJ4+Frsv
 SVq2ksHSG9aP2rzAxvZtTWvJlEzltM7lMW3CfRrhk837jGnCwI9lCQHdZzRgED7QxwDj
 a6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lo+f81iqbjMelgFVu9zSInVEJjPZTe6mOs11ccnBRuQ=;
 b=dc1+aqkJZbiHJxBum31ZzoTnGltQYTm5xpVKG27LVoMWTogBAY9EKky0S/ISVVXCq+
 heqxNmrJ8ygvgBiI0+F4WaE42P5ndAi1qZAo1T33c71xy88UWGgREohHd9GHIjCTqJ1e
 xF1OWzLvi8ztn5MwZdt/eaiYm61UAFU+KQVrrqAOVQ4UkK1bCCZ02jhXAhrsqXJqdwyo
 O1dKdxfsVdehQ7A0QMVQDdwfdH19G2BOyaw9mbnoQPQqniEeLnbVVbdi2pPD/hUj4yay
 p1fdAUeHf1l+7kI+dVfur4g/r1/P10Es/ZczsRvEgrWqjjnWEUlpfNvzBAY4PCrqygp/
 MC/Q==
X-Gm-Message-State: AOAM533qVrt3GT0GeITwtck9wS3g/0ymIj14QIcsC7GxuHwtg/zqLgER
 BAvP0hXj850tNiBPAoLEB5gSjqBV+MU=
X-Received: by 2002:a17:90b:3d1:: with SMTP id
 go17mr4869952pjb.114.1592595913123; 
 Fri, 19 Jun 2020 12:45:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o207sm6720190pfd.56.2020.06.19.12.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 12:45:12 -0700 (PDT)
Subject: Re: [PATCH v7 31/42] target/arm: Add mte helpers for sve scalar + int
 loads
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-32-richard.henderson@linaro.org>
 <CAFEAcA8870uLGsGW+A5_QC4PPFnwMfywyvF5KV4yCkqbT6==Qw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0dff6f5e-72a5-8061-2688-fa408cf4b2ef@linaro.org>
Date: Fri, 19 Jun 2020 12:45:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8870uLGsGW+A5_QC4PPFnwMfywyvF5KV4yCkqbT6==Qw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yHzqTgdZ9B9X

On 6/19/20 7:06 AM, Peter Maydell wrote:
> On Wed, 3 Jun 2020 at 02:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Because the elements are sequential, we can eliminate many tests all
>> at once when the tag hits TCMA, or if the page(s) are not Tagged.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> +static inline QEMU_ALWAYS_INLINE
>> +void sve_cont_ldst_mte_check_int(SVEContLdSt *info, CPUARMState *env,
>> +                                 uint64_t *vg, target_ulong addr, int esize,
>> +                                 int msize, uint32_t mtedesc, uintptr_t ra,
>> +                                 mte_check_fn *check)
>> +{
>> +    intptr_t mem_off, reg_off, reg_last;
>> +
>> +    /* Process the page only if MemAttr == Tagged. */
>> +    if (info->page[0].attrs.target_tlb_bit1) {
> 
> It's a bit odd to use this bit here when you don't define what
> it is until patch 40. (Similarly for the next few patches.)

Perhaps.  What do you suggest to resolve this?
Moving the system patches earlier?
Just defining some inline functions for self-documentation?


r~
