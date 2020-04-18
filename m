Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1274189lfm;
        Fri, 17 Apr 2020 20:42:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypLiwLHuFY4mfDx14xOcjlTtHhhucunquCq26PXo5/aVuwExI4XA98aF6tvo9FqFKQRiDVfL
X-Received: by 2002:ac8:f23:: with SMTP id e32mr6413206qtk.368.1587181321133;
        Fri, 17 Apr 2020 20:42:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587181321; cv=none;
        d=google.com; s=arc-20160816;
        b=SaVvBfMWdaTusut1JyKYFbYoIxs8rWGVA8gwf1ltx5d1P+yin04y6GIE5dFVGCV+2d
         ZZsyRejXKgUW9NFC/YdTwlGMiv7pbk4/Xl8MZ8mMyrXqvIv5aL0SIojD09Ykos+d8bCt
         3O/pThKyBkFZvzXdTKNUlysTM6K3FvpKS/IEi9COHMGRNICjkAMAaTRFzfMf4P1nDJlE
         2WNLgDg7+63vlwvozdYdlEBhONeABsMIBphTz2RlLrcd6/Va+t7ANPZZoF3adDkL+Pus
         FdsUowRtgGaLFpcyh0gSYqNQgPjN3cdrvd5b/nsLsmPdeQDTqeGdFlUQ1wiQYGAHMPdY
         Nt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kyXs52D+W8xKx80sHVX3U7UyTi/vLCOHtkNQK+UXwVs=;
        b=fvJaH3ZPtY59tc5t/73GxY6KemswS922laCiIk2I25L8/8XCmTjo8teAI7lcwZ7XFk
         A/a33nmxP0fUJEtm8ecBMCGzh5CACmQXh/D+VUqsvAgrqCi+vNL/lC5dYEZEeD6loUEV
         qS/37M90u5HEyqDeIBHZAvHtJvFOSE5WFs5AQWJmmRwqHWpG4eGGvYZwS33/0fYg5tjc
         ZmARaPzOhxd7tlqki92djKlPsWxQUmNL0T7H8G2qtP5xV9tAqKF2PUjpuMFr2+X1cH0p
         qDoypin8N20AdJEfsYNTgtK8mT6cIZeczqCg+wdldNyyKcrH9U0WFoYjdUJ2jS9eBR+i
         /APQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q3B+2PQ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19si10823756qtu.372.2020.04.17.20.42.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 20:42:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q3B+2PQ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPeMi-0002qs-K3
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 23:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34702)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jPeM5-0002qB-Ey
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 23:41:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jPeM0-0000NA-Fj
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 23:41:18 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:51822)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jPeLy-0000Ey-5g
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 23:41:14 -0400
Received: by mail-pj1-x1042.google.com with SMTP id kb16so1930413pjb.1
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2020 20:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kyXs52D+W8xKx80sHVX3U7UyTi/vLCOHtkNQK+UXwVs=;
 b=q3B+2PQ8O4FNhku0/3V7OzCkEKHLlEYLQizS6tHtToz8GYgfCV/pR9ey5iscjJqs1V
 YJmBg5aUQPfRIgmxC4l+7Ni3pC8hEJvyE5YDx1ssis0PpVzrkrKpu3jv2BVo7v8F6KdA
 i+yHp1NiuauEJDlil60atk6qgL5ZkpjHgbGNMyHQkRq3Pg0hHVVG/6upDOmvD6KXbAJn
 cWPlNaoNspkXdafPiyjc/hkbLBTIYrC7hxu6D9fY6ly68rMv+S16xVFlpVG4ISi+bSdh
 LerFjBoyj6cB7AXCheq3zc69pRPHQ8Ul0GjpQuDjUJC7O+XvsHZGj6kVXVHLYn9CXdEV
 0jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kyXs52D+W8xKx80sHVX3U7UyTi/vLCOHtkNQK+UXwVs=;
 b=RzgjXZUX8oBTX0i3zhqdnmUK2yNnU3M3GQY8WBJfp6DMBS20Wwryqgvq89s32CKyJL
 RtlzO/QRLWFZSK41mH4pskShlTD6BBw+7uHzy2oTEqfmAyeLvx23WxA9fEGYfDMTgUjX
 XTtFiNG7aNwC6VIKKXgVJmEvKK0FojyaNKzQMlJm8wT6pUGaGfntUnqeXWtaEYWCdqzC
 2sFei9AQ8VS2qFJjn61JVmJDwC1m6JguWDy0VlVPEs6a5gsU26G5HjSvqtS5IIvNWjv+
 Dx3vY2aFzsO0b5zMk5FPND3s6uKXtsUKzeN/quxZ+O7M4nhiidrfgnE4mmiUzXZHIntr
 CJyg==
