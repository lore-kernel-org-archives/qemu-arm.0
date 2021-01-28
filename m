Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp42038lfo;
        Thu, 28 Jan 2021 00:50:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxw1UryhsVr6i0VG85hsfvRsa1V4/eR7dHM2FgSr4/AW+eMRUqU4I03trz95VRH0g3MHqmn
X-Received: by 2002:a25:2483:: with SMTP id k125mr22166210ybk.190.1611823815287;
        Thu, 28 Jan 2021 00:50:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611823815; cv=none;
        d=google.com; s=arc-20160816;
        b=PDBUEeu331xrcZI4vXdSYZ7godtvxiioNDp3SG2S0A1wjmlRmFGx/e/4WwOxNMuAk8
         fWxLsvjx4wMnCcv7Ut1It6mmDrcTyh93cqmUa/Ycyiptn9i32ESmIIl6YJ+z6s4zHPJw
         KeQrOqZ9eA4E5WPivQJZbZGvzkgJeOTu+pP2OZm3XNyU4U7xJHWqAiVU3jvpIwboqV7S
         VTwumMCbXWnlpwrDB8IEM+YDhGi84bW4Gcn09vXu11q3Yu85FKbGlD2VLbDEzIj91tug
         bWAm5ICDTMXjCNjvM44YXd08nLP/5KR96zK+RvyEczFGMvgJF4KIywm6s01iqjt9Slx8
         690A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=45HKNy8WCWZ85KF+zg6eFv2F4jWYn8ochLvmD9tik2A=;
        b=cQdBlfcSdZZCyS5KyfVG1ImqlB4Ft6ejfm2OvtRX4w3tt9D3/HdPvpHtw024rM5xHV
         EqACI0DBlvf3aEwEajU10JwpBvy36OONwyl3KWbMK8AHSAJXM0tXzRftP2D0TXbjq/u1
         qpNzL6kV337ZPdRhO1ALJRHR7iLoHQoAPYMANrthY4Z9F5FpR1Qq7FXU5Sg42cDstiH1
         sTB/vfbTvt4PE7YFXJWEcoKvit61zQyUwnLrgIcGL3ODTIh1GD4LKyCVECBMFTpUxpWg
         bAvbkeHf41agN5AUjTCvDsxUOy+DAmWkrzqf8rh+0ztFcgFjQzhQPS1ILlrToMkkTN6U
         Ai4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=euVZ3zin;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si5117292ybh.192.2021.01.28.00.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 00:50:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=euVZ3zin;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l530I-0006QH-Il
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 03:50:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52zv-0006P2-Jd
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 03:49:51 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52zt-0005Pi-FA
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 03:49:51 -0500
Received: by mail-pg1-x532.google.com with SMTP id o16so3848742pgg.5
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 00:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=45HKNy8WCWZ85KF+zg6eFv2F4jWYn8ochLvmD9tik2A=;
 b=euVZ3zin8JKLNWj9sD3kyR/aaGs+X6STYIqLK6zWJghX91prPrnhNMz/DCLENGjJQ0
 u2UGDidDdbwJQAFefWYY6YbL8hhduMZaGlAlYCCZCVWIf6KzITs1Q6lm+NYtZKUhYaSg
 cRa9+abo0qhtdsjHsPmQ9jQskdAhukFOaSLvHRjqJts1DZRL+oNYv/cYm6EaypC/3drE
 0KidiI0Q0Bye57+b3Bsvw6cg8WDcf1OjojPIhqm+yGW1Jv6uQV2aHIbhNVgfiPvjPbzI
 LhBcRH4AbQ2nOKzhqnWuFfzeb00s05ac5wxpkxv36xR4RUMsAh3c8gidCGfLXxMZI2fz
 bXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=45HKNy8WCWZ85KF+zg6eFv2F4jWYn8ochLvmD9tik2A=;
 b=VUqm2o/A6ClxM9Wr1Gr3MmfQ8LNh3w8U/DSM8xE8Gg/kKG4X/NvqPpfht6aBQNvqwO
 3X0vykR6RebRwlu2G6bS8VTolsyFsBbY978NWtA/Ci0Cm0gdQfo6Hkz0TFUchF58Esod
 WSOFJakKF6fakQ5Z8m3yNW/t4fKGpnd5gCxoRboC4Q5r7eumuHYcfRZgTv7Js2mdyeE5
 ao1BFe9WymyO1LS78zBdMuTc0wMH8/YuPRd9rc4o727crmx63D7w+I+MZ8oB7zy7fZta
 3aZzcjIruZOKtKt7NIzipvy9yf4VUj/4z5IbmVoxsnAv9HnRqgyOTnwohaqgqo6cOJZS
 BF+w==
