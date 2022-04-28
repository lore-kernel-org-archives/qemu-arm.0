Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1832734lfu;
        Thu, 28 Apr 2022 08:53:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxRdVXRaxOkXhyvVL0g4arY21NxDniL60t5Hpz7D6M8aYKqVVK5NRoxqFC1WH9w2Gow4Ct
X-Received: by 2002:a81:9a10:0:b0:2f7:d89b:1125 with SMTP id r16-20020a819a10000000b002f7d89b1125mr23256783ywg.150.1651161181598;
        Thu, 28 Apr 2022 08:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651161181; cv=none;
        d=google.com; s=arc-20160816;
        b=pKvEalh9ZyHd+FGlDt7IDpAPLLY9lOqmDgo/fjQsrDmMfPEWeXuYo8mywQ29RFR+M+
         N9qMvVUkKECfDp1gYdvjZIzxwJqPNwHQIR3UrakvLsZ9yWUR1QMTvSkVIpS8QYJuAmQ5
         QmCbwB7sgcrP3M7g6hKhkdq3xab2PTN/jt6u5ifRQ60JXcv5htE5kTY8TfScey2mcXJR
         K+ULseW7nYLOYqthtZT9MWywEhIXq6qAiZ0aGJPdqzaMhCAxgDKl1rqIcGSH8VEaEKza
         F5bRfjn+wS2a0xwpntitcpqP+QfahjHCx5ICAhg9kd0NHgjB/gxVbK7WlNfmQPgfL5Z1
         Ve7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=rs+sXY4Si2YvWzVA8ySoQvKVRKL3235O14vhHnV2DXo=;
        b=ScAiSoSp53oZWmVjRJMi3JRltpIPlXgtPDOns+lP9+bAY1TLDYrgfWbNRYeYCVyQj9
         aoOibQJp8rU+pN4jYRErA/d9ol5uffAhaL9FrkUE2cpUZJ+KVez7tq5jTK4+yu+3xA/J
         eu3Q1YGT9LSw6j+UlhuRmJtIBOCFvzmg6LpxMEUW9NVZworXPAONVO05xzZ826IIIjvl
         rP2r/1+zu1OADRSHOVjkEjpAj2r9LDoAhwMxoU0FTImqYIokP+i8UZthPo5WX5kPs6S2
         kQQBdKx/AKTpWKjn2M3VkKFFmVtEmf5q5TInMHsCQRC6kdKGG+37FZY3EH4FbaZ3e7KC
         OqZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iHqPaBvh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20-20020a25af54000000b006483d10380bsi3797440ybj.536.2022.04.28.08.53.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 08:53:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iHqPaBvh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk6Rx-0007ka-09
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 11:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nk5vm-00062t-Pl
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 11:19:46 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:46683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nk5vj-0004a2-Qo
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 11:19:46 -0400
Received: by mail-pf1-x42a.google.com with SMTP id j6so4492378pfe.13
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rs+sXY4Si2YvWzVA8ySoQvKVRKL3235O14vhHnV2DXo=;
 b=iHqPaBvhUv5Ly+RWeJOBdi03P5+VUwaRPfr945ZUgjglAAY6vk6JX7li/qx/yJrE6o
 g09nuv6KqSucSSfolSlisftdBq03Wi1VMHXuhmwywVD6Z0nXkXTTkimX201mB7oPQP1t
 xN+xHf6YaBGyaYDQVOO7tol3DvnOPUpOxyVHS49qLMW69IMCGVwmtgYb7Do4SPu+f1/7
 m6PTGVXXeiDI1TOVFaaTa8EKxD4UK182OPzQltiN7nFNurNE7HzzAf+ncmK36aqigIeC
 TWowOYGGPqly7gCPSD5GR9KzD6wF1CdSneYLcYzucVxqbI1p6wR2FtTAExh8go/G0Eee
 d5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rs+sXY4Si2YvWzVA8ySoQvKVRKL3235O14vhHnV2DXo=;
 b=VKBO75FivNIIfw0fekUT3MyRs4VG/57XTX0SiSTtk3K8I2uHmfpY1kaWQ1lEqnzybM
 X+h8zHt2/Mqpa8pGjM8FmF6uvcsnl4bP6600lQbQHt9mhg5q9NY8i4gNOo9GQYppXgzd
 gXxn7sxH081L22jwsSz2p4/xVNs3fRb0MHdWjMoGHqf4QYp5PfP9iiza/t65j9b4NdC1
 v0igaIiydcIbAveq7sQ0raieqj22INkE0LsZ4Qh1CYLwIvd6JciQ61dC9RdkV4iOX/0x
 iUtgdr4huKt45/5i5lFCV4wycz1H1uZLdmBbGkV4Yq0fRiiM/Ztn6jSiYUroepvVYj+W
 cvbw==
X-Gm-Message-State: AOAM532mNilMlBqtWF+KcABNapOxs2NLpBrFhJAX2zD61dlIq9XiyVM1
 7VrLgs4X619CAiYH76VeXOmZfw==
X-Received: by 2002:a65:6bd6:0:b0:39d:4f85:9ecf with SMTP id
 e22-20020a656bd6000000b0039d4f859ecfmr29090856pgw.336.1651159182284; 
 Thu, 28 Apr 2022 08:19:42 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a63e00c000000b003c14af505f9sm2836314pgh.17.2022.04.28.08.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 08:19:41 -0700 (PDT)
Message-ID: <40272c05-c2d5-756e-5096-a05f53367095@linaro.org>
Date: Thu, 28 Apr 2022 08:19:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/arm: Enable SCTLR_EL1.BT0 for aarch64-linux-user
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220427042312.294300-1-richard.henderson@linaro.org>
 <CAFEAcA-636wFtzEF56y8PcjcZy2J9RuNaw1nHMQ4Nsn_55ndCw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-636wFtzEF56y8PcjcZy2J9RuNaw1nHMQ4Nsn_55ndCw@mail.gmail.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 1Ki904LI/Sy5

On 4/28/22 05:56, Peter Maydell wrote:
> On Wed, 27 Apr 2022 at 05:23, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This controls whether the PACI{A,B}SP instructions trap with BTYPE=3
>> (indirect branch from register other than x16/x17).  The linux kernel
>> sets this in bti_enable().
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/998
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> --- a/tests/tcg/aarch64/Makefile.target
>> +++ b/tests/tcg/aarch64/Makefile.target
>> @@ -26,11 +26,11 @@ run-plugin-pauth-%: QEMU_OPTS += -cpu max
>>   endif
>>
>>   # BTI Tests
>> -# bti-1 tests the elf notes, so we require special compiler support.
>> +# bti-1 test the elf notes, so we require special compiler support.
> 
> Did you intend to edit this comment line ?
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Oops, no.  At one point I had bti-3 sharing this line, and following code, but it didn't work.

r~
