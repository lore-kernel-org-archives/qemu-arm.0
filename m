Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2305619ejb;
        Fri, 8 Dec 2023 05:06:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhDiBSrKLD3REJMLVSoYbUbhQ1Y/r2QVQDSrFfQI4eA4aptIgoysa+EoMRM/klZhdfXkY7
X-Received: by 2002:a0c:fbcf:0:b0:67a:a721:f341 with SMTP id n15-20020a0cfbcf000000b0067aa721f341mr3523555qvp.129.1702040771479;
        Fri, 08 Dec 2023 05:06:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702040771; cv=none;
        d=google.com; s=arc-20160816;
        b=SLq/Ue3e4vye7qo/aEEeKN1/gD5jq1qGaGtRNNJ5hu2MVdlOFvM3Aonq+j8/p/02d9
         7/wT+KWYVS5eOq0vPHOLyYuYzY2OPqg06AqtYLp63/Diwk2hLh/EQzkrjx1PxXTT5ABa
         9CKeQlIVNj/zmWxap980W2J0JSRV6zuUgbqprw8DqgaUf0NNCQqub8xDXUNpzh2j50yE
         D5eXwaZ+dy2ijv+2wM15LhX2+ENnCYQXjA0sLNMeKEPp3qhmZ71YDyTxLIzODBL7A88D
         bMCy4DyLWrarl/fV2nqNo4G+0yIM5k23Aos5fd57O1HfEZDghQHJiLP3+B96HzfvtknK
         SGuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/t0HoY1C3neyISWJuyb6jOMXnPjOnvOpO/4u2zzyJJ4=;
        fh=QCq67MjJ9ZNv+r/6aHCftgXUNUhuidysX9YlaIvB7hU=;
        b=d5mikX4e6ThROgeg83gzmMvnIFCEsitOcCpBAx5/mMfnY29dXJAUjnK5K0dvMZ/nN4
         TQioLRb8uzidNI9S+NbFmNWZG2hJvf/R6tv8VhU4ev08Ge+mNMkvVhp1I3Wymy+6fQcA
         qT4NNvJa8jUNbjWBveu2lNCTcAQ6NJf9fhnrATGPwiIaNcPXsOTl+NyDPCGN/7mMbOqO
         wlhkNEfalRo3/eTnCGJvBUzcc4sZlOD8sGb2+Ew3LN3UPb1x7bk8/+S6k/41J0MWA0I1
         Ng8U1uLGf3yayWnNqyc388Qy1yN2e8L/jjMixydS7Mn/Y867z21OTts0r/SPktGKR53c
         xrOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wKlygqLV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dw18-20020a0562140a1200b0065b0b5600fcsi2005934qvb.41.2023.12.08.05.06.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Dec 2023 05:06:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wKlygqLV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBaYI-00044b-9w; Fri, 08 Dec 2023 08:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBaY1-00041m-6v
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 08:05:44 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBaXl-000405-8e
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 08:05:40 -0500
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c9f413d6b2so24659241fa.1
 for <qemu-arm@nongnu.org>; Fri, 08 Dec 2023 05:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702040723; x=1702645523; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/t0HoY1C3neyISWJuyb6jOMXnPjOnvOpO/4u2zzyJJ4=;
 b=wKlygqLVl9LhzX9R2L1JA+jz7kX3BueLmICAVpcn11ZO6kSNIBoYO9c1dAWbqO1pua
 RJrgwuAHxHDvuY+OaiHaY4yCNaS21WbkiRqVI59hIhy/mz0o1axUHNolopdA+wQg6i6N
 W+PWmHOYjCYSr4mObu5mp7+96OSYZkChQ0cgI5ORZHOE3FF5PJFulLGNV0Eq1XWAWXGS
 VbN7Pd2JyMdHhGOq1NMH747mIBb7q/mLKXSUnCfutouLXvVlD4nJC3Ab5M7R36Jp0cKX
 R0XD7omHbVAhEMMoHf5BUSMTQI7+hgAmeqOoFeN/oj9pZ6ePKcXDg0l4VTjcmQm2Ti8I
 OAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702040723; x=1702645523;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/t0HoY1C3neyISWJuyb6jOMXnPjOnvOpO/4u2zzyJJ4=;
 b=AbdqiGBcky0GTkjQBT+m6KbziO+bIQpVXveg/R3wRNW2ixRqWdkQcfSgFKJFz+7717
 cJ+nNBbAVt60TkZv+kBsI3nbcQGiZKBBbPQuAf+CL7xKW9en3NhMrZNta+qVZdwEzrPT
 FGdWBxtkCPVvmVEhdc0c3qWiiCQc5NkNTyStq9IyeSJgdT50osahrkgTdZUws7T20QXp
 dHSg7r3ddO3Tt/nKp+eny50dP6vCS149S4qe4AYy+5TZZQTcw1e+iJQwgqIMqRi3IvU/
 +BDNQCJ0AE7rCKosTMSJbfkOBwK0lSx4VT1vTuAOx8r8dFAFDiVuP5PvNVo32S4JspSq
 SXdQ==
