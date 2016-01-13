Received: by 10.25.159.19 with SMTP id i19csp1176619lfe;
        Wed, 13 Jan 2016 07:07:23 -0800 (PST)
X-Received: by 10.55.26.215 with SMTP id l84mr31382335qkh.101.1452697641854;
        Wed, 13 Jan 2016 07:07:21 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y124si1741492qka.2.2016.01.13.07.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jan 2016 07:07:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37553 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJN17-0002jY-BM
	for alex.bennee@linaro.org; Wed, 13 Jan 2016 10:07:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aJN0U-0001u6-IQ
	for qemu-devel@nongnu.org; Wed, 13 Jan 2016 10:06:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aJN0T-0007H0-GA
	for qemu-devel@nongnu.org; Wed, 13 Jan 2016 10:06:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43417)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1aJN0O-0007Eg-W0; Wed, 13 Jan 2016 10:06:37 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 2B6CFC60F0;
	Wed, 13 Jan 2016 15:06:36 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com ([10.3.113.3])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0DF6YJT020087; Wed, 13 Jan 2016 10:06:34 -0500
To: Shannon Zhao <shannon.zhao@linaro.org>, qemu-arm@nongnu.org
References: <1452696857-4091-1-git-send-email-shannon.zhao@linaro.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <569667F9.4030800@redhat.com>
Date: Wed, 13 Jan 2016 16:06:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452696857-4091-1-git-send-email-shannon.zhao@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, edk2-devel@ml01.01.org, zhaoshenglong@huawei.com,
	qemu-devel@nongnu.org, ard.biesheuvel@linaro.org
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
X-TUID: MAuqpe0tVhfa

On 01/13/16 15:54, Shannon Zhao wrote:
> When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
> While UEFI can use libfdt to disable the RTC device node in the DTB that
> it passes to the OS, it cannot modify AML. Therefore, we won't generate
> the RTC ACPI device at all when using UEFI.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
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
> 

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
