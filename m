Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3306730lfq;
        Tue, 19 Jan 2021 05:08:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIgvePA2uN+oQKepIR2uJQDSujj4ehF/kszJWqMzJmP2EzFaVpMSG8NiqyegFBe9m9T80g
X-Received: by 2002:a25:3897:: with SMTP id f145mr5455382yba.2.1611061726652;
        Tue, 19 Jan 2021 05:08:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611061726; cv=none;
        d=google.com; s=arc-20160816;
        b=aAghUD3xrBz3MmeHKgtOhW7CYK2z4PKTG8Ce0Bfj7ZMmJYko7Lip8xQOyzaunZviuP
         Iz3Z+BGlChDfbHdKOa5g+pda6Sp9Z0PLtsKpjvVeSIvCMtnj+uyi2lQyP8MBjlvApR9W
         sohL6xM+29TZyxn5R4HfxNM55esUynzwyk9wumhOrUl5OKqXlAVhe4AAPui0fvjZAVJM
         uxSGXtWaOtwa7IQergKztYqp2dE9NSoZA7MTz3sSFN9QfM+MbCMzbUS03KZTvs4Y5nqf
         0wxZRVjyyZ/XFro87kLSAFmUiAlX7Yg5TYOAy9UuBeLGiVgSbc/bpAoymDgJSrgeyD8E
         gDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5bXiHWkDHuGNqPxK6b0dfBoHjyPw7FWQ4FviaJl/KSw=;
        b=XfvDLA45WRO0xspI/GJSNF21WQ/gzd1uZqZoQcYGTMGCUFfup2rr2lqvt/6o6LZqmD
         TLzB0HU3Gq7PCaQoqEu+4/+vnOS9DNtxJHRInbVH0GuJsVaKwazjWUZ0JFSwDaTrrWES
         k30etL0MMR7G61GS1n44UY6WgGtnNPTchc9HO51nepkrtDXZAX8MKUnhILyVB39znDZ0
         VSrPOvIFfMWLK02tL/RPwCEp/t4UGmtEi4OAUB/3qXkVZ2O7jaCLASHjIbBPc3TG2uYw
         /A+PfGDjEWcGM+CeiNyswdjIqWnRJJl6b1AbmUXbY6thgZSUJXhDI2cOO99FT9TVbAoo
         eG8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=POmsJaS5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e74si1782294ybf.391.2021.01.19.05.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 05:08:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=POmsJaS5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1qkY-0002K8-2P
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 08:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1qjm-0002JS-SC
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 08:07:59 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:32790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1qjk-0006ns-Po
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 08:07:58 -0500
Received: by mail-ed1-x531.google.com with SMTP id c6so14298195ede.0
 for <qemu-arm@nongnu.org>; Tue, 19 Jan 2021 05:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5bXiHWkDHuGNqPxK6b0dfBoHjyPw7FWQ4FviaJl/KSw=;
 b=POmsJaS596r11EIb9KM3Bv7X38itEd52XRgTByy3L8I9G9io0QwT9L8azr356E8wOt
 lLIO+cWSWZOYnZGuX4jzpjb4ym3NcUa2UPTw7u/vHH7CE2QClzQpHtyHIK691JMA7VkW
 tNQZCX7mlKkXXz9dR5DQCf1xXZpP4pIN9z6sgfLS0VksV3GAZGKgXjYFWsrrmyjk8ibZ
 aQcsBt6yecwe8S8liWXcDPvVYMJLnLp4fkkbpcdmArWuGeBDkN9is7eMyvoMRcZR2572
 KNiF7cfv0kNYVuAdZQHr79Ybaqs4thbdxxXbnm7x3Ky29YLarRGJeZ1uWMuDDrRyqNpQ
 r69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5bXiHWkDHuGNqPxK6b0dfBoHjyPw7FWQ4FviaJl/KSw=;
 b=b92km94BScHFGXz3LXNW7BSIiEQ7H13u2fldeZLm+ktE/8qQaKXGpvuEalPLN/5ffy
 GvVARdQg7OQoeStRYrF3V6HNN5FxD26BBRGYdT9PJcShDfbPuRFVpKV/CWveg2PmTKqZ
 97zXeX6FjPz1oGnX2lyBilsqgCy/X0gdkTYug+VwCax2wmDrtysXjrXgpWzs9CTwMmN/
 r/mkxz4oVe32jQl/DdwUBMSy00h3VFjQG7tWi1IRWS1jXDLuObA42W/awwfHSe078iZk
 KO+o3VQ/pXcDsBajriQ2BXTuLLDs3zqw/gv3064EIWEGOcv1CCGQWG8fNNFI6KRgbt94
 5gug==
