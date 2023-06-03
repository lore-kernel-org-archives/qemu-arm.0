Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1790150ejb;
        Sat, 3 Jun 2023 06:24:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ419w2WLCCZI3kM5gJ9VlR1wkm7Dxl158vHnnSoUUNVYqeCO26qlzxbKo86jsMZJjqwKyem
X-Received: by 2002:a05:6214:2487:b0:621:83d:3a47 with SMTP id gi7-20020a056214248700b00621083d3a47mr1846481qvb.39.1685798642452;
        Sat, 03 Jun 2023 06:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685798642; cv=none;
        d=google.com; s=arc-20160816;
        b=gNvQsJQC/2h6e+CHyvPy+MkNzDeIxWMt3HZXkNphrtAQAlnjZc6VEpjA36dhOSQOLh
         RYkLMcdv3HqUY0TnGaCmlYmYrMpcY1d32hne9X6E47UJXP/tL2uNZSb+7UzrI1VsuPmp
         AX3vva4m7NGev3Cdo6gxHgNOmWyJGee1B5Kw+ZuFMqSpG35Vu5mJaCh8m61fbmOlDKM8
         z8//VpX27YxOFrOq6bDE+ltA5RE+SE2KWsKzEhRhXE2Q03KDwLxBeP3t528Ox1OHJ4T2
         09VLpPsNzHSZyPdhoRbYtoOzOt3gpA6dnzyNLZiect6rEF0y29GhbmwTs4J/jnXDdji3
         DOlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ABnxn0uE6fbtFvtr2GmqKKV+wxYhnhJjOPVuYl5qFjk=;
        b=wfYcWSr+bIrCtXEAQ0jkmQT5FAcve3DQB+dqXvzZnajhxDP4P9zH0+RAzE6J2uZ9qt
         /E8NVeTfnLfRcjXHnmXSKOT9ZB7mJ0MXaH45XRp21MgHzWiN2cc8s0haf6yZ+qLZp/vq
         NSOjf+RuioyfQ2+Xn5PDerxPsbsqGyGCYiFLADo7+85NlBGgFUkSoHAdc2Wp0oVTg/PY
         7e+ycyZ9CrxaCgsogoAd/vRXnHpP9MWrGlRH+NKk8ZvspDNk9gfv1D5sBZfASWUhrUg9
         1KfHVHpgQWBXpTlpkDBgUjTILDbc1xbzpSkjCe9vc90X5ju5xpbQ97uPm5N1jgpCdyxz
         aoMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RYE6asm8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a0562140da200b00623857fabfbsi2256795qvh.196.2023.06.03.06.24.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jun 2023 06:24:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RYE6asm8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5REV-0006ed-FQ; Sat, 03 Jun 2023 09:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1q5RES-0006dO-LR; Sat, 03 Jun 2023 09:23:49 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1q5REQ-0007up-3T; Sat, 03 Jun 2023 09:23:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3444F612E3;
 Sat,  3 Jun 2023 13:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98687C433EF;
 Sat,  3 Jun 2023 13:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685798622;
 bh=BFVBGD7v6rh2/5Za+ZsV7xHljLaz5IJIwT+zG8uh4Kw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RYE6asm8CZ4DytSlyqmRWEcsLeBxcKqu9Ta8lvh6ZPeA4+bOLHfAHdBpSVO4nej+k
 JZ6b+3ia8xpfcyH6uNh/8MigDDU6VDhaZjEjjv8BrzrUz1MAaskRLr5IaK4/byJN9X
 zny0w612ddbecGqInVcJ0YfQGJsKO1ARz53+O262hu0iFERQhZALHMewh6S3FOqn/P
 jt9AA5zCbK+TWDPLAQ1xBO7H0x7hM9EfCOXKo6b57Ls/yPoxAeuaiDc0L+H+CCKVVe
 GxA39gqutg2E3OM/+tndACykAYRfuoe3M6jMv6yN8Jj1dZsVYKxikbPgCmYFcGGm0p
 3GXVa4v8a3tyw==
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-4f4db9987f8so5372006e87.1; 
 Sat, 03 Jun 2023 06:23:42 -0700 (PDT)
