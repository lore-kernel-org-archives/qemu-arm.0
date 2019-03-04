Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3830755wrx;
        Mon, 4 Mar 2019 09:12:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqwO5IuVjWzHK1ezD5MUZXoDWjqvsvTxaQvnoURpziG+N+qNK3Zqzqz7E3WKCBTypFA/FA+K
X-Received: by 2002:a25:8241:: with SMTP id d1mr15494968ybn.345.1551719531764;
        Mon, 04 Mar 2019 09:12:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551719531; cv=none;
        d=google.com; s=arc-20160816;
        b=tqbPY9RsXcsdaSe7uF3CLhmqaOdT0lUYxUpXrU1UWXaFd0dJyqIte9GKw3rJahPixg
         ofkhwTxSmYqrpMk1dUpvD2ernc+jp0Z4O4Tmlx02otVPbj7jl10vNYmGFfsPa950DB46
         DRG3YNHcZF8OTYs6snM9bWRcKjpNOnMrapVVtSF3EWKigjeRGOGaWQNKkDCaVG7Sw2LU
         faATHlX4SsPo6Wj8xqHpnK/b3WlseMqLT2y8nz5w9N6OK4Qz1XZv6seyItc09gzByKpN
         XsHQf9ye5K01HJ74XgSUqegRAZPoHu3xSRIeE3cAimk+ccYwbbRkLLaguaOtiRaSEeVj
         sAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=DmGWuFm7kqvA7eiuXxCwItI3tNJYZcCLNsEhXTChurA=;
        b=ZtQv8yaWMCKEL4PCuV2ixa6hbfetFh00DebBudfs2z/pRulycXX9qEKPz7nGUUGKbY
         SvfIv1WXNH7wDmqv2U1OgKrXtj6bF5iYsmqfbxelFG7ntMmFyuwdpHrMSWgIdosLyQtw
         9KeWbI7g9adgtqBlHSLNu7lKQpiGZY79XqgPUkFWwRFLkgdr8YD0w9sk5/pzeYYF8vgU
         7y4vtR6pY2AVvK8fyzHlGxvq4fkLXY8LMaD5yW3c//ok9tH/bi+oY9xsW7kwKF1RUnfI
         lowiuodfdqrjlU/nIp0ODyCR2IVSRBiIbNdVe0qE3hXzNebgXFfT2dn8nl7QM9GAhVWi
         CfTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f132si3760255ywc.198.2019.03.04.09.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 09:12:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:57734 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0r8N-0004NO-4m
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 12:12:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h0r8F-0004ND-7T
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 12:12:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h0r8D-0002mW-Ui
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 12:12:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59978)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h0r8D-0002l4-K8; Mon, 04 Mar 2019 12:12:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8C053680B;
	Mon,  4 Mar 2019 17:11:59 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17EC55C207;
	Mon,  4 Mar 2019 17:11:53 +0000 (UTC)
To: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, shameerali.kolothum.thodi@huawei.com,
	imammedo@redhat.com, david@redhat.com
References: <20190304101339.25970-1-eric.auger@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a90df8ae-503e-227a-2f4a-3bd61e4da99f@redhat.com>
Date: Mon, 4 Mar 2019 18:11:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190304101339.25970-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 04 Mar 2019 17:11:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v12 00/10] ARM virt: Initial RAM expansion
 and extended memory map
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
X-TUID: I8dSFZfuDYSz

Hi Peter,

On 3/4/19 11:13 AM, Eric Auger wrote:
> This series aims to bump the 255GB RAM limit in machvirt and paves the
> way to device memory addition.
> 
> In machvirt versions < 4.0, the initial RAM starts at 1GB and can
> grow up to 255GB. From 256GB onwards we find IO regions such as the
> additional GICv3 RDIST region, high PCIe ECAM region and high PCIe
> MMIO region. The address map was 1TB large. This corresponded to
> the max IPA capacity KVM was able to manage.
> 
> Since 4.20, the host kernel is able to support a larger and dynamic
> IPA range. So the guest physical address can go beyond the 1TB. The
> max GPA size depends on the host kernel configuration and physical CPUs.
> 
> In this series we use this feature and allow the RAM to grow without
> any other limit than the one put by the host kernel.
> 
> The RAM still starts at 1GB. First comes the initial ram (-m) of size
> ram_size and then we provision sufficient space for the looming
> device memory (dimensionned using ,maxmem and slots options).
> 
> IO regions previously located between 256GB and 1TB are moved after
> the RAM. Their offset is dynamically computed, depends on ram_size,
> slots, maxram_size. Size alignment is enforced.
> 
> In case maxmem value is inferior to 255GB, the legacy memory map
> still is used.
> 
> As we keep the initial RAM at 1GB base address, we do not need to do
> invasive changes in the EDK2 FW. It seems nobody is eager to do
> that job at the moment.
> 
> Device memory being put just after the initial RAM, it will be
> possible to get access to this feature while keeping a 1TB address
> map.
> 
> Best Regards
> 
> Eric
> 
> This series can be found at:
> https://github.com/eauger/qemu/tree/v3.1.0-extended-memmap-v12
> 
> History:
> v11 -> v12:
> - collected last Igor's and Richard's R-b's
> - removed the memmap initialization to NULL

