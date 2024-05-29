Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp743587ejk;
        Wed, 29 May 2024 10:39:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/iex5U9aJhE2NlNimYO2HeFB5OVTv5JvXqLZBtKV0NIrQZXN7/GULNSJVSMfP/gfZJYNvX6IGJHLZukh2Vfpslih69Cm5
X-Google-Smtp-Source: AGHT+IF76YAsCdHqQsYKZ4BbQNuG1U+pi2iwzNgCl5wV2Ek3fKphMztgJnBpF7JTaBbCuR0ALzNV
X-Received: by 2002:a9d:63c1:0:b0:6f1:29a1:c54d with SMTP id 46e09a7af769-6f8d0a75273mr15882965a34.16.1717004374349;
        Wed, 29 May 2024 10:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717004374; cv=none;
        d=google.com; s=arc-20160816;
        b=uw1hls0pkqAKGt3JcP9UzYxWlqobeC1jXUONpYxwKDOHmJcSerSy/jxFN2W4nmLNNP
         MLQUZ1m6jVPAQEPIivZ7KWVyCisbmEMLPLMPiQ+H7M3Y+mic2gmT/tlQUX8v+QI0p3lu
         H12W4BqKiTS48EMmKtmIkBmqUhORx/5NyGtQG1e7Ykz2ZaQPat+06j2GkiAPlkmAUpaw
         cA3tL+qu9/L3IOq9RRYlUKJWgKogJr8JKZ9CWI5o2RtDOhdjQ6xPD1Loan5jttD/B064
         XWPZ0P5FeUphpA7h1Pj3NspLMKXoM28z0CtMcBlwVSnYjn+sbbSKjksppvzesYFXDJWo
         kFeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=O3mRJFYCOgifPjcVFgqf96jf2Wxa7QVuL9Ip8wM3hYc=;
        fh=JYXuk8MOGvdKrFAA4JRvS0pujnEsAAZBDCuqFcxD0aA=;
        b=nuoaKXXEeRNCRXT1pLVN+q6tC4m8ZwKtoaRViG1mGXg7djFy/E79hOF1WXzI5Gua1x
         jOGizYqx0boRFLGDnmnwlaXbZKqZnRZUdNjip5Muh41G6FO9UkTAq7vG/Jmh9M0A0DfO
         f2nPXT5beL0IcGvP7eKwAOdqpTu0PjJ/3dtcihdQ7giO4AE60gGc7w5EpbeCVaTPcZav
         ValWlsJwIXKN4gOsVw12D1c0yJBH/2Ey/4YPpN4FIRrDISEEqEF+gpTN4tUm/whhyBVx
         mbVId9zT2Rey5LyfiM+CQxZXGjmZXafRXc56iLok8dJqgt+hu92zWVdaHmyufiE34Dmv
         dLNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kB3MLGNX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18a60c9si145607371cf.295.2024.05.29.10.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 May 2024 10:39:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kB3MLGNX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCNGp-0002rM-Dt; Wed, 29 May 2024 13:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sCNGm-0002qL-M4
 for qemu-arm@nongnu.org; Wed, 29 May 2024 13:39:24 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sCNGl-0001mt-5z
 for qemu-arm@nongnu.org; Wed, 29 May 2024 13:39:24 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-6bce380eb9bso6759a12.0
 for <qemu-arm@nongnu.org>; Wed, 29 May 2024 10:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717004362; x=1717609162; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O3mRJFYCOgifPjcVFgqf96jf2Wxa7QVuL9Ip8wM3hYc=;
 b=kB3MLGNXClETz6s+RyZoOkP/RO3Vgyl5RuXeEWUXST/Pgyjrh0M3zzaV+d99+EZDMP
 zgL7bbXVLwTqk9Rmgr8G/kDZLkdP0uSJ7TJpOvByi6VmAu68NFe45jtXduP2ILqBEKHA
 sAAiPmY7m9k7QGptQzQXlA2xuvRODLEA8GSosYCfGvEaZ8PV/3onwm5eiBETup/+xl69
 kTd8N5kbPtAX+D7ich/Ks9q27vWneRJsL4oBtDTlMLRXsJ8UZIga2ERT+5Km800fUDO2
 CIhwjNm3AjsNLi2Wxg/8idmTPc2QAUx/d6jltgjs7Qr76fJ/JoKvekIt6vp1Mt3jyfAB
 5DHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717004362; x=1717609162;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O3mRJFYCOgifPjcVFgqf96jf2Wxa7QVuL9Ip8wM3hYc=;
 b=O40l6ollvsYONc0dF5AWj2/UT1PAB4C/iFybisFFD2K/uOWmYiY+vbKkNLuWB1fx4r
 o/N5i62qyXpw4KV0AnsiNgxzSktyER3Kfal7kdqEhnsJojkLKpjyi0HVnQe+UbZi86jb
 K/6p574wQwFOsnKAX3laGcFHefB2jCiNf2/DXb5x5grNevo3d/3iug0yTlQkG990putL
 fBcfDIUzLB0rpkdamv89wgOtmPkiiF6mOzwWx497Ii6KmJndH1+qF48E8uym9SL7RSrH
 TfUpqWPe8mP+FtTLx8TfvddCC+kLPf7s2NmfebHDCsdzOfyUr6HCqi+WSzu5+kfFxJHO
 Pi/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAoCZDiS1pBM3qPGoEQ4Ia7rNag1c6vBJqUgdYZTFNXqPY05N5t34keKrsEpWpJ+MW/m30RhVCuP94CydcFKybP1Ag
