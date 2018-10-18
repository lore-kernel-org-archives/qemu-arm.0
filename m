Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2240795wrt;
        Thu, 18 Oct 2018 05:57:02 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63wHIz/bKHlwR5VA4IqFr3ODjMTLbayGHcNok0ajmk3IJ+wU7ozU8dx4WA6VryRFQlmMzue
X-Received: by 2002:ac8:75d8:: with SMTP id z24-v6mr27773103qtq.362.1539867422219;
        Thu, 18 Oct 2018 05:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539867422; cv=none;
        d=google.com; s=arc-20160816;
        b=AqMI2QrsRQPubzHRRmR1+HviWjB1u+9oqIhvjNtTBWflSgju93vSx9HRgtDYyNFu2z
         HWH3QfM7mxs0NHeUf6OnckZHBi7tR34JUpofdyYn8QFPBgZWF0PGStgjsLbimABgUMFV
         BwSthYaGS6lbs8u+BU3LLoqxWYZZBX92XphK1+6azlpo8xlx05LVM3VtGvGASw58dS3H
         hZLnYDev47YCfeO9xd6isFQzVZrDa1niTmKVG1A199/2XSmMFU4FDe9vOegFLlhOjQ/t
         cH+GyhSBjNOJO7DWrfE8X7LWf8MUl9cgyuJQqFg0kLlsRArBw+SNoKeYzW6BWCRz1qGo
         h+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=cBKlbh+vU28EMfUoXVBQst+a1flEEtVBmjrme3GaI2s=;
        b=Tj/yTmOkVQBelpSEdhaJQGabFxJZEBTUAZOlStVUInWm6f+d/4mWRvRWvucibjJcDj
         Z5+6kC4Emg9hZ3zQjX/osw01Qo/wrp1NViIymASZZT9FpgMPTH6DbhUVAFMiUEg2Rfb9
         /vMTXePObBwQT+HB3W81uis++uAqEkqmVpws+uN6hUKEM8JlSexTOCzKGF+fJaWQNUGd
         Hrps+8EkkzojOeAJjXWdqA2hqy4PoShZ8XJRCCGGtyI1FhICkirfA19EANB6V1aloYVF
         UGevyEXczCItX+BRUSkJS2y85rWZFwiZbfykvAL8uQQUG7H70yOkUPyN+xSay3jepIzA
         VijQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l4-v6si12984312qti.228.2018.10.18.05.57.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 05:57:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42203 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD7rJ-00044y-Qd
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 08:57:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD7rC-00044n-Ru
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 08:56:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD7r9-0001kp-Fz
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 08:56:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46552)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gD7r9-0001jN-6d; Thu, 18 Oct 2018 08:56:51 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03A6DC058CB7;
	Thu, 18 Oct 2018 12:56:49 +0000 (UTC)
Received: from [10.36.116.215] (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E146610021B2;
	Thu, 18 Oct 2018 12:56:39 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<20180718160832.0d754aa4@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4bdd8486-f044-4a0c-8bcd-c6f357306781@redhat.com>
Date: Thu, 18 Oct 2018 14:56:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180718160832.0d754aa4@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 18 Oct 2018 12:56:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v3 00/15] ARM virt: PCDIMM/NVDIMM at 2TB
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, agraf@suse.de, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bXyIJHQ42Bno

Hi Igor,

On 7/18/18 4:08 PM, Igor Mammedov wrote:
> On Tue,  3 Jul 2018 09:19:43 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> This series aims at supporting PCDIMM/NVDIMM intantiation in
>> machvirt at 2TB guest physical address.
>>
>> This is achieved in 3 steps:
>> 1) support more than 40b IPA/GPA
> will it work for TCG as well?
> /important from make check pov and maybe in cases when there is no ARM system available to test/play with the feature/
> 

Sorry I missed this comment.

On A TCG guest ID_AA64MMFR0_EL1.PARange ID register field is the machine
limiting factor as it returns the supported physical address range
(target/arm/cpu64.c):

aarch64_a53_initfn hardcodes PA range to 40bits
	cpu->id_aa64mmfr0 = 0x00001122
aarch64_a57_initfn hardcodes PA Range to 44 bits
    	cpu->id_aa64mmfr0 = 0x00001124

for TCG guests we may add support for the phys-bits option which would
allow to set the PARange instead of hardcoding it.

Thanks

Eric

