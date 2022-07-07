Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp5383062lft;
        Thu, 7 Jul 2022 03:40:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s+CWlrL+y41v3C+sqx29Rez4hpioXn2uE2NCEKBRg90Du7phe/tJw0JPMSRGR1+z2cv+mE
X-Received: by 2002:a05:622a:1741:b0:31d:4ab9:1661 with SMTP id l1-20020a05622a174100b0031d4ab91661mr17560286qtk.579.1657190456377;
        Thu, 07 Jul 2022 03:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657190456; cv=none;
        d=google.com; s=arc-20160816;
        b=miz3w3cS5DL+4VxS7BN+jD3viEI8eDSfLOYLdKGZhR5OwyyTR4zKpNWks8fE0bG3H8
         6QUm5yCAiP9gllpK317RBm/fe1jiIy76TjtAyMw/UOS3LFm37StlX4Q9CGvZUDR+xDtD
         hZka/oZ4i4MUo8aJ5P2tKgk1fkvDDDcv2rXv7987fJQoD4bOhreHuYWL/gZTI9iVIQ/x
         vQ+EKZQwl6AXCtaQrh5yC/Nm1EVvBToY/CpZiKp40kkLfvEgUE3tXNWum9TbAIAaea6X
         xgL4MsPPYSUDLMGbosNuoBU7aLVobSMpAjqHMwHXRmQnls7CIo/5KXbxYLy6jxmRya57
         RYyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=iD+eivutk7qi0SX2Kl41yHBz2QZRF4PphcnacanuUlI=;
        b=Zz/jWbASoRl6zr5DyhVZI63Gtb5NoMoe6y+PcS8JG6aizMdsO0o0Dgj36b93RSAOEM
         H3c0g+b5btihgFzCzBkMuMQ6qTxt00cm9kiMoysjVMdiSPz0BpYjFsYmfHpAKPpmIP0H
         oSdDg5ICcvoP2bbByqJEv97fiOJU4Fpl+rd3Zazl870d18o8hZaLD5K5xRGp3DWpn78O
         45H8LnJ4cEELbhGUx3ai3lrsfbTjK4vV6ZoVZwihqimTuxlGe9IQUyueHZsunDSWQzMF
         dttv4i71Xq8jBfnN1wGBtOzX6A2eB/Ab246AYMiW0wRysSjOdzr+UMcjIPmibmiSdNAV
         eb2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KtakJlUy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x24-20020a05620a0b5800b006b279468e7asi9126726qkg.329.2022.07.07.03.40.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jul 2022 03:40:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KtakJlUy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9OwJ-0004iH-Rk
	for alex.bennee@linaro.org; Thu, 07 Jul 2022 06:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Ovv-0004hi-0f
 for qemu-arm@nongnu.org; Thu, 07 Jul 2022 06:40:31 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:40828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Ovm-0007y3-Sb
 for qemu-arm@nongnu.org; Thu, 07 Jul 2022 06:40:24 -0400
Received: by mail-yb1-xb32.google.com with SMTP id p129so2026844yba.7
 for <qemu-arm@nongnu.org>; Thu, 07 Jul 2022 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iD+eivutk7qi0SX2Kl41yHBz2QZRF4PphcnacanuUlI=;
 b=KtakJlUySKgdc20QOlLoC8drBseblmB2GMH4MU+iYK/PaxNvhwd2T6c/inEiv/Biv0
 d5hiIELjH9Ogg55TX+lfaNEcajLuV89FtXSaWmcsggJT7b91upREkD/HzP7lY/4jCJ5Q
 Ot9LZTcSRIx9LxJtyli8YwlM9oObzAYWTUmyNYYV7mRm9+UTSkv+hZyRKSoRmRUSt4Gg
 a/tNffOcC0wzshtHv0udSxSWHmXjwqsQnGD1v1mHy74Yh1sbHFEAwtGOm21Qmtv8/L2D
 pKZREXxmayNJkM6YryR4+hUZUNQg0Fg/Y+rhyKOOv83Hq7mcZDeGm44gtE5/MzPbKDbF
 8YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iD+eivutk7qi0SX2Kl41yHBz2QZRF4PphcnacanuUlI=;
 b=IwYx8zFy3JoBdE4lQUWa1wFaXToLMesUhEZ5FKjMf+QoggR2NBjZgzBGyxNoYRX5A3
 v3jgoXPpXfzTjVHZYFld3ZfDC4pswS5HOeYvz85aOmc0oopUhO+b7FuzVAPeI1IwOSwj
 9DtkqIs83LdcIDS5J2qfPDEZvdMH9w4Oil1TbgUkZdHYZMoey84Rj3GDQ/ArLCLcErFO
 3Xom3mYSPs8+1EL/vfzpvYeA6MgmQtyVEbMo4KLDQfgadw7eNTQ8fdmatJVqnM4cw/bm
 kc/CI02uMJDs3juzkMlHFfNicj4/wyM81gez1aj3taGllN33AF3J8nWow+nSCfsU9BXA
 G7ZQ==
