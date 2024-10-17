Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp350603njb;
        Thu, 17 Oct 2024 10:46:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHme/VSYv3qp8Y83rjI2f/NiM9CpVcX4kLj0RQloOkcrVqapjdSXObiANeYYksf8xOl6rsyuhFOA2DuA==@linaro.org
X-Google-Smtp-Source: AGHT+IFFv4TbjzZ4ZnLWx6IyeUHMXxhfqRRsXQjeMju4hkH4ehnbq1gdsvL0Xnzt2siEZGw3m423
X-Received: by 2002:a05:620a:17a9:b0:7b1:11ea:1f62 with SMTP id af79cd13be357-7b1417b3244mr1050023985a.8.1729187184243;
        Thu, 17 Oct 2024 10:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729187184; cv=none;
        d=google.com; s=arc-20240605;
        b=gZIZhCLg0UaCX3JpSUD5lNcHsWwEClQziDdF4pYDNBmMwwOB/XPpClgK8IFNvNepk5
         04aaUneTE7vLeGDuByOjLrKgat5yEF2ksNjNj2t+BgjF7YbpWUybeox25NpT4/Z+naBV
         R4qM9zY1H8flnJnyvT/MPGt316YKgDwGyX8BMGcjw+0nN057ZRrouKPDgzGOdOCJlN6w
         c2fBWSNXaEZ6RvdEQQHSlHwSbHQnpvlAaLmduH5u7Ld9A0wecOooMqe6wve+5ZV6uEBd
         suZggtXN+7Ap3moTm3hamtQpXlx1ZGu8hE4yV4dAD/yPn80G0B35nDOuGxHeoP+MbhRW
         XZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qFywNcmcgJ43zcWJxMMnwWB3PbNft5Hk5Q8Z5UGMiTY=;
        fh=XbckyR4Z8MxwN2zvSklnNiHgCi3gRd4CX9BN/ssEr6w=;
        b=MXZoPCQ6AVQiyCv8mJpAS+vyT8PKSkA+YU4HRu6aepdIM9YyrjReE9gMbwSWPJa5EG
         YvPKvtu8Jr3qTiGsCG42g7Dx5syi1QbkSJr3vwYLM1w0Y3J5ZvyJb7TzIM9D70bPriRe
         wDi0dbcnuO4XwpCdPCmgoEKkteT+azhZYEovjHCMOj4bGhWhrwf+ALABKzqwSLpF5+ZT
         p+ivfTgVgkH+JLuJgUQhvF6VnSxItSX279ayjlokf2ZRZJ06ruvKdwRYVG3O2ZNqo/WS
         gLcIhtrx8MjwrxyZab30PZa+5Ys4lG4ML3YQ7BNDsFHmLcTjLqnpOSNlT77CyIqKzBn0
         aHcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xF0Y7K0W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b1363d76f4si669819685a.289.2024.10.17.10.46.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 10:46:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xF0Y7K0W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1UZ8-0004A4-TE; Thu, 17 Oct 2024 13:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t1UZ2-0003zX-BK
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 13:45:35 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t1UYz-0002gH-5b
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 13:45:32 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-20cbb1cf324so10321785ad.0
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2024 10:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729187126; x=1729791926; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qFywNcmcgJ43zcWJxMMnwWB3PbNft5Hk5Q8Z5UGMiTY=;
 b=xF0Y7K0W2iZ978UH3LkKGd96fMpKtGsE4Ds/3NN524sBnUoUPAmod5kgI6xXKHEFaJ
 1j/hGCVQaH9sBsqoB8WKjqIxAiBlzvQaPCRAF2UtZggRXDNSkZU8k/BJ8SknJCuXxFvD
 o/ANQ5B6W3IXBz6Iejizf3vGEUaV072asbjJ6ccVZmka/oM5c/xOQbA9l6UoxwiH72/J
 54inqhGGdj879gQuXSomUIT93FiCS8eOZ3yTeDBw5j+ekRkWoSfugHPbCenW41nyENzK
 1GMbSxXTFcyA6VZ0Iyt3OK6z0W8ApPY5AXSf50EiBvmmRoTHJVqiVZ5zcYRnUDc39q9w
 eVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729187126; x=1729791926;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qFywNcmcgJ43zcWJxMMnwWB3PbNft5Hk5Q8Z5UGMiTY=;
 b=ix7s2Jyzv/udq1t4iUNLq2oX1pWPin/jCikUiWugVBYOVuNivdUiKRm8OOkE+5jvDp
 t2RO8weQyiPUC0oJ8TVUqM8QD1dCN7sxrzc4dKaN0NM9B41kUl/Z25I0dk78Vcl3Fduq
 8l3KfbKClPyDfxE2GvR77tUOdfmmSE7/xpbHUA70VHNj55QD86yoUfIoQ4gN6J169VW3
 n8JPoX5dqNrQJgRmO2Os3tioJonAd+PI65000CeNNpUpt0Rlwb3VEQOr7Q1DIWubER8d
 Za4pphGiELbPoNXC62csdiK1eww0jo1oB3xyEBEnlplslPiIzVSCH9pptGajhAbqvwG1
 oUaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgCAHxmymCGSS/e7+yu8NJo/VyaVFs9pmyovIKldNL/CY8CEDDvmoHjjipvIad5jdAEihHoaWaIA==@nongnu.org
