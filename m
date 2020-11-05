Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp117684lfb;
        Wed, 4 Nov 2020 20:30:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIZHpSMNQIyZAEw1k7ZllzIWZ0CkxoH2rWP7SNKxzO+K7s1co44kD2KXmvwodo4fyxl+Bm
X-Received: by 2002:a37:90c3:: with SMTP id s186mr552671qkd.130.1604550653235;
        Wed, 04 Nov 2020 20:30:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604550653; cv=none;
        d=google.com; s=arc-20160816;
        b=AhBB/NnjMTfpQ9a/D5vtKVBvOaACmizeXGGpRd4HwKJLUKzmZvQnuK5Sx0kCzmnwNK
         kXEe7wjnChnH/ujXrR6KLAgA5gMZ7vmG2EfzJnaydcrUnXVlq8AAqXJ3IvmuRyu+TQEJ
         KqczKUmg+NKvUVdy8fjp3M9pByEWYe0+SH47lMF0bBd9AmCQusyNwEKbv4m9w6YoergA
         A1vYyywm8/+DXVkW3mzU283mfIowiZBvYvgMKS3hCDFVT0oV2QTAXIKNhi1sh9KC8giV
         t/QoAfMKvVuJw6Lr/UuZdu+puFcFQ2ApwLQvtAMlynwJkM2Rw3b16S+pD07MIBFKh2rI
         Yh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=J120O4k46PP8BHTTxhlDf9P8avYwwxxOfmHNVd85MRk=;
        b=WJA47flsLBSV+2o7RPXqB8bg9FTmZYjIi96w6SnRc9STFKuVnh3kULuW9qMG3z5N/T
         aNtUVLQITJXlkTZ3toDz4tmiiQQdE6+mxt75buxmh2RXDP5Qn5FWv2QLLA4C1s09FPyW
         /A6YAGTH2AuiGeeTV2/zsJt2g9nlY10gu6ItB7BmL8yqG/i5AHyQTlR61zI1QtHvaN2w
         gXI7A9bvc8D9lO61yrYbqj3mXxtaPB3egQFdXs4KZVYc7SgSKFsmlGUH6A8TIBc+cWB1
         HvWUMOJaFWG3WsWIAy+Boac8Vc2lWcUraLFBn8Pl2HROoSM7Qj3/7CQdKnblkR0wnjmR
         oT8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3si281224qvx.67.2020.11.04.20.30.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Nov 2020 20:30:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kaWvE-0002jW-KI
	for alex.bennee@linaro.org; Wed, 04 Nov 2020 23:30:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kaWut-0002in-Fw; Wed, 04 Nov 2020 23:30:31 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kaWup-0001Xe-FI; Wed, 04 Nov 2020 23:30:31 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CRVtS06GZzLskk;
 Thu,  5 Nov 2020 12:30:08 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Thu, 5 Nov 2020 12:30:06 +0800
Subject: Re: Question on UEFI ACPI tables setup and probing on arm64
To: Laszlo Ersek <lersek@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <ee3b7fdf-f6ba-cafc-5b44-42b0bcda01c5@huawei.com>
 <20201103133913.1fee3337@redhat.com>
 <a79383a6-92d4-5b10-d143-414543caab70@redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <5310d14d-8dbe-ba97-fdf1-4f3f10f91f3a@huawei.com>
Date: Thu, 5 Nov 2020 12:30:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a79383a6-92d4-5b10-d143-414543caab70@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 23:30:15
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Drew Jones <drjones@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "wangzhigang17@huawei.com" <wangzhigang17@huawei.com>, "Ard Biesheuvel \(ARM
 address\)" <ard.biesheuvel@arm.com>, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xoswNpvd/0EG



