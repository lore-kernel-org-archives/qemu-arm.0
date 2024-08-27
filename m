Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp185864nji;
        Tue, 27 Aug 2024 09:05:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBC7Mr1sX/VKO0N0mnbvJPkSNxZzCMeOf1YeTBLRJ/gMPQQ1b/yGcGXTmOj97GenY0AikZmA27qDby3A==@linaro.org
X-Google-Smtp-Source: AGHT+IGP6hbd9cnjc5dQQXWG0rvJ8b6aGvfq4kHPtVWY7mCCmR4ovQ7qHlcRZLSia9IGSWXknqX9
X-Received: by 2002:a05:620a:4008:b0:7a1:456b:fd69 with SMTP id af79cd13be357-7a7e4c80009mr498994385a.20.1724774710147;
        Tue, 27 Aug 2024 09:05:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724774710; cv=none;
        d=google.com; s=arc-20160816;
        b=h0gJXGRJYAmw+VP7fP3VBknz5deEWTNyaXfuGXPds9VW95WiR8Ixe1YsQ0vsHfrQAF
         Eb24xqJwqMLTnA+D277IPOFyEd3ehSV+FJB/q9J+PaKnzOSmnBQ3c308UrqqnVF7UIAP
         GmiEH01zD8xxzlsUDawxsAqrTtkkQTTx0A7xGuM+rRH3MUbeOmUmbfHzAa9NYCA6yNXd
         cY+F7Ef2QzeOFRd9JEq/0RjNAM9dw6Rs2I0KNCqzPgyViAYaJZ4zo1Blm+eYTjxMtOnG
         YaWzWchOJ4Z1zJUcVGH6+CoBfGmF7GLbYSPKrRTeIR2eryM3gUu5DyPreHyhuTo4h13m
         d1Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MLgYrO+LxLYPBwlvFfZXKsYxR1A6Frn/XmRDlRmyWqg=;
        fh=WezTar76MRiMZDeKg4TAidzyswwNYSf/r1YvcRHlekc=;
        b=E3+3YGDEaxREZn2yd7bqGgiGctlU5lbwXC65DGeXzWMDFLxNpqdDQZgL6w5SaGjaBk
         APNUuP+MnydPy32WzDdHMMHS9VgK3mzWKU+0Fmo/QXlASM4sCpLzzFQstUgCmn5azlO7
         W5nW2bZi7iiY9VGo6Znqw/NONteS4QHhHckIVxP8ieEUrvt/WSVcL39dKvgSbKbtsNRH
         cBqdiGbcDc79X/AIYlpUUkhMZpYJcJDVQksFXxy/R3yznQR0k/wNm6+cC0oSe8NWVt0i
         1iiVnebNuHgCM8XrbnG8mYp56ClxeTD7xqwNKdm8ivJf8qDu5TXbAygwKOg2jcsLZsxy
         vsiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PgJMI+YL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f3d6ef1si1311113085a.258.2024.08.27.09.05.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2024 09:05:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PgJMI+YL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1siygf-0005pR-EW; Tue, 27 Aug 2024 12:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1siygd-0005o1-2C
 for qemu-arm@nongnu.org; Tue, 27 Aug 2024 12:04:51 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1siygb-0006dC-A2
 for qemu-arm@nongnu.org; Tue, 27 Aug 2024 12:04:50 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8692bbec79so729214066b.3
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2024 09:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724774687; x=1725379487; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MLgYrO+LxLYPBwlvFfZXKsYxR1A6Frn/XmRDlRmyWqg=;
 b=PgJMI+YLCtn8Z4GE4XBIM6/q2tfKDq+itM503sbOCG9eZWA0nnqQCop3SKPT4jLu5O
 b3jE5wuHADT99fNQ5CC6fFYEEisH25HtFvK754oFKBejwBTiT6p2dS5v7LxYSyeT4+1N
 DbX4bV07bxPqWr0Wk+QlPHJF/MO/dJb50OAjv5vxyu3IL/+M8SgotQX8fcHnz3igCHEF
 e2fcdb/a4htCif6ADOjk0QzId9dVinj5AsWMNlATYplQBZn545y/eApzNiACvP8jj+oB
 FS6ZMdF1vBtGOgcZvqpKAg2ARMHQMTNtvGHbQ54PyJAo9f/Wz2p4+C7VvtaHhXQszr7X
 6wfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724774687; x=1725379487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MLgYrO+LxLYPBwlvFfZXKsYxR1A6Frn/XmRDlRmyWqg=;
 b=hOnCQCZKuCIaJ1grnjrl/1C80iC77VNeWOz9D8QjwKhKIebxtRT+WLnlqP9C8B1KG8
 WqBjXovgXrTXJFz93sWy30GwgND1w8OVW1g4XRVURlL/hIa5crJjIHOni8Gzz1vwtvY2
 s7kRfiVA8vPemURZIuQp+uftDGZ2qmUP7XNhtA1S1Xqfe3+DZfBaYDMmH1yJ68xvajwV
 9dUreJuBQKd1v2Vp9axDoLD3+12bOIRaq9ybB2LsiHSU4Eh244DQmg15kSnHpIZsLrtr
 v+2ON5lSkSQmMBJy/Ott8sC5CCht/pXf0JugrULHYLjVwrvWC35VA97el2hOBgxvwPV8
 voAA==