X-Gm-Message-State: AJIora/C+UyzwwqzwtpH+WdIicUH9xUoY7sjJS1HTjUHTc62CztTihUz
 4c9VCKOcXJBcuS0Qns/tuCGK7mcrbfV4m/yWFPgkVsBZOnw=
X-Received: by 2002:a5b:e87:0:b0:66d:4669:9871 with SMTP id
 z7-20020a5b0e87000000b0066d46699871mr48860795ybr.288.1657190421780; Thu, 07
 Jul 2022 03:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220628154724.3297442-1-peter.maydell@linaro.org>
In-Reply-To: <20220628154724.3297442-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jul 2022 11:39:43 +0100
Message-ID: <CAFEAcA9jfgD22J3ENYw0GWyNYk57F5G4SgSgQVaeq3a0Zjkr4g@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/armv7m_nvic: ICPRn must not unpend an IRQ that is
 being held high
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Igor_Kotrasi=C5=84ski?= <i.kotrasinsk@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UL0iOJya7Rnv

Ping for code review, please?

thanks
-- PMM

On Tue, 28 Jun 2022 at 16:47, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> In the M-profile Arm ARM, rule R_CVJS defines when an interrupt should
> be set to the Pending state:
>  A) when the input line is high and the interrupt is not Active
>  B) when the input line transitions from low to high and the interrupt
>     is Active
> (Note that the first of these is an ongoing condition, and the
> second is a point-in-time event.)
>
> This can be rephrased as:
>  1 when the line goes from low to high, set Pending
>  2 when Active goes from 1 to 0, if line is high then set Pending
>  3 ignore attempts to clear Pending when the line is high
>    and Active is 0
>
> where 1 covers both B and one of the "transition into condition A"
> cases, 2 deals with the other "transition into condition A"
> possibility, and 3 is "don't drop Pending if we're already in
> condition A".  Transitions out of condition A don't affect Pending
> state.
>
> We handle case 1 in set_irq_level(). For an interrupt (as opposed
> to other kinds of exception) the only place where we clear Active
> is in armv7m_nvic_complete_irq(), where we handle case 2 by
> checking for whether we need to re-pend the exception. For case 3,
> the only places where we clear Pending state on an interrupt are in
> armv7m_nvic_acknowledge_irq() (where we are setting Active so it
> doesn't count) and for writes to NVIC_CPSRn.
>
> It is the "write to NVIC_ICPRn" case that we missed: we must ignore
> this if the input line is high and the interrupt is not Active.
> (This required behaviour is differently and perhaps more clearly
> stated in the v7M Arm ARM, which has pseudocode in section B3.4.1
> that implies it.)
>
> Reported-by: Igor Kotrasi=C5=84ski <i.kotrasinsk@samsung.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Simple change, commit message long because I included all
> the analysis that we haven't forgotten any other cases.
> This is essentially the change Igor suggested in the qemu-arm
> thread, but it took me a while to find time to audit the code
> to confirm that was the only change we needed here.
> ---
>  hw/intc/armv7m_nvic.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 13df002ce4d..1f7763964c3 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2389,8 +2389,15 @@ static MemTxResult nvic_sysreg_write(void *opaque,=
 hwaddr addr,
>          startvec =3D 8 * (offset - 0x280) + NVIC_FIRST_IRQ; /* vector # =
*/
>
>          for (i =3D 0, end =3D size * 8; i < end && startvec + i < s->num=
_irq; i++) {
> +            /*
> +             * Note that if the input line is still held high and the in=
terrupt
> +             * is not active then rule R_CVJS requires that the Pending =
state
> +             * remains set; in that case we mustn't let it be cleared.
> +             */
>              if (value & (1 << i) &&
> -                (attrs.secure || s->itns[startvec + i])) {
> +                (attrs.secure || s->itns[startvec + i]) &&
> +                !(setval =3D=3D 0 && s->vectors[startvec + i].level &&
> +                  !s->vectors[startvec + i].active)) {
>                  s->vectors[startvec + i].pending =3D setval;
>              }
>          }
> --
> 2.25.1
