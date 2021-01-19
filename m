Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3337934lfq;
        Tue, 19 Jan 2021 05:48:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgPB8iwHUeEWmLCPbmPv/oQhy0ZVTlnkmIt1sTL++dnILf9duXzNs0TzQmV6UgS5Z3HH3y
X-Received: by 2002:a25:1b05:: with SMTP id b5mr5876530ybb.298.1611064108814;
        Tue, 19 Jan 2021 05:48:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611064108; cv=none;
        d=google.com; s=arc-20160816;
        b=r4H7ROU+r0dyznkOwJU/Yd1+kgifdlZEYbNZUtFoMf0slEUNwZ+UT8bXCyHftJuR8R
         UKE9AaMfXVHSz1q2D05/QKflWqBb1hSnLNJ257n+ixGBCkyTqVnhPDfP2usSKsF3clfu
         s5gWvOU10uG07ucSvcRbh3ChZdf1gW8ay8iR/LlgAjar1XKRZgwIyjt3x68E4BoTLAaW
         yIZO+JtjhD6Ri/tnqh7I/+bacxu/b/JfqbV0vC08FkD3L/kqCcqs+MLPXGgNEDCu8X1n
         sU3gcf2FJpbGZtS6A9NBPc3fmOlryc4NFE+MQx051wPkQQ9BdGhJ/h5gu/PkVHifaiZu
         rKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Q67n+S3uEeYMHzmz+arcMT93DBurRu0RAfUk0JZzFc=;
        b=WfoZwI00WypBumVMVG64FV0OqGA8bgp/cOrU/jG70Q3hwmiu7Hb9fEdm0HFyLjseca
         pn9p+P985g281fFnzAL8tx+s0WnUGI0g685DwlvPx9zLpXrpXrjbpvaYbddr1pfZr7Qb
         Wi6Mg31Mm4j4HGDVeof0hGacWM/X4Kr+q2razIJZ7ztx+hYC5cgpyHTEVUhz7v1TQh25
         fMpe6FKEAsaAFOw6CBqAQK11Vpm9NTTDPmLENqZWrK4cPEpXYXcmcFD6w8pGzubG68dy
         W6egO7zz6RQu3QVOxO+EFWh2dq1TaRI0WbRWGz43Xim0dElkVBmyCqALTdL+RtldFQM6
         iPGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="We/Vwhrf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11si21214727ybp.365.2021.01.19.05.48.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 05:48:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="We/Vwhrf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1rMy-0001oB-3J
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 08:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l1rMG-0001kb-Ae
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 08:47:44 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l1rM8-0004k2-1X
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 08:47:42 -0500
Received: by mail-pj1-x1033.google.com with SMTP id kx7so2615749pjb.2
 for <qemu-arm@nongnu.org>; Tue, 19 Jan 2021 05:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Q67n+S3uEeYMHzmz+arcMT93DBurRu0RAfUk0JZzFc=;
 b=We/VwhrfDdS0qp2/IYN8JA7q2yFFjUdin5S3iBOJOcAmJcL53o0yWHKI/j75c8fzr0
 8NxAoxTFUfbXsQwnQPf8YCKHTWgUWJtMf054s5Whn3AnUMXrRDuOiybr8thmg/5H6t+D
 1uWXC1aIKUq7H6Zvz2bMyUUBMaMVmLEAIqjZn7ZZz60T2x0boONeYtPnzNh5DZPSPFjS
 o7nKdosFZH97fAX36E2mcPfnISOdNWbToTZKd9eEO1VXEagElZKs0nwg8lzH6q0wT7EY
 g+RWzP1m8WQyfuU96yJ9Q3ULXGRcmm9OKiyAJjhtg/VYK0egpfbkpgS9zZh1iWlIxaCc
 esLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Q67n+S3uEeYMHzmz+arcMT93DBurRu0RAfUk0JZzFc=;
 b=Tib0W/eUml75FcNtiTWKXuxqeVGrjuhAMeFLxUDjoeT1+P7VtTRYnhRZdYReErBs3z
 bEXYhYW9vwwqR1M8t4HISPlyZd9XFWjd6uI102AY+CJeO9F/oJwp6SbZxh7EWjGOg7UM
 OUnBffW9uyxO2i6+8RbbqICdiu8th2sBYkZ9+TYlIr2I5bnM7TY8TUrAOs7zFCZuKu3F
 4sNeSOpLiWQKbyjwLiRKM4lWObSH+HOmuAAH1YvTqzSdT+7yJBzfrdmGwqMM3X6FcI3s
 nIxW7SquOMqgxh+ABVFZD5trQ9LIB9HD2GMDQmylS4i9WxvjL8Y8mBghxYbHU7dqzQxt
 SPlQ==
