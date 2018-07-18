Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp505346wru;
        Wed, 18 Jul 2018 07:08:47 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdOBHRNHL7JggMkeoXmKLff6hNn7cHo8kHnvMoiwDxnTx40TqO49xTuWJs0Z0rRQ5jhff+3
X-Received: by 2002:aed:25c9:: with SMTP id y9-v6mr5816642qtc.284.1531922927877;
        Wed, 18 Jul 2018 07:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531922927; cv=none;
        d=google.com; s=arc-20160816;
        b=axhW8atyj9qyZ8WziYWEg53vgxvc+NgWECAG7uWFNSQqWbFiHVy62frvsEVKLUfSXX
         684UmqcEq1gAzZ3nQvlxNrWv1kVCPGfoGPE3hoGIvBydKA8OGt2edfkHjKfR1L/WceQO
         a7UG7f411wS4haOLVNNT0xDFpezHeLf6ys605b+2tqB4dFayHKwRRmeuvSwsCHLX5Iiv
         nyuO78uqEei9MBYSD3X0mz6kmop7pjzYE4toZWuCSE3sTVFsLtoCMlWoiuF8WJR9orPm
         VfZ0utakD2a9z30WCkSnT/F9rItZMlrxA+jUyWEkOuKDGvtB93kfVH49deva2Ifol1KM
         uocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=2cJrPsO23f6E/GwKdNcCD8/wfRMy17iPRlQhc+MDqRQ=;
        b=fA9pKsOaDUiiUOK5gmZugESvx111PeMVOXSETE1bpPuDdRIM3Ji4kzuZZFLFk/YjHK
         rmeSEOSL870LQMtTz6i8xiEBmvH7nv+erZ66GELnjtuDZZ7EtPkk5sfK8oeVFg+epLGA
         ilGpZzVCNwnSaUr8Vfa/gMC9bw7OYbVidrn4Kc4llEFCPjG16Ki2INGEsD6ZAQBL5eMj
         9609+bjLe2PIfJZ1CAPgakurlFoei754C9NfqS2WyId07GaysNy5RRrBaJyWD4eNHJXW
         GN1dWURm85Fk+e8ng/2rS1aSUqky8n18G1C7lQ81nElqCEyNHGAMDGTYTEHSHq3heRbr
         nXCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e40-v6si2295727qta.144.2018.07.18.07.08.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Jul 2018 07:08:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36867 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffn8J-0003RD-EL
	for alex.bennee@linaro.org; Wed, 18 Jul 2018 10:08:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ffn8C-0003R5-CL
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 10:08:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ffn88-000281-Lu
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 10:08:40 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43326 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ffn88-00027R-BZ; Wed, 18 Jul 2018 10:08:36 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E5BF6402315B;
	Wed, 18 Jul 2018 14:08:35 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16EE42026D69;
	Wed, 18 Jul 2018 14:08:33 +0000 (UTC)
Date: Wed, 18 Jul 2018 16:08:32 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20180718160832.0d754aa4@redhat.com>
In-Reply-To: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 18 Jul 2018 14:08:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 18 Jul 2018 14:08:36 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
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
X-TUID: Lpfn/LpxmWB6

On Tue,  3 Jul 2018 09:19:43 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> This series aims at supporting PCDIMM/NVDIMM intantiation in
> machvirt at 2TB guest physical address.
> 
> This is achieved in 3 steps:
> 1) support more than 40b IPA/GPA
will it work for TCG as well?
/important from make check pov and maybe in cases when there is no ARM system available to test/play with the feature/



