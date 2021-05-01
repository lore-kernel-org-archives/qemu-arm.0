Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1388002lfg;
        Sat, 1 May 2021 16:06:26 -0700 (PDT)
X-Received: by 2002:a25:81d1:: with SMTP id n17mr17528494ybm.74.1619910385903;
        Sat, 01 May 2021 16:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619910385; cv=none;
        d=google.com; s=arc-20160816;
        b=pWnKou3LtOIFuSptcJoUAX/8P6Uj7jSI9B3/YgQltvAu9R540k5aLww8juY60Jiriy
         dOvf4Te3iG/ygKk9+8EONsYSR6ISSqs9u6WdXPnwlM4qa8p4Wn+VbR5MA2g8BPu41I3k
         qA9OuThIAjB6wI2lwjUyz2UndIc3ck9beCZ55jHG3mKumPtbZIfiyI37RbfM3Te5zufs
         kGJoBe8EuUO4kIWZZmByeNfln+vlUvDLYqVFiCNDZbV9axWLk3ZH7HgsSk0INpejpeel
         exa357lzaS2zoWgit2R05t9m67MvsDkpl2/omrYfsrNXvSvRvgJFO0RZ5VJEa07F11jI
         tByw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YhyySDE4/0eYlFcVpxsrQQUb0N7zOJ+Y6y6McqTQSYo=;
        b=Nj3hgl7U5lvuUcTmX8eaSN8l9dEiL/Zlrj1da681Ko34p7nprGpGyXHq/ZYc4yAoM1
         vBOcULJYP9w1A83+xBieaF/Fd7H08V17bvNJvPmJc1t/JJAc3//LI5hyLFP/jOb7qfsu
         RYjZQMNirnmjyWmUs2P4EJ4XlYV34sxFavV6TtuLg244HY3YaQj9MPhEXk1t+4R3n6JH
         LflkSZTGmodZfIaA5EOyU0Ji+gRlrc1kA809JcLO3X5fF+KXTQrRo4u7HXHVtUTot9vD
         tOBHPqhgjfHN/YCtHY3Kh0zXUWQKjuc6UZkpp9l8gVAvWZXMM9Qv5Hj7h0v0pax0fjoU
         EHUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HDlNKrG9;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s1sor3367175ybq.197.2021.05.01.16.06.25
        (Google Transport Security);
        Sat, 01 May 2021 16:06:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HDlNKrG9;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YhyySDE4/0eYlFcVpxsrQQUb0N7zOJ+Y6y6McqTQSYo=;
        b=HDlNKrG94ddW40D5JruZ549n2TksJhaEpspU9ZU124lNw8bOOwOLjmqtFiO2T5Uwsn
         RA8sjcsf5ECnTTaC+IwvvwhuuKtI4TR0l5P8YmpF3SyuCiXqcpyVyVjtu8D7Q15QVqe+
         RBe3qKYZF8Q5pNXEDy94uLf7rN2oVJgGn0ukBwBe+uQdtFzHC3zor+TMSLGUYsRBMzjA
         mjBClTp6DKxK428HxxfM+jlRXWXXRmgIl7EaSDAr+HdoD06jm6jV5ahNt3VxlJuZMIX2
         7kab0PCN0TToQ3Ajb5KBL0YSEbW05EO0dyd6/HRtF4aGw6aFjH4rLvV+cBjT7Lc3HnOA
         pkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YhyySDE4/0eYlFcVpxsrQQUb0N7zOJ+Y6y6McqTQSYo=;
        b=oemmijw2iX24TrjvmMpzOSJIr7aS3iy+1pVQuLYC+HfHsY7scNBYrfUWR0TZWAVtF9
         UC1Y3kXycg2Y3qH0wjWZhjA7msJFt6LQZj8eTZWYxd1fasi09ht3+wiG1MxAt0IyU4dt
         JDo2lbKoANv61QFNXR3kXhLzSjnJ3f+8qUEUrj1gqN+Fpa9YCJfUrxJxPK/fFJtDApBF
         /HJoKqNl0oaOsCdmeT57gY/jvXkrGyin87R09Ya1Ook6+XcJhti28Dy3r5lGD/M9KylB
         1kuNHglM8Pa5zoiyDvlrtUYO1aaKL8MNrmCA4U8OmtGUoybkvjf6MGL5vFbqDaHphsNB
         dceA==
