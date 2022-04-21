Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp576051lfk;
        Thu, 21 Apr 2022 12:04:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc8sKWn1cik2+PgZino3f3WfQqDAPGNoGmtZ2w5a5ORmlKzclEZ9ub5RPBWZ9Dp5FGKgFP
X-Received: by 2002:a25:330b:0:b0:644:b341:e9dc with SMTP id z11-20020a25330b000000b00644b341e9dcmr1191748ybz.254.1650567851174;
        Thu, 21 Apr 2022 12:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650567851; cv=none;
        d=google.com; s=arc-20160816;
        b=Ec8Hc0J0tT0/PBid6DuntDIA0lfGfEXG4wOk09KKCJkMoxPpxauA+Wx924x5nCAXjp
         p5sIsZBWOIr946GSdas9/KUdtD3o69f/OwBQFFGcll0R/p7wsVMAiqQo/PX82xUUqGBA
         KEz7trC8xvSsz1B5mmLS9tNR2UNBTgY2uRZUO5CCzoH3mNCfgDeTJcfWqRpsLouacJDl
         TDYfoZLCkIVI3aO0x17nAAbaC2HOC274ow/SiTITv0EmwDPwiejrsiC6ORAJPA99nLaW
         vTjieEnfeFWqVP+6+Os3QYUdO0KzhQJfPceAk8PVvZMAgRue//mrFk1bFNAf1+Hy1wjE
         LtOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S8eX23W7pldfOLI7pFtXnJ1vmkiRbMtXhILLO6hMUp0=;
        b=DF1kp6XiZV9gPy/dkJDt4gACENYzWdY/EHDp1/E/zB/IkHqVizySzKzcYJ9+pY8Yky
         +yLEhMGWZ1JIFjBg9GGZVyNH1O4I41iXCpUalWJqlJUjLTf6pMzIqA0479TcuN7N3PsG
         1pu6ulYoGOzqhMllmf8uHEo/7/Gby6qaEEAX3EJS4EpYN13soPo6ZBci8EELZikM358I
         0J9Qt02h3Ahf6trYk9oHV/09PIBlZrEZl68LFSLwxJ3SY+ZYWs7Ufvmma/hsELuSJmEO
         4zeLTjFpIjNwQMSMC+XYq79neRvdp65SCiD/eYKSjZ9eaDvh287dnxvGa1eUx48TJs8g
         1dmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DNVXuwgK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k188-20020a8124c5000000b002ebc5b4eb24si3139275ywk.154.2022.04.21.12.04.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 12:04:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DNVXuwgK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhc66-0003D1-Iv
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 15:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc2Z-0004VM-AF
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 15:00:31 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:33483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc2W-0000ix-Jm
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 15:00:29 -0400
Received: by mail-yb1-xb31.google.com with SMTP id j2so10461801ybu.0
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 12:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S8eX23W7pldfOLI7pFtXnJ1vmkiRbMtXhILLO6hMUp0=;
 b=DNVXuwgKZJz6Ah5Lik+cKixyludCKSm5QoZjsfibKn1P7wELTMU6tc0tP9THq8Acg6
 tGLXUPSNIBYeKFYw3cKC/eN1ZW3lWkEJW0zSt/VlGGxK+Cvu5xbdGrxuUymz9/4EHEnF
 0mLA6IHQlZb414WZaR9WnQPxGEVhKA4lCQ8uyEfg8h0Jldz4mi6TGrZ1OonhvEx/GMzM
 8chCD/qSjwOXz8esYvXoe70ma1hHzz54IBXDgfNT6nTuUCn/DrVZrMtOFp8Jd1QhO2Kp
 M7HYu68Oj8FOWuY9OeJ7sU7vdaRPVvHNfXvZ1Ikb9G73lyKwQOF1rwDMb9phchjv1Rz/
 1S3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S8eX23W7pldfOLI7pFtXnJ1vmkiRbMtXhILLO6hMUp0=;
 b=XNj0gySP3PPak1n8wTKWI4V6ki+pTWkXGQFJ3dRUSXUwmJ6Iol6R+7nOG2yU3YYMHh
 jQo9AgArY02IZJrvAEH8TBHi6ZX3tOqrk+Iw6socDSFiRqH2aaRqB068g6oeA64q10xv
 9Zb9TI73aHD9VxZWwvcIQTCGSWlbjFI1aQ7RXUH0pVhkxcMEf687yGoRyLy1icqOA5Sd
 OG52ii/ri/2IC5fFR/3KNu78TDDPi1HAmrCTF5Ft5liBggETUHK2DA/UAg7Bo9/fENn4
 LUh7Ud2N/RVQONHzqbSWzVL4QrRUlAglKnTA9z6fq/yxMpOeIzaP5m17TAR8RHvgyhKi
 XnTw==
X-Gm-Message-State: AOAM5324sg9ZD1TOh2HxEXQDVd6pZTfgpnjohGRmAG8RcVJ2ALWKctJc
 S5yWbI0TanNOUUCVxTds/c16BNr18uBkAEa9BvH55w==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr1157665ybq.67.1650567627574; Thu, 21 Apr
 2022 12:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-17-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 20:00:16 +0100
Message-ID: <CAFEAcA9TcLZ9t=gGRoghgXT-8uTnk6pUP-trDHm3Qx2OB2M3rQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/60] target/arm: Simplify aa32 DISAS_WFI
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1GlEsvTNPm2A

On Sun, 17 Apr 2022 at 19:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The length of the previous insn may be computed from
> the difference of start and end addresses.
> Use tcg_constant_i32 while we're at it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
