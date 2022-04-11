Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1924120lfq;
        Mon, 11 Apr 2022 14:42:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw02jfnmOPPw/Th2gsIjbss4AUgSIEZQtHKohqAysZEuXObmvMwXEGmqtdm8S3eyttpyjT
X-Received: by 2002:a81:2485:0:b0:2ec:354d:d45a with SMTP id k127-20020a812485000000b002ec354dd45amr4604966ywk.213.1649713353304;
        Mon, 11 Apr 2022 14:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649713353; cv=none;
        d=google.com; s=arc-20160816;
        b=0XpEnM2oX6cROJ+BLBOe8liFGxJNedb36MuQwMGbgbdVXtb8MZ2g+ngQQ6ZNe8BjnL
         Wx6go5tdoG1pYM5o2FQKItswB46smNJSnobhAzeS+eGDj2kBlD0UFKEHM2nezsgnyAdK
         LiHybUC5BK7ixXo9U8P9ko1QY9SldCaSUtRaqWuVyZMZD6whNQR1V8K1AqWj7jYY62rC
         /BWrQqbMYY45cIsl2eFZqwJC3B7DqLNKnAJMQ8tXX/yYSHxMZWd5niBPjnDsKeMNSCgs
         69jGHEsNM/iYUB7V2cV5XVR3M8K+l1h3FyVwrFEp35qEjG9Eah8Bkp+9KtdP5KUH6vC/
         tyZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=NqsKIaMi5XfKg5n63c7gIxAq7yGOfhDRZoR8J7UOhXA=;
        b=FLNt6jt1Tv4qoq5G2p1gIn8B3vrhMuupnXhhEE1t9R4t0HWQ4syAohIwwHpVbo4ZAE
         nvMIvDIJjpP5RLbAruic6BfX/OCqfmQOwoVKwpWjGOrWn1INWhx2YUKPpCt+Z1Ii4awC
         eSJB1nNr0t1u3F+2JihA5enNXT+lFeiQxCqieoJ0EswO2EuppKpGsieRii4gxgXbtov1
         1iIj/Uiuuk6jr9IMSkVnEqSOUwkWVCA3GflOBiC2fNXXVDBel+rjaNvUwK6FNq7Ks8Ud
         9QCzp+5uwg7mJDHTBq+YSTtIzWxe4B7/+N35R7ObNRw66vUYCanE1C3/z0nfxxU6YuHL
         jCIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="FxP/IFcH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b74-20020a81344d000000b002eb5483af88si5071874ywa.262.2022.04.11.14.42.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 14:42:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="FxP/IFcH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne1ns-0001Xn-LB
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 17:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne1nh-0001XD-D1
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 17:42:21 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne1nf-0001VZ-NK
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 17:42:21 -0400
Received: by mail-pf1-x42a.google.com with SMTP id z16so15739934pfh.3
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 14:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NqsKIaMi5XfKg5n63c7gIxAq7yGOfhDRZoR8J7UOhXA=;
 b=FxP/IFcHA/zOCguX2Qesjr5Jg6+oh7Fd+A8WRI+PKPLDCmKlDvcO6/H/kmWwesrcp2
 e5W1ZqcT5q1FnAdxAOAQCKkkRs0RD+Tvbd4UH95zXP2pI6kpGmnKq0imKcFQkY4y93Ny
 mzw3gEnn7R1yst0EphWInPukKiKqDHESjr9MafWISz4uwjnDRYwkAKCl6pPLGHztM1tY
 SzrUNcieXZsmW1pKCWc0otB4rsIrlkqNNGvzAPhKMgZQHclVzuJbnqkLJ/CEBmX4r1ip
 hwiCX8WCwMPa5aZdWO81IsXXWduFrZ6VQREohiB5q1/QjsOfdhf4+TreYexYHquA02Sf
 UkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NqsKIaMi5XfKg5n63c7gIxAq7yGOfhDRZoR8J7UOhXA=;
 b=4TzZq6xrP7Kk3LiLYEUwT2SBg2v3/y8PLA/qd2g14vnGbxSxCIsTlpB9XRyeDfSzcE
 PfATS5Q5Lef2xA8aQcYv57ojYG/6AoS7EuOobt5Au4KIoPiSLQD0o1RCJH4YkYCANdST
 /qM7Q8N13+672alWLlcRGyoXAzGWSBq1P8EG7oxCFXuKwvrPPHU+tHmOOX7bG7gW8DI1
 IU60uY6SDjkRljkPWfq46Spwb1NM6nBIfhTPkzMCoF125CBXIYTPuGfdtTY0huBG73Hq
 /5nGAjkm5vOUYzQKvR7h18Qrx7IVsi4oWidjSXG0AWc/fG8QwmTbEaiZSzlfUculavdi
 hp5w==
X-Gm-Message-State: AOAM533Fan5Kjomi+V7GYahcZKCXDakxop3Gi0F/tJN0VtvzdZFPa3RT
 xdkXY+npbTlJNUGrj7YpRf8hLg==
X-Received: by 2002:a63:69c7:0:b0:380:afc8:33be with SMTP id
 e190-20020a6369c7000000b00380afc833bemr27467886pgc.304.1649713338145; 
 Mon, 11 Apr 2022 14:42:18 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 s26-20020a65645a000000b0039cc7a70728sm656468pgv.5.2022.04.11.14.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 14:42:17 -0700 (PDT)
Message-ID: <a3846249-5be1-c72d-f871-289964f05754@linaro.org>
Date: Mon, 11 Apr 2022 14:42:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 13/16] target/arm: Implement virtual SError exceptions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-14-richard.henderson@linaro.org>
 <CAFEAcA_-cbZWF2KxZinSK=z88frNAmiJoj7u-kydtUgQiucFHg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_-cbZWF2KxZinSK=z88frNAmiJoj7u-kydtUgQiucFHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rC/D0czjyGEr

On 4/11/22 09:32, Peter Maydell wrote:
> On Sat, 9 Apr 2022 at 01:11, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Virtual SError exceptions are raised by setting HCR_EL2.VSE,
>> and are routed to EL1 just like other virtual exceptions.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> @@ -10041,6 +10048,20 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
>>           mask = CPSR_A | CPSR_I | CPSR_F;
>>           offset = 4;
>>           break;
>> +    case EXCP_VSERR:
>> +        {
>> +            /* Construct the SError syndrome from AET and ExT fields. */
>> +            ARMMMUFaultInfo fi = { .type = ARMFault_AsyncExternal, };
>> +            env->exception.fsr = arm_fi_to_sfsc(&fi);
>> +            env->exception.fsr |= env->cp15.vsesr_el2 & 0xd000;
>> +            A32_BANKED_CURRENT_REG_SET(env, dfsr, env->exception.fsr);
>> +
>> +            new_mode = ARM_CPU_MODE_ABT;
>> +            addr = 0x10;
>> +            mask = CPSR_A | CPSR_I;
>> +            offset = 8;
>> +        }
>> +        break;
>>       case EXCP_SMC:
> 
> Having looked at the following patch I came back to the AArch32 handling
> of taking an SError in this patch...
> 
> (1) I think you need to look at TTBCR.EAE in the usual way to
> decide whether to report the FSR in long-descriptor or
> short-descriptor format

Yes, I've reread AArch32.TakeVirtualSErrorException() and you're right -- 
AArch32.ReportDataAbort() examines EAE.

> (2) maybe log the FSR value, the way we do for prefetch and
> data aborts ?
> (3) maybe mention that this is reported like a data abort but that
> the DFAR has an unknown value ?

Yes to all.


r~
