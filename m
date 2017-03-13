Received: by 10.25.77.4 with SMTP id a4csp1272274lfb;
        Mon, 13 Mar 2017 10:59:33 -0700 (PDT)
X-Received: by 10.55.65.70 with SMTP id o67mr31905853qka.254.1489427973141;
        Mon, 13 Mar 2017 10:59:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q8si979140qkh.199.2017.03.13.10.59.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Mar 2017 10:59:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cnUFm-0001Xk-MT
	for alex.bennee@linaro.org; Mon, 13 Mar 2017 13:59:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cnUFe-0001Vc-IZ
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 13:59:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cnUFd-0006qE-AW
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 13:59:22 -0400
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:32860)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cnUFd-0006pu-1I
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 13:59:21 -0400
Received: by mail-wr0-x229.google.com with SMTP id u48so109045705wrc.0
	for <qemu-arm@nongnu.org>; Mon, 13 Mar 2017 10:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PjqWTDvm/SDwC1L7Ijuq1gTcTDY/j5VQHIU32Uk+pr8=;
	b=jpgY3OqXwqUmQFdtVFkSNTQqYR36jhLYVh5Qn8qbTcg3d1jnCv4wJ5FiJI/kdwh5Db
	OSa4MuIEVc01kOAz6l0/YZQSKj01ByZ2xgwH0fovIzfGuQjpl5bOHmnsQrRZ2E7E2Cn3
	HoNHoWBYRcjxXIaGX+h3B7AGnVqpR8zE4JvXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PjqWTDvm/SDwC1L7Ijuq1gTcTDY/j5VQHIU32Uk+pr8=;
	b=HRuxNvDM8eamUznOlzp1b4YqLN8T3B+lAlgRMibYfCkeiyXu7ClcKoAaBIriYFpGC5
	s/8mMt/4btVfGb6oSWJQVb1a6K+HYzqbUMl36LdDCCbWvkZ0PG8rsjQCBI8CUIsFEBQL
	jVnCaDSdh3ZlGctw3qX1Sb3JC3AtRBNF6sGigG0Q2AFURlBVep7vq0G3VXhagrp1Cg9g
	7Kg/SlkELBFvM67T/TPzPiRSu6xz5IIziufgJ3UsuaXVnh+cVOwamhLmgtZgjbcYfKqZ
	PiyPWZHkLZ7idnRruyRFiV3WVCGWuqcP/fYLxlJc0v1C6BnMDNQ5XUcupLRdEenPM6LO
	kWoQ==
X-Gm-Message-State: AMke39nAAjXiqicYZ9aqMIv3eSoLWeEkZwzXbknmnp+FKF/fsS0aJ6gg+Xwsa3z0/f3QDXRXFG1p/AsH1t8DtY7Q
X-Received: by 10.223.152.215 with SMTP id w81mr32516765wrb.151.1489427959529; 
	Mon, 13 Mar 2017 10:59:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Mon, 13 Mar 2017 10:58:58 -0700 (PDT)
In-Reply-To: <1488800894-22421-3-git-send-email-eric.auger@redhat.com>
References: <1488800894-22421-1-git-send-email-eric.auger@redhat.com>
	<1488800894-22421-3-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2017 18:58:58 +0100
Message-ID: <CAFEAcA-wjjQgqx=Ojkq8TFhF_YLrOY1UtsC=5cHh++idrcefKg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-arm] [RFC v2 2/3] hw/intc/arm_gicv3_its: Implement state
 save/restore
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, "Kumar, Vijaya" <Vijaya.Kumar@cavium.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jp1b5zLj6/sp

