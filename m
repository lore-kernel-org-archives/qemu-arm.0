Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5812313wre;
        Thu, 31 May 2018 04:33:13 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJp4yEjbLRg1uyIn5MI0kP860VGKmaxcrlCXS/9XrerhC0XXk+OV8CpJqh0Fu0Ycj/pXp8P
X-Received: by 2002:a0c:86e1:: with SMTP id 30-v6mr1552120qvg.143.1527766393789;
        Thu, 31 May 2018 04:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527766393; cv=none;
        d=google.com; s=arc-20160816;
        b=XrAeh5D2K24Q4swzO+/IKMcggkSzMk+cIhcC4fw9ToA9nWdxXoWAV5Cv4yIpzYEcFT
         qyMMK3kZ/ZuGMBI1rT+VOqHr7V2jXU1MWYMNktSPEDjbAa3+9pb4Vf9JPRHobtwIiDTf
         xivmGuUat9/lbH43unFrn50rGcqh5FyFvtmqa41z+rKBQkcY6GI7RBxlm0m+tdzESUid
         W2PkMHKwB+t1ziSI9OCQpBt5duSWKHL38ayezz+DUey+yJZ9KCnlHkpmN/pfTpHO2F4G
         QvKvEYEzIfEikt12WtH0ucxBQTYH7cHXnpe/bCnCE8xjeE6ryQ/RxoiJp/PPs8a52Wpo
         1oTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=xxGDKM5N4E6pg4IQt2HzXwbR/+fRMPANncuR1NWYEas=;
        b=PFSnfJr9yW2DpWlnZ8Cha1d835LiDruLIVmoVywf7JON5hz1roMAYz+Hc0DuLL00qS
         ZsKHZsV4I6kuEJ021gOPPRh8wd6JRyJ6h6+dWVKQJX0+h1g6r8PNvhQnb9c+BPNqs3k+
         TEktsiTNr+BkHyL06zGCNAfCfM+iFCCX/3UJDu43L61alFGO/e9sjBvBzlq75qjUTSCU
         Z3mYUq7P7gYM8W0P2HQm69EyZW22SLuWO3p9I/R0KOjnz3yr+myI967ddz4CfJWOvTCI
         iZRVC0juv9ZUAEtJ00nLfcBuBYGthJnozyB18guONKiMMDZNdGaMJ4JTaA1np1ANP8ZC
         I6TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n16-v6si1613708qkn.352.2018.05.31.04.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 04:33:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOLpR-0002Wj-Aq
	for alex.bennee@linaro.org; Thu, 31 May 2018 07:33:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fOLpC-0002Vk-OS
	for qemu-arm@nongnu.org; Thu, 31 May 2018 07:33:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fOLp9-0000Cu-Hm
	for qemu-arm@nongnu.org; Thu, 31 May 2018 07:32:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51514 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fOLp9-0000CR-CA; Thu, 31 May 2018 07:32:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 937E04000B6E;
	Thu, 31 May 2018 11:32:54 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 403F92023450;
	Thu, 31 May 2018 11:32:53 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org
References: <1527736557-11084-1-git-send-email-zhaoshenglong@huawei.com>
	<1527736557-11084-3-git-send-email-zhaoshenglong@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <590c8365-3a31-88b7-2cfb-23f9ecfa5916@redhat.com>
Date: Thu, 31 May 2018 13:32:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1527736557-11084-3-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 31 May 2018 11:32:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 31 May 2018 11:32:54 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 2/2] arm_gicv3_kvm:
 kvm_dist_get/put: skip the registers banked by GICR
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
Cc: peter.maydell@linaro.org, shannon.zhaosl@gmail.com, qemu-stable@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Prpx2pBEQmNi

Hi,

