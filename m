Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp680802wrx;
        Thu, 28 Feb 2019 07:05:31 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY8ijH1gGyPEPQG2Pt4Bv+FIxLFiuxSCaN4+FJQo66TbZ4fsijlGTfIF7XVeX/9PKq6sDpM
X-Received: by 2002:a81:74d6:: with SMTP id p205mr5900417ywc.116.1551366331251;
        Thu, 28 Feb 2019 07:05:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551366331; cv=none;
        d=google.com; s=arc-20160816;
        b=HGWSvRrmR0sDeBpKTM3dZ5ods4qFSQwf//1lyyFOR/xArAu3Ic8PL0T1QbDikBxuHo
         kj+FuRA6nzrkFOUehyKAdfyU7ALNcdQIWHKqrJbRmOROyakle1fek8acLOv7uiefFSba
         5Q3r5HhZT4sDrF4VtAhU43K3ZzsidCYCWJtJrbnEhHTRe0XBznCCjqaggvKNxmMT3aNF
         ABHuVThZzY32mbfFgDQlkVocZ15mb3xfO1Lj4cdPJxoiDESkl+AagIAachScGGjmrPEF
         ux/JO3zkry0M0VcjJGFjloG0baR/ueX4jgezjq6eg7O6qc3l6rG91rBkZtkJIKELjwCM
         0U5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=kWI38asY+6LqXbAPZ5LqTIf0uFPXGjk4de2AKupw2dg=;
        b=CFEgkmcE0Srep+rdygRD0yyqmB+TyFpNXbl89p1/NMU2/jzIkyhk0tz2Yc+JFaTSYl
         A/HIxy4HrPoLDXh8R7pf5njB9ir7uzzauNUwc5Uem/VCIvRxF8cdt41HNSDrC7u8NQ5a
         pnBsGVrIXKNw53ox75naT1l4aj0Ywm+6asgxYUs0kOiYxnx4lgEDpv1nF5HXsRKZi3od
         Sz4VgqE+q/EH53DIUmQOaklADjzIUXvpQ4urcS+0zMw0IlCT7NuiHSK4Nvtt0yAnPsD7
         XrgTt89e+rI40j5XoB1pmZC0UnE10tPkfQ9GbNo2Ghu7y14JoVUC6W41/yhQMtzmZJTs
         llfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e64si761312ybe.164.2019.02.28.07.05.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 07:05:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzNFa-0002UB-KL
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 10:05:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNEA-0001Qf-IU
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 10:04:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNDr-0003k5-VZ
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 10:03:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55962)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gzNDr-0003jJ-LO; Thu, 28 Feb 2019 10:03:43 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D474BCFED;
	Thu, 28 Feb 2019 15:03:42 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99CD819C71;
	Thu, 28 Feb 2019 15:03:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Thu, 28 Feb 2019 16:03:14 +0100
Message-Id: <20190228150324.25973-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 28 Feb 2019 15:03:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v10 00/10] ARM virt: Initial RAM expansion and
 extended memory map
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0oj7wvmbkiL0

This series aims to bump the 255GB RAM limit in machvirt and paves the
way to device memory addition.

In machvirt versions < 4.0, the initial RAM starts at 1GB and can
grow up to 255GB. From 256GB onwards we find IO regions such as the
additional GICv3 RDIST region, high PCIe ECAM region and high PCIe
MMIO region. The address map was 1TB large. This corresponded to
the max IPA capacity KVM was able to manage.

Since 4.20, the host kernel is able to support a larger and dynamic
IPA range. So the guest physical address can go beyond the 1TB. The
max GPA size depends on the host kernel configuration and physical CPUs.

In this series we use this feature and allow the RAM to grow without
any other limit than the one put by the host kernel.

The RAM still starts at 1GB. First comes the initial ram (-m) of size
ram_size and then we provision sufficient space for the looming
device memory (dimensionned using ,maxmem and slots options).

IO regions previously located between 256GB and 1TB are moved after
the RAM. Their offset is dynamically computed, depends on ram_size,
slots, maxram_size. Size alignment is enforced.

In case maxmem value is inferior to 255GB, the legacy memory map
still is used.

As we keep the initial RAM at 1GB base address, we do not need to do
invasive changes in the EDK2 FW. It seems nobody is eager to do
that job at the moment.

