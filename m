Received: by 10.37.35.205 with SMTP id j196csp3096104ybj;
        Thu, 22 Sep 2016 07:47:49 -0700 (PDT)
X-Received: by 10.200.56.55 with SMTP id q52mr2457298qtb.23.1474555668763;
        Thu, 22 Sep 2016 07:47:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n142si1361077qkn.24.2016.09.22.07.47.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Sep 2016 07:47:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bn5Hb-0003IF-81
	for alex.bennee@linaro.org; Thu, 22 Sep 2016 10:47:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn56Q-0007EO-LF
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 10:35:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn56O-0000GH-Er
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 10:35:53 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:35759)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn56O-0000Ft-5Y
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 10:35:52 -0400
Received: by mail-vk0-x234.google.com with SMTP id o139so27954791vka.2
	for <qemu-arm@nongnu.org>; Thu, 22 Sep 2016 07:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/ECYEAXrz4WIWQNNTTxg7/uAnFYRQviBwbJY07PmZ2o=;
	b=PKie58OkqTPRvRvt5AlWhYTfkDk7IInDN7n76rDTp9uTFt1cJ4vTIham/I3kdHh1r7
	xx73Ruh02fYKpT9t5muiUyfC1tE+wbKruBm5DjIRcoj3XZOym22fO9Em9FtOUVgPRFp6
	wCUduw+YI6ceNxdEzctZDG78SfGZrjW+q2GC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/ECYEAXrz4WIWQNNTTxg7/uAnFYRQviBwbJY07PmZ2o=;
	b=gTgsPW3Xyc2qekOmB53eYYutspUeAJK43Mqt1iA2LUtl1imAl060XfvKJd8H2Bfkrq
	ozJ+vUCEg7iwYDQ1hO7hq/moiDLBX3mbPD7yyo+r6o46VtHOFHYsCRTES6a/+f3C1s8i
	A3Lz+lUgJ5kKa3MOB8iOOfjOEMpQqkXzoHFMf5UOqbyXvpzCbJRvY76eKD8Pza/CabqG
	DZfdVNZuaZ5afcFo4jfRc/gczeEMQQ24XE7GW4FPCGLBYMAraE/8weyhRHCN+SGJxtf+
	AhS/Q98jnHsvoTFem1aoa4CwUAJjok24CKQr3L2OUsnCpvLREc3VZX76uPlV1ep00RO3
	ueFQ==
X-Gm-Message-State: AE9vXwNqtva0Euvy96BEdBpY2GSkZG9WSMqw5nrcXblnFfNP5bUcM9pienVj1D1a/Eae9FnHXzRy2oCMWZ/MMlY4
X-Received: by 10.31.75.71 with SMTP id y68mr1612597vka.51.1474554951529; Thu,
	22 Sep 2016 07:35:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 22 Sep 2016 07:35:30 -0700 (PDT)
In-Reply-To: <1473442237-3746-5-git-send-email-eric.auger@redhat.com>
References: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
	<1473442237-3746-5-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2016 15:35:30 +0100
Message-ID: <CAFEAcA-wOY_cA=znsds3Ei3CPofQMQwH-a0wfyHSZLRKXZXs=Q@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-arm] [PATCH v6 4/8] kvm-all: Pass requester ID to MSI
 routing functions
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
X-TUID: 1SMOkJoaS+gE

On 9 September 2016 at 18:30, Eric Auger <eric.auger@redhat.com> wrote:
> From: Pavel Fedin <p.fedin@samsung.com>
>
> Introduce global kvm_msi_use_devid flag and pass the device ID,
> if needed, while building the MSI route entry. Device IDs are
> required by the ARM GICv3 ITS (IRQ remapping function is based on
> this information).
>
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> v5 -> v6:
> - move the flag in include/sysemu/kvm.h and populate the devid
>   information in kvm-all.c
>
> v3 -> v4:
> - OR route->flags with KVM_MSI_VALID_DEVID
> ---
>  include/sysemu/kvm.h | 1 +
>  kvm-all.c            | 9 +++++++++
>  kvm-stub.c           | 1 +
>  3 files changed, 11 insertions(+)
>
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index c9c2436..c31c810 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -53,6 +53,7 @@ extern bool kvm_gsi_direct_mapping;
>  extern bool kvm_readonly_mem_allowed;
>  extern bool kvm_direct_msi_allowed;
>  extern bool kvm_ioeventfd_any_length_allowed;
> +extern bool kvm_msi_use_devid;
>
>  #if defined CONFIG_KVM || !defined NEED_CPU_H
>  #define kvm_enabled()           (kvm_allowed)

You also need the appropriate #define, like all the other flags
here (with a doc comment, and with the version that's just defined
as '(false)').

The idea is that tests of the condition then don't need to
be guarded by ifdef CONFIG_KVM.

> diff --git a/kvm-all.c b/kvm-all.c
> index ebf35b0..df3bcde 100644
> --- a/kvm-all.c
> +++ b/kvm-all.c
> @@ -119,6 +119,7 @@ bool kvm_readonly_mem_allowed;
>  bool kvm_vm_attributes_allowed;
>  bool kvm_direct_msi_allowed;
>  bool kvm_ioeventfd_any_length_allowed;
> +bool kvm_msi_use_devid;
>
>  static const KVMCapabilityInfo kvm_required_capabilites[] = {
>      KVM_CAP_INFO(USER_MEMORY),
> @@ -1275,6 +1276,10 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
>      kroute.u.msi.address_lo = (uint32_t)msg.address;
>      kroute.u.msi.address_hi = msg.address >> 32;
>      kroute.u.msi.data = le32_to_cpu(msg.data);
> +    if (kvm_msi_use_devid) {

these should use the macro, not direct access to the flag variable.

> +        kroute.flags = KVM_MSI_VALID_DEVID;
> +        kroute.u.msi.devid = pci_requester_id(dev);
> +    }
>      if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev)) {
>          kvm_irqchip_release_virq(s, virq);
>          return -EINVAL;
> @@ -1308,6 +1313,10 @@ int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
>      kroute.u.msi.address_lo = (uint32_t)msg.address;
>      kroute.u.msi.address_hi = msg.address >> 32;
>      kroute.u.msi.data = le32_to_cpu(msg.data);
> +    if (kvm_msi_use_devid) {
> +        kroute.flags = KVM_MSI_VALID_DEVID;
> +        kroute.u.msi.devid = pci_requester_id(dev);
> +    }
>      if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev)) {
>          return -EINVAL;
>      }
> diff --git a/kvm-stub.c b/kvm-stub.c
> index 64e23f6..6f896e9 100644
> --- a/kvm-stub.c
> +++ b/kvm-stub.c
> @@ -31,6 +31,7 @@ bool kvm_gsi_direct_mapping;
>  bool kvm_allowed;
>  bool kvm_readonly_mem_allowed;
>  bool kvm_ioeventfd_any_length_allowed;
> +bool kvm_msi_use_devid;
>
>  int kvm_destroy_vcpu(CPUState *cpu)
>  {

thanks
-- PMM
