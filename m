Received: by 10.28.4.212 with SMTP id 203csp2866705wme;
        Mon, 16 Apr 2018 09:55:40 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/MbgmsyJhUQwdmLpZgf8vcSUFRzXB5Yi58Rsw8gCD4CNzsZcVq6wA1IgzVe133N9Ql3KD/
X-Received: by 10.55.112.199 with SMTP id l190mr18247584qkc.335.1523897740446;
        Mon, 16 Apr 2018 09:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523897740; cv=none;
        d=google.com; s=arc-20160816;
        b=HF+95KBA+jVHzJr6J3q7ppI8B6kRiCZQn6w+AWdoz/j7B4ONMBAB1XTVep9Tl+zjzf
         eEKzJ1nw4TO4GVNxtzbxiSXBNs/91kEdVhV4uGie/VQB6Okru97AKBHmXxLhIHliTcv0
         p+UoZM8bD+xpVJcEDDmD3PS5wSSqBHquCBlclDiaykmAS03gkN4toDzNE021YFC7h5GZ
         qaiH78oQoFmsMBW6wyZ2vqR86ESRF+N8xhuXXNyPNaz9CWugPgwd4Cc2jWAkB/h0yc2o
         gVMgiLZjH9CGmAMjnhq5qQ/KLPYSoI0H82qsfFxSgueJkf4xKxJvTaFZjeKav/XXMqYK
         rHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=iRPzhkQGpqPUIDRLseugKnt/RjSU6FrMmbbpo8gJRRw=;
        b=nVn4mJrD+vNmqxW1dp7/foc26M7gxkJ1ZZ7VrnbONZ+QEAGmeTBNoEb+tihzsnb7OJ
         SRgjzc1p8sLvxUfXe8wwosxnmYfBhC8i59OSP8Ipi6nm6Ia+btcnl/PfE8wteaeTEuU7
         hm92qsZyD6s2rEen6p7YrwReeaHR5KDghba/O3za6v43/axmFX63SFQCS8HIopcssyXI
         MI5TS/d2IZd7aZP+hjqOgPiyEJKmUC1Kau+wIP/WAnN1K4SCdX4DZyahAY0fFKcOy+ay
         4+utd9ouNcCjIuNmK1xSE7HnC1uAjzue/GwVH0ZnsyZqJ0dAYJxtG9nYpfy8tV3QcG1F
         nZiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZcIZQmal;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19si14503081qts.253.2018.04.16.09.55.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 09:55:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZcIZQmal;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58241 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f87Po-0004Pc-0p
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 12:55:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f87Pc-0004NY-Ok
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 12:55:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f87Pb-0000WO-PZ
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 12:55:28 -0400
Received: from mail-ot0-x22a.google.com ([2607:f8b0:4003:c0f::22a]:39098)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f87Pb-0000VU-FX
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 12:55:27 -0400
Received: by mail-ot0-x22a.google.com with SMTP id a14-v6so18165401otf.6
	for <qemu-arm@nongnu.org>; Mon, 16 Apr 2018 09:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iRPzhkQGpqPUIDRLseugKnt/RjSU6FrMmbbpo8gJRRw=;
	b=ZcIZQmalB0GYdOmByqpsak6OpnHLo5vmFpmfPjBW5CeVCjtMCyaXgcQRcarJePBcen
	Pooi+u3JOseF5gz9Yrbi/4tEpjsoGH17D/S8bntyolwz+VrR3H0faiZL6A62LwMqbqvO
	2RsKHyATJDOF40axBdi/225xqQ4CcbOK6WRsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iRPzhkQGpqPUIDRLseugKnt/RjSU6FrMmbbpo8gJRRw=;
	b=s+nSzk6UMEY1N0N6cmhldsXsjNiThu3stb9bqjMnJ/kXDc2oysdvEA66OE+6Q8icoc
	askv7eZ/PSqcYnEkjH+fr2ruZe0pvBp8H/CXYFTZMIabMLdCmxJxV5/TdsDfCPshduzA
	Bf7t6tzxZDEQpJKmnXsf3kRuFAtTAds2lG8WY893Tb3RPxMi8ieRL0YNuIvZcdCFbSUq
	AC2sY0n3AYk8Pt90XxU1P+/Nj4aBfy63cODVWJIB6FFyz0Wg/Aw593wWlZmedwr0OHNL
	fC7VUEzwtXo/kUkD0W8zc54LneomI0UhZ1V0w3O4zWyWV309PYZ69pj2yTgrOeubDeAP
	Yxnw==
X-Gm-Message-State: ALQs6tDtVki3brfyk4RismmGVm3ry7OXYzxacmpadtvuTER5OC+7m7TT
	WETWWmqPzI4bg9d9SzIyD0CgdYb1h43bUNKo5AeYitnR
X-Received: by 2002:a9d:4a90:: with SMTP id
	i16-v6mr4888978otf.294.1523897726320; 
	Mon, 16 Apr 2018 09:55:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 16 Apr 2018 09:55:05
	-0700 (PDT)
In-Reply-To: <1523518688-26674-15-git-send-email-eric.auger@redhat.com>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
	<1523518688-26674-15-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 17:55:05 +0100
Message-ID: <CAFEAcA8zMJvdRhf=f7O6GuRhqejbgb7moD43TPvVHJowBGeoug@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22a
Subject: Re: [Qemu-arm] [PATCH v11 14/17] hw/arm/virt: Introduce the iommu
 option
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
Cc: Christoffer Dall <cdall@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DCsXk2Rftd7W

On 12 April 2018 at 08:38, Eric Auger <eric.auger@redhat.com> wrote:
> ARM virt machine now exposes a new "iommu" option.
> The SMMUv3 IOMMU is instantiated using -machine virt,iommu=smmuv3.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>
> ---
> v9 -> v10:
> - remove no_iommu
>
> v7 -> v8:
> - Revert to machine option, now dubbed "iommu", preparing for virtio
>   instantiation.
>
> v5 -> v6: machine 2_11
> ---
>  hw/arm/virt.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 1799702..a3398d6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1560,6 +1560,34 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
>      }
>  }
>
> +static char *virt_get_iommu(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    switch (vms->iommu) {
> +    case VIRT_IOMMU_NONE:
> +        return g_strdup("none");
> +    case VIRT_IOMMU_SMMUV3:
> +        return g_strdup("smmuv3");
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static void virt_set_iommu(Object *obj, const char *value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    if (!strcmp(value, "smmuv3")) {
> +        vms->iommu = VIRT_IOMMU_SMMUV3;
> +    } else if (!strcmp(value, "none")) {
> +        vms->iommu = VIRT_IOMMU_NONE;
> +    } else {
> +        error_setg(errp, "Invalid iommu value");
> +        error_append_hint(errp, "Valid values are none, smmuv3.\n");
> +    }
> +}
> +
>  static CpuInstanceProperties
>  virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>  {
> @@ -1692,6 +1720,14 @@ static void virt_2_12_instance_init(Object *obj)
>                                          NULL);
>      }
>
> +    /* Default disallows iommu instantiation */
> +    vms->iommu = VIRT_IOMMU_NONE;
> +    object_property_add_str(obj, "iommu", virt_get_iommu, virt_set_iommu, NULL);
> +    object_property_set_description(obj, "iommu",
> +                                    "Set the IOMMU model among "
> +                                    "none, smmuv3 (default none)",
> +                                    NULL);

We should phrase this consistently with how we're describing other
options like the GIC version, so
   "Set the IOMMU type. Valid values are none and smmuv3"

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
