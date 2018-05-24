Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1630078wre;
        Thu, 24 May 2018 02:05:03 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqvYEwZARINpWQF5fFoxgdUv9mobxk0uykC9MKvKyHvaNMb1XdZTs5VBCiDbvIXbT7oYlE1
X-Received: by 2002:a0c:bd0d:: with SMTP id m13-v6mr5571167qvg.233.1527152702919;
        Thu, 24 May 2018 02:05:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527152702; cv=none;
        d=google.com; s=arc-20160816;
        b=KmVkesBuHulZ90hmljZv6heDmQAMhYbNEH5ECRf/LfwZJ4tPcP6PrdnON42GQ5Kkze
         fPws/p197Rzy5ALU1JDlFYpTzxBBSNnoMz1lVTQoOpbbcIMQ0HRPzmPV1jahnxm+d9VD
         jixoK7P4NBgjIxpeEQDzxnHN3p86zRdx7w2CC2cI6/k3V55Eo0pe2dOuxcWHQ8CQDvUy
         hMTCM2QZyjI7Jf9nUmbrh3IS5T1LlqUgqCSQV+TcOeWoktRm5c2xaKYcC5q+8ShYPKeT
         A/mmv674naMJh7+XfLyQS6+ZygMMeNv88mNtr3Qfl0zvLXIEx6dg/LJ3loEd8Kpks9NJ
         g++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=ywIiMAmL9qjKRhLFJWbx0B8G/YXwFSQ4i8XkJRyTYDI=;
        b=hT1QEduZevuiPb0+TwOcl7ubpq0nNA1fY4SzAqbU0l3jDSY6OVpXocbNB7DM+46MBm
         jNksuX5Wbjdm86fArN2Ymj8vMPMSVJL1vd0kRTz6LUIri8ImD9sOSNn68TtO12UJ0Dah
         UzkeUMHZzUfT2t5HmF5WZrML5DwI5X+PDIuMpFixJvDtRAtn6i0taLNRjGrA6eaXWP8+
         hU+wD97Ha/doLStn73oAr3v3PkfXjqeA2pLNJm867RDZMPW2byK+aj715jkrI63OQkF8
         F/6PR5tDiepqJtXbrNWUjZadRQ50NwG4RjdYXuhWEXAZUxAPl70PK+/s9j+K0f31vrTT
         0+8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j28-v6si2652546qta.357.2018.05.24.02.05.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 02:05:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37289 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLmBC-0003EN-DL
	for alex.bennee@linaro.org; Thu, 24 May 2018 05:05:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLmAn-000368-6W
	for qemu-arm@nongnu.org; Thu, 24 May 2018 05:04:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLmAh-0005Rs-Pn
	for qemu-arm@nongnu.org; Thu, 24 May 2018 05:04:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42746 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fLmAh-0005RN-K4; Thu, 24 May 2018 05:04:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F161FC12A1;
	Thu, 24 May 2018 09:04:30 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF9019457D;
	Thu, 24 May 2018 09:04:29 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org
References: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
	<1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <acca5b80-f527-bc39-0b63-147e53affb4b@redhat.com>
Date: Thu, 24 May 2018 11:04:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 24 May 2018 09:04:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 24 May 2018 09:04:31 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jfby9YZ282qd

Hi Shannon,

On 05/23/2018 05:53 AM, Shannon Zhao wrote:
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
> +    offset += (8 * sizeof(uint32_t));
Now I am unclear about the semantics of the s->gicd_ipriority & friends.
With that change, is it supposed to contain only the states of SPIs or
contain the RAZ states of PPI/SGIs + states of SPIs. The array is
dimensionned to contain states for PPI/SGI+SPIs, right? In other words,
shouldn't we also shift field?

Thanks

Eric
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
> +
> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 8
> +     * GICD_IPRIORITYR<n> registers are always RAZ/WI. The corresponding
> +     * functionality is replaced by GICR_IPRIORITYR<n>. So it doesn't need to
> +     * sync them.
> +     */
> +    offset += (8 * sizeof(uint32_t));
in the old to new migration scenario, IIUC,
bmp contains state of 32 internal PPI/SGI(RAZ) + s->num_irq-32 SPIs
Here aren't you "putting" the RAZ state of the 32 PPI/SGIs into the
first 32 SPIs here?

Thanks

Eric
>      for_each_dist_irq_reg(irq, s->num_irq, 8) {
>          reg = *field;
>          kvm_gicd_access(s, offset, &reg, true);
> @@ -164,6 +181,12 @@ static void kvm_dist_get_edge_trigger(GICv3State *s, uint32_t offset,
>      uint32_t reg;
>      int irq;
>  
> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 2
> +     * GICD_ICFGR<n> registers are always RAZ/WI. The corresponding
> +     * functionality is replaced by GICR_ICFGR<n>. So it doesn't need to sync
> +     * them.
> +     */
> +    offset += (2 * sizeof(uint32_t));
>      for_each_dist_irq_reg(irq, s->num_irq, 2) {
>          kvm_gicd_access(s, offset, &reg, false);
>          reg = half_unshuffle32(reg >> 1);
> @@ -181,6 +204,16 @@ static void kvm_dist_put_edge_trigger(GICv3State *s, uint32_t offset,
>      uint32_t reg;
>      int irq;
>  
> +    if (!s->gicd_no_shift_bug) {
> +        bmp += (2 * sizeof(uint32_t));
> +    }
> +
> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 2
> +     * GICD_ICFGR<n> registers are always RAZ/WI. The corresponding
> +     * functionality is replaced by GICR_ICFGR<n>. So it doesn't need to sync
> +     * them.
> +     */
> +    offset += (2 * sizeof(uint32_t));
>      for_each_dist_irq_reg(irq, s->num_irq, 2) {
>          reg = *gic_bmp_ptr32(bmp, irq);
>          if (irq % 32 != 0) {
> @@ -222,6 +255,12 @@ static void kvm_dist_getbmp(GICv3State *s, uint32_t offset, uint32_t *bmp)
>      uint32_t reg;
>      int irq;
>  
> +    /* For the KVM GICv3, affinity routing is always enabled, and the
> +     * GICD_IGROUPR0/GICD_ISENABLER0/GICD_ISPENDR0/GICD_ISACTIVER0 registers
> +     * are always RAZ/WI. The corresponding functionality is replaced by the
> +     * GICR registers. So it doesn't need to sync them.
> +     */
> +    offset += (1 * sizeof(uint32_t));
>      for_each_dist_irq_reg(irq, s->num_irq, 1) {
>          kvm_gicd_access(s, offset, &reg, false);
>          *gic_bmp_ptr32(bmp, irq) = reg;
> @@ -235,6 +274,20 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
>      uint32_t reg;
>      int irq;
>  
> +    if (!s->gicd_no_shift_bug) {
> +        bmp += (1 * sizeof(uint32_t));
> +    }
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
>  
>      int dev_fd; /* kvm device fd if backed by kvm vgic support */
>      Error *migration_blocker;
> 
