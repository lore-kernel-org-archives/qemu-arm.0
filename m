Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp344925lfg;
        Thu, 19 Aug 2021 06:49:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4hXok6pgPrgnUQmaP4p3MM4rhX+F5TxiQbfpdqaklnrrn7oK0h5a6oU9FYVqnltmsrQhG
X-Received: by 2002:a67:ca1c:: with SMTP id z28mr12244448vsk.40.1629380960656;
        Thu, 19 Aug 2021 06:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629380960; cv=none;
        d=google.com; s=arc-20160816;
        b=qUb7iZOU2hhCKUUkj8dFk5gY+IGR5hphvd4nGiJLxk6NQZcsG8zXt3um3bRsF4fha/
         e9OoGxtQjv3GF+1Y62vapIqD9XAmF0G81CgHGc3Eg1dT2yyYYpDsCJNEryqjoVFvlTxf
         Gdp7ziR2m/tugTw6TtwgicdawgvNh14n4lBTGGxaQF5zirrkzrtnEB5Z/SmqyTJbyxV9
         T8EIz3RwCKN7YTlJaUte89xcvqgWsq9dFPLKwAkwiwuQCSP6xCDMNQhd6wy+uazTLNa7
         B++df23AbCArEhOXRfe7MsGyHgPotQ1GEdzCTOqvM1KQVqGQ/JFciRaLek2NuyzQH8f+
         /Iyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dMZLYIOfpnKXXXNu876DaFZq6/F+WJ79ngg4WXo5gsw=;
        b=VbqSs/IppTVy5wQhXOZ0Uy6mcxxnNVLUYAX8FBD6MIqtlncs330RucSXhM+K1W8IHj
         3wntPUYM8jHmf3jHgs6mczwkWwXTX+NrIbsmy7Dkr32Svvl72XZrObTybkFiuHr4R0Cu
         Qc2mc7F0plJUVFqopcP3PdOzjQRsSqlSnUGe3TGEKX3rhZdufxbaJlkiQjEB4DQi4cEg
         yfVgUByyMur62GA08kyQSVYxjkHiKvo/Z8xJqRyu3yEsD/BMKBYdE1w45soO98v8UoSf
         d4NHxsBtD7XnCHQIyBniBKwWZ0oj6VKYVHsGFCRhe47PpzxV3DN2MIKJlwndIalr+1b2
         ERUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CSVuo4A7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i28si1772692vsj.403.2021.08.19.06.49.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 06:49:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CSVuo4A7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGiQ4-0004oY-0N
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 09:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiPt-0004oE-Lx
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:49:12 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiPs-0003XF-5f
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:49:09 -0400
Received: by mail-ed1-x52d.google.com with SMTP id bo19so8946559edb.9
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 06:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dMZLYIOfpnKXXXNu876DaFZq6/F+WJ79ngg4WXo5gsw=;
 b=CSVuo4A7GU4n5I8gHHaFYibOt9JbsR65IBBFNlsWC4p+vONjkOd/uM7mD1XuAVWIS7
 HiE40/ToaUghjIZF06e5RaSes/m/RwunVfhyiJg+Hu4uMk+QRHGZDfVAPUr/66tq/MIY
 JYxJcF1/5mtGUIvb8UU+0SQiIHqwDUN2ltq5WwwQrCOt9C8yuTBXTFapFEmpn3Pp7kqC
 O2ypLMIBsImIWNtyV6IM/VBuCjZSjnMvf6Oh6aT6K98bOnA7dHgn6yD9oHPC53YBSZQN
 ORX9H3uXtNN7IYdyEjdDR2nvz14fDWCIdI7hAyBjBXhHrZ+CkbyicgoYUoHNtYQl9ezQ
 9jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dMZLYIOfpnKXXXNu876DaFZq6/F+WJ79ngg4WXo5gsw=;
 b=ZY9Ux38liftFS54NbuBPvClAhx6fDClEEebh5HjGVI036CZigFmuDtxrAUIvRZZ+XC
 iUQVlmlXUUV68F5T/bpXmVOnYJ1J0ZoGiutc45E+8eeFp/NlbGlwv+cx22DeWa9LYeC9
 4Bf9fksA4/3ULVlYYExhPYG4xfmi0OBhW4eEgYytRLrylLi+Kj2iORZsdbPJsHbIgSQQ
 PPcdBZFbpZ+bT11Q1JfyqvrhSh+ION0xYG3BKbH+nOhRcsvqD++rzFdrDC2MVqQ1Hi9k
 GGs7qttgMLe/xoVEMHxZxtk6sQg17YQWp6cZRGv7sm+1SvkIIbZhcQ26iPxZFACVuSth
 dveg==
X-Gm-Message-State: AOAM532kneao3WFf9e8GH7Bn8hM5uEC7TJW9OzV9Vm7THzS9ejBVeTXG
 AIEoXtBby9iIbTQlaUSYngxBAwH8tT6XOI1lXY2vMQ==
X-Received: by 2002:aa7:c0c6:: with SMTP id j6mr5217640edp.146.1629380942565; 
 Thu, 19 Aug 2021 06:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-5-richard.henderson@linaro.org>
In-Reply-To: <20210818010041.337010-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:48:16 +0100
Message-ID: <CAFEAcA_fSTRTxDaU21HySQk7MoQjKZTRdE=Sqg6KZb86FQf2=Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] target/arm: Suppress bp for exceptions with more
 priority
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2EDxE39Ad78m

On Wed, 18 Aug 2021 at 02:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Both single-step and pc alignment faults have priority over
> breakpoint exceptions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/debug_helper.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> +
> +    /*
> +     * PC alignment faults have priority over breakpoint exceptions.
> +     */
> +    pc = is_a64(env) ? env->pc : env->regs[15];
> +    if ((is_a64(env) || !env->thumb) && (pc & 3) != 0) {
> +        return false;
> +    }

Other than the obvious adjustment if we need to handle
env->thumb && (pc & 1)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
