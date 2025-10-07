Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23FBCCA476
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 14:04:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v68If-00041K-5F; Tue, 07 Oct 2025 10:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v68Ic-00040i-TQ
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 10:04:19 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v68IO-0000ue-3L
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 10:04:17 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-793021f348fso524092b3a.1
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 07:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759845838; x=1760450638; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ApEdG0JWlXFe7JyIqDbGlSVzERcTf+zqVSSaff7l2OQ=;
 b=nAkhJnOqeRpQQT5Qx2muz+Wrkcn20eq+Ri4kyN6TnTc/RR6v5deifU4AiD0r2E5Mi4
 9i97JHUMaWDfB8CNdii5QCCpacUMFKSlNYWcUJ5ttLQLFdvio6WTZlwRK3E7fkyworE4
 Edd4QQM8Rl6+OJKrZaYm7XSprlkAYtxcrz+JbDqDOatfT5+X7Bv6ulSgQ/yy3ednw8In
 PyWq0hSuCuGPc/GgRTY0xIwYP9zTGU1SZyBoFzgEf3L/7OW/4V1a61l0yoi+nZDe4xT3
 o3LG2x6G1kKbA+1f5IDDnV40me87JYqaATSy23V13qtHcLb4NYX7nsiYU55skHMLlfcJ
 vpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759845838; x=1760450638;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ApEdG0JWlXFe7JyIqDbGlSVzERcTf+zqVSSaff7l2OQ=;
 b=tauzLpQdPET2HnAM4xWciCGiurPU4i0trOqr4EKjnce5DeJ+Ov8++sGDfYkX7Vo8pc
 /0+ArTOL9hgwatQWEkAjbJvdwwS8Dz3aU1H1lTbWj0fkU0/q5dj8P6nQtpdGs2fT6PUQ
 msBjqGAL07remhgpvudx+S7jCZxOUmztl+pRCup7MG/rGCOGFoov8WnuqPZrC6hibPjV
 QhZSBZYLGNgp4b0XXlglhBbut2uRGXFMlNzHoAX94Cp902Wzs/02jK5ZHyXXNPtiZg3F
 y1KuEVkRxI2An5SlRAyNEK8JWFYGRljGIJAom3Z6MOSGemaGd0LEe8LF7wYshasxXFz+
 NL2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTchmVefzrSQToaeV+STYLV+vFeOpC1/7f9ydbfKtR+n9D0AJQ9EK9xQog5AjFkMWvG+S40q9qUg==@nongnu.org
X-Gm-Message-State: AOJu0YzAdzPU2LdK/PhqbrWp9prMiloHZMr3yYbar6k/bCddpDi6uN59
 d1rG32SfCwbujjKslabIoNprm4nNSazy9YFkVfmYKzD69NCnxEq8iXtwM4J0PYAgCOc=
X-Gm-Gg: ASbGnct8l5gqbnJlNXfhBzcPiVsopnidR8+o70fKPcokZxzz9IVEGBxlBi2bAtfZVyf
 u9PxeJpIltB0ByQbW8XWPs8fMX+bUfTDEUeKnfLrMjXuxXtwbtY+2WYqRqJVyBF/cFf4dKE+37+
 Cj8qRb78SwtpSVZ8DsEI64C9iRhPUeUbL3pD9WsOxJyekW9AAd9umnQ93Y3wZaJSmyOPK7YFmGp
 Nltrtf5I7BCe6CiQLZfWlpcp7V6163jD7TduDA8+oU9aAxDYCp6WQH8TrNRTwww8eWmAFbeTjzR
 RaeoVP91o+fcE3uGoC/6E9A69v3yjPs+oDPi6rqSGdBeqbYk/GsvHmMCbs1XuxRslNN2fPh2g/C
 X2pq7oXnVE2kWfiDLwT+KL4hOBoQtYQaoXkZzu7fwDBd0tWLs5js0iOytn2Rhl2ko
X-Google-Smtp-Source: AGHT+IF6bPrWDGwzPybS9Cy2Nv75p9dqDiB17CKK1+rYlYyBGsMjp/fdCzrRH9ZZK/Viuzw8U3Tbuw==
X-Received: by 2002:a17:903:1b30:b0:267:ba92:4d19 with SMTP id
 d9443c01a7336-28e9a4465c0mr196422335ad.0.1759845837662; 
 Tue, 07 Oct 2025 07:03:57 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1b845bsm167014335ad.79.2025.10.07.07.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 07:03:57 -0700 (PDT)
Message-ID: <3040ccf2-8fdf-45e3-af07-440b80949ce3@linaro.org>
Date: Tue, 7 Oct 2025 07:03:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 48/73] target/arm: Implement GCSPUSHM
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20251003170800.997167-1-richard.henderson@linaro.org>
 <20251003170800.997167-49-richard.henderson@linaro.org>
 <CAFEAcA-WzWDem=u8w4sGB3aMHEBkUFo1PJztbwM+mqe+REzasA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-WzWDem=u8w4sGB3aMHEBkUFo1PJztbwM+mqe+REzasA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 10/7/25 03:17, Peter Maydell wrote:
> On Fri, 3 Oct 2025 at 18:16, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpregs.h            |  3 +++
>>   target/arm/cpregs-gcs.c        | 15 +++++++++++++++
>>   target/arm/tcg/translate-a64.c | 29 +++++++++++++++++++++++++++++
>>   3 files changed, 47 insertions(+)
> 
> 
>>   void define_gcs_cpregs(ARMCPU *cpu)
>> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
>> index 38a1f51ed5..4fb73f821b 100644
>> --- a/target/arm/tcg/translate-a64.c
>> +++ b/target/arm/tcg/translate-a64.c
>> @@ -26,6 +26,7 @@
>>   #include "cpregs.h"
>>
>>   static TCGv_i64 cpu_X[32];
>> +static TCGv_i64 cpu_gcspr[32];
> 
> 32 ?

Oops.

> We only initialize 4, so I assume that the array size
> should be 4 as well.

Yes indeed.

r~

> 
> Otherwise
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM


