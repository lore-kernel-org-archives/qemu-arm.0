Received: by 10.25.159.19 with SMTP id i19csp492698lfe;
        Fri, 15 Jan 2016 06:18:54 -0800 (PST)
X-Received: by 10.55.76.213 with SMTP id z204mr13184724qka.58.1452867534325;
        Fri, 15 Jan 2016 06:18:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z81si13479511qhz.112.2016.01.15.06.18.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 06:18:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47115 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aK5DJ-0005EC-Oe
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 09:18:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aK5DH-0005BT-Mj
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:18:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aK5DD-0007XH-MT
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:18:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46095)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aK5DD-0007X5-FU; Fri, 15 Jan 2016 09:18:47 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 7FE902EBCF0;
	Fri, 15 Jan 2016 14:18:46 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-158.brq.redhat.com [10.34.1.158])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0FEIfA0026424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 15 Jan 2016 09:18:43 -0500
Date: Fri, 15 Jan 2016 15:18:40 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <20160115141840.GI3915@hawk.localdomain>
References: <1452867091-4023-1-git-send-email-shannon.zhao@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452867091-4023-1-git-send-email-shannon.zhao@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, ard.biesheuvel@linaro.org, edk2-devel@ml01.01.org,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com, lersek@redhat.com
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3] ARM: Virt: Don't generate
 RTC ACPI device when using UEFI
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wP/f5TqYrCFi

On Fri, Jan 15, 2016 at 10:11:31PM +0800, Shannon Zhao wrote:
> When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
> While UEFI can use libfdt to disable the RTC device node in the DTB that
> it passes to the OS, it cannot modify AML. Therefore, we won't generate
> the RTC ACPI device at all when using UEFI.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> ---
> V3: add comments to explain why it doesn't generate RTC ACPI device
> ---
>  hw/arm/virt-acpi-build.c | 24 +++++-------------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 0caf5ce..0d5c635 100644
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
> @@ -571,12 +554,15 @@ build_dsdt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
>      /* Reserve space for header */
>      acpi_data_push(dsdt->buf, sizeof(AcpiTableHeader));
>  
> +    /* When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
> +     * While UEFI can use libfdt to disable the RTC device node in the DTB that
> +     * it passes to the OS, it cannot modify AML. Therefore, we won't generate
> +     * the RTC ACPI device at all when using UEFI.
> +     */
>      scope = aml_scope("\\_SB");
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
>

Reviewed-by: Andrew Jones <drjones@redhat.com> 
