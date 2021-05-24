Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3744271lfm;
        Mon, 24 May 2021 10:22:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvKiT41N6wxTCSaz5TCTuH3rvjnanfGBT7RbPh+WKqTXVapDPXpqdXTuG4szah1K7FQYrz
X-Received: by 2002:ab0:63d4:: with SMTP id i20mr22630440uap.21.1621876942954;
        Mon, 24 May 2021 10:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621876942; cv=none;
        d=google.com; s=arc-20160816;
        b=HpQtGafinafppbL41dxvWO+2Hxk0apSL7BQVd6UsmjVlyLt15Sti+/DA9iBeL6Avg3
         asFafnqHzm2XRg6ax7V2wDTOQMOQIgOUuhfEUuZUFSazor6xtHiNxmLuRSiM1xA06TWi
         WkkLLT2XaHYq3w8xE+Ztism28mVybuXgp2WhrEw5IrqciLyqFXokGqPxgremNDaFKgjM
         A+9jdLD348GygW4VxrKlmQO7Jo9hAGys+t59Sz3OhMtEa6X/Ep1utVmhUqxBjJV1y56S
         5X0DOqCknSlk6wW/lRfuwLgCYwb80ks3ADDqiInC8MSfYt8gi/cG1SzyxIOXt1+sZ0wI
         C8lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hY+at+cXLMke96FHw6uEdJVgOHp3wUN4zIMeBRXrGos=;
        b=iV0fhn/T3V9Mac4VjoMBPbpE1L/WA2cDgrwLmS9Ptp1xeX0YDd61aeVEOG2kzW+vC3
         nZYE5k+WsUyG/szesQ2gAnuZq05luTUhQD+HCdFWDxyD24GPkjOBF64Fi7FZnW7BtLl+
         v1hL7XRVV+9RlFGpBKkgAi9hZM4rynhFg9XNTa83aiNdVsLwj/WJXvdBXSr4J3HPcdJN
         FN+tShXkfLniBmkagbRbfp30ZwT7ihNSNbzVPI71Sub+pjlgPIaX7AXyUO1o3W0piLge
         HOxzpnnHd3JOr89dYpsoj5ET0x0cSXG311fRDJGNOIxmkNKf13+aE4jJIakSuePyZi+b
         3uhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v63ULEOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14si5856075uap.52.2021.05.24.10.22.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 10:22:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v63ULEOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llEHV-0004eM-KP
	for alex.bennee@linaro.org; Mon, 24 May 2021 13:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llE4G-0008Jd-N2
 for qemu-arm@nongnu.org; Mon, 24 May 2021 13:08:42 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llE4C-0005XY-AW
 for qemu-arm@nongnu.org; Mon, 24 May 2021 13:08:40 -0400
Received: by mail-ej1-x632.google.com with SMTP id i7so25075466ejc.5
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 10:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hY+at+cXLMke96FHw6uEdJVgOHp3wUN4zIMeBRXrGos=;
 b=v63ULEOzAjr4kd9QTtB+7Wn1UUCDXEcU8yU+Xw3qKmZbdbXNHm1mVp3TXvjHteCo4Y
 PXk5dJLyKFBe5s3HlmvDfGTqMOPps18wqAdiO/eFmxcFrX3ilLLeg7G2BCiwITDhsyb1
 ustglpeu3TXjmQuQVceF6B96xi90bnSyasB9eLUXnZVTDvt6fHVK7eone302oJzCstly
 SRWljOYL13yrjMHI7kJ3R4/WYWVp9KBedMG6ElVaYjlXYJ6j2HE9eBrT5SODkRD9WP2q
 CeVGzlpdErgCr4cvSQ5hKzfgjgOtgn9IjY2cLTnwX+lNW+mdr3HESNizPWFwloc5pc+O
 boaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hY+at+cXLMke96FHw6uEdJVgOHp3wUN4zIMeBRXrGos=;
 b=VZIXnzGYSxBvvKPSaPB5YfTwVmzlfxKsd5MOY+ooLnhRfakZ6kyT6j72bTnEqtQdjM
 czMkeYmcIWgqyGRo7FysI2iPU069BDFWjHjkFu649xviDdUCHT8xte+6QLIkW1jRVpOY
 /9ovv1kA6PRKek32M3FIcGgsHeJfbGGUCNzTV2f0XJtXmax46dvzVPKEFyeNKQ9ZOM2q
 vPDvmBaDrUL7VaKXYM2oJczqwO0sD17IiDbXCQ31VDafWxVha00z/vgP4bcJh7inoxZC
 P1ekcqHPqyA2opcKLS4WyFGh5LmPL7Sf1Ud0tLLKli5omvy7b9OYi8CMuyrYWcbD141e
 momQ==
X-Gm-Message-State: AOAM532KE+CucOmyHRd3lQi/HixHRevKjDLRNbjdpzQtXYXFt3a1quxe
 vGMYXLIFEjkWIl4zZxbXj811EAt1xzPATNiy5u6WRQ==
X-Received: by 2002:a17:906:bcd6:: with SMTP id
 lw22mr24789309ejb.250.1621876114775; 
 Mon, 24 May 2021 10:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-9-peter.maydell@linaro.org>
 <02b5ed61-fbb7-0086-a615-8ef375b23e9f@linaro.org>
In-Reply-To: <02b5ed61-fbb7-0086-a615-8ef375b23e9f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 May 2021 18:08:12 +0100
Message-ID: <CAFEAcA_dV-AqhcNXwKE9k68ZmXV9VJVgwuhAMpaTNCb5tvL-Wg@mail.gmail.com>
Subject: Re: [PATCH 8/9] target/arm: Enable FPSCR.QC bit for MVE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: fzcAyktRm+5f

On Mon, 24 May 2021 at 17:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/20/21 8:28 AM, Peter Maydell wrote:
> > MVE has an FPSCR.QC bit similar to the A-profile Neon one;
> > when MVE is implemented make the bit writeable.
> >
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> > ---
> >   target/arm/vfp_helper.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

There's a followon bit to this patch which I didn't notice
at first, which is that the handling of ARM_VFP_FPSCR_NZCVQC
in the "fp_sysreg" code also needs to be updated to read/write
the QC bit (currently it has TODO comments about this.)
Given that this patch is currently a one-liner I think I'll
just respin it as a single patch with all the accesses to QC fixed.

thanks
-- PMM
