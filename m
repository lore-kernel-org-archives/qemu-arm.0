Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp673378wrs;
        Fri, 23 Aug 2019 07:50:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwrERzj4G4b6nlv98er0jj5FxEOAQHp9/JVcfNqZweh86X9PnX8q3eD4mzlVarHk2PTzShK
X-Received: by 2002:a37:4fcf:: with SMTP id d198mr4360831qkb.394.1566571805675;
        Fri, 23 Aug 2019 07:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566571805; cv=none;
        d=google.com; s=arc-20160816;
        b=loQQWdk3NR4eTHTwxKhirqZzz1gaTyuLFKMD1TCNNSjvBrEF/9qFg8mmEtGrA3hABN
         akfYm3nY4fbWMDpqaqVHpfHsEC+rrFD2Sxgw+r6FjmRVSXYi9JQn+Xzxe0BLoBLhJ6Ew
         Z1QIwuCXCguR+QF+Qv7nRXdCO5pjVoPIZM74slv6MBT+rN2XLZEAbdIjweJRHZEUQL7u
         aD0qXsSMWzM4H1MrPN7HL90CSa+85wjRZvRwQ1h9qnSf8rIiYbuJvzGB5C/YaiULLTkZ
         GKOpfZkv88WBaxXClJlqF06N16X4/oo1lsnm4MRGbRq8OCamTy85gvSJ3ppo1mC0hN5T
         2rtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=t5KLg6wG4uIOGb4glckszS9qjHVN5Bcu52P7WbJKD9U=;
        b=VOWExZcwPEYEeuC/f6qjytAldSi07UJTRHHqphy3tCAPWwOJkq3YEclycGUDwD87WY
         BQNFsZZTynhn0XJ93muegYKZ5M46N5o9jpWmTaL1/H1mONj185DImUs7IMIMEffaHTkA
         DUG7vRKi3Vm4oJbdSjYtxNlNMBC7IcnBLOfrx6mv3FGoezB4+OmjCwV64eeNB15/Vm/J
         Ne4M9EcaeBf083yB6UE/Qs3kIni1oDnykwmylrfRKp3C67EECLRV/No385K4Ic1yaLP6
         fXQoQQtbB73Fh7Kvb3Va9SfS7npLPJ+eplitMzvK/uLtOfD3loWF7gEv1g+Q3quu2Lb+
         ZcxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NCxALKB6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11si2142989qvh.31.2019.08.23.07.50.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 07:50:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NCxALKB6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1AtA-0000QY-6s
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 10:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52904)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1AoR-0004hS-46
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:45:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1AoP-0002ym-NW
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:45:10 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:42191)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1AoP-0002w9-6x
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:45:09 -0400
Received: by mail-pg1-x542.google.com with SMTP id p3so5892624pgb.9
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 07:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t5KLg6wG4uIOGb4glckszS9qjHVN5Bcu52P7WbJKD9U=;
 b=NCxALKB6zggQJWeordpFAdQfKw0BCbG4IEfRs6HV0V5Kp24y+td12Z0Hbim7rovWKR
 9oTL4sF90oeHIxsSxgl7Et1nka82ygqq+uVBA+po5uQcuOTdgi8tPZHTpwKN3ybhtorT
 /TtEhHXjLGx8XZBl2uo38vmlkj42ADqCuMnAHKqVAEa/Rdfz+U0513n9xKBmbNAf7GZF
 JpU7/jOeQl3QPqtKOx6sp3bfi+y+YruuWUY+3vIPkjnTGXlyjTRWIZLc1FGwm3BXF/J9
 lTSYpoIrmnqPgr1o9TlNxqoOLdrXlTZarl54glC1itPAAxvA5GMQE4aIO3Ow7uBwxB5C
 V2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t5KLg6wG4uIOGb4glckszS9qjHVN5Bcu52P7WbJKD9U=;
 b=HTP3nhXNe/0Hc5NP5tQtLSawPxbGn/XRjCGRjNNmzJzpiR86+1nrtFOiQ7Ugn0U4Ex
 G8xCgsikbF3PCuOyGDJHmfWVWmTyN//UpyIaejZRnBtryelrThCgG5uBTszAP2fwN1Cb
 dcdJuImPH3+LxNw5/IZZMppJb9VoF28Z1np3n0pNk9lPSxxYn+iIp+YicRsBhMVk+MZF
 8phvu+9dwfE4Mn2VioASTMZcHBbTbjeFtMcjN1B2CA3Cxkx9IJvKITchysGNRICauaM6
 Ln+ERGoEfeiKW2R4xPmwUuLVl/TxbM5TGuYL6y6EO6R7bGuhsIaKEscibg5by65stSgA
 QhNA==
X-Gm-Message-State: APjAAAXoi5mSpwQ/rqFmfTrLPnh6BEQOFxyS733B0w4ZBD9AAGjbIbiC
 fWJMxW7igZgk7R7uBW/ztPMON93JMEs=
X-Received: by 2002:a65:690e:: with SMTP id s14mr4362638pgq.47.1566571506593; 
 Fri, 23 Aug 2019 07:45:06 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id m145sm2869750pfd.68.2019.08.23.07.45.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 07:45:05 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-20-richard.henderson@linaro.org>
 <CAFEAcA8Q3ujQFtZfLXTsbKBxUQAHCPo0i_TpdX9KcmnNUY04Eg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c8809173-6b8a-afab-507f-69983ac29224@linaro.org>
Date: Fri, 23 Aug 2019 07:45:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Q3ujQFtZfLXTsbKBxUQAHCPo0i_TpdX9KcmnNUY04Eg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [PATCH v2 19/68] target/arm: Convert T32 ADDW/SUBW
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
X-TUID: hVTKD+iGkzcv

On 8/23/19 6:04 AM, Peter Maydell wrote:
>> +static bool trans_ADR(DisasContext *s, arg_ri *a)
>> +{
>> +    store_reg_bx(s, a->rd, add_reg_for_lit(s, 15, a->imm));
>> +    return true;
>> +}
...
>> -                        if (rn == 13 && rd == 13) {
>> -                            /* ADD SP, SP, imm or SUB SP, SP, imm */
>> -                            store_sp_checked(s, tmp);
>> -                        } else {
>> -                            store_reg(s, rd, tmp);
>> -                        }
>> +                        /* Add/sub 12-bit immediate, in decodetree */
>> +                        goto illegal_op;
> 
> We seem to have lost the store_sp_checked() handling ?

Not from ADR, which of course is ADD RD, PC, IMM, and so wouldn't match.

>> +&ri              rd imm
>>  &r               rm
>>  &i               imm
>>  &msr_reg         rn r mask
> 
> Should this change be in some other patch ?

No, it's used by ADR.

>> +  ADR            1111 0.1 0000 0 1111 0 ... rd:4 ........ \
>> +                 &ri imm=%imm12_26_12_0

... here.

>> +  ADD_rri        1111 0.1 0000 0 .... 0 ... .... ........     @s0_rri_12

The rest of the store_sp_checked handling is here in the existing ADD path.
Recall STREG_SP_CHECK from patch 2.


r~
