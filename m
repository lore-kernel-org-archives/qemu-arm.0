Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp825995lfg;
        Fri, 28 Feb 2020 08:00:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqyokQ4vPnrdslOy1uJU1OyoUaaQWzcO9Jm7mwdfBkW7vtnYWrn7TCSG8ol3QkddMy6sZuu3
X-Received: by 2002:ac8:7290:: with SMTP id v16mr4847867qto.197.1582905619424;
        Fri, 28 Feb 2020 08:00:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582905619; cv=none;
        d=google.com; s=arc-20160816;
        b=g7cAMd/iD4Ex3qsdOER4mlj1r8Ib8xFyo/4QUeYFcGVovBNI5wO0qaSlP+bdhh+OO5
         /ZVW5YiOhs065n7BdqkLD7xZXmLEDXsRTOhdIn89q+1xfoZPrSZ54JAko///AeRvOY/t
         fSxblGtMBhXIcLtp+IYr9XqbDf68Mqv590BreSqaZQp7SnZzJBn2VZUKDKDl426fojpY
         qU2HWda4YUc1hzVxOpGPcpSPj246iQ5u3LaAxznr+wTh9tO2cilXwq5dP4LyjMwyBE+1
         LrYQrSvYJVZ11ZYpIMmpzhdIXkul88HvbqAol3PX67k9MDDeTIMajQz06+qjroNtNqq4
         QXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DYcyqLtloNMOKf4+aHy4rctiix2R1RH4TFRh6wVuz3Q=;
        b=AJGSfb4l5Vkb6mLL6DWVT1RfEmTanT1Goeb0oI4dE7rkGVETRY3hKFTXzQ/VLZLahh
         sS0BLWcDBa3YNVDFSRbKbM3k5jVBGrVifBCy0uwDH+bIlot6CqEhhnGGiANXzySt25nN
         FMu0CczX6/URL/bxgm0o/SC06Vhr4nnExe51qf35yWgcLZpGWD2WII0kScZUJuud0RAr
         1OOQpT578xAwC0nD45vR917zDXTqnv7wYx8tPkudiqFkmRzU5GQU+nbyJplwX1xY5GWo
         mxU1D550gic5isPutQaz4Qgc3SkcLfp1/YlO5h9CfwyGmKtyhe2CnqpJi9mGPiQ3ViCJ
         D97g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q5aguyXq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6si1604978qkm.373.2020.02.28.08.00.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 08:00:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q5aguyXq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7i3m-0007sK-Rt
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 11:00:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50784)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7i3d-0007rd-6a
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:00:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7i3c-0007OM-2E
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:00:09 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37159)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7i3b-0007Ng-SL
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:00:08 -0500
Received: by mail-ot1-x341.google.com with SMTP id b3so3025094otp.4
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 08:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DYcyqLtloNMOKf4+aHy4rctiix2R1RH4TFRh6wVuz3Q=;
 b=Q5aguyXqHdC9oVBe/rIC74Tcv3Om/Pt3YRjy2ZAOCuc/CtZfbO4ZcQdqLG0qk8LdPv
 0qAulqUVkOwAA64jx4q7yh6mfm0WrKy7dn+55AobGNIExSp3zRpgi+kKE7rxV0IcWABG
 x5fCG32TB2agOzOYrhtHXTTgLHiiQDq72sgMUW6xt/Z8Ps1BxazJPrGHSzBkb9YtWVkc
 bN+QSh4b4jaGtx9Zp1wzNoh9BJAs12t59Kq5ixYVYuoA45jk60VgkXUqlr0oX0MFcUHK
 uUXA1Ir0SfwP7/J98nQcrIUxTH7meTJFVFIEVCP/b4WkPp5Bu58QI/vJnCBzQ/uKXNB4
 x22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DYcyqLtloNMOKf4+aHy4rctiix2R1RH4TFRh6wVuz3Q=;
 b=HubdpG276iEP5HmWsAh1x/GdOIwIb1jLzyDbjVVha9Y2RYDjN3jsSGwDT0ZYZKsdkH
 rF7sEfvzEA6ugpjVshi4RCbomCqzhaTO1/kUdfw5pN1n6LHibj0WdSsx4zFw227WtnRS
 KebL6AdBi+LTe2JtGGgHB6ANz+tQkJz3LmkhLuQYe9R3n6k17k+xSWE0gT8p0nfTzajF
 YuL3Ff7krIhksPAPuq11XZwaYtqDlfbaJB368Kqy6syNjewqoZQeX03eZTiEBGa+HAt7
 ZBOMRCT0+ZaIM6tKpD8+KRyLi/LuEIMC59ZqXcNe4Lx1mWbziRcJH6u32PZpqJePnvOg
 yQiw==
X-Gm-Message-State: APjAAAVjfYhxWxh2VpBRN7xPsc0NswgH731LEx6jAVSyXdRS7uXc9FIg
 goN6ma4diEbc+FiVKGeA/7WmMHpRhIbNOGSmrFVbzQ==
X-Received: by 2002:a9d:68d9:: with SMTP id i25mr3879886oto.135.1582905606816; 
 Fri, 28 Feb 2020 08:00:06 -0800 (PST)
MIME-Version: 1.0
References: <20200215122354.13706-1-linux@roeck-us.net>
 <CAFEAcA-u=j3MYu-Ck0UbMzXXEoB41dx6UbGw15QBEnqBBX988g@mail.gmail.com>
In-Reply-To: <CAFEAcA-u=j3MYu-Ck0UbMzXXEoB41dx6UbGw15QBEnqBBX988g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Feb 2020 15:59:55 +0000
Message-ID: <CAFEAcA-_V-7VDZvVg4WE99A4b1UimQ0RrLG910qmsxCgRVvq5A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/xilinx_zynq: Fix USB port instantiation
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hm1CohOuOQGk

On Thu, 20 Feb 2020 at 15:05, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 15 Feb 2020 at 12:23, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > USB ports on Xilinx Zync must be instantiated as TYPE_CHIPIDEA to work.
> > Linux expects and checks various chipidea registers, which do not exist
> > with the basic ehci emulation. This patch series fixes the problem.
> >
> > The first patch in the series fixes the actual problem.
> >
> > The second patch removes the now obsolete explicit Xilinx
> > support from the EHCI code.
> >
> > v2: Introduced summary
> >
> > ----------------------------------------------------------------
> > Guenter Roeck (2):
> >       hw/arm/xilinx_zynq: Fix USB port instantiation
> >       hw/usb/hcd-ehci-sysbus: Remove obsolete xlnx,ps7-usb class
>
> Xilinx folks -- could you provide a reviewed-by or acked-by
> for this series, please?

No? Oh, well, applied to target-arm.next anyway.

thanks
-- PMM
