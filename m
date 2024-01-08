Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2260516ejo;
        Mon, 8 Jan 2024 04:57:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxvczgcJOab1szB7OWWnkNeKSKs4gyljx4zCSjHb5sbTq5/FbE6p882PXSEaHjCBQTBJ8s
X-Received: by 2002:a05:620a:2985:b0:783:20a4:6404 with SMTP id r5-20020a05620a298500b0078320a46404mr1469358qkp.124.1704718629268;
        Mon, 08 Jan 2024 04:57:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704718629; cv=none;
        d=google.com; s=arc-20160816;
        b=QNRwER9RaUH/2Q59iW7ocKAy0IgohAvaLK3L72N10J0DFxqLmlj9nv5APbAe3sWZ0D
         MO9vbp2L7umbzwl4NBBeVWTVEcLgVfOaJQ2VfQ8/dohyoLave+kAV5gXfwX7hkyHMj1P
         Iwpaqn3RMdTKsur41ZXAZIXnh2mcDDG1iW6OtaJX1TMCQE555n836EjeX5veCP8ssQma
         s9tpeprpHMJng8vdQzgeOAs7UZqzYa2x0qXEO3Pm+GFePhuFMXeassYK7fdoa/TCQHW0
         rQpKtE/1QzJAadNSgUELYTjSfghnqke+OQ/OAOg24dFeLH9mnOK8cF0cLxkEE3IEUGFy
         bRlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=F1Szk0h7YIyOnUKRSCOKIVxPUcBtgdQl+uheqjerzns=;
        fh=eAXPffmw/KQFNgRcpG6vPHezohc+Ws2xkWgZac0nVsk=;
        b=U3ZDq5Oc10qU6Cop2vc97gyxb1IwhFIQm/pK5YfvRtlWCsNYEmOm6LecqKWb+hSt9Q
         TaVrNT698Hfcnn8Jx5XGL7fU7RT7riFxvT/xoCHFi2YxsgWkWGEwXP8gcMjXlcErCnMi
         AhRl1vvk0bWqJk4MCCU8dW+RvWf8LlWR+5X3ye7zuampQT9gcTFVVxJkEoPNj/ucchab
         ZENoJ5LV53yYZCbpgYepuQ/tkn1XhvKvvOhMrKBy5jS7z4TYEfXMC7xO8sz3cuPXfH8p
         Ta+dWTyjuYWnWcCuyLqyAcD9798eUgxFMUmlHhsJOJ5CkROnAp8lN0rAirq+ngFCOk8o
         YdVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nDvzY3yc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oq1-20020a05620a610100b00781ebb79d07si7397268qkn.171.2024.01.08.04.57.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 04:57:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nDvzY3yc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMpBc-00052c-P8; Mon, 08 Jan 2024 07:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rMpBW-00051l-OJ
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 07:56:56 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rMpBT-0007Es-3L
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 07:56:53 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-336c8ab0b20so1830980f8f.1
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 04:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704718609; x=1705323409; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F1Szk0h7YIyOnUKRSCOKIVxPUcBtgdQl+uheqjerzns=;
 b=nDvzY3yccy92qtXe3HbK5buf5UDIpPJcCn5aPfGZHX108i8ZsaWjBQS5ScrxG5/kOX
 CpzCnou0+cDx7LIIMhAxbJyMV0FDhO1AjqJvHmPYaUgcsLQ3grpaqM6GUz7IcWkvqkWc
 CKpxBdB3eeQ3z2HXPhEM8X7ABomqIPTtJCAX4goA6HKDIW0k82reTcZfMDAvvx+/Uiiq
 BMn84fDziIEUiUO0RB08fXEIfoOX2O/wF2qYl1zO31zmedhUfSIodFApPT558LZR3Bc/
 5zfvEzMq0unCehGziUDdld5YvR0zvJBC0xR+20iCXLJN1fy3BTCLl8TQPZhWEy+cKD//
 pMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704718609; x=1705323409;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F1Szk0h7YIyOnUKRSCOKIVxPUcBtgdQl+uheqjerzns=;
 b=dYlwMMxKrniKrKorMJ2kukrP6GtniVuUm8okoEho3GEw3PsLmgvL953cJ615CZhUMa
 39Gv6kN9xA8MD0oh9PqLcGFGWI2eOxg2EmmApc5ZYmk2mr9sWoCEE/2lk2hSd8KX20rK
 OV3qhSN/ITBlO5MgJclBHm8Cuw7QVZFp7CKvreSKhW4ZL2jB/KXp+bORJindgKg7nggI
 okekU42zgk8kb/lTxmTxFkdi/+NKymcEAX5PlQdBDnZy99zPj7moe2Qa+IO7ftQE9FLK
 JCvfFAGnnTDYmRdb+f+HSHVjAQFtESgdNSLcwsmhxuOIjqEhbSrkCHuIvzWAWU3NErHX
 ydbw==
X-Gm-Message-State: AOJu0Yyi5o+d3cV0LhKQtVE1wrSgOb7Q30qEADJz4N/r/Ah+rR/Okiw6
 tnoa7AQIWzbs+6+g+XlB8X0kwDpxqeXAKw==
X-Received: by 2002:a5d:4b91:0:b0:337:2c08:ae9c with SMTP id
 b17-20020a5d4b91000000b003372c08ae9cmr1642991wrt.141.1704718608864; 
 Mon, 08 Jan 2024 04:56:48 -0800 (PST)
Received: from [192.168.1.102] ([176.176.175.62])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a5d5145000000b00336cbbf2e0fsm7749588wrt.27.2024.01.08.04.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 04:56:48 -0800 (PST)
Message-ID: <1c18863a-ecf9-4522-af75-793cd358c745@linaro.org>
Date: Mon, 8 Jan 2024 13:56:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/tcg: Don't #include <inttypes.h> in
 aarch64/system/vtimer.c
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240108125030.58569-1-iii@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240108125030.58569-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: FuPpN20hW4uJ

Hi Ilya,

On 8/1/24 13:50, Ilya Leoshkevich wrote:
> make check-tcg fails on Fedora with:
> 
>      vtimer.c:9:10: fatal error: inttypes.h: No such file or directory
> 
> Fedora has a minimal aarch64 cross-compiler, which satisfies the
> configure checks, so it's chosen instead of the dockerized one.
> There is no cross-version of inttypes.h, however.

Presumably this isn't specific to aarch64 target, so what about
the other uses, shouldn't we clean all similar uses at once?

$ git grep inttypes.h tests/tcg | wc -l
       26

> Fix by using stdint.h instead. The test does not require anything
> from inttypes.h anyway.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   tests/tcg/aarch64/system/vtimer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/tcg/aarch64/system/vtimer.c b/tests/tcg/aarch64/system/vtimer.c
> index 42f2f7796c7..7d725eced34 100644
> --- a/tests/tcg/aarch64/system/vtimer.c
> +++ b/tests/tcg/aarch64/system/vtimer.c
> @@ -6,7 +6,7 @@
>    * SPDX-License-Identifier: GPL-2.0-or-later
>    */
>   
> -#include <inttypes.h>
> +#include <stdint.h>
>   #include <minilib.h>
>   
>   /* grabbed from Linux */

