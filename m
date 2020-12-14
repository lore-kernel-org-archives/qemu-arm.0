Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o7sm16481507wrw.62.2020.12.14.11.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 11:05:15 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B6ADA1FF7E;
	Mon, 14 Dec 2020 19:05:14 +0000 (GMT)
References: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
 <1607937538-69471-2-git-send-email-bmeng.cn@gmail.com>
 <87blewvftl.fsf@linaro.org>
 <CAEUhbmVJbdi_STsy=SGxYapLdd9oZq5i0abhjzKLzyjYA9Yxbw@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, Peter Maydell
 <peter.maydell@linaro.org>, "qemu-devel@nongnu.org Developers"
 <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org
 <qemu-arm@nongnu.org>
Subject: Re: [PATCH 1/3] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
Date: Mon, 14 Dec 2020 19:05:01 +0000
In-reply-to: <CAEUhbmVJbdi_STsy=SGxYapLdd9oZq5i0abhjzKLzyjYA9Yxbw@mail.gmail.com>
Message-ID: <87mtygtdhx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1bikPmpzmg/0


Bin Meng <bmeng.cn@gmail.com> writes:

> On Mon, Dec 14, 2020 at 6:32 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>
>>
>> Bin Meng <bmeng.cn@gmail.com> writes:
>>
>> > From: Bin Meng <bin.meng@windriver.com>
>> >
>> > U-Boot expects PMU_MISC0 register bit 7 is set (see init_bandgap()
>> > in arch/arm/mach-imx/mx6/soc.c) during boot. This bit indicates the
>> > bandgap has stabilized.
>> >
>> > With this change, the latest upstream U-Boot (v2021.01-rc3) for imx6
>> > sabrelite board (mx6qsabrelite_defconfig), with a slight change made
>> > by switching CONFIG_OF_SEPARATE to CONFIG_OF_EMBED, boots to U-Boot
>> > shell on QEMU with the following command:
>> >
>> > $ qemu-system-arm -M sabrelite -m 1G -kernel u-boot -display none \
>> >     -serial null -serial stdio
>> >
>> > Boot log below:
>> >
>> >   U-Boot 2021.01-rc3 (Dec 12 2020 - 17:40:02 +0800)
>> >
>> >   CPU:   Freescale i.MX?? rev1.0 at 792 MHz
>> >   Reset cause: POR
>> >   Model: Freescale i.MX6 Quad SABRE Lite Board
>> >   Board: SABRE Lite
>> >   I2C:   ready
>> >   DRAM:  1 GiB
>> >   force_idle_bus: sda=3D0 scl=3D0 sda.gp=3D0x5c scl.gp=3D0x55
>> >   force_idle_bus: failed to clear bus, sda=3D0 scl=3D0
>> >   force_idle_bus: sda=3D0 scl=3D0 sda.gp=3D0x6d scl.gp=3D0x6c
>> >   force_idle_bus: failed to clear bus, sda=3D0 scl=3D0
>> >   force_idle_bus: sda=3D0 scl=3D0 sda.gp=3D0xcb scl.gp=3D0x5
>> >   force_idle_bus: failed to clear bus, sda=3D0 scl=3D0
>> >   MMC:   FSL_SDHC: 0, FSL_SDHC: 1
>> >   Loading Environment from MMC... *** Warning - No block device, using=
 default environment
>> >
>> >   In:    serial
>> >   Out:   serial
>> >   Err:   serial
>> >   Net:   Board Net Initialization Failed
>> >   No ethernet found.
>> >   starting USB...
>> >   Bus usb@2184000: usb dr_mode not found
>> >   USB EHCI 1.00
>> >   Bus usb@2184200: USB EHCI 1.00
>> >   scanning bus usb@2184000 for devices... 1 USB Device(s) found
>> >   scanning bus usb@2184200 for devices... 1 USB Device(s) found
>> >          scanning usb for storage devices... 0 Storage Device(s) found
>> >          scanning usb for ethernet devices... 0 Ethernet Device(s) fou=
nd
>> >   Hit any key to stop autoboot:  0
>> >   =3D>
>> >
>> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> > ---
>> >
>> >  hw/misc/imx6_ccm.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
>> > index cb74042..7e031b6 100644
>> > --- a/hw/misc/imx6_ccm.c
>> > +++ b/hw/misc/imx6_ccm.c
>> > @@ -450,7 +450,7 @@ static void imx6_ccm_reset(DeviceState *dev)
>> >      s->analog[PMU_REG_3P0] =3D 0x00000F74;
>> >      s->analog[PMU_REG_2P5] =3D 0x00005071;
>> >      s->analog[PMU_REG_CORE] =3D 0x00402010;
>> > -    s->analog[PMU_MISC0] =3D 0x04000000;
>> > +    s->analog[PMU_MISC0] =3D 0x04000080;
>>
>> Are the registers different on the imx6ul machine or should a similar
>> change be made to imx6ul_ccm_reset?
>
> I am not sure. I did not try the mcimx6ul-evk machine. I only looked
> at the i.MX6 DQ reference manual, and current user in QEMU of this
> imx6_ccm is only the sabrelite machine.
>
>>
>> Also what is the write behaviour of this bit? If it is RAO/WI then
>> analog_mask needs fixing so a write to the register doesn't reset the
>> state.
>>
>> >      s->analog[PMU_MISC1] =3D 0x00000000;
>> >      s->analog[PMU_MISC2] =3D 0x00272727;
>>
>
> There is no analog_mask in the imx6_ccm codes. It exists in the
> imx6ul_ccm however.

My bad - I was grepping for PMU_MISC0. It would be nice to nail down if
there is any similarity between the two instances. Doing a diff between
the two does look pretty similar which makes me wonder if there is scope
for a more generic shared code implementation with a few feature flags.
I suspect that is a more involved job however which is out of scope for
this series.

>
> The i.MX6 DQ reference manual says this bit is RW, and does not
> document the behavior of write. AFAICT this bit is only concerned by
> the bootloader.
>
> Regards,
> Bin


--=20
Alex Benn=C3=A9e
