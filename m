Received: by 10.25.77.65 with SMTP id a62csp34574lfb;
        Tue, 31 Jan 2017 08:46:42 -0800 (PST)
X-Received: by 10.55.64.139 with SMTP id n133mr27633044qka.38.1485881202511;
        Tue, 31 Jan 2017 08:46:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s12si12339295qtb.66.2017.01.31.08.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jan 2017 08:46:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYbZp-00079g-Qi
	for alex.bennee@linaro.org; Tue, 31 Jan 2017 11:46:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYb5u-000315-PU
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 11:15:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYb5t-0007sR-Rv
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 11:15:46 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:33876)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cYb5t-0007s5-NW; Tue, 31 Jan 2017 11:15:45 -0500
Received: by mail-ot0-x241.google.com with SMTP id 73so42295555otj.1;
	Tue, 31 Jan 2017 08:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PLnw5RJoJBG9a+ME3Z/Gmz2d05c3UzAlcT2kFPKiAoY=;
	b=dnp58KaJWNPGzvGMezZer555Man57UD6WQ6S2iiAMc5BjzqouD3S5OvDbbXzBDCSRs
	O1ZL7FvAcPr6RuE3Hhb2NnbDzP9Gw8SiTB8PJMxktNa9jbXuFxOrkrNgycFij0FqDNj1
	bzRKyXz4bruIydT77PDk30m8gI9KMisv8dcvWyuSDYVXpvrferJNZA6tKUi7Q3O6h3IP
	Ov7cagganiZA8gkxvNeEg+le1T7l1Zn3TJRamR8m/dFVYYRyHHLjriZCxmo/K0+9RA8u
	gEyA8SDnTlEpYbL6GOWfbQEc6rrhaGtsgVlfv2Kd1ul9jnmW0N/DQyS1pYQKj2ZQFmhv
	T8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PLnw5RJoJBG9a+ME3Z/Gmz2d05c3UzAlcT2kFPKiAoY=;
	b=EWr1oP0KwwADCnvUvtJCLLyGnIn3/DxkcHpuQHuFpr+BTD3Ae9SyMGh7CNi5fEMqDQ
	k45mguwVZCRpUxbKBHlpEzbam41APFFtDNiQo5ITWSI/ZEERjyq5gyuyEHKsIHsNK36R
	r+eSEfawB4e8HUAI41gAn1TmxJS4Iry47ojJd2aRneoVG5aX+yVJXU7KdP+cO/omVtaT
	XOi/AciG90WrvRTLj9RbowYU2QDzO6dDWIU4eiIud12DOl4gpRafqX8lITUAhPX6ZiRr
	9IxqZtAtp2HoJHbcrDOUErgt8xrYtr8d0kj8UeqRqZUhUPgZ9/8CoZ9beGpQJETAigXs
	Domg==
X-Gm-Message-State: AIkVDXLSh82jpFjmaDdARYB6jIiSDKOxYwxuWoF5e+p+L8T18IjV/yTzkLS11if7JveM/FgQY6TAulmw86ulpw==
X-Received: by 10.157.8.120 with SMTP id 111mr12432767oty.197.1485879344966;
	Tue, 31 Jan 2017 08:15:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.37.84 with HTTP; Tue, 31 Jan 2017 08:15:44 -0800 (PST)
In-Reply-To: <1485878749-5641-1-git-send-email-vijay.kilari@gmail.com>
References: <1485878749-5641-1-git-send-email-vijay.kilari@gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Tue, 31 Jan 2017 21:45:44 +0530
Message-ID: <CALicx6uhAKV-3K=3vHb_GgySJ_bZOAPp315DTmbQGHWo+ndbxg@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Christoffer Dall <christoffer.dall@linaro.org>,
	Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH v7 0/4] GICv3 live migration support
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RLIdXvm1nG4/

Please ignore this patch series. Missed out one patch of this series.
Will resend the full patch series


On Tue, Jan 31, 2017 at 9:35 PM,  <vijay.kilari@gmail.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> This series introduces support for GICv3 live migration with
> new VGIC implementation in 4.7-rc3 kernel.
> In this series, patch 1 of the previous implementation
> are ported.
> https://lists.nongnu.org/archive/html/qemu-devel/2015-10/msg05284.html
>
> Patch 2, is based on below implementation.
> http://patchwork.ozlabs.org/patch/626746/
>
> Latest kernel patches
> https://www.spinics.net/lists/arm-kernel/msg558046.html
>
> This API definition is as per version of VGICv3 specification
> in linux kernel Documentation/virtual/kvm/devices/arm-vgic-v3.txt
>
> Tested Live migration of Idle VM running with 4 VCPUs and 8GB RAM.
>
> v6 => v7:
>  - Added patch to add icc_ctrl_el1 to vmstruct before live migration
>    patch
>  - Added patch to add gicv3state variable to CPUARMState struct to
>    store GICv3CPUState pointer.
>  - Added patch to register ARMCPRegInfo[] struct and reset on CPU reset.
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
>
> Vijaya Kumar K (4):
>   hw/intc/arm_gicv3_kvm: Add ICC_SRE_EL1 register to vmstate
>   hw/intc/arm_gicv3_kvm: Implement get/put functions
>   target-arm: Add GICv3CPUState in CPUARMState struct
>   hw/intc/arm_gicv3_kvm: Reset GICv3 cpu interface registers
>
>  hw/intc/arm_gicv3_common.c         |   1 +
>  hw/intc/arm_gicv3_kvm.c            | 640 ++++++++++++++++++++++++++++++++++++-
>  hw/intc/gicv3_internal.h           |   1 +
>  include/hw/intc/arm_gicv3_common.h |   1 +
>  target-arm/cpu.h                   |   2 +
>  5 files changed, 634 insertions(+), 11 deletions(-)
>
> --
> 1.9.1
>
