Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3650322wre;
        Tue, 29 May 2018 07:44:42 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJDHsw6pIxFB/w7lmSTtvNqjJ/0k3tsG1+WPZqJnH06tCoZwiG7CLcJktbV3gdPQxyU5REB
X-Received: by 2002:a37:5886:: with SMTP id m128-v6mr14643629qkb.275.1527605082137;
        Tue, 29 May 2018 07:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527605082; cv=none;
        d=google.com; s=arc-20160816;
        b=z59kBadx4tkotsTI1j3UAiqBTstzAoQA21DB4EkaAROii0i5WN8pvjES8G2BJaO11M
         uaz6sbd0cpAAkJmvIxNO0gBQ7t/QXrKNhU1DULsjZv7txp1fAo+HPtEFe92y95z2SI8t
         4XgttwXqGlKMk2bne57d8NfL+07wEa6LjS7F1PJEFCPfC6jXVlR0gj5SqYBCU+LG1VPu
         r1IHxXDEPJEntjMH6R/7urnnC89ENYor3rcnVzHXyb3luZYBS9NNZyiBPtpLC5VbAOOI
         VZBD9jsYxGI7GHh3vf4rWq1YN+qw+5jPdCFHjhx+ZgAnBCZP/9Ik56sznlMliFnfx2NG
         gGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=hETH/QxM6ZS40TVJVUssxy+Y1lTZKZNixGc9NWi6Qvk=;
        b=NEpu7T7Bp0KffggGxjLJwZ/rCcyVzFADpRtAsqutI8GiU9TimLLdOzHBRyG7uuzMNr
         vJnz9uMzeRFCJHycL2KcRkI+kc8/S1gw+mnG7OqJ7/m0hPbsYGBWoATdxldh433sRYZs
         sjApvLn8/0SsUaxnsXtqrroxPVk1FJpcPq+4ODhkzjmVPmtPz3LY+7jkxQ2YAZZ2b/Q/
         bf3AA+A7gLI7tj4zMqUwiikUd2LllxxjK53VIpUd/ISeleLNL83i+RYW4+sl2vBftVh/
         192+ljPNCbuwKA3ZgmthoK9+NetVe9UE1NuBkQzo9mhRaTBoKlvZhW5huHd5dIJy8Uyo
         +6Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ThpNVuGm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 203-v6si3332440qkn.199.2018.05.29.07.44.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 07:44:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ThpNVuGm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNfrd-0000zr-Hr
	for alex.bennee@linaro.org; Tue, 29 May 2018 10:44:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNfrR-0000uB-0w
	for qemu-arm@nongnu.org; Tue, 29 May 2018 10:44:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNfrP-00046G-81
	for qemu-arm@nongnu.org; Tue, 29 May 2018 10:44:29 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:32995)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fNfrP-00045R-1k
	for qemu-arm@nongnu.org; Tue, 29 May 2018 10:44:27 -0400
Received: by mail-oi0-x241.google.com with SMTP id k5-v6so13274046oiw.0
	for <qemu-arm@nongnu.org>; Tue, 29 May 2018 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hETH/QxM6ZS40TVJVUssxy+Y1lTZKZNixGc9NWi6Qvk=;
	b=ThpNVuGmQhMFT8nsoK4JR81xfc6GFZWt6sSh0S8sb1yTQnajmEHDcOGPv6OafZmjt1
	TsRFb7LE0ghclZoQtnewAFjbt3FHa6vcCpvBErglmRqxDlIVLlSJfDG6mTO9yjEhMRyn
	kBdGLwGcUip/z/kqjlCSEmcrU8CYe1rd4BTbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hETH/QxM6ZS40TVJVUssxy+Y1lTZKZNixGc9NWi6Qvk=;
	b=Wn4Fg6P6rHOqW83idR1N/qDWGsvVNRykApnBCKUR4VAN7DJXF9wtbCf5mQp2au8mQ8
	k+oa9bBiSQ1FSSipSHLgOq+VHCtKvETzb5fvkHb7Ni3hcrIh5IgyO6Bewzj0PcNAjrqh
	5W1scPzO9gfZ4dY4qrXu1xCrfAuFjhMJ4ui5YGviQ8aqiauigoQdPTZR1lKJJAsWrKj4
	1Vg14Q6HCjD6LQ3CywkHV+LLFUxfOkH+xY6vHY89zJ1/9v89WMzJL6axDqe9qFyzlKM2
	zPAeKAxfLx3rRCBnQLgZQqIyY+2j53obt4Rca2XgK3KQewzreOFuFhyzX0/btMKa2fp+
	W4rg==
