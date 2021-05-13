Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp363443lfg;
        Thu, 13 May 2021 03:43:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzq9RnNkucu4rLSozr1eb9vYCNJZC7WkEIfSMkS+c041j3nNKeATGfV8dezTadx4ugONNU
X-Received: by 2002:a17:906:538a:: with SMTP id g10mr17596788ejo.243.1620902608096;
        Thu, 13 May 2021 03:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620902608; cv=none;
        d=google.com; s=arc-20160816;
        b=qi5e84mdgEn0wjQG4u3CoRu8Jief5+8wc6gAnUSr3ywKSWWL8AjUaNLdyZMZuAR1TA
         +40hLxOT7PCdk6R5vP14UL9UDf4fbAJ766LJMBSSxIl/1E/D0mIPgvOoXmXG3EDVswTq
         87EUrCFnmOay7s80dm/k02jkAhlwaA62Jk5z4RbX+VD8Zo9ir5Ad8U2/YGVT/xmQDutb
         Z9YvhM2OdpPw2j2CKczwpg2lFutXIVvHabLTJtdUy/hBy5AiBeTfxsH3vKrd+qcN33AN
         L9Z/t3Tj+Cd5ndWctIUzv+C0Unni/mmFryThoQ6oSApan1Tp20w/uBkNNGIMnIZfKEkX
         7Igw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xzrtcq7wnMYDj6hxLpDwuIiZClkcWdkrtaOkeZoQmSo=;
        b=D2dSnwV+orVeHouRBn1XYksaWYsrbd3GkmbRc8XnuZ+rpTZALQaU8Rq2I0Tx4gy/WD
         bK6PimtCXQc8bgwrZd+FbeWK05ngKqmVMNfoXvdTDWm+/QznnGYEm37+PLF9M20DIo7X
         +sYwKFlwCZROFFLi3ToofDr/J/5DmK5N8gVr/Pjxnq+wlPSCJOSOKtm3O1mp7bmRhrtp
         iRcllqCcKM6jihbuudazQFuS8b/nP3IC02f8+XwgZIB5beBirkagiEJXylrl6qdZcUt/
         onPomhCNfYIw1QAVkmTXi7RHYjDHS/FrwG8C6H6Qx+pbQLYXFnGjwcoZJPmiRXULFtVb
         fxvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zy0xLuD4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hs9si2636358ejc.643.2021.05.13.03.43.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 03:43:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zy0xLuD4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lh8oR-0003O3-79
	for alex.bennee@linaro.org; Thu, 13 May 2021 06:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8ZO-0006h7-NG
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:27:54 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8ZN-00088u-1J
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:27:54 -0400
Received: by mail-ej1-x629.google.com with SMTP id k10so7954210ejj.8
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xzrtcq7wnMYDj6hxLpDwuIiZClkcWdkrtaOkeZoQmSo=;
 b=zy0xLuD43ofRgy0QXan8QBW+p7OI16J0HpxRAnNTsDnqeRy2wGXkUU0Si1pQVYvAKo
 1+FqLPoNfa8sgrI8Ppb8r7K1+JtGsj0wHI/Wy9pIrBK0QNew4WyzKVqXtqBzOdGHEuzK
 W3S1kXBXFj93+vAKXwRQ/yiNZYYlcGMxoXKFoFqUPHYOMUC9ZVCA8tbLe4yqmjgpR7M2
 /1/q2fCEjImJcwT3F+bX6Z74kiCZkzzx+hv2TYMsxycKGhhW4wCAnO3bmtyv1hLyVILj
 PWEfQvGUNFTaKgkHmIm5wpsI6flGfCs/d7z0+/m3qaHhpmW52SwPml4aqqD+//P6Em0k
 IZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xzrtcq7wnMYDj6hxLpDwuIiZClkcWdkrtaOkeZoQmSo=;
 b=nYvKSjgDGAalNqfiuvsiwg9/wx3jBJtX9eoJVuw2X8d49x9Nhtb4ga4KIeR8HWhj8U
 zrrm6alv78Z7IH/58ix/8gg49bB5MDyXcOZBT/CZEQ8nti+KlKOFKuYlkTJgEOf3x0zb
 jcg89XRrqoBPM19vD6ljbV/GpHVHX/2e1/kuFgfVP7qb8rbFG3fd5U4SVepnlmh55gDP
 yEQV9K3ho+aDz8eJR3tyhbLL125Hj25KQ2qt4nv2kSsiv+TA3afTIi44nO/FiljUnt4l
 ApPJ/fERGFodp7fdyRc64mwTgqvXddMrvA9FMZ11GZu8/ujIDCmyQrHmicYNcbC3FjgN
 zHVQ==
X-Gm-Message-State: AOAM5306A8q5RN6sWDk55wHCV/ZJEf0B73Fkd7MskSi8xyOQpf8CLRtU
 Dub4G/ArKGvzgx4E6PGiANmKoQRSOvETKZNWEAmgUg==
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr13407300ejb.482.1620901671410; 
 Thu, 13 May 2021 03:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-44-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 11:27:40 +0100
Message-ID: <CAFEAcA9OfSucD_AF5AEN8jUvxCMXQPHW8SQJ8rHwApfCm2gwAQ@mail.gmail.com>
Subject: Re: [PATCH v6 43/82] target/arm: Implement SVE2 XAR
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fT0fM3uBizr4

On Fri, 30 Apr 2021 at 21:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In addition, use the same vector generator interface for AdvSIMD.
> This fixes a bug in which the AdvSIMD insn failed to clear the
> high bits of the SVE register.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
