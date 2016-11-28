Received: by 10.25.150.194 with SMTP id y185csp1706271lfd;
        Mon, 28 Nov 2016 03:55:56 -0800 (PST)
X-Received: by 10.55.67.132 with SMTP id q126mr19718951qka.132.1480334156652;
        Mon, 28 Nov 2016 03:55:56 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h123si31815722qkf.178.2016.11.28.03.55.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Nov 2016 03:55:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBKXL-0005IM-Fn
	for alex.bennee@linaro.org; Mon, 28 Nov 2016 06:55:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cBKW3-0004bY-4c
	for qemu-devel@nongnu.org; Mon, 28 Nov 2016 06:54:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cBKW2-00051M-7v
	for qemu-devel@nongnu.org; Mon, 28 Nov 2016 06:54:35 -0500
Received: from mail-ua0-x22e.google.com ([2607:f8b0:400c:c08::22e]:35227)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cBKW1-00050o-Gk
	for qemu-devel@nongnu.org; Mon, 28 Nov 2016 06:54:34 -0500
Received: by mail-ua0-x22e.google.com with SMTP id 12so139980088uas.2
	for <qemu-devel@nongnu.org>; Mon, 28 Nov 2016 03:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NnxBmI/YlfAcNw+jrM58yUhWiHG/BBesyPKzJKbyssU=;
	b=O7LcBGm1i2O+l+7BO4HMENyvkWU+Fb10CSTqfC2Kfkw84iyBsgciypkwqzAyj/aOwX
	Fj2oIMzCjCb8Qc3Ph2u7g0WK6kJdHN9MLSAgQ626tGsy5d/RxOzGLrURY1aRE4WXvL6o
	iUODBEadpVhcExYsFrhCfdMK3DeOvrfJ9X/KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NnxBmI/YlfAcNw+jrM58yUhWiHG/BBesyPKzJKbyssU=;
	b=XLP/XH7CXLxhDGR8uQV/GWJxqYCwz2hwGcw8ntN2GkbjSpQuy8J20F/aJpxPrLzmOB
	GRmwre7Pm7AarwHzkYXKwhPt/GU9rnBD1Cg07spmjcWTocxx6rjcTToFxgGKjAmzt2PF
	G060lqKhQtVaUAvljrvCm8xLpIu/rVrF7r5bZYD8IppJCR01eeNMqPCqBdPlomewOwtf
	ekuWdnLJm5YmDPO/EWDvkajtHAQpWCCu55VLTJw28ip3bCE+BciZa0Drw3cGrP9EFWTC
	OnloHyAC52SNAi8ERBVDkgfqC106FmCCXwaZxIeb+0dpqo3zKpeDAgNgzvFuftD9v/Ll
	4UKg==
X-Gm-Message-State: AKaTC03QYRxz3+nBDeXj9ol1i73zIaL+k1FcKvJ7piRlfORm5aq45e1THEZh7RZ/3ySa90koTdxi9tXDioOuNB3J
X-Received: by 10.176.3.137 with SMTP id 9mr13235262uau.120.1480334072404;
	Mon, 28 Nov 2016 03:54:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.185.4 with HTTP; Mon, 28 Nov 2016 03:54:12 -0800 (PST)
In-Reply-To: <1479904764-15532-4-git-send-email-vijay.kilari@gmail.com>
References: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
	<1479904764-15532-4-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Nov 2016 11:54:12 +0000
Message-ID: <CAFEAcA-SfGLuDwwDwFSPwrN87=3U+9ByxdTa899b9D3xA0kFnQ@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22e
Subject: Re: [Qemu-devel] [PATCH v6 3/4] hw/intc/arm_gicv3_kvm: Save and
 Restore ICC_SRE_EL1 register
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EuxUp57+TDaR

On 23 November 2016 at 12:39,  <vijay.kilari@gmail.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> Save and Restore ICC_SRE_EL1 register. ICC_SRE_EL1 register
> value is used by kernel to check if SRE bit is set or not.
>
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> ---
>  hw/intc/arm_gicv3_kvm.c            | 4 ++++
>  include/hw/intc/arm_gicv3_common.h | 1 +
>  2 files changed, 5 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index a317fbf..77af32d 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -65,6 +65,8 @@
>      KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 3)
>  #define ICC_CTLR_EL1    \
>      KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 4)
> +#define ICC_SRE_EL1 \
> +    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 5)
>  #define ICC_IGRPEN0_EL1 \
>      KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 6)
>  #define ICC_IGRPEN1_EL1 \
> @@ -404,6 +406,7 @@ static void kvm_arm_gicv3_put(GICv3State *s)
>          GICv3CPUState *c = &s->cpu[ncpu];
>          int num_pri_bits;
>
> +        kvm_gicc_access(s, ICC_SRE_EL1, ncpu, &c->icc_sre_el1, true);
>          kvm_gicc_access(s, ICC_CTLR_EL1, ncpu,
>                          &c->icc_ctlr_el1[GICV3_NS], true);
>          kvm_gicc_access(s, ICC_IGRPEN0_EL1, ncpu,
> @@ -557,6 +560,7 @@ static void kvm_arm_gicv3_get(GICv3State *s)
>          GICv3CPUState *c = &s->cpu[ncpu];
>          int num_pri_bits;
>
> +        kvm_gicc_access(s, ICC_SRE_EL1, ncpu, &c->icc_sre_el1, false);
>          kvm_gicc_access(s, ICC_CTLR_EL1, ncpu,
>                          &c->icc_ctlr_el1[GICV3_NS], false);
>          kvm_gicc_access(s, ICC_IGRPEN0_EL1, ncpu,
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index 341a311..183c7f8 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -166,6 +166,7 @@ struct GICv3CPUState {
>      uint8_t gicr_ipriorityr[GIC_INTERNAL];
>
>      /* CPU interface */
> +    uint64_t icc_sre_el1;
>      uint64_t icc_ctlr_el1[2];
>      uint64_t icc_pmr_el1;
>      uint64_t icc_bpr[3];

If you're adding a new structure field you must also update
the vmstate struct in arm_gicv3_common.c.

thanks
-- PMM
