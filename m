Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp188512ejt;
        Tue, 20 Jun 2023 03:44:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ64ooGyL2EEsSQDIAN+x37kXy2N37KZyPZm3ZJxjJimRNIUXoZuVuilxh11qVJ9rFC0ikrf
X-Received: by 2002:a05:6214:528d:b0:630:9db:4a9f with SMTP id kj13-20020a056214528d00b0063009db4a9fmr4120139qvb.8.1687257891368;
        Tue, 20 Jun 2023 03:44:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687257891; cv=none;
        d=google.com; s=arc-20160816;
        b=IqoA39pZ34FvLQPA2ziacUCpuPnRe10/jYERmF4eeZgCVYe6/zyC1576WF4HNlzWWM
         wU9xabNnSFUDisRJsThkCP9jSZWKh6rrAxcaajgQzKrzWhXfMle3m7YY2zmNEyQTQwuk
         GNCjnCQfS/9M8C7UlS4n/jbfxPPFElldJULCHcve5/QCrs7FZU4hHbHA5kYc+yJaqme/
         hh8JFA/rNxEUlRentUXnyOs9vB1zeT2oJ//jXzQkGHBMkLH/OAerxS8q4OyeA3snPX29
         Ex3CqQ3kKdaRIpVyUXkWrGttYZMBjz3Xfr5+JZRTMAadC4SRnqkxX37VSI1eFj0PwP40
         CWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ETPz/gmwp/TGJCNeRY+SwMDm7Do9a1+YIdTumCuBMTo=;
        b=fD42GP4CawxYkpsWVlqX0gaZZVYLBHgydvz7U27VKR9SF9jAAZOed1pOq1DKRVrQwC
         RFP4NBmaZHBIwqqW1ApeqKQX37OttBIXWWzAe3tr5noOvhWR27cd+y8WO93jCHjcYs1T
         pLQYYDOEsV9P2e1mjujI7S5GkT2AqYdmmXs2H/FRhoB9jaww86b+ktm5K9Tvt5Zgd9Ht
         dEhmk4NTaukVWRdDsdG25LbckRpFIylpgRk1wih4+CiMrmwCauYNqohzEz5L4Y/knQcT
         SHMvKZBLsPBw7vKGmBF03fXyhJueIUvBPI/ImGyE09RPi7Q04iKyIzQfTnAxjIlPzT/G
         ghHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YR+6IfWg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4-20020a056214076400b006300118fcf3si685651qvz.605.2023.06.20.03.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 03:44:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YR+6IfWg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBYqh-0003xO-UW; Tue, 20 Jun 2023 06:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYqg-0003wn-KS
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:44:34 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYqf-0005gQ-4g
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:44:34 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-988e6fc41ccso189521366b.3
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 03:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687257871; x=1689849871;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ETPz/gmwp/TGJCNeRY+SwMDm7Do9a1+YIdTumCuBMTo=;
 b=YR+6IfWgsgai1mkqRyoMZl2Zn9V0BoxUzaFViwkoHe4WviXkw7b/MhftVBeCrnqRzS
 VmERto0nO2lHPxU0DMK3Uo+oSuepthGPOP6djQl27JCCfIiERnGHcyCTS+q5WJDbfrkl
 P+HOjPjlts036fj86P9lBwJRrJ/6DB3RvwUbIyFoHr1bweKTUzO1jtibCuFeJlgCXZkV
 kVwiy2subOuh3U5XOhDB+0ARTIo8tQSoPJ/wDsJo9lTG7mCjn+AEFcBpyPDFMB5hFuug
 R3kCTlFL7bFAqsmOKYcVdVT5vLv82jP/xCeVblLkmNziswGL/gOqAJNCOl+WmL7Et1bj
 48XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687257871; x=1689849871;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ETPz/gmwp/TGJCNeRY+SwMDm7Do9a1+YIdTumCuBMTo=;
 b=UwAWB1FM2x3ix9StDGFaUpKmIaLNB/A0aPxndj39XXyCF6DRvwQDhY2h7qAWkkKgk3
 r3316k0tSF4uyU0FNyKklVkMbz2etjsAnTgEMv8com8M1S2kk8J5mTzyCAOphOn7LTLg
 Q+JB9+uamLRshBzmJkpa64nrw592NAaAkPrIUZTAgREZ8zU2AUWUdGaZMUtooPwjVAmh
 hxW1AvrblzW93+e3OPelyacV/IQUjX4zaIrjohepQTMnS8XFQGNccEX9XltOET2u0t9n
 kiUuUXiO2F6vDtQ8Mn+LfArQnYxtLlxiBkxRK8D8rZavgsyqGl7FIZhTKxHstk9YI17h
 SBEw==
X-Gm-Message-State: AC+VfDzUAZMaMRgcvcSbCkk2RsO+/UbY5pKwn5tels23z0K8E43TTp6G
 tSPwOzYce2ltgx/zIrmO30wsD6GD98TE2WKyal6mMYWy
X-Received: by 2002:a17:907:807:b0:970:71c:df58 with SMTP id
 wv7-20020a170907080700b00970071cdf58mr9203181ejb.42.1687257871395; 
 Tue, 20 Jun 2023 03:44:31 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 gs2-20020a170906f18200b00982943c7892sm1156744ejb.134.2023.06.20.03.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:44:30 -0700 (PDT)
Message-ID: <baae2a0a-d0cf-4606-82df-0ef1ba687994@linaro.org>
Date: Tue, 20 Jun 2023 12:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 33/34] target/arm/tcg: Rename 'helper.h' ->
 'tcg/helper.h.inc'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
 <20230619155510.80991-21-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230619155510.80991-21-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 8OEfF3ftzrQN

On 6/19/23 17:55, Philippe Mathieu-Daudé wrote:
> Since commit 139c1837db ("meson: rename included C source files
> to .c.inc"), QEMU standard procedure for included C files is to
> use *.c.inc.
> 
> Besides, since commit 6a0057aa22 ("docs/devel: make a statement
> about includes") this is documented as the Coding Style:
> 
>    If you do use template header files they should be named with
>    the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
>    being included for expansion.
> 
> Therefore rename 'helper.h' as 'helper.h.inc'. Since this file
> is TCG-specific, move it to the tcg/ directory.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/tcg/translate.h                | 2 +-
>   target/arm/{helper.h => tcg/helper.h.inc} | 0
>   target/arm/debug_helper.c                 | 2 +-
>   target/arm/helper.c                       | 2 +-
>   target/arm/tcg/helper-a64.c               | 2 +-
>   target/arm/tcg/hflags.c                   | 2 +-
>   target/arm/tcg/m_helper.c                 | 2 +-
>   target/arm/tcg/op_helper.c                | 2 +-
>   target/arm/tcg/psci.c                     | 2 +-
>   target/arm/tcg/tlb_helper.c               | 2 +-
>   target/arm/tcg/translate.c                | 2 +-
>   11 files changed, 10 insertions(+), 10 deletions(-)
>   rename target/arm/{helper.h => tcg/helper.h.inc} (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