X-Gm-Message-State: AOAM532mZD+knJ8UIS2zTcOkuKO3TfNQykt3NwD7CXQsvGfjCEhqW0AV
 TPfv1dwODZm6c08qbTLMpk24DnToo/3FjmRiW/HmIQ==
X-Received: by 2002:a50:9ee3:: with SMTP id a90mr3338287edf.44.1611061675047; 
 Tue, 19 Jan 2021 05:07:55 -0800 (PST)
MIME-Version: 1.0
References: <20210115101126.4259-1-maxim.uvarov@linaro.org>
 <20210115101126.4259-4-maxim.uvarov@linaro.org>
In-Reply-To: <20210115101126.4259-4-maxim.uvarov@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 13:07:43 +0000
Message-ID: <CAFEAcA-p-H6ZS_8gwVWmBEnzoa0GtqNwUAESx2bXp3wpoGs9aQ@mail.gmail.com>
Subject: Re: [PATCHv7 3/3] arm-virt: add secure pl061 for reset/power down
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: oQwdbKyHF/CE

On Fri, 15 Jan 2021 at 10:11, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> Add secure pl061 for reset/power down machine from
> the secure world (Arm Trusted Firmware). Connect it
> with gpio-pwr driver.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  hw/arm/Kconfig        |  1 +
>  hw/arm/virt.c         | 50 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h |  2 ++
>  3 files changed, 53 insertions(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 0a242e4c5d..13cc42dcc8 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -17,6 +17,7 @@ config ARM_VIRT
>      select PL011 # UART
>      select PL031 # RTC
>      select PL061 # GPIO
> +    select GPIO_PWR
>      select PLATFORM_BUS
>      select SMBIOS
>      select VIRTIO_MMIO
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 26bb66e8e1..436ae894c9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -153,6 +153,7 @@ static const MemMapEntry base_memmap[] = {
>      [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
>      [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
>      [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
> +    [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -841,6 +842,46 @@ static void create_gpio_keys(const VirtMachineState *vms,
>                             "gpios", phandle, 3, 0);
>  }
>
> +#define ATF_GPIO_POWEROFF 3
> +#define ATF_GPIO_REBOOT   4

These aren't ATF specific, so you could name them SECURE_GPIO_POWEROFF
and SECURE_GPIO_REBOOT.

Remind me why we start with GPIO line number 3 and not 0 ?

> +
> +static void create_gpio_pwr(const VirtMachineState *vms,
> +                            DeviceState *pl061_dev,
> +                            uint32_t phandle)
> +{
> +    DeviceState *gpio_pwr_dev;
> +
> +    /* gpio-pwr */
> +    gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1, NULL);
> +
> +    /* connect secure pl061 to gpio-pwr */
> +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_POWEROFF,
> +                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
> +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_REBOOT,
> +                          qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));

You've connected the POWEROFF gpio line to 'reset' and the
REBOOT line to 'shutdown'. This looks like it's backwards.

> +    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr");
> +    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr", "compatible", "gpio-pwr");
> +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr", "#size-cells", 0);
> +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr", "#address-cells", 1);
> +
> +    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr/poweroff");
> +    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr/poweroff",
> +                            "label", "GPIO PWR Poweroff");
> +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr/poweroff", "code",
> +                          ATF_GPIO_POWEROFF);
> +    qemu_fdt_setprop_cells(vms->fdt, "/gpio-pwr/poweroff",
> +                           "gpios", phandle, 3, 0);
> +
> +    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr/reboot");
> +    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr/reboot",
> +                            "label", "GPIO PWR Reboot");
> +    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr/reboot", "code",
> +                          ATF_GPIO_REBOOT);
> +    qemu_fdt_setprop_cells(vms->fdt, "/gpio-pwr/reboot",
> +                           "gpios", phandle, 3, 0);

There doesn't seem to be any documented 'gpio-pwr' devicetree
binding. Where does this come from ?

I think the bindings you want to be using are
https://www.kernel.org/doc/Documentation/devicetree/bindings/power/reset/gpio-restart.txt
https://www.kernel.org/doc/Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt

thanks
-- PMM
