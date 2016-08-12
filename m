Received: by 10.25.21.156 with SMTP id 28csp185093lfv;
        Fri, 12 Aug 2016 07:23:44 -0700 (PDT)
X-Received: by 10.55.134.3 with SMTP id i3mr18335745qkd.50.1471011824775;
        Fri, 12 Aug 2016 07:23:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s37si4753345qta.36.2016.08.12.07.23.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Aug 2016 07:23:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52377 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bYDNA-0006px-52
	for alex.bennee@linaro.org; Fri, 12 Aug 2016 10:23:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYDJx-0003zQ-3s
	for qemu-arm@nongnu.org; Fri, 12 Aug 2016 10:20:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYDJX-0000uC-Rl
	for qemu-arm@nongnu.org; Fri, 12 Aug 2016 10:20:23 -0400
Received: from mail-ua0-x22b.google.com ([2607:f8b0:400c:c08::22b]:32970)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYDJW-0000sX-J7
	for qemu-arm@nongnu.org; Fri, 12 Aug 2016 10:19:59 -0400
Received: by mail-ua0-x22b.google.com with SMTP id 74so44105193uau.0
	for <qemu-arm@nongnu.org>; Fri, 12 Aug 2016 07:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AgkDUkAHkQ1WaFO8kcimkXqtMiTdEHD57Bron8RMssQ=;
	b=jww7WcJgaUi60eGHe6chVKC75fnnO3HiRmd85U257dWVMiXtxMfUYsp8Qg/WjgzIvN
	bsNVbtJR+L2VIbvCVKdLQI4g2Km17Qqu+J3SQaeskgLh6q/lMWWNAs0KF/VOCZi/v8qz
	DQ0EAfa+HI0kAHqdNEww46EizYz7Vi+u/UDPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AgkDUkAHkQ1WaFO8kcimkXqtMiTdEHD57Bron8RMssQ=;
	b=Pxv0d18+RV7hHKOPTe5qkvJTk0PntSk3bGXoFnvmHf5QluyHDw6lkrNniujIPnvrnH
	HnE8HVhzacWmBM9FJN8CV/CvicfiMOCDvVHeigIK7Lbhb50TKNOQ6X0cukcHU/MkDkE/
	dgFUHaDCbfbkglsjtlB1OKEo6JGLeClVA/jH2zZ6GpWaIxCmLvkdwQhinENuFFyXbIYl
	KJxxDNTgyWNwsFaVKkbtBLUIU8/AxBpGObl4wARrBUuxmPYZEQWzBkFvCeO2Rp8DJyfx
	EACLyDeB11tId3yxk/u9VTndU3qIUNqan/nCle6fM0CanJIpMi2QzXqHj3QQVq4Rgi4a
	g2og==
X-Gm-Message-State: AEkoous6gFamIh04y32wXIFhRQCGApxGUF5unzswtNqm5lTjibH80T+F02d6zE9ZEJ11OILWoMwFYtzrva3GyM74
X-Received: by 10.176.4.129 with SMTP id 1mr3183877uaw.26.1471011597939; Fri,
	12 Aug 2016 07:19:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Fri, 12 Aug 2016 07:19:37 -0700 (PDT)
In-Reply-To: <1470161247-10251-5-git-send-email-eric.auger@redhat.com>
References: <1470161247-10251-1-git-send-email-eric.auger@redhat.com>
	<1470161247-10251-5-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2016 15:19:37 +0100
Message-ID: <CAFEAcA8OFkdVF55KL1U0OO=GDgLumRuVy4N1HD=fHicKkrmiyA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22b
Subject: Re: [Qemu-arm] [RFC v5 4/7] target-arm/kvm: Pass requester ID to
 MSI routing functions
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
Cc: Andrew Jones <drjones@redhat.com>, Tomasz Nowicki <tn@semihalf.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Diana Craciun <diana.craciun@freescale.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tVPs9vqpK+m3

On 2 August 2016 at 19:07, Eric Auger <eric.auger@redhat.com> wrote:
> From: Pavel Fedin <p.fedin@samsung.com>
>
> Introduce global kvm_arm_msi_use_devid flag and pass device IDs in
> kvm_arch_fixup_msi_route(). Device IDs are required by the ITS.
>
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v3 -> v4:
> - OR route->flags with KVM_MSI_VALID_DEVID
> ---
>  target-arm/kvm.c     | 6 ++++++
>  target-arm/kvm_arm.h | 3 +++
>  2 files changed, 9 insertions(+)
>
> diff --git a/target-arm/kvm.c b/target-arm/kvm.c
> index dbe393c..4675aa3 100644
> --- a/target-arm/kvm.c
> +++ b/target-arm/kvm.c
> @@ -22,6 +22,7 @@
>  #include "cpu.h"
>  #include "internals.h"
>  #include "hw/arm/arm.h"
> +#include "hw/pci/pci.h"
>  #include "exec/memattrs.h"
>  #include "hw/boards.h"
>  #include "qemu/log.h"
> @@ -31,6 +32,7 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>  };
>
>  static bool cap_has_mp_state;
> +bool kvm_arm_msi_use_devid;
>
>  int kvm_arm_vcpu_init(CPUState *cs)
>  {
> @@ -619,6 +621,10 @@ int kvm_arm_vgic_probe(void)
>  int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>                               uint64_t address, uint32_t data, PCIDevice *dev)
>  {
> +    if (kvm_arm_msi_use_devid) {
> +        route->flags |= KVM_MSI_VALID_DEVID;
> +        route->u.msi.devid = pci_requester_id(dev);
> +    }
>      return 0;
>  }
>
> diff --git a/target-arm/kvm_arm.h b/target-arm/kvm_arm.h
> index 633d088..befcfd1 100644
> --- a/target-arm/kvm_arm.h
> +++ b/target-arm/kvm_arm.h
> @@ -121,6 +121,9 @@ bool write_kvmstate_to_list(ARMCPU *cpu);
>  void kvm_arm_reset_vcpu(ARMCPU *cpu);
>
>  #ifdef CONFIG_KVM
> +
> +extern bool kvm_arm_msi_use_devid;
> +

The kernel documentation and most of the code for this flag
isn't ARM specific, which suggests to me that we should put
the QEMU support into the non-architecture-specific files too.
That is, a flag and wrapper function like all the existing
ones in include/sysemu/kvm.h, and then put the
    if (kvm_msi_use_devid()) {
        ...
    }
in the functions in kvm-all.c that need it.

thanks
-- PMM
