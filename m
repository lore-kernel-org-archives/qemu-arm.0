Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4678680ejc;
        Mon, 6 Mar 2023 06:03:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+L8p6BdQE3NFbEPGNc6zFvDEw5mX9zPllojGe/2sZdn6UBfhUI99Jx2HoUG+ZHZzh3Fdw0
X-Received: by 2002:a2e:a58a:0:b0:295:c377:3eed with SMTP id m10-20020a2ea58a000000b00295c3773eedmr4383686ljp.21.1678111391458;
        Mon, 06 Mar 2023 06:03:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678111391; cv=none;
        d=google.com; s=arc-20160816;
        b=QHFBX6gKLuYaojC41g1LBiajjveMaG8BzQCN01fDptFp5iBh3jotJswPLmv7cU8CnO
         SFZ2VYqdHScFkq/2IQEy0pH8+GFhxeJDqQ6a8FeUwACb0WNWU2N6nMFTETuZugsZ4I6I
         FetG0rHDsZAqQV2GhMOHK5DJnOzFQvvcKtKPJFdgPjV4tZroPuvL12PqEctzPrdEHoTW
         xL599l/ql+mBQo5W7Iok+D3BBZUYgDWMPWN2RMkqhOvL9Mqzm+UChEMfaWv4JIneey8H
         hRLFw74CFp1UAPHxNJeV6dTjPK+83W/KjEXMK7JBsqORL76LjPw+CM7pHW/nQuWZ0Qqy
         sdRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MyTch7R4kfBB/lbKYDGw6slk0pauoEKZsHvQ/AuD1uc=;
        b=msswgMo5om8xEgqzAhmvNi1LarLxRjXA2RpEjBPobU3ixbFoB2xs6v37unLvYcLSBD
         Az1x1Zk4yFD1vQJhMxZUQ3YvPcrhB/wTpyjABBupUU5HRs5TAO16as0UWa6IXZFR2VnN
         et58emwtTsRSrZu2SgJrmfOthML2pT1bgoucT62Jmv2wqdgbEonQtqONZEF1iUMTxTkH
         VqxgX845OkTqRCHz5uaJXwLW6dnSI0oRQEwciwnEgs3q4RCjPN+vElDzwmmiR8q+Gof5
         6LYz1zUCIQVgQpWqD8CEUzbQB+4JmieH8O/m4Z/Zmh5T7iuUInpd3sxstyFzzIN29gZj
         cp9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p4ahT7ve;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20-20020a2eb914000000b00293603a7d00si4004544ljb.274.2023.03.06.06.03.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 06:03:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p4ahT7ve;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZBQR-0001ZS-Qp; Mon, 06 Mar 2023 09:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZBQO-0001Ou-RT
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 09:02:48 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZBQN-0006fp-5W
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 09:02:48 -0500
Received: by mail-pl1-x62f.google.com with SMTP id n6so10411577plf.5
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 06:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678111365;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MyTch7R4kfBB/lbKYDGw6slk0pauoEKZsHvQ/AuD1uc=;
 b=p4ahT7veptnycPGoJ/fCrq79XF8AnaZVX5r8rFlRyAipo9dmt5y0TzF4zDD0gjZM8e
 J7gvQg3Rpl9eGZqXeifgFC0PdSATLpXfX42rBMPdHRW2YSmXLWzP34u/nmXy7iFonF9Y
 w+Cm6LIOUwi0QTzJVHky6p4qXct9wFik6WW512jtm/cNENCT9XsymUGYLalj1Wc4wSWp
 z/z/LhYga7Zh9jImJS9w1k0KFA7g15Zeu/PplAR7pOdRA8BMs+gUhJZFpdxmss7q+cq8
 v8/lzOIfKZD/MqyTINqAokM/LxKP92NHp0sDZRKMH9jeMpmlkhxbRVZ3EcGtmdo8ZXXQ
 H79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678111365;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MyTch7R4kfBB/lbKYDGw6slk0pauoEKZsHvQ/AuD1uc=;
 b=VNVmuU0KnS69qEZPgRbjiwVfYRyB1u/exfzDNH3mFIID8ifi+7T2Xif8OdrAqhZRzy
 t65TGnpB/dF3KC/Ex839GLN7PjHQGFTmdjTuCzh0wheSquppqMFJ0ioD65DDDXGh7mxn
 LUO5cu8lZkbGwU/x4BqRxZa3w0gOQkqVeofMIIiPow6O1fkftpb6kiWMv6r2OWG/CNSU
 8v6cbetVm3lXOo+F4hoDop5jbjTzfCEgiZXMPl2r+au4o+CKXjWbEuQI3tMwqrXDyF2M
 +ewew39O52RwtwolHj8SuTwwiP7uTWTBRMy9FDBXP39xaRNuwVYNfCf6jHX5gRZ16lKI
 cXaw==
