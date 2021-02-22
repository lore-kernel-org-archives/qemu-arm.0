Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1329097lfc;
        Sun, 21 Feb 2021 16:22:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrDBN9W7DY3kmbhm4f1BvQL8H/cWCuAO4aCek1dWXwJY/L2HvVCShqtPzT5CCZZM+Eh7Wq
X-Received: by 2002:a25:6e57:: with SMTP id j84mr30819413ybc.277.1613953335894;
        Sun, 21 Feb 2021 16:22:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613953335; cv=none;
        d=google.com; s=arc-20160816;
        b=uzxCT0SK7XU5i4xeev5SPEu3BOF24EBMgqE5pcKGUG/ashaNfcxR0CqK40Oy8bwNRb
         ifhEAr8eSAvtHg3w1+ysCgyiY573snje8C68ZG99/gNonS4QPqT8n7gjZkBqKzdB8Tis
         nFYJFv5sRfhXYo1WZ5Uxr2pB2oYktQ3Rbj+AsZ6ppEYSgBTFHBVYLSme5HyORNn5wArw
         UNVAwPOUHsQYIlC5zWzlz8lBcPVjuVzsA3utojhWHCA/cqavscxICiVz4fN9a1Aj5RnE
         Cc30D3MxBoY9WquWoucfAmcLHnZH2mvCKqw4ELZQRSsQNCeMtI8sLSBnH8qJEirprMvY
         wq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Trj010zDHQ4xSMLrkRdHvH6ENnGnvAFM0+aitMWz2VY=;
        b=gSBxgTlemNWk3d1Ra8ZY/obT33eQJuS325lgDMkWHhgoQ+Gu4vPEN0Wtz1NAuaSR+D
         SXzaet+Tfnoz+1zda8nedEIOB0hDDKt3Cb2PUwB5A7HWzffhdovgBaCbMTtrPlLoJ8JL
         0zufWQHq+MBXFjmOr0CI1o1J/ti3HhMhQe72gMsIYPxjBrb54wknZfHyQ/KolLvybRkC
         FfuJpioXNn9ctUrj2wBG3dw1eDBP77k4UJX9yd4RnE3QDCdIwAnviZXjYYLlEpYRDA4z
         WkZB+sDy/Q5vqxp6ntmD9R0XNRjxglmsjtoTUAN0tCMf8eUENFCyF+aZOlyK/gNeSUke
         ZktQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZUivhzG7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si16234895ybg.449.2021.02.21.16.22.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Feb 2021 16:22:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZUivhzG7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lDyzN-0005lE-Nm
	for alex.bennee@linaro.org; Sun, 21 Feb 2021 19:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDyyw-0005kU-BN
 for qemu-arm@nongnu.org; Sun, 21 Feb 2021 19:21:46 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:50770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDyyu-0006OK-NP
 for qemu-arm@nongnu.org; Sun, 21 Feb 2021 19:21:45 -0500
Received: by mail-pj1-x102f.google.com with SMTP id b15so2781329pjb.0
 for <qemu-arm@nongnu.org>; Sun, 21 Feb 2021 16:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Trj010zDHQ4xSMLrkRdHvH6ENnGnvAFM0+aitMWz2VY=;
 b=ZUivhzG7bOsnMdoa0fA+X5Lfw7SwEZP1skRnCfE4O/lkaTobtolqlMDSCOQFgHB9mJ
 KdwzQF9W8hcQ1bDOQUH0uMS4K7/P7uyzNk2Dd1aQqbH19m1fufa4X5JVq0f1HiZLVLkU
 ylS9vX67Gih3R0UXA2Mo/8V6/Z/CxS9urprQmJP2mlbxmrmZGHF115G4dfD8+FPmZvmm
 0RXaZFZ2iAlxu+mC7A3yh//GBoe16nVOIYKg69K6njp3UPsT/2PySyfG2/+llipj6+xn
 TmdnU6KK4/jLSPqd+gOWaNvatSpNJ4mBtqmPc9wLjw+XahW9RFKX1hTWvhE3gxUik0hj
 itgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Trj010zDHQ4xSMLrkRdHvH6ENnGnvAFM0+aitMWz2VY=;
 b=VlsBs1HvUFYpY6HadJmFEfnEibN6mmXy1St2jf+huR7lr2KGTUKR70BegN/4jI+28s
 unLKZ9OuSkPiYQan1vHgbUoktzZAbb9HJg92sMghL/YHhQHTDP08YxmVUxCO1SZP63bm
 g9Z4eVXlT1P3zX0/iRXxBOB4ntCfXmKkY8shorNAwAby3tap+5vB9DV6npZmh075LGQz
 MpL8uXog26y6ShyyckpkpvP/q5EUmhFZFmSbSoNwas2WYyC6sQzLvAPVbrRQyfZ3KQiw
 hDkRMTms5r7DIw7lR5+1rzBLMCqDeO5u3dUh72Bf3AxAHQWMBiY7uGaj8+8UbyRwLWoF
 UiaQ==
X-Gm-Message-State: AOAM531pgAlxz1efgadRrHPA4HWSq89ReiZ1hXqW3EIYdksqajAskFLV
 8BP+yCo5nTCa8XSsLlCnCI0cwDVkXV9W4g==
X-Received: by 2002:a17:90b:e0d:: with SMTP id
 ge13mr20430284pjb.83.1613953302774; 
 Sun, 21 Feb 2021 16:21:42 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id x188sm15210392pfc.209.2021.02.21.16.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 16:21:42 -0800 (PST)
Subject: Re: [PATCH 0/2] tcg/aarch64: Fixes to vector ops
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210220212903.20944-1-richard.henderson@linaro.org>
 <CAFEAcA_3GUsYLY89Y62k0Rfaqu3JHdPYphueW2t04C6FgvQmTA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a23bd52-be7d-96db-26e9-af1da9fc116c@linaro.org>
Date: Sun, 21 Feb 2021 16:21:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_3GUsYLY89Y62k0Rfaqu3JHdPYphueW2t04C6FgvQmTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: FbOD/2bmaGVF

On 2/21/21 4:12 AM, Peter Maydell wrote:
> On Sat, 20 Feb 2021 at 21:29, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> I guess it has been a while since I've run aa32 risu on aa64 host.
>>
>> The launchpad bug is something that should have been seen from the
>> beginning, but the similar aa64 operations are expanded as integer
>> code, not vector code.  The aa32 neon code has only recently been
>> converted to use gvecs.
>>
>> The cmle0 (zero) bug has been exposed by the recent constant
>> propagation improvements; previously we saw a reg/reg compare.
> 
> Idle thought: would it be possible to have a test framework that
> exercised the TCG backend without being dependent on a particular
> guest frontend?

*shrug* The question has been asked before.  It might be possible, but it's not
trivial.

In order to actually test something, there has to be enough board-level stuff
to do something.  Which means we have to at least define a virt board, the "tcg
guest" front end that can read the tcg input, etc.

It's not unlike gcc, for which similar "can we 'just' test rtl" questions were
mooted for years, to no effect.

What we haven't been doing with tcg, which did happen for gcc, is the regular
and consistent addition of regression tests. But even that runs afoul of the
fact that we've only got docker cross-compilers for x86_64.

Also, it'd be nice to actually run risu regularly, on all of the tcg hosts,
which I think is the main failure here.  We did all of the recent NEON testing
on x86_64 and (apparently) none at all on aarch64.


r~