On 11/5/2020 5:46 AM, Laszlo Ersek wrote:
> +Ard, +Drew
> 
> On 11/03/20 13:39, Igor Mammedov wrote:
>> On Fri, 30 Oct 2020 10:50:01 +0800
>> Ying Fang <fangying1@huawei.com> wrote:
>>
>>> Hi,
>>>
>>> I have a question on UEFI/ACPI tables setup and probing on arm64 platform.
>>
>> CCing Laszlo,
>> who might know how it's implemented.
>>   
>>> Currently on arm64 platform guest can be booted with both fdt and ACPI
>>> supported. If ACPI is enabled, [1] says the only defined method for
>>> passing ACPI tables to the kernel is via the UEFI system configuration
>>> table. So AFAIK, ACPI Should be dependent on UEFI.
> 
> That's correct. The ACPI entry point (RSD PTR) on AARCH64 is defined in
> terms of UEFI.
> 
>>>
>>> What's more [2] says UEFI kernel support on the ARM architectures
>>> is only available through a *stub*. The stub populates the FDT /chosen
>>> node with some UEFI parameters describing the UEFI location info.
> 
> Yes.
> 
>>>
>>> So i dump /sys/firmware/fdt from the guest, it does have something like:
>>>
>>> /dts-v1/;
>>>
>>> / {
>>> 	#size-cells = <0x02>;
>>> 	#address-cells = <0x02>;
>>>
>>> 	chosen {
>>> 		linux,uefi-mmap-desc-ver = <0x01>;
>>> 		linux,uefi-mmap-desc-size = <0x30>;
>>> 		linux,uefi-mmap-size = <0x810>;
>>> 		linux,uefi-mmap-start = <0x04 0x3c0ce018>;
>>> 		linux,uefi-system-table = <0x04 0x3f8b0018>;
>>> 		bootargs = "BOOT_IMAGE=/vmlinuz-4.19.90-2003.4.0.0036.oe1.aarch64
>>> root=/dev/mapper/openeuler-root ro rd.lvm.lv=openeuler/root
>>> rd.lvm.lv=openeuler/swap video=VGA-1:640x480-32@60me
>>> smmu.bypassdev=0x1000:0x17 smmu.bypassdev=0x1000:0x15
>>> crashkernel=1024M,high video=efifb:off video=VGA-1:640x480-32@60me";
>>> 		linux,initrd-end = <0x04 0x3a85a5da>;
>>> 		linux,initrd-start = <0x04 0x392f2000>;
>>> 	};
>>> };
>>>
>>> But the question is that I did not see any code adding the uefi
>>> in fdt chosen node in *arm_load_dtb* or anywhere else.
> 
> That's because the "UEFI stub" is a part of the guest kernel. It wraps
> the guest kernel image into a UEFI application binary. For a while, the
> guest kernel runs as a UEFI application, stashing some UEFI artifacts in
> *a* device tree, and then (after some other heavy lifting) jumping into
> the kernel proper.
> 
>>> Qemu only maps the OVMF binary file into a pflash device.
>>> So I'm really confused on how UEFI information is provided to
>>> guest by qemu. Does anybody know of the details about it ?
> 
> It's complex, unfortunately.
> 
> (1) QEMU always generates a DTB for the guest firmware. This DTB is
> placed at the base of the guest RAM.
> 
> See the arm_load_dtb() call in virt_machine_done() [hw/arm/virt.c] in
> QEMU. I think.

Hi Laszlo. Thanks so much for sharing the details with us.
The reply nearly covers the boot sequence of aarch64 on the whole.

I see it in Qemu the *loader_start* is fixed at 1 GiB on the
physical address space which points to the DRAM base. In ArmVirtQemu.dsc
PcdDeviceTreeInitialBaseAddress is set 0x40000000 with correspondence.

Here I also see the discussion about DRAM base for ArmVirtQemu.
https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03127.html

I am still not sure how UEFI knows that it is running on a ArmVirtQemu
machine type. Does UEFI derive it from the fdt *compatible* property ?

