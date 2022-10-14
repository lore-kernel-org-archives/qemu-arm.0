Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp601742ejn;
        Fri, 14 Oct 2022 12:02:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM52lRasXjeIzzfkTN3ooTjxR5BbUZY71BFfn6C5ZR15cFqjD6+qcHRCMHpbGayPABMxKSrZ
X-Received: by 2002:a05:622a:138c:b0:399:72a0:477 with SMTP id o12-20020a05622a138c00b0039972a00477mr5305370qtk.607.1665774164490;
        Fri, 14 Oct 2022 12:02:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665774164; cv=none;
        d=google.com; s=arc-20160816;
        b=wpj6oqQKDLClFAGWbgfxZHQ8TnLpPj3b7QnNA6fwLMwmB4yph2M8t8r+FntEc6Bugb
         pN//fKtHWQQjmRcAyFCeBR2d1uuXRWJmxwJnTPf7/BYQZ7uk4KdPjEjIwehPQsSxLV3l
         +I0uD7KLChwmsD+755k8ihkM+EP59/aOypmnqCjAXayLqQxhZjHecbue8Td8p9nqaUSG
         DI+UXsLGrVcAFYmfiiV/+5SvERYfN2dBOZfcvU8YydsuorFYATzTjo4LRZpb+THNUwxk
         2eLczbRtbfa7NXCGUudrzp78LQQhqTwqT3JCTqPc+BQI2fxJ3SmLKTkchVN+a3Wapa70
         2OzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=USTjX+345GOPcFwQIAcmCwN5ykLgbkQvDhEP3lZpXOw=;
        b=XqNqKEShlaPMbyFYFTgCnnpoikc4fWgO7cvNFmIet3epsdr6xGMTX3eKGVyku+ZYn6
         +otTIv/Pua6w0NYblQROj/a07ICKvK4heNEwTs2WFktiQDPMMM6WR05L5+VGRxUWO9i5
         g7GmW1oaYIfENUYc2fyem1p52cEnaWGXKQoPME1cm6ROTwLZjKIGkwQfN9S3uP2sAMYe
         6QlP4AgsYGJKNUjKpJTBzPF3zpT/FaH48YToP6Mii/yeRIbEBTfE13tgTAfhPGkGHXA2
         b1O9pzOYdqCCz4Fs8W0jWK36V8Mufbsrb2k05S7c6DtxD5Pgi/2EjJ67a2fNWd1NEtaq
         VdnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fCg547TG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv2-20020a056214262200b0049ccf7931f2si1883875qvb.264.2022.10.14.12.02.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Oct 2022 12:02:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fCg547TG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ojPxC-0003Sl-Vd
	for alex.bennee@linaro.org; Fri, 14 Oct 2022 15:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ojPwa-0003QK-DH
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 15:02:05 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ojPwY-0003YM-77
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 15:02:03 -0400
Received: by mail-pl1-x629.google.com with SMTP id b2so5588833plc.7
 for <qemu-arm@nongnu.org>; Fri, 14 Oct 2022 12:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=USTjX+345GOPcFwQIAcmCwN5ykLgbkQvDhEP3lZpXOw=;
 b=fCg547TGA1CRC/SyeWWjTYPhsdPyRy9BAkRzbCDfpKwQVvc696Q4pbY24vxowhYgs+
 eWvYv1tPNPBscDbRvtZsjTm2PAHXu+M4Okl5WHqNSVZVewN2hTPWaU/7GbzfyOGzTaND
 GrzmoL2WOiYwNLc1zonY+s7rh1C4Syd0atZH+ZrqLiyyJu9sKOxTBkxCh71+J5e+CM0W
 MFeWrXLLD3mlH/19djWzO1pkVy8PUcNXTcczvzDePPshoTFvSH726HrqO70OibkTDjhj
 O2sBXEy/ig+xpC17TM0CsI+bp0AvWxU9IYSwPm0sjOYK2xfmxEvXIgkxYPOxBmxQG6wS
 a2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=USTjX+345GOPcFwQIAcmCwN5ykLgbkQvDhEP3lZpXOw=;
 b=1NmFibwC+NO1oY5ia2lsO4KH6IvE6RqLINVAKfCDzACWhRvEcxE9XXryg3vnHD9WRv
 Q4FCEEMWfhxhU+ifzP3zNgTqdXkbyNGSIW5nrUGZSs/ygHleEGKIOCIE05xdA7Vy8zEi
 9H6vfqMWZgt4jGtWGtuopOYzWHVxhS2BMEOAkmPBW2FpZfp3YnJJGdb3LO11vFfrAw/9
 tfc1Flh/E2qrSlm+IiAQCvNmCN4eFxt/ZHANZJK3h4uu84iZ/oTAGQ0ERbMRCeNcYVyt
 FNcPkqsFFssA2hIMrm8ElsV+KVOtpeuTIt2MZzsYBkRzqqiBQ8UICAbqpoei/cC2kW8K
 Gc/w==
