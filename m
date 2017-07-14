Received: by 10.25.44.15 with SMTP id s15csp889199lfs;
        Fri, 14 Jul 2017 05:50:14 -0700 (PDT)
X-Received: by 10.28.1.65 with SMTP id 62mr2651867wmb.100.1500036614506;
        Fri, 14 Jul 2017 05:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500036614; cv=none;
        d=google.com; s=arc-20160816;
        b=sWEgrGOLwza4PucDXp7+J95Ur9ruGKWK7XuHSYZvCQtstypDiIdIMfJCJ+jiUHB1+t
         ylnZfxh2KMh24SiB8kgKMujLZ82muFy9/sAhyq/jKprdb0H3CyoDg/xoCxpYVZ1Qpwf0
         FvGay8t2Vb2HcFF1fkkiE5Lanz9EXq75OExeYAB/NIRQaLz9LmI/xjKRptY/qQn1BWvP
         opx/TXmcSw3gAESZIyZK/xGgGP9I5Wu5K0cOMQ23vMdl4UEqpxqHIVp/QyzPqfnMrlB9
         Ys5jAawRgn6Ua1oDwZFFxWjarRGdVpYTvT1m5tW+R4DZNa56u0FrxRDB/wNWC067Kt7U
         0Kcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=PQ/X9RHw8eD0rvaO9qkxGzPWmNfABIN+rumcFcH5L0k=;
        b=knJZgX1Kk+STqBAykQbRW4n4Tp6X/4Ca03p+9+T9SQeOtrNSSsSMDZAyq8J77+cewH
         jkNyQ6AaCGcvZblqEtn/PE5a4TUM8BZDJS6ge4TtWUNLlseliwjSNnOs9HiHGqzNUdEL
         +em4Y+iDUublu9htDmK2V2EsLx7pgVvY+yqCzZGtAhZmB1NLnHPyHpx2WuoEzodOW/nZ
         IJ4g8xfJk53LGIO5UaQC2RP9GH1piboEquilNsHpjWN0UFW2EYwhFw+SD6dd7pITUcQM
         tsvdsjfvxBq9TcR/yrCpqpvDYYPsOUey/CLjAAse4YKpPyk9yUbdQQdFJquBjPGIVIzQ
         AJHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=iKq6s7a4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22e as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x22e.google.com (mail-wm0-x22e.google.com. [2a00:1450:400c:c09::22e])
        by mx.google.com with ESMTPS id r15si6222579wrr.99.2017.07.14.05.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2017 05:50:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22e as permitted sender) client-ip=2a00:1450:400c:c09::22e;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=iKq6s7a4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22e as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x22e.google.com with SMTP id 62so19663767wmw.1
        for <alex.bennee@linaro.org>; Fri, 14 Jul 2017 05:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PQ/X9RHw8eD0rvaO9qkxGzPWmNfABIN+rumcFcH5L0k=;
        b=iKq6s7a42F8OKO+oNj1TPlehLAX3tE4LBe8UySUCjKlAn34F1dUq/S+G+RcMGW3324
         M0zAMoRiTMgJpKDZcPH6qP+PYXYN9Cx0NP7+pFt+NVq/gd0mcI3p0wVACgVlXsZ2/fKH
         WE3+HFIJx23GG4ZPrmpc2te+LWLk5FDKwNtCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PQ/X9RHw8eD0rvaO9qkxGzPWmNfABIN+rumcFcH5L0k=;
        b=b+VTAck3+T3cw6RbjHrEHm1pMvHsB/h0+JAdc8Y5GhAJfEh7UYZ0wCtrFYzNZmo5/W
         LB890E8wGBSAxf1hE6Ak/vNK0TVimY6hDTw7PotPE+HNubrpZf/O1VyUqOl14rNEwzUy
         FGUHaqs8v/MQp2i7qziyvM9gRUsYe8ZBixHYMfTG1Gbb3RiUYhGU1R8LZruvBeUUder5
         E7Cnc5rodR0iMBomqrK00W7+IvbV/PL3uJMtKvlJal1TZ/K6X6R30UywMKm6UzvJQRwF
         Ah+488ttpe6SRWsOFVNyd7R3PgPa8r2mkWvak38iJ2v03WnPzpl9KIprjScBm770phDA
         e9VQ==
X-Gm-Message-State: AIVw111Maa1DVpZTZmhmtUIYJLnCXkLy88i/Pb+ND/lmHIKoEJJBWc23
	euQB+9cRKqB4rRQbYQybFIw6FFFx09/abWi18g==
X-Received: by 10.28.126.87 with SMTP id z84mr2717334wmc.65.1500036613953;
 Fri, 14 Jul 2017 05:50:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 14 Jul 2017 05:49:53 -0700 (PDT)
In-Reply-To: <20170713141928.25419-6-alex.bennee@linaro.org>
References: <20170713141928.25419-1-alex.bennee@linaro.org> <20170713141928.25419-6-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jul 2017 13:49:53 +0100
Message-ID: <CAFEAcA8o4rU7BXR_+VEQhAXBSzJ7usAnkYXDb=CEqQ=duuirqA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] target/arm: use gen_goto_tb for ISB handling
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: OQU4h0Jjozjm

On 13 July 2017 at 15:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> While an ISB will ensure any raised IRQs happen on the next
> instruction it doesn't cause any to get raised by itself. We can
> therefor use a simple tb exit for ISB instructions and rely on the
> exit_request check at the top of each TB to deal with exiting if
> needed.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
> ---
>  target/arm/translate-a64.c | 2 +-
>  target/arm/translate.c     | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 66139b6046..2ac565eb10 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1393,7 +1393,7 @@ static void handle_sync(DisasContext *s, uint32_t i=
nsn,
>           * a self-modified code correctly and also to take
>           * any pending interrupts immediately.
>           */
> -        s->is_jmp =3D DISAS_UPDATE;
> +        gen_goto_tb(s, 0, s->pc);
>          return;
>      default:
>          unallocated_encoding(s);
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 493a7b424a..d8892d9ba5 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -8168,7 +8168,7 @@ static void disas_arm_insn(DisasContext *s, unsigne=
d int insn)
>                   * self-modifying code correctly and also to take
>                   * any pending interrupts immediately.
>                   */
> -                gen_lookup_tb(s);
> +                gen_goto_tb(s, 0, s->pc & ~1);
>                  return;
>              default:
>                  goto illegal_op;
> @@ -10561,7 +10561,7 @@ static int disas_thumb2_insn(CPUARMState *env, Di=
sasContext *s, uint16_t insn_hw
>                               * and also to take any pending interrupts
>                               * immediately.
>                               */
> -                            gen_lookup_tb(s);
> +                            gen_goto_tb(s, 0, s->pc & ~1);
>                              break;
>                          default:
>                              goto illegal_op;

Why do we need to clear the low bit of s->pc for ISB?
s->pc is the actual PC, not the "PC and low bit indicates
Thumb mode" form that jump addresses have.

thanks
-- PMM
