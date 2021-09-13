Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3804222lfb;
        Mon, 13 Sep 2021 08:58:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGg8rYcHV1quIiZnIwfLasxHA3UMux107Tu0l0Pl0R/TGqJrVDZpN186/RsTQHI56fmxvc
X-Received: by 2002:a05:6e02:1d87:: with SMTP id h7mr3433128ila.92.1631548715935;
        Mon, 13 Sep 2021 08:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631548715; cv=none;
        d=google.com; s=arc-20160816;
        b=cqpxbhGYVD7RzEWpFRzTi39Rl24fcziGJh5+jYC55B7oVyUm3zmmV3Wir8Q6juVf0+
         DurKy9VhTvW5CfDFOOnvfySPMCZWTQ0c/62ep7XLFRmmqu2OiH4l4LuQtKGfdznMdEL4
         WYk+uFHdL6fRxOQCRY2tlhwWGtRMBPJ00vXfLP6kYE3A15/sNbdxIc56C0UiiWgy7kB+
         qJ1kiUdG1AQDbbYP4KZ2TOFNKS/F9aAY/wucgFW593uN+f+uOWiNNv6IJ9btRZW35aZX
         8CUEK2dUIXZyEtN3DzkfdeLtPR5nT+6+qjyxG5h39gVoaGDsfbzoHaxZwyZPEGrT6g0R
         bnlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9Mi82NMluACGQ1bbAzrX/lfzTTMuYRPmWTKxIG3EexU=;
        b=zqN+ARed5N5tQNi/odpxxz/KEf/teMYUWu7eX6MkUavFs/Y1F71IuwPp5NJygWXa3P
         ZygaXerDs6/fbEVCOiYDtPe01TmlXYCiatSW+tP8R7B9EIuPULeu3toEYGI0pfdghVOS
         0ecYst2Bw8Uwqax2crmsdkd6GIODxu3LNkAwcRL46ywJO1pBFJG4MGhdB62JgIAl07an
         qB7YcZNn3IWCa+vj8+F4ToC2fUGc3DlQNACkHMk7MD8DeO0lZSl8JP+RZvXDlJlA5AZT
         nCxoOeFDvBhWdK8QtHhJ3vWe/gXt54Pr/AcH1bi06QUROViZN4ROjNeAUfknyQH9EO1W
         osJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P2CA2myt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11si7437852ilj.16.2021.09.13.08.58.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 08:58:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P2CA2myt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPoLq-0002T0-2F
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 11:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPoKK-0000Kc-7k
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 11:57:00 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPoKI-0006K6-Ov
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 11:57:00 -0400
Received: by mail-pf1-x435.google.com with SMTP id v123so9266856pfb.11
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 08:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9Mi82NMluACGQ1bbAzrX/lfzTTMuYRPmWTKxIG3EexU=;
 b=P2CA2mytWrcKYPuuE3CxPZ/Ccwz15i22zY9iXvXGYRYxrXau5irZMtGTcjmIqI/hEa
 G3LpM7/SuADCM/Z5w4URZx5H1QqLU3LVsZpHzm+XP9JSCjOlRkyIr2RJKVb3mLJVLLty
 nmPnsyy076/eyniDTaXk9JHKlEydsEZBUGrFRYo0RdVs/ObdHFQpY2W3p1SxuDSPZ+6D
 b9OuUgYCKtCa01W2heKrTG4eSKmZEGh3epb1ZHx49tUO39gZbGU4mGOQSssf74vnlgff
 aewljmV19DH/eMswimCS4ahHLSRnmOs7UkW8KR+n3v+n0Hf9SVYCj0g6DH9raBK5LPVr
 8cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Mi82NMluACGQ1bbAzrX/lfzTTMuYRPmWTKxIG3EexU=;
 b=Y7LEulaPeWazqssLf24q/2Kirc0LcJ2noXHIvaTyPoVGYecWenEIJjzQVUSIKTkmVk
 H2TmL5Y2S8W/kd7QJTC/slm8zxr+4IajhQYqfQUwhbQKRyissxWpBD0NeH3NQg1d5UA0
 mFu7wWrlyFv1E6H37uXx8xmfVkNUGarIx5lSIcdZpDX6sLGdW5qtz23aTaKMXVaMBr/k
 e3+YhD9JMDYlOfMty2XvY0f/hxJbrRB3FG8Vrr/V8ddMXmN7ylEeRoWJnKA60sxiheHy
 UvLIEB+wIjPM0ejtqIKguyxUrhYrtT1VKy/l6rQy2cqpzltEBAIIPAaSzZRbbZKO+xC1
 CW2w==
X-Gm-Message-State: AOAM530kRu1zuxBSPS72rdhUGav3a4zPQ3CTnVjFSLz0oe9w7LtgtIGP
 eSpskULeRVQUMgTMo9FIwszUmA==
X-Received: by 2002:aa7:98c1:0:b0:3f5:e53e:119a with SMTP id
 e1-20020aa798c1000000b003f5e53e119amr222277pfm.43.1631548617289; 
 Mon, 13 Sep 2021 08:56:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q2sm7376271pjo.27.2021.09.13.08.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 08:56:56 -0700 (PDT)
Subject: Re: [PATCH v2 10/12] target/arm: Optimize MVE VSHLL and VMOVL
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-11-peter.maydell@linaro.org>
 <0bcbd02d-abb6-de1c-efc3-d0ba465cdb9b@linaro.org>
 <CAFEAcA8q1Uo_79geDF3SGXt04RUSmo90+UumLxjOCAPX4HLb9g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <275b7dc6-45ed-ed32-a130-0c30a22b4960@linaro.org>
Date: Mon, 13 Sep 2021 08:56:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8q1Uo_79geDF3SGXt04RUSmo90+UumLxjOCAPX4HLb9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y/17c+QxxyD6

On 9/13/21 7:22 AM, Peter Maydell wrote:
> On Mon, 13 Sept 2021 at 15:04, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/13/21 2:54 AM, Peter Maydell wrote:
>>> Optimize the MVE VSHLL insns by using TCG vector ops when possible.
>>> This includes the VMOVL insn, which we handle in mve.decode as "VSHLL
>>> with zero shift count".
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> The cases here that I've implemented with ANDI then shift
>>> could also be implemented as shift-then-shift. Is one better
>>> than another?
>>
>> I would expect and + shift to be preferred over shift + shift.
> 
> OK. (I wasn't sure, because and + shift requires another insn
> to assemble the immediate constant, I think.)

Yea, though Arm itself is good about not requiring one.  But there's generally only one 
shifter across multiple pipelines.  Not that we're doing any sort of compute resource 
allocation and scheduling...


r~
