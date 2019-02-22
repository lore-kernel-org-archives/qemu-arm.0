Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7288783wrx;
        Fri, 22 Feb 2019 11:11:51 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ5ECTLDxWqxnOJOCbG+LAw+CceT5NrQrN4tQzp1fiFN9jlcKVIHDtU3PbDel/7rP+XMW5d
X-Received: by 2002:a81:4f92:: with SMTP id d140mr4716261ywb.384.1550862710925;
        Fri, 22 Feb 2019 11:11:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550862710; cv=none;
        d=google.com; s=arc-20160816;
        b=aYQ0t0a+cbTnWpV0ZYBNKDqJpwvAAgoRMiqJtkbKpDtgc5jxA5Udd7uisC125/NKeF
         dQNCFL22DsWlh2lOQhW1Crbf35IlhlmCGz7JdduFVH0ss3mIROxhpE89zBoHArYFXjIQ
         HJ2z6LXOmbauN270VMXEm37LTBo5zj6jV3CW66tJ1+1BmkA07WZMWQ25oAZUJ8gj05o0
         WK6tEASUGRf0y/+ty61JVutqTzobR+1kGNju3G04HH/o0nhLWkARHtnQmajTV632SD+v
         lXPKim1b1Up442ENXdHqlN9hhhCrFqVq6lF+Pe2xKeQisHzdFE5IOhEY3m3L2cgd/uHj
         qvDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=VBo7THo0B5iWU1ZCaAukZN2AdwZNVKduF7EdpAmefwg=;
        b=Ry98mJ5U3RYa0c2TaMVA7Rqu2cL6joo9iMu+n6M1umO2qu10hVx82N90jOiKY5ZlUE
         /9snx63hZ/DOPP6EBW2qTh6kfIoma2mBxTeVgwIzXyjM1LLCaISG0g6TxMxcmrQtgf9m
         h9FpZOxmalY2szYd0dtBDK+1GmTylw7qG/BlIZSzd8vRQ7vH6zAqJ6aMVXyJclhKdoSc
         XibSCM+bs/YOvkTSu/PiCQkEd+9X2SOn7/QlTlya58zRII8Hd4DBUWYmZK2bKSZ9ehZ0
         xtskRfsgmld/qS3EnhR87ZbxQxERFC2zVKfU9jd720HtBKFnQ7CXEIypJJPfZZWysPzP
         VWgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17si1405924ywg.13.2019.02.22.11.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 11:11:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxGEg-0008SU-DK
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 14:11:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1gxGEZ-0008SO-Lj
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 14:11:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1gxGEY-0003K6-Dv
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 14:11:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41002)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1gxGEY-0003H1-4g; Fri, 22 Feb 2019 14:11:42 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3622530BC680;
	Fri, 22 Feb 2019 19:11:40 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-125-131.rdu2.redhat.com
	[10.10.125.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9951E5D9CA;
	Fri, 22 Feb 2019 19:11:30 +0000 (UTC)
To: Auger Eric <eric.auger@redhat.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	shannon.zhaosl@gmail.com, peter.maydell@linaro.org, imammedo@redhat.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
	<3a6bf5ea-5b48-18c2-8a2c-0ced777be816@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <892e3eb7-66f5-92a3-5891-de8665fc984a@redhat.com>
Date: Fri, 22 Feb 2019 20:11:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3a6bf5ea-5b48-18c2-8a2c-0ced777be816@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 22 Feb 2019 19:11:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 0/4] ARM virt: ACPI memory hotplug support
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
Cc: "Leif Lindholm \(Linaro address\)" <leif.lindholm@linaro.org>,
	linuxarm@huawei.com, xuwei5@huawei.com,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: plKalXCKL4A5

