Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp332180lfe;
        Mon, 16 Mar 2020 10:21:54 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vujVc8l2v4V7MmvaueaK2N6wTkPrpj4t9B86VLN+WqDfH6cJ2f2RXpfhYEkgcxyFHsBkWgI
X-Received: by 2002:ad4:4364:: with SMTP id u4mr849292qvt.58.1584379314222;
        Mon, 16 Mar 2020 10:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584379314; cv=none;
        d=google.com; s=arc-20160816;
        b=CiWeRGvYrAVFVS490mjnURq8xhOeI83tecZdlr1glzhb3FDuN4SfyqSyBo3g1t3BIV
         WxwXGx9H0R+mHht3jH6OI7IbBNa7R93lFPyKQZerdNaLwQW68IhVMkw+yaebdHXYQi9b
         Wo5i1MR35enUsFJuL+mMkgYeEPTmWSTp616f5dZVe7pp1Ag/2CkqAYb9gS0QbIkp0s/F
         vaX4WPtRitxk5WM4zH12f9Yt0aKaEnzI18ZCMM7NEQuOlF1RzlEXHcsCQ84Wdg16zVnc
         lTkbbvwsnHGe+KVQhQN4sN3D7HZy3JdgFK+KhVVUlyCwmRT974hZDmdLchRjTRn95jjL
         P5NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ulsEnALMcD0ysXus3/RMO287XVA+9Ung44pDMgmtgDg=;
        b=NA7TpyTO6zlBT5s7g0fhy+kW2DTDw3CatC5VjtXKVFIFvdlePeJKbk6yAxDNCRUVJB
         FypFB6qTqQcf2/5ILyodn1U7IzeBNV9WPmD5XgmCbCALDor5tS6fi9TfWph4dh48Ti89
         a73uhlsTPqCTf7nDSMYHv/SHPKLjgkCliQpLJNXPDqm7NGMbMTvHjwgPRTYVSQhhmGRN
         bSOOLbadv7/s4e+m5jsF+4UFcXx8oCGDb1sOVbFq4Kwst9MdWuIOrePqoksue/mhuIpx
         GRKIxM3REaPM/4uJp4ndy3fx6z1b0nTro+Ud9zSjMtnCZLb6YOnNfuQoxM2OAJ+GoWUV
         Gm9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l6Ctfqzk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d204si485771qke.80.2020.03.16.10.21.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 10:21:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l6Ctfqzk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDtR3-0008Ks-FU
	for alex.bennee@linaro.org; Mon, 16 Mar 2020 13:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34567)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jDrmF-0000sc-LV
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 11:35:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jDrmE-00081q-I0
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 11:35:39 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38519)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jDrmE-0007w5-Cv
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 11:35:38 -0400
Received: by mail-ot1-x342.google.com with SMTP id t28so15624335ott.5
 for <qemu-arm@nongnu.org>; Mon, 16 Mar 2020 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ulsEnALMcD0ysXus3/RMO287XVA+9Ung44pDMgmtgDg=;
 b=l6Ctfqzk+z+2b3c0vADY3E6pku9HwyyhnJTLghmdbaxJDvAaORncdR2/xGJgMkfwD2
 rLUdz/H33Y5u64N2ukppY9n5680rcV1jnzzgOEeL+yJRZ9lSJQjKqxfN+b4qE0kvoQNX
 SgO2zPpsxTSr9MfPyRryH9QGxBxiprs2ZIRm+Eby5/PY/ng01/mWLj5Ciz8jz66b1oEF
 2aZE/byUddo6k94LIsfwwbzfGD9nl0+V5aHHW+MqN18PruPk37Fu3mwWKtASl7fKulvA
 ZoAR92Rr9hryCaUl2P7FB+4KoU/PSNfxTunalUuw5irQKVltELfFRGtzP4KBo6ZVJn1T
 juhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ulsEnALMcD0ysXus3/RMO287XVA+9Ung44pDMgmtgDg=;
 b=cVk26OEzIF7sr0gLSFE7W5eMH4bjBO1UQmQy0BMosW7x61Wds312iqB7sJKpdrbH+t
 EvLFBLnhbwaeVSnNzrpGLXyA1e/ahNpk86MDcYnaktkSzXU9uawDIguhIXEgUqRv56mp
 oWe9vStzaTItp0T2dO6e7RBgkVIMb0iMhDATqsfvMGTSBoyxksI14OO9W7yjlYKPz24f
 LG3D3nWXwMvo7qYZVjC1dhPjrZayh9T2cyn0AHeTexrZ88sUgfaPBCPsDRNQreL9lvVi
 HCeviuoPkspr0q0tN3cqbg19t0yuzmh6JRROlZXwDnTu8xQaZhevmChfTuw+AMEScJ7G
 A+nA==
X-Gm-Message-State: ANhLgQ3Usk1qJNVtOBjPwSKnZN+sxHOLbAj46XjVF83p82C9U+DcPeJs
 7/mnPV4bjz22tbQ1lol76IZ2oU5YfM5i96RdiDQCWg==
X-Received: by 2002:a9d:1920:: with SMTP id j32mr21824947ota.221.1584372937456; 
 Mon, 16 Mar 2020 08:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200313160215.28155-1-linux@roeck-us.net>
In-Reply-To: <20200313160215.28155-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2020 15:35:26 +0000
Message-ID: <CAFEAcA-rJCGZC+0G8L=Qbp602SF_=t58bP6v5adQCsDXjtetOg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/pxa2xx: Do not wire up OHCI for PXA255
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qb08yVgBKB1B

On Fri, 13 Mar 2020 at 16:02, Guenter Roeck <linux@roeck-us.net> wrote:
>
> PXA255 does not support a USB OHCI controller, so don't wire it up.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/pxa2xx.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
> index 56a36202d7..336c9bad4a 100644
> --- a/hw/arm/pxa2xx.c
> +++ b/hw/arm/pxa2xx.c
> @@ -2290,9 +2290,6 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size)
>          s->ssp[i] = (SSIBus *)qdev_get_child_bus(dev, "ssi");
>      }
>
> -    sysbus_create_simple("sysbus-ohci", 0x4c000000,
> -                         qdev_get_gpio_in(s->pic, PXA2XX_PIC_USBH1));
> -
>      s->pcmcia[0] = pxa2xx_pcmcia_init(address_space, 0x20000000);
>      s->pcmcia[1] = pxa2xx_pcmcia_init(address_space, 0x30000000);
>

How did you notice this bug? Was it just reading the code?

thanks
-- PMM