X-Gm-Message-State: ALKqPwfbLgo1jC7oNfFeIk8DzpFvmpfbmWxEoo+xbopIZcIE0oqbUQmk
	ysH44xD+MXzlEFIkSU6eEo/xD1H7VKcFw+vkALcN3Q==
X-Received: by 2002:aca:bec6:: with SMTP id
	o189-v6mr9026115oif.337.1527605066093; 
	Tue, 29 May 2018 07:44:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Tue, 29 May 2018 07:44:05
	-0700 (PDT)
In-Reply-To: <1527247371-10592-3-git-send-email-zhaoshenglong@huawei.com>
References: <1527247371-10592-1-git-send-email-zhaoshenglong@huawei.com>
	<1527247371-10592-3-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 May 2018 15:44:05 +0100
Message-ID: <CAFEAcA_ZqgGTxLM0BiUX2LOhszFs1z8t4jGF=wCj6ceh06r2nQ@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v4 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
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
Cc: Eric Auger <eric.auger@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FyFvJVh0MEaZ

On 25 May 2018 at 12:22, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> While we skip the GIC_INTERNAL irqs, we don't change the register offset
> accordingly. This will overlap the GICR registers value and leave the
> last GIC_INTERNAL irq's registers out of update.
>
> Fix this by skipping the registers banked by GICR.
>
> Also for migration compatibility if the migration source (old version
> qemu) doesn't send gicd_no_migration_shift_bug = 1 to destination, then
> we shift the data of PPI to get the right data for SPI.
>
> Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> ---
>  hw/intc/arm_gicv3_common.c         | 66 ++++++++++++++++++++++++++++++++++++++
>  hw/intc/arm_gicv3_kvm.c            | 30 +++++++++++++++++
>  include/hw/intc/arm_gicv3_common.h |  1 +
>  3 files changed, 97 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 7b54d52..f72a6f7 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -27,6 +27,7 @@
>  #include "hw/intc/arm_gicv3_common.h"
>  #include "gicv3_internal.h"
>  #include "hw/arm/linux-boot-if.h"
> +#include "sysemu/kvm.h"
>
>  static int gicv3_pre_save(void *opaque)
>  {
> @@ -141,6 +142,66 @@ static const VMStateDescription vmstate_gicv3_cpu = {
>      }
>  };
>
> +static int gicv3_gicd_no_migration_shift_bug_pre_load(void *opaque)
> +{
> +    GICv3State *cs = opaque;
> +
> +   /*
> +    * The gicd_no_migration_shift_bug flag is used for migration compatibilty
> +    * for old version QEMU which may have the GICD bmp shift bug under KVM mode.

You can add here:

    * Strictly, what we want to know is whether the migration source is
    * using KVM. Since we don't have any way to determine that, we look
    * at whether the destination is using KVM; this is close enough
    * because for the older QEMU versions with this bug KVM -> TCG
    * migration didn't work anyway.
    * If the source is a newer QEMU without this bug it will transmit the
    * migration subsection which sets the flag to true; otherwise it will
    * remain set to the value we select here.

> +    */
> +    if (kvm_enabled()) {
> +        cs->gicd_no_migration_shift_bug = false;
> +    }
> +
> +    return 0;
> +}
> +
> +static int gicv3_gicd_no_migration_shift_bug_post_load(void *opaque,
> +                                                       int version_id)
> +{
> +    GICv3State *cs = opaque;
> +
> +    if (gicd_no_migration_shift_bug) {
> +        return 0;
> +    }

This is where we should have a comment explaining the bug and
what the migration data from the old broken QEMU looks like; something
like:

    /* Older versions of QEMU had a bug in the handling of state save/restore
     * to the KVM GICv3: they got the offset in the bitmap arrays wrong,
     * so that instead of the data for external interrupts 32 and up
     * starting at bit position 32 in the bitmap, it started at bit
     * position 0. If we're receiving data from a QEMU with that bug,
     * we must move the data back into the right place.
     */

> +
> +    memcpy(cs->group, (uint8_t *)cs->group + GIC_INTERNAL / 8,
> +           sizeof(cs->group) - GIC_INTERNAL / 8);

These are overlapping copies, so we need to use memmove().

Also you have the source and destination pointers the wrong way
around, I think. We want to copy data that's in the bitmap starting
at bit position 0 up to bit position 32, not the other way around.
(You should check that I'm right about this; don't just trust me :-))

