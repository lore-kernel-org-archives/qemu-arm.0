Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2686080lfq;
        Fri, 9 Oct 2020 15:34:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOWHF+RZPK0n2ZlEdARauYBsKE+hbwxxnJ6aYpdsBjJLchJg9vKV6gH2dozSDApF7OM2QI
X-Received: by 2002:a25:af90:: with SMTP id g16mr19550246ybh.259.1602282879328;
        Fri, 09 Oct 2020 15:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602282879; cv=none;
        d=google.com; s=arc-20160816;
        b=TEisq7Ds3yf8yZeKV6bblmwYC4i5PuK05IU2QX3IkZm7WtZ+yq5XHTvaQjMap9Eb7+
         QjHUtf8q23B7Fllyiw4m7NqXHjL7+y+xlKcDi8Acj/M+34jYiq2Hc8awtjIypLwljqYi
         VnSHjX6yuHUA2EQzg3toF3qz9W+Srgu+FknZzSxKEEQkZEbPq4YMRqwnD06Q+tHzAF6+
         h3FY3+GmiucTmDU9wkcDwiCXglVcBUAgazjREtQCE9lKnkNn0beofNFAPDmBy/UC161i
         rmgTr10qUxY1d+WIlK12MXvFTET2Elp2Z1DKHnlmnc5Tbv8nwtO8TkDtWlitAEPMt8l0
         jweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=s+SoOCi13C4EVmQ8xozsTYLCeZGrYVp/feQrf9CbVsY=;
        b=jwBXKN7EwxhwqA8dYCgKcw/3EjqNuuyFnaPW1lMiA+s0wgPSzoQl+snNp8PycTcuKN
         OwsEjv+euHwqjHZxUmwmTLxjpeav5qrYOz0R9Jsh753e1rEuqchsMHn5uNl1dSxRImLi
         kp0VEGFhoVGpOymVotO9OlwREv2gvU3C4JrTAjx9ldEMkZU9bavHxx1yGH02Q2z+faU3
         N7dc1DX8whBdKQNFX3Nqy1c3PH+WDwTwXlgQ4iKM6TAq/mnySrm7XtahEiLu/Lt9HlvU
         dk8qNdx8g854JzmZCbPrVUY7xL6jBryQOVi6irSewnVMudsMyqaZ5SA0Vj7R58QQW3Kp
         1KqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KvL84/Rw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si10124614ybp.344.2020.10.09.15.34.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 15:34:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KvL84/Rw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kR0yE-00034I-L8
	for alex.bennee@linaro.org; Fri, 09 Oct 2020 18:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kR0xl-00033i-JK
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 18:34:09 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kR0xj-0007YG-U2
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 18:34:09 -0400
Received: by mail-oi1-x241.google.com with SMTP id u17so11831544oie.3
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2020 15:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s+SoOCi13C4EVmQ8xozsTYLCeZGrYVp/feQrf9CbVsY=;
 b=KvL84/RwEvQV9V2wvU1YiCjWSWECbRrqHRGS6AltcC/ip9gnwoEXs5+Oym4JuvQOav
 LqjbqBy7N7dSQlAkoAkwuVFbjMpKOPL2fiMoo4T7NBnBsjUKXx5gRcYinIZeH6oVkg+7
 wCKo6yY6g02GDccnvR0NT9TGOUS7XQ58L+WO1SAdh75XAZSV+k55VeFeK/WZo+PhaU3M
 K04yHNUGJ/1wVy/rppjyJk+tMF/t9ZbYU7L0aWv5G4P60VUaNrdsiaMlklRV7hVvZ41s
 XvR+dfTjwOgZLD7w72swJpz57OQlhb6hDxTjsDHEpWGncw0Rqn59UlQC8m861ZmANyuJ
 GOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s+SoOCi13C4EVmQ8xozsTYLCeZGrYVp/feQrf9CbVsY=;
 b=WkMWBMKZkdQTTSg+7UrlmnKAkmMNnbEsIwNj0MD9eUPfnV/jlxQjU4YjEL2tikK3WN
 AO2WzfjwuKFWht22QO3WVpUCWxpYtZ4hYtOwDmEsQ4Wr1bPm3ZEFFv7g7POBheIUiXLJ
 Aql85IKtgrsFnVmJgGQ3OhJNa0aToS+711BcmCAvvP2ogxKhDG8Chl6c3aLvOy7bKEuA
 eLfLlitIjszPQAp5/B9VW7/jzXdT63F/dvji3FS3l77KcOTYU5FDUteJ4iAK6CBdwere
 vM2IyCzKgm3I3XsBuN7PC5RKAdJHa21FuV+FKfPnwLPM7FdpBlaYgjDkGu5+DRgPGbJk
 8Kpg==
X-Gm-Message-State: AOAM530wPSdLnruvi85jr293lklEfz9rRAy/rhB0GXAFR1MWFFomgkv4
 al/uWXyfgT/uqc/nTHkgWcjZBw==
X-Received: by 2002:aca:d856:: with SMTP id p83mr4123655oig.57.1602282846596; 
 Fri, 09 Oct 2020 15:34:06 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id b3sm7492159oie.49.2020.10.09.15.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 15:34:05 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Fix SMLAD incorrect setting of Q bit
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201009144712.11187-1-peter.maydell@linaro.org>
 <9b6bcfac-922d-675c-d7b4-35491a3efe60@linaro.org>
 <CAFEAcA_TZQOFtQn=MhvaF7wvXCgQLHfhpekHb29kb-p8VgWfYA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5702c321-0d70-6e26-4aea-8ac9e6f90cbc@linaro.org>
Date: Fri, 9 Oct 2020 17:34:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_TZQOFtQn=MhvaF7wvXCgQLHfhpekHb29kb-p8VgWfYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.208,
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
X-TUID: lHcqiIJubSBF

On 10/9/20 1:47 PM, Peter Maydell wrote:
> On Fri, 9 Oct 2020 at 18:57, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 10/9/20 9:47 AM, Peter Maydell wrote:
>>> +        /*
>>> +         * t1 is the low half of the result which goes into Rd.
>>> +         * We have overflow and must set Q if the high half (t2)
>>> +         * is different from the sign-extension of t1.
>>> +         */
>>> +        t3 = tcg_temp_new_i32();
>>> +        tcg_gen_sari_i32(t3, t1, 31);
>>> +        qf = load_cpu_field(QF);
>>> +        one = tcg_const_i32(1);
>>> +        tcg_gen_movcond_i32(TCG_COND_NE, qf, t2, t3, one, qf);
>>> +        store_cpu_field(qf, QF);
>>
>> This works, however, QF is not restricted to {0,1}.
> 
> I'm not sure if you mean "this code doesn't maintain that
> invariant" or "there is no such invariant". If the former,
> the declaration of the field in cpu.h disagrees:
>     uint32_t QF; /* 0 or 1 */

Oops, I confused QF with QC, the neon saturation bit.


r~