On 6 March 2017 at 12:48, Eric Auger <eric.auger@redhat.com> wrote:
> We need to handle both registers and ITS tables. While
> register handling is standard, ITS table handling is more
> challenging since the kernel API is devised so that the
> tables are flushed into guest RAM and not in vmstate buffers.
>
> Flushing the ITS tables on device pre_save() is too late
> since the guest RAM had already been saved at this point.
>
> Table flushing needs to happen when we are sure the vcpus
> are stopped and before the last dirty page saving. The
> right point is RUN_STATE_FINISH_MIGRATE but sometimes the
> VM gets stopped before migration launch so let's simply
> flush the tables each time the VM gets stopped.
>
> For regular ITS registers we just can use vmstate pre_save
> and post_load callbacks.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> ---
>  hw/intc/arm_gicv3_its_common.c         |  8 ++++
>  hw/intc/arm_gicv3_its_kvm.c            | 86 ++++++++++++++++++++++++++++++++++
>  include/hw/intc/arm_gicv3_its_common.h |  6 +++
>  3 files changed, 100 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
> index 9d67c5c..75b9f04 100644
> --- a/hw/intc/arm_gicv3_its_common.c
> +++ b/hw/intc/arm_gicv3_its_common.c
> @@ -49,6 +49,14 @@ static const VMStateDescription vmstate_its = {
>      .pre_save = gicv3_its_pre_save,
>      .post_load = gicv3_its_post_load,
>      .unmigratable = true,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(ctlr, GICv3ITSState),
> +        VMSTATE_UINT64(cbaser, GICv3ITSState),
> +        VMSTATE_UINT64(cwriter, GICv3ITSState),
> +        VMSTATE_UINT64(creadr, GICv3ITSState),
> +        VMSTATE_UINT64_ARRAY(baser, GICv3ITSState, 8),

Should we also migrate GITS_IIDR and GITS_TYPER ?

(For instance the ITT_entry_size field in GITS_IIDR will
be needed if we want to distinguish "8 bytes per entry" from
a future "16 bytes per entry" new format.)

> +        VMSTATE_END_OF_LIST()
> +    },
>  };
>
>  static MemTxResult gicv3_its_trans_read(void *opaque, hwaddr offset,
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index bd4f3aa..45e57d6 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -53,6 +53,24 @@ static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
>      return kvm_vm_ioctl(kvm_state, KVM_SIGNAL_MSI, &msi);
>  }
>
> +/**
> + * vm_change_state_handler - VM change state callback aiming at flushing
> + * ITS tables into guest RAM
> + *
> + * The tables get flushed to guest RAM whenever the VM gets stopped.
> + */
> +static void vm_change_state_handler(void *opaque, int running,
> +                                    RunState state)
> +{
> +    GICv3ITSState *s = (GICv3ITSState *)opaque;
> +
> +    if (running) {
> +        return;
> +    }
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_TABLES,
> +                      0, NULL, false);
> +}
> +
>  static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
>  {
>      GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> @@ -89,6 +107,8 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
>      kvm_msi_use_devid = true;
>      kvm_gsi_direct_mapping = false;
>      kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
> +
> +    qemu_add_vm_change_state_handler(vm_change_state_handler, s);
>  }
>
>  static void kvm_arm_its_init(Object *obj)
> @@ -102,6 +122,70 @@ static void kvm_arm_its_init(Object *obj)
>                               &error_abort);
>  }
>
> +/**
> + * kvm_arm_its_get - handles the saving of ITS registers.
> + * ITS tables, being flushed into guest RAM needs to be saved before
> + * the pre_save() callback, hence the migration state change notifiers
> + */

I find this comment a little cryptic -- can you rephrase/expand
it a bit, please?

> +static void kvm_arm_its_get(GICv3ITSState *s)
> +{
> +    uint64_t reg;
> +    int i;
> +
> +    for (i = 0; i < 8; i++) {
> +        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> +                          GITS_BASER + i * 8, &s->baser[i], false);
> +    }
> +
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> +                      GITS_CTLR, &reg, false);
> +    s->ctlr = extract64(reg, 0, 32);

The kernel will write 0s to the top 32 bits of 'reg', right?
So you can just say "s->ctlr = reg;"

(I wondered about suggesting making s->ctlr 64 bits, but that's
harder to justify than for a system register, because it really
is only 4 bytes in the ITS register map. So it being 64 bits in
the KVM ABI is not an architectural thing, and we should thus
leave it as uint32_t in QEMU.)

> +
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> +                      GITS_CBASER, &s->cbaser, false);
> +
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> +                      GITS_CREADR, &s->creadr, false);
> +
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> +                      GITS_CWRITER, &s->cwriter, false);
> +}
> +
> +/**
> + * kvm_arm_its_put - Restore both the ITS registers and guest RAM tables
> + * ITS tables, being flushed into guest RAM needs to be saved before
> + * the pre_save() callback.

Cut and paste error? This is about restore, not save.

> The restoration order matters since there
> + * are dependencies between register settings, as specified by the
> + * architecture specification
> + */
> +static void kvm_arm_its_put(GICv3ITSState *s)
> +{
> +    uint64_t reg;
> +    int i;
> +
> +    /* must be written before GITS_CREADR since it resets this latter*/

"later", or do you mean something I don't understand ?

> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> +                      GITS_CBASER, &s->cbaser, true);
> +
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> +                      GITS_CREADR, &s->creadr, true);
> +
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> +                      GITS_CWRITER, &s->cwriter, true);
> +
> +    for (i = 0; i < 8; i++) {
> +        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> +                          GITS_BASER + i * 8, &s->baser[i], true);
> +    }
> +
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_TABLES,
> +                      0, NULL, true);
> +
> +    reg = s->ctlr;
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> +                      GITS_CTLR, &reg, true);
> +}
> +
>  static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -109,6 +193,8 @@ static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
>
>      dc->realize = kvm_arm_its_realize;
>      icc->send_msi = kvm_its_send_msi;
> +    icc->pre_save = kvm_arm_its_get;
> +    icc->post_load = kvm_arm_its_put;

Oh, those were pre_save and post_load functions? Can
you name them kvm_arm_its_pre_save and kvm_arm_its_post_load,
please, so that it's clearer what they are?

>  }
>
>  static const TypeInfo kvm_arm_its_info = {
> diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
> index 1ba1894..ed5d6df 100644
> --- a/include/hw/intc/arm_gicv3_its_common.h
> +++ b/include/hw/intc/arm_gicv3_its_common.h
> @@ -28,6 +28,12 @@
>  #define ITS_TRANS_SIZE   0x10000
>  #define ITS_SIZE         (ITS_CONTROL_SIZE + ITS_TRANS_SIZE)
>
> +#define GITS_CTLR        0x0
> +#define GITS_CBASER      0x80
> +#define GITS_CWRITER     0x88
> +#define GITS_CREADR      0x90
> +#define GITS_BASER       0x100
> +
>  struct GICv3ITSState {
>      SysBusDevice parent_obj;
>
> --
> 2.5.5

thanks
-- PMM