X-Gm-Message-State: AO0yUKX4MWmQgOcBtgGbh5IZtZxcH+1bvs/o4SjVrnWNTpS+JmXlFZBU
 wnOeY8fwwcNClrsVRgujuQctdWT0mTQchfpqeRWnMQ==
X-Received: by 2002:a17:903:2581:b0:19a:8bc7:d814 with SMTP id
 jb1-20020a170903258100b0019a8bc7d814mr4194684plb.13.1678111365152; Mon, 06
 Mar 2023 06:02:45 -0800 (PST)
MIME-Version: 1.0
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <20230227163718.62003-3-miguel.luis@oracle.com>
In-Reply-To: <20230227163718.62003-3-miguel.luis@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 14:02:33 +0000
Message-ID: <CAFEAcA9ZzN0Xokh4kFcxtpv9hU512Km1EcaJHLG3JznVDF=Tew@mail.gmail.com>
Subject: Re: [RFC PATCH 2/5] hw/intc/gicv3: add support for setting KVM vGIC
 maintenance IRQ
To: Miguel Luis <miguel.luis@oracle.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 Haibo Xu <haibo.xu@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 719ytc5pGnz8

On Mon, 27 Feb 2023 at 16:37, Miguel Luis <miguel.luis@oracle.com> wrote:
>
> From: Haibo Xu <haibo.xu@linaro.org>
>
> Use the VGIC maintenance IRQ if VHE is requested. As per the ARM GIC
> Architecture Specification for GICv3 and GICv4 Arm strongly recommends that
> maintenance interrupts are configured to use INTID 25 matching the
> Server Base System Architecture (SBSA) recomendation.

What does this mean for QEMU, though? If the issue is
"KVM doesn't support the maintenance interrupt being anything
other than INTID 25" then we should say so (and have our code
error out if the board tries to use some other value). If the
issue is "the *host* has to be using the right INTID" then I
would hope that KVM simply doesn't expose the capability if
the host h/w won't let it work correctly. If KVM can happily
use any maintenance interrupt ID that the board model wants,
then we should make that work, rather than hardcoding 25 into
our gicv3 code.

> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b871350856..377181e009 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -759,6 +759,11 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
>              qdev_prop_set_uint32(vms->gic, "redist-region-count[1]",
>                  MIN(smp_cpus - redist0_count, redist1_capacity));
>          }
> +
> +        if (kvm_irqchip_in_kernel()) {
> +            qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
> +                              vms->virt);
> +        }
>      } else {
>          if (!kvm_irqchip_in_kernel()) {
>              qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 351843db4a..e2a6ff1b49 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -563,6 +563,7 @@ static Property arm_gicv3_common_properties[] = {
>      DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
>      DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
>      DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
> +    DEFINE_PROP_BOOL("has-virtualization-extensions", GICv3State, virt_extn, 0),
>      /*
>       * Compatibility property: force 8 bits of physical priority, even
>       * if the CPU being emulated should have fewer.
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 3ca643ecba..ce924753bb 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -22,6 +22,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/intc/arm_gicv3_common.h"
> +#include "hw/arm/virt.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "sysemu/kvm.h"
> @@ -803,6 +804,30 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>
> +
> +    if (s->virt_extn) {
> +        /*
> +         * Arm strongly recommends that maintenance interrupts are configured
> +         * to use INTID 25. For more information, see Server Base System
> +         * Architecture (SBSA)
> +         */
> +        uint32_t maint_irq = PPI(ARCH_GIC_MAINT_IRQ);
> +
> +        struct kvm_device_attr kdevattr = {
> +            .group = KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ,
> +            .addr = (uint64_t)&maint_irq
> +        };
> +
> +        if (!kvm_device_ioctl(s->dev_fd, KVM_GET_DEVICE_ATTR, &kdevattr)) {
> +            error_setg(errp, "VGICv3 setting maintenance IRQ are not "
> +                            "supported by this host kernel");
> +            return;
> +        }
> +
> +        kvm_device_ioctl(s->dev_fd, KVM_SET_DEVICE_ATTR, &kdevattr);
> +    }

So if I understand this correctly, the requirement here is basically
"tell the kernel which IRQ line is being used by the board code
for the maintenance interrupt", right? It seems to me that the
straightforward way to do that is to have an integer QOM property on
the GICv3 device like "maintenance-interrupt-id", and make the
board code set it (whether using KVM or not). The TCG implementation
doesn't care, and the KVM implementation can set it up in
kvm_arm_gicv3_realize(). Then you don't need to specifically tell
the GIC device that the guest is using the virtualization extensions.

thanks
-- PMM
