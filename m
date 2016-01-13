Received: by 10.25.159.19 with SMTP id i19csp1177406lfe;
        Wed, 13 Jan 2016 07:08:32 -0800 (PST)
X-Received: by 10.55.76.213 with SMTP id z204mr176084028qka.58.1452697712359;
        Wed, 13 Jan 2016 07:08:32 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a140si1712809qhc.57.2016.01.13.07.08.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jan 2016 07:08:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:37565 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJN2F-0004ZE-Si
	for alex.bennee@linaro.org; Wed, 13 Jan 2016 10:08:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1aJMyQ-0006gh-6r
	for qemu-devel@nongnu.org; Wed, 13 Jan 2016 10:04:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1aJMyP-0006er-Al
	for qemu-devel@nongnu.org; Wed, 13 Jan 2016 10:04:34 -0500
Received: from mail-io0-x232.google.com ([2607:f8b0:4001:c06::232]:35072)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1aJMyP-0006eB-79
	for qemu-devel@nongnu.org; Wed, 13 Jan 2016 10:04:33 -0500
Received: by mail-io0-x232.google.com with SMTP id 77so389515946ioc.2
	for <qemu-devel@nongnu.org>; Wed, 13 Jan 2016 07:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ESb4o4cld4QCrhxCGghQBGmP6DQMxFC6F2WRtJdI4w0=;
	b=JdOuaB2hJzbUuqsfsG8bCL6IbL4z+T58GqJOjLd3q2of2EO54vSWJQOS/CaPizg2BU
	Ka0/+MeGeNBQO7FjZNYC1f216MOnQUr9JXNzE6oJiUWW/G4JaowMz0D4RFeJhtmJS6kL
	BWtBV7Oi04E0hMoQVtZdy8AKswoXM0WUwGWCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ESb4o4cld4QCrhxCGghQBGmP6DQMxFC6F2WRtJdI4w0=;
	b=JRby7o7OFO7UyPP5qCLC04kpHnWFaGFEECdaKSWXLWI10wzABAZhzp+27JNLY49CYF
	12cx0DqWj1EVN7cYBsHnlk2qIp6GVy249yjVisTiydQzKYpcSoKG6BMaSapejzwuh8sI
	+lKJ9ci9GBO8ti2d75RJ9Vxq+LC7PgqDzySQ5CsHdLfAqIw2xZW6o9sbo36DpmeYVwxr
	Eyail4oJ8NNJD3wMMm0AhWuAgGlwbHd5X8QGuyLLqV+lX/7/fe0NGtWY1SoI5H1vPla5
	vRVGREX3UVg8REGFn7E4FQGuAkNLwsao0/FMVjlpat61/7JxSqwCB89azc8zpEblRYyM
	lSFQ==
X-Gm-Message-State: ALoCoQl5GCR0gv6RXiNg9EbZX9DijJ+attSWbD2RY6YeJnmrh7QNKEZjkbOLBUcqjIoICzOsMNJajX6e8COuNMMZAnBX9VnyVS3r7fKU+o1HZCGZqb9dlSU=
MIME-Version: 1.0
X-Received: by 10.107.18.219 with SMTP id 88mr120473817ios.130.1452697471357; 
	Wed, 13 Jan 2016 07:04:31 -0800 (PST)
Received: by 10.36.29.6 with HTTP; Wed, 13 Jan 2016 07:04:31 -0800 (PST)
In-Reply-To: <1452696857-4091-1-git-send-email-shannon.zhao@linaro.org>
References: <1452696857-4091-1-git-send-email-shannon.zhao@linaro.org>
Date: Wed, 13 Jan 2016 16:04:31 +0100
Message-ID: <CAKv+Gu_rzk7wQ3Mi2ibtMO1F=A+_GPK7-Mwz2AjrTUECZB6Sbw@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: Shannon Zhao <shannon.zhao@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::232
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"edk2-devel@lists.01.org" <edk2-devel@ml01.01.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek <lersek@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2] ARM: Virt: Don't generate RTC ACPI
	device when using UEFI
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FRdTZvXx9lEu

On 13 January 2016 at 15:54, Shannon Zhao <shannon.zhao@linaro.org> wrote:
> When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
> While UEFI can use libfdt to disable the RTC device node in the DTB that
> it passes to the OS, it cannot modify AML. Therefore, we won't generate
> the RTC ACPI device at all when using UEFI.
>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---

Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

> v2: just totally don't generate the RTC ACPI device when using UEFI
> ---
>  hw/arm/virt-acpi-build.c | 19 -------------------
>  1 file changed, 19 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 0caf5ce..ac568a3 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -94,23 +94,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
>      aml_append(scope, dev);
>  }
>
> -static void acpi_dsdt_add_rtc(Aml *scope, const MemMapEntry *rtc_memmap,
> -                                          uint32_t rtc_irq)
> -{
> -    Aml *dev = aml_device("RTC0");
> -    aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0013")));
> -    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> -
> -    Aml *crs = aml_resource_template();
> -    aml_append(crs, aml_memory32_fixed(rtc_memmap->base,
> -                                       rtc_memmap->size, AML_READ_WRITE));
> -    aml_append(crs,
> -               aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> -                             AML_EXCLUSIVE, &rtc_irq, 1));
> -    aml_append(dev, aml_name_decl("_CRS", crs));
> -    aml_append(scope, dev);
> -}
> -
>  static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
>  {
>      Aml *dev, *crs;
> @@ -575,8 +558,6 @@ build_dsdt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
>      acpi_dsdt_add_cpus(scope, guest_info->smp_cpus);
>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
> -    acpi_dsdt_add_rtc(scope, &memmap[VIRT_RTC],
> -                      (irqmap[VIRT_RTC] + ARM_SPI_BASE));
>      acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
> --
> 2.1.0
>
