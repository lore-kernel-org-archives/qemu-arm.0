Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2437800lfq;
        Mon, 14 Dec 2020 02:43:36 -0800 (PST)
X-Received: by 2002:a05:6902:20a:: with SMTP id j10mr36326660ybs.293.1607942616304;
        Mon, 14 Dec 2020 02:43:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607942616; cv=none;
        d=google.com; s=arc-20160816;
        b=uQ56CRcDhOpJ/UHWHwrxMxEAFCoHM7DXi1cJeXdvw4NEZzf67Cgi5B0NzvmUXsoZBI
         3wMM/uFNxALotPRGdAbOwIQQc791kL5JypDe9qX7XiHLWlSCrIuKvV4W9KKSHA8PX9fm
         L+DO2Yws4ZXoBgn1OLYpTh6/I/jDwr7NoxpbdfUZkhuLpwxLkmRUt3xswa4EoH0CcPg1
         xYmVrQugGPLbEl+XM7JbxOBKZybGlGC+aWaIM/SOewZweNVRAOlEfztpKfoP89JCrziz
         7+z9owXk7pJLDEk7jFIntPsa1PCqMC1V3PKOCYbKoopyga28GYHmYtSgfbqF2l1FYiqx
         NtEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7idFYr6PlxmY4YBaWE+xFS8CtCOdmeghf3me2M7RHYM=;
        b=t0FLppgO7AvgHp24EYAZ9l6vGFttts+t758uaqfiXs9JL1/0JHmSkugXHydqqtWBTu
         rTvpd+lmIU8kh6xV4DWIitlFHzUs0evvp0VmEQGIBI1D9DKNgrP44/Q2s8nqhwDaRk1+
         u/Tjjjo2S64txzi2H38LnduT7LSRNOj0zG1ViFBLGuosGPKBMMJmRNA+W4Qqgt0NoPmM
         +Zu22g05RivLX/PLPj8FOSTrXLhVVazyIm1nV4gcZDvveeOhLCfKl2BZ/Q3LH9Nyd6Ns
         grtI5uWyguzELesRUfZdjVJ1UO7M7YVSbPchvPE2Fel6fqrmqS4Z1g3l/1TKBzqxuX8A
         +BWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jW6Pme0v;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r26sor4021816ybj.184.2020.12.14.02.43.36
        (Google Transport Security);
        Mon, 14 Dec 2020 02:43:36 -0800 (PST)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jW6Pme0v;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7idFYr6PlxmY4YBaWE+xFS8CtCOdmeghf3me2M7RHYM=;
        b=jW6Pme0vql1xSnXuLq+gnYy5HC78OuZjNcffcPCNkrzs6W1lx6yBpBmX3UD02rnrG3
         vLVuvt8/0MNJdVMmLtPHYF8GwsjTPBhaUlDW3+MYk9pTRRHhhhot4AoajOms/29IOqKN
         +dzSlE9go3YXS9+102sz50UL/vgo0ymShG7hNXOaZGLR/l/qBZ2Vo/xcEgrhJVKzwQSr
         ONKoety1aY13Yto3beXxaGeE5Bso//K/wkh+NajRBAzfZR+RYnOX1YShdLQITtFChe2v
         c7x5yIehoP/IwAJEipJYy96wp31GaZX2R8pGl7gemabw2xdwUe8VI4jDN09hGGw7oi8L
         oGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7idFYr6PlxmY4YBaWE+xFS8CtCOdmeghf3me2M7RHYM=;
        b=buFXrCTdKfIaA+YtoaeTKhqNqz/pQNumwzszwV236LXPygKyH0JYpd/VCguz9f5DVf
         mmOs/+eM7sgvOF84W5WHPzYNrdSx9aARakQEf4BZ4NgX4qsdiq3v74hae/c+chTfxSbB
         rgXBPJ2V6ZUbZ9kZ6RucOdAcN9QprQZ/pKUSIwkpOGqe2JTzd4Ka87QiM4IDRtukElTx
         1xBjZLYaBKT/VkzMDkxLUXA2SRZL+H0zhwH6jH1mYaGpeI854LYAWdg4X6Yji4OtIsl4
         ScAl4kBWdtIVwMyDc6JgUHtKUrb9dEtYs6lLwNKJ9mvKzgsspHxVQviUnHRSOjK+j/4c
         xXIg==
X-Gm-Message-State: AOAM530yXjQQg6K0binF49enb5rY6oVB/UqLvUxFu3bD5Ib4B0UEouML
	KsMdQU8nKJ17xltgqpR6kPGG3uwUPC75Fw/jjeDDrLp2abQ=
X-Google-Smtp-Source: ABdhPJw7AAw/Z58dkG72Vx9pwng7tEm+X+m/24DOZerKueLn3H9sXBRhU6GYqMmskOPI8UlaFfIm66dXFAcEtpLAMKE=
X-Received: by 2002:a25:be87:: with SMTP id i7mr34446935ybk.332.1607942615834;
 Mon, 14 Dec 2020 02:43:35 -0800 (PST)