X-Gm-Message-State: AOJu0Yyza+uDcbC7OpJpVeQ5WmZG9DhQnZB4kFWFZ0DnY9pmjvdNBBlb
 zmuYxowRjXOIAXv3OWulGCuDOPrdwj3KnEpBmvztRH0VKxRFmLR9N6x6NzI8LWs=
X-Received: by 2002:a17:902:d4c2:b0:20c:5a64:9bc6 with SMTP id
 d9443c01a7336-20d27f3fd11mr142530235ad.50.1729187126570; 
 Thu, 17 Oct 2024 10:45:26 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20d17f9d436sm47180995ad.84.2024.10.17.10.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 10:45:26 -0700 (PDT)
Message-ID: <42ccaafa-888c-45c2-9d60-d2aa66f4c833@linaro.org>
Date: Thu, 17 Oct 2024 10:45:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Don't assert in regime_is_user() for E10
 mmuidx values
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20241017172331.822587-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241017172331.822587-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dSSZBm8iod09

On 10/17/24 10:23, Peter Maydell wrote:
> In regime_is_user() we assert if we're passed an ARMMMUIdx_E10_*
> mmuidx value. This used to make sense because we only used this
> function in ptw.c and would never use it on this kind of stage 1+2
> mmuidx, only for an individual stage 1 or stage 2 mmuidx.
> 
> However, when we implemented FEAT_E0PD we added a callsite in
> aa64_va_parameters(), which means this can now be called for
> stage 1+2 mmuidx values if the guest sets the TCG_ELX.{E0PD0,E0PD1}
> bits to enable use of the feature. This will then result in
> an assertion failure later, for instance on a TLBI operation:
> 
> #6  0x00007ffff6d0e70f in g_assertion_message_expr
>      (domain=0x0, file=0x55555676eeba "../../target/arm/internals.h", line=978, func=0x555556771d48 <__func__.5> "regime_is_user", expr=<optimised out>)
>      at ../../../glib/gtestutils.c:3279
> #7  0x0000555555f286d2 in regime_is_user (env=0x555557f2fe00, mmu_idx=ARMMMUIdx_E10_0) at ../../target/arm/internals.h:978
> #8  0x0000555555f3e31c in aa64_va_parameters (env=0x555557f2fe00, va=18446744073709551615, mmu_idx=ARMMMUIdx_E10_0, data=true, el1_is_aa32=false)
>      at ../../target/arm/helper.c:12048
> #9  0x0000555555f3163b in tlbi_aa64_get_range (env=0x555557f2fe00, mmuidx=ARMMMUIdx_E10_0, value=106721347371041) at ../../target/arm/helper.c:5214
> #10 0x0000555555f317e8 in do_rvae_write (env=0x555557f2fe00, value=106721347371041, idxmap=21, synced=true) at ../../target/arm/helper.c:5260
> #11 0x0000555555f31925 in tlbi_aa64_rvae1is_write (env=0x555557f2fe00, ri=0x555557fbeae0, value=106721347371041) at ../../target/arm/helper.c:5302
> #12 0x0000555556036f8f in helper_set_cp_reg64 (env=0x555557f2fe00, rip=0x555557fbeae0, value=106721347371041) at ../../target/arm/tcg/op_helper.c:965
> 
> Since we do know whether these mmuidx values are for usermode
> or not, we can easily make regime_is_user() handle them:
> ARMMMUIdx_E10_0 is user, and the other two are not.
> 
> Cc:qemu-stable@nongnu.org
> Fixes: e4c93e44ab103f ("target/arm: Implement FEAT_E0PD")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
