Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5699242wrs;
        Tue, 27 Aug 2019 13:03:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyB/cweTx/oc6uPFIu/jULyOmm7LSKMenYpSVmnlbF19CMWONckY3ARhhu+M+/Yh51M8Vpx
X-Received: by 2002:a50:b924:: with SMTP id m33mr475511ede.61.1566936214817;
        Tue, 27 Aug 2019 13:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566936214; cv=none;
        d=google.com; s=arc-20160816;
        b=qomylBxXM6c95qxaBEW8CqDaA0Fa7NHDhJWnkC6az1Tth6KUOZAj3INAn5VVZayfIz
         UZAjd1bbRCVnB83BeFggPPDsvnUb+5NIwV5BlUla//jEypImcM6jPFws/zfV3NPTUU4J
         2QDZDTFGiiipzd5XHIJcbw8CIeTIUl3zoRd2RUrXiLvvQERN6E5q8KVyCao8EvYF2PF5
         sUBv/xraTaTV6JzVZy34TxzBTFWlRpr4OGT5zbi8QN4/LX/dx2bwRks6vfk1dRW7nBfD
         D6hTWOWjcq7l2FPRkUTJIrHkk78AKODTCR2CZDxJAT1JyXAtYom1OVYIpHvG6CztAD5X
         4yYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=2D2vwu1Voj+prAsL2zBwI1qGaiqZyAjfx1urdwYK3Xg=;
        b=vJuU3EPRIaRZkEd2H6oxJKz+hRoKgkBx2+U+Bf3CDR1/X5EPgS5K7Pm0ddECJn20jP
         mRrRm9PbJcbuMjQtRGm+gxL8HPjmWBRgxhCuW0yWrwYHZT3JrMcryLriG8sgpq2Pg9g3
         cDt/EFCXx7so2SS97lZ933kknrF0fK71OgjbTNghfTQyLoU8OQOy5vfCvaRdTeYRruBW
         Lziq0ndF2qfrG6wtLSasg4NUck8TSovG6Giwp5Yc1Q1hmnwaZD4ZCt2Tjp21mruzyvA4
         VniL28oNfG1fGcTUd2koUCz2jgYFtIhs/kVGZh8l2MQo6ZRIj/p8pfV4RhIOZFeTNJ89
         HLhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OSyszDMz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v54si9431954edm.80.2019.08.27.13.03.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 13:03:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OSyszDMz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2hgj-0005Z7-Th
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 16:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i2hfI-0004mF-NL
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 16:02:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i2hfG-0008AP-EN
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 16:02:04 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:40836)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i2hfF-0007rT-WC
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 16:02:02 -0400
Received: by mail-pl1-x643.google.com with SMTP id h3so72743pls.7
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 13:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2D2vwu1Voj+prAsL2zBwI1qGaiqZyAjfx1urdwYK3Xg=;
 b=OSyszDMzjWhzpvgCXTGSkuaDFrkzWKQvKbyvRpf5AG1VJTTpK8DAv8mWfnkvGi17lE
 4p4/gOFN93LW4GtAzaKjf6DV95ryPmE82rTJtxFEa5oBbtOZ9gC4rWzwP5KWrd3eVOR9
 LcAWgdn8gRvwRzPVfe3HCoLDYKCCDkxqfImiGYvlv0t4xyj6ByHg6IBFMAjlwSXxokuq
 x3bjH5ZmAFsDW7LG8hhbAmREU2sQ7qbjd1S82hVXbAgNrO2zNB6mri+dY6Pq0ACdoYsI
 Qxw5CFwa2z2bddJ8Aar4dcaeomUi7QfpypdbZYgTCf4cfsNcgg2WKFXo+svsHpd05/xr
 EbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2D2vwu1Voj+prAsL2zBwI1qGaiqZyAjfx1urdwYK3Xg=;
 b=MkFgn28fA+I/a8s7vsIZvy+L17/G8620N/sVEXS9hQhQs8Jiijy4POOhP8kdH4r9RX
 9DkJcx6ChW1maq9rGOiatR6qyDymV1y2nDps5JgDnmRijrqCHJ9h4jiSvvbiO/mqH+/o
 wpxB7VBMaV6hiNBIEh9mXNCfIyNOA7ak0e/VexpvWsLqQPFml0Aj8At0dBbwpoU6Y798
 zbp3BjMifU6ilPnMZ4NvWhYv04OPU7VUgsADRv564MoNEICDNDEWYU63v9yNEbBD0DNC
 YXOj5Wezu3BPPkP4HRRT133mzaBmYJau7DSwaDisjMjyRJjx55qlVXJoo4twYhHRFMmV
 gvPg==