> 
> 
>> 2) support PCDIMM instantiation
>> 3) support NVDIMM instantiation
>>
>> This series reuses/rebases patches initially submitted by Shameer in [1]
>> and Kwangwoo in [2].
>>
>> I put all parts all together for consistency and due to dependencies
>> however as soon as the kernel dependency is resolved we can consider
>> upstreaming them separately.
>>
>> Support more than 40b IPA/GPA [ patches 1 - 5 ]
>> -----------------------------------------------
>> was "[RFC 0/6] KVM/ARM: Dynamic and larger GPA size"
>>
>> At the moment the guest physical address space is limited to 40b
>> due to KVM limitations. [0] bumps this limitation and allows to
>> create a VM with up to 52b GPA address space.
>>
>> With this series, QEMU creates a virt VM with the max IPA range
>> reported by the host kernel or 40b by default.
>>
>> This choice can be overriden by using the -machine kvm-type=<bits>
>> option with bits within [40, 52]. If <bits> are not supported by
>> the host, the legacy 40b value is used.
>>
>> Currently the EDK2 FW also hardcodes the max number of GPA bits to
>> 40. This will need to be fixed.
>>
>> PCDIMM Support [ patches 6 - 11 ]
>> ---------------------------------
>> was "[RFC 0/5] ARM virt: Support PC-DIMM at 2TB"
>>
>> We instantiate the device_memory at 2TB. Using it obviously requires
>> at least 42b of IPA/GPA. While its max capacity is currently limited
>> to 2TB, the actual size depends on the initial guest RAM size and
>> maxmem parameter.
>>
>> Actual hot-plug and hot-unplug of PC-DIMM is not suported due to lack
>> of support of those features in baremetal.
>>
>> NVDIMM support [ patches 12 - 15 ]
>> ----------------------------------
>>
>> Once the memory hotplug framework is in place it is fairly
>> straightforward to add support for NVDIMM. the machine "nvdimm" option
>> turns the capability on.
>>
>> Best Regards
>>
>> Eric
>>
>> References:
>>
>> [0] [PATCH v3 00/20] arm64: Dynamic & 52bit IPA support
>> https://www.spinics.net/lists/kernel/msg2841735.html
>>
>> [1] [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
>> http://patchwork.ozlabs.org/cover/914694/
>>
>> [2] [RFC PATCH 0/3] add nvdimm support on AArch64 virt platform
>> https://lists.gnu.org/archive/html/qemu-devel/2016-07/msg04599.html
>>
>> Tests:
>> - On Cavium Gigabyte, a 48b VM was created.
>> - Migration tests were performed between kernel supporting the
>>   feature and destination kernel not suporting it
>> - test with ACPI: to overcome the limitation of EDK2 FW, virt
>>   memory map was hacked to move the device memory below 1TB.
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/v2.12.0-dimm-2tb-v3
>>
>> History:
>>
>> v2 -> v3:
>> - fix pc_q35 and pc_piix compilation error
>> - kwangwoo's email being not valid anymore, remove his address
>>
>> v1 -> v2:
>> - kvm_get_max_vm_phys_shift moved in arch specific file
>> - addition of NVDIMM part
>> - single series
>> - rebase on David's refactoring
>>
>> v1:
>> - was "[RFC 0/6] KVM/ARM: Dynamic and larger GPA size"
>> - was "[RFC 0/5] ARM virt: Support PC-DIMM at 2TB"
>>
>> Best Regards
>>
>> Eric
>>
>>
>> Eric Auger (9):
>>   linux-headers: header update for KVM/ARM KVM_ARM_GET_MAX_VM_PHYS_SHIFT
>>   hw/boards: Add a MachineState parameter to kvm_type callback
>>   kvm: add kvm_arm_get_max_vm_phys_shift
>>   hw/arm/virt: support kvm_type property
>>   hw/arm/virt: handle max_vm_phys_shift conflicts on migration
>>   hw/arm/virt: Allocate device_memory
>>   acpi: move build_srat_hotpluggable_memory to generic ACPI source
>>   hw/arm/boot: Expose the pmem nodes in the DT
>>   hw/arm/virt: Add nvdimm and nvdimm-persistence options
>>
>> Kwangwoo Lee (2):
>>   nvdimm: use configurable ACPI IO base and size
>>   hw/arm/virt: Add nvdimm hot-plug infrastructure
>>
>> Shameer Kolothum (4):
>>   hw/arm/virt: Add memory hotplug framework
>>   hw/arm/boot: introduce fdt_add_memory_node helper
>>   hw/arm/boot: Expose the PC-DIMM nodes in the DT
>>   hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
>>
>>  accel/kvm/kvm-all.c                            |   2 +-
>>  default-configs/arm-softmmu.mak                |   4 +
>>  hw/acpi/aml-build.c                            |  51 ++++
>>  hw/acpi/nvdimm.c                               |  28 ++-
>>  hw/arm/boot.c                                  | 123 +++++++--
>>  hw/arm/virt-acpi-build.c                       |  10 +
>>  hw/arm/virt.c                                  | 330 ++++++++++++++++++++++---
>>  hw/i386/acpi-build.c                           |  49 ----
>>  hw/i386/pc_piix.c                              |   8 +-
>>  hw/i386/pc_q35.c                               |   8 +-
>>  hw/ppc/mac_newworld.c                          |   2 +-
>>  hw/ppc/mac_oldworld.c                          |   2 +-
>>  hw/ppc/spapr.c                                 |   2 +-
>>  include/hw/acpi/aml-build.h                    |   3 +
>>  include/hw/arm/arm.h                           |   2 +
>>  include/hw/arm/virt.h                          |   7 +
>>  include/hw/boards.h                            |   2 +-
>>  include/hw/mem/nvdimm.h                        |  12 +
>>  include/standard-headers/linux/virtio_config.h |  16 +-
>>  linux-headers/asm-mips/unistd.h                |  18 +-
>>  linux-headers/asm-powerpc/kvm.h                |   1 +
>>  linux-headers/linux/kvm.h                      |  16 ++
>>  target/arm/kvm.c                               |   9 +
>>  target/arm/kvm_arm.h                           |  16 ++
>>  24 files changed, 597 insertions(+), 124 deletions(-)
>>
> 
