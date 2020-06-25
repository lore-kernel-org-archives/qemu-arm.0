Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1479974lfm;
        Thu, 25 Jun 2020 09:50:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKlw0nzFflKf5TZlAdgisbFkPnY1Kp8qWbUlI6YYYUShB1UQGXx5m/tiKz7JpCgE+v9eM+
X-Received: by 2002:a25:ab49:: with SMTP id u67mr29330230ybi.425.1593103847224;
        Thu, 25 Jun 2020 09:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593103847; cv=none;
        d=google.com; s=arc-20160816;
        b=HvauTXNR4pyiifoVmyGTvIyIlQMhgcNdmIJYJe6IHEZ0P6BRZX1vAB8Oue7bW0sEVP
         o0sljbHOd0Llgypxa/S5Rx/jFZbFTPZK8EY+M/h8eRMFdxcSWIt1kCeE26Erkmzbx3fl
         PTlucaINlvVjeFYbvRVO40tWuqX1MezSnrK2KWt9XYv/DQcDksIiR44XCgmM0mb3k7Sq
         LWCjP5Bie6AaMAV4lIB+bH///Y/Gc6rQRycFq5MXfAFgs0JMH3RCVUoaItK1cIFn8usF
         kROSfrxrk5ZFvI39zqzuRihuSe8FRhHXIzANdC/cVyRUUzBOEsxvnXYC7tdAdeipn3bz
         WfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HPPTVWJE7It0f22V0h1/ishDkdVhCDtBrga3G/+KN78=;
        b=UpLAgtyHtA6aZLXtfK3BjZ8UdPHtMv5Uf4/KFAXvbgoI0mfbwSfFtgMchwpIpFaNId
         +TET9mtvKVq1+wmEANkb70j7BeyZAV6yPTZBgOSdg/e0MXKfXwzJAeNd5QD8bxV3VkwT
         HmjvhrNZxC/p1w86j7F/uX0SNRHpPNRTTkt112O2Q8nz+HtxQXXJv36FqJJoqEEhKdA6
         R2es2Ak7pfYaFHNsehHk1RkWYXhbbLozshocWiBx758+MJ6CCYha8LKhXxhZU7f8KUDE
         enGNbf/kLgIXmr/DDM/jqI8eaXwRLolsxa+NAh9jhakXtxdVwaU/BKYAU9wIHcox46D7
         Mylw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="RuEoc4T/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si22078233ybm.460.2020.06.25.09.50.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 09:50:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="RuEoc4T/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joV5K-0003k3-HD
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 12:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joV5B-0003jo-5Z
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:50:37 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joV59-0002f3-BB
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:50:36 -0400
Received: by mail-oi1-x242.google.com with SMTP id j11so2875788oiw.12
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 09:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HPPTVWJE7It0f22V0h1/ishDkdVhCDtBrga3G/+KN78=;
 b=RuEoc4T/WE2RcXjs/3Ms1nyVmIGJMkCO2Vfe2AQRs5dvWm0eX15l3DimmNfLjy7fLz
 8NhrqU93saZwBysQ/juaaS0j9bCPjKXKvpO2u37gIPKtPxKjrSxvBLvcY3td6QfdCJAh
 G2Xh4rLCU/AOApyoWzidbZJ4XmO//92zug0Q3RzPHa7XYL638pJQrJnXQKqY+NAj20CZ
 D0Ac22xUGJtTeRFmMAZhhPV10AUd14O/D7xHW40cVY9L1pjwy3i13PrBcdHSHkghl0O4
 RS66yBQ01+Cx65zcWnaLfeZ074K9/9o2ZVNMUlJdM97uPDQfbR6t/uVFcQkOKDjMJTnm
 KihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HPPTVWJE7It0f22V0h1/ishDkdVhCDtBrga3G/+KN78=;
 b=Kw64PoOzT046T+naquq9nbq20ufOGnu3xXaKPY91OiixwMkOZrkkEajnl8AJiP3Vov
 4B/qILHTNRKlw5Cwor62j232ObQSM1tVi55if1Cesvkpwdbtg8iuB6AQkFbUv3asoKa8
 bO07tvJ7dhEaLSO5Zkp+mAf6w8AeYFs2W91Ic/MDGfx212ovBGWN0kEnMUl9grwkaKeg
 2Mv/rELfUigtQS+iM2j3rXtfkyVqQHc+oCO9mQdHr0AwDqDzgY5e24Kdv/3v+i8xuXcj
 qMwb1I9Lzw79HC100S9JzXjnoMtDx7mdC0Astt6SYPu7Qb9Dengq2rA6+fCGrdlpYzYI
 SuDA==
X-Gm-Message-State: AOAM530BjMMC/dtM2ayEu3OAk2sc+iQoulAGWnYuxgpda+XMa0owgZj9
 B50357cNOEJbCNRrixmDbQf/KxEIJ1Ag9Fqrljy43w==
X-Received: by 2002:a54:4694:: with SMTP id k20mr2942673oic.146.1593103833892; 
 Thu, 25 Jun 2020 09:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-11-richard.henderson@linaro.org>
In-Reply-To: <20200605041733.415188-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 17:50:22 +0100
Message-ID: <CAFEAcA8fAB_DDrBjjVCCKwiE_n=05q1KYyWMR_2EuhOa0+EKww@mail.gmail.com>
Subject: Re: [PATCH v2 10/17] linux-user/aarch64: Implement PR_MTE_TCF and
 PR_MTE_TAG
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VLByMfBl1nQj

On Fri, 5 Jun 2020 at 05:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These prctl fields are required for the function of MTE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

This API doesn't seem to be in the upstream kernel yet, right?

> +                    /*
> +                     * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
> +                     * Note that the syscall values are consistent with hw.
> +                     */
> +                    env->cp15.sctlr_el[1] =
> +                        deposit64(env->cp15.sctlr_el[1], 38, 2,
> +                                  arg2 >> TARGET_PR_MTE_TCF_SHIFT);

This actually will be per-thread since each linux-user thread has
its own CPU. You probably need to do something to make it be
inherited across clone and fork, though (assuming those are
the required semantics).

thanks
-- PMM
