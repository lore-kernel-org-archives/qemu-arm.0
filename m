Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1217002lfg;
        Fri, 28 Feb 2020 15:16:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqy+vgjhNbHFXqCKzkXhza7npER6eP1rYaysmpwkLWm7BvfOu7hV8NZF3Jab73nHwKsFjl8+
X-Received: by 2002:a37:8683:: with SMTP id i125mr6731909qkd.491.1582931818687;
        Fri, 28 Feb 2020 15:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582931818; cv=none;
        d=google.com; s=arc-20160816;
        b=idcX5Z0n+lPF2VRReesqTOP630RayzJZ5YdiDTut9N3xA3gh4lZktD5S0ON5H3G5xQ
         6Hynqfkz2mqeoUTKSvdqh8TwkT4goOGyETp3ByAWPT6qtzxeI5JCUMvjzVSt453/XPgV
         pkRuuHQuio3JqqFmjZ/cBXT7C/oHWNT61mtZwZW5nFLkUpuC9bU7Z2HgyXxo55xEMIXe
         dtqUivT3cbvN61/BQmSU7FSoemuNx2m+0RXstZFqvGUoDmc3bzU874t5/E3nT8iOnMf5
         ziHVwN9mWupzOMCUW7xt4D27FFar9ySPmfna0PViUP31vQNuHk1WidPoIcSXEHLvqs8K
         5TTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=yPhsdxmC3P85Uu1od0m2OjFA80DoP33yC53pLjt19dE=;
        b=RkTZgcRjdjTp1B4bbPDIptSJiuvyL3AYeUB78WOobG51rGFRyam1S/evHvisIE9NVv
         OjEnXmEssATJqihZPZZHQO8kjf+HQ6O7zmxBMbcmssuXLNGwCY02A4w2MtW1v0m+HwEf
         /YePj8ZqE9v2xGgF6Mj0kmEckvskGsQOGuPwLIEP6JCJEkSwE9E6PbnziI78ubCGXgNz
         yZhhJJn3LkCIWH/ZQLgb1487aF69hq/5ZW28c/ZNJI8Qmcxh8BiW7GYv/jUoBUa8EuZD
         8xFDYyO8Tab9bIrU7urYqQ8Vd+TqecIZYjh9ZashEfanPWBJ14TnfTia3S1OL9QBLagg
         NKng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jFzBc6Kp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x27si2102798qkx.125.2020.02.28.15.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 15:16:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jFzBc6Kp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7osM-0001gL-4Z
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 18:16:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50876)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j7os6-0001fQ-AT
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 18:16:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j7os4-000751-E6
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 18:16:42 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:33857)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j7os4-000742-4M; Fri, 28 Feb 2020 18:16:40 -0500
Received: by mail-pf1-x442.google.com with SMTP id i6so2479458pfc.1;
 Fri, 28 Feb 2020 15:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yPhsdxmC3P85Uu1od0m2OjFA80DoP33yC53pLjt19dE=;
 b=jFzBc6Kp3JmT6ItRsoBTr3TfN0cqoAeg2VmGP8JAfAlhCsiqZYswieYPgs8//hh2BE
 mUAostq2UGWcb+C4aUe5A6VpwxTBZ5fbgfGcBEdVnpeYhZF32P0aHc2D31CwhhAOuA7Q
 evZ1tzycAyjDAmbpozrt8zAk018JG5HEpxlO4Fx6AGdpnxTqdiLsPqbQOwfhf/oNtqMX
 saXbl/ON3Pg8eAylaTyStPdqMk+HREHn7ZbvULRJQ18L/Ov0NXjag8CjxzCjWk1ydi55
 7jwprKYLBIgrqRYHXJbybOZ1qOygBmHhLyXpuU4K3ejxvRxLBSgOP2yrwV3ZMHnL0BS/
 yHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=yPhsdxmC3P85Uu1od0m2OjFA80DoP33yC53pLjt19dE=;
 b=nKA8NPO0y6jWMkjAGS1cGzdEx8X8w2hMX3fI7xk/FYTesbTKIJV6ZFI6knVujPFAYM
 +bOo/+l1GB8ENC54ZaKbRCZdZjB6rmdtOh8wXp7gV45vpIq1zd471PNMo/JrRfWfXMlB
 TcHTrCz3qjL7chbkXUOlZToje+eyMawO0WqeH3zkrsxotP9AbYLTJm6tA1E8ESmU63i7
 bDJbw8B0lO46zpKkJVS6NVssS7ooszqKEh/WAHptlys7MVyKup38fPa2BRfpDfoBPeZI
 O+POPCGk67tmifdl9AWJH6Ty1kuG4NtIs/lEmWaI2xdcwRmUfNGxEwKjyOTPGJmQGDnP
 dYiw==