X-Gm-Message-State: APjAAAXS61Fazx0mcHDnBupacpeLC2kE9NjQJsKX+3U+yWIXqSGhFQZL
 7bjx+CXA8m75RqeWZ34UGdfbfA==
X-Received: by 2002:a17:902:4581:: with SMTP id
 n1mr642128pld.310.1566936098123; 
 Tue, 27 Aug 2019 13:01:38 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 1sm147311pfx.56.2019.08.27.13.01.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 13:01:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-19-richard.henderson@linaro.org>
 <CAFEAcA9qN47t8zXJ7X3TmhkigSEjf+esxVNwQ0m9X=qa2KF_bg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9fe4184f-7483-4207-2536-16ee798f3747@linaro.org>
Date: Tue, 27 Aug 2019 13:01:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9qN47t8zXJ7X3TmhkigSEjf+esxVNwQ0m9X=qa2KF_bg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-devel] [PATCH v2 18/68] target/arm: Convert the rest of
 A32 Miscelaneous instructions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZJ+nMCwEKSq2

On 8/27/19 3:32 AM, Peter Maydell wrote:
>> +static bool trans_HVC(DisasContext *s, arg_HVC *a)
>> +{
>> +    if (!ENABLE_ARCH_7 || IS_USER(s) || arm_dc_feature(s, ARM_FEATURE_M)) {
>> +        return false;
>> +    }
>> +    gen_hvc(s, a->imm);
>> +    return true;
>> +}
> 
> I was wondering about for these trans_ functions the
> difference between returning 'false' and calling
> unallocated_encoding() and then returning 'true'.
> If I understand the decodetree right this will only
> make a difference when the pattern is inside a {} group.

Correct.

> So for instance here we have
> 
> {
>   [...]
>   {
>     HVC          1111 0111 1110 ....  1000 .... .... ....     \
>                  &i imm=%imm16_16_0
>     CPS          1111 0011 1010 1111 1000 0 imod:2 M:1 A:1 I:1 F:1 mode:5 \
>                  &cps
>     UDF          1111 0111 1111 ----  1010 ---- ---- ----
>   }
>   B_cond_thumb   1111 0. cond:4 ...... 10.0 ............      &ci imm=%imm21
> }
> 
> which means that if the HVC returns 'false' we'll end up
> trying the insn as a B_cond_thumb.

Correct.

> In this case the
> trans function for the B_cond_thumb pattern will correctly
> return false itself for a->cond >= 0xe, so it makes no
> difference. But maybe it would be more robust for a pattern
> like HVC to be self-contained so it doesn't fall through
> for cases that really do belong to it but happen to be
> required to UNDEF (like IS_USER() == true) ?

I agree this should be the rule.

E.g. for this IS_USER case, we have successfully decoded HVC and so should not
return false.  The fact that HVC should raise SIGILL if IS_USER should not be
confused with decoding HVC.

Other constraints, such as rd != 15 or imod != 0, should continue to return
false so that a (potential) grouped insn can match.

> OTOH I suppose you could say that when you're writing patterns
> like the B_cond_thumb one you know you've underdecoded and must
> catch all the theoretical overlaps by writing checks in the trans
> function, so as long as you do that correctly you're fine.

Yes.


r~
