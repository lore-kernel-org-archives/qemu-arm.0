Received: by 10.25.159.19 with SMTP id i19csp1027260lfe;
        Wed, 13 Jan 2016 02:21:11 -0800 (PST)
X-Received: by 10.140.104.65 with SMTP id z59mr117077705qge.26.1452680471465;
        Wed, 13 Jan 2016 02:21:11 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2si643883qka.96.2016.01.13.02.21.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jan 2016 02:21:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:36326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJIYA-0003ef-WE
	for alex.bennee@linaro.org; Wed, 13 Jan 2016 05:21:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1aJIXo-0003Mx-HQ
	for qemu-devel@nongnu.org; Wed, 13 Jan 2016 05:20:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1aJIXn-0006Qr-AD
	for qemu-devel@nongnu.org; Wed, 13 Jan 2016 05:20:48 -0500
Received: from mail-io0-x234.google.com ([2607:f8b0:4001:c06::234]:33784)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1aJIXm-0006Oi-2B
	for qemu-devel@nongnu.org; Wed, 13 Jan 2016 05:20:47 -0500
Received: by mail-io0-x234.google.com with SMTP id q21so413374508iod.0
	for <qemu-devel@nongnu.org>; Wed, 13 Jan 2016 02:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=tcOuERV6l7FVFRS0/exks/iAsHIIh4JQjjT7xbvbjkk=;
	b=QOLFnjv7NrJK79L4FYIwVEq7kFECsBXHcx5EVXvYov9DmeHQocAYKrg1PdhQTbZSxv
	oiwoayKBI1z3PsWAZRfsHlTeyp607vVkYpRRzgQKpvBCgXpZuxA3se1A47nENZb9VeCn
	UKjw4Z4h8NChJal56GoLerPdDzdLeaJ+NZNg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=tcOuERV6l7FVFRS0/exks/iAsHIIh4JQjjT7xbvbjkk=;
	b=ZQbht4GpeLEb0Jntlg0XLwOIzQJQ7WlkXmqc6mLsgj756muSya10gK68RuDaNHsHr9
	9u/31kv8ghFuhDbwiBOKRBk5bYbbUu6iqCjbHjKmSVIp2mMZW1kkeTTARpUB1QWlhW1t
	BzOCyEM3TzSUZzXFxbNQCRwg9t8ub+3BFdJWkGafC3WPPaFwVNY+xyzlYMSaD2a+zFFl
	rvEVCXtNbW5qflGH0iUZbW6fFxVnB+W1IGL3xBLIuUUHu2t3o0PAtzOeOc8P2MLblgSb
	IABCACZFBm6qjgMzo+RDqX28axnkUH4H1FMnITKsIZzLhs3uvy3/UG9n8TLsJIbRRP4n
	1jqw==
X-Gm-Message-State: ALoCoQntWKEa67OfNbiXlPZn42JlCQZGI77EEzIbQSeJSMWIJaOw4IF09ck5Jl46iMg0IUH/biyuWqug7QupmNEBdS6W/4Sh7RSzK1jgD2XL6GrXhhdimqo=
MIME-Version: 1.0
X-Received: by 10.107.162.197 with SMTP id l188mr41174383ioe.56.1452680445508; 
	Wed, 13 Jan 2016 02:20:45 -0800 (PST)
Received: by 10.36.29.6 with HTTP; Wed, 13 Jan 2016 02:20:45 -0800 (PST)
In-Reply-To: <5696246B.8080304@redhat.com>
References: <1452612274-30218-1-git-send-email-shannon.zhao@linaro.org>
	<5696246B.8080304@redhat.com>
Date: Wed, 13 Jan 2016 11:20:45 +0100
Message-ID: <CAKv+Gu-EaQOAXmbiGp9k55_t1X6SNbtaMScF01qgPKW7SU4vug@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::234
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"edk2-devel@lists.01.org" <edk2-devel@ml01.01.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
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
X-TUID: eX0CKhd0g9CW