On 02/22/19 17:03, Auger Eric wrote:
> Hi Shameer,
> 
> On 1/28/19 12:05 PM, Shameer Kolothum wrote:
>> This series is an attempt to provide hotplug support to both
>> pc-dimm and nvdimm device memory on ARM virt platform. This is
>> based on Eric's recent works to support PCDIMM/NVDIMM device memory[1].
>> The kernel support for arm64 memory hot add was added only
>> recently by Robin[2] and hence the guest kernel should be => 5.0-rc1.
>>
>> This makes use of PL061 GPIO controller to sent related ACPI events
> s/sent/send
>> to the Guest. The only reference I could find with respect to the GPIO
>> pins usage is here[3] which says, "use PIN 3 for system_powerdown,
>> reserving PIN 0, 1, 2 for PCI hotplug, CPU hotplug and memory hotplug".
>> Hence Pin 2 is used for PCDIMM and pin 4 for NVDIMM.
>>
>> This is sanity tested on a HiSilicon ARM64 platform and appreciate
>> any further testing.
> 
> I did some testing on another platform and I got the exactly the same
> results as yours: PCDIMM hot plug works fine. Also after system_reset I
> still can see the slots.
> Hot-unplug is not supported though.
> For NVDIMM, hot-add works fine and and I can see the slots using ndctl
> on guest. But after system_reset, the guest does not boot properly.
> 
>>
>> This series can be applied on top of Eric's branch here[4]
>>
>> Test:
>> ------
>> Please use a Guest kernel image >5.0-rc1 with all the mem/nvdimm
>> hotplug related CONFIGs enabled.
>>
>> ./qemu-system-aarch64 \
>> -machine virt,gic-version=3,nvdimm \
>> -m 1G,maxmem=4G,slots=4 \
>> -cpu host \
>> -kernel Image \
>> -initrd rootfs-iperf.cpio \
>> -bios QEMU_EFI.fd \
>> -numa node,nodeid=0 \
>> -net none \
>> -nographic -enable-kvm \
>> -append "console=ttyAMA0 acpi=force earlycon=pl011,0x9000000"
>>
>> Enter Qemu monitor,
>> Add pc-dimm:
>> object_add memory-backend-ram,id=mem1,size=1G
>> device_add pc-dimm,id=dimm1,memdev=mem1
>>
>> Add nvdimm:
>> object_add memory-backend-ram,id=mem2,size=1G
>> device_add nvdimm,id=dimm2,memdev=mem2
>>
>> Known Issue:
>>
>> It is observed that hot adding nvdimm will results in guest reboot
>> failure. EDK2 fails to build the ACPI tables on reboot. Please find
>> below EDK2 log on Guest reboot after nvdimm hot-add,
>>
>> ProcessCmdAddChecksum: invalid checksum range in "etc/acpi/tables"
>> OnRootBridgesConnected: InstallAcpiTables: Protocol Error
>>
>> The root cause seems to be EDK2 ACPI table checksum failure
>> as NFIT table is getting updated on hot-add. This needs further
>> investigation.
> + Ard, Leif, Laszlo if they have any idea of what is missing/wrong.

Huh, very interesting; I usually don't expect my sanity checks to fire
in practice. :)

The message

  ProcessCmdAddChecksum: invalid checksum range in "etc/acpi/tables"

is logged by OVMF's and ArmVirtQemu's ACPI Platform DXE Driver when it
finds an invalid COMMAND_ADD_CHECKSUM command in QEMU's ACPI
linker/loader script.

Please see the command definition in QEMU's
"hw/acpi/bios-linker-loader.c". In particular, please refer to the
function bios_linker_loader_add_checksum(), which builds the command
structure, and documents the fields.

(You may also refer to QEMU_LOADER_ADD_CHECKSUM in file
"OvmfPkg/AcpiPlatformDxe/QemuLoader.h" in the edk2 source tree, for the
same information.)

The error message is logged if:
- the offset at which the checksum should be stored falls outside of the
size of the fw_cfg blob, or
- the range over which the checksum should be calculated falls outside
(at least in part) of the fw_cfg blob.

To me this suggests that QEMU generates an invalid COMMAND_ADD_CHECKSUM
command for the firmware.

... I've tried to skim the patches briefly. I think there must be an
error in the DSDT building logic that is only active on reboot if an
nvdimm module was hot-added before the reboot.

Thanks,
Laszlo


>> [1]https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg05740.html
>> [2]https://patchwork.kernel.org/patch/10724455/
>> [3]https://lists.gnu.org/archive/html/qemu-arm/2015-12/msg00095.html
>> [4]https://github.com/eauger/qemu/tree/v3.1.0-dimm-v5
>>
>> Shameer Kolothum (4):
>>   hw:acpi: Make ACPI IO address space configurable
>>   hw/arm/virt: Add GPIO based pcdimm hotplug ACPI event support
>>   hw/arm/virt: Enable pc-dimm hotplug support
>>   hw/arm/virt: Add nvdimm hotplug support
>>
>>  default-configs/arm-softmmu.mak  |   1 +
>>  hw/acpi/memory_hotplug.c         |  13 +++--
>>  hw/arm/virt-acpi-build.c         |  45 +++++++++++++++--
>>  hw/arm/virt.c                    | 105 ++++++++++++++++++++++++++++++++++++---
>>  hw/i386/acpi-build.c             |   3 +-
>>  include/hw/acpi/memory_hotplug.h |   6 ++-
>>  include/hw/arm/virt.h            |  15 ++++++
>>  7 files changed, 168 insertions(+), 20 deletions(-)
>>

