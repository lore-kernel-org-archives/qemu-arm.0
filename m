Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp425992ejq;
        Tue, 16 May 2023 06:49:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ZeHVSgkvUQJajzwoKauXQEWsIdSpkV8FYw5vXDNTuSnPpNbFO21jOC9t7/NqrgFzQt6bA
X-Received: by 2002:a05:622a:1aaa:b0:3f2:e4f:49cc with SMTP id s42-20020a05622a1aaa00b003f20e4f49ccmr58236672qtc.40.1684244966540;
        Tue, 16 May 2023 06:49:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684244966; cv=none;
        d=google.com; s=arc-20160816;
        b=zGC31XsYiXHexumll9QXWmx5XOeXA8uoHEJ/o1cmVNhPUlKagsFaG6oR9dMucoo67O
         MNUbxwxRwuXBrH43kyK040LCMIg+64woJikGUpjg0m7+0yasId8V8eI2rvUZyCYR5zS8
         QoSZHq23jmxp3WsHURevMxeyPUPqal1fvNm3CAvNiLfRgHegb/yi+51u3FH4ZYQNBNHd
         c2QVAmW0KzxWsxEQ2DmsC8m3SsQXBQyaV/2dW7KDy2RwCbyBpzR0dX1uFiYYbFgm1qOe
         zCfH1C2GLpeYVc8sPDrQ1ug7i3H81cEKG52wJXWnAoxOohlYcynKmSb+7nbfOSlu8y5j
         Pn3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=63Nz8jrRwNkgVogeAp1t3FO6mZRBCNWCI890vpaZHU8=;
        b=l+rdWEZkjP5MECfwCNG/49KNrRsnjHtJ9arwv9phc3W0Z2BQSahvwwhD8fp+OPj6ty
         YZH+DNrNZyuLnloJsnvGfNQJL0p8xnMrmtVPLXYpirECbyAZnZu9b1AtC12XKVM1mLaZ
         SYHxVYYYKGxU1KJRYMmi36UUs6eCOLKdodFzY60CjVRbyVAZmjgK7D52ZA4IMZ94UKKQ
         TUNUCgtBXEfFeM/DNz7nb4XQMjbXuqxm49Zaj6WRaFVWxZlRevLJCEcEgmeDVgxgC+7b
         GbrB/IHqKGL3HcMBWADtlEP9nvUMgCv8N3yszt2wUB1Qry5Q+EzQBuZbNnNFdQBlnMBw
         Ev7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KlDfT/Gh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8-20020a05620a146800b007591be816c1si1208471qkl.543.2023.05.16.06.49.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 06:49:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KlDfT/Gh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyv2j-0004DT-K5; Tue, 16 May 2023 09:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyv2e-0004CG-Jj
 for qemu-arm@nongnu.org; Tue, 16 May 2023 09:48:42 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyv2d-0004FW-3V
 for qemu-arm@nongnu.org; Tue, 16 May 2023 09:48:40 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-644d9bf05b7so8245367b3a.3
 for <qemu-arm@nongnu.org>; Tue, 16 May 2023 06:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684244917; x=1686836917;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=63Nz8jrRwNkgVogeAp1t3FO6mZRBCNWCI890vpaZHU8=;
 b=KlDfT/GhB0BP8Y7477xV33HtLoFszzBgYIFmZVH76cgCaUiFPZTZNZpK+rntbiu/wm
 sE7HJxJuzKjpHkdzflsk6KjS3KXUR9EjrrwOHUDDlqJcMMkdKYp2t2eWexaFYHP/5Mcm
 dV++FNwPh58Qb5ooP5Z2nJuImoF+GS4Ou2MCKiULZoaOq+vDkpV7ENx/w8q6U6SFnz2A
 +iVyaGtT0VeE6dUqR1/TM4gc/ypjEqTbH9zBpbpLWo13/F2BycbMMG8llCMx0ZC+ehyi
 XGdFP+B7YS5/dRMB1fR43pQqISCYywClNLuIqDQQFJ+GNh47fjC1W52uYWXySBf1F2VH
 1OCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684244917; x=1686836917;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=63Nz8jrRwNkgVogeAp1t3FO6mZRBCNWCI890vpaZHU8=;
 b=fF9QSrcp0O1s45UgNcQjomevG7W8vvIxtCmrg6zRDJ0hgaunKGgadMyJl67SK4KZ0/
 JLRKkCG8fLhdItAA7PlEiKCRXXlzZU2zwS7a3ZByQIUKK0AMHiDG6k3xzQicnfjQPHAs
 QyVYPoFza55fduARXM9lttVdiJA8X97nZGC95oBwp5RVgJ2mKzGeGtp32+sspYOrctpZ
 5Am+nHS3FaRhNeSDWKeoCms6RvlRXUp2NLnU8TZoiHg0hIjUbCxH95rM7wf3Jh1xPpYG
 q9MsROmMa9kHdSm/gfU1qWGTqUBFwuN9vhept5+V4xSGSLzx/j7J+b1hYlwx8wZAGLU1
 zcbg==
