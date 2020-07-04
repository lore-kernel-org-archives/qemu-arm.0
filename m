Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3483219lfm;
        Sat, 4 Jul 2020 10:18:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOf1WyDucMCk1Nr2reku9faUFT9AEYI2mrtf5MBtyhvHzeb1DsqR9Psvchuvv94OPaAcwe
X-Received: by 2002:a25:7086:: with SMTP id l128mr70665128ybc.34.1593883080373;
        Sat, 04 Jul 2020 10:18:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593883080; cv=none;
        d=google.com; s=arc-20160816;
        b=eMETT3ROHz8kHSsD1MBfMzVliot5Gwj36OGr/R+5H+DtWMYSXt6GV9Y39N1os5Uys1
         QfdqIUSa+vBVvJ30Bo0oP/No6ggBdm/d36e3WSvIRChzFysCxFRs1zWLFzFwwLa7rmCe
         BWnK57/lGiaP7tPZ5rt8qV9QCEv9rFXRk3pKCz9dVErGPvvkx3akR1jsKHNDVJUId1uC
         yCWTyyofzX6nS2Ci/02maUqNc8A0TaOYv8SGQYX3dN6890qhtd5ezqay+fBM72D8JLbS
         GLl+XsLp1CUumWLbgreqdsHgyHKoEVdNDIB1WJA68YNsznegAaQkhJ66p0jED3qFTpV5
         wi6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:from:date;
        bh=enXsFHKJAtN89CH813zJTbnBNnC2uuRjeIWFKaISl+Y=;
        b=N+60ju/v1+qY/mRv2IjQCsGsktu8QriR/pTrNij2Is6mEMsjeB/OPZ52+YHEVsp7Uv
         A9rQ1d9rTxfZYqUq5lvMybp+1hqnqPwiVgpwys1lEDW7Jd0jb/CUuJJ0Fxp6ueJwaM0b
         bixr1psSEy5CfPbpQlpmw7Zfuhu06OKJxvl5j6BGWwYFNvA6W98exrNFhLsY9OYSzDKQ
         C76wgOsDscYDvceov8XtajBE9U+7PVl7yrnuE5lpc5l7cnDZKZ+UE+fl2ZikTLg0A5jH
         CTsd+2VXt0t+HfqBcAqOpI+mRh05REr2bXCKXwUYQBU33SXhKk8yJhtd5U1cdy8vJxAu
         e26A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10si14718222ybk.317.2020.07.04.10.18.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 10:18:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrlnb-0000x6-Nt
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 13:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jrlnT-0000wo-3P; Sat, 04 Jul 2020 13:17:51 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:23098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jrlnQ-00057F-Uv; Sat, 04 Jul 2020 13:17:50 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C149F74594E;
 Sat,  4 Jul 2020 19:17:46 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7B9CB745702; Sat,  4 Jul 2020 19:17:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 79A8F7456F8;
 Sat,  4 Jul 2020 19:17:46 +0200 (CEST)
Date: Sat, 4 Jul 2020 19:17:46 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 24/26] hw/usb/usb-hcd: Use UHCI type definitions
In-Reply-To: <20200704144943.18292-25-f4bug@amsat.org>
Message-ID: <alpine.BSF.2.22.395.2007041916060.92265@zero.eik.bme.hu>
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-25-f4bug@amsat.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-481592883-1593883066=:92265"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 12:22:23
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3m685E04Q+qV

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-481592883-1593883066=:92265
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 4 Jul 2020, Philippe Mathieu-Daudé wrote:
> Various machine/board/soc models create UHCI device instances
> with the generic QDEV API, and don't need to access USB internals.
>
> Simplify header inclusions by moving the QOM type names into a
> simple header, with no need to include other "hw/usb" headers.
>
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> include/hw/usb/usb-hcd.h |  6 ++++++
> hw/i386/pc_piix.c        |  3 ++-
> hw/i386/pc_q35.c         | 13 +++++++------
> hw/isa/piix4.c           |  3 ++-
> hw/mips/fuloong2e.c      |  5 +++--
> hw/usb/hcd-uhci.c        | 19 ++++++++++---------
> 6 files changed, 30 insertions(+), 19 deletions(-)
>
> diff --git a/include/hw/usb/usb-hcd.h b/include/hw/usb/usb-hcd.h
> index 74af3a4533..c9d0a88984 100644
> --- a/include/hw/usb/usb-hcd.h
> +++ b/include/hw/usb/usb-hcd.h
> @@ -24,4 +24,10 @@
> #define TYPE_FUSBH200_EHCI          "fusbh200-ehci-usb"
> #define TYPE_CHIPIDEA               "usb-chipidea"
>
> +/* UHCI */
> +#define TYPE_PIIX3_USB_UHCI         "piix3-usb-uhci"
> +#define TYPE_PIIX4_USB_UHCI         "piix4-usb-uhci"
> +#define TYPE_VT82C686B_USB_UHCI     "vt82c686b-usb-uhci"
> +#define TYPE_ICH9_USB_UHCI(n)       "ich9-usb-uhci" #n

