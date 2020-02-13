Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp518787lfp;
        Thu, 13 Feb 2020 03:58:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqxtyDk5ziTuaIp6SU6Q0VG67/U3lobI2sNElG9Nw4YaJ0s1wnu1u2HPZsXduX9sPvbAPq34
X-Received: by 2002:a05:6214:192f:: with SMTP id es15mr11444950qvb.219.1581595108117;
        Thu, 13 Feb 2020 03:58:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581595108; cv=none;
        d=google.com; s=arc-20160816;
        b=pcFvynE/sg6oMplP3pWRCpQd9ipoXc1/SuEAjAwhr3QOsBH2A4eKz4PLz2EHI21DEX
         FgYXmbFtYTpO6cM1TQ22VAmQUy0dqnxw27S1dNs+00vSbCh/mDw9AB4DODu9IYnNPX9W
         amuRotqBTH62JrXc8fZ6IKRw7aUolnfkVtCCEM8k7QMlae5wUfgFk5FfahAfgRlp5ODR
         TEsVAYosqWEyTFTci0ja9gvoO8PLY4Jk5lZ3M//7Zsm7f2BRoPGzQmSD1HMnK4KaWFir
         hfMXo7PaQ52qUTBpDaxkCN81h8Amyhr2TRM1qrhoQ/j5AiY9PdDFtCsSJ8ZijLNx4MJW
         mwMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W26slry5BFEVljsqaQF9ltZ7YecO7l1WLKeSFmaYBdY=;
        b=vJgIZUglTOpR/EE6QtQjF+CdIciZoSoJUyzDMn4oQ+Q6jcQX/50CJ4rncrKjSIzWOj
         HcIqBa6M7CMYdrpNxe2ZND4SXGRLZ0sEpM1hhzqrdRgLcK44IHvMxcm/MHL6mR3FKlqU
         wQCIqjL/ALY14+tlZBGvpgx302LR0phKFnuFZ8QU5DsINdU91xXSHMDh3gSghf9R6qU8
         EHThf/TbheTIP3JxuvAReEWcyGAQ9ocyybWraSIKr6jzYfyzzO7JiG8JyiDdVDck8mbL
         O9s7aJAYlDxDa0r4xJArdhsFToSWRsJ1GHW2ONq+zQPF30GMcuE+qfugDP7aYVjFwyJ8
         3hag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=APs4BFJd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q34si1024113qtb.199.2020.02.13.03.58.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 03:58:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=APs4BFJd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2D8V-0006zU-FV
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 06:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36032)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2D8N-0006zH-Qk
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 06:58:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2D8M-0000gD-PA
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 06:58:19 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35317)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2D8M-0000ed-I3
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 06:58:18 -0500
Received: by mail-ot1-x341.google.com with SMTP id r16so5318116otd.2
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2020 03:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W26slry5BFEVljsqaQF9ltZ7YecO7l1WLKeSFmaYBdY=;
 b=APs4BFJdXbbjjU4+DkzlL+jhMr7dOXKT1geAvgeeDjcscCHxMZwZ+S6w5E3oWvHnMx
 JpWQhtHFTE2qg0que9zrJB8ufv4jINe3PqP2Gn5tcN8T0QcIZNx/WhHc8H8xjs7l3ju3
 JI4+sBh+wKTLMMugWvhd6mGBSYfAJU/RxzDb8Ixv80HF1bOxGLB1G4BZbo6ERJaN3Bqq
 znB67rAJtdFzTdVAGG4iLNXzfeweDLnY7V6IpUETU+krn4zFGc0FXSV31Bz4+G8frxLa
 h6kqzr5YNmk7gY77ZRV4iRfSLDzz23DQT9AD5s99X3E9RiELTlPlbbGT3pk43lhjzoTj
 jbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W26slry5BFEVljsqaQF9ltZ7YecO7l1WLKeSFmaYBdY=;
 b=SQxefHgaTWUP/44Cpi7ereFI8qUSA7/Zb65G4utnNJg4m0BzOLjPGrnbbNTcXUfwYt
 Ji7yTI0+4epAA8IiGi+JLdfOM45NzB8H2cboKiA9uQABUaAsZlfzouCiQeJuKjvHhjsc
 xzACuT7ZEbmaOz5Sk9+2R0M/zNObtlThNFX2fYyiAGf7BrpYueQrv05k1Ppc126v4mFR
 Guzed7Ok4NQancH4KmhZFo7B4QEjNQRe59604XVbt45QmiGrLlFtVLeks38ZVKAHT885
 2sMs1Nm0tdNW0EStkbEFq7pnKvzeELzueBCZpzkHFmSbEwrMpgHmTlKzy+jnSGS+eRIi
 tsjA==
X-Gm-Message-State: APjAAAVQgr8UXbo+ucBZR+WJVjJ+53LwEF/mWLkPQj1+mbi9+fGLj3JC
 dy2TqdbX0FcaZBgeJgxUwoFeHwjd6+vxuJMupYb8EA==
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr12373571otq.221.1581595097243; 
 Thu, 13 Feb 2020 03:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20200206183437.3979-1-linux@roeck-us.net>
In-Reply-To: <20200206183437.3979-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Feb 2020 11:58:06 +0000
Message-ID: <CAFEAcA-onKuSidzf43090M7R=b4krbVfyvFUBwFRPGAGdBdmGQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: ast2400/ast2500: Wire up EHCI controllers
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a6xzJPQyy+I9

On Thu, 6 Feb 2020 at 18:34, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Initialize EHCI controllers on AST2400 and AST2500 using the existing
> TYPE_PLATFORM_EHCI. After this change, booting ast2500-evb into Linux
> successfully instantiates a USB interface.
>
> ehci-platform 1e6a3000.usb: EHCI Host Controller
> ehci-platform 1e6a3000.usb: new USB bus registered, assigned bus number 1
> ehci-platform 1e6a3000.usb: irq 21, io mem 0x1e6a3000
> ehci-platform 1e6a3000.usb: USB 2.0 started, EHCI 1.00
> usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.05
> usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> usb usb1: Product: EHCI Host Controller
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>




Applied to target-arm.next, thanks.

-- PMM
