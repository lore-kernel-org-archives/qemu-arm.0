Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp427241ejq;
        Tue, 16 May 2023 06:51:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ40feTcozRkqRRVCanAbDB73WqXry2G7ZUBKFuLfvyj8h7j+kPq1FHFWm1h+NHCjhwA75Cp
X-Received: by 2002:a05:622a:164a:b0:3f5:16fd:c5b2 with SMTP id y10-20020a05622a164a00b003f516fdc5b2mr17284622qtj.10.1684245089943;
        Tue, 16 May 2023 06:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684245089; cv=none;
        d=google.com; s=arc-20160816;
        b=gMn89Aqgj7ZPx9PuiGAJRWDmF7S6cE1l/7QalnZV/UQHhiZfz7EN3fhvFV5E/OywSX
         H4pLfkfosBIAxJpDBoxHoZyD3SxTAY7m5CRKFcrDuPGGGK1fMQTMvrH8479tIkmnkcoU
         Egr/l6HPPxIFIUbeLZpvRmzmvjcTURWa/f0F0mwGAHexG1RASZzp9trKFpp8dgi2BF9r
         kacW6lh6FHHLltC2YbULg1m/NBXnqEpcixvVqH0TBktRUjPfsLpkaVBZRtabGa3iU6js
         CL8DpnZ9W6IZfSm393TG0ksxm8mXQKpsMlXhLV1geaMgar8wPzGvceLClycxXWp7j5Tv
         JXTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=57MW2AM6RKbe/llk9WLHCI3L0KZQQn8HdJTDWDQuFfw=;
        b=tYh2UiH5s649slOXdXr+zOx9fjmxdNNgXGIPkj1Fw6F0g5G23nBqO1CaFQknd1vR6K
         9XgQZWhbt4TPrYwjQ264BgABNd3wF/zDU2j6v1BpX66iH6xsM2eFFPJLGD6yqnS6job9
         2Qj4J6LsgqrXGXuNB/aB3TIyD48sC6uUd7Qoni6WFLWEy6B7hzGilAJ69SEmhzAdh6nO
         WReFAZt0Vc5Uk6Jg9qoI4+tp/C16zagk66h/wIJSO0DanxCC3HYJuNujrJhUwjOXUOle
         yPiZTzPNEtVxG1GTLHMSa7gg+K9EVvX8yW3/3Wxo5q156IFcNcIXuYcnSf1cgTn09RNi
         khNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wIU15ey4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10-20020a05622a064a00b003ef3c2fd077si11400505qtb.740.2023.05.16.06.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 06:51:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wIU15ey4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyv4r-0005zT-KU; Tue, 16 May 2023 09:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyv4p-0005z0-FY
 for qemu-arm@nongnu.org; Tue, 16 May 2023 09:50:55 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyv4j-0004oK-Fd
 for qemu-arm@nongnu.org; Tue, 16 May 2023 09:50:55 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ae408f4d1aso3591825ad.0
 for <qemu-arm@nongnu.org>; Tue, 16 May 2023 06:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684245048; x=1686837048;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=57MW2AM6RKbe/llk9WLHCI3L0KZQQn8HdJTDWDQuFfw=;
 b=wIU15ey424czJsEqP6MrCPaXlMmW0hg+tjMKmMUympSQmHcLQOvbFpyFY6LiLzkWT9
 Q/UUQU6Ankr58COZHndUW0+7OJ1gCTDOYp81GiAcDtZZiS9RieGQkGM31YmDUfxPQajL
 oJEubLSzpVL+qpxEPsPNO1qXP6rLfCA1yHHIXGlq7gAgtd+05Z6NqoAqKCtD2EuW5v4H
 7S/U2LFMMWK1pvrwv8ZAm+XiW2x8XoJ+0/CdF0ZJMi6BmssPiH8thR+rD/Ldlw7zafyY
 H/GIx/LVhLNWWvfj3++mYxYs1xEsqNo1S2IRBMR2XGyvYXhvU7TtICD0bcVwI+UCVKiZ
 vcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684245048; x=1686837048;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=57MW2AM6RKbe/llk9WLHCI3L0KZQQn8HdJTDWDQuFfw=;
 b=W44uqRR0b65IoG17IKFBGrISxCTzfG7w0m0UuAEVI8YrWoydWF7+7zzJtlD6x+Bu26
 l8Epsx+R2ieB3GwjeV6igemhq1/EElV7KqOJh+RxN9Pvp8sliRs9TxLHnO40qWm1M88/
 gh9jxUQ36Nk7JPTZyw2M8OPrGt65p3AsW2Npw/XCaqsoPCD8Qadp7uK8rhWZlLPYrZ6j
 Cuu7/R83ltbgExUU9xVSlXpiIS9sPvn5aycpFtJa2gvt0ePiUSHs2ryb4A/KM557VGoM
 HvOY5X+NrDeP+NofeIEuSuUZV83NNpR211WdmH7H8UD7TPoZ9WDQI/FR6VnCXRX9nPo1
 qa4g==