MIME-Version: 1.0
References: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
 <1607937538-69471-2-git-send-email-bmeng.cn@gmail.com> <87blewvftl.fsf@linaro.org>
In-Reply-To: <87blewvftl.fsf@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Dec 2020 18:43:24 +0800
Message-ID: <CAEUhbmVJbdi_STsy=SGxYapLdd9oZq5i0abhjzKLzyjYA9Yxbw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, Peter Maydell <peter.maydell@linaro.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: jbhdzWzDM/3A

On Mon, Dec 14, 2020 at 6:32 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > U-Boot expects PMU_MISC0 register bit 7 is set (see init_bandgap()
> > in arch/arm/mach-imx/mx6/soc.c) during boot. This bit indicates the
> > bandgap has stabilized.
> >
> > With this change, the latest upstream U-Boot (v2021.01-rc3) for imx6
> > sabrelite board (mx6qsabrelite_defconfig), with a slight change made
> > by switching CONFIG_OF_SEPARATE to CONFIG_OF_EMBED, boots to U-Boot
> > shell on QEMU with the following command:
> >
> > $ qemu-system-arm -M sabrelite -m 1G -kernel u-boot -display none \
> >     -serial null -serial stdio
> >
> > Boot log below:
> >
> >   U-Boot 2021.01-rc3 (Dec 12 2020 - 17:40:02 +0800)
> >
> >   CPU:   Freescale i.MX?? rev1.0 at 792 MHz
> >   Reset cause: POR
> >   Model: Freescale i.MX6 Quad SABRE Lite Board
> >   Board: SABRE Lite
> >   I2C:   ready
> >   DRAM:  1 GiB
> >   force_idle_bus: sda=3D0 scl=3D0 sda.gp=3D0x5c scl.gp=3D0x55
> >   force_idle_bus: failed to clear bus, sda=3D0 scl=3D0
> >   force_idle_bus: sda=3D0 scl=3D0 sda.gp=3D0x6d scl.gp=3D0x6c
> >   force_idle_bus: failed to clear bus, sda=3D0 scl=3D0
> >   force_idle_bus: sda=3D0 scl=3D0 sda.gp=3D0xcb scl.gp=3D0x5
> >   force_idle_bus: failed to clear bus, sda=3D0 scl=3D0
> >   MMC:   FSL_SDHC: 0, FSL_SDHC: 1
> >   Loading Environment from MMC... *** Warning - No block device, using =
default environment
> >
> >   In:    serial
> >   Out:   serial
> >   Err:   serial
> >   Net:   Board Net Initialization Failed
> >   No ethernet found.
> >   starting USB...
> >   Bus usb@2184000: usb dr_mode not found
> >   USB EHCI 1.00
> >   Bus usb@2184200: USB EHCI 1.00
> >   scanning bus usb@2184000 for devices... 1 USB Device(s) found
> >   scanning bus usb@2184200 for devices... 1 USB Device(s) found
> >          scanning usb for storage devices... 0 Storage Device(s) found
> >          scanning usb for ethernet devices... 0 Ethernet Device(s) foun=
d
> >   Hit any key to stop autoboot:  0
> >   =3D>
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  hw/misc/imx6_ccm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
> > index cb74042..7e031b6 100644
> > --- a/hw/misc/imx6_ccm.c
> > +++ b/hw/misc/imx6_ccm.c
> > @@ -450,7 +450,7 @@ static void imx6_ccm_reset(DeviceState *dev)
> >      s->analog[PMU_REG_3P0] =3D 0x00000F74;
> >      s->analog[PMU_REG_2P5] =3D 0x00005071;
> >      s->analog[PMU_REG_CORE] =3D 0x00402010;
> > -    s->analog[PMU_MISC0] =3D 0x04000000;
> > +    s->analog[PMU_MISC0] =3D 0x04000080;
>
> Are the registers different on the imx6ul machine or should a similar
> change be made to imx6ul_ccm_reset?

I am not sure. I did not try the mcimx6ul-evk machine. I only looked
at the i.MX6 DQ reference manual, and current user in QEMU of this
imx6_ccm is only the sabrelite machine.

>
> Also what is the write behaviour of this bit? If it is RAO/WI then
> analog_mask needs fixing so a write to the register doesn't reset the
> state.
>
> >      s->analog[PMU_MISC1] =3D 0x00000000;
> >      s->analog[PMU_MISC2] =3D 0x00272727;
>

There is no analog_mask in the imx6_ccm codes. It exists in the
imx6ul_ccm however.

The i.MX6 DQ reference manual says this bit is RW, and does not
document the behavior of write. AFAICT this bit is only concerned by
the bootloader.

Regards,
Bin