X-Gm-Message-State: AOJu0Yxdps4u0McdNxluYyeQy8OlunWDhmkpqxFL2G5GH5pKPzhF5Zvr
 VHzXp5PyoTMCQr2cYI/IgUMEeA7pTfzj/UxCwHT9LCjUzQKgmxFVAaUR1HMyRB4=
X-Received: by 2002:a17:907:6d02:b0:a86:968b:e9c1 with SMTP id
 a640c23a62f3a-a86e398df85mr314137866b.5.1724774686937; 
 Tue, 27 Aug 2024 09:04:46 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.206.45])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e5484f10sm125827766b.22.2024.08.27.09.04.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 09:04:46 -0700 (PDT)
Message-ID: <bbed40a1-fe6c-4f3d-b891-e9138f9d2fe9@linaro.org>
Date: Tue, 27 Aug 2024 18:04:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 12/24] hw/arm: add basic support for the RT500 SoC
To: Octavian Purdila <tavip@google.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr,
 alistair@alistair23.me, thuth@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, lvivier@redhat.com
References: <20240827064529.1246786-1-tavip@google.com>
 <20240827064529.1246786-13-tavip@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240827064529.1246786-13-tavip@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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
X-TUID: 9JWX17WUBaAw

On 27/8/24 08:45, Octavian Purdila wrote:
> Add basic support for the RT500 SoC. It supports enough peripherals to
> run the NXP's microXpresso SDK hello world example.
> 
> The patch includes an automatically generated header which contains
> peripheral base addreses and interrupt numbers.
> 
> The header can be regenerated with the svd-rt500 target when the
> build is configured with --enable-mcux-soc-svd.
> 
> Signed-off-by: Octavian Purdila <tavip@google.com>
> ---
>   include/hw/arm/rt500.h     |  44 +++++
>   include/hw/arm/svd/rt500.h |  63 +++++++
>   hw/arm/rt500.c             | 335 +++++++++++++++++++++++++++++++++++++
>   hw/arm/Kconfig             |   2 +
>   hw/arm/meson.build         |   1 +
>   hw/arm/svd/meson.build     |   4 +
>   6 files changed, 449 insertions(+)
>   create mode 100644 include/hw/arm/rt500.h
>   create mode 100644 include/hw/arm/svd/rt500.h
>   create mode 100644 hw/arm/rt500.c
> 
> diff --git a/include/hw/arm/rt500.h b/include/hw/arm/rt500.h
> new file mode 100644
> index 0000000000..66ec82436b
> --- /dev/null
> +++ b/include/hw/arm/rt500.h
> @@ -0,0 +1,44 @@
> +/*
> + * i.MX RT500 platforms.
> + *
> + * Copyright (c) 2024 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Contributions after 2012-01-13 are licensed under the terms of the
> + * GNU GPL, version 2 or (at your option) any later version.

IANAL but think these 2 lines can be scratched, as we are in 2024.

> + */

