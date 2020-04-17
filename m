Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp326559lfm;
        Fri, 17 Apr 2020 04:10:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypLNpme8yDSZyKCja2ltZZOzV4vnVsE5UCn6/3cEDNojINDbJhlGb92gtWUZPZWiyeF7S6LH
X-Received: by 2002:a37:9145:: with SMTP id t66mr2565071qkd.314.1587121801232;
        Fri, 17 Apr 2020 04:10:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587121801; cv=none;
        d=google.com; s=arc-20160816;
        b=ejSux2PnYFIwTrxYiJQOWTifpBho4fX6XqO/+oPRrjE+WyvXkyD2biBSV6R/16mRnk
         Yg73i6L9EQ+LG/vKp7gl84J/X84ukLXUtVsuaZftrYS/F2gBXkqvm0qxjS0WwsfEnr0B
         xsQ9GDRkl8I5TSXI7r9b1/+2oSq33kJ3dDRY4c+4SEk3IiveT4cmOZpVVj+zqu8IopOj
         NV+gKrAUdr5Z5wV0mCjaduyYqGv7RmqQxSE4kkVFyXUn7pfooc7A/sYIb49QEGdYuxjl
         zgpytkA7z0jU6kVtGb4vuCZMcVBUu+4BsY2dc6AnnAJiHTA5VIy9xDZLHQo9qMuIGsE/
         eCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L+a6vh1vUZ/GYvIsQQJcWYuzro5d5IT5YKmZYXp+FtQ=;
        b=kk+tAPUG9is1GZ4FRulzTCsobe8sjTejja4Qq+3horV+Pno2k3Ab3r94Eh1pbORF4x
         lhifGRUGLKkLuLFQBPduD8Na/x+0mqnYc0FQ+Yks8KC0Dc7idnQUsoHELEOke2gO9Ai4
         V2K86ZbSquugwx3zbZBoQdMctDx3veECMhUVYs0Sk762hQBHvNzSDnrt/+3XSBh8+TPl
         E/rlJ9JmckvVnnX4ZpsRqocA+7Z8e+/xib32lgGqq1N1+O7nK88OYZnSXusbyjOIAK/x
         ekOz3OZVDvxbuZpXIQhLBFbClY94sUCFBe6BVSmvuPlZt4IXy722eqaeO3+LkHapQHO4
         Ln7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XCqdspfA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si7433476qtv.38.2020.04.17.04.10.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 04:10:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XCqdspfA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPOsi-0007HP-Ma
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 07:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jPOsa-0007ED-0H
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 07:09:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jPOsY-0002zz-Ht
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 07:09:51 -0400
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:42529)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jPOsY-0002zS-6H
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 07:09:50 -0400
Received: by mail-oo1-xc44.google.com with SMTP id e18so366548oot.9
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2020 04:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L+a6vh1vUZ/GYvIsQQJcWYuzro5d5IT5YKmZYXp+FtQ=;
 b=XCqdspfAJJJBHPIqDiPxZzbqhdRwD+rB0tkhAk28fZQHxCZVFvBPaqMFFsbcLEJMiB
 YYOdnZy03qKoWuShVn7AFN7teT96Lewsi3X8XengNmj7ZfpLMEhH9OGK9wtv96UMr+6N
 GbiyB4p6mR/3yIgHsupbVS/PyxuVeznzrxJHayE8RaH7zskEeOFPNVKvPFA3A0ifnMgd
 g9cjzhX8+kx/BnfvnbJ/DXAF4TaS61q7ai8fpaPWPEAJ/09OK7e8P/UcrJ0R4o1drUSt
 ucEwP2s3gpTWuIfiZqgmyvYw2nvaGQN5GMNxDALbncGAYU7PrzqY6Qd28qpF1VTMDQBl
 IYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L+a6vh1vUZ/GYvIsQQJcWYuzro5d5IT5YKmZYXp+FtQ=;
 b=g6Es84T0qhIRnX1mLedJtF41AprmDdgAGthiZtrWnv8DCXZfRgSQ331qKUZy2oW0Og
 0DeZs8OqwwPqIlXBaHKdOCPYK3xrqZzDQ8/K3nQtVRhVq3jtBQ8HXXqdNrKefQ8XWAuI
 19C/es14KJ/mmpnCmH0Cj6hTFecVao2hi7PZiMxVBa/hXHbdLYD9JkBPI4CpMPvTaCws
 yrEMQOPAa6pkkefib+uJfu1w5q3OGxrqqqIx/hdD2uN9YDfjJPgfZNTLQsHkvdI5tBiX
 mqhdYmxAF0XY1tmlTxB5aE8o119vJLdQ5mjsyXMeaWVG/ahvGuUGHSrfF5kZfInGE3Xe
 y8DQ==
X-Gm-Message-State: AGi0PuZgSVmv0UaO7y+fF403+I47+cGp7yY2hcdxCXwnUW/k8XlerlU+
 Z1cGaNYuxw1C41PiP6lsvjEDpNOIMQBoPCG6zTRIyDRmras=
X-Received: by 2002:a4a:890b:: with SMTP id f11mr2021652ooi.85.1587121789362; 
 Fri, 17 Apr 2020 04:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200413091552.62748-1-zhukeqian1@huawei.com>
 <20200413091552.62748-3-zhukeqian1@huawei.com>
In-Reply-To: <20200413091552.62748-3-zhukeqian1@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Apr 2020 12:09:38 +0100
Message-ID: <CAFEAcA9iUAtVvuv_8AOm0TkYzDD54QHZEL_DKRv_b_YpaVTJ_g@mail.gmail.com>
Subject: Re: [PATCH 2/3] intc/gicv3_kvm: use kvm_gicc_access to get
 ICC_CTLR_EL1
To: Keqian Zhu <zhukeqian1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c44
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5aGBkAMbbGAC

On Mon, 13 Apr 2020 at 10:18, Keqian Zhu <zhukeqian1@huawei.com> wrote:
>
> Replace kvm_device_access with kvm_gicc_access to simplify
> code.
>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  hw/intc/arm_gicv3_kvm.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index ca43bf87ca..85f6420498 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -678,9 +678,8 @@ static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
>      }
>
>      /* Initialize to actual HW supported configuration */
> -    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
> -                      KVM_VGIC_ATTR(ICC_CTLR_EL1, c->gicr_typer),
> -                      &c->icc_ctlr_el1[GICV3_NS], false, &error_abort);
> +    kvm_gicc_access(s, ICC_CTLR_EL1, c->cpu->cpu_index,
> +                    &c->icc_ctlr_el1[GICV3_NS], false);

This works at the moment, but I'd rather we avoided looking into
cpu->cpu_index inside the GIC code. The cpu_index is the overall
index of the CPU of all CPUs in the system, which is not in
theory the same as "index of this CPU for this GIC". The two
currently match up because arm_gicv3_common_realize() populates
its s->cpu[i].cpu by calling qemu_get_cpu(i), but in future
we might change that code (eg so that the board code has to
explicitly wire up the CPUs to the GIC object by passing
pointers to the CPUs to the GIC via link properties). So I'd
rather not have the internals of the GIC code bake in the
assumption that 'global CPU index is the same as the index
of the CPU for this GIC object'.

(All the other places that call kvm_gicc_access() are doing it
as part of a loop from 0 to n->num_cpus, so they don't have this
issue.)

thanks
-- PMM
