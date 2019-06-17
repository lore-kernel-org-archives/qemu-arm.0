Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2564463wrg;
        Mon, 17 Jun 2019 07:24:22 -0700 (PDT)
X-Received: by 2002:aca:4e16:: with SMTP id c22mr10031750oib.161.1560781462505;
        Mon, 17 Jun 2019 07:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560781462; cv=none;
        d=google.com; s=arc-20160816;
        b=pRIZz5Jcwmxn8fOgdl0vrUVZiOdhhaS7bMVdtX2cY/bV58uhJACvDaF+oymldKrlxw
         3jJLL+R1rnihRaUsPDo6BVhFmhngkRWDm9goUd1zntGsAvnaxJmEbF4TnbWQNLiIU1qm
         6MAoCLmOTVF79xIRo/ALY/0KBgD5vMd61oLDRFkAqQlLtu8VCtJ9neYE4DJuN+OQPGKx
         Y6Fk3VNyCm3JGoAEkQcbHSxRc2IgunK7jKfimESWwYZVFEcBKUK4c5KKljAuR9Qmng5x
         6GY/1w5OuYbiqw/eyIJfAcy8tg78z21AVR5tV6UnXGiNspY1MuZTl1rVrD1dHdr4JDqh
         IB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kYY3Tw0knPndtwsiDs1GZv4xECoZtAkY0sOXh9IHHK4=;
        b=UP8TD0piXs8zn31ZZpXKdznLGnTwcwbf6oho1g8Hd5S1BDZ9fek4a1kcUS8il35+gn
         IFINwD+G/FLzyf7ou9WnsLOk8WeZrZHLCAZhLdPaVsxjKmQFRjImKi4aMiVB6PRppxN4
         bfIApJbI+3eUPAjC/MhMqtsLss5b/NMd9dC/K40zvLqP04RoHT29FwZ2NGZjAHQby1YS
         jTitDhAxEnidcU4zSOC8b7TGWQCvXu1W8Va1va54qA+Saiv9w9dVL2l/m+ehuKRC6kmU
         GEcga5PplpMKfMl2jUJjtDwbc4W/tGWg8jcRoJkVUeEos/MPwlRPUG46mkfsTEaINoIm
         7+pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k2zdRneN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o5sor5432270otk.83.2019.06.17.07.24.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Jun 2019 07:24:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k2zdRneN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kYY3Tw0knPndtwsiDs1GZv4xECoZtAkY0sOXh9IHHK4=;
        b=k2zdRneNP0ekAEEFBu9nnSX++rzyKcpbt14h44/F9MhnYIHnOjJagMnRe95s41Hcwm
         edUFHiGUZ4Tr2QNXX/8T2PWMflv0ENbj6HXWzJKfaB8hFagIkr12IA3h9RWFiYFrTlO2
         OUZ3sNOrtfCOl3xEzR7GPTjov4yL7JS0b2q3r3yAH+m2Z7YlIwKb5XzmjpYVSNnb82xr
         HflN7kI2NIJBmpuHIOPm4k12+C/iuhP2BFL/aFlVtAmvf6E5Tlcqp/ixaY2H71Q4JLEo
         DqAe7nPTZphG6O/g/xygAQHa+VjfaKdoBhfT/5mZH3qYenJmmQXE1qGwVtmr0Wa3IPXZ
         jKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kYY3Tw0knPndtwsiDs1GZv4xECoZtAkY0sOXh9IHHK4=;
        b=lzblOVgGAmqEephSWla0cqm5G0opIHf0Ou/GqqcUpGwS0jr3VJM84qv8vki/IzVQ96
         6RBV7pATMWsrP3uQl/RxKHin/68XO1e7keN8kqUPDlgvgZjwSpJKm6SLnplsuPnUf1Lf
         elftZ3F+gRkEK62QXM4R8dhrNLu3xk3TG+nAqp+OK3bq8Wz3BfWQkcaI0iCXrpTYJNfA
         hKsJTnY41pl0FKHSYrGegmkDYlZFGOrIyryG7/t6FqhX9WS8VpMJ5U3CZeRJlG6hxxdk
         b3RshV+0hNxh0a+LkmGM0Pu7wwX1PYmYQd0i7J33rwd6iERzJwHTnA6HZwnbUEPUmS3X
         OhJA==
X-Gm-Message-State: APjAAAWCeivTuCOylfD4Ljk8Wyae9nbgyUB9tpYlPP4RUb9KG5SltPk3
	iBbPrkZG7cRj9UtZ8jiY9zsKR5rtOOz7BLiZ3DlUf9gx2am/cw==
X-Google-Smtp-Source: APXvYqz7MitrTuYEj2jv9GbEXdWCc9OwvUkb19zHfPFq5PsjBHOLVapwbzNSCTln5o6ndNeSGGgwrc/e3wuDwjbqhRY=
X-Received: by 2002:a9d:d17:: with SMTP id 23mr57708179oti.221.1560781462050;
 Mon, 17 Jun 2019 07:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190613143741.15128-1-peter.maydell@linaro.org> <724331ba-44ee-c37c-e22b-452b6f25ee7b@linaro.org>
In-Reply-To: <724331ba-44ee-c37c-e22b-452b6f25ee7b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Jun 2019 15:24:10 +0100
Message-ID: <CAFEAcA_D_Eyg2fjhcfWYwMhHSVCY5-gr1hJDn+kWBTK=gz-LTA@mail.gmail.com>
Subject: Re: [RISU PATCH] arm.risu: Avoid VTRN with Vd == Vm
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: REIud1p2qCYw

On Thu, 13 Jun 2019 at 22:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/13/19 7:37 AM, Peter Maydell wrote:
> > The AArch32 VTRN instruction is specified to give an UNKNOWN
> > result if Vd and Vm are the same register; avoid generating
> > this in risu output, as we already do for VUZP and VZIP.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Alex: this pattern error is why we don't pass your
> > testcases/aarch32-all/insn_VTRN__INC.risu.bin when compared
> > with a real Cortex-A7. You probably want to update that.
> >
> >  arm.risu | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied to risu master, thanks.

-- PMM
