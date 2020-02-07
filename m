Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp558023lfp;
        Fri, 7 Feb 2020 05:09:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxNdFgW7So7tWvVQkM6lJaavSmfNmewzMYhwkICGIPzwa+FeE9Ezcm/+sXMZ4C4GlmgXQWN
X-Received: by 2002:a37:9d0c:: with SMTP id g12mr6798468qke.35.1581080999271;
        Fri, 07 Feb 2020 05:09:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581080999; cv=none;
        d=google.com; s=arc-20160816;
        b=gn/ymU8cpyokQCWW19dIEDrVKb6TtjXT9Utsi4g6OnW4Q8saXEDqmgbDsb2D2oGhVq
         RkcFLv3OhcsBaIcN20q5y3WZKqTyQbOxjCGWtQulGr2DGY5pFy9lqRiUZ84auzzRzvEP
         v9bCgGszYTpxOr2sHLztqJUVBTNchfyfAaLII3p5dZf9MI99/grUFbIh2Oge4X/SilbR
         PZGRPQplAqHPO5+JHXH9wqwSvFlWrWZXhhP8HXMWXTliv5S/AthgU4I+6Hu7DBXluYQK
         m92sVVIhLMgY8B6/DKUrgXADU9PIaEuoBoQMjCMFNxj3SKePDzNYUlzFMKU/ijbCB1tl
         oOMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Pq+thd+KtO12hP6grY9IKrV0MxBWCghCYX7aWpxsH5M=;
        b=HWsE93h/fAZbnOsPB2yMXlIoCkk9L8S5NB8hblAdsdwVABgQplvya3KLJwlUkPOpxh
         uri1ZlufRAeZyEnJGOXXKQYj65UkYH01RXmBUL4dUpImGk8GtcsVOt1CIehxRdfr8M3l
         fmTKXkd50kW5mOHTacPLtomFhBtBN7F12W/glnLbXGNHwTjaMyt2Af5z8l/N+JadngV8
         YoKEofuikJagOGN8sFT8shuLfp8NZ1+ByrNs/lhTiEe39Jn6xGzi8o6KXIuTQGfpVn8A
         5ZgtmuhL/rEcylbrXgGfV+4VcNrav+nd36w/7979oGh5cJzhq+o5t0IuPmrSJDZIhYfh
         dNxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=ciT8X3Ew;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p20si1169148qvk.15.2020.02.07.05.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 05:09:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=ciT8X3Ew;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j03OO-0005QT-MY
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 08:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1j03O0-0005Ow-3R
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 08:09:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1j03Ny-0004Bd-Pq
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 08:09:31 -0500
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41]:38317)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1j03Ny-00048U-F5; Fri, 07 Feb 2020 08:09:30 -0500
Received: by mail-qv1-xf41.google.com with SMTP id g6so958414qvy.5;
 Fri, 07 Feb 2020 05:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Pq+thd+KtO12hP6grY9IKrV0MxBWCghCYX7aWpxsH5M=;
 b=ciT8X3EwITAxWw4b7OK5wDID+OFi0ndjuq3SU2kKq7oYuSDKsXvTKry5MP+OOAWGgs
 xn0e8pUkIO1jZX62ASWSYRTPB5a3FXP2xKLlpQOnMuk3J/8yZcdMYJFaHo2mEGEk8nka
 RoWjGygkvaUloPZJ/a3aObfDzKsgn7RV+yNVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Pq+thd+KtO12hP6grY9IKrV0MxBWCghCYX7aWpxsH5M=;
 b=r+kplnr8U7aqdiVcLp6gsLZOJN+XOMNdbNMueYWAjXCn0wbKIEPYOBOJNN3DzFGS7u
 RbzmulOCTpBmH1DnQ3zACKEwcgx77/kAXKEwH4XtH4mCw7CUo/gElRvQAdSwlGNL02d7
 uCprvczxg7m83NZ58mG3DuFi1kTwjFajQJl81d/8ww4pYWehO8lxniugsBh7gVJgQmRT
 UpC0qEWvQ44s6/sqSr6ivwCCulhAkOk2Tr6/QeQ6HPrjWzIi6XqATg1pOMtMFPn4cHmI
 ZxExhLRC6DiL7zBRpGOqrw72lteLfV9tIfpUuE8+WTOeAUQBsxSpSIFZOCJw1oDeS+Cr
 WiBg==
X-Gm-Message-State: APjAAAW6J0P1KTmzhLqvp1/9XrGhSWx5JYtH45P/C8iQcqsodNR0UbDV
 zZaayKFDBwd1tlpXZvWyphbSJfaZtkLhoLkbTaw=
X-Received: by 2002:a0c:fec3:: with SMTP id z3mr6495157qvs.111.1581080968914; 
 Fri, 07 Feb 2020 05:09:28 -0800 (PST)
MIME-Version: 1.0
References: <20200206183437.3979-1-linux@roeck-us.net>
 <e9f490fe-34d3-6830-832c-155f6fa63482@kaod.org>
 <1605922b-2aa0-dd8e-720a-031e74bc9872@roeck-us.net>
In-Reply-To: <1605922b-2aa0-dd8e-720a-031e74bc9872@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 7 Feb 2020 13:09:16 +0000
Message-ID: <CACPK8XdADQwGnsX=YR0n_zm_WMv532bAmR3O-CfyJ23ytT9bpA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: ast2400/ast2500: Wire up EHCI controllers
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f41
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xe1H+RaU9bhg

On Fri, 7 Feb 2020 at 12:58, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 2/7/20 12:16 AM, C=C3=A9dric Le Goater wrote:
> > On 2/6/20 7:34 PM, Guenter Roeck wrote:
> >> Initialize EHCI controllers on AST2400 and AST2500 using the existing
> >> TYPE_PLATFORM_EHCI. After this change, booting ast2500-evb into Linux
> >> successfully instantiates a USB interface.
> >>
> >> ehci-platform 1e6a3000.usb: EHCI Host Controller
> >> ehci-platform 1e6a3000.usb: new USB bus registered, assigned bus numbe=
r 1
> >> ehci-platform 1e6a3000.usb: irq 21, io mem 0x1e6a3000
> >> ehci-platform 1e6a3000.usb: USB 2.0 started, EHCI 1.00
> >> usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcd=
Device=3D 5.05
> >> usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=
=3D1
> >> usb usb1: Product: EHCI Host Controller
> >
> > Cool. Have you tried to plug any devices ?
> >
>
> Yes, booting from USB drive works just fine. I already added it to my
> test suite at kerneltests.org.

Nice!

Reviewed-by: Joel Stanley <joel@jms.id.au>

> > This looks good. Could you add the AST2600 also ?
> >
>
> I thought about that, but how would I test it ? None of the ast2600
> systems in the Linux kernel enables it. The devicetree include file for
> ast2600 doesn't even have an entry for it. I could cook something up,
> but that would not reflect real hardware.

FYI, there are patches on the linux-aspeed list to enable USB:

 https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=3D156260

They have not yet been merged into the kernel, but I will merge the
device tree changes once -rc1 is out.

(I don't see any patches that enable the driver though, so I'll have
to follow that up with Tao)

Cheers,

Joel
