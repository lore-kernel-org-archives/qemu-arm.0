Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp733820ejx;
        Tue, 22 Aug 2023 06:49:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdWmlw8QzXBrVr7ZJuUJv1wsugWSPxkT0K2UwzIwxwRqZNSRbsKnITMfSE0tavKaDfPW3Y
X-Received: by 2002:a05:622a:134f:b0:403:996c:9fa7 with SMTP id w15-20020a05622a134f00b00403996c9fa7mr14520549qtk.60.1692712171312;
        Tue, 22 Aug 2023 06:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692712171; cv=none;
        d=google.com; s=arc-20160816;
        b=UxC8zAU0lPD0IBD/ilVF+/+65/pxO24mT1qQ9G2+22BI22OQhoBNX0qlR6RZT6/3cC
         Vu2I2eN/MzC2SwaRa4zsJfetaZ6xY9AQWmVowLHbzRIRKfh/ODFRO2NY78FrciejxkEm
         zajyyQ03qbjjg758yWy9rznMFFH4P+lyBDF1oTH9/KmHlV+Fx+bxL4AlhsScvOzJygA1
         NGZcwBa+PHCeDP3DccUXs/I247vJ6cWzFiMXvgIQfaXj3qRH5oGmzwgmM41CPH6KpNl6
         ymq62VML4kDdoHl44Oyn9+MQrVQXp7GsqL32U0mWQTHrE12nL/LCfGZOESQoP5q308yd
         LyAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2zx7mmYxs/GKR2bE2kJH4FYODToxIqrK/bwseHFpLPQ=;
        fh=KMXQYZNk4TawESTfrTwT0vC1HaxhlAYZboG8cHV9LmY=;
        b=vr88zTwz5TQRS2kX873xPjPhuUEMB1Wq3Mzt+2eSRzYKFgE2VRxQ/wZ6y+6I+D/e2T
         68sZb5gHxaL8ulhNz4lEWRD5DZD1lrK3PT/lzDMFaIpF9Oj/br2U6PVzPPP8QwlqzVFs
         k7j8M8fbq3pljZ37ZPgMs01OKW1Lw45+oqDaZmRiqIY1jQhhg3HC1E3eRmjtQf0nEj5n
         Qi8sO6Q2iI3yY+dafE7qwJwyrNbG17H8R42LVvK5yCLiLJrzHGxP88z57M+icYmXgZ/h
         w1hF3n+/kSuLSGw9vid6DYkqt/Sy34d+gjqj43dZHy2Nd9lms+lgLh9x+RpCPXQKM2bn
         eHQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NHow5o8R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22-20020ac84e96000000b004068901682esi6226007qtp.392.2023.08.22.06.49.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 06:49:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NHow5o8R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYRl2-0000kr-RD; Tue, 22 Aug 2023 09:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYRl1-0000kf-Kv
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 09:49:19 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYRkx-00089J-U8
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 09:49:19 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-52a0856b4fdso2895762a12.1
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 06:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692712154; x=1693316954;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2zx7mmYxs/GKR2bE2kJH4FYODToxIqrK/bwseHFpLPQ=;
 b=NHow5o8RwCKwF/SoHR6VkrjUPCLT/jvi3ZF+TSXdwxEZIyWu21krKlV9DunjkMvgLf
 CotQXsCCL51Zsk1wU/VhfAYv5Uzpx9qSfY1H+kWbt7yNs9psRe8QMelzsm1ZP8CauoeU
 uw6sM6BwIYhfRE2oCl5yHghZjuCN+qdseSb6CS1Q47Ib6LPf1TPbnZZ+VHwgwDuX0H8q
 odpjrvg1dMp3IZe7oHck+TpTk2LoJn8GwxD2jslYnBJHmwXJvGDJDBJUUAHqDNuUOgCs
 OV2WBdFJk/Q0ag0aP4cRfz6y7L/uw8geBccZnK209RAgLdqzFn41QzukRC6Gf0LSXxNh
 XcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692712154; x=1693316954;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2zx7mmYxs/GKR2bE2kJH4FYODToxIqrK/bwseHFpLPQ=;
 b=PjCmpG3lA0Bulzml0e9v42T4t8B47XflJnIJJ91NhaHcF6tNF3f+X3fRQBpNVf22pv
 7CO3hDGV7z5q84oMKgXK55eHRsfUWyurJzORX0PkVRg2UaX2RXfKRFA6+NeF9kRRFIZd
 iXM+/4KcdOn3tq34Iuaf0SSb8oQ3GKB20Zz3tOLMjDaYLZqCeYPZXtJXxM5eGDMISktr
 iLnFbcP7QlnaNY6PP+x5YyM5+/Pln5nMW4Mpa85/tAriZhmsd7L9YC+omg+m6HPrYAp6
 wQwYM3JGrOeAL6EilH5Gt4mQuPVP/MiPn1KmzWocOT3nOQs7BdG3LdykdnoZbzRKiA6w
 SyHg==
