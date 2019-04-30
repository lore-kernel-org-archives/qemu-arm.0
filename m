Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4782178wrh;
        Tue, 30 Apr 2019 07:17:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwtTOidN6vgfwP13/kER+uQi3ItI0lGXoJlC9OVYvp4gINkk9Zj0bA7FnL4Mfk1dPczgm4s
X-Received: by 2002:a1c:81cc:: with SMTP id c195mr3287772wmd.61.1556633849400;
        Tue, 30 Apr 2019 07:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556633849; cv=none;
        d=google.com; s=arc-20160816;
        b=bc7MbvklGw1TXLLuL+3t6GZTKKEOkK1J9IQBvZi/UC7QldNHrfZ6ATPMwRemHBotwd
         xYkoxA1oFO+cg3V/3HjSn+MId897v875avnAM+uIXh0fHTxDlEQoWXLE0K0X3IJyHC2O
         tElZZN4Jo0VQefePVIl+xk3Qfm/COUJTv3dnooBlSfEQo3dYqtI6aWw0YdwnykQHgkhe
         af+gjJ/lw2Uo1UZAICx2mkpytg4irccXhqcT76+eQ9K7sii01Clb4JMM6oj/xNMvNoEk
         DhOEnocvx/Sf9weFT/Ivbdz2fhYJiZcSErB/wrIK1e4jULi7YEffOzvCcya1tZEHBchn
         2hyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oMh7iWcXAytvlvEHTXWoOdsLJGJYV9qHq2JPyOdE2Kk=;
        b=iHy236RzpQfnPTpHxcK70ntluJ+ZXr7uydkZKaZT07peIaVE4ygiyCiAPEuMmL/e1N
         8bWPs3ZHKCFyee3G0JXMhRxe19E3ZLgwBUFfFItffhtIee23BbTIWt5iSPSoMvU2Xm/M
         DU6MRXVEv1NtDM5Ci/M0OOelSlQtbygq8XGShzXssMO5RE8LfiKilINzKajSfjbCK/TV
         zX1pgjT25Lq+HOWHs41HKva636sUioMGfoi4yiatmLJYUwXyI+HByc8Svjor1fhaeAry
         WBM9wbjW82o2GwMZshlkK+Vsir/rEQ5mYEzMrDnD/nXXK255wMUcxs6JoKtt72/NX/iX
         H5NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x3K5sN6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si18737126wru.441.2019.04.30.07.17.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 07:17:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x3K5sN6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLTZY-0001Pa-Bf
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 10:17:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLTZJ-0001Oi-To
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 10:17:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLTZI-0007LT-KE
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 10:17:13 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37658)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLTZI-0007KA-FS
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 10:17:12 -0400
Received: by mail-ot1-x341.google.com with SMTP id r20so10899837otg.4
	for <qemu-arm@nongnu.org>; Tue, 30 Apr 2019 07:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oMh7iWcXAytvlvEHTXWoOdsLJGJYV9qHq2JPyOdE2Kk=;
	b=x3K5sN6ppSjSKwO5cnkJBD+ptH/250muve3hAD6QAl9J4POyEk+bDjdvKK3v5zIwNt
	wECLI1JTtUXLdV4CnOLcLB/RnBpNKMuygTyAdrUJWMXsZamfdD/wGVFmmRhvuBZka1NT
	5JlupDKS8Y/UHKya4LZVO5UsMfCgCCpUPOP5RXpG8RBrPwX0v+R1dGyjQGbn9ziYB94F
	SAhDzjisGImAUY/24YwhOqIecqfhFn3TfWs4SR/2Bfbnve/OIEwjUQqHdQQPtJTbUCqi
	j/0Vb/F/VDtDCLO31TEGo0FtGPMGh+wqtWs5UpygeVIEkddQm6iAHBjqCJrQgAK9kOjC
	v71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oMh7iWcXAytvlvEHTXWoOdsLJGJYV9qHq2JPyOdE2Kk=;
	b=CE9B0+fSoyftJeNDwzNN0qsayrZ6G5sC316EchjJ58vRhLhlqvyi9MdnwG0I4smXpF
	GKdH2h94uQ1grP6CY59idQn8UYd4onOjFFAsRYIr/Qsi5Dt+BVFhLRwzWLHEaGv6Z4rL
	cL6lh4wLhdjLkV9g6xUR/z+zuqnvcGv/8h9OeZ4XsyAr3MFfcv0QEEI4g9aZmGavIFwg
	KSRFT0gjltR3KJYMFHZzgsDTkftWoEWtoAzryHyJfJdhel8OYHjL99gmNSv4khtg4Wel
	JFBx59EKakRKJZ1W0JI/KuEfgm2P/rmjvMfYYFDGFn+iYkhu9T3iRz99MO37Zxqwj/ok
	WaLA==
X-Gm-Message-State: APjAAAV3JFmE1Lk9ES0bq5p+0RFBpdj81lcWSxFR/BGYLl2j3ZIg2J18
	tqibnvFDsiOq+R/ktMGEWK13IW2sHJbmu/OMvePgiA==