X-Gm-Message-State: APjAAAXxiTyrBpN3D99VApmD9Ot1UGN8R6T7Ul6uwsqpLUhx/Ec4YftL
 +tir/uxTQuUT8zxHfSKmGcA=
X-Received: by 2002:a63:b22:: with SMTP id 34mr6698586pgl.78.1582931798845;
 Fri, 28 Feb 2020 15:16:38 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id t20sm133819pfl.114.2020.02.28.15.16.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 28 Feb 2020 15:16:37 -0800 (PST)
Date: Fri, 28 Feb 2020 15:16:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/xilinx_zynq: Fix USB port instantiation
Message-ID: <20200228231636.GA11737@roeck-us.net>
References: <20200215122354.13706-1-linux@roeck-us.net>
 <CAFEAcA-u=j3MYu-Ck0UbMzXXEoB41dx6UbGw15QBEnqBBX988g@mail.gmail.com>
 <CAFEAcA-_V-7VDZvVg4WE99A4b1UimQ0RrLG910qmsxCgRVvq5A@mail.gmail.com>
 <CAJy5ezoP7qNCymOpVXgMcwOuYvXBPVnf718gN_qfsfW_D9MVFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJy5ezoP7qNCymOpVXgMcwOuYvXBPVnf718gN_qfsfW_D9MVFQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5oDgnDhLr0dc

On Fri, Feb 28, 2020 at 12:44:19PM -0600, Edgar E. Iglesias wrote:
> Sorry Peter, I missed the email.
> 
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> 

Thanks a lot everyone!

Guenter

> Best regards,
> Edgar
> 
> 
> On Fri, 28 Feb. 2020, 10:00 Peter Maydell, <peter.maydell@linaro.org> wrote:
> 
> > On Thu, 20 Feb 2020 at 15:05, Peter Maydell <peter.maydell@linaro.org>
> > wrote:
> > >
> > > On Sat, 15 Feb 2020 at 12:23, Guenter Roeck <linux@roeck-us.net> wrote:
> > > >
> > > > USB ports on Xilinx Zync must be instantiated as TYPE_CHIPIDEA to work.
> > > > Linux expects and checks various chipidea registers, which do not exist
> > > > with the basic ehci emulation. This patch series fixes the problem.
> > > >
> > > > The first patch in the series fixes the actual problem.
> > > >
> > > > The second patch removes the now obsolete explicit Xilinx
> > > > support from the EHCI code.
> > > >
> > > > v2: Introduced summary
> > > >
> > > > ----------------------------------------------------------------
> > > > Guenter Roeck (2):
> > > >       hw/arm/xilinx_zynq: Fix USB port instantiation
> > > >       hw/usb/hcd-ehci-sysbus: Remove obsolete xlnx,ps7-usb class
> > >
> > > Xilinx folks -- could you provide a reviewed-by or acked-by
> > > for this series, please?
> >
> > No? Oh, well, applied to target-arm.next anyway.
> >
> > thanks
> > -- PMM
> >
