Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1848411wre;
        Thu, 24 May 2018 06:12:35 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLPBSYKSrAqpx+e9PWF6MwqzpW45Z9Jv+yKVeFiejePUExeA6mj2YrT5AxUrxZy7AA7PkRp
X-Received: by 2002:a37:cfcd:: with SMTP id v74-v6mr6520613qkl.240.1527167555041;
        Thu, 24 May 2018 06:12:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527167555; cv=none;
        d=google.com; s=arc-20160816;
        b=rT6lGtzTHBxRIY6m9RCmo2/Ufg09HPtzDgrXKCuf8bOe0mLIM2X5kdzkSpezliZuu6
         cdwOueyruIvBvbmSf8aYW2pFN4H3+75tMwLqXcZl+S4rONXYMUk9PnoQ2bFppCmE3k+R
         vnn/2Yta1av3G4H6TGplId5ArDOo689W6efq3UdR2ZVTu4zEhHjNjvqdHIaulest3i2+
         nxP7iUatE4DL9eOVl0pGIKjSajvRc3fbTaGhYOxyG9zkpswt4OOe5IMPRXxZK2AoUdO8
         rtlBECjH3cf/YSRppdqhw0IomSENhYRUrOMr7PrgfOp7RkfOntWDuv1HehkWcC58dfH8
         F84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=mSbK1K5BlQaN+one+VPDyb0hQQxCVG0X9q7Kz99MKfY=;
        b=TFKUXdW9xdFrbq3jHuN/nyVmJ65H6r4B3MakZ38sFT/qxp3OULy2Cx12AW24gokwuY
         phrPlDhQmi65BI1+9t1Y8X6QxCyv3+k7c1qwiyZC2KHrwTtZu4lK9rK5WDJ1QlVHfl0s
         vgah1vLbxvvIQaVkXk2sdcjvvJFn7XlqCrqoiK7WCLKc9jPQl0Yuqs23joF3ivu+lnfz
         Yc3HiPSf+bGPmx8o5w8c64s86dn1LhfVj/uyVmSy1IPw8Ksm6HWDROgNj1gmgXqAer5f
         FIJfDd4cty+exIWXRpyWkSvVVW8upb3hC7tBj07tCe+4Md5x/NINaEhvJzcSk6q0C7xh
         ECKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AiwyJ7eX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c8-v6si242799qvk.33.2018.05.24.06.12.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 06:12:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AiwyJ7eX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38640 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLq2k-0005wg-Fj
	for alex.bennee@linaro.org; Thu, 24 May 2018 09:12:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLq2I-0005iE-Eq
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:12:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLq2G-0005QA-Vj
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:12:06 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:39062)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fLq2G-0005Pt-Q6
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:12:04 -0400
Received: by mail-ot0-x241.google.com with SMTP id l12-v6so1843612oth.6
	for <qemu-arm@nongnu.org>; Thu, 24 May 2018 06:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mSbK1K5BlQaN+one+VPDyb0hQQxCVG0X9q7Kz99MKfY=;
	b=AiwyJ7eXftpcfVolhc5jloKO4ijVPIvwlCSESZbt+phZ7sNgBq/WcV7D7PWdCNvtPE
	uTFhVNEfLYgWihmOHVp1q3KQAQCmi4v2TVrDKI9cWQpJ/LRL6GDRdghzZVtG9b97V6L3
	XizF3lPuGJqtg3Nb7AD/e3pODAr/IMFpDLeH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mSbK1K5BlQaN+one+VPDyb0hQQxCVG0X9q7Kz99MKfY=;
	b=l4iVXQjNoNgpsXzHpfYWcH0Rrwold+/ocXtGMC/qC/BBkHBKLBwHnub8JVkTx6tnfT
	gSTVAOAW2xMI9FYpyyhP82PYyL8IYNeaSlSZcQRV6Q9efQj+JyK4hm2GV38zaQpCsQNT
	wWeodsbf/kNiQk6IKHA0avhs1IWgyBxWGFNcDprvoZeTkqb2YrF5VIeuYiaUB6Yf+RJL
	yQC6+154qK66VK0e47RIP+JLNueYZr8IuYw4VmoLg5lRunEq+rSIEYloq0lNBZ0dTirY
	pE4gvBSlCJE6bN2E0D8SSCQtySc/PhP+wQ/HSj1b1vQlFd/UleAM5nWLb5ssYptCtP+D
	gvqw==