X-Received: by 2002:a9d:57c4:: with SMTP id q4mr7851219oti.151.1556633830118; 
	Tue, 30 Apr 2019 07:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <1555560291-3415-1-git-send-email-hongbo.zhang@linaro.org>
	<1555560291-3415-3-git-send-email-hongbo.zhang@linaro.org>
In-Reply-To: <1555560291-3415-3-git-send-email-hongbo.zhang@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2019 15:16:59 +0100
Message-ID: <CAFEAcA-poCxPqPtfhx4mUJ5pcOjn1Hz-WNxEt29f=JgpFMi4Kg@mail.gmail.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v7 2/2] hw/arm: Add arm SBSA reference
 machine, devices part
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PvpYzS/hoOan

On Thu, 18 Apr 2019 at 05:05, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>
> Following the previous patch, this patch adds peripheral devices to the
> newly introduced SBSA-ref machine.
>
> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 451 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 451 insertions(+)

Some fairly minor comments on this one.

> +static void create_flash(const SBSAMachineState *vms,
> +                         MemoryRegion *sysmem,
> +                         MemoryRegion *secure_sysmem)
> +{
> +    /*
> +     * Create one secure and nonsecure flash devices to fill SBSA_FLASH
> +     * space in the memmap, file passed via -bios goes in the first one.
> +     */
> +    hwaddr flashsize = vms->memmap[SBSA_FLASH].size / 2;
> +    hwaddr flashbase = vms->memmap[SBSA_FLASH].base;
> +
> +    create_one_flash("sbsa-ref.flash0", flashbase, flashsize,
> +                     bios_name, secure_sysmem);
> +    create_one_flash("sbsa-ref.flash1", flashbase + flashsize, flashsize,
> +                     NULL, sysmem);
> +}

I think Markus might have an opinion on the best way to create
flash devices on a new board model. Is "just create two flash
devices the way the virt board does" the right thing?

> +static void create_ahci(const SBSAMachineState *vms, qemu_irq *pic)
> +{
> +    hwaddr base = vms->memmap[SBSA_AHCI].base;
> +    int irq = vms->irqmap[SBSA_AHCI];
> +    DeviceState *dev;
> +    DriveInfo *hd[NUM_SATA_PORTS];
> +    SysbusAHCIState *sysahci;
> +    AHCIState *ahci;
> +    int i;
> +
> +    dev = qdev_create(NULL, "sysbus-ahci");
> +    qdev_prop_set_uint32(dev, "num-ports", NUM_SATA_PORTS);
> +    qdev_init_nofail(dev);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[irq]);
> +
> +    sysahci = SYSBUS_AHCI(dev);
> +    ahci = &sysahci->ahci;
> +    ide_drive_get(hd, ARRAY_SIZE(hd));
> +    for (i = 0; i < ahci->ports; i++) {
> +        if (hd[i] == NULL) {
> +            continue;
> +        }
> +        ide_create_drive(&ahci->dev[i].port, 0, hd[i]);
> +    }
> +}
> +
> +static void create_ehci(const SBSAMachineState *vms, qemu_irq *pic)
> +{
> +    hwaddr base = vms->memmap[SBSA_EHCI].base;
> +    int irq = vms->irqmap[SBSA_EHCI];
> +    USBBus *usb_bus;
> +
> +    sysbus_create_simple("platform-ehci-usb", base, pic[irq]);
> +
> +    usb_bus = usb_bus_find(-1);
> +    usb_create_simple(usb_bus, "usb-kbd");
> +    usb_create_simple(usb_bus, "usb-mouse");

I don't think we should automatically create the usb keyboard
and mouse devices. The user can do it on the command line if they
want them.

>  static void sbsa_ref_init(MachineState *machine)
>  {
>      SBSAMachineState *vms = SBSA_MACHINE(machine);
> @@ -125,6 +552,7 @@ static void sbsa_ref_init(MachineState *machine)
>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>      const CPUArchIdList *possible_cpus;
>      int n, sbsa_max_cpus;
> +    qemu_irq pic[NUM_IRQS];
>
>      if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a57"))) {
>          error_report("sbsa-ref: CPU type other than the built-in "
> @@ -209,11 +637,34 @@ static void sbsa_ref_init(MachineState *machine)
>                                           machine->ram_size);
>      memory_region_add_subregion(sysmem, vms->memmap[SBSA_MEM].base, ram);
>
> +    create_fdt(vms);
> +
> +    create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
> +
> +    create_secure_ram(vms, secure_sysmem);
> +
> +    create_gic(vms, pic);
> +
> +    create_uart(vms, pic, SBSA_UART, sysmem, serial_hd(0));
> +    create_uart(vms, pic, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
> +    create_uart(vms, pic, SBSA_SECURE_UART_MM, secure_sysmem, serial_hd(2));

What's the third UART for (ie what is the name intended to mean)?
Should we have more than one non-secure UART?

thanks
-- PMM
