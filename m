Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp549533lfm;
        Tue, 18 May 2021 09:06:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvmTd0KtvlEVZ7PTcucofvELHgOUd5FtR3WZuRjHi1zFRhlM07VI4Js6ItoXOVg4WCxVpZ
X-Received: by 2002:a02:54c1:: with SMTP id t184mr6321336jaa.79.1621354018227;
        Tue, 18 May 2021 09:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621354018; cv=none;
        d=google.com; s=arc-20160816;
        b=lT5Rx+SugIxGItm0DRcoASWLDjyQF5mSAzbEcItRwUagERiU4m2BhmG4D6E5ov3Iug
         wn8WJbRZuA67z2StCu12gr5HU0Rr6mLlTj3Y3fI9Dgc7g4Pt6mHvgc5xjCsc27Nf16Vr
         Ojrx40tqhfLqVFm65pf7CZgB0GFXh9BzjUQCALe+jI5X2Io3Fn6NV7Kd8frsmDZ/igCW
         fvkAorDpQUXSLd27q779vb+XdW/dzIWCq8XYAkN1CCqX1jh83uPeAZzmkiuAkIf05tkd
         Lm0ErbQ5ltQ9zPYBVYopfY+mA02JsEw9Cl9XUr9e96zUtf7Rndq+BplYo19wGnVV9ZKB
         0X/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AKlegO0j26ymEWX7vm+vV6Gv9F4Nfcn7+aAaew3lYMM=;
        b=PKgF9A6wtLaALKS+Je2v3dmjMLeZEJeIF1cFhyJeBYYkJ9VJzCfc9T8v3a2zzQYpBQ
         8boxHmtlKLZLOaLwOUtABh6wOSW3Ef1d6SsGeVKfr/ld8aRTGALnJVWYo0nWRJZAF+3A
         ElZkBYRvtzDMNwHtRvlC1rpQFbCj5wKDlRx0SVpC5V1r/VBzXksP9x0JdMN6KFB5In0+
         yQX7UBEliETbN23QRCv9rKLCAH0ouuwLzF4iSCwmCrbsIwO3PwjWVIEacjIuKsrI+JMH
         khDjPEmKp4rrxCPpJblu9VdrHoKpghD+ZO/A/TNQU8c3CfXSrfSysbpJAKY7wZGTq8LO
         FjYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V+sqAyc6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19si11089308ilg.27.2021.05.18.09.06.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 09:06:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V+sqAyc6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj2FF-0005cJ-IM
	for alex.bennee@linaro.org; Tue, 18 May 2021 12:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj2Cg-00030i-QN
 for qemu-arm@nongnu.org; Tue, 18 May 2021 12:04:18 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:44690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj2Ce-0000oQ-GS
 for qemu-arm@nongnu.org; Tue, 18 May 2021 12:04:18 -0400
Received: by mail-ed1-x52d.google.com with SMTP id t15so11840115edr.11
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 09:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AKlegO0j26ymEWX7vm+vV6Gv9F4Nfcn7+aAaew3lYMM=;
 b=V+sqAyc6ORoW0VHIDAPdHj90Rit/myCB6ZkXvHpMgRyaErgEDUNKMhQKlChxuzBkT2
 m2uvyG4qLLa0tKgz/ovJFQ8kr3UDN4xJ9yOMah3FI1bGrCeY758h7QAjqT8/lGDRy1ET
 rZNVDQDPSHq2KcTINiC0JRLz2sZmKZIEhgw7ebIPgOL5WmHSur2K0dqKxneFU1RqGCPJ
 m3GBO+Y75shAdP+gTjNWQixtiL/TvwAU76cRZEKcOxm+VIiZG3XDAjoDFSByAVXrI21v
 m72qMkTrpP2DduT75Kb5eUP6UasmTdYxu4X0Ue0I2CdFOS92xSzzA5J25+QNZyBYdfv6
 2/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AKlegO0j26ymEWX7vm+vV6Gv9F4Nfcn7+aAaew3lYMM=;
 b=RnY+9GsZdHKS7m4dpme7C6ld38GduN51yjMkyDi4pNdh0CyM498iNl2X/SQBLS7Tw3
 4Re+QzxatZptS9RDr4EMLOPSQa8KgwIKGCWIGVrnsQ32Xmgj3fEsndPLTlxHkAjfJTdc
 It8R3W2NiERyRyVsZqLdHYXO4hLxj4QiU3jhh4ah+vJgWKMRegq+XfpKqhlOajkAfu7k
 P1F+brymXhEm6d0RBpgWTQaWxDexsChA6dDk0UAHqj0NWc2V3mUg1S0aTu68A8KXT/f/
 lV7Wm4bY6pJQyJVQFo95AIl1YNkbpTcKFQOqJ3+eKxhR3uMvan+KmGLOrXaElQ8vACdg
 nnrQ==
X-Gm-Message-State: AOAM533kKdkREgtF3rVwALNxiEluvFK7z7Y9gvmGUGjX2a65FT7jyCsm
 ZRTLofwAW/nbXgGPZhpwRJ4EmFrHRjlCEArAV6w+hA==
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr7839560edt.36.1621353854291; 
 Tue, 18 May 2021 09:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <20210429234201.125565-8-shashi.mallela@linaro.org>
In-Reply-To: <20210429234201.125565-8-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 17:03:57 +0100
Message-ID: <CAFEAcA9jJYwq8kRRUwqeaD6-fPcF5fHt6JEnE2=ufKEBAi0HJA@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Shashi Mallela <shashi.mallela@linaro.org>
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gDDQZf5ltgz0

On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Included creation of ITS as part of SBSA platform GIC
> initialization.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