Device memory being put just after the initial RAM, it will be
possible to get access to this feature while keeping a 1TB address
map.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v3.1.0-extended-memmap-v10

History:

v9 -> v10:
- only the keep the first 10 patches which move to the extended memmap
- remove the 1GB alignment check on maxram_size

v8 -> v9:
- fixed make check SIGSEV
- fixed TCG issue (restored virt_set_memmap in machvirt_init)
- removed Igor's R-b on "hw/arm/boot: Expose the PC-DIMM nodes in the DT"

v7 -> v8:
- addressed Igor's comments"
- remove no_extended_memmap knob
- moved acpi_nvdimm_state into MachineState
- separate "hw/arm/virt: Check the VCPU PA range in TCG mode" patch

v6 -> v7:
- Addressed Peter and Igor comments (exceptions sent my email)
- Fixed TCG case. Now device memory works also for TCG and vcpu
  pamax is checked
- See individual logs for more details

v5 -> v6:
- mingw compilation issue fix
- kvm_arm_get_max_vm_phys_shift always returns the number of supported
  IPA bits
- new patch "hw/arm/virt: Rename highmem IO regions" that eases the revie=
w
  of "hw/arm/virt: Split the memory map description"
- "hw/arm/virt: Move memory map initialization into machvirt_init"
  squashed into the previous patch
- change alignment of IO regions beyond the RAM so that it matches their
  size

v4 -> v5:
- change in the memory map
- see individual logs

v3 -> v4:
- rebase on David's "pc-dimm: next bunch of cleanups" and
  "pc-dimm: pre_plug "slot" and "addr" assignment"
- kvm-type option not used anymore. We directly use
  maxram_size and ram_size machine fields to compute the
  MAX IPA range. Migration is naturally handled as CLI
  option are kept between source and destination. This was
  suggested by David.
- device_memory_start and device_memory_size not stored
  anymore in vms->bootinfo
- I did not take into account 2 Igor's comments: the one
  related to the refactoring of arm_load_dtb and the one
  related to the generation of the dtb after system_reset
  which would contain nodes of hotplugged devices (we do
  not support hotplug at this stage)
- check the end-user does not attempt to hotplug a device
- addition of "vl: Set machine ram_size, maxram_size and
  ram_slots earlier"

v2 -> v3:
- fix pc_q35 and pc_piix compilation error
- kwangwoo's email being not valid anymore, remove his address

v1 -> v2:
- kvm_get_max_vm_phys_shift moved in arch specific file
- addition of NVDIMM part
- single series
- rebase on David's refactoring

v1:
- was "[RFC 0/6] KVM/ARM: Dynamic and larger GPA size"
- was "[RFC 0/5] ARM virt: Support PC-DIMM at 2TB"

Best Regards

Eric


Eric Auger (9):
  hw/arm/virt: Rename highmem IO regions
  hw/arm/virt: Split the memory map description
  hw/boards: Add a MachineState parameter to kvm_type callback
  kvm: add kvm_arm_get_max_vm_ipa_size
  vl: Set machine ram_size, maxram_size and ram_slots earlier
  hw/arm/virt: Dynamic memory map depending on RAM requirements
  hw/arm/virt: Implement kvm_type function for 4.0 machine
  hw/arm/virt: Check the VCPU PA range in TCG mode
  hw/arm/virt: Bump the 255GB initial RAM limit

Shameer Kolothum (1):
  hw/arm/boot: introduce fdt_add_memory_node helper

 accel/kvm/kvm-all.c      |   2 +-
 hw/arm/boot.c            |  54 +++++++----
 hw/arm/virt-acpi-build.c |  10 +-
 hw/arm/virt.c            | 195 +++++++++++++++++++++++++++++++--------
 hw/ppc/mac_newworld.c    |   3 +-
 hw/ppc/mac_oldworld.c    |   2 +-
 hw/ppc/spapr.c           |   2 +-
 include/hw/arm/virt.h    |  17 +++-
 include/hw/boards.h      |   5 +-
 target/arm/kvm.c         |  10 ++
 target/arm/kvm_arm.h     |  13 +++
 vl.c                     |   6 +-
 12 files changed, 241 insertions(+), 78 deletions(-)

--=20
2.20.1

