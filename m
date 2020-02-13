Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp520309lfp;
        Thu, 13 Feb 2020 04:00:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqyue/G01u95+TwNtswi/xvmBpXKA9clnGrL/XRyqpIkWCXkDtmDyob+j2WzqhCo6S2o+fZ0
X-Received: by 2002:a05:620a:13ab:: with SMTP id m11mr4433370qki.326.1581595221810;
        Thu, 13 Feb 2020 04:00:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581595221; cv=none;
        d=google.com; s=arc-20160816;
        b=MfrmULDk96bvt4wePMyWjB0qnTxoAP8mwcwgwsdxY7Q7acJp+KneWBRQxP4XuM9FId
         RTXj/nTPs79ldTShZ45xK723gxM6Z4b/yAq9wsgjIIeO3jFs01m8OB7a7BaTYnuJEo//
         pV8ZcFuBlusjWHepbEOWuWiMwmFNivlkxaWcVchmb082I6EWNwfBDVNTwTUSAlsFOFfo
         o4mnVuQK3Ir6gEJ3+7E6qSTKLwC/ABKSSIMd1o17gkxX4i/T9V5h8wpq7ayNKzmYxJx3
         n7mwrAGRyMJG0P3rUIPrRISFnFfMH3BRE+6U7poZvdi+6J55dPnp0maFFP4SxRp+GWAv
         cuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ZIUotafDXfUwGtFzakVHbdga+VmjUYxpyzlK5Dq85yg=;
        b=jAjo0zSp5H8NTK/OWKRinEqtyqvs3QtlWWUQwd4lCJ1Nbs3fctAdx4pRWcIFLf573V
         Dy9Kdw86FwdI2tYcB48Tn9iSLgR/KL2V0EYdvhVpKrUbslTfGR3Qifq+9wbhC3q4/5W4
         iviGrjpvM4US+nx9+cH7e8NfUQ9jCOuVwkucNaKidkK6YjSnVZ+ohedUM+s7jSJf3Nej
         8vUlTEGXonpjbMA/lQZzzAcYtPdykhw+sYxkqorxiBcEivjQa4xd6d2Hi0tTYEMryzt5
         gxIqoWeqNb5srmsBPrSH0JiuF5b4drhVBfPK3ELGxBy9+CikY8NFKeB0cWTPqe4j0bhi
         Jb1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VDF0hbxB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r20si821305qvw.135.2020.02.13.04.00.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 04:00:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VDF0hbxB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2DAL-0001eL-4W
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 07:00:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36179)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2D94-0007uQ-1o
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 06:59:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2D92-0001Rr-Ul
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 06:59:01 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33341)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2D92-0001R3-Q1
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 06:59:00 -0500
Received: by mail-ot1-x343.google.com with SMTP id b18so5323693otp.0
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2020 03:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZIUotafDXfUwGtFzakVHbdga+VmjUYxpyzlK5Dq85yg=;
 b=VDF0hbxB4RMyEIGjJArqQqwBtT9cHo8aVz2lSZ8RWEDDN73O7/0665HmZ527ojn/uk
 s6vy8op9zOmSRmIlTxgN/rvQ9qJwGa5uPL5b34ZMAcI35NHL9MsHAWk78PgNRpJpTmTv
 aHl4IVY19lQCd4KojU+kwbkUzcwFkp6bhjd3ig4OCUCuE+y1GR/0agrBJl0DBwsiuqho
 tiKSc75W2i19pNqXcm5ovMhjKtTBjU7EsAZ0E2VnGhnaUQ2f5EAHXhlnbiDXVMiM4TPd
 DTR7cwN3Rp6vvb0vIfYnwlo+A/OoNIV5OhIuNz18/257irA8cxLQLC0im8lSo/MzN76g
 aVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZIUotafDXfUwGtFzakVHbdga+VmjUYxpyzlK5Dq85yg=;
 b=M/dggwas3xtRP5MsfvSjxW+FUR4Lm4rSN0OO+9xBMDWVxFrG7uSAfR5YSzGB0LxJjs
 elQf2ThAGvP/5K5x7AscdQCUH+qJ3bUClyg2wH0Mg6fRDh9sRgZ3v+eFYDQdM0mTG0FY
 2HmYIXs8nvbvPwdo2Ne4iPqBca+naanHblbAPbbtnrp1Qs39Y2aMLP2W8a5Z8qIg3wFE
 UIpm1d0QkGvdGClJEpvaNByC82xRd/BR+caPVZAU+bKLsOA/6AOty2fxWFLdC0wiSMLN
 4O/GvV8RBtuaMe0qwLf3TCQ7xWdrpo1JPUDZyYaWXuaohm4tS+eYSUJsKcWjAt/lFp1P
 h8NQ==
X-Gm-Message-State: APjAAAUH4Ou9eXKh3CGjspez7tJCHYoMyTffULJV6ozuBG68y7j8hPAv
 yeHpXSxtNdh1eFrTVvEdgtrtgDfYnXn9WV74CYIMQA==
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr13093232otq.135.1581595140039; 
 Thu, 13 Feb 2020 03:59:00 -0800 (PST)
MIME-Version: 1.0
References: <20200207174548.9087-1-linux@roeck-us.net>
In-Reply-To: <20200207174548.9087-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Feb 2020 11:58:49 +0000
Message-ID: <CAFEAcA8ig1CYb1ioszchv8wmNnbxJDUhxMrK3_ATqprNrauWxg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: ast2600: Wire up EHCI controllers
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IGw492v07n9L

On Fri, 7 Feb 2020 at 17:45, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Initialize EHCI controllers on AST2600 using the existing
> TYPE_PLATFORM_EHCI. After this change, booting ast2600-evb
> into Linux successfully instantiates a USB interface after
> the necessary changes are made to its devicetree files.
>
> ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> ehci-platform: EHCI generic platform driver
> ehci-platform 1e6a3000.usb: EHCI Host Controller
> ehci-platform 1e6a3000.usb: new USB bus registered, assigned bus number 1
> ehci-platform 1e6a3000.usb: irq 25, io mem 0x1e6a3000
> ehci-platform 1e6a3000.usb: USB 2.0 started, EHCI 1.00
> usb usb1: Manufacturer: Linux 5.5.0-09825-ga0802f2d0ef5-dirty ehci_hcd
> usb 1-1: new high-speed USB device number 2 using ehci-platform
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>



Applied to target-arm.next, thanks.

-- PMM