> 
> 
> (2) QEMU generates ACPI content, and exposes it via fw_cfg.
> 
> See the virt_acpi_setup() call in the same virt_machine_done() function
> [hw/arm/virt.c] in QEMU.
> 
> 
> (3) The fw_cfg device itself is apparent to the guest firmware via the
> DTB from point (1). See the following steps in edk2:
> 
> (3a) "ArmVirtPkg/Library/PlatformPeiLib/PlatformPeiLib.c"
> 
> This saves the initial DTB (from the base of guest RAM, where it could
> be overwritten by whatever) to a dynamically allocated area. This
> "stashing" occurs early.
> 
> (3b) "ArmVirtPkg/FdtClientDxe/FdtClientDxe.c"
> 
> This driver exposes the (dynamically reallocated / copied) DTB via a
> custom UEFI protocol to the rest of the firmware. (This happens much
> later.) This protocol / driver can be considered the "owner" of the
> stashed DTB from (3a).
> 
> (3c) "ArmVirtPkg/Library/QemuFwCfgLib/QemuFwCfgLib.c"
> 
> This is the fw_cfg device access library, discovering the fw_cfg
> registers via the above UEFI protocol. The library is linked into each
> firmware module that needs fw_cfg access.
> 
> 
> (4) The firmware interprets QEMU's DTB for actual content (parsing
> values, configuring hardware, accessing devices).
> 
> This occurs in a whole bunch of locations, mostly via consuming the
> custom protocol from (3b). Some info that's needed very early is parsed
> out of the DTB right in step (3a).
> 
> 
> (5) The guest firmware has a dedicated driver that checks whether QEMU
> was configured with ACPI enabled or disabled, and publishes that choice
> to the rest of the firmware. This is necessary because some firmware
> actions / infrastructure parts cannot (must not) proceed until this
> decision has been interpreted.
> 
> See in edk2:
> 
> - ArmVirtPkg/PlatformHasAcpiDtDxe
> 
> This driver keys off of the presence of the "etc/table-loader" fw_cfg
> file, coming from step (2), using the fw_cfg access library from step (3c).
> 
> If ACPI was enabled on the QEMU cmdline, then the rest of the firmware
> is "level-triggered" to proceed with the ACPI infrastructure.
> 
> Otherwise, the rest of the firmware is "level-triggered" that DT was
> chosen for the OS.
> 
> ("Level-triggering" means the installation of custom NULL protocols,
> which permits drivers dependent on DT vs ACPI to be dispatched.)
> 
> 
> (6) If DT was selected (ACPI was disabled), per step (5), then
> FdtClientDxe (introduced under step (3b)) has another job: it forwards
> the original stashed DTB (see (3a)) to the guest OS.
> 
> This "DTB forwarding" occurs through a particular UEFI config table; the
> GUID is B1B621D5-F19C-41A5-830B-D9152C69AAE0 -- known as
> DEVICE_TREE_GUID in the kernel ("include/linux/efi.h").
> 
> See the OnPlatformHasDeviceTree() function in
> "ArmVirtPkg/FdtClientDxe/FdtClientDxe.c", in edk2.
> 
> 
> (7) If ACPI was selected instead, according to step (5), then through
> the fw_cfg access described in (3c), the guest firmware "blindly"
> processes the ACPI payload from QEMU (from step (2)).
> 
> This "blind processing" means that the guest firmware runs the "ACPI
> linker/loader script" (the "etc/table-loader" fw_cfg file), installing a
> number of ACPI tables for the guest OS. The guest firmware does not
> interpret the ACPI tables.
> 
> "Installing ACPI tables" ultimately means exposing stuff under the
> particular UEFI config table that stands for the RSD PTR -- the GUID is
> 8868E871-E4F1-11D3-BC22-0080C73C8881. (Known as ACPI_20_TABLE_GUID in
> Linux, "include/linux/efi.h".)
> 
> See the following in edk2:
> 
> - OvmfPkg/AcpiPlatformDxe/QemuFwCfgAcpiPlatformDxe.inf
> 
> In this case, the guest firmware does not forward QEMU's original DTB to
> the guest OS.
> 
> 
> (8) Ultimately, from the guest OS's point of view, a UEFI config table
> for *either* the RSD PTR (ACPI_20_TABLE_GUID) *or* QEMU's DTB
> (DEVICE_TREE_GUID) is going to exist.
> 
> 
> (9) (Ard, please correct the below if necessary; thanks.)
> 
> The UEFI stub of the guest kernel (which is a UEFI application) uses a
> device tree as its main communication channel to the (later-started)
> kernel entry point, AIUI.
> 
> The UEFI stub basically inverts the importance of the UEFI system table
> versus the device tree -- the UEFI stub *converts* the UEFI system table
> (the multitude of UEFI config tables) into a device tree. This is my
> understanding anyway.
> 
> (9a) If ACPI was disabled on the QEMU command line, then the guest
> kernel *adopts* the device tree that was forwarded to it in (6), via the
> UEFI config table marked with DEVICE_TREE_GUID.
> 
> (9b) If ACPI was enabled on the QEMU command line, then the UEFI stub
> creates a brand new (empty) device tree (AIUI).
> 
> Either way, the UEFI system table is linked *under* the -- adopted or
> new -- device tree, through the "chosen" node. And so, if ACPI was
> enabled, the ACPI RSD PTR (coming from step (7)) becomes visible to the
> kernel proper as well, through the UEFI config table with
> ACPI_20_TABLE_GUID.
> 
> I believe this is implemented under "drivers/firmware/efi/libstub" in
> the kernel tree.
> 
> Thanks,
> Laszlo
> 
> .
> 
