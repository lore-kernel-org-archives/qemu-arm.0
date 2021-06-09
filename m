Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5618135lfa;
        Wed, 9 Jun 2021 11:03:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrxhn4EQERokJsQiZtQhHrLgEn80dX9y4P8rO4v8Dpzrek0gWF+V7Rgf10azmeUVORS56X
X-Received: by 2002:a17:906:5a88:: with SMTP id l8mr993968ejq.163.1623261795391;
        Wed, 09 Jun 2021 11:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623261795; cv=none;
        d=google.com; s=arc-20160816;
        b=UqucB7Kx5xI2fMR9CEaP2GuIl5XaJaUH2/XhawzCxyvbW5JL8ydlQsq3h8sFTTAtz7
         MXDRYNCuSgLhoEe6+xmx3seH38O9Pz/hKFvwewILlP0AzRKJPYyj4ht8Dz6XGVyEMRSI
         L895N3O3clphi/A1tBusSu6HCVOxdRnoIrSrrFnvybmCCMS/5LMOBqGciS76yPi07OKy
         n1qZqP1s3rfT+1LvQ5wQQRw+vA/ruQC5qJcsS1mulA+sUxd1zuoHH3S1AxxF6tlMec4V
         zsyJCx3HSdjJgprZ/MHIU9mw0MQv6/qai/OlVOsombkQw7/CcxcEd9WC1P3TqnENI1oX
         hcOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zrzMF2PMhbvXaxfsrIsvG46MmIg+NWvkCyLJR0lyAPM=;
        b=UrUC5IqQV+D+4EJVbTFOjjpGlREYlR+pXPyTyTsetXhH4SOLIrdQP1Y28NbmIc6p0k
         9/0plfDXnztBWbTzUUEEk9wmtGlQNhh29jM7zQYguK/ujfgQ0KZiVNDyPUnl3i16ALe+
         +AEH1gnXxxtE/eRIImEt2n6EQhOwfRp8LxreMiCVf0oWKrn/QRnimszhIYcW4/UlxtPp
         cNMRb1uTmr9Bqz+f8Hc7Jk5uMBN80VliEHoQUjYvqqh2hPBS40z2jv/NkDLeBU7LmJii
         Ka8uaQEiWrHZUDpHwy7Usn1bjqEPqYPY9EeuSZjTTWNMjIAM8NmzUw39725fbXzFBNrw
         L92Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XO/m62me";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si286904edd.533.2021.06.09.11.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 11:03:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XO/m62me";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr2Xq-0000Uv-CQ
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 14:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr2XW-0000Nk-Sl
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 14:02:54 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr2XV-0006M3-3R
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 14:02:54 -0400
Received: by mail-pl1-x629.google.com with SMTP id 11so12991211plk.12
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 11:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zrzMF2PMhbvXaxfsrIsvG46MmIg+NWvkCyLJR0lyAPM=;
 b=XO/m62meWb/x5HLlHycJrHTjVI6/T/uj9x/J+puutaYbFNGgrxkR8lw2DAgcg4Cmzj
 j7FFxFyL9rElPby/1v0CfRqFW2ImueAfwUU+FvDFf5KIAZjlZLCYK0vD+cBRxqpCiSMx
 g4S0/CYeZFZZARHSxu7EPjv4/0WabGkDdFLHFHfm9UmKH2dhG0420ELwV6ED58fqAdXr
 JbNyGswio9AatPx0dvBgGaPN35s5LaSQZEMFnHCX53eny4I8H51nM4xR1N4SJ4zVZNu0
 8Rm7VfXmZOb4XdV9QS/E6qNOYD+JwFLSnNLfy3ZuY8ceTYl0yB4iRi/V0EgBfA8MJkNi
 3tOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zrzMF2PMhbvXaxfsrIsvG46MmIg+NWvkCyLJR0lyAPM=;
 b=JBAmxtHEwpugaW0wvfIfOVngh8XmuScM5wWKwiKKmCkCQJbrnEe2391/ZrLr/DZdCZ
 GBYnM7rv3fNlJqi13kGySl+QwhyNH7r+KQIK9aq/GH+FHvEYiscrZIz0LxAkypqoV/3D
 06shpJrzc+4f8SpkZkbZ8UvgxI1EmDjf6253B50GZUxA2GYGrIa6pmGOje1YdBR8rXBt
 n1uRM3b9LYJB+q61ZESJxCrNcb6C9xriPteKIMgCBpbr0x7Hn/gMe05JmZw0jWEgyB9o
 YQKUlNGAvlNvgk7zSiC/BMVVYDrYfJFHHjRaTxK0tdPbMtvsAmBaRoAaTGvg2TTg5ZEz
 kEtA==
X-Gm-Message-State: AOAM531uff6J+jDpRFPZFxEw6Zuho2wA3PHKdiR7q+M0lgOk6wTZv7u0
 nPbShZGKGswbzjFDZqufwKJA4A==
X-Received: by 2002:a17:902:f283:b029:10d:e7f3:725 with SMTP id
 k3-20020a170902f283b029010de7f30725mr687172plc.45.1623261771589; 
 Wed, 09 Jun 2021 11:02:51 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 i1sm216475pfc.206.2021.06.09.11.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 11:02:51 -0700 (PDT)
Subject: Re: [PATCH 35/55] target/arm: Implement MVE VHADD, VHSUB (scalar)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-36-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <58ca2143-aa7b-8155-e16b-bf3267dcc373@linaro.org>
Date: Wed, 9 Jun 2021 11:02:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-36-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EXmv8NxAzMoG

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the scalar variants of the MVE VHADD and VHSUB insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 16 ++++++++++++++++
>   target/arm/mve.decode      |  4 ++++
>   target/arm/mve_helper.c    |  8 ++++++++
>   target/arm/translate-mve.c |  4 ++++
>   4 files changed, 32 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
