Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp281843njc;
        Thu, 14 Nov 2024 04:26:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVBJIOK/4h30cPR00OCZvge+0NxjjXh5UUlO1lP6AbmEDw/r1/gVLp9OS5UTV8V0HaVMWrve/v3ZIN5/g==@linaro.org
X-Google-Smtp-Source: AGHT+IGIQqozLguzC0LBRfADa9haXrT9NPsDCX//LMxrkLfdXplhlgn6H7x5D9rPj0Zwio2Q0MbY
X-Received: by 2002:a05:620a:2802:b0:7a2:2cc:83d7 with SMTP id af79cd13be357-7b34baf0c5fmr1253678585a.6.1731587209373;
        Thu, 14 Nov 2024 04:26:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731587209; cv=none;
        d=google.com; s=arc-20240605;
        b=JGW1OVDoRgZ/bcdUTVk/IlgbxhTb6OnUM22wSFOYmo0xBUAMNzmU+d2EmyvdBu+y+r
         SnwzdDpjpA4SKxxqtu1AbCQSzAKGOyRJBQEoPGJbVmR7zIgmY4W5kP5TQHw41Y4iYf0C
         XpXlKbD9m6bAYES1WE0D+j6XF4454v7VJjwdHZ4zBHfjQzMe+BOjG5UrDk7ukcz9z9IA
         ztHAPSFtb6h98wmRuhDJqYJ0SOKsLGV4A/Mqn3hhJ0iN7nm6Ee5ZE2Hg/DEmdp2OWCQ4
         ppQZ51DjUOLtRfVPPeq0aL2PGuZ9lde8VfabqNJYfsm6Ezb8HrSlAqjMCGPbm2zJwAyG
         SmFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6+xLKBDHLhgPMFCSoABBMbJcyE+9GkQP3z+ZLeU8bRc=;
        fh=VQUMc85x8ANizanga/Uk0eVpSOWbPwTPWK+d/C2OKHM=;
        b=KUCY5/BbB6Fd0ggVA/bLFQ8DJUzANQWLIgnEwd9AQ7aptzZBL8jLHfVLZJckiQOspG
         I6Am39/CJnt1IAP14EfKZeQ+6SAKY9Npx78ZImQXIihRCfzBTwPypTJpie4WbkoaRjxV
         NzFHvvfC5/DoHTkFfG94KaYpW1OOqZbhbnHBqlS/ZRer3350URKVj4/DZPoM1x8RrNmJ
         0fopnujgJfh6UzUlZWVRpNeQS0ONRxzkiAPTfHd1p/v/UeH9XqakAyxugHvccWRa5FQU
         0SMEfAcVprJaW7kx1JLY6qOKOI4cHZoM2erXzeSEQ0jhKSgz98ivhkztlewswgVta9w2
         xAUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pPYn5S/i";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35cb0425fsi110171385a.689.2024.11.14.04.26.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 04:26:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pPYn5S/i";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tBYvg-0003Y0-4O; Thu, 14 Nov 2024 07:26:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBYve-0003XK-0X
 for qemu-devel@nongnu.org; Thu, 14 Nov 2024 07:26:30 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBYvc-0006xx-EC
 for qemu-devel@nongnu.org; Thu, 14 Nov 2024 07:26:29 -0500
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-7f71f2b1370so365477a12.1
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2024 04:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731587187; x=1732191987; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6+xLKBDHLhgPMFCSoABBMbJcyE+9GkQP3z+ZLeU8bRc=;
 b=pPYn5S/iCYow0fzY0kg+5LKob55Md5p7ZZaHbzkeQ4eCk40zLDvzrFj3J+Xeax5UYY
 ejk/VYRz/GQOGIRtRd9Yf1rb9WfNxTpHFLS8W0270Z2E3DRzeDtQ0w00z3n98AB9i9bB
 ig7vde1EQGo2498EdnuWjjKplJ2dFXL0jCyryN1FAMbEIeXW3SSDcEwf/K5VfWX4FtPy
 ck1VeMRbRVTZioc/AmltkD2j6CZLuUHtxD29smRFjKN3Fx3e1JnInWAZ8XU/ewfch37v
 q2E/IIJYwNp42PwA67tQR4y2KFO0bM0wjv+1rzR7G6RAqh8Mr+D8cudRpLETrtaZJVul
 Enag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731587187; x=1732191987;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6+xLKBDHLhgPMFCSoABBMbJcyE+9GkQP3z+ZLeU8bRc=;
 b=kHBplEUPACfN9N4CdV+wHaOpr/RaOxLHTsWHgdXEX0KfzAcG8hUvps7H16IcJXqDRu
 v4zs//KsLDgEIRKTPxpGULlanPUhD7riPX3ZLm5SdmMcaZLYX0o0psvp9rbjFSKf6Xd4
 LFTT+odikM4E3czI9mxbzFNB1uk6TXtJhqE+hfxJqBOTG6jKXd7pQJzkURb2W2TX5Ugw
 ZUmZqmqj2WN/aNHhP6fQssOjDrrGZZcMK8MqQDCgHNQHbEh/mSPDjtUygbYMN0HaSV+K
 O22axTOk0JNxFBGvOFRo2XY6iRQ6nuZu+j+Ns3+yJtbM5ONUQaz44TfhSlZuE+YSNO9S
 YtAw==
X-Gm-Message-State: AOJu0Yzx05UM1sogikRTvWCBmfedsSQkUotwbhtX/xeo3/xr6dvKbbhR
 D1i1pBOcHoZkne/6qdY0SqztoRaTaNJBo9s4BqX6Hn9cWsKBN8hVz1qNJIx9CJU=
X-Received: by 2002:a05:6a21:789f:b0:1db:e82e:c802 with SMTP id
 adf61e73a8af0-1dc5f9a3df7mr12382480637.41.1731587186958; 
 Thu, 14 Nov 2024 04:26:26 -0800 (PST)
Received: from [192.168.0.4] ([71.212.136.242])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ea024c06fbsm1181589a91.43.2024.11.14.04.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 04:26:26 -0800 (PST)
Message-ID: <e210893a-e875-497d-9dc0-aabf3fa291d0@linaro.org>
Date: Thu, 14 Nov 2024 04:26:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2] target/arm: Drop user-only special case in
 sve_stN_r
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20241112141232.321354-1-richard.henderson@linaro.org>
 <CAFEAcA_CsWCNKOqNKJe37JRXnOPikLSRq9FyMR+T0sLLkAidLA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_CsWCNKOqNKJe37JRXnOPikLSRq9FyMR+T0sLLkAidLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jm2reODpG+4a

On 11/14/24 04:24, Peter Maydell wrote:
> On Tue, 12 Nov 2024 at 14:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This path is reachable with plugins enabled, and provoked
>> with run-plugin-catch-syscalls-with-libinline.so.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/tcg/sve_helper.c | 4 ----
>>   1 file changed, 4 deletions(-)
> 
> 
> Applied to target-arm.next, thanks.
> 
> This looked like stable material to me so I've added the
> cc-stable tag; let me know if you think that's not
> appropriate.

It does seem good for stable.

r~
