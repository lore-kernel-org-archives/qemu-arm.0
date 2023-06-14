Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp971694ejb;
        Tue, 13 Jun 2023 21:50:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7FRKS9QpDO7l3a6IgYyPNE5cumhMdBecHE60vvw3dfKmsHbB5cvmoqGODAMbvuqLEQwQas
X-Received: by 2002:ad4:5ccd:0:b0:62f:e59e:6345 with SMTP id iu13-20020ad45ccd000000b0062fe59e6345mr370622qvb.50.1686718200192;
        Tue, 13 Jun 2023 21:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686718200; cv=none;
        d=google.com; s=arc-20160816;
        b=txGJS9EOvk7nxJEiBHJz7fC42VsMHdXuwN45IQ3mG3YETrQA5JzXpE0Zb+f4P6hXLs
         PRgfc3uT1yrLjIHnL+aWDtCvVj2FlGaR4U78eyowsLpjbL1v7zqiRMAkMkWe/UvHkfXF
         778P+GTRW+zAaaN97laGsHeK9kc19jWArukqmXdiND6L+3vANfcDC68UolQ2uY7/snm6
         VFmnMYAcGCLpE5AAaeNbfaGbBrmsM7dp8HGezvP3J5Qx4H3wayD+J+tn7KtgY4bVN5C5
         +bf9QkkodfFmEkDGNh3Ypa/fKatSKTczvwZLhJmsPB4XXgHu1xgoxkJNt4/f17GG9aFX
         Kivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ClAnjXInF4nVP6exj95wvTED4u6Pdst/e5XqX3tvjNY=;
        b=K192B5ESsAax8U6J8ostv6WskWocJXGmyHlKTgZAeBkqPQS6VvgjsifdfaH1ku7neH
         Gnu3/iTKON0sxX5mx6d1jgIeX48EZKR+nHJ/mvW3vWk3zosXDAUxKp+asZ0ny99z0yYN
         qQ3SZsSbtCw5FFNZMiiGmJzO4v+M4U0h9X7TsbQcYD2ZLaZOeBUBCvfY05rN0cbs3Lan
         1jZRgQHo6Offm9B/IzcOPRmJeSXAc1XUcJJnUkUQGawZB752GCpY28dFXKEo4svgycRV
         hccQ6bo4RH9P4acFcRKcVA3T7SNqvEgw69wwya+e+6tFdJuJDpQksLD9OQB6PC80F1vA
         qHuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KBq9ZSu9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ou47-20020a05620a622f00b0075cf2b02883si8206649qkn.572.2023.06.13.21.50.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 21:50:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KBq9ZSu9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9ISC-0002GE-44; Wed, 14 Jun 2023 00:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9IS9-0002FQ-LU
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 00:49:53 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9IS8-0004B6-33
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 00:49:53 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f8d2bfed53so1417045e9.1
 for <qemu-arm@nongnu.org>; Tue, 13 Jun 2023 21:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686718190; x=1689310190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ClAnjXInF4nVP6exj95wvTED4u6Pdst/e5XqX3tvjNY=;
 b=KBq9ZSu9mJYOnHDjOkWVbSIyQdLnYJbK5M1Mo8EqT0fds/hnnd5ZMBcUyu0eCmxUJW
 HV9M4GKrgSGMJCtT7WiiawswbxKjTFfRjKKz4VLsgZ3FU7q8KfSINRFzdTQdST7LXjA0
 gBB+zKRtL0xjOMWEgsmra1wDQn8UQTIDhGqT8CmCCeM8DT0PK8x1kA8qWWsXOdI8ne0M
 eQy6Ao83rmz+fGQSiWDf69li0DZMJtS34xxIz/+8U+NBra8uJFNRAzATcBhxoG/9AmX8
 Er0JH4nC5MTgKPDDXhSQwQkNHY8vNyWocKKL6lcEmsZhtNXwckQC/hhUw/nbWuttAFPE
 pouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686718190; x=1689310190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ClAnjXInF4nVP6exj95wvTED4u6Pdst/e5XqX3tvjNY=;
 b=Uo4tLWpXd0lKGmDIEuaseokpalN1LW0cSvjvN3X2MKwSNS/Zk/011aUsLtKrZWuY8o
 Kk2NDdquEkAeRdA8DxvQLn3QO6PA7eM6A18m8UySI3JHksWg73wdNOwbjKJzxLQg2084
 GN8coz9xt72tAHxJuUPO3zaN/0yR1iZdRgaApnuK5V/sxlOZSbElYW/V7KMKxH1BgIgV
 HlmQY0Uy0hleUYtZud8ueZ05ZFQZYWI82OFvvKEFXRpqG/W8eMbNMUT1sSNhMi601YD3
 o17wQCIFBNOees7ekE6s1NdKG4weR0EGg42oojd77PJACCjxpiLHnVGplKSmokRY26Vj
 FQ0g==
X-Gm-Message-State: AC+VfDymYZthFbNrPYVogxItqs0u6CEIy/Y1wUnaCC2Kk6U98Cp3kgvo
 4qoli9g2OSJ3/RGQWTWsl5QU+g==
X-Received: by 2002:a1c:770a:0:b0:3f8:d030:862c with SMTP id
 t10-20020a1c770a000000b003f8d030862cmr319172wmi.20.1686718190337; 
 Tue, 13 Jun 2023 21:49:50 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a1c6a10000000b003f60fb2addbsm16211790wmc.44.2023.06.13.21.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 21:49:50 -0700 (PDT)
Message-ID: <6d133799-d111-3d2d-3f57-1c938e2a6ca0@linaro.org>
Date: Wed, 14 Jun 2023 06:49:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 16/26] target/arm/tcg: Reduce 'helper-sve.h.inc'
 inclusion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230611085846.21415-1-philmd@linaro.org>
 <20230611085846.21415-17-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230611085846.21415-17-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: IJwm1HPjZS6Q

On 6/11/23 10:58, Philippe Mathieu-Daudé wrote:
> Instead of including helper-sve.h.inc via helper.h which
> is included by all TCG files, restrict it to the few files
> that require it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.h            | 1 -
>   target/arm/tcg/sve_helper.c    | 4 ++++
>   target/arm/tcg/translate-sme.c | 4 ++++
>   target/arm/tcg/translate-sve.c | 5 +++++
>   target/arm/tcg/vec_helper.c    | 4 ++++
>   5 files changed, 17 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
