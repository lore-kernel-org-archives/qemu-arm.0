Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp972009ejb;
        Tue, 13 Jun 2023 21:51:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4eNwPPy25rLwKMg20ui+inQ/+6SFFGcAx89TbgDKSSElPx7aFXyKw+SM7zW6TpT9bPtfvz
X-Received: by 2002:ac8:5a85:0:b0:3f6:9a18:e67c with SMTP id c5-20020ac85a85000000b003f69a18e67cmr786372qtc.66.1686718262312;
        Tue, 13 Jun 2023 21:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686718262; cv=none;
        d=google.com; s=arc-20160816;
        b=ST4u0lD6sbu/slbx1yW+Npq9o8UQi0qbYCcYVfewXh9fmpYBwLrdlXuf+BigBgpAgk
         j0Rh8T5xh0m+0HJQO+BGjO33UGc+lNZ52SsMnCX45tAGgnlXEqTwISHbLLVmQtpBdIZY
         CXwkIpznn+u6Bm875SDhdky3Q2RvKgdcxcF1e6NX34zWJqv/1iUvOzgFnpmQyiK+syyb
         bpiqR//kWsrlkCE9UTmOFUxsIe0ZKfBHwhYSJ0YSvxl1ftBHS/Wm4tiyUGzSy3paRFqO
         Zjf4jndF21NGyWPo4RX1pJVHIS7YaIneUJjM2lXGy+FMuB54FtEGDi/c4o6aZyfW2fww
         sOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8Um/xgeQuxuGNXtqB8e9y3KfPFMZe3y8+33yunBY00Q=;
        b=fs4/w5FYApDqacg8pC6kZbLjPZYw/Ul1RAIHWSVIWTUBFRrHrO6LcGsz7TZ8pT5NNT
         qHziB814L0FnVgOx+l/jPBAXqIVTZD3GmgiIvMFOy+SGudgry+cSkf5XrfHPi6FMjFxo
         0XZa1FTRkc80++nU6XD3DfaLon40s8JV1SlK3CoACncJLca50IACUqqVcGh1DO0lcyVs
         CCedhMKi1ziFI2SX4eFdkoSPRpnr3pOKq+ZCzuN+ZfI1L0RW6KHF3jAG+4r/nf9K1r1f
         UYEMgFmBB9dZC26g8By7Ftwcc13whVbaTFOOrRwDs7r6keRhOPsPXRlk+lqV+aIRUuGc
         QYaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v761mmNf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18-20020ac85c92000000b003f6b1b31fa4si8613553qta.43.2023.06.13.21.51.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 21:51:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v761mmNf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9ITD-0003d7-6m; Wed, 14 Jun 2023 00:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9ITC-0003cm-0u
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 00:50:58 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9ITA-0004b2-Dv
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 00:50:57 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-97467e06511so51586666b.2
 for <qemu-arm@nongnu.org>; Tue, 13 Jun 2023 21:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686718255; x=1689310255;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Um/xgeQuxuGNXtqB8e9y3KfPFMZe3y8+33yunBY00Q=;
 b=v761mmNflvbFnFSHBZlr1QSgoWs5Xg0ZQvnboJFlPKfG8z2vUw0lhB2weVPQwjvD6v
 0zCqQUqmsp2s2yIoBvT2Qr9UHn/EcIFT6qVLieDvIx8ULL7nQPQtOOMfzX9U1i3mdtw7
 qwE8HWq5nX2mLii8bgoGF39SYF7SBls1OEYv6oJwz6MoGB3KaKdpg2nQUSLD9RehzWwp
 olMom3AKVwTvJcfYeZIQbbjpNc8n5QAPTipB4APXwiY1nFXHKx2EQgCGTLM9++IWdYHv
 KaUX+H97Mj7jPYtbK1BA2i67zFT6tvpjFPIPc0Cvm8Dp0pfcNtqC3hlKYW0T2E3sYkXi
 E5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686718255; x=1689310255;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Um/xgeQuxuGNXtqB8e9y3KfPFMZe3y8+33yunBY00Q=;
 b=LDt18WI6Hhq6nw16Ne4v+bkw4bc8z/tzIaKvtUInUbKsSB0m6U1gFNUkZ8VCxa4p6U
 r9jV+0ANV0nJYGbcMlgKLaV6ArybvXZSaezRDs4SQ3JEsFDaBFLeQQ7CtsXMHROQCdM/
 I48ut6jDFr6qvDhlngXL7q8FgjXId+QKeSYXuxxSuy8e6E4zP/LbXlYfvOpEFOSYqUMt
 Om0NR+3EZdxqSkRVgZH4zNR155j+5Cdq2VH1/aZxzxsoGPZ24sFj69SVnrAn3B51nlHR
 P9/7vYcdtax/wpZF56HWwI55T7AiDEvmO1znnYNH6Fuw3d/CYgeUy7/JDuX9gd0Jas4I
 SfPw==
X-Gm-Message-State: AC+VfDy9b7fvhjJFcdx9ddAVj2RIUeJlXLPYu+qUMv+6PjEvqhC34PAA
 ufKNP4Ocj2ROffzo3QyLep5KSRo+s5wX4KPZJZ/aJ6Sd
X-Received: by 2002:a17:906:fd86:b0:977:ecff:3367 with SMTP id
 xa6-20020a170906fd8600b00977ecff3367mr14569634ejb.40.1686718254914; 
 Tue, 13 Jun 2023 21:50:54 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a5d620e000000b0030ae4350212sm17103849wru.66.2023.06.13.21.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 21:50:54 -0700 (PDT)
Message-ID: <4d9a7f20-cbf9-7e89-36f0-f2360eed4744@linaro.org>
Date: Wed, 14 Jun 2023 06:50:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 18/26] target/arm/tcg: Reduce 'helper-sme.h.inc'
 inclusion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230611085846.21415-1-philmd@linaro.org>
 <20230611085846.21415-19-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230611085846.21415-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: kY6rlUCjNMFA

On 6/11/23 10:58, Philippe Mathieu-Daudé wrote:
> Instead of including helper-sme.h.inc via helper.h which
> is included by all TCG files, restrict it to the few files
> that require it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.h            | 1 -
>   target/arm/tcg/sme_helper.c    | 5 ++++-
>   target/arm/tcg/translate-a64.c | 4 ++++
>   target/arm/tcg/translate-sme.c | 6 ++++++
>   4 files changed, 14 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
