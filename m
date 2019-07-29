Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3193407wrv;
        Mon, 29 Jul 2019 07:05:17 -0700 (PDT)
X-Received: by 2002:aca:cf0f:: with SMTP id f15mr1007822oig.169.1564409117103;
        Mon, 29 Jul 2019 07:05:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564409117; cv=none;
        d=google.com; s=arc-20160816;
        b=D0aSKGyP3WDbGpiN1qRjOzOoA+4I6Pg4JPHtZOIRimxIQUWz0W/WlgoiuwxeJ87d23
         Nx/8v5634P7Zx4Y6RQj75xM4HQkrqFAYdI5doenC7+gipfgWmL6zFGPnMzk1ZzlktN/q
         sVhZCETtkdMn16Mb1m54v074ji7quxonXcRNDFzVMX1+J93yt4aGUU9EDo7Xrk+boVqp
         emNV56evpnrAIo7xdAHTbhfQcqYN5B2K7H3ZxGc9ktea2ad6whCS171TpJzyJyUnPGSv
         qR7eE0JG5gOSspGu7nySCdJDvLAX29aRIxOsLTx1HCaysn9yA1KjZpxEw7tdXTOjR+MO
         WgeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=USX6y8+1fsXPlwx9uOCSISQRlydjOW3x000APgYHOHY=;
        b=uP0Y/BMXxMe59YiPnDQjWbtxLLgAC0Th4ByAWcfAVqvUqqXvwm1vfYsoUb9LKbH7uP
         iGhQF1tIuPyciv7XpIY3nImM9wxZqJzkWMMQeMd+bmlBJhhLfwHloSDPiENGvRNgbyvA
         cMdQvYVb/BAnP1i2Lnm8D3QeCHZReBuZahrIBGhxYoite/eg6PipcokWtN9S3GDUFvjK
         BnEWS8qsCsc4x/flvxxeqFUM9LDEyvD2+kD9L50t/32i5HmZYyXoC9SKX6bkCxzE1ZFP
         69v4r3ex9gZJmkWBcXv4clSFqFMkP8O0jPcdvtUqRi6TfV9LoqdsQ2FEjGwwHe62dwPM
         uXWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UzebcQ5B;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u4sor28049896oic.49.2019.07.29.07.05.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 07:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UzebcQ5B;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=USX6y8+1fsXPlwx9uOCSISQRlydjOW3x000APgYHOHY=;
        b=UzebcQ5BPjIKHmFrsqS4kZb7gWxpB0U0A/8pT2vT5RtKJifEgrRjby9litqO3PTOo2
         r4wz6HE8Vs+dwPLoX/xkdImJY/JQbH8Npbri6I3UzG5nmm9z69eJOVWh9dufmHbOHDwp
         YTUBWkGlgN/lLGrUGHJANOEerq4MXjM4pppzP7JfFYRtn1JCaR1k2RXitJMcEC71lEbt
         I7/DRGgIDh5IjDLrCkyyZ2sFBP0Y+40nWtsAwQdUwIvspnZB5v6/1kBB90C/5g1jXrJB
         NibXDDXXXAHulfFGjvILs0DQHsgW5+rtrpcnqy3e9+p9OdF3nnuOWw6nyahVUgylNl3C
         jRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=USX6y8+1fsXPlwx9uOCSISQRlydjOW3x000APgYHOHY=;
        b=pU166pJNtQOuRfGu6JfF6a8qI7jKWeSvp4zKxTG7MgOlgq+P1EflqTKl4et5jDvWFZ
         mPBKyXF8J4QxLZST5iVBj5G/oFuZEFNjCavrlCJWdlhRIU/4hyVrkpnKwKd9qdkVMTEe
         ZwYraN7PpRxUdyqBD7TUsex6bKrj9KxWKWzRxPsJxHK3Ki51Ws4iG0SzXO2e6+Flvlhh
         WSZZwBJuvxIzwb4uauiz8BG1VC7aYH/0UwzeDM5X6/dzD4bpsKOfKigrFtgOBjKlxakH
         lufLKtE0djpqVpjH/yH/V8wWEEI1otVGurt2U2y2/k7sv4Ymeym2HQaNoTlMhLRCHaHK
         qpCA==
X-Gm-Message-State: APjAAAVSV8YtgLN8ywrYQOQwtvorhqaLuYUJNCi2pbbjWVPDrMk6luYB
	PqBC/X+b6PiJFdZe6G9yAd3/bbuOqfGc5zY+7lpESc5h4mI=
X-Google-Smtp-Source: APXvYqz0IdKAfVjqUVPP4+n2JcQrQ1t0ugQpGM3Ak8HNssMq2qiPgkmGP0MVrFS0P/3DeziFDdbl1269BepFrF58FKs=
X-Received: by 2002:aca:6185:: with SMTP id v127mr55702001oib.163.1564409116669;
 Mon, 29 Jul 2019 07:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-7-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 15:05:05 +0100
Message-ID: <CAFEAcA_kmuX6bxR50eU_3nTdRcjON2nVTqVWiRamSRe6jui3ig@mail.gmail.com>
Subject: Re: [PATCH 06/67] target/arm: Introduce pc_read
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: /OmXUJ7et/Au

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We currently have 3 different ways of computing the architectural
> value of "PC" as seen in the ARM ARM.
>
> The value of s->pc has been incremented past the current insn,
> but that is all.  Thus for a32, PC = s->pc + 4; for t32, PC = s->pc;
> for t16, PC = s->pc + 2.  These differing computations make it
> impossible at present to unify the various code paths.
>
> Let s->pc_read hold the architectural value of PC for all cases.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h | 10 ++++++++
>  target/arm/translate.c | 53 ++++++++++++++++++------------------------
>  2 files changed, 32 insertions(+), 31 deletions(-)
>
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index a20f6e2056..2dfdd8ca66 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -9,7 +9,17 @@ typedef struct DisasContext {
>      DisasContextBase base;
>      const ARMISARegisters *isar;
>
> +    /*
> +     * Summary of the various values for "PC":
> +     * base.pc_next -- the start of the current insn
> +     * pc           -- the start of the next insn

These are confusingly named -- logically "pc_next" ought to
be the PC of the next instruction and "pc" ought to be
that of the current one...

> +     * pc_read      -- the value for "PC" in the ARM ARM;

nit: this line should end with a colon, rather than a semicolon

> +     *                 in arm mode, the current insn + 8;
> +     *                 in thumb mode, the current insn + 4;
> +     *                 in aa64 mode, unused.
> +     */
>      target_ulong pc;
> +    target_ulong pc_read;
>      target_ulong page_start;
>      uint32_t insn;

Why target_ulong rather than uint32_t, given this is
aarch32 only?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
