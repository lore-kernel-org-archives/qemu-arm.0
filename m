Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp700790lfb;
        Fri, 22 Jan 2021 02:10:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0rsDdLef1BZS7wLVUXiMyWoEtKcFEDgJZ9AzcQQfvsNP+PabRghAEZGgxfEcJGe8AQqVC
X-Received: by 2002:a25:b213:: with SMTP id i19mr5320265ybj.8.1611310223412;
        Fri, 22 Jan 2021 02:10:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611310223; cv=none;
        d=google.com; s=arc-20160816;
        b=QTN0UsftyRGfTxPmmKyAt/+AuVDxVxmxwnuEp0XiT7o+AksxFWCsqI7Rgtyg1kFoCB
         LiMupc1FbcVpmsPamnuj6PObdIavckCFPgyEw4f+ftgmgO0C64/pWOG/VQ0DlI9A0nZ5
         Dw2FD/VfyTtBlxECW4efatvhGP4MJwt7lUrxkWKarpXzDcuVVmv0oOWig1vrV6BRiLw4
         EIVcWcbUvSqCSVYncpLrNQB1PoFFqsCWn/dKPslA2iNjKi63LSxLCQ2jTVpkVnKZUExy
         TOX1jsPxvJLQ985S9oT1Xq3UHYngRtAQceX4v7efMPySA6zyUr+Q7ptx4Hayx4hhm/Ga
         0iEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pz2BAK6BIJ0piLML6OEwXDhTyZhnyFCBijcWaayNwTw=;
        b=SbTROQjtA6vuLOzYUSWN4NE5J6VQ57wD74DI2Ado08UOg+TnMOV0F+J1Y6/H7BAubr
         WhP23NNn5Re1gamgjGfpRCGvp7lBwcOSJm2h9BWGpJ8wSIk/yxD0er27TyOkZOXc0Pj/
         K90m9xwnDb++QL/Xq3EnBBE6ZFG00ud40zkbAQv5IaNMvmlMRFx0DKjClu6qN4NZUYer
         7udHa4T+KUyML5Nnj91uQJLIDiObH/ZmAW3PTYY0VNTm14Ek/olYyygW6n6zm5LXJngz
         8Tlu5VVJEoNCEzgeZJrR/7BCX3zubL7ZzozKCnC/mysVJSGekybhCM18BgmCC3Nu5XGa
         i/aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GDqPPUaG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19si7587101ybj.479.2021.01.22.02.10.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 02:10:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GDqPPUaG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2tOY-0001eY-Os
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 05:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2tO7-0001eE-8K
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 05:09:55 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2tO0-0007Jw-Jy
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 05:09:54 -0500
Received: by mail-ed1-x52e.google.com with SMTP id g24so5856711edw.9
 for <qemu-arm@nongnu.org>; Fri, 22 Jan 2021 02:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pz2BAK6BIJ0piLML6OEwXDhTyZhnyFCBijcWaayNwTw=;
 b=GDqPPUaGRBwC+bua0rI+yw+HOo+xic4uGmAJlkVX/61KhXdLo1GNnCARcLFqIrCItV
 2huGAxPDXyfoIvHLtIH2gKv4UHIqs30Qg0u7sUSVWf0+rzxyNDSqOhu3Rpl9gCnVcxM3
 wkCnXMv9KPERY8Y2JUra3/Kbyyj3kqCwt+enj9fUEGHgtB5sudI03fqYX/uduHxr8aKx
 s054lDY0Fro6e/pJEkssf/mXV7vCVBn4Y0NtTRH4kaL6eGGtTztOtCkaeKaWixdTOWZZ
 L6RdaabxerBfsF9k0CN/CEZSFzHKSOVJlnuErer+XFQNDnmoMUnDTvwMbGt2pyYRWmL3
 WIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pz2BAK6BIJ0piLML6OEwXDhTyZhnyFCBijcWaayNwTw=;
 b=aQK0ObqF695JoBtfMso5+7DOx5/UWTzcgRE+AugTTYJU4QDh8/gJvJPsFCKOq7zmnk
 PT5eXOFAIZ25pEPuF0CNQCLXkfqQvC79CcA5qPCvEm7KU2GNqIY8KDNDQxtY/cJ9hbMI
 KKfp2qhFwM3DeRIRnKDVPWaCmlPsEge2TOKSnVH6C7u3CTkHQPT3SBZ5vCTo0I4Ddm1H
 99DIC8KpqrjrWru63kMD8DLqnCrMUbaR9nDhg6t3lOIyjBbsJUl+KyFb1drvqtS79o+b
 kWKwo5UNt89lBnTrqSfVRnd19UCWoWIchuHQ2/FQnHhQLy+3/nxQKE2FDg/Lbh1AYuYR
 E99g==