X-Gm-Message-State: AC+VfDyhyhSN0d0Suqdkbt8pn9iubdKt4IFSuQie36Sdp/iHZ3ml/mqZ
 3Kb69mUZaS8CskQvO9b7SaHn2saNDhKpCM9xy+k=
X-Received: by 2002:a17:902:bd06:b0:1ad:fc06:d7c0 with SMTP id
 p6-20020a170902bd0600b001adfc06d7c0mr12218404pls.1.1684245047806; 
 Tue, 16 May 2023 06:50:47 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:ec81:440e:33a4:40b9?
 ([2602:ae:1598:4c01:ec81:440e:33a4:40b9])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a170902b10600b001ab06958770sm15578622plr.161.2023.05.16.06.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 06:50:47 -0700 (PDT)
Message-ID: <5d582ed2-c0df-9456-2089-45d053b81efd@linaro.org>
Date: Tue, 16 May 2023 06:50:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 10/54] accel/tcg: Use have_atomic16 in
 ldst_atomicity.c.inc
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-11-richard.henderson@linaro.org>
 <CAFEAcA_6jHw5kvqZNNR+2c_ihdPgD9d1ByBH0fNvDr6tX88jyA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_6jHw5kvqZNNR+2c_ihdPgD9d1ByBH0fNvDr6tX88jyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.666,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: zUO198Z+c5+F

On 5/16/23 03:38, Peter Maydell wrote:
> On Mon, 15 May 2023 at 15:37, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Hosts using Intel and AMD AVX cpus are quite common.
>> Add fast paths through ldst_atomicity using this.
>>
>> Only enable with CONFIG_INT128; some older clang versions do not
>> support __int128_t, and the inline assembly won't work on structures.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/ldst_atomicity.c.inc | 76 +++++++++++++++++++++++++++-------
>>   1 file changed, 60 insertions(+), 16 deletions(-)
>>
>> diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
>> index dd387c9bdd..69c1c61997 100644
>> --- a/accel/tcg/ldst_atomicity.c.inc
>> +++ b/accel/tcg/ldst_atomicity.c.inc
>> @@ -35,6 +35,14 @@
>>
>>   #if defined(CONFIG_ATOMIC128)
>>   # define HAVE_al16_fast    true
>> +#elif defined(CONFIG_TCG_INTERPRETER)
>> +/*
>> + * FIXME: host specific detection for this is in tcg/$host/,
>> + * but we're using tcg/tci/ instead.
>> + */
>> +# define HAVE_al16_fast    false
>> +#elif defined(__x86_64__) && defined(CONFIG_INT128)
>> +# define HAVE_al16_fast    likely(have_atomic16)
>>   #else
>>   # define HAVE_al16_fast    false
>>   #endif
>> @@ -178,6 +186,12 @@ load_atomic16(void *pv)
>>
>>       r.u = qatomic_read__nocheck(p);
>>       return r.s;
>> +#elif defined(__x86_64__) && defined(CONFIG_INT128)
>> +    Int128Alias r;
>> +
>> +    /* Via HAVE_al16_fast, have_atomic16 is true. */
>> +    asm("vmovdqa %1, %0" : "=x" (r.u) : "m" (*(Int128 *)pv));
>> +    return r.s;
> 
> This is a compile-time check, so why if we can do
> 16-byte atomic loads would CONFIG_ATOMIC128 not be set?

This is *not* a compile-time check: have_atomic16 is initialized in 
tcg/i386/tcg-target.c.inc in patch 9.


r~