On 13 January 2016 at 11:18, Laszlo Ersek <lersek@redhat.com> wrote:
> On 01/12/16 16:24, Shannon Zhao wrote:
>> When booting VM through UEFI, UEFI takes ownership of the RTC hardware.
>> To DTB UEFI could call libfdt api to disable the RTC device node, but to
>> ACPI it couldn't do that. Therefore, we don't generate the RTC ACPI
>> device in QEMU when using UEFI.
>>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> ---
>>  hw/arm/virt-acpi-build.c         | 13 +++++++++++--
>>  hw/arm/virt.c                    |  5 ++++-
>>  include/hw/arm/virt-acpi-build.h |  1 +
>>  3 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 0caf5ce..cccec79 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -575,8 +575,17 @@ build_dsdt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
>>      acpi_dsdt_add_cpus(scope, guest_info->smp_cpus);
>>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
>> -    acpi_dsdt_add_rtc(scope, &memmap[VIRT_RTC],
>> -                      (irqmap[VIRT_RTC] + ARM_SPI_BASE));
>> +
>> +    /* When booting VM through UEFI, UEFI takes ownership of the RTC hardware.
>> +     * To DTB UEFI could call libfdt api to disable the RTC device node, but to
>> +     * ACPI it couldn't do that. Therefore, we don't generate the RTC ACPI
>> +     * device here when using UEFI.
>> +     */
>> +    if (guest_info->acpi_rtc) {
>> +        acpi_dsdt_add_rtc(scope, &memmap[VIRT_RTC],
>> +                          (irqmap[VIRT_RTC] + ARM_SPI_BASE));
>> +    }
>> +
>>      acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
>>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
>>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index fd52b76..de12037 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1002,6 +1002,7 @@ static void machvirt_init(MachineState *machine)
>>      VirtGuestInfoState *guest_info_state = g_malloc0(sizeof *guest_info_state);
>>      VirtGuestInfo *guest_info = &guest_info_state->info;
>>      char **cpustr;
>> +    bool firmware_loaded;
>>
>>      if (!cpu_model) {
>>          cpu_model = "cortex-a15";
>> @@ -1124,12 +1125,14 @@ static void machvirt_init(MachineState *machine)
>>      create_fw_cfg(vbi, &address_space_memory);
>>      rom_set_fw(fw_cfg_find());
>>
>> +    firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>>      guest_info->smp_cpus = smp_cpus;
>>      guest_info->fw_cfg = fw_cfg_find();
>>      guest_info->memmap = vbi->memmap;
>>      guest_info->irqmap = vbi->irqmap;
>>      guest_info->use_highmem = vms->highmem;
>>      guest_info->gic_version = gic_version;
>> +    guest_info->acpi_rtc = !firmware_loaded;
>>      guest_info_state->machine_done.notify = virt_guest_info_machine_done;
>>      qemu_add_machine_init_done_notifier(&guest_info_state->machine_done);
>>
>> @@ -1141,7 +1144,7 @@ static void machvirt_init(MachineState *machine)
>>      vbi->bootinfo.board_id = -1;
>>      vbi->bootinfo.loader_start = vbi->memmap[VIRT_MEM].base;
>>      vbi->bootinfo.get_dtb = machvirt_dtb;
>> -    vbi->bootinfo.firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>> +    vbi->bootinfo.firmware_loaded = firmware_loaded;
>>      arm_load_kernel(ARM_CPU(first_cpu), &vbi->bootinfo);
>>
>>      /*
>> diff --git a/include/hw/arm/virt-acpi-build.h b/include/hw/arm/virt-acpi-build.h
>> index 744b666..6f412a4 100644
>> --- a/include/hw/arm/virt-acpi-build.h
>> +++ b/include/hw/arm/virt-acpi-build.h
>> @@ -33,6 +33,7 @@ typedef struct VirtGuestInfo {
>>      const int *irqmap;
>>      bool use_highmem;
>>      int gic_version;
>> +    bool acpi_rtc;
>>  } VirtGuestInfo;
>>
>>
>>
>
> I realize that Peter is not buying the argument just yet, but I'd like
> to offer a review here nonetheless.
>

I am not buying it either, to be honest. In fact, I think it is
another reason why we should mandate UEFI when using ACPI (which is
already the case in practice). Then, we can simply omit the RTC ACPI
node entirely.


> I think the patch is good, except the location and the wording of the
> code comment.
>
> (1) The code comment should be located right above the
>
>     guest_info->acpi_rtc = !firmware_loaded;
>
> assignment.
>
> (2) I think the code comment should simply use indicative mood:
>
>     When booting the VM with UEFI, UEFI takes ownership of the RTC
>     hardware. While UEFI can use libfdt to disable the RTC device node
>     in the DTB that it passes to the OS, it cannot modify AML.
>     Therefore, we won't generate the RTC ACPI device at all when using
>     UEFI.
>
> With those changes, I'm willing to R-b.
>
> Thanks
> Laszlo