> 2) support PCDIMM instantiation
> 3) support NVDIMM instantiation
> 
> This series reuses/rebases patches initially submitted by Shameer in [1]
> and Kwangwoo in [2].
> 
> I put all parts all together for consistency and due to dependencies
> however as soon as the kernel dependency is resolved we can consider
> upstreaming them separately.
> 
> Support more than 40b IPA/GPA [ patches 1 - 5 ]
> -----------------------------------------------
> was "[RFC 0/6] KVM/ARM: Dynamic and larger GPA size"
> 
> At the moment the guest physical address space is limited to 40b
> due to KVM limitations. [0] bumps this limitation and allows to
> create a VM with up to 52b GPA address space.
> 
> With this series, QEMU creates a virt VM with the max IPA range
> reported by the host kernel or 40b by default.
> 
> This choice can be overriden by using the -machine kvm-type=<bits>
> option with bits within [40, 52]. If <bits> are not supported by
> the host, the legacy 40b value is used.
> 
> Currently the EDK2 FW also hardcodes the max number of GPA bits to
> 40. This will need to be fixed.
> 
> PCDIMM Support [ patches 6 - 11 ]
> ---------------------------------
> was "[RFC 0/5] ARM virt: Support PC-DIMM at 2TB"
> 
> We instantiate the device_memory at 2TB. Using it obviously requires
> at least 42b of IPA/GPA. While its max capacity is currently limited
> to 2TB, the actual size depends on the initial guest RAM size and
> maxmem parameter.
> 
> Actual hot-plug and hot-unplug of PC-DIMM is not suported due to lack
> of support of those features in baremetal.
> 
> NVDIMM support [ patches 12 - 15 ]
> ----------------------------------
> 
> Once the memory hotplug framework is in place it is fairly
> straightforward to add support for NVDIMM. the machine "nvdimm" option
> turns the capability on.
> 
> Best Regards
> 
> Eric
> 
> References:
> 
> [0] [PATCH v3 00/20] arm64: Dynamic & 52bit IPA support
> https://www.spinics.net/lists/kernel/msg2841735.html
> 
> [1] [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
> http://patchwork.ozlabs.org/cover/914694/
> 
> [2] [RFC PATCH 0/3] add nvdimm support on AArch64 virt platform
> https://lists.gnu.org/archive/html/qemu-devel/2016-07/msg04599.html
> 
> Tests:
> - On Cavium Gigabyte, a 48b VM was created.
> - Migration tests were performed between kernel supporting the
>   feature and destination kernel not suporting it
> - test with ACPI: to overcome the limitation of EDK2 FW, virt
>   memory map was hacked to move the device memory below 1TB.
> 
> This series can be found at:
> https://github.com/eauger/qemu/tree/v2.12.0-dimm-2tb-v3
> 
> History:
> 
> v2 -> v3:
> - fix pc_q35 and pc_piix compilation error
> - kwangwoo's email being not valid anymore, remove his address
> 
> v1 -> v2:
> - kvm_get_max_vm_phys_shift moved in arch specific file
> - addition of NVDIMM part
> - single series
> - rebase on David's refactoring
> 
> v1:
> - was "[RFC 0/6] KVM/ARM: Dynamic and larger GPA size"
> - was "[RFC 0/5] ARM virt: Support PC-DIMM at 2TB"
> 
> Best Regards
> 
> Eric
> 
> 
> Eric Auger (9):
>   linux-headers: header update for KVM/ARM KVM_ARM_GET_MAX_VM_PHYS_SHIFT
>   hw/boards: Add a MachineState parameter to kvm_type callback
>   kvm: add kvm_arm_get_max_vm_phys_shift
>   hw/arm/virt: support kvm_type property
>   hw/arm/virt: handle max_vm_phys_shift conflicts on migration
>   hw/arm/virt: Allocate device_memory
>   acpi: move build_srat_hotpluggable_memory to generic ACPI source
>   hw/arm/boot: Expose the pmem nodes in the DT
>   hw/arm/virt: Add nvdimm and nvdimm-persistence options
> 
> Kwangwoo Lee (2):
>   nvdimm: use configurable ACPI IO base and size
>   hw/arm/virt: Add nvdimm hot-plug infrastructure
> 
> Shameer Kolothum (4):
>   hw/arm/virt: Add memory hotplug framework
>   hw/arm/boot: introduce fdt_add_memory_node helper
>   hw/arm/boot: Expose the PC-DIMM nodes in the DT
>   hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
> 
>  accel/kvm/kvm-all.c                            |   2 +-
>  default-configs/arm-softmmu.mak                |   4 +
>  hw/acpi/aml-build.c                            |  51 ++++
>  hw/acpi/nvdimm.c                               |  28 ++-
>  hw/arm/boot.c                                  | 123 +++++++--
>  hw/arm/virt-acpi-build.c                       |  10 +
>  hw/arm/virt.c                                  | 330 ++++++++++++++++++++++---
>  hw/i386/acpi-build.c                           |  49 ----
>  hw/i386/pc_piix.c                              |   8 +-
>  hw/i386/pc_q35.c                               |   8 +-
>  hw/ppc/mac_newworld.c                          |   2 +-
>  hw/ppc/mac_oldworld.c                          |   2 +-
>  hw/ppc/spapr.c                                 |   2 +-
>  include/hw/acpi/aml-build.h                    |   3 +
>  include/hw/arm/arm.h                           |   2 +
>  include/hw/arm/virt.h                          |   7 +
>  include/hw/boards.h                            |   2 +-
>  include/hw/mem/nvdimm.h                        |  12 +
>  include/standard-headers/linux/virtio_config.h |  16 +-
>  linux-headers/asm-mips/unistd.h                |  18 +-
>  linux-headers/asm-powerpc/kvm.h                |   1 +
>  linux-headers/linux/kvm.h                      |  16 ++
>  target/arm/kvm.c                               |   9 +
>  target/arm/kvm_arm.h                           |  16 ++
>  24 files changed, 597 insertions(+), 124 deletions(-)
> 

