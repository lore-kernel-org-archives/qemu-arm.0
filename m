Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp2173729lfb;
        Fri, 27 Aug 2021 21:04:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNkwZ6FuyE23+HouUE6rmIS0RAeJgvIoCpEx8o6gAPQiD0gYbMsXOOptSb/NlJdDvAwPoY
X-Received: by 2002:a05:6638:1905:: with SMTP id p5mr10937570jal.25.1630123489335;
        Fri, 27 Aug 2021 21:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630123489; cv=none;
        d=google.com; s=arc-20160816;
        b=j3XH/gBTnzAxLeXkvHDfxM9gWV60YSFxyqkRIbM1YyEzJ59ehVHlbsEY/JCDD6br/c
         qhPc4qMxjhrfgNL668++j5cV+Eq+Rn2XnZktGTxSNjLR0cuFzLPZ8aMPjhSpALk084fH
         RCiYuT9yxXhMLtIvdFWNCOljncQJGNOw7NKqD29M9S7x1HrO9+XIIbMnL3OeLVtrFEha
         BLstP8pSdnRSZ3S+BqhHurQPB+9Z0JmbFR6esgaVQjZpVMi0MBD42XviNJq8SoFEI5TM
         3f/lHFJb/KcuTPfXM88Qa6bXy7Zviuj+EKBK070kzzmYR+b3M3zy0/bpVhLG6p0HVORs
         7jKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/e12KvIEZvRO6ZiexW26hSSE6zFfYKNVGBc7NhVAL0Q=;
        b=GgJr6N+x+ZPXeDlO8ZyCoYI97Kslk5sLYYKAuVOAM+MAOp8k1HGuDrSnIq73n7utrz
         6GAxDtBpikOjB5SuX+OvEGF6r/7Gz3DciODIWe0FVRfS7Y4jyxT3hKcKRCx1LuHRIcpB
         2VxvaqRTbp88FtTLOS4fkJCzdKInjewabonXVleFHwrTig3A8JIhg3IIswI5bL2W0CNI
         xJxWxfxljbWPb8o3bKamPkP0etz45d67LLfBykQVLVRbVrd4IL4npL2fk+yni4F/bxRB
         cl0QY2BmJ2WeSKDQlYuiNDdSdSZOVletw0LrKQ6OX/AyWIQ7NMQ3xrPZlWrdg7BkAZo3
         Yhlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MybD7kRB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si4015757jaa.15.2021.08.27.21.04.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 21:04:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MybD7kRB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJpaK-0001mZ-Ld
	for alex.bennee@linaro.org; Sat, 28 Aug 2021 00:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mJpa4-0001kU-0N
 for qemu-arm@nongnu.org; Sat, 28 Aug 2021 00:04:32 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mJpa1-0006rt-PE
 for qemu-arm@nongnu.org; Sat, 28 Aug 2021 00:04:31 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so3257999pjc.3
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 21:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/e12KvIEZvRO6ZiexW26hSSE6zFfYKNVGBc7NhVAL0Q=;
 b=MybD7kRBOip8noy58r0o57TF/s0AXTwgpzotztWr19yOjg3mmGdFe62z1yw6cz7pJX
 PJSeRf4pAYHd1XxpQ4nJOxmqfACdsys5VwI0258FBAL+cK4wMHz6l2Jda8i52QavlF8L
 NgIQoKwe3V7jcfMj34q5fraUZ8loNjzvqRvRAdDkAzHuL6t18jy6IZKrKJSu34ri+o+/
 auSQrpaU27mQHLmCl0nmEBDXCi9Ugu1yd7OuIvVNKnIsubUWuBA6MRMYaghzLGvHGtXg
 nZajEP5U4+0nTez45eDskCN4NXA7BIVCfESdcvfK5Z2sDN/bjVJe5xN+qrm1TRuKNNbN
 tQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/e12KvIEZvRO6ZiexW26hSSE6zFfYKNVGBc7NhVAL0Q=;
 b=jeDOLTq/diUYG4F4Att4SN2/2rzLkBRZ9oS++N+e4uhHYRHTTCbF5gURbfKc+j8RSF
 qIV1lm3QrdQTdkDGoa9oDY1rwFo355K1zv6+9u0EtrNbTJ/p2R4fI6+7JT8TUwHO6bTj
 d19popyRLrB7WhX0z4UCQ0G041mcN1dCM9rIt80KE7/zbG+obR//N2tLLo8lEs8lKmsq
 Re2BblsmhKeC+xc//H3W2TsOPqNrcPBFrMPLYuLKBVUR2ee9Fy+Puu4ObSoMQjVAy6AI
 T1yHQkUlWKLRyGpBlHq58B1PpZC52WmAXSXkGJboeIqgsJpCQr1jEKdYfAFV67dBkp13
 yrCA==
X-Gm-Message-State: AOAM5327IvQ5Q2zrv56dt6MRUrvXY2J3RuPE71gEY2gQakDnCUqP6wM/
 HBy1Xj5vDt521CZGmAxA5HMYe97JkP4YkA==
X-Received: by 2002:a17:903:228a:b0:133:305f:2dd2 with SMTP id
 b10-20020a170903228a00b00133305f2dd2mr11555563plh.21.1630123467254; 
 Fri, 27 Aug 2021 21:04:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c24sm59507pfd.145.2021.08.27.21.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 21:04:26 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] tests/tcg: Add arm and aarch64 pc alignment tests
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-9-richard.henderson@linaro.org>
 <CAFEAcA8Vf-mF4xpMkv+Xc6Cc-u1fW5yW1-fHwVSFqZ6EKNdmPA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d7fe267b-154b-8d96-1b27-1c696b1a030d@linaro.org>
Date: Fri, 27 Aug 2021 21:04:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Vf-mF4xpMkv+Xc6Cc-u1fW5yW1-fHwVSFqZ6EKNdmPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.437,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jlkrkWQUkGaX

On 8/26/21 6:54 AM, Peter Maydell wrote:
> On Sat, 21 Aug 2021 at 21:09, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> 
>> +    /*
>> +     * From v8, it is CONSTRAINED UNPREDICTABLE whether BXWritePC aligns
>> +     * the address or not.  If so, we can legitimately fall through.
>> +     */
>> +    return EXIT_SUCCESS;
>> +}
> 
> Can we get the test harness to run the test on a cortex-a9 guest CPU
> so we can avoid the UNPREDICTABLE and can always check the signal
> happened ? The test is a bit weak if it doesn't actually test that
> we take an exception...

Well, it'll always raise an exception under qemu.

I wrote it this way so that it would also always succeed when run on real hardware.  Even 
then, I have no specific knowledge of a cpu that does not raise an exception, but I only 
tested cortex-a57.


r~
