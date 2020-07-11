Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1861543lfm;
        Sat, 11 Jul 2020 12:26:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0DXcLMIQdk03bGKfQHsJrpV+efUSz3cDBnWamW2MI0LCFEhS+VVq7asWbIUNBlyVYCsaV
X-Received: by 2002:a25:640c:: with SMTP id y12mr17632783ybb.195.1594495594550;
        Sat, 11 Jul 2020 12:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594495594; cv=none;
        d=google.com; s=arc-20160816;
        b=vgvxAKnXs4286TJxN1yUNcrpU6AZ9n6Sog/8lEZEdoA+jaou4fik1M8/6zoERmwUtK
         MQrSP/JcaiFEELY43U1aQt+2LStgSVlbv+YWaiOAGvV0B2gsKZik8G3Psu3+tU50DwRx
         86nNk9YogUcaLKbMaq5x39bSrPxdWqgEDyOPrL0qi419WeDx/MbTYdwZT2mK96IGxIlH
         1BxCBN0knootXJsBCnXKfnZOEKZYWFWdvYsFFQto6miqA042ox72OGL8L7PidtryUJdf
         yCKBaArH7rPXROxlypJd9oU1Tm2yV6nKmi5JsAaBs7WfN2rrov2w49BVTl8DbHSA7sIx
         HgDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ELV1gz6aQk79GXpizeiqgDsyWHiirmL7xY5jfjzqePA=;
        b=0wTou5aouAlb4KBTvn706HrLFixDUF709XJeO9Jjrorbc0AbM9mrEgv/gOARgrxhIY
         HtAzQVMC68Cp0B6lFHMF+Ro5ktzpwDqMtkbmWve50ieoNuivq0UTWe3mDklAMK51QUMt
         jZSe5uGwj+UJkaIkd282mMyU1pTbL/j/bJ9u4Z3auzTARf/v0xsYESqoyz9jHt+zL970
         TzUlubflBS9PwJozvdaTEVE1x6TH6NcsqxeC138dJbagi1J2PRIuSdFJTY/6WA8GrhUf
         8Oe73K4p0DdzGwJTZaLnz+NPzKqYeTKJEqKEl8/sQ1OpWedGqReFOalsD9ONMDZuKZTe
         kp7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bu2z4BoN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si9345895ybo.454.2020.07.11.12.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Jul 2020 12:26:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bu2z4BoN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juL8r-0006ix-W5
	for alex.bennee@linaro.org; Sat, 11 Jul 2020 15:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1juL8l-0006ir-1y
 for qemu-arm@nongnu.org; Sat, 11 Jul 2020 15:26:27 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1juL8j-0005DF-1d
 for qemu-arm@nongnu.org; Sat, 11 Jul 2020 15:26:26 -0400
Received: by mail-pl1-x641.google.com with SMTP id p1so3613049pls.4
 for <qemu-arm@nongnu.org>; Sat, 11 Jul 2020 12:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ELV1gz6aQk79GXpizeiqgDsyWHiirmL7xY5jfjzqePA=;
 b=Bu2z4BoNYBhMYrxcwOPo14yHCurpeS6rXBYfPYBGAxzr8cTd6I3BUw63MMhLqnQMv/
 T3SsPczJuQJaZQSO3nfFo9b6KgQjsffudmfAs+GqLLWx9HWMCLkWX3M4JNXWYIOobVox
 ms39KVOHw2C+i5ui1AaUhEfEhO509EKz0eqS8wY3ZF6skWvcPQvKCypB/7wFaHDU733g
 0GKFwKoenntWdHCDD0HfGhbZTxtninBj6UU5v11YWSJFnKAHQg5WftQzxcrGuelndshA
 7WSGYnJAnSn0UGn4fmOgB55A9ymb37gYIEfcBrK/atDRBMEl5qB3/PXW1KclpeMezjl4
 vrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ELV1gz6aQk79GXpizeiqgDsyWHiirmL7xY5jfjzqePA=;
 b=tvJwfiaFsTEnuwPcv7reVPMW58RAtTZsX74CdJYgRRfBcilfSWAiiIJ8HTWNAuoU2W
 NE9QLpg9U/mGGMd5li2uXHdH1dvlOnZAYZNtig1tbA2OvxfzS4mrKgYFqlc1K6GEcNW1
 vgtPoTfDNtT7PN8yyG2rFE8pp7O5dusrYKltiGUK9CZ+UADbTSkJ+mwWUfrUQmyr39X3
 tIW8G/jSkcW4UqjDqJbjpSQCTWwCYBvF6J9Up6Q4v/HSIUWkpfmD6f3C6dL+ZAqyNQVo
 IN//RYTMLOPf3pMBk1J5MiKUrT0lhMoYjeyB2eSM4lK2tjRc7gyt2iQ/mOj6PQXwnXF4
 svUQ==
X-Gm-Message-State: AOAM533u5h5aBPpWY1QvVsazjJsB09MumxfoKJ9Dfs7TdlmOwcMwfLsA
 7n6a+W0VkgVO7y1HvBes8yiv2Q==
X-Received: by 2002:a17:90a:7487:: with SMTP id
 p7mr11992578pjk.233.1594495582794; 
 Sat, 11 Jul 2020 12:26:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o18sm11004030pfu.138.2020.07.11.12.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jul 2020 12:26:22 -0700 (PDT)
Subject: Re: [PATCH v2 07/17] linux-user: Fix guest_addr_valid vs reserved_va
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-8-richard.henderson@linaro.org>
 <CAFEAcA97vFoBSwmFkD6bpObD9P6W8J2iowKhk7mT32+xjte-4w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5230c3dd-6294-3de6-fea9-416f3dc84cba@linaro.org>
Date: Sat, 11 Jul 2020 12:26:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97vFoBSwmFkD6bpObD9P6W8J2iowKhk7mT32+xjte-4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 74/iqkTtqlw9

On 6/25/20 9:37 AM, Peter Maydell wrote:
> On Fri, 5 Jun 2020 at 05:17, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We must always use GUEST_ADDR_MAX, because even 32-bit hosts can
>> use -R <reserved_va> to restrict the memory address of the guest.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  include/exec/cpu_ldst.h | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> Doesn't this run into trouble with the arm32 commpage?
> The reserved_va is set there to 0xffff0000 (stopping
> at the commpage), but the addresses within the commpage
> themselves are still valid guest addresses.

Not really.  The commpage is Special, and gets allocated differently.  Normal
binaries work, e.g. our standard busybox ls.

I would imagine the corner case that doesn't work is that you couldn't issue a
syscall to the commpage, e.g.

    write(1, 0xfffff000, 1);

because the commpage is now outside the normal address space.

But given that it only matters with an explicit -R command-line option, this
falls into the Well Don't Do That Then category. This is a generic option, and
works as expected with other 32-bit guests.


r~