X-Gm-Message-State: AOAM532bOyMc8CJu+aWsKx7rD8XIYcNzsz/Qb5e9zazno1YQNBCb4cFm
 hXW174e6J0YCunIa1Y8fDU/af/DJ22LdL1LJ
X-Received: by 2002:a05:6a00:15c8:b029:1b7:d521:32e9 with SMTP id
 o8-20020a056a0015c8b02901b7d52132e9mr14663350pfu.22.1611823787585; 
 Thu, 28 Jan 2021 00:49:47 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm4326994pjn.53.2021.01.28.00.49.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 00:49:46 -0800 (PST)
Subject: Re: [PATCH v3 18/21] linux-user/aarch64: Signal SEGV_MTEAERR for
 async tag check error
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-19-richard.henderson@linaro.org>
 <CAFEAcA8rXQ76AVpqHwum_XGh13u+vwkZw_yOxRKvfyqbV3_GBQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b81f168c-dfe3-5d59-b1a2-1c3df97f7105@linaro.org>
Date: Wed, 27 Jan 2021 22:49:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8rXQ76AVpqHwum_XGh13u+vwkZw_yOxRKvfyqbV3_GBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: 2pzNpJuRNSO/

On 1/22/21 3:59 AM, Peter Maydell wrote:
> On Fri, 15 Jan 2021 at 22:47, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> So when does the real kernel report async MTE exceptions to userspace?
> The commit message would be a good place to briefly describe the
> kernel's strategy and where QEMU differs from it (if anywhere)...

I can add that, sure.

>>          case EXCP_INTERRUPT:
>> -            /* just indicate that signals should be handled asap */
>> +            /* Just indicate that signals should be handled asap. */
>> +            check_mte_async_fault(env, &info);
>>              break;
>>          case EXCP_UDEF:
>>              info.si_signo = TARGET_SIGILL;
> 
> So this doesn't guarantee to check the async-fault status on
> every exit from cpu_exec(), which means we might miss things.
> For instance I think this slightly contrived example would not
> ever take the SEGV:
>     STR x0, [x1]   # with a bad tag
>     YIELD
> l:  B l
> 
> because the STR and YIELD go into the same TB, the YIELD causes us
> to leave the TB with EXCP_YIELD, we don't check for an async fault
> in that code path, and then we'll go into the infinite loop and
> have nothing to prompt us to come out and look at the async fault flags.

I'll add that test case to the smoke test.

> Does it work if we just always queue the SEGV on exit from cpu_exec()
> and let the signal handling machinery prioritize if we also pend
> some other signal because this was an EXCP_UDEF or whatever?
> It would be neater if we could keep the fault-check outside the
> switch (trapnr) somehow.

I would think so.  I'll try that.

>> +#ifdef CONFIG_USER_ONLY
>> +        /*
>> +         * Stand in for a timer irq, setting _TIF_MTE_ASYNC_FAULT,
>> +         * which then sends a SIGSEGV when the thread is next scheduled.
>> +         * This cpu will return to the main loop at the end of the TB,
>> +         * which is rather sooner than "normal".  But the alternative
>> +         * is waiting until the next syscall.
>> +         */
>> +        qemu_cpu_kick(env_cpu(env));
>> +#endif
>>          break;
> 
> This does the right thing, but qemu_cpu_kick() is one of those
> functions that's in a category of "not used much at all in the
> codebase" and which always make me wonder if there's a reason.
> (In particular there's exactly one use in the whole of target/
> right now.) I suppose the case of "helper function wants to cause
> us to leave the TB loop but not to abort the current insn" is
> an unusual one...

Exactly.

Usually something in target/ calls (via mmio or whatnot) something in hw/ which
raises an interrupt, which does the kick.


r~