X-Gm-Message-State: AGi0PuaA0aSL4Zc7eDSczmyow3bTXneazNoYOyQV48fCIS4c9LULpEXz
 qNRPbDiWbksnz3d1wkH8XwuWh63D16A=
X-Received: by 2002:a17:90a:f689:: with SMTP id
 cl9mr8422457pjb.43.1587181270468; 
 Fri, 17 Apr 2020 20:41:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id k24sm20548440pfk.164.2020.04.17.20.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 20:41:09 -0700 (PDT)
Subject: Re: [PATCH 08/16] target/arm: Use SVEContLdSt in sve_ld1_r
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-9-richard.henderson@linaro.org>
 <CAFEAcA-v9O6+iZu9_grS6iW=QhmJeLGVfnJ8BOe59KzaPMczzg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba2b5050-4d21-dfad-ae81-667438dbd89b@linaro.org>
Date: Fri, 17 Apr 2020 20:41:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-v9O6+iZu9_grS6iW=QhmJeLGVfnJ8BOe59KzaPMczzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
X-TUID: 5NJyBQMzNTel

On 4/16/20 6:26 AM, Peter Maydell wrote:
> On Wed, 11 Mar 2020 at 06:44, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> First use of the new helper functions, so we can remove the
>> unused markup.  No longer need a scratch for user-only, as
>> we completely probe the page set before reading; system mode
>> still requires a scratch for MMIO.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> +    /* The entire operation is in RAM, on valid pages. */
>> +
>> +    memset(vd, 0, reg_max);
>> +    mem_off = info.mem_off_first[0];
>> +    reg_off = info.reg_off_first[0];
>> +    reg_last = info.reg_off_last[0];
>> +    host = info.page[0].host;
>> +
>> +    while (reg_off <= reg_last) {
>> +        uint64_t pg = vg[reg_off >> 6];
>> +        do {
>> +            if ((pg >> (reg_off & 63)) & 1) {
>> +                host_fn(vd, reg_off, host + mem_off);
>> +            }
>> +            reg_off += 1 << esz;
>> +            mem_off += 1 << msz;
>> +        } while (reg_off <= reg_last && (reg_off & 63));
>> +    }
>> +
>> +    /*
>> +     * Use the slow path to manage the cross-page misalignment.
>> +     * But we know this is RAM and cannot trap.
>> +     */
>> +    mem_off = info.mem_off_split;
>> +    if (unlikely(mem_off >= 0)) {
>> +        tlb_fn(env, vd, info.reg_off_split, addr + mem_off, retaddr);
>> +    }
>> +
>> +    mem_off = info.mem_off_first[1];
>> +    if (unlikely(mem_off >= 0)) {
>> +        reg_off = info.reg_off_first[1];
>> +        reg_last = info.reg_off_last[1];
>> +        host = info.page[1].host;
>> +
>> +        do {
>> +            uint64_t pg = vg[reg_off >> 6];
>> +            do {
>> +                if ((pg >> (reg_off & 63)) & 1) {
>> +                    host_fn(vd, reg_off, host + mem_off);
>> +                }
>> +                reg_off += 1 << esz;
>> +                mem_off += 1 << msz;
>> +            } while (reg_off & 63);
>> +        } while (reg_off <= reg_last);
> 
> Does this loop for the second page need to be phrased
> differently than the loop for the first page was? I was
> expecting the two chunks of code to be identical, and they
> almost are, but not quite...

Yes, they do need to be different.  In particular, the first page may only have
the one element that crosses the page boundary, so we may have reg_first >
reg_last.  The second page is never has that problem.


r~