X-Gm-Message-State: ALKqPwez7RW4tJ6SFBcilC4YBoa+/zLLrBaS06Ou/AFeYKM7YoaquB9k
	EIaClceQTmdAMCWjToUMfTyVcfg+lXYGUkPLxINJAg==
X-Received: by 2002:a9d:429c:: with SMTP id
	r28-v6mr4272089ote.126.1527167524041; 
	Thu, 24 May 2018 06:12:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 24 May 2018 06:11:43
	-0700 (PDT)
In-Reply-To: <1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
References: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
	<1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 May 2018 14:11:43 +0100
Message-ID: <CAFEAcA_QWFQPi2fndeUqBNVWdgeKpfNoJL_amQC9aqpYoTbW6A@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH V3 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HJJQLjBjqo3P

On 23 May 2018 at 04:53, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> While we skip the GIC_INTERNAL irqs, we don't change the register offset
> accordingly. This will overlap the GICR registers value and leave the
> last GIC_INTERNAL irq's registers out of update.
>
> Fix this by skipping the registers banked by GICR.
>
> Also for migration compatibility if the migration source (old version
> qemu) doesn't send gicd_no_shift_bug = 1 to destination, then we shift
> the data of PPI to get the right data for SPI.
>
> Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> ---
> Changes in V3: add migration compatibility and fix code style
> ---
>  hw/intc/arm_gicv3_common.c         | 36 ++++++++++++++++++++++++
>  hw/intc/arm_gicv3_kvm.c            | 56 +++++++++++++++++++++++++++++++++++++-
>  include/hw/intc/arm_gicv3_common.h |  1 +
>  3 files changed, 92 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 7b54d52..f93e5d2 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -141,6 +141,38 @@ static const VMStateDescription vmstate_gicv3_cpu = {
>      }
>  };
>
> +static int gicv3_gicd_no_shift_bug_pre_load(void *opaque)
> +{
> +    GICv3State *cs = opaque;
> +
> +   /*
> +    * If the gicd_no_shift_bug subsection is not transferred this
> +    * means gicd_no_shift_bug is 0x0 (which might not be the same as
> +    * our reset value).
> +    */

This comment seems to have been copied from a similar one about
SRE_EL1, and I think it's a bit misleading here. For icc_sre_el1,
that is a guest-visible struct value which we set to something in the
device's reset function. This gicd_no_shift_bug field is
only for the benefit of migration.

This comment is the ideal place to explain the semantics of gicd_no_shift_bug
and why we have to use it.

You should also only set this if KVM is enabled, because the TCG
GIC gets the semantics of the data structure right.

> +    cs->gicd_no_shift_bug = 0x0;
> +    return 0;
> +}
> +
> +static bool gicv3_gicd_no_shift_bug_needed(void *opaque)
> +{
> +    GICv3State *cs = opaque;
> +
> +    return cs->gicd_no_shift_bug;
> +}
> +
> +const VMStateDescription vmstate_gicv3_gicd_no_shift_bug = {
> +    .name = "arm_gicv3/gicd_no_shift_bug",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .pre_load = gicv3_gicd_no_shift_bug_pre_load,
> +    .needed = gicv3_gicd_no_shift_bug_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_BOOL(gicd_no_shift_bug, GICv3State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};

You also need a post-load function, because that is where you want
to fix up the incoming data (by memcpy'ing it into the right place).

> +
>  static const VMStateDescription vmstate_gicv3 = {
>      .name = "arm_gicv3",
>      .version_id = 1,
> @@ -165,6 +197,10 @@ static const VMStateDescription vmstate_gicv3 = {
>          VMSTATE_STRUCT_VARRAY_POINTER_UINT32(cpu, GICv3State, num_cpu,
>                                               vmstate_gicv3_cpu, GICv3CPUState),
>          VMSTATE_END_OF_LIST()
> +    },
> +    .subsections = (const VMStateDescription * []) {
> +        &vmstate_gicv3_gicd_no_shift_bug,
> +        NULL
>      }
>  };
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 3536795..bd961f1 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -136,6 +136,12 @@ static void kvm_dist_get_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
>      int irq;
>
>      field = (uint32_t *)bmp;
> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 8
> +     * GICD_IPRIORITYR<n> registers are always RAZ/WI. The corresponding
> +     * functionality is replaced by GICR_IPRIORITYR<n>. So it doesn't need to
> +     * sync them.
> +     */

This is true, but not why we need to add to the offset. We need
to add to the offset because for_each_dist_irq_reg()'s loop
handles irq numbers starting from GIC_INTERNAL, but the offset
we have is for the start of the GICD_IPRIORITYR<n> register range,
which includes space for the irqs 0..GIC_INTERNAL-1.

> +    offset += (8 * sizeof(uint32_t));

Possibly these offset changes would be clearer written as

     offset += (GIC_INTERNAL * bits-per-irq) / 8;

where bits-per-irq is the same as the last argument to for_each_dist_irq_reg()?

>      for_each_dist_irq_reg(irq, s->num_irq, 8) {
>          kvm_gicd_access(s, offset, &reg, false);
>          *field = reg;
> @@ -149,7 +155,18 @@ static void kvm_dist_put_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
>      uint32_t reg, *field;
>      int irq;
>
> -    field = (uint32_t *)bmp;
> +    if (!s->gicd_no_shift_bug) {
> +        field = (uint32_t *)(bmp + 8 * sizeof(uint32_t));
> +    } else {
> +        field = (uint32_t *)bmp;
> +    }

As noted above, don't try to fix the migration compat problem up here.
The code for syncing registers should just assume the data structure
is being used correctly.

> @@ -235,6 +274,20 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
>      uint32_t reg;
>      int irq;
>
> +    if (!s->gicd_no_shift_bug) {
> +        bmp += (1 * sizeof(uint32_t));
> +    }

As noted above, don't try to fix the migration compat problem up here.
The code for syncing registers should just assume the data structure
is being used correctly.

> +
> +    /* For the KVM GICv3, affinity routing is always enabled, and the
> +     * GICD_IGROUPR0/GICD_ISENABLER0/GICD_ISPENDR0/GICD_ISACTIVER0 registers
> +     * are always RAZ/WI. The corresponding functionality is replaced by the
> +     * GICR registers. So it doesn't need to sync them.
> +     */
> +    offset += (1 * sizeof(uint32_t));
> +    if (clroffset != 0) {
> +        clroffset += (1 * sizeof(uint32_t));
> +    }
> +
>      for_each_dist_irq_reg(irq, s->num_irq, 1) {
>          /* If this bitmap is a set/clear register pair, first write to the
>           * clear-reg to clear all bits before using the set-reg to write
> @@ -651,6 +704,7 @@ static void kvm_arm_gicv3_reset(DeviceState *dev)
>          return;
>      }
>
> +    s->gicd_no_shift_bug = 1;

This is the wrong place to do this reset, because then it won't
be in effect for the TCG GIC.

>      kvm_arm_gicv3_put(s);
>  }
>
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index bccdfe1..13c28c0 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -217,6 +217,7 @@ struct GICv3State {
>      uint32_t revision;
>      bool security_extn;
>      bool irq_reset_nonsecure;
> +    bool gicd_no_shift_bug;

Probably putting 'migration' in the field name will help to indicate
that it's only a migration compat fixup.

>
>      int dev_fd; /* kvm device fd if backed by kvm vgic support */
>      Error *migration_blocker;
> --
> 2.0.4

thanks
-- PMM