What is that #n at the end? Looks like a typo. Does it break compilation?

Regards,
BALATON Zoltan

> +
> #endif
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 4d1de7cfab..0024c346c6 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -37,6 +37,7 @@
> #include "hw/pci/pci.h"
> #include "hw/pci/pci_ids.h"
> #include "hw/usb/usb.h"
> +#include "hw/usb/usb-hcd.h"
> #include "net/net.h"
> #include "hw/ide/pci.h"
> #include "hw/irq.h"
> @@ -275,7 +276,7 @@ static void pc_init1(MachineState *machine,
> #endif
>
>     if (pcmc->pci_enabled && machine_usb(machine)) {
> -        pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
> +        pci_create_simple(pci_bus, piix3_devfn + 2, TYPE_PIIX3_USB_UHCI);
>     }
>
>     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index b985f5bea1..a80527e6ed 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -51,6 +51,7 @@
> #include "hw/ide/pci.h"
> #include "hw/ide/ahci.h"
> #include "hw/usb/usb.h"
> +#include "hw/usb/usb-hcd.h"
> #include "qapi/error.h"
> #include "qemu/error-report.h"
> #include "sysemu/numa.h"
> @@ -68,15 +69,15 @@ struct ehci_companions {
> };
>
> static const struct ehci_companions ich9_1d[] = {
> -    { .name = "ich9-usb-uhci1", .func = 0, .port = 0 },
> -    { .name = "ich9-usb-uhci2", .func = 1, .port = 2 },
> -    { .name = "ich9-usb-uhci3", .func = 2, .port = 4 },
> +    { .name = TYPE_ICH9_USB_UHCI(1), .func = 0, .port = 0 },
> +    { .name = TYPE_ICH9_USB_UHCI(2), .func = 1, .port = 2 },
> +    { .name = TYPE_ICH9_USB_UHCI(3), .func = 2, .port = 4 },
> };
>
> static const struct ehci_companions ich9_1a[] = {
> -    { .name = "ich9-usb-uhci4", .func = 0, .port = 0 },
> -    { .name = "ich9-usb-uhci5", .func = 1, .port = 2 },
> -    { .name = "ich9-usb-uhci6", .func = 2, .port = 4 },
> +    { .name = TYPE_ICH9_USB_UHCI(4), .func = 0, .port = 0 },
> +    { .name = TYPE_ICH9_USB_UHCI(5), .func = 1, .port = 2 },
> +    { .name = TYPE_ICH9_USB_UHCI(6), .func = 2, .port = 4 },
> };
>
> static int ehci_create_ich9_with_companions(PCIBus *bus, int slot)
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index f634bcb2d1..e11e5fae21 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -29,6 +29,7 @@
> #include "hw/southbridge/piix.h"
> #include "hw/pci/pci.h"
> #include "hw/isa/isa.h"
> +#include "hw/usb/usb-hcd.h"
> #include "hw/sysbus.h"
> #include "hw/intc/i8259.h"
> #include "hw/dma/i8257.h"
> @@ -255,7 +256,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
>     pci = pci_create_simple(pci_bus, devfn + 1, "piix4-ide");
>     pci_ide_create_devs(pci);
>
> -    pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
> +    pci_create_simple(pci_bus, devfn + 2, TYPE_PIIX4_USB_UHCI);
>     if (smbus) {
>         *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
>                                isa_get_irq(NULL, 9), NULL, 0, NULL);
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 8ca31e5162..b6d33dd2cd 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -33,6 +33,7 @@
> #include "hw/mips/mips.h"
> #include "hw/mips/cpudevs.h"
> #include "hw/pci/pci.h"
> +#include "hw/usb/usb-hcd.h"
> #include "qemu/log.h"
> #include "hw/loader.h"
> #include "hw/ide/pci.h"
> @@ -258,8 +259,8 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>     dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
>     pci_ide_create_devs(dev);
>
> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
> +    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), TYPE_VT82C686B_USB_UHCI);
> +    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), TYPE_VT82C686B_USB_UHCI);
>
>     *i2c_bus = vt82c686b_pm_init(pci_bus, PCI_DEVFN(slot, 4), 0xeee1, NULL);
>
> diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
> index 1d4dd33b6c..da078dc3fa 100644
> --- a/hw/usb/hcd-uhci.c
> +++ b/hw/usb/hcd-uhci.c
> @@ -39,6 +39,7 @@
> #include "qemu/main-loop.h"
> #include "qemu/module.h"
> #include "usb-internal.h"
> +#include "hw/usb/usb-hcd.h"
>
> #define FRAME_TIMER_FREQ 1000
>
> @@ -1358,21 +1359,21 @@ static void uhci_data_class_init(ObjectClass *klass, void *data)
>
> static UHCIInfo uhci_info[] = {
>     {
> -        .name       = "piix3-usb-uhci",
> +        .name      = TYPE_PIIX3_USB_UHCI,
>         .vendor_id = PCI_VENDOR_ID_INTEL,
>         .device_id = PCI_DEVICE_ID_INTEL_82371SB_2,
>         .revision  = 0x01,
>         .irq_pin   = 3,
>         .unplug    = true,
>     },{
> -        .name      = "piix4-usb-uhci",
> +        .name      = TYPE_PIIX4_USB_UHCI,
>         .vendor_id = PCI_VENDOR_ID_INTEL,
>         .device_id = PCI_DEVICE_ID_INTEL_82371AB_2,
>         .revision  = 0x01,
>         .irq_pin   = 3,
>         .unplug    = true,
>     },{
> -        .name      = "vt82c686b-usb-uhci",
> +        .name      = TYPE_VT82C686B_USB_UHCI,
>         .vendor_id = PCI_VENDOR_ID_VIA,
>         .device_id = PCI_DEVICE_ID_VIA_UHCI,
>         .revision  = 0x01,
> @@ -1380,42 +1381,42 @@ static UHCIInfo uhci_info[] = {
>         .realize   = usb_uhci_vt82c686b_realize,
>         .unplug    = true,
>     },{
> -        .name      = "ich9-usb-uhci1", /* 00:1d.0 */
> +        .name      = TYPE_ICH9_USB_UHCI(1), /* 00:1d.0 */
>         .vendor_id = PCI_VENDOR_ID_INTEL,
>         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI1,
>         .revision  = 0x03,
>         .irq_pin   = 0,
>         .unplug    = false,
>     },{
> -        .name      = "ich9-usb-uhci2", /* 00:1d.1 */
> +        .name      = TYPE_ICH9_USB_UHCI(2), /* 00:1d.1 */
>         .vendor_id = PCI_VENDOR_ID_INTEL,
>         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI2,
>         .revision  = 0x03,
>         .irq_pin   = 1,
>         .unplug    = false,
>     },{
> -        .name      = "ich9-usb-uhci3", /* 00:1d.2 */
> +        .name      = TYPE_ICH9_USB_UHCI(3), /* 00:1d.2 */
>         .vendor_id = PCI_VENDOR_ID_INTEL,
>         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI3,
>         .revision  = 0x03,
>         .irq_pin   = 2,
>         .unplug    = false,
>     },{
> -        .name      = "ich9-usb-uhci4", /* 00:1a.0 */
> +        .name      = TYPE_ICH9_USB_UHCI(4), /* 00:1a.0 */
>         .vendor_id = PCI_VENDOR_ID_INTEL,
>         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI4,
>         .revision  = 0x03,
>         .irq_pin   = 0,
>         .unplug    = false,
>     },{
> -        .name      = "ich9-usb-uhci5", /* 00:1a.1 */
> +        .name      = TYPE_ICH9_USB_UHCI(5), /* 00:1a.1 */
>         .vendor_id = PCI_VENDOR_ID_INTEL,
>         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI5,
>         .revision  = 0x03,
>         .irq_pin   = 1,
>         .unplug    = false,
>     },{
> -        .name      = "ich9-usb-uhci6", /* 00:1a.2 */
> +        .name      = TYPE_ICH9_USB_UHCI(6), /* 00:1a.2 */
>         .vendor_id = PCI_VENDOR_ID_INTEL,
>         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI6,
>         .revision  = 0x03,
>
--3866299591-481592883-1593883066=:92265--
