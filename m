Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1436277ejc;
        Fri, 11 Aug 2023 08:06:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfXoW2ZnPXREGUujWRhNrsL2nOVihKFgYPxkeABOSKS9It8TBj1ahNXTEpllz1iUhAxjZz
X-Received: by 2002:a05:6808:308d:b0:3a3:ffb7:1dd4 with SMTP id bl13-20020a056808308d00b003a3ffb71dd4mr3021757oib.6.1691766401212;
        Fri, 11 Aug 2023 08:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691766401; cv=none;
        d=google.com; s=arc-20160816;
        b=rOtrNNyP8vbIZJQQjB6VYovRWDnTmhochJ4ooD2KG8Kyv+qsO45/LTAkeAzmJ+LjyN
         dLwZr4Re+Ar8LoZwRcJ3oqf2SFCz/Qn0sBSN36b1Cw7zgnXHEma7gTV2ewusAhG6L4dK
         BDzK/4to0QPOfN5i9+24Iq8u9gbAg8sAxeuDFN3Be+Jk8/SyITEarkqv+4BmD+A0NROi
         D3MYvaUhoBpdun1r3USK6kFX82Guk51UwuF18gy3/7Y7+seqLb7xl/kcpmKyUk6bPD4L
         S6ic1LW5anwo1rUMoQREfrSAGRpnzkzOVtGBMLl+ssDtmHd/o4st53Y8c4DITuXvQlx/
         QMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NzGcAH/wncr/lLEDpQNjY48DJKuZa1xa3K7ctnyqPhA=;
        fh=suv5xTjx36fqisDPVLYE9Wxpju9TBVv1sbkAE72NWoc=;
        b=0nUYxpgWru/PNMoGH4KaJsoN2XQsOrA+xbA71oLCzEU6kZ+A0cCzt5MsUinXuaLkfc
         FJHs26tQZOUXAzonPb+Wt1WAiWX6j2RCwVwH4yb1+D4Dt2MdS6Nz/BJk/RiVL6qaILFB
         gRR9Cv3Hwu6yGZTNFLtKQPE0Em8/gkmmlFfyh4jiVuhIh8pZFDBib7P33WFtJ0XP7jkq
         b+cShyseSRbwbm5VSuJuTX2LiGXZDvmhX1nD8MxEwU3+KSWJKq0OVBijriGFrgCNup4G
         N2qGTcWsV2jWoVIWuLx41Cqh6/rKXGWaHz16FLo9yxbaPGvC57eOg7SESf4Poil6/cRG
         Gvig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ewPr9aBf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10-20020a0cf30a000000b006446d11efa9si320824qvl.284.2023.08.11.08.06.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 08:06:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ewPr9aBf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUTiT-0007BI-TY; Fri, 11 Aug 2023 11:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUTiQ-0007AN-JF
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 11:06:15 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUTiM-0005eF-Qi
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 11:06:14 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1bbf8cb694aso18047655ad.3
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 08:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691766365; x=1692371165;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NzGcAH/wncr/lLEDpQNjY48DJKuZa1xa3K7ctnyqPhA=;
 b=ewPr9aBfFeMHvRKTY4BnGez/n6gOhTaZI8XpC/MeZRcyIUBAzO+OZL8tlPzH/wx/CK
 VgW+w7BCIj7ej1rRcLRJ+Ei3rJ8RgbLdJ5YVPkDCn56+OJHVUTpZo+z17ojBU0ldBqOl
 ztNf751uA3v2/2lmadO/xytegJuhZF00L2ipm100nm00TurutDYrpV11ZXx09Fh2aDah
 4l8hNpm3woHTM31SOZa9rBoaqp5ooQq4BRmRcrZk1p8OtD4fEwPTYNIVTQbGyHhK5A8+
 AUDH/H4QRIo3+gG4wznj1Mwu6s67CJ66gwm1676pzA+/I8G1SFbpPU9WigTjjtxu7N8w
 A7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691766365; x=1692371165;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NzGcAH/wncr/lLEDpQNjY48DJKuZa1xa3K7ctnyqPhA=;
 b=GyeaVqwYk7WZn/NOjfq4BMUvOLuCXEGcXw79k2Oe98W951QVjJqlGk2qfZd1bszdoz
 OCymM/35F4J2EXzX2VoVWFpW1avR57s5AIBfh2gvaCngThYai3ZYXr0Ab/S0sD7Gm/Pc
 WMr1enCSAR438nTCYKEdcNE2JwGOl+vXyDz7otODzGUNfXN6IhF/RPyzpjeuLxBscoDE
 HJ8uJlnZsxPCE9mkYA3U8+EKGYpaL8nHbY9Ycns8wAulCnJ95loYpuyi+M2o+tapSGlA
 xKrJRZjm4xy8bgm5YJKhmbGpKO9qK6rqRE9pqiYOZabsglA3eQw1geAlvSlzQ2b4kVI6
 YOWw==