On 05/31/2018 05:15 AM, Shannon Zhao wrote:
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
>  hw/intc/arm_gicv3_common.c         | 79 ++++++++++++++++++++++++++++++++++++++
>  hw/intc/arm_gicv3_kvm.c            | 38 ++++++++++++++++++
>  include/hw/intc/arm_gicv3_common.h |  1 +
>  3 files changed, 118 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 7b54d52..68211a2 100644
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
> @@ -141,6 +142,79 @@ static const VMStateDescription vmstate_gicv3_cpu = {
>      }
>  };
>  
> +static int gicv3_gicd_no_migration_shift_bug_pre_load(void *opaque)
> +{
> +    GICv3State *cs = opaque;
> +
> +   /*
> +    * The gicd_no_migration_shift_bug flag is used for migration compatibilty
nit: compatibility
> +    * for old version QEMU which may have the GICD bmp shift bug under KVM mode.
> +    * Strictly, what we want to know is whether the migration source is using
> +    * KVM. Since we don't have any way to determine that, we look at whether the
> +    * destination is using KVM; this is close enough because for the older QEMU
> +    * versions with this bug KVM -> TCG migration didn't work anyway. If the
> +    * source is a newer QEMU without this bug it will transmit the migration
> +    * subsection which sets the flag to true; otherwise it will remain set to
> +    * the value we select here.
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
> +    if (cs->gicd_no_migration_shift_bug) {
> +        return 0;
> +    }
> +
> +    /* Older versions of QEMU had a bug in the handling of state save/restore
> +     * to the KVM GICv3: they got the offset in the bitmap arrays wrong,
> +     * so that instead of the data for external interrupts 32 and up
> +     * starting at bit position 32 in the bitmap, it started at bit
> +     * position 64. If we're receiving data from a QEMU with that bug,
> +     * we must move the data down into the right place.
> +     */
> +    memmove(cs->group, (uint8_t *)cs->group + GIC_INTERNAL / 8,
> +            sizeof(cs->group) - GIC_INTERNAL / 8);
> +    memmove(cs->grpmod, (uint8_t *)cs->grpmod + GIC_INTERNAL / 8,
> +            sizeof(cs->grpmod) - GIC_INTERNAL / 8);
> +    memmove(cs->enabled, (uint8_t *)cs->enabled + GIC_INTERNAL / 8,
> +            sizeof(cs->enabled) - GIC_INTERNAL / 8);
> +    memmove(cs->pending, (uint8_t *)cs->pending + GIC_INTERNAL / 8,
> +            sizeof(cs->pending) - GIC_INTERNAL / 8);
> +    memmove(cs->active, (uint8_t *)cs->active + GIC_INTERNAL / 8,
> +            sizeof(cs->active) - GIC_INTERNAL / 8);
> +    memmove(cs->edge_trigger, (uint8_t *)cs->edge_trigger + GIC_INTERNAL / 8,
> +            sizeof(cs->edge_trigger) - GIC_INTERNAL / 8);
> +
> +    /*
> +     * While this new version QEMU doesn't have this kind of bug as we fix it,
> +     * so it's need to set the flag to true to indicate that and it's neccessary
nit: it needs, necessary
> +     * for next migration to work from this new version QEMU.
> +     */
> +    cs->gicd_no_migration_shift_bug = true;
> +
> +    return 0;
> +}
> +
> +const VMStateDescription vmstate_gicv3_gicd_no_migration_shift_bug = {
> +    .name = "arm_gicv3/gicd_no_migration_shift_bug",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .pre_load = gicv3_gicd_no_migration_shift_bug_pre_load,
> +    .post_load = gicv3_gicd_no_migration_shift_bug_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_BOOL(gicd_no_migration_shift_bug, GICv3State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_gicv3 = {
>      .name = "arm_gicv3",
>      .version_id = 1,
> @@ -165,6 +239,10 @@ static const VMStateDescription vmstate_gicv3 = {
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
> @@ -364,6 +442,7 @@ static void arm_gicv3_common_reset(DeviceState *dev)
>              gicv3_gicd_group_set(s, i);
>          }
>      }
> +    s->gicd_no_migration_shift_bug = true;
>  }
>  
>  static void arm_gic_common_linux_init(ARMLinuxBootIf *obj,
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 147e691..001d82b 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -178,6 +178,14 @@ static void kvm_dist_get_edge_trigger(GICv3State *s, uint32_t offset,
>      uint32_t reg;
>      int irq;
>  
> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 2
> +     * GICD_ICFGR<n> registers are always RAZ/WI. The corresponding
> +     * functionality is replaced by GICR_ICFGR<n>. It doesn't need to sync
> +     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
> +     * This matches the for_each_dist_irq_reg() macro which also skips the
> +     * first GIC_INTERNAL irqs.
> +     */
> +    offset += (GIC_INTERNAL * 2) / 8;
>      for_each_dist_irq_reg(irq, s->num_irq, 2) {
>          kvm_gicd_access(s, offset, &reg, false);
>          reg = half_unshuffle32(reg >> 1);
> @@ -195,6 +203,14 @@ static void kvm_dist_put_edge_trigger(GICv3State *s, uint32_t offset,
>      uint32_t reg;
>      int irq;
>  
> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 2
> +     * GICD_ICFGR<n> registers are always RAZ/WI. The corresponding
> +     * functionality is replaced by GICR_ICFGR<n>. It doesn't need to sync
> +     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
> +     * This matches the for_each_dist_irq_reg() macro which also skips the
> +     * first GIC_INTERNAL irqs.
> +     */
> +    offset += (GIC_INTERNAL * 2) / 8;
>      for_each_dist_irq_reg(irq, s->num_irq, 2) {
>          reg = *gic_bmp_ptr32(bmp, irq);
>          if (irq % 32 != 0) {
> @@ -236,6 +252,15 @@ static void kvm_dist_getbmp(GICv3State *s, uint32_t offset, uint32_t *bmp)
>      uint32_t reg;
>      int irq;
>  
> +    /* For the KVM GICv3, affinity routing is always enabled, and the
> +     * GICD_IGROUPR0/GICD_IGRPMODR0/GICD_ISENABLER0/GICD_ISPENDR0/
> +     * GICD_ISACTIVER0 registers are always RAZ/WI. The corresponding
> +     * functionality is replaced by the GICR registers. It doesn't need to sync
> +     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
> +     * This matches the for_each_dist_irq_reg() macro which also skips the
> +     * first GIC_INTERNAL irqs.
> +     */
> +    offset += (GIC_INTERNAL * 1) / 8;
>      for_each_dist_irq_reg(irq, s->num_irq, 1) {
>          kvm_gicd_access(s, offset, &reg, false);
>          *gic_bmp_ptr32(bmp, irq) = reg;
> @@ -249,6 +274,19 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
>      uint32_t reg;
>      int irq;
>  
> +    /* For the KVM GICv3, affinity routing is always enabled, and the
> +     * GICD_IGROUPR0/GICD_IGRPMODR0/GICD_ISENABLER0/GICD_ISPENDR0/
> +     * GICD_ISACTIVER0 registers are always RAZ/WI. The corresponding
> +     * functionality is replaced by the GICR registers. It doesn't need to sync
> +     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
> +     * This matches the for_each_dist_irq_reg() macro which also skips the
> +     * first GIC_INTERNAL irqs.
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
> 

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
