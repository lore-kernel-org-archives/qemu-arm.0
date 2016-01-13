Received: by 10.25.159.19 with SMTP id i19csp1026298lfe;
        Wed, 13 Jan 2016 02:18:53 -0800 (PST)
X-Received: by 10.55.15.139 with SMTP id 11mr30512711qkp.50.1452680333511;
        Wed, 13 Jan 2016 02:18:53 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j61si640995qgj.96.2016.01.13.02.18.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jan 2016 02:18:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJIVx-0001b7-2v
	for alex.bennee@linaro.org; Wed, 13 Jan 2016 05:18:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aJIVa-0001Iy-DG
	for qemu-devel@nongnu.org; Wed, 13 Jan 2016 05:18:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aJIVZ-0005gv-96
	for qemu-devel@nongnu.org; Wed, 13 Jan 2016 05:18:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38865)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1aJIVT-0005g9-2C; Wed, 13 Jan 2016 05:18:23 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 9E93F92471;
	Wed, 13 Jan 2016 10:18:22 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-93.phx2.redhat.com
	[10.3.113.93])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0DAIKLs020635; Wed, 13 Jan 2016 05:18:20 -0500
To: Shannon Zhao <shannon.zhao@linaro.org>, qemu-arm@nongnu.org
References: <1452612274-30218-1-git-send-email-shannon.zhao@linaro.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <5696246B.8080304@redhat.com>
Date: Wed, 13 Jan 2016 11:18:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452612274-30218-1-git-send-email-shannon.zhao@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, edk2-devel@ml01.01.org, zhaoshenglong@huawei.com,
	qemu-devel@nongnu.org, ard.biesheuvel@linaro.org
Subject: Re: [Qemu-devel] [PATCH] ARM: Virt: Don't generate RTC ACPI node
	when using UEFI
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
X-TUID: O7bFl1bPPdTq

On 01/12/16 16:24, Shannon Zhao wrote:
> When booting VM through UEFI, UEFI takes ownership of the RTC hardware.
> To DTB UEFI could call libfdt api to disable the RTC device node, but to
> ACPI it couldn't do that. Therefore, we don't generate the RTC ACPI
> device in QEMU when using UEFI.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c         | 13 +++++++++++--
>  hw/arm/virt.c                    |  5 ++++-
>  include/hw/arm/virt-acpi-build.h |  1 +
>  3 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 0caf5ce..cccec79 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -575,8 +575,17 @@ build_dsdt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
>      acpi_dsdt_add_cpus(scope, guest_info->smp_cpus);
>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
> -    acpi_dsdt_add_rtc(scope, &memmap[VIRT_RTC],
> -                      (irqmap[VIRT_RTC] + ARM_SPI_BASE));
> +
> +    /* When booting VM through UEFI, UEFI takes ownership of the RTC hardware.
> +     * To DTB UEFI could call libfdt api to disable the RTC device node, but to
> +     * ACPI it couldn't do that. Therefore, we don't generate the RTC ACPI
> +     * device here when using UEFI.
> +     */
> +    if (guest_info->acpi_rtc) {
> +        acpi_dsdt_add_rtc(scope, &memmap[VIRT_RTC],
> +                          (irqmap[VIRT_RTC] + ARM_SPI_BASE));
> +    }
> +
>      acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index fd52b76..de12037 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1002,6 +1002,7 @@ static void machvirt_init(MachineState *machine)
>      VirtGuestInfoState *guest_info_state = g_malloc0(sizeof *guest_info_state);
>      VirtGuestInfo *guest_info = &guest_info_state->info;
>      char **cpustr;
> +    bool firmware_loaded;
>  
>      if (!cpu_model) {
>          cpu_model = "cortex-a15";
> @@ -1124,12 +1125,14 @@ static void machvirt_init(MachineState *machine)
>      create_fw_cfg(vbi, &address_space_memory);
>      rom_set_fw(fw_cfg_find());
>  
> +    firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>      guest_info->smp_cpus = smp_cpus;
>      guest_info->fw_cfg = fw_cfg_find();
>      guest_info->memmap = vbi->memmap;
>      guest_info->irqmap = vbi->irqmap;
>      guest_info->use_highmem = vms->highmem;
>      guest_info->gic_version = gic_version;
> +    guest_info->acpi_rtc = !firmware_loaded;
>      guest_info_state->machine_done.notify = virt_guest_info_machine_done;
>      qemu_add_machine_init_done_notifier(&guest_info_state->machine_done);
>  
> @@ -1141,7 +1144,7 @@ static void machvirt_init(MachineState *machine)
>      vbi->bootinfo.board_id = -1;
>      vbi->bootinfo.loader_start = vbi->memmap[VIRT_MEM].base;
>      vbi->bootinfo.get_dtb = machvirt_dtb;
> -    vbi->bootinfo.firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
> +    vbi->bootinfo.firmware_loaded = firmware_loaded;
>      arm_load_kernel(ARM_CPU(first_cpu), &vbi->bootinfo);
>  
>      /*
> diff --git a/include/hw/arm/virt-acpi-build.h b/include/hw/arm/virt-acpi-build.h
> index 744b666..6f412a4 100644
> --- a/include/hw/arm/virt-acpi-build.h
> +++ b/include/hw/arm/virt-acpi-build.h
> @@ -33,6 +33,7 @@ typedef struct VirtGuestInfo {
>      const int *irqmap;
>      bool use_highmem;
>      int gic_version;
> +    bool acpi_rtc;
>  } VirtGuestInfo;
>  
>  
> 

I realize that Peter is not buying the argument just yet, but I'd like
to offer a review here nonetheless.

I think the patch is good, except the location and the wording of the
code comment.

(1) The code comment should be located right above the

    guest_info->acpi_rtc = !firmware_loaded;

assignment.

(2) I think the code comment should simply use indicative mood:

    When booting the VM with UEFI, UEFI takes ownership of the RTC
    hardware. While UEFI can use libfdt to disable the RTC device node
    in the DTB that it passes to the OS, it cannot modify AML.
    Therefore, we won't generate the RTC ACPI device at all when using
    UEFI.

With those changes, I'm willing to R-b.

Thanks
Laszlo
