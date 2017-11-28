Received: by 10.223.159.82 with SMTP id f18csp3070645wrg;
        Tue, 28 Nov 2017 08:08:28 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZq4Lf7Q26j9kqLkz6E3LmjbKNXXoWXW0BO8UkPC1tHRV6PMrsferHRvHcLM73vxA3DLng/
X-Received: by 10.37.95.73 with SMTP id h9mr24240862ybm.332.1511885308725;
        Tue, 28 Nov 2017 08:08:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511885308; cv=none;
        d=google.com; s=arc-20160816;
        b=vnfhM7/huGZC3eWri3fUfWQ/hw/YwMHUy5iVwZgGnetTfXK5oRcwubmcsPkh5Kik//
         eMYbwSQd8+R5UaM9JFrMNqRyg/Izn0jGotz12nsiNHGCtOFnvdPhh29hqxo+J8aPJAxP
         Ggd2ksvd5o2SoyUMC4xYbIj0u1CkQ3DgW1YVcqwKncJxhoRGVNY/PcLsYQpmzETxXPtM
         Srw0CHkWXApJQQShuwkr+HmATxP6sPRXOoUhabqru8vai4CpeS7gJx70Jg7IFSwA66y4
         KwufrCZeugAuYBi7o/lZGXKLcMvILjPExY+mbO+rDSZXt5bZvsWAO7vnYdI0IL6EWjQ3
         cukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=WeTXPrL6lI8NrgfIk6uFYBNPNVJ7Ic4tOn5VB/3cDA4=;
        b=VCxCfPolhx8dB4hFymc2Avz3IgIgzb2At2kkuaQxoHZCyP4JS1Pgqt3wRYfraSy6he
         jKdovUHcTbmIUXh4PIqXpS/SNrjlkpS7WTSkPcOsPJIPHfLuRIA7YwuQGHoEKst0haOq
         GkGrIlygTuSyRSPoDiqrEIhUv6DRq766se5yj2rkZIxoKFXx8yrxVJq8MLwZM/w+AVg+
         tqsrbtCoImUtOAwBZ0PDVGwSZ+tmBc55rvIr2XnUHk2OhS0EY1mSVDCvs/O0H37H3OTM
         dcfQE/c73yYrxmiMzegGbT59kOUQFjiSVyQNaWp6JWSqS7hWy3NTr9jgRshiLVy9Y/PS
         d4Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RSO5RhF2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q206si5552881ybc.807.2017.11.28.08.08.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Nov 2017 08:08:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RSO5RhF2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38671 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJiQu-00005N-4p
	for alex.bennee@linaro.org; Tue, 28 Nov 2017 11:08:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eJiND-0003GX-KL
	for qemu-arm@nongnu.org; Tue, 28 Nov 2017 11:04:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eJiN8-0006b0-14
	for qemu-arm@nongnu.org; Tue, 28 Nov 2017 11:04:39 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:43340)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eJiN7-0006aj-Tq
	for qemu-arm@nongnu.org; Tue, 28 Nov 2017 11:04:33 -0500
Received: by mail-ot0-x243.google.com with SMTP id y10so279251otg.10
	for <qemu-arm@nongnu.org>; Tue, 28 Nov 2017 08:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WeTXPrL6lI8NrgfIk6uFYBNPNVJ7Ic4tOn5VB/3cDA4=;
	b=RSO5RhF29+eA6C9mMvZ2zOkC/g9TKyoGwvuCIdh9ElzwxrLSkHxIn0dWcRT+Zuzop0
	R4DhQB+aU8gx2Abr1Yf2t6W4FgFJQCmEzZHGWTDggwoeKcUBQef8xm3zmWQpDEDr/6Jf
	3LU/gMpkByarW+nNn32OmMCggXI8AkwB2vBNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WeTXPrL6lI8NrgfIk6uFYBNPNVJ7Ic4tOn5VB/3cDA4=;
	b=BFkarp3hCXGG/JXf2ZkdmDKZ8kzPd5lPc2GvCEvZIISPNEUFT+qvO0sYOf3BgMtHNS
	IqIIcj14szbs/9A5UMtk4TR7I4QK3Cy4TONPJUHecpkGS8nX3xgWi+pv5Vlh3yMixOw1
	oEWYWalOf/DnBTdi3HgTZDUPIDoczJdxomIF9mdRDQHpehsLNTys+p12XnDE/qcTy0az
	rMQNKWdYg3ptwGqOu+4UWVZC47Y9CsfOaGsYF810fS6ayIbvwFfHGnYilcrvedCBeoxV
	52/a018VTn4X3B8wUcrZs7+h4FmzGPn9cCfM1uPmoSnl3hTmLO6Bb/2SNXzVnXLfDrR/
	odYQ==
X-Gm-Message-State: AJaThX7bJZX6Te4L1GEgOlz0z1bQJXfBsiyLziMumoJPC4OyKfdsif/v
	goSFT4G04xHwmwF38+qanfxVUVertAoXtSsDTDoJ8w==
X-Received: by 10.157.90.6 with SMTP id v6mr28594084oth.54.1511885073073; Tue,
	28 Nov 2017 08:04:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 28 Nov 2017 08:04:12 -0800 (PST)
In-Reply-To: <1511883692-11511-5-git-send-email-eric.auger@redhat.com>
References: <1511883692-11511-1-git-send-email-eric.auger@redhat.com>
	<1511883692-11511-5-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Nov 2017 16:04:12 +0000
Message-ID: <CAFEAcA__YJ5KPMk-oo4OixQ21ssTiyNy1nnn+UqDLdzSNhVojQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH v6 4/4] hw/intc/arm_gicv3_its: Implement full
 reset
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
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SxiX9YlrTyFn

On 28 November 2017 at 15:41, Eric Auger <eric.auger@redhat.com> wrote:
> Voiding the ITS caches is not supposed to happen via
> individual register writes. So we introduced a dedicated
> ITS KVM device ioctl to perform a cold reset of the ITS:
> KVM_DEV_ARM_VGIC_GRP_CTRL/KVM_DEV_ARM_ITS_CTRL_RESET. Let's
> use this latter if the kernel supports it.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/intc/arm_gicv3_its_kvm.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index 1c663ac..bf290b8 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -204,7 +204,14 @@ static void kvm_arm_its_reset(DeviceState *dev)
>
>      c->parent_reset(dev);
>
> -    error_report("ITS KVM: full reset is not supported by QEMU");
> +    if (kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
> +                               KVM_DEV_ARM_ITS_CTRL_RESET)) {
> +        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
> +                          KVM_DEV_ARM_ITS_CTRL_RESET, NULL, true, &error_abort);
> +        return;
> +    }
> +
> +    error_report("ITS KVM: full reset is not supported by the host kernel");
>
>      if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
>                                 GITS_CTLR)) {
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