X-Gm-Message-State: AC+VfDymkij3nlNVZnmxgNk9Fl8t81PeDerNC64D+Qgsv0lv6EsyJpS3
 bO2c6T0IdXrHghPhVGX5nE3qTIRDnO37qSUr6us=
X-Received: by 2002:a05:6a20:548a:b0:104:1428:8d36 with SMTP id
 i10-20020a056a20548a00b0010414288d36mr24371907pzk.35.1684244917573; 
 Tue, 16 May 2023 06:48:37 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:ec81:440e:33a4:40b9?
 ([2602:ae:1598:4c01:ec81:440e:33a4:40b9])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a17090a929100b0024df2b712a7sm1628733pjo.52.2023.05.16.06.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 06:48:37 -0700 (PDT)
Message-ID: <8f3fbd2a-b348-2b5d-78e3-43dbfdce2086@linaro.org>
Date: Tue, 16 May 2023 06:48:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 02/54] accel/tcg: Honor atomicity of loads
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-3-richard.henderson@linaro.org>
 <CAFEAcA8SxOVhPC+Y5saHKDWmBpOYZ2Ujcn3yHxoauw-jhhj3qg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8SxOVhPC+Y5saHKDWmBpOYZ2Ujcn3yHxoauw-jhhj3qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.666,
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
X-TUID: z5PmxDts9RTg

On 5/16/23 06:13, Peter Maydell wrote:
> On Mon, 15 May 2023 at 15:35, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Create ldst_atomicity.c.inc.
>>
>> Not required for user-only code loads, because we've ensured that
>> the page is read-only before beginning to translate code.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> v5: Dropped r-b because of MO_ATOM_* reorg
>> ---
> 
>> +/**
>> + * load_atomic16:
>> + * @pv: host address
>> + *
>> + * Atomically load 16 aligned bytes from @pv.
>> + */
>> +static inline Int128 load_atomic16(void *pv)
>> +{
>> +#ifdef CONFIG_ATOMIC128
>> +    __uint128_t *p = __builtin_assume_aligned(pv, 16);
>> +    Int128Alias r;
>> +
>> +    r.u = qatomic_read__nocheck(p);
>> +    return r.s;
>> +#else
>> +    qemu_build_not_reached();
>> +#endif
>> +}
> 
> Something that I remembered: Are we OK with this potentially barfing
> if you try it on read-only memory?

For system mode it is ok, but for user-only, no we are not ok with that.

I was not aware that clang was expanding this inline for aarch64 v8.0 -- I would have 
hoped it would be true only for LSE2.

Any thoughts for detecting this in configure/meson, or considering that I'm already doing 
some per-host ifdeffery simply rely on that entirely.  There are only 4 such hosts, after 
all, so it's not terribly difficult.


r~
