Received: by 10.25.150.194 with SMTP id y185csp243504lfd;
        Fri, 25 Nov 2016 01:56:28 -0800 (PST)
X-Received: by 10.237.59.119 with SMTP id q52mr5741508qte.225.1480067788271;
        Fri, 25 Nov 2016 01:56:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n54si17519350qta.44.2016.11.25.01.56.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Nov 2016 01:56:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cADF5-0002AC-Om
	for alex.bennee@linaro.org; Fri, 25 Nov 2016 04:56:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cADEz-0002A4-Hz
	for qemu-arm@nongnu.org; Fri, 25 Nov 2016 04:56:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cADEv-0001Fg-0n
	for qemu-arm@nongnu.org; Fri, 25 Nov 2016 04:56:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47978)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cADEu-0001F0-Qd; Fri, 25 Nov 2016 04:56:16 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27D5781235;
	Fri, 25 Nov 2016 09:56:15 +0000 (UTC)
Received: from localhost.localdomain (vpn1-6-45.ams2.redhat.com [10.36.6.45])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uAP9uBVW031284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 25 Nov 2016 04:56:12 -0500
To: vijay.kilari@gmail.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	pbonzini@redhat.com, rth@twiddle.net
References: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <de044188-7120-9b8b-0df4-7c3631b1dc4f@redhat.com>
Date: Fri, 25 Nov 2016 10:56:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 25 Nov 2016 09:56:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v6 0/2] GICv3 live migration support
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
Cc: marc.zyngier@arm.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	christoffer.dall@linaro.org, Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ybo2lSqrYmJ

Hi Vijay, Christoffer,

On 23/11/2016 13:39, vijay.kilari@gmail.com wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> 
> This series introduces support for GICv3 live migration with
> new VGIC implementation in 4.7-rc3 kernel.
> In this series, patch 1 of the previous implementation
> are ported.
> https://lists.nongnu.org/archive/html/qemu-devel/2015-10/msg05284.html

thanks for for your replies and bouncing/forwarding the series again. I
now have all the pieces (??)

Thanks

Eric
> 
> Patch 2, is based on below implementation.
> http://patchwork.ozlabs.org/patch/626746/
> 
> Kernel patches version 6 implement this functionality.
> 
> This API definition is as per version of VGICv3 specification
> in linux kernel Documentation/virtual/kvm/devices/arm-vgic-v3.txt
> 
> Tested Live migration of Idle VM running with 4 VCPUs and 8GB RAM.
> 
> v5 => v6:
>  - Added separate patch for Reseting ICC* register
>  - Added seperate patch for save and restore of ICC_CTLR_EL1
>  - Dropped translate_fn mechanism and coded open functions
>    for edge_trigger and priority save and restore.
>  - Save and Restore APnR registers based on ICC_CTLR_EL1.PRIBITS
> 
> v4 => v5:
>  - Initialized ICC registers before reset.
> 
> v3 => v4:
>  - Reintroduced offset GICR_SGI_OFFSET
>  - Implement save and restore of ICC_SRE_EL1
>  - Updated kvm.h header file in sync with KVM v4 patches
> 
> v2 => v3:
>  - Dropped offset GICR_SGI_OFFSET
>  - Implement save/restore of irq line level using
>    KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO
>  - Fixed bug with save/restore of edge_trigger
> Vijaya Kumar K (4):
>   kernel: Add definitions for GICv3 attributes
>   hw/intc/arm_gicv3_kvm: Implement get/put functions
>   hw/intc/arm_gicv3_kvm: Save and Restore ICC_SRE_EL1 register
>   hw/intc/arm_gicv3_kvm: Reset GICv3 cpu interface registers
> 
>  hw/intc/arm_gicv3_kvm.c            | 600 ++++++++++++++++++++++++++++++++++++-
>  hw/intc/gicv3_internal.h           |   1 +
>  include/hw/arm/linux-boot-if.h     |  28 ++
>  include/hw/intc/arm_gicv3_common.h |   1 +
>  linux-headers/asm-arm/kvm.h        |  13 +
>  linux-headers/asm-arm64/kvm.h      |  13 +
>  target-arm/cpu.c                   |  31 ++
>  7 files changed, 676 insertions(+), 11 deletions(-)
> 