X-Gm-Message-State: AOAM530Dxf599POrdbSDr0M12h7wzdBXkif9usk5FdGGruLNNjSHPYNo
 OhvDRcF+Nr4RZGquAMazXQSzT95oxSiboZAX6V3CMQ==
X-Received: by 2002:a17:90a:808a:: with SMTP id
 c10mr5541698pjn.229.1611064052691; 
 Tue, 19 Jan 2021 05:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20210115101126.4259-1-maxim.uvarov@linaro.org>
 <20210115101126.4259-4-maxim.uvarov@linaro.org>
 <CAFEAcA-p-H6ZS_8gwVWmBEnzoa0GtqNwUAESx2bXp3wpoGs9aQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-p-H6ZS_8gwVWmBEnzoa0GtqNwUAESx2bXp3wpoGs9aQ@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Tue, 19 Jan 2021 16:47:21 +0300
Message-ID: <CAD8XO3YjP8RUDd2T6+VwfnnCm4fk-i6x5DbmtOHF553yxt9Jtw@mail.gmail.com>
Subject: Re: [PATCHv7 3/3] arm-virt: add secure pl061 for reset/power down
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J0YuwZHa4+sX

On Tue, 19 Jan 2021 at 16:07, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 15 Jan 2021 at 10:11, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> >
> > Add secure pl061 for reset/power down machine from
> > the secure world (Arm Trusted Firmware). Connect it
> > with gpio-pwr driver.
> >
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > ---
> >  hw/arm/Kconfig        |  1 +
> >  hw/arm/virt.c         | 50 +++++++++++++++++++++++++++++++++++++++++++
> >  include/hw/arm/virt.h |  2 ++
> >  3 files changed, 53 insertions(+)
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
> > index 26bb66e8e1..436ae894c9 100644
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
> > @@ -841,6 +842,46 @@ static void create_gpio_keys(const VirtMachineState *vms,
> >                             "gpios", phandle, 3, 0);
> >  }
> >
> > +#define ATF_GPIO_POWEROFF 3
> > +#define ATF_GPIO_REBOOT   4
>
> These aren't ATF specific, so you could name them SECURE_GPIO_POWEROFF
> and SECURE_GPIO_REBOOT.
>
OK.

> Remind me why we start with GPIO line number 3 and not 0 ?
>

Original gpio power key use 3 and 4 (non-secure). I just selected the
same to be consistent.


> > +
> > +static void create_gpio_pwr(const VirtMachineState *vms,
> > +                            DeviceState *pl061_dev,
> > +                            uint32_t phandle)
> > +{
> > +    DeviceState *gpio_pwr_dev;
> > +
> > +    /* gpio-pwr */
> > +    gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1, NULL);
> > +
> > +    /* connect secure pl061 to gpio-pwr */
> > +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_POWEROFF,
> > +                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
> > +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_REBOOT,
> > +                          qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));
>
> You've connected the POWEROFF gpio line to 'reset' and the
> REBOOT line to 'shutdown'. This looks like it's backwards.
>

Oh, yes. Thanks for finding that.

> > +    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr");
> > +    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr", "compatible", "gpio-pwr");
> > +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr", "#size-cells", 0);
> > +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr", "#address-cells", 1);
> > +
> > +    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr/poweroff");
> > +    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr/poweroff",
> > +                            "label", "GPIO PWR Poweroff");
> > +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr/poweroff", "code",
> > +                          ATF_GPIO_POWEROFF);
> > +    qemu_fdt_setprop_cells(vms->fdt, "/gpio-pwr/poweroff",
> > +                           "gpios", phandle, 3, 0);
> > +
> > +    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr/reboot");
> > +    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr/reboot",
> > +                            "label", "GPIO PWR Reboot");
> > +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr/reboot", "code",
> > +                          ATF_GPIO_REBOOT);
> > +    qemu_fdt_setprop_cells(vms->fdt, "/gpio-pwr/reboot",
> > +                           "gpios", phandle, 3, 0);
>
> There doesn't seem to be any documented 'gpio-pwr' devicetree
> binding. Where does this come from ?
>
gpio-pwr created from the first patch.  There are no bindings yet.

> I think the bindings you want to be using are
> https://www.kernel.org/doc/Documentation/devicetree/bindings/power/reset/gpio-restart.txt
> https://www.kernel.org/doc/Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt
>
These handles are from 'secure memory' where linux does not have
access.  But I think we can use that
binding with other compatible. Like compatible = "gpio-poweroff,secure".

Maxim.

> thanks
> -- PMM
