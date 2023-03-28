Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2883728ejb;
        Tue, 28 Mar 2023 12:15:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350YIHdvvOCduSmydyvJU3B69XCug1wTpYp28K4/MRjvOVaQ3Tsqc7rBeEPJhEiyaaW5ntuMb
X-Received: by 2002:a05:6214:19ce:b0:5df:3a1f:9b00 with SMTP id j14-20020a05621419ce00b005df3a1f9b00mr10134455qvc.25.1680030924080;
        Tue, 28 Mar 2023 12:15:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680030924; cv=none;
        d=google.com; s=arc-20160816;
        b=D+FTRAtQk9Xx4Rtkaivo4lVNNcbdlvI99Q4FkHS/jmIvYGlozjOwqvBqOjDjckeJe6
         bgCpBVxIUU7cuS867DmHpXG9dfHbTnd65kWGMhjMPpA0C/+FDQ8LBvL0For/bC1wT+z3
         SteRuxVLF4BF6xrKLvgoGZ3pRPbHrPDexT5FEBsas5SmPN3iag43AbVF8E4BdLOlt34X
         61QxCziB2bmOmOzuZtHXeQmDICOtGsyyFxryq6mkhaooV15iVUu7/AlltO+/56ZJsrg5
         nTzkvpptZYVW0eKShcb3cW5ZvLqWK8bb9gCLtnkyFVi97tA0Wxbvlvy/cIGNwx1tmssp
         VtwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vZliNxt4hnS0pNxzoANK6cuOR+xoqHzaDKucxWxI0CE=;
        b=LFvuLLfJHboGIifJYCEjzFgRLqUO64/lps514I4JJr2Ujo28Vsn6lbTkgwtDiQRFu4
         XQs3D3tky940cx0a4l6BupYYrsrRTk/PSl/hf5+m91h9HljnQZVQY0Vjf4v/d2EJQLJ/
         0H44Y9xk4a4dQS90rLia8KtocODALDR8GB1I4njLpBrnWmN1CMBqphCxYuQd8ZH+sPK/
         TdnZDOcG8Byyk+CUKOAFg6NDDczyMriyknl//N67jkp7eXNblTOxL3F2GRIovcotLBit
         ZPO0pSaxY66oHQ0m4ZEk93U5pSkQYe5r8AbUL3KMhmePyvSYlDtI2nWm+2aMlkWtOPuG
         FelQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ii1GNu72;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp6-20020a05621407e600b0056bfa655111si21175920qvb.27.2023.03.28.12.15.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Mar 2023 12:15:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ii1GNu72;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phEmc-00030k-1Z; Tue, 28 Mar 2023 15:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phEmb-00030G-Ba
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 15:15:01 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phEmZ-0001a4-QN
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 15:15:01 -0400
Received: by mail-pl1-x633.google.com with SMTP id u10so12679352plz.7
 for <qemu-arm@nongnu.org>; Tue, 28 Mar 2023 12:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680030898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vZliNxt4hnS0pNxzoANK6cuOR+xoqHzaDKucxWxI0CE=;
 b=ii1GNu72Htr9BN7YsKFCdz6NdoCAjUVx3QgUM4s9iVmmNBiiZexjAlq/beIWUB/icq
 e7FUwh8a2EvEFxXAZPVdMSxNmqXJB2Chpa4r4ND9Kg2fO6c0adFijFHxomhnu1Q12MGq
 hcy5osCfhs83QpMTaUecYhIrzRvP4i6HB4acV7EFAA6U9cjuMyzAxoIUgr5gWjD38xQ6
 DSKy+9ViO95gxrUF+nNK48fdL23IBdsTyCw51t/QozmbNCkNWUWkgrpH9eyHDuHeWWRp
 Mg6LyJDddOr/jeYLZWy2CWKGEPx+NGOTBhSI34L3XXEvIKV0ksSEoOA4V0fcGO3wEqPK
 X4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680030898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vZliNxt4hnS0pNxzoANK6cuOR+xoqHzaDKucxWxI0CE=;
 b=MNopwOD8y4IUMFBYQbfPyS/fZ0hNSRMueEDQTjeomwxmaV9d4jD4WkEjexcXTRyYjs
 /LBUPV0a8KTcrNgOCnN25emolGuXTaZRY5R5iKInJPq3pSS/cgKrQ8EAaVrRN/U9IrEp
 JJHbQgzkrKhtyspRMou+irBrlU29wtFlQ5QxIWWXpnRF8LKnbgTx5mOyf/XeBmxytZIP
 Mb/Oua73AICebLIbCuYMJthFmzNgTepBXKRuGCN+mDQBLKVA79OvfG7eEscP4c1voP/v
 +l69ef1BkJi0QlKuMUTWWIGC/J4wjsNze8MGUmFe+cqA5kQ2sbHc1Tbq9nE1Xj0vHTg5
 /yPg==
X-Gm-Message-State: AAQBX9dMGkK1x8PKkwobMFNI60sb5n+PLoMpEFowRfNtmW5tlw76U+X+
 AQhZP3eGsQ6SE/r7j3Daz9XgKw==
X-Received: by 2002:a17:903:234c:b0:1a1:b9e6:28a8 with SMTP id
 c12-20020a170903234c00b001a1b9e628a8mr20557076plh.45.1680030898030; 
 Tue, 28 Mar 2023 12:14:58 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a170902869800b001a20b30e8b0sm9779520plo.243.2023.03.28.12.14.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 12:14:57 -0700 (PDT)
Message-ID: <5975067e-81bd-c67e-4ba6-01f0f3c6613b@linaro.org>
Date: Tue, 28 Mar 2023 12:14:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0] target/arm: Fix generated code for cpreg reads
 when HSTR is active
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230328162814.2190220-1-peter.maydell@linaro.org>
 <e9e8fb66-3fe8-2519-95df-6ba6c52d53df@linaro.org>
 <CAFEAcA_TGN7qk8YQz8MPbdg=jcT-HQVFWBfnEO53AAPyXBmqTQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_TGN7qk8YQz8MPbdg=jcT-HQVFWBfnEO53AAPyXBmqTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: yYyEGsWGrjSn

On 3/28/23 11:27, Peter Maydell wrote:
> On Tue, 28 Mar 2023 at 18:27, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 3/28/23 09:28, Peter Maydell wrote:
>>> +            /*
>>> +             * gen_exception_insn() will set is_jmp to DISAS_NORETURN,
>>> +             * but since we're conditionally branching over it, we want
>>> +             * to retain the existing value.
>>> +             */
>>> +            old_is_jmp = s->base.is_jmp;
>>>                gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
>>> +            s->base.is_jmp = old_is_jmp;
>>
>> A third solution is to simply set is_jmp = DISAS_NEXT here.
> 
> I wasn't confident enough that the previous is_jmp had
> to be DISAS_NEXT to do that -- there are a lot of
> different values and it's not clear to me which are ones you
> might find lying around in is_jmp at the start of an insn.

At the very start of an insn, you will *only* find DISAS_NEXT.
Anything else will have exited the TB for the previous insn.


r~