X-Gm-Message-State: AOJu0YzPF7DS9wUVyo4D+nENJz71tTGu/1ghXxNge2yfsKP2f/3puKrc
 d7tLNsq3BvagPYr91uB1qL0CKbCZHZII5NE4Bez6sfwLHDoFoFQxMNBvfCBAcIs=
X-Received: by 2002:a17:902:cecd:b0:1f3:35e8:d309 with SMTP id
 d9443c01a7336-1f4486d9f35mr175791625ad.20.1717004361644; 
 Wed, 29 May 2024 10:39:21 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c99461asm102177715ad.207.2024.05.29.10.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 10:39:21 -0700 (PDT)
Message-ID: <6ee29ed0-c893-4f16-8afb-55ff365b1f1e@linaro.org>
Date: Wed, 29 May 2024 10:39:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/67] target/arm: Reject incorrect operands to PLD,
 PLDW, PLI
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-4-richard.henderson@linaro.org>
 <CAFEAcA89_nWDXhXKds3gezUyXdXfO61bMNgSn=em166ufgQAbQ@mail.gmail.com>
 <3f1baa61-c623-4b5b-b724-15bb68a2df3f@linaro.org>
 <CAFEAcA9ySeup4wE6BwtLYHi53PcktT1AME2Pg7CwgQsAJzb6WA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9ySeup4wE6BwtLYHi53PcktT1AME2Pg7CwgQsAJzb6WA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VrumfxCJPd5Q

On 5/29/24 06:32, Peter Maydell wrote:
>> We do plenty of other treatments of UNPREDICTABLE as UNDEF (e.g. STREX).  Why is this case
>> any different?
> 
> It just seems like a lot of effort to go to. Sometimes we
> UNDEF for UNPREDICTABLEs, but quite often we say "the
> behaviour we get for free is fine, so no need to write
> extra code".
> 
> In this particular case, also:
>   * we'd need to go back and cross-check against older
>     architecture manuals and also look at whether M-profile
>     and A-profile are doing the same thing here
>   * the "v8 loosens the UNPREDICTABLE case for m = 13 T1
>     encoding" looks suspiciously to me like a "nobody ever
>     actually made this do anything except behave like the A1
>     encoding, so make T1 and A1 the same" kind of relaxation
> 
> Basically, it would take me probably 15+ minutes to review
> the changes against the various versions of the docs and
> I don't think it's worth the effort :-)

Fair enough.  I've sent a patch to update thumb.risu to avoid the problematic patterns.


r~

