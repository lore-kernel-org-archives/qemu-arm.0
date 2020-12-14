Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2441687lfq;
        Mon, 14 Dec 2020 02:50:25 -0800 (PST)
X-Received: by 2002:a25:f02:: with SMTP id 2mr34290277ybp.500.1607943025793;
        Mon, 14 Dec 2020 02:50:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607943025; cv=none;
        d=google.com; s=arc-20160816;
        b=k98FViKgGvshoX7ZrL78robare05pvoNVa/RuIyK84JbKzfBDUvPYdkAKyMgvHMYL2
         wpQKmQjJ6syXijPIEUvIYseHG+BNYn5j7jUAtXRYYC37ZGOVsz9HbJ7b0lKFm+xauFEa
         Sp1oI0IBPEGxRZjtWcyC97+g2//pVfjXAkq9WsntC5i81458vzYOBIi3XTz8KyMDOPKG
         lHuXa5e9TQLqStJ949gV1Wff4Q8fbxNhTLJW4hdflFTHi3yw29/1xmw3n6B6w3gn06Ai
         df5h1DO8xdmU772AE+5ABe/edqBkeRkcnUnuSnxzKZSvyOWsl7pDVFSQPcBExzGPBKgn
         SSjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QDgZVY58aLyD5HIGLPbMlPWcP3kifFv5cJTTi2Ph5sQ=;
        b=bNLhphnvHDnJKVKmh3nniUyER35Rwi7dNDmlQBvmc4Qqe/VLGJBAWCqZVyHsF/tFYY
         f5ttGaE0Goj3YrcsHvZSyynry4MXAtom95a22qFYy7sgc4wBHn/ffCU1b7ZlzpWFkck1
         FwvWI6IUYzy10DWOFRBLDcqhAQ/2REh4U6Of+eeNeE22ZAphRnVFf0wRjIi8nc2r3MBL
         wNsWjpcz7AfiTUoREP39WdUmio59FtcvgOIUFz9sPcvr9DfM8qKpjc3kuAkAcuUlbfid
         WJvKWuQLBcm38A8AD6ZoloRGM5aBVGF099R6Z3k5FlyE8zyPs3+u9FdKegaGIOoMbgXP
         bjlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=r29MVWD1;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b185sor831692ybh.157.2020.12.14.02.50.25
        (Google Transport Security);
        Mon, 14 Dec 2020 02:50:25 -0800 (PST)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=r29MVWD1;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QDgZVY58aLyD5HIGLPbMlPWcP3kifFv5cJTTi2Ph5sQ=;
        b=r29MVWD1Vt6xdBQytcEIPAzxH+M43NZKYmVrPSyQeguYQmAx9DROxu0SQ4Kj2d5wZ1
         FD1pF5ZmBG8FTzIZt/Lwpb+4stsItZ5lPZW87eWumPmIQyRkaZ0g3uEwirX3jQQ+zMg5
         te+OXyq/x1SSNpcw+fu3DIgLtNIgBGATzYEQ9nGtJQ3JM8zmb1KFwuAuxd73M0+csfTr
         6jYTZll7RKaFc3ODkAFB0pjwQVFDVDOcLa2pLQ59osPdaOExLfYrPJnCgjKcWiYdbxVF
         IqgNXvn9GgEiA791jhmZp7Ch78nX/y4EKqC80sG3WmmffetlkwIhErn0NVpYzX9Q5D1V
         22DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QDgZVY58aLyD5HIGLPbMlPWcP3kifFv5cJTTi2Ph5sQ=;
        b=Q+iAFAjVRC6Dp0MdsPCGSD791pRkj7fhl81q+/n1ERniHMGjXGhA0k7s7Gt/cu/hzT
         CWXkRdaM+Pk442xprW8a3ny+lIY8oWtzOEoPeSrAe7kgr88T+jrXlnDIir550GRDCZ9X
         9mUHVw5jA/MHkluymSI8Dm1G+qH7PUuJ2JnSClfgEKXPorB8IxSYMEsI8X6OvUsGJok8
         Zui0hDAHchCzqbDMdjKmMoCmD30FGkhFfLGwSnYkCIgAgeXnDWxaSS+7eMuPLMzJWgKq
         Mlasg2K9EnPcLg48wig27BFhXxLtRfEC+I2o4FZUAzmjvIivh0qDjGQhrx4uL/f+P0Lt
         mf0Q==
X-Gm-Message-State: AOAM532aFFfv5DCkqfQRrILYIzuaEOdy2Vakfx1mxR8xCe4gwc1TCATR
	OeJciCvC3Bnn59zKeDDy+BmMCcXMO73t98Fab2rqXgGA
X-Google-Smtp-Source: ABdhPJxou9PPtPrlfXJ0fuD7fd1ruwjGVvddm5LdsHpdn+F7MfdtN36M1LxJYy/kd0o898lP07vRPWQM//u1gRwZ9pc=
X-Received: by 2002:a25:ec5:: with SMTP id 188mr38311006ybo.387.1607943025303;
 Mon, 14 Dec 2020 02:50:25 -0800 (PST)
MIME-Version: 1.0
References: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
 <1607937538-69471-4-git-send-email-bmeng.cn@gmail.com> <878sa0vfc5.fsf@linaro.org>
In-Reply-To: <878sa0vfc5.fsf@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Dec 2020 18:50:14 +0800
Message-ID: <CAEUhbmUY77ZBDtHASDne5yrj0z8qPoz34XYBBP9ndSQ3sujrzw@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, Peter Maydell <peter.maydell@linaro.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: f+01A7ekI4il

On Mon, Dec 14, 2020 at 6:42 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present, when booting U-Boot on QEMU sabrelite, we see:
> >
> >   Net:   Board Net Initialization Failed
> >   No ethernet found.
> >
> > U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
> > U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
> > board, the Ethernet PHY is at address 6. Adjust this by updating the
> > "fec-phy-num" property of the fsl_imx6 SoC object.
> >
> > With this change, U-Boot sees the PHY but complains MAC address:
> >
> >   Net:   using phy at 6
> >   FEC [PRIME]
> >   Error: FEC address not set.
> >
> > This is due to U-Boot tries to read the MAC address from the fuse,
> > which QEMU does not have any valid content filled in. However this
> > does not prevent the Ethernet from working in QEMU. We just need to
> > set up the MAC address later in the U-Boot command shell, by:
> >
> >   =3D> setenv ethaddr 00:11:22:33:44:55
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>

Thanks for the review.

> As you are giving this board some attention is there any chance you
> could be persuaded to add an entry in docs/system/arm (linked from
> docs/system/target-arm.rst) to briefly describe the board and what is
> known to work and boot on it?

Sure, I will try to add something for this board in v2.

Regards,
Bin