X-Gm-Message-State: ACrzQf0wAodFMAKRXPIFqQa9w2MLrio/vAJ9FC4kaSLRnODCtBTtDQlJ
 9C0mETvKGR1aa/MFJ1/FqleXsQ==
X-Received: by 2002:a17:902:6b04:b0:181:5dc6:5348 with SMTP id
 o4-20020a1709026b0400b001815dc65348mr6836525plk.69.1665774120127; 
 Fri, 14 Oct 2022 12:02:00 -0700 (PDT)
Received: from [10.1.28.222] (110-175-13-142.static.tpgi.com.au.
 [110.175.13.142]) by smtp.gmail.com with ESMTPSA id
 u21-20020a62d455000000b0053b2681b0e0sm2081231pfl.39.2022.10.14.12.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 12:01:59 -0700 (PDT)
Message-ID: <420efade-350d-5566-6522-941c9a16aae2@linaro.org>
Date: Sat, 15 Oct 2022 06:01:54 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v5 9/9] target/arm: Enable TARGET_TB_PCREL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-10-richard.henderson@linaro.org>
 <CAFEAcA_x9zJQy1_9_ySO+TNnnXnYPC3Uq37AN1jP65SuEMvJZw@mail.gmail.com>
 <d1196e9c-c983-0b74-9141-ac10154429cd@linaro.org>
 <CAFEAcA8i1sFTA74Oudj3Z7CYYY3P2g0+BeaSy1E_R3HBkTv6dg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8i1sFTA74Oudj3Z7CYYY3P2g0+BeaSy1E_R3HBkTv6dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.856,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9KFUA+mOXW1r

On 10/15/22 04:49, Peter Maydell wrote:
> On Tue, 4 Oct 2022 at 20:27, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 10/4/22 09:23, Peter Maydell wrote:
>>>> @@ -347,16 +354,22 @@ static void gen_exception_internal(int excp)
>>>>
>>>>    static void gen_exception_internal_insn(DisasContext *s, int excp)
>>>>    {
>>>> +    target_ulong pc_save = s->pc_save;
>>>> +
>>>>        gen_a64_update_pc(s, 0);
>>>>        gen_exception_internal(excp);
>>>>        s->base.is_jmp = DISAS_NORETURN;
>>>> +    s->pc_save = pc_save;
>>>
>>> What is trashing s->pc_save that we have to work around like this,
>>> here and in the other similar changes ?
>>
>> gen_a64_update_pc trashes pc_save.
>>
>> Off of the top of my head, I can't remember what conditionally uses exceptions (single
>> step?).  But the usage pattern that is interesting is
>>
>>       brcond(x, y, L1)
>>       update_pc(disp1);
>>       exit-or-exception.
>> L1:
>>       update_pc(disp2);
>>       exit-or-exception.
>>
>> where at L1 we should have the same pc_save value as we did at the brcond.  Saving and
>> restoring around (at least some of) the DISAS_NORETURN points achieves that.
> 
> (I figured it would be easiest to continue this conversation
> in this thread rather than breaking it up to reply to the v6
> equivalent patch.)
> 
> I guess it does, but it feels like a weird place to be doing that.
> If what we want is "at the label L1 we know the pc_save value
> needs to be some specific thing", then shouldn't we
> achieve that by setting pc_save to a specific value at that
> point? e.g. wrapping gen_set_label() with a function that
> does "set the label here, guest PC value is going to be this".
> Which should generally be the save_pc value at the point
> where you emit the brcond() to this label, right? Maybe you
> could even have a little struct that wraps up "TCGLabel*
> and the pc_save value associated with a branch to it".
> But anyway, I think the less confusing way to handle this is
> that the changes to pc_save happen at the label, because that's
> where the runtime flow-of-control is already being dealt with.

Ok, I'll re-work this.

> Also, I think that you need to do something for the case
> in translate.c where we call tcg_remove_ops_after() --
> that now needs to fix pc_save back up to the value it had
> when we called tcg_last_op().

Yes.


> (There is also one of those
> in target/i386, I haven't checked whether the i386 pcrel
> handling series took care of that.)

I'll double-check that case too, thanks.


r~