You could write the 'dest' argument as
    gic_bmp_ptr32(cs->group, GIC_INTERNAL)
though that then breaks the symmetry between the src argument
and the size argument, so I'm not sure it's an improvement.

> +    memcpy(cs->grpmod, (uint8_t *)cs->grpmod + GIC_INTERNAL / 8,
> +           sizeof(cs->grpmod) - GIC_INTERNAL / 8);
> +    memcpy(cs->enabled, (uint8_t *)cs->enabled + GIC_INTERNAL / 8,
> +           sizeof(cs->enabled) - GIC_INTERNAL / 8);
> +    memcpy(cs->pending, (uint8_t *)cs->pending + GIC_INTERNAL / 8,
> +           sizeof(cs->pending) - GIC_INTERNAL / 8);
> +    memcpy(cs->active, (uint8_t *)cs->active + GIC_INTERNAL / 8,
> +           sizeof(cs->active) - GIC_INTERNAL / 8);
> +    memcpy(cs->edge_trigger, (uint8_t *)cs->edge_trigger + GIC_INTERNAL / 8,
> +           sizeof(cs->edge_trigger) - GIC_INTERNAL / 8);
> +
> +    return 0;
> +}
> +
> +static bool gicv3_gicd_no_migration_shift_bug_needed(void *opaque)
> +{
> +    GICv3State *cs = opaque;
> +
> +    return cs->gicd_no_migration_shift_bug;
> +}

We don't need to have a 'needed' function, because we always need
the subsection. (The code you have here will always return 'true',
which is the same as not specifying a 'needed' function at all.)

