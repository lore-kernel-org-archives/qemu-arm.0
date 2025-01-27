Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2469454njk;
        Mon, 27 Jan 2025 06:20:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWhfA4RJ7Lc6QNL6f+qg9yYMkkIE0JS5WDixWirveG/0syAN3flgDgPiPDSRM7zfnhi4vfPIdO38wOcQA==@linaro.org
X-Google-Smtp-Source: AGHT+IGS9uKm7hol8sDnL3SxQOteifEHv10GKdEgw4vHs1bnA5SBt14XdkxYrd+iobG9HFo0ieyy
X-Received: by 2002:ad4:5c68:0:b0:6d8:aba8:8393 with SMTP id 6a1803df08f44-6e1b2235c2bmr596680206d6.44.1737987637247;
        Mon, 27 Jan 2025 06:20:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737987637; cv=none;
        d=google.com; s=arc-20240605;
        b=jkKMBMAEy0pYhSJgnLjmM5cJPD2PhP6wc/8x/ZG5uoMeWa3ZXYWJFKA5YFE62KCpjI
         G98AHaEisutK9ygl25f1olgyDio5dP6z3ZviN3kvsTxPFbsCKGTJH8O2Uxg6fWBiXhMG
         dDWvoxxiue7vNO0V6zcSS6WWcKg5GDrC2frSpr3IbQrXQinWhCM3mggZcFMzfdP1Fl/5
         kECvQ7eHor60Pdk4xFJ3zpurTfnhsv3dYv+w9Tfw5aTsqsXZ6kbUpfloIy6Oxi0GnTxO
         wp0x6iosjkOa9E001lRFTpRFgpwtwD2WaF/9c2hTSfQUTykVoCfA58HPoJsfzbGa/TTU
         Z9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=6CLGgHNii1ozqng84Wbew/T8Evy/NM7+mE0AjRrB5xk=;
        fh=m/a5oFHe4ydMNE+vMjvYSP/+5PDYiCfVGP5lBqB5RN4=;
        b=QSIpsk+ww1E9RiXCGc9+aqF/bE0iLjYdVAdhA1kh12I+uasSllfsI9JuBj3AHY/P30
         52FArHm/OC2ym/TE/Q/FcpdviL3pTyTFFUjk0Fnes07vp/k6qkVpnLihukUWscJ+fuN5
         rK4UOKrkD6wkVP35G/7IjQpcO/RaD0+5LhhKmJB4QUQ2fXUWJq4T7sW3HPf3D4hnGSbf
         RftTY285k5LlgJor2hJPeBy6zunxZdgw0O+5A2Gbx9PAkUseYSvVgCT5hgBygOv3gUB3
         hYlI7aUZ6xMTnF5ykLzikfF3OhBdMP+mBrHLjytAfk81kzNpZsEVynIwxIk0WR8WoxyZ
         AjZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dTzYlYtB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e20600fe8fsi95373036d6.358.2025.01.27.06.20.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 06:20:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dTzYlYtB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcPxD-0008Vw-OP; Mon, 27 Jan 2025 09:19:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPxC-0008VW-A1
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:19:06 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPxA-0002ON-M9
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:19:06 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e53ef7462b6so6848630276.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 06:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737987543; x=1738592343; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6CLGgHNii1ozqng84Wbew/T8Evy/NM7+mE0AjRrB5xk=;
 b=dTzYlYtBI1UTXNWYKWrucqEccAMkcenEmJLBhE6M004sEfGCGgt0ENhVcbDs7KR4Rh
 R1k0/hJ0Q755g79qXXdASfiNA2Dukq053mgfW8BkEdtJP1TwTbJbMv++Vv/rTai6jEE8
 gQAJNGD2wercOu396hpOF3FF3KwodDvQReB7e19W87ON2XlC28hTPM+QreUYUadfOgxv
 o9Fp/CF7Lv8cZa7TXq+D0FeXOnBRJ6oQR2NIYwZ9/yB3/I7QzuGi8l3bECW926JQwxGv
 BeH1uj8dV7brn2DXr6umMYcAzhhamfSRnsRr1pbb240cCHAu2eVFYTn3vvWbivmccoiF
 +WMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737987543; x=1738592343;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6CLGgHNii1ozqng84Wbew/T8Evy/NM7+mE0AjRrB5xk=;
 b=m2nERUnVJh9r8GA0b+/WwmS7V1ZOJLZ3VnaWSPoy9liZ2y6Q6Fd8ZHE8+kAXj+3idJ
 HR//eCmozuRQKxLnxgcDeeYN+Y/9PY5Q79sA0UdknF5XH0KvUlzTWTMelOxvdlFS9Kc3
 5c+tOIXs3s4sXfkN6B0ouRvRCrYmYZlDE2VHrgshSCmS110fMJVMItUlvXghyWnIAw2k
 bJk3YLkmndSGA8wLAnVtIURV2UJZsrdYzkXVNkL/Qk9x0k2EqpE5+JkuYWnoMI2hjW59
 se+APcbkosWCZtZQkig6iYZaOIIHsFzDlaHEV63zQVcqUCX5/msFmX3g5zT14fkZrXVx
 6NbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7AzYdVUQ0XlqADlTSJpxKH1VoB6DuVuJmB287Xo8VCfUGLCCCjYaEWQ0cJ4bO04ouOW/VTzc5IQ==@nongnu.org