X-Gm-Message-State: AOJu0Yz/+YRRFv4iyhyU0MD+IcI5HaxYAxqkozj/JP5PaiTUifFvQBGg
 aiooqtQlpJqwlBj25Xk6K4VrDA==
X-Received: by 2002:a05:6512:344e:b0:509:8f8c:986f with SMTP id
 j14-20020a056512344e00b005098f8c986fmr1541720lfr.7.1702040722614; 
 Fri, 08 Dec 2023 05:05:22 -0800 (PST)
Received: from [192.168.69.100] ([176.176.146.181])
 by smtp.gmail.com with ESMTPSA id
 cx12-20020a170907168c00b00a1caa9dd507sm989606ejd.52.2023.12.08.05.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 05:05:21 -0800 (PST)
Message-ID: <5f9513ff-1a41-4f83-8ff0-eeb550ea2eef@linaro.org>
Date: Fri, 8 Dec 2023 14:05:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] sysemu/cpu-timers: Introduce ICountMode enumerator
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231208113529.74067-1-philmd@linaro.org>
 <20231208113529.74067-4-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231208113529.74067-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: iEzxf5xtfw9H

On 8/12/23 12:35, Philippe Mathieu-Daudé wrote:
> Rather than having to lookup for what the 0, 1, 2, ...
> icount values are, use a enum definition.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/sysemu/cpu-timers.h | 20 +++++++++++++-------
>   accel/tcg/icount-common.c   | 16 +++++++---------
>   stubs/icount.c              |  2 +-
>   system/cpu-timers.c         |  2 +-
>   target/arm/helper.c         |  3 ++-
>   5 files changed, 24 insertions(+), 19 deletions(-)
> 
> diff --git a/include/sysemu/cpu-timers.h b/include/sysemu/cpu-timers.h
> index b70dc7692d..3f05f29b10 100644
> --- a/include/sysemu/cpu-timers.h
> +++ b/include/sysemu/cpu-timers.h
> @@ -17,18 +17,24 @@ void cpu_timers_init(void);
>   
>   /* icount - Instruction Counter API */
>   
> -/*
> - * icount enablement state:
> +/**
> + * ICountMode: icount enablement state:
>    *
> - * 0 = Disabled - Do not count executed instructions.
> - * 1 = Enabled - Fixed conversion of insn to ns via "shift" option
> - * 2 = Enabled - Runtime adaptive algorithm to compute shift
> + * @ICOUNT_DISABLED: Disabled - Do not count executed instructions.
> + * @ICOUNT_PRECISE: Enabled - Fixed conversion of insn to ns via "shift" option
> + * @ICOUNT_ADAPTATIVE: Enabled - Runtime adaptive algorithm to compute shift
>    */
> +typedef enum {
> +    ICOUNT_DISABLED = 0,
> +    ICOUNT_PRECISE,
> +    ICOUNT_ADAPTATIVE,
> +} ICountMode;

Per v2:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