I collected all the R-b's I received from Igor and Richard and I removed
the PCDIMM/NVDIMM integration. Please let me know if you have some
remaining comments so that this series hopefully lands in the next release.

Thanks

Eric
> 
> v10 -> v11:
> - remove vms->high_io_base
> - remove RAM_BASE
> - see individual change logs for other adjustments
> 
> v9 -> v10:
> - only the keep the first 10 patches which move to the extended memmap
> - remove the 1GB alignment check on maxram_size
> 
> v8 -> v9:
> - fixed make check SIGSEV
> - fixed TCG issue (restored virt_set_memmap in machvirt_init)
> - removed Igor's R-b on "hw/arm/boot: Expose the PC-DIMM nodes in the DT"
> 
> v7 -> v8:
> - addressed Igor's comments"
> - remove no_extended_memmap knob
> - moved acpi_nvdimm_state into MachineState
> - separate "hw/arm/virt: Check the VCPU PA range in TCG mode" patch
> 
> v6 -> v7:
> - Addressed Peter and Igor comments (exceptions sent my email)
> - Fixed TCG case. Now device memory works also for TCG and vcpu
>   pamax is checked
> - See individual logs for more details
> 
> v5 -> v6:
> - mingw compilation issue fix
> - kvm_arm_get_max_vm_phys_shift always returns the number of supported
>   IPA bits
> - new patch "hw/arm/virt: Rename highmem IO regions" that eases the review
>   of "hw/arm/virt: Split the memory map description"
> - "hw/arm/virt: Move memory map initialization into machvirt_init"
>   squashed into the previous patch
> - change alignment of IO regions beyond the RAM so that it matches their
>   size
> 
> v4 -> v5:
> - change in the memory map
> - see individual logs
> 
> v3 -> v4:
> - rebase on David's "pc-dimm: next bunch of cleanups" and
>   "pc-dimm: pre_plug "slot" and "addr" assignment"
> - kvm-type option not used anymore. We directly use
>   maxram_size and ram_size machine fields to compute the
>   MAX IPA range. Migration is naturally handled as CLI
>   option are kept between source and destination. This was
>   suggested by David.
> - device_memory_start and device_memory_size not stored
>   anymore in vms->bootinfo
> - I did not take into account 2 Igor's comments: the one
>   related to the refactoring of arm_load_dtb and the one
>   related to the generation of the dtb after system_reset
>   which would contain nodes of hotplugged devices (we do
>   not support hotplug at this stage)
> - check the end-user does not attempt to hotplug a device
> - addition of "vl: Set machine ram_size, maxram_size and
>   ram_slots earlier"
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
> Eric Auger (9):
>   hw/arm/virt: Rename highmem IO regions
>   hw/arm/virt: Split the memory map description
>   hw/boards: Add a MachineState parameter to kvm_type callback
>   kvm: add kvm_arm_get_max_vm_ipa_size
>   vl: Set machine ram_size, maxram_size and ram_slots earlier
>   hw/arm/virt: Dynamic memory map depending on RAM requirements
>   hw/arm/virt: Implement kvm_type function for 4.0 machine
>   hw/arm/virt: Check the VCPU PA range in TCG mode
>   hw/arm/virt: Bump the 255GB initial RAM limit
> 
> Shameer Kolothum (1):
>   hw/arm/boot: introduce fdt_add_memory_node helper
> 
>  accel/kvm/kvm-all.c      |   2 +-
>  hw/arm/boot.c            |  54 +++++++----
>  hw/arm/virt-acpi-build.c |  10 +-
>  hw/arm/virt.c            | 196 +++++++++++++++++++++++++++++++--------
>  hw/ppc/mac_newworld.c    |   3 +-
>  hw/ppc/mac_oldworld.c    |   2 +-
>  hw/ppc/spapr.c           |   2 +-
>  include/hw/arm/virt.h    |  16 +++-
>  include/hw/boards.h      |   5 +-
>  target/arm/kvm.c         |  10 ++
>  target/arm/kvm_arm.h     |  13 +++
>  vl.c                     |   6 +-
>  12 files changed, 241 insertions(+), 78 deletions(-)
> 