X-Gm-Message-State: AOJu0YwVNuwdPR8IBDRL2HRylxEvJT11ArYP8v1609FpEyndLg42J3v+
 WZnLZ34WZqntaSFA/P8Ox4UFBHcke4J2ypyCx2z+UGpDAJnHXcUe5paIBYIJr6UfkevBN27nAXW
 cjoWt1/81RowCwk6/3vXszJtzPiyRfeKm8kC/lw==
X-Gm-Gg: ASbGncu5utj+Pi0/T5bl5fIQ7RfAQErdx+6TRgef8nYqEpPqZwyBlzyLHtkrtleXeAp
 Aq2JImnKw4gUmNweADq3BeTJsssv6Aic4vnMI4AHqLxJAGlUlY75zJGSdvT8jxy4=
X-Received: by 2002:a05:6902:270a:b0:e4e:4337:68e9 with SMTP id
 3f1490d57ef6-e57b1046ba1mr31958039276.4.1737987543380; Mon, 27 Jan 2025
 06:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20250110160204.74997-1-philmd@linaro.org>
 <20250110160204.74997-9-philmd@linaro.org>
In-Reply-To: <20250110160204.74997-9-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 14:18:51 +0000
X-Gm-Features: AWEUYZn9cgaSR3nCalrAJsa4i3UcG8jczD7kL__v5XWI9iHKvDIgRkisZhzWcg8
Message-ID: <CAFEAcA-+fCQOAqxLxP=G+G15dhoNo4hyd7wbJf57dYpZ8iQhew@mail.gmail.com>
Subject: Re: [PATCH 8/9] hw/arm/stellaris: Only map existing devices as
 unimplemented
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 7uwRRfPbU0R8

On Fri, 10 Jan 2025 at 16:02, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/stellaris.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index d87587225c2..c89522332e2 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1390,11 +1390,21 @@ static void stellaris_init(MachineState *ms, stel=
laris_board_info *board)
>      /* Add dummy regions for the devices we don't implement yet,
>       * so guest accesses don't cause unlogged crashes.
>       */
> -    create_unimplemented_device("PWM", 0x40028000, 0x1000);
> -    create_unimplemented_device("QEI-0", 0x4002c000, 0x1000);
> -    create_unimplemented_device("QEI-1", 0x4002d000, 0x1000);
> -    create_unimplemented_device("analogue-comparator", 0x4003c000, 0x100=
0);
> -    create_unimplemented_device("hibernation", 0x400fc000, 0x1000);
> +    if (DEV_CAP(1, PWM)) {
> +        create_unimplemented_device("PWM", 0x40028000, 0x1000);
> +    }
> +    if (DEV_CAP(2, QEI(0))) {
> +        create_unimplemented_device("QEI-0", 0x4002c000, 0x1000);
> +    }
> +    if (DEV_CAP(2, QEI(0))) {

Should be QEI(1), I guess.

> +        create_unimplemented_device("QEI-1", 0x4002d000, 0x1000);
> +    }
> +    if (DEV_CAP(2, COMP(0))) {
> +        create_unimplemented_device("analogue-comparator", 0x4003c000, 0=
x1000);
> +    }
> +    if (DEV_CAP(1, HIB)) {
> +        create_unimplemented_device("hibernation", 0x400fc000, 0x1000);
> +    }

Again, it would be helpful to flag up the behaviour changes here.
I think:

 * both boards have the PWM bit set : no change
 * both boards have COMP(0) set : no change
 * both boards have HIB set : no change
 * LM3S6965EVB sets QEI(0) and QEI(1), but LM3S811EVB does not:
   so we are (correctly) removing the unimplemented-device regions
   on that board type.

thanks
-- PMM
