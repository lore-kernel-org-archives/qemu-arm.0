Received: by 10.25.205.13 with SMTP id d13csp719319lfg;
        Tue, 17 Jan 2017 14:17:00 -0800 (PST)
X-Received: by 10.200.48.235 with SMTP id w40mr37842401qta.72.1484691420734;
        Tue, 17 Jan 2017 14:17:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si17630898qtb.60.2017.01.17.14.17.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jan 2017 14:17:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTc3m-0001KR-42
	for alex.bennee@linaro.org; Tue, 17 Jan 2017 17:16:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cTc26-0000Cj-MJ
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 17:15:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cTc25-0004Tr-JF
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 17:15:14 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:34972)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cTc25-0004T1-De; Tue, 17 Jan 2017 17:15:13 -0500
Received: by mail-wm0-x243.google.com with SMTP id d140so25461113wmd.2;
	Tue, 17 Jan 2017 14:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=07z5NmRfn3kLDS5T92eFJZM1TjmbKXEpvDokgy5GTNY=;
	b=RXg4nEGeY5wwu9oZdxjeUAA7SsUfynLaJHZ5+OQFZMdL08naKjEkiO9LjjzXz1MMp3
	R62rd0zREydCXmJoTQizSGpa2AI1qXROJNrldBhRU2+gcvVD86MbuRWuhOb2S58biRse
	DR/7UKzGGjUKmKY9hQ0TSwj/Sm4wuefH+K9GVmBK8BC/HbSectsVpIat7MN9+WhIhrsC
	UaexePP0LTHStzMnKIUWSWhao0mn9xL0r7NlqzSk8d7vqGB/9F/WCth3CWVYgJMefRcL
	BPPV4YwWky8pE+Is8xbo6ePjXOTVneW73ewqc3xlOHiGfyfkYCkyCBMQ56gKzaPA4V0k
	RD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=07z5NmRfn3kLDS5T92eFJZM1TjmbKXEpvDokgy5GTNY=;
	b=Ufg0dksSySwd5itnrKd6quNCh9dyAO6F+subboZq01+9ZgG/Dou/CUsiICneLIqLdC
	XZ3i+sOE1Gnaj/HvcamTIYfodr4E46bjd14UiLezmGziW3jrUalMs1bH/LhTNeb8bA9R
	p9wW1RoHSUwGqvFIuGq8DHx8gPnZykOFGilSHhD6d1sO76aAEbgTplzNW1cMrLJkTm7Y
	HFv0LEEK5XUEquy/KePJ7Tz43epku1IiP0NCVtUcEtiLKmg9y4zBMMJEAdvWs4CEg+50
	xbrnDn1TCoYA6bqFz082gFpVaf6g3uBUfeQPYJzziF2GJzrYo/nq6czuKWSsngBYia3G
	B3KQ==
X-Gm-Message-State: AIkVDXJzW63D5JVCP5ZYCI+mEVHFTuJGaDcfyUI/WEWW2gAhJAqLa5aK0P8VM+EuSJkqn46FfG0HkaWi1BxB7Q==
X-Received: by 10.28.161.129 with SMTP id k123mr350595wme.66.1484691312373;
	Tue, 17 Jan 2017 14:15:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.154.68 with HTTP; Tue, 17 Jan 2017 14:14:41 -0800 (PST)
In-Reply-To: <1483977924-14522-16-git-send-email-peter.maydell@linaro.org>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
	<1483977924-14522-16-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 17 Jan 2017 14:14:41 -0800
X-Google-Sender-Auth: SxXrcnfBTT490jGZHCspLdDeWmY
Message-ID: <CAKmqyKPSVFrgS69KwmJ9TfCM2o8LDDNjsuSn6bzvyDu2Vn7zcA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 15/18]
 hw/arm/virt-acpi-build: use SMC if booting in EL2
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrew Jones <drjones@redhat.com>, Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ee/zOZCbuB3o

On Mon, Jan 9, 2017 at 8:05 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> From: Andrew Jones <drjones@redhat.com>
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> [PMM: look at vms->psci_conduit rather than vms->virt
>  to decide whether to use HVC or SMC, and report no
>  PSCI support at all for the 'PSCI disabled' case]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  hw/arm/virt-acpi-build.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 085a611..ec7f83b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -643,16 +643,30 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  }
>
>  /* FADT */
> -static void
> -build_fadt(GArray *table_data, BIOSLinker *linker, unsigned dsdt_tbl_offset)
> +static void build_fadt(GArray *table_data, BIOSLinker *linker,
> +                       VirtMachineState *vms, unsigned dsdt_tbl_offset)
>  {
>      AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
>      unsigned dsdt_entry_offset = (char *)&fadt->dsdt - table_data->data;
> +    uint16_t bootflags;
> +
> +    switch (vms->psci_conduit) {
> +    case QEMU_PSCI_CONDUIT_DISABLED:
> +        bootflags = 0;
> +        break;
> +    case QEMU_PSCI_CONDUIT_HVC:
> +        bootflags = ACPI_FADT_ARM_PSCI_COMPLIANT | ACPI_FADT_ARM_PSCI_USE_HVC;
> +        break;
> +    case QEMU_PSCI_CONDUIT_SMC:
> +        bootflags = ACPI_FADT_ARM_PSCI_COMPLIANT;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
>
> -    /* Hardware Reduced = 1 and use PSCI 0.2+ and with HVC */
> +    /* Hardware Reduced = 1 and use PSCI 0.2+ */
>      fadt->flags = cpu_to_le32(1 << ACPI_FADT_F_HW_REDUCED_ACPI);
> -    fadt->arm_boot_flags = cpu_to_le16(ACPI_FADT_ARM_PSCI_COMPLIANT |
> -                                       ACPI_FADT_ARM_PSCI_USE_HVC);
> +    fadt->arm_boot_flags = cpu_to_le16(bootflags);
>
>      /* ACPI v5.1 (fadt->revision.fadt->minor_revision) */
>      fadt->minor_revision = 0x1;
> @@ -738,7 +752,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>
>      /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
>      acpi_add_table(table_offsets, tables_blob);
> -    build_fadt(tables_blob, tables->linker, dsdt);
> +    build_fadt(tables_blob, tables->linker, vms, dsdt);
>
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);
> --
> 2.7.4
>
>