X-Gm-Message-State: AOAM532xeF9ojJXGkGDU3tGYKS2vDhsvfSrvf7tGIK/U0bq3lMjQ+fcI
	Z3tLQ8Jx3PsZPfe05/U+BnoFLfhBYD9ZFavTjZ0=
X-Google-Smtp-Source: ABdhPJzmjq4aFBNvp+6JbTQ+k4rcLTgu/A5u23UAmcbyDMkPvhfsPovzH8RrNMec4l5Q45Zf07L9vEazhyZ0KP53WLQ=
X-Received: by 2002:a25:56:: with SMTP id 83mr17557021yba.387.1619910385317;
 Sat, 01 May 2021 16:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210106063504.10841-1-bmeng.cn@gmail.com> <20210106063504.10841-4-bmeng.cn@gmail.com>
 <20210430144136.GA2880420@roeck-us.net> <CAEUhbmUTLecMcr0=vmBeYJZeK6CdZY4SZcYiOu0E9AawY41+Cg@mail.gmail.com>
 <72acebfa-be17-cca5-ce6a-443ef4d23fce@roeck-us.net>
In-Reply-To: <72acebfa-be17-cca5-ce6a-443ef4d23fce@roeck-us.net>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 2 May 2021 07:06:15 +0800
Message-ID: <CAEUhbmUwa+7cANCpT8vD=Dbow6ZCFTYto+fd8Gyrghsd-wgbSg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
To: Guenter Roeck <linux@roeck-us.net>
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: hsOtzdxwdHwk

On Sun, May 2, 2021 at 4:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 4/30/21 9:28 PM, Bin Meng wrote:
> > On Fri, Apr 30, 2021 at 10:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> Hi,
> >>
> >> On Wed, Jan 06, 2021 at 02:35:03PM +0800, Bin Meng wrote:
> >>> From: Bin Meng <bin.meng@windriver.com>
> >>>
> >>> At present, when booting U-Boot on QEMU sabrelite, we see:
> >>>
> >>>   Net:   Board Net Initialization Failed
> >>>   No ethernet found.
> >>>
> >>> U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
> >>> U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
> >>> board, the Ethernet PHY is at address 6. Adjust this by updating the
> >>> "fec-phy-num" property of the fsl_imx6 SoC object.
> >>>
> >>> With this change, U-Boot sees the PHY but complains MAC address:
> >>>
> >>>   Net:   using phy at 6
> >>>   FEC [PRIME]
> >>>   Error: FEC address not set.
> >>>
> >>> This is due to U-Boot tries to read the MAC address from the fuse,
> >>> which QEMU does not have any valid content filled in. However this
> >>> does not prevent the Ethernet from working in QEMU. We just need to
> >>> set up the MAC address later in the U-Boot command shell, by:
> >>>
> >>>   => setenv ethaddr 00:11:22:33:44:55
> >>>
> >>
> >> With this patch in place, the standard Ethernet interface no longer works when
> >> booting sabrelite Linux images directly (without u-boot) using the following
> >> qemu command.
> >>         qemu-system-arm -M sabrelite -kernel arch/arm/boot/zImage
> >>         ...
> >>
> >> The Ethernet interface still instantiates, but packet transfer to the host
> >> no longer works. Reverting this patch fixes the problem for me.
> >>
> >> Is there a qemu command line parameter that is now necessary to instantiate
> >> the Ethernet interface when booting Linux ?
> >
> > Enabling "guest_errors" shows that Linux kernel fec driver is trying
> > to read PHY at address 0, which is not what we want.
> >
> > [imx.fec.phy]imx_phy_read: Bad phy num 0
> >
> > The device tree blob of the sabrelite does not contain a node for the
> > ethernet phy specifying phy address, so I suspect Linux kernel driver
> > is using default phy address 0 instead.
> >
> > Could you please test on a real hardware to see what happens?
> >
>
> The problem is that qemu returns 0 when the OS tries to read from a
> non-existing PHY. Linux expects it to return 0xffff, and believes that
> a PHY is there if 0 is returned. This helps:

Good catch! Please send a patch for this.

>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index f03450c028..3c90c38e26 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -285,7 +285,7 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
>      if (phy != s->phy_num) {
>          qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad phy num %u\n",
>                        TYPE_IMX_FEC, __func__, phy);
> -        return 0;
> +        return 0xffff;
>      }
>
> Note that this is not really a guest error; any OS can and likely
> will scan the MII bus for connected phy chips.

Agree.

Regards,
Bin