X-Gm-Message-State: AOAM531lCS7MnoEea6fsP1vyxc6sZ0nNG6baZGZlCZNASF/GGCJRRScc
 frc4OJ0dqGWaG6pTlxuibdWJnMgsgW8aTFwBAJc+dA==
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr2531893edv.100.1611310186544; 
 Fri, 22 Jan 2021 02:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20210120092748.14789-1-maxim.uvarov@linaro.org>
 <20210120092748.14789-4-maxim.uvarov@linaro.org>
 <20210122082926.nakttrh53zzt6d2x@kamzik.brq.redhat.com>
In-Reply-To: <20210122082926.nakttrh53zzt6d2x@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 10:09:35 +0000
Message-ID: <CAFEAcA9Oa7BXPhzK4BytsQiByP-MWEnm6OsdBhc6w9+5y4BnFQ@mail.gmail.com>
Subject: Re: [PATCHv8 3/3] arm-virt: add secure pl061 for reset/power down
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n4ZeW3OL129q

On Fri, 22 Jan 2021 at 08:29, Andrew Jones <drjones@redhat.com> wrote:
>
> On Wed, Jan 20, 2021 at 12:27:48PM +0300, Maxim Uvarov wrote:
> > Add secure pl061 for reset/power down machine from
> > the secure world (Arm Trusted Firmware). Connect it
> > with gpio-pwr driver.
> >
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > ---
> >  hw/arm/Kconfig        |  1 +
> >  hw/arm/virt.c         | 47 +++++++++++++++++++++++++++++++++++++++++++
> >  include/hw/arm/virt.h |  2 ++
> >  3 files changed, 50 insertions(+)
> >
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 0a242e4c5d..13cc42dcc8 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -17,6 +17,7 @@ config ARM_VIRT
> >      select PL011 # UART
> >      select PL031 # RTC
> >      select PL061 # GPIO
> > +    select GPIO_PWR
> >      select PLATFORM_BUS
> >      select SMBIOS
> >      select VIRTIO_MMIO
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index c427ce5f81..060a5f492e 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -153,6 +153,7 @@ static const MemMapEntry base_memmap[] = {
> >      [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
> >      [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
> >      [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
> > +    [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
> >      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
> >      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
> >      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> > @@ -841,6 +842,43 @@ static void create_gpio_keys(const VirtMachineState *vms,
> >                             "gpios", phandle, 3, 0);
> >  }
> >
> > +#define SECURE_GPIO_POWEROFF 0
> > +#define SECURE_GPIO_REBOOT   1
> > +
> > +static void create_gpio_pwr(const VirtMachineState *vms,
>
> This function is specific to the secure view. I think it should have
> "secure" in its name.
>
> > +                            DeviceState *pl061_dev,
> > +                            uint32_t phandle)
> > +{
> > +    DeviceState *gpio_pwr_dev;
> > +
> > +    /* gpio-pwr */
> > +    gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1, NULL);
>
> Should this device be in secure memory?

It's not in any memory at all -- -1 as the address argument
to sysbus_create_simple() means "no MMIO regions to map". The
only way it's connected to the rest of the system is via  the
secure-only PL061, so the NS world can't get at it.

(sysbus_create_simple("device", -1, NULL) is equivalent to:
 dev = qdev_new("device");
 sysbus_realize_and_unref(SYSBUS_DEVICE(dev), &error_fatal);
)

thanks
-- PMM
