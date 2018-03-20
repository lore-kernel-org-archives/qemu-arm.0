Received: by 10.28.91.67 with SMTP id p64csp3561006wmb;
        Tue, 20 Mar 2018 01:42:31 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvbc7I0tR4f03SUpXBH5I3aJn0mJIu+VeD9abai5TtKbuYZK3jgcUNkehApi3vwUm+AGxk1
X-Received: by 10.200.5.70 with SMTP id c6mr8979537qth.300.1521535351234;
        Tue, 20 Mar 2018 01:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521535351; cv=none;
        d=google.com; s=arc-20160816;
        b=YAw1UarZ4kteZhO2l2jkPdoqOD8DFs9lxPuZIUkI+TRCyQJPi9P7SenoS0ove0+yK0
         cr9XdaVeOAsWmD+u4/5iVflf7FEpxSyWi3ehmx1NcKSGYoGiPeB039taG3SyPfmfzz5O
         J6O97I5xIU7rZtWSYTVWfOBbGwkFa40EqEC84VRNG7QBoRgHC63uwOz1FMtjWeHtb7Sb
         Ax8giNWK8+e3L49JalWobJBJJH3Cp6SCyFBRX57SrAJfET5xi6P0lmJt1dBe+Al1YJPK
         irmCCSdR63+9DrOA3YrI3ybi/L+aRbVuvQHW2THgwTE7mWhUURG96gpguFyhgKAzMUkU
         u7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=+vIrDCiuazVEQ00KfPNrr/L4SjH5n1Vd/1UJMaqvy1M=;
        b=BZHxwwxGoR4MnGY9c6zwMsryLjwH4GsNxdMUvs8twljSl/i9E2p26ttuDx+Aqd4ORn
         pZlXLPeH58jokoVNjkcnih7ulpSDKQDXW+RlXIr7OgbHICYFRxPfprR6vFHSZsrKMDDi
         fMNtHLaNyaTWqIIb20xxNgnrY+NBwfDy/LHMP12gcNdcEZ7hSAMYedYPhJa4crKsrYLY
         MhdKRslYNf6z1/JeVOl/zvaVeEIunBZ3Qufiie/7Jk5XjwlEyUDNWGAFNOYXUzl57xhD
         qknbOP/3kEa/mz9JgHLA0iV22LDSIzi+GBkHmS91gPdCEIpmYLUlupN3nveQkLFLKEgP
         iLqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h52si1487141qtc.390.2018.03.20.01.42.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 01:42:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyCqk-0003Yl-Qa
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 04:42:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyCqY-0003XF-Rc
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 04:42:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyCqV-0007Xf-NO
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 04:42:18 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37712 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eyCqV-0007Ww-HZ; Tue, 20 Mar 2018 04:42:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8F9B818AAEB;
	Tue, 20 Mar 2018 08:42:14 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E7C363538;
	Tue, 20 Mar 2018 08:42:09 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org
References: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
	<1521530809-11780-3-git-send-email-zhaoshenglong@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <33a7bc59-c457-03d0-90bf-ab5b2d2d46cd@redhat.com>
Date: Tue, 20 Mar 2018 09:42:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1521530809-11780-3-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 20 Mar 2018 08:42:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 20 Mar 2018 08:42:14 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/2] arm_gicv3_kvm:
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N9GGrupNHsYS

Hi Shannon,
On 20/03/18 08:26, Shannon Zhao wrote:
> While we skip the GIC_INTERNAL irqs, we don't change the register offset
> accordingly. This will overlap the GICR registers value and leave the
> last GIC_INTERNAL irq's registers out of update.
> 
> Fix this by skipping the registers banked by GICR.
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> ---
>  hw/intc/arm_gicv3_kvm.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 3536795..d423cba 100644
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
>      for_each_dist_irq_reg(irq, s->num_irq, 8) {
>          kvm_gicd_access(s, offset, &reg, false);
>          *field = reg;
> @@ -150,6 +156,12 @@ static void kvm_dist_put_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
>      int irq;
>  
>      field = (uint32_t *)bmp;
> +    /* For the KVM GICv3, affinity routing is always enabled, and the first 8
> +     * GICD_IPRIORITYR<n> registers are always RAZ/WI. The corresponding
> +     * functionality is replaced by GICR_IPRIORITYR<n>. So it doesn't need to
> +     * sync them.
> +     */
> +    offset += (8 * sizeof(uint32_t));
>      for_each_dist_irq_reg(irq, s->num_irq, 8) {
>          reg = *field;
>          kvm_gicd_access(s, offset, &reg, true);
> @@ -164,6 +176,12 @@ static void kvm_dist_get_edge_trigger(GICv3State *s, uint32_t offset,
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
> @@ -181,6 +199,12 @@ static void kvm_dist_put_edge_trigger(GICv3State *s, uint32_t offset,
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
>          reg = *gic_bmp_ptr32(bmp, irq);
>          if (irq % 32 != 0) {
> @@ -222,6 +246,12 @@ static void kvm_dist_getbmp(GICv3State *s, uint32_t offset, uint32_t *bmp)
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
> @@ -235,6 +265,14 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
>      uint32_t reg;
>      int irq;
>  
> +    /* For the KVM GICv3, affinity routing is always enabled, and the
> +     * GICD_IGROUPR0/GICD_ISENABLER0/GICD_ISPENDR0/GICD_ISACTIVER0 registers
> +     * are always RAZ/WI. The corresponding functionality is replaced by the
> +     * GICR registers. So it doesn't need to sync them.
> +     */
> +    offset += (1 * sizeof(uint32_t));
I wonder we couldn't create a new for_each_dist_irq_reg() macro taking
the offset and clroffset and integrating that shift inside?

> +    if (clroffset != 0)
nit style issue: brace needed here

Besides Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> +        clroffset += (1 * sizeof(uint32_t));
>      for_each_dist_irq_reg(irq, s->num_irq, 1) {
>          /* If this bitmap is a set/clear register pair, first write to the
>           * clear-reg to clear all bits before using the set-reg to write
> 