X-Gm-Message-State: AOJu0YwyNgc62chYH2D7WaJdYsBi3hqdDmDg6/fiV0BCdloifz9UKbzL
 LMvlQiGnQcmfILZI1+BWb1LzUw==
X-Received: by 2002:a17:903:120a:b0:1b8:987f:3f34 with SMTP id
 l10-20020a170903120a00b001b8987f3f34mr2666087plh.25.1691766365228; 
 Fri, 11 Aug 2023 08:06:05 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:e773:351d:2db2:8a8a?
 ([2602:47:d483:7301:e773:351d:2db2:8a8a])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a170902eed200b001ac6b926621sm4019046plb.292.2023.08.11.08.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 08:06:04 -0700 (PDT)
Message-ID: <6a116d10-5e01-30f8-fbd6-30c062fcccc5@linaro.org>
Date: Fri, 11 Aug 2023 08:06:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 20/24] tcg/i386: Add cf parameter to tcg_out_cmp
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-21-richard.henderson@linaro.org>
 <CAFEAcA-N-QWQXcHgMNnXTr+Bmf7fhdSKYQwS-kkWGdR+UHvT-Q@mail.gmail.com>
 <CAFEAcA9xsPHOeorJvjfO7mrpX_TfYHMNcMHi3dyt41+CktyXsg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9xsPHOeorJvjfO7mrpX_TfYHMNcMHi3dyt41+CktyXsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.972,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: NAYvI0B2J1dC

On 8/11/23 03:45, Peter Maydell wrote:
> On Fri, 11 Aug 2023 at 11:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Tue, 8 Aug 2023 at 04:13, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> Add the parameter to avoid TEST and pass along to tgen_arithi.
>>> All current users pass false.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   tcg/i386/tcg-target.c.inc | 16 ++++++++--------
>>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
>>> index b88fc14afd..56549ff2a0 100644
>>> --- a/tcg/i386/tcg-target.c.inc
>>> +++ b/tcg/i386/tcg-target.c.inc
>>> @@ -1418,15 +1418,15 @@ static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, bool small)
>>>       }
>>>   }
>>>
>>> -static void tcg_out_cmp(TCGContext *s, TCGArg arg1, TCGArg arg2,
>>> -                        int const_arg2, int rexw)
>>> +static void tcg_out_cmp(TCGContext *s, int rexw, TCGArg arg1, TCGArg arg2,
>>> +                        int const_arg2, bool cf)
>>>   {
>>>       if (const_arg2) {
>>> -        if (arg2 == 0) {
>>> +        if (arg2 == 0 && !cf) {
>>>               /* test r, r */
>>>               tcg_out_modrm(s, OPC_TESTL + rexw, arg1, arg1);
>>>           } else {
>>> -            tgen_arithi(s, ARITH_CMP + rexw, arg1, arg2, 0);
>>> +            tgen_arithi(s, ARITH_CMP + rexw, arg1, arg2, cf);
>>>           }
>>>       } else {
>>>           tgen_arithr(s, ARITH_CMP + rexw, arg1, arg2);
>>
>> I don't really understand the motivation here.
>> Why are some uses of this function fine with using the TEST
>> insn, but some must avoid it? What does 'cf' stand for?
>> A comment would help here if there isn't a clearer argument
>> name available...
> 
> Looking at the following patch suggests perhaps:
> 
> /**
>   * tcg_out_cmp: Emit a compare, setting the X, Y, Z flags accordingly.
>   * @need_cf : true if the comparison must also set CF
>   */
> 
> (fill in which XYZ flags you can rely on even if need_cf is false)

I can add that, yes.

Basically, test sets SZ flags, where cmp sets SZCO.  I want to add an optimizaton using C, 
so "cmp 0,x" should not be silently replaced by "test x,x".


r~
