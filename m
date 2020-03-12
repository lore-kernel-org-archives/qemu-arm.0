Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp642617lfc;
        Thu, 12 Mar 2020 06:30:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv9h2fkKODrXWtvFSoL0R0SHrWcIPx0GIIvgxJdasZu+63ZyG1pMrEErF9i8d2u1fe6k/kC
X-Received: by 2002:a05:6214:209:: with SMTP id i9mr7335555qvt.54.1584019800320;
        Thu, 12 Mar 2020 06:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584019800; cv=none;
        d=google.com; s=arc-20160816;
        b=yVfxrme9PAuuzsNCORwADh2zBYfMlmOxLVM8xbkJz7048rGYnJhXyiqVh1Ubq5SAnU
         ituLXIQZdWGKFdN16IS+Kt72rZRTsiTfe/caAQtMhfKLHosvLNe2HeqUw7C0mW5egVM+
         8Y00KLObkIlvdonBPiyWcFfmj7k5ufpr3jQs/RQW+XxPB+uCsRbEGhw1fN01KOVWHK0/
         MzSW/AYATsUJdcuFydf3urPhR1Ar9TjZI9djwGeOxsQOLO25G/USxa8nGAPEQwkB6jaO
         USK/13RtDhgfQMxKuXpknXj8p+erume7whjew+eEKEuB4YclbHFZ3m5/ya7vNtdXLZDS
         k8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SrgliAOD75JBwgphw9tAqzWq3jSycyMTqEcr6pnK2S4=;
        b=VpXrjLjqK76Q+KXtKwGkEmaE887zUkULRfOS9cJOGTPF21maZOYSSHhDauSmwTcAmU
         Qjrgno0/fFQOUE/U0aR9/dbCr77tsI+XI47sITemmbY+MlfMbOJEC72FJTEajNQHTF3Q
         LswTnr1+Y5bvBW+ELp2in9WjPV+6xHF34L7CYqeuQwkgh/6FrvWb3SnxzHap0pOptrvP
         ilfSeyc8CWcVnhhLSwbe1tj1d9fb+V2XE88351c5ydQ7lS3kQZJYlGwkuirRMkBgAyKT
         obZWNTR8f7tkebwIe6URjw/FzB7TZgM/KQYOOe+31tPmZhlJyrSQxIY2ppVLnmqr2ufD
         hi1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wQPAxczn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s37si2906566qth.84.2020.03.12.06.30.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 06:30:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wQPAxczn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCNuP-0006Vf-U7
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 09:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53261)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCNuF-0006Ug-FA
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 09:29:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCNuE-0006jN-8M
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 09:29:47 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33490)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCNuE-0006iz-2W
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 09:29:46 -0400
Received: by mail-oi1-x243.google.com with SMTP id r7so5471034oij.0
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2020 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SrgliAOD75JBwgphw9tAqzWq3jSycyMTqEcr6pnK2S4=;
 b=wQPAxczn3bmwUGqzxIAB4h1Bltb+UlJa21Ak9OgReVI33jhfLLeUX/A59iveWPKxnJ
 f9nb7MVBtSj0vMrEqNtKC73cG89ALf2H01RZwf5k/kkceIy5gWBp1riNUBTssFBkFlE4
 goOfJYONSNNn+RCRDUhneKuJBNM2t6OpGe08LLRyvuW1E+EFSbEdXv/C4yPVZpF88PoU
 EvWMbUDOCZMA4+bEZbjj154dr3SWKC+Dar7YWJRv20wu80j4LmDtFVLlCeLSxM4hNOkT
 ppltK7ycM01ASqhODrH2VAJxrXnMntPkkG6ABw/bVdqVBR68q8IFFu2gP0VRzIG5PY5N
 /uHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SrgliAOD75JBwgphw9tAqzWq3jSycyMTqEcr6pnK2S4=;
 b=DhI8PiAjqoT3IDmWx8OYwwDsCsaYhdD9Fk8VvjQprmSOl2F+96dk/5mL/nML61hcpJ
 nTfJu6MkYWl+sWNGyEjxaMCcZX/JreRYNbmXJFiP4ZFV0OaJiONDp4doz+G7LzqZ3Uvh
 LNZH3h25JkijTZOMeFpQu1T2M0sVjgun1HbqzV5ol83aoJxKAM8UgfN1NAbswozjpOPm
 Su3jLh+fQ1Vb7FJw6Z4B0R4MC0pDgvyddZ2kAkVwiNgP3nV0MOUlnQEMq6Xk6SLFydiv
 EY1z6RdIhBueUYhs97CSjcbKV77ZoZjefTZ7mEWkWQ5cTVpyFTEkIZrYE9ihURSIHc2W
 bTEQ==
X-Gm-Message-State: ANhLgQ0rpwruXPIc9AS5DCCnjTsAdUr69/ZrlRRSrgu5bzfc8DiFSZUM
 Sp3aZwkofSneVRsoYR7SZ2YFfev9emsfMuId0oxVfg==
X-Received: by 2002:aca:c608:: with SMTP id w8mr2674971oif.163.1584019785006; 
 Thu, 12 Mar 2020 06:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200310210434.31544-1-linux@roeck-us.net>
 <20200310210434.31544-4-linux@roeck-us.net>
In-Reply-To: <20200310210434.31544-4-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Mar 2020 13:29:34 +0000
Message-ID: <CAFEAcA9itKNV6c07wm_4dJiGtHMLXCFt+A-W5xC5DX1Wxfu30w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/arm/fsl-imx6: Wire up USB controllers
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XEmry+UW8HtW

On Tue, 10 Mar 2020 at 21:04, Guenter Roeck <linux@roeck-us.net> wrote:
>
> With this patch, the USB controllers on 'sabrelite' are detected
> and can be used to boot the system.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

> +    for (i = 0; i < FSL_IMX6_NUM_USBS; i++) {
> +        static const int FSL_IMX6_USBn_IRQ[] = {
> +            FSL_IMX6_USB_OTG_IRQ,
> +            FSL_IMX6_USB_HOST1_IRQ,
> +            FSL_IMX6_USB_HOST2_IRQ,
> +            FSL_IMX6_USB_HOST3_IRQ,
> +        };
> +
> +        object_property_set_bool(OBJECT(&s->usbphy[i]), true, "realized",
> +                                 &error_abort);
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->usbphy[i]), 0,
> +                        FSL_IMX6_USBPHY1_ADDR + i * 0x1000);

Are you sure these addresses are right? Four of these starting
at USBPHY1_ADDR means the last one clashes with what we define
as "FSL_IMX6_SNVSHP_ADDR 0x020CC000".

I only have the i.MX 6Dual/6Quad reference manual to hand,
so maybe this imx6 variant is different, but that document
says there are 4 USB controllers but only 2 PHY blocks.

thanks
-- PMM