X-Gm-Message-State: AOJu0YyYi4Cs9BOG6nRJ4Kd/0KBnCiwRGq8mrh2jARo9tIePTO/9NSiE
 x+bTgRGm6JV6yVv+bN2qOrgIO0CKfPEuP5Cc6P9Jjw==
X-Received: by 2002:adf:f892:0:b0:314:1560:cc68 with SMTP id
 u18-20020adff892000000b003141560cc68mr7090152wrp.56.1692712133768; 
 Tue, 22 Aug 2023 06:48:53 -0700 (PDT)
Received: from [10.2.0.2] ([37.19.214.4]) by smtp.gmail.com with ESMTPSA id
 f13-20020adff44d000000b003197efd1e7bsm15826494wrp.114.2023.08.22.06.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 06:48:53 -0700 (PDT)
Message-ID: <255f4589-7b8a-e323-7f66-ab3abecb7c2b@linaro.org>
Date: Tue, 22 Aug 2023 15:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 2/6] target/cris: Use hswap_i32() in SWAPW opcode
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>
References: <20230822110129.41022-1-philmd@linaro.org>
 <20230822110129.41022-3-philmd@linaro.org>
 <CAFEAcA-36XE-9ikSp0F4EMUKysz=ms2JyLCc8GOWcgJq3sb=hw@mail.gmail.com>
 <09dd2dc9-edc2-a9d2-e91a-a5eb07f96ca0@linaro.org>
 <CAFEAcA_k27aUdMZaONwVx-R4KvmPA_naUjF8DwuXMvVH2vfjYw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_k27aUdMZaONwVx-R4KvmPA_naUjF8DwuXMvVH2vfjYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.767,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: n8r839ujwC6b

On 22/8/23 15:27, Peter Maydell wrote:
> On Tue, 22 Aug 2023 at 14:06, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 22/8/23 13:44, Peter Maydell wrote:
>>> On Tue, 22 Aug 2023 at 12:01, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>
>>>> Commit 46be8425ff ("tcg: Implement tcg_gen_{h,w}swap_{i32,i64}")
>>>> introduced the generic hswap_i32(). Use it instead of open-coding
>>>> it as t_gen_swapw().
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>    target/cris/translate.c         | 14 +-------------
>>>>    target/cris/translate_v10.c.inc |  2 +-
>>>>    2 files changed, 2 insertions(+), 14 deletions(-)
>>
>>
>>>> diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
>>>> index b7b0517982..0ff15769ec 100644
>>>> --- a/target/cris/translate_v10.c.inc
>>>> +++ b/target/cris/translate_v10.c.inc
>>>> @@ -506,7 +506,7 @@ static void dec10_reg_swap(DisasContext *dc)
>>>>        if (dc->dst & 8)
>>>>            tcg_gen_not_tl(t0, t0);
>>>>        if (dc->dst & 4)
>>>> -        t_gen_swapw(t0, t0);
>>>> +        tcg_gen_hswap_i32(t0, t0);
>>>
>>> Both these are operating on TCGv, not TCGv_i32, so I think this
>>> should be tcg_gen_hswap_tl(). (Compare the tcg_gen_not_tl()
>>> calls.)
>>
>> You are correct, if someone copies part of this code to a new
>> function compiled for a 64-bit target, this won't build.
>>
>> We know cris is a 32-bit only target.
>>
>> When implementing tcg_gen_foo_tl(), should we implement both
>> corresponding tcg_gen_foo_i32/i64() even if one is never used
>> (thus not tested)?
>>
>> I like completeness, but I'm a bit reluctant to commit unused
>> code (mostly for maintenance burden).
>>
>> Maybe I can go mid-way and only add tcg_gen_hswap_tl() ->
>> tcg_gen_hswap_i32() here. If tcg_gen_hswap_tl() were used on
>> a 64-bit target then we'd get a build failure. Does that
>> sound reasonable?
> 
> We already have tcg_gen_hswap_tl (it's a #define like all the
> _tl symbols), so I'm just asking that you use it rather than
> the _i32 version. If we were writing the cris target code
> from scratch these days we'd probably write it to use _i32
> throughout, but since it's not written that way I think
> it's better to continue the pattern rather than deviate
> from it.

Doh I missed commit 46be8425ff also added tcg_gen_hswap_tl()...

Thanks!

Phil.