X-Gm-Message-State: AC+VfDxk/mWP87XyT1xxdJRo743nhmEQj1bMWbhd9+byj5Y4UkgfzCxm
 voN3joCk1qfQWHnOo4sSab8XSfLiaD165h7mrIc=
X-Received: by 2002:a05:6512:b96:b0:4f6:19c3:da30 with SMTP id
 b22-20020a0565120b9600b004f619c3da30mr584745lfv.29.1685798620608; Sat, 03 Jun
 2023 06:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 3 Jun 2023 15:23:29 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHp7QHftNw6t3ww8wgL9rAUHEauS0S04d=Rfey7EO3bcg@mail.gmail.com>
Message-ID: <CAMj1kXHp7QHftNw6t3ww8wgL9rAUHEauS0S04d=Rfey7EO3bcg@mail.gmail.com>
Subject: Re: [PATCH 00/35] crypto: Provide aes-round.h and host accel
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ardb@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.157,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: rN8L5XZ96Viu

On Sat, 3 Jun 2023 at 04:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Inspired by Ard Biesheuvel's RFC patches for accelerating AES
> under emulation, provide a set of primitives that maps between
> the guest and host fragments.
>
> There is a small guest correctness test case.
>
> I think the end result is quite a bit cleaner, since the logic
> is now centralized, rather than spread across 4 different guests.
>
> Further work could clean up crypto/aes.c itself to use these
> instead of the tables directly.  I'm sure that's just an ultimate
> fallback when an appropriate system library is not available, and
> so not terribly important, but it could still significantly reduce
> the amount of code we carry.
>
> I would imagine structuring a polynomial multiplication header
> in a similar way.  There are 4 or 5 versions of those spread across
> the different guests.
>
> Anyway, please review.
>
>
> r~
>
>
> Richard Henderson (35):
>   tests/multiarch: Add test-aes
>   target/arm: Move aesmc and aesimc tables to crypto/aes.c
>   crypto/aes: Add constants for ShiftRows, InvShiftRows
>   crypto: Add aesenc_SB_SR
>   target/i386: Use aesenc_SB_SR
>   target/arm: Demultiplex AESE and AESMC
>   target/arm: Use aesenc_SB_SR
>   target/ppc: Use aesenc_SB_SR
>   target/riscv: Use aesenc_SB_SR
>   crypto: Add aesdec_ISB_ISR
>   target/i386: Use aesdec_ISB_ISR
>   target/arm: Use aesdec_ISB_ISR
>   target/ppc: Use aesdec_ISB_ISR
>   target/riscv: Use aesdec_ISB_ISR
>   crypto: Add aesenc_MC
>   target/arm: Use aesenc_MC
>   crypto: Add aesdec_IMC
>   target/i386: Use aesdec_IMC
>   target/arm: Use aesdec_IMC
>   target/riscv: Use aesdec_IMC
>   crypto: Add aesenc_SB_SR_MC_AK
>   target/i386: Use aesenc_SB_SR_MC_AK
>   target/ppc: Use aesenc_SB_SR_MC_AK
>   target/riscv: Use aesenc_SB_SR_MC_AK
>   crypto: Add aesdec_ISB_ISR_IMC_AK
>   target/i386: Use aesdec_ISB_ISR_IMC_AK
>   target/riscv: Use aesdec_ISB_ISR_IMC_AK
>   crypto: Add aesdec_ISB_ISR_AK_IMC
>   target/ppc: Use aesdec_ISB_ISR_AK_IMC
>   host/include/i386: Implement aes-round.h
>   host/include/aarch64: Implement aes-round.h
>   crypto: Remove AES_shifts, AES_ishifts
>   crypto: Implement aesdec_IMC with AES_imc_rot
>   crypto: Remove AES_imc
>   crypto: Unexport AES_*_rot, AES_TeN, AES_TdN
>

This is looking very good - it is clearly a much better abstraction
than what I proposed, and I'd expect the performance boost to be the
same.
