Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp497000lfg;
        Thu, 19 Aug 2021 09:51:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGuu5ZfCoOn6rEb0IXI3CL9abPVIeFqMbREIFoQ3B6+9fwxSbt4NK2w0fwBVRYKHq4QFnS
X-Received: by 2002:a05:620a:ec1:: with SMTP id x1mr4569903qkm.87.1629391871073;
        Thu, 19 Aug 2021 09:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629391871; cv=none;
        d=google.com; s=arc-20160816;
        b=qgnPBryrtrzufwbIAQFuX1CPnkuZDW67itvAE3NxJLj26xiqX2im/Ytzh6nUMkhmpw
         4EgjDyAA6krzvW1I8Dize8Vr9s52CFGtWNIRpqXn7vuLYiFAhMc/5gu+6nGuNJzZo26e
         o15R4NMX3JxeXLsq2euv20RdkNXX3iawPxgtNqMKvS6QhFsNNEP3zun8Szf19C7XLhke
         ASRDbcM57hfjYwR0GEw8YMw+5zlwmfsg9tsPaXdjmITr5qIVTMMRDG7qg5+92Ft7DvCH
         QvTVNz44SH7RDVwwSnIkODm9VWks0QcVQPwju09g5pmfQnZu+55mRJl5e41+CNYHU/d+
         PSaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=DAy9K5Dk6cCjC8JMG7DbxZJASbH7spHP3sfgl78LUxk=;
        b=m4xwYqwHRgjcx/chbIx/dd1+nLx8NwgSvXyGZ9mX2+WpWUh0GiFuutPeXBLI/6IQTa
         q7UkSlfRvWmEfrYvjqPdtT24MSebHm542xDSoZpg4CfzQ+UnVM7DmnGSgsBbs4DdBtUX
         n+H7stYAPUDCJPOhDwcJyJEm+e9KSbvtsr5sbk5Z3EYh/uSvXO7TOXJiTEukQ0B7cn8U
         ITaOyuEiYPuDkRwJSWFz6kWudnnmjEPL9Lg8nYZaXJtHnbJevRJxC41zbNJgO/d+akOl
         qBMexzVBp06LYoXMFJTioi0a5oU9GsQ1XfLlsPoYcE2Tqtk2p12uiNbPVkDGgLw1NGj1
         2cmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="K/R/NKuG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17si2562432qvw.43.2021.08.19.09.51.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 09:51:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="K/R/NKuG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGlG2-000241-En
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 12:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGlFt-00023k-8X
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 12:51:01 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGlFr-0000Hk-La
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 12:51:00 -0400
Received: by mail-pg1-x530.google.com with SMTP id s11so6458509pgr.11
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 09:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DAy9K5Dk6cCjC8JMG7DbxZJASbH7spHP3sfgl78LUxk=;
 b=K/R/NKuG85OtmCXEVXW/aGrlt8WCvMOptDDuTY3nZpHftgZ4M6av9Wi/hUj8WeNp3a
 BRI2b/hAlcn/IimlK7zDyzRQETAe8i5Iy5OIeF5mPIIZdEfWqmXtRFcD7luJW73D/4pI
 XxNJKYOEjSbJlvs7p+jODWHp/Wq4eO3g94ciBE1IFWYZigNWMS6Cv+m53n6MxdQLuq97
 mGCrl7aOyd3TjT61dFoK+E+5o3EeI1tObkvQfDof8rHHZ38rfVnW196zC7b+veLFHSXN
 D38Gb81IS2Pm/aZrlvyEpokyiVfqQt0+jFFDOxMeiONhS9ChCQIy/8bfV1ZMl4wCCE/4
 HF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DAy9K5Dk6cCjC8JMG7DbxZJASbH7spHP3sfgl78LUxk=;
 b=Mj51uA55DFLYBCOBC/YIfWWEUj0jqK0RGAS5Jzuw7tOHoQwx5/UE/jVRdnuBNc9iK5
 VBDnb31STHQpNzkZstCFDTlyqOvyC9IKbO/K1BnMNZuBLPxqzFRuuBn1OfJDusQA64vD
 wirTtdVTGC9oaEh+6HQSGtpl/w9WHh9/LNuw6d1HpNWw4aCd+I5K+m6E5nyTEWEDTvGL
 bh8KIiWn+sz9jA7ucr3NtzF8A0csBGHHIQxbUzyAxHrorSukO2bbhus3J4gC4Ah1ssH7
 1IHu20wFpw+uf23ip7L1kTNujTybB7syfgu+cOd+LfbL+xaux3KrZysO3PM2KTP1SEAR
 irdg==
X-Gm-Message-State: AOAM53130f0I6wUNWfMeGdHWHXW5VwApd3owheD2010ZsSNOtpw8UGvk
 zKfupdP2roMa6puHxeSctwyRmjveXR3RPw==
X-Received: by 2002:a63:595f:: with SMTP id j31mr14789519pgm.109.1629391857649; 
 Thu, 19 Aug 2021 09:50:57 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id c2sm4115656pfp.138.2021.08.19.09.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 09:50:57 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/arm: Take an exception if PC is misaligned
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-4-richard.henderson@linaro.org>
 <CAFEAcA-v6z9UTbmdHqMugbtqv1n92SJ7EFGM8Gnk+_90FMyoBg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bb739396-f8d1-a5a8-ab1a-61892d9c84e6@linaro.org>
Date: Thu, 19 Aug 2021 06:50:53 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-v6z9UTbmdHqMugbtqv1n92SJ7EFGM8Gnk+_90FMyoBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.591,
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
X-TUID: riZQdSBkXOb2

On 8/19/21 3:40 AM, Peter Maydell wrote:
>>       uint32_t insn;
>>       bool is_16bit;
>>
>> -    if (arm_pre_translate_insn(dc)) {
>> +    if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
> 
> 
> Is it not possible to get a misaligned PC in the Thumb case ?

No.  The thumb bit is always removed, leaving all pc aligned mod 2.
Both BXWritePC and BranchWritePC do this, as do we in gen_bx and store_reg.


r~
