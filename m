Received: by 10.25.205.13 with SMTP id d13csp10404926lfg;
        Fri, 6 Jan 2017 09:16:58 -0800 (PST)
X-Received: by 10.200.48.120 with SMTP id g53mr79235776qte.113.1483723018345;
        Fri, 06 Jan 2017 09:16:58 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i2si36216473qki.207.2017.01.06.09.16.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 09:16:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPY8N-0004M4-KV
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 12:16:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPY4S-0001WY-6r
	for qemu-devel@nongnu.org; Fri, 06 Jan 2017 12:12:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPY4R-0007FZ-3v
	for qemu-devel@nongnu.org; Fri, 06 Jan 2017 12:12:52 -0500
Received: from mail-ua0-x233.google.com ([2607:f8b0:400c:c08::233]:35209)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cPY4Q-0007FD-Th
	for qemu-devel@nongnu.org; Fri, 06 Jan 2017 12:12:51 -0500
Received: by mail-ua0-x233.google.com with SMTP id y9so81029369uae.2
	for <qemu-devel@nongnu.org>; Fri, 06 Jan 2017 09:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=szuEaL4EbGnzpFc4cVZThMK1pOkmVqFkWpRfVb5tac4=;
	b=dGO9+jTdF/UeAdgd8ENEUEjvNG9q2lhBfc3t7MIIGJwkB6WArtAz0AHFePRzgONUYn
	LAQ5bs5/ABRioEhTj80NkNZjI71azBnBKjEgZynujSDqJt7aqKl9sPkgFn3okv4X9OUD
	Qt7SmMfpCB2Wr5DXYUqneBWx9e2YzWEHoTkyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=szuEaL4EbGnzpFc4cVZThMK1pOkmVqFkWpRfVb5tac4=;
	b=TgRVzuG8OCqttnNaa0EMLEn8YC+w2mOOdNvUPbFO5YInyt0vNXukaPFQLQn7UDKnLN
	K/5P+A+wzHkWvReYgBSBTQrlEzM/z6YSHtRBVAOh9FDtom9ii5gVHnVK8RGtsWuG14g8
	5oQWV4nXEFww1UdXG9rOeVHw3gnO2ziDd5pSYYAuFkTBaE4Xaj3DddLSMu3uHB/tkB4l
	C2m0sLi7AD/NfehjygNknWTw+aHZFIqvgoOS6zeMdEcQOa1082rIx9ETT9ZCUPVMGRzR
	zD/gDFuH4l9Gzfm2WMnXtSZ5LnniG7YlwjnxXr5rpcSfgLFzskZE8nd13r13gM4sVFXO
	eWSw==
X-Gm-Message-State: AIkVDXLLVWagKsBU2zYY3WoEOn9dvCxR4hcREbm6IZHTwQmQUIwRB8oNmUYJmnbXSFO4GUZMqCjB30gy2hBoby5x
X-Received: by 10.159.48.203 with SMTP id k11mr56114458uab.42.1483722770263;
	Fri, 06 Jan 2017 09:12:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 6 Jan 2017 09:12:29 -0800 (PST)
In-Reply-To: <20170102200153.28864-16-drjones@redhat.com>
References: <20170102200153.28864-1-drjones@redhat.com>
	<20170102200153.28864-16-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2017 17:12:29 +0000
Message-ID: <CAFEAcA_bdPDyemXcnTAM497RKhXhYRpk5KJNs=h+7OtEkQ+60A@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::233
Subject: Re: [Qemu-devel] [PATCH v2 15/16] hw/arm/virt-acpi-build: use SMC
 if booting in EL2
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /oVjNk2RQJdR

On 2 January 2017 at 20:01, Andrew Jones <drjones@redhat.com> wrote:
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index b5e17a680d51..7c00ee683f44 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -643,16 +643,16 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
> +    uint16_t use_hvc = vms->virt ? 0 : ACPI_FADT_ARM_PSCI_USE_HVC;

This is the wrong condition -- you should just check whether
vms->psci_conduit is QEMU_PSCI_CONDUIT_HVC (vs _SMC or _DISABLED), something
like:

    switch (vms->psci_conduit) {
    case QEMU_PSCI_CONDUIT_DISABLED:
        /* XXX should we fail, or boot without the PSCI_COMPLIANT flag? */
        use_hvc = 0;
        break;
    case QEMU_PSCI_CONDUIT_HVC:
        use_hvc = ACPI_FADT_ARM_PSCI_USE_HVC;
        break;
    case QEMU_PSCI_CONDUIT_SMC:
        use_hvc = 0;
        break;
    default:
        g_assert_not_reached();
    }

What should we do in the DISABLED case ?

> -    /* Hardware Reduced = 1 and use PSCI 0.2+ and with HVC */
> +    /* Hardware Reduced = 1 and use PSCI 0.2+ */
>      fadt->flags = cpu_to_le32(1 << ACPI_FADT_F_HW_REDUCED_ACPI);
> -    fadt->arm_boot_flags = cpu_to_le16(ACPI_FADT_ARM_PSCI_COMPLIANT |
> -                                       ACPI_FADT_ARM_PSCI_USE_HVC);
> +    fadt->arm_boot_flags = cpu_to_le16(ACPI_FADT_ARM_PSCI_COMPLIANT | use_hvc);
>
>      /* ACPI v5.1 (fadt->revision.fadt->minor_revision) */
>      fadt->minor_revision = 0x1;
> @@ -738,7 +738,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>
>      /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
>      acpi_add_table(table_offsets, tables_blob);
> -    build_fadt(tables_blob, tables->linker, dsdt);
> +    build_fadt(tables_blob, tables->linker, vms, dsdt);
>
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);

thanks
-- PMM