> +
> +const VMStateDescription vmstate_gicv3_gicd_no_migration_shift_bug = {
> +    .name = "arm_gicv3/gicd_no_migration_shift_bug",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .pre_load = gicv3_gicd_no_migration_shift_bug_pre_load,
> +    .post_load = gicv3_gicd_no_migration_shift_bug_post_load,
> +    .needed = gicv3_gicd_no_migration_shift_bug_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_BOOL(gicd_no_migration_shift_bug, GICv3State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_gicv3 = {
>      .name = "arm_gicv3",
>      .version_id = 1,
> @@ -165,6 +226,10 @@ static const VMStateDescription vmstate_gicv3 = {
>          VMSTATE_STRUCT_VARRAY_POINTER_UINT32(cpu, GICv3State, num_cpu,
>                                               vmstate_gicv3_cpu, GICv3CPUState),
>          VMSTATE_END_OF_LIST()
> +    },
> +    .subsections = (const VMStateDescription * []) {
> +        &vmstate_gicv3_gicd_no_migration_shift_bug,
> +        NULL
>      }
>  };
>
> @@ -364,6 +429,7 @@ static void arm_gicv3_common_reset(DeviceState *dev)
>              gicv3_gicd_group_set(s, i);
>          }
>      }
> +    s->gicd_no_migration_shift_bug = true;
>  }
>
>  static void arm_gic_common_linux_init(ARMLinuxBootIf *obj,
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 147e691..1068444 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -178,6 +178,12 @@ static void kvm_dist_get_edge_trigger(GICv3State *s, uint32_t offset,
>      uint32_t reg;
>      int irq;
>
> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 2
> +     * GICD_ICFGR<n> registers are always RAZ/WI. The corresponding
> +     * functionality is replaced by GICR_ICFGR<n>. It doesn't need to sync
> +     * them. So it should increase the offset to skip GIC_INTERNAL irqs.

    * This matches the for_each_dist_irq_reg() macro which also skips the
    * first GIC_INTERNAL irqs.

> +     */
> +    offset += (GIC_INTERNAL * 2) / 8;
>      for_each_dist_irq_reg(irq, s->num_irq, 2) {
>          kvm_gicd_access(s, offset, &reg, false);
>          reg = half_unshuffle32(reg >> 1);
> @@ -195,6 +201,12 @@ static void kvm_dist_put_edge_trigger(GICv3State *s, uint32_t offset,
>      uint32_t reg;
>      int irq;
>
> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 2
> +     * GICD_ICFGR<n> registers are always RAZ/WI. The corresponding
> +     * functionality is replaced by GICR_ICFGR<n>. It doesn't need to sync
> +     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
> +     */
> +    offset += (GIC_INTERNAL * 2) / 8;
>      for_each_dist_irq_reg(irq, s->num_irq, 2) {
>          reg = *gic_bmp_ptr32(bmp, irq);
>          if (irq % 32 != 0) {
> @@ -236,6 +248,13 @@ static void kvm_dist_getbmp(GICv3State *s, uint32_t offset, uint32_t *bmp)
>      uint32_t reg;
>      int irq;
>
> +    /* For the KVM GICv3, affinity routing is always enabled, and the
> +     * GICD_IGROUPR0/GICD_IGRPMODR0/GICD_ISENABLER0/GICD_ISPENDR0/
> +     * GICD_ISACTIVER0 registers are always RAZ/WI. The corresponding
> +     * functionality is replaced by the GICR registers. It doesn't need to sync
> +     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
> +     */
> +    offset += (GIC_INTERNAL * 1) / 8;
>      for_each_dist_irq_reg(irq, s->num_irq, 1) {
>          kvm_gicd_access(s, offset, &reg, false);
>          *gic_bmp_ptr32(bmp, irq) = reg;
> @@ -249,6 +268,17 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
>      uint32_t reg;
>      int irq;
>
> +    /* For the KVM GICv3, affinity routing is always enabled, and the
> +     * GICD_IGROUPR0/GICD_IGRPMODR0/GICD_ISENABLER0/GICD_ISPENDR0/
> +     * GICD_ISACTIVER0 registers are always RAZ/WI. The corresponding
> +     * functionality is replaced by the GICR registers. It doesn't need to sync
> +     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
> +     */
> +    offset += (GIC_INTERNAL * 1) / 8;
> +    if (clroffset != 0) {
> +        clroffset += (1 * sizeof(uint32_t));
> +    }
> +
>      for_each_dist_irq_reg(irq, s->num_irq, 1) {
>          /* If this bitmap is a set/clear register pair, first write to the
>           * clear-reg to clear all bits before using the set-reg to write
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index bccdfe1..d75b49d 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -217,6 +217,7 @@ struct GICv3State {
>      uint32_t revision;
>      bool security_extn;
>      bool irq_reset_nonsecure;
> +    bool gicd_no_migration_shift_bug;
>
>      int dev_fd; /* kvm device fd if backed by kvm vgic support */
>      Error *migration_blocker;
> --

thanks
-- PMM
