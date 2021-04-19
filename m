Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1136298lfb;
        Mon, 19 Apr 2021 05:49:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw93DFMScipFHaDXzwcpYrCL16vD8H6p5M0HIZKzNSsOpsdUQGL8b46SAuW2YaFCYg0aJdh
X-Received: by 2002:a02:8788:: with SMTP id t8mr5842393jai.135.1618836547070;
        Mon, 19 Apr 2021 05:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618836547; cv=none;
        d=google.com; s=arc-20160816;
        b=h1cWZzb2m/WvL6vmqdEQM191Yg+H9ujrYs34Wz5m9vH1SrC6qPfa0qNWqBG/5TGlPg
         qiSqSA6Ongoy8wuJeZRss7DmbCrSlzfGjs7V57tYb3D86uwu7NLCrFaJBKezIM/Onhhf
         3okdLq4AabjWbwghA99nT3rwztR0aXp0S3GOVaIk6dh6lwEz369sEeO3INBcJ4/ghLUu
         JOscIN+nWnuPKvcVYiisNCuV8bJd2rGEJjpJ+4kvWlMcVB6UDLVEVUGZIIaHFoMgaiP8
         mMswlkphNwAOiN4p4CRQ7jhxcJ1RTbg7mHtsMClOfVq8o6S7DpVgCp19eQ8hMyxqbBZy
         4mKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BZ9NtiNKsi2EtKnVhl1Wkgcf7o2uFz8HZkLJVddYhCI=;
        b=k9/QCckVqSxH8fGkVfQapMcVDjfjj4/MAqIIhaLPOHfyhKvRKMpOB9QePv2+Fir5sX
         /Bz8phthUpWBykydZm/eYzmnwBzE/4oGE+uTPtpBpHl3p2Lq+aU8hJHnNkONSsqdC7Vs
         occdlRz/vY5wgbOISIPhCRTZYSkOr/gGQ0cUynbJzo5ESPtM99qXgpr/AM5hR39YAe0Z
         74t775tm7E7zs3Oyahgjau7RdMoxQlXcHA+FLEQ/mUIsbIMGMjCBdWV6wcBUVP0Rcn8z
         VGLql/2OaCazPdV+cokZXzoGoMo1tI3v1VmuBCxfNPStkw0+4vQeWE2rKx8xzrcHpeYu
         J3aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rk3CnaAt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si15997487jak.73.2021.04.19.05.49.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 05:49:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rk3CnaAt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYTKs-0002c5-Ef
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 08:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYTIr-000122-52
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 08:47:01 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:43745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYTIp-0003JU-GG
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 08:47:00 -0400
Received: by mail-ed1-x534.google.com with SMTP id e7so40427716edu.10
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 05:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BZ9NtiNKsi2EtKnVhl1Wkgcf7o2uFz8HZkLJVddYhCI=;
 b=Rk3CnaAtUqukoTi3O3AyjmUd6bUXNvtBBti/dFzUUDaapGoPIf5pPY3NIVncmyzegU
 rOUMQpUa/911SqjRs308xGtUsTIYrEaNrNBsaEItDTFARvuI2zTMzPa75yqeMyXwyLnR
 NZkVSQyWRLfxp5WqjY9QD+eIrEGS/6OG5s0tldSnTtQMxAu81zsnfs3xYaf0pJGac0ke
 mXZFHdS/Y/sW/5olf3lERloaiU7JMgv2is9DQqFeSm9ig2vmmgSA2qAf7M53sDhoUGEI
 z5+VCWWO6qSSzMp2po3FGQ8jwt+35IRuDI/d90Q382NfjgwYCtawZIH4N9xDeE7JbWli
 CasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BZ9NtiNKsi2EtKnVhl1Wkgcf7o2uFz8HZkLJVddYhCI=;
 b=EGBe3RENZ7U+OUDfaJ/T3yt7m/PDmXD6xcFgFyDsCfdLHKOBXIZRBztEfwOWdhNKvM
 5yPJLFjij40+mykUCB+nSObxPKv19EC6RrMtsiO8pSutxG82lLMc7VH1IJd8+m8KITk3
 A467qQfwhtSZoCJZnbp2UJQZrwFJovzQX/k9MYW3+hXcGqATqNb9JffZZ/x+p3LvSc5D
 yL30Hv3Ud6UdBbBOGnwSCaKM+KcaZ4fuHdY1T2w9CpMoHzwiY0H/aeFr9rYMToLAKG0L
 nNwqsUQXs03YXVX/y66Z/t6THSb6crWx7mRVQio85j/QHUIprugU4RVjch2qevibEKu4
 X0pw==
X-Gm-Message-State: AOAM533usPOAjuAYrHyoYCd/P8PRmqKh3d58pJo7ZlnxB8qkAPS74biG
 cpk2lnD5eIB0pcOPSUMVsxExZafqtWpgeRirBvWnJAdek4c=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr25390167edt.36.1618836418060; 
 Mon, 19 Apr 2021 05:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
 <20210401024152.203896-9-shashi.mallela@linaro.org>
In-Reply-To: <20210401024152.203896-9-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 13:46:06 +0100
Message-ID: <CAFEAcA_0xrjGn3WSL4Aoe+nneh4Yk3tg+d5N95GGN779M6qQYw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] hw/arm/virt: add ITS support in virt GIC
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /NuKqhmM5999

On Thu, 1 Apr 2021 at 03:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Included creation of ITS as part of virt platform GIC
> initialization.This Emulated ITS model now co-exists with kvm
> ITS and is enabled in absence of kvm irq kernel support in a
> platform.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/arm/virt.c        | 10 ++++++++--
>  target/arm/kvm_arm.h |  4 ++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index aa2bbd14e0..77cf2db90f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -622,7 +622,7 @@ static void create_v2m(VirtMachineState *vms)
>      vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
>  }
>
> -static void create_gic(VirtMachineState *vms)
> +static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
>  {
>      MachineState *ms = MACHINE(vms);
>      /* We create a standalone GIC */
> @@ -656,6 +656,12 @@ static void create_gic(VirtMachineState *vms)
>                               nb_redist_regions);
>          qdev_prop_set_uint32(vms->gic, "redist-region-count[0]", redist0_count);
>
> +        if (!kvm_irqchip_in_kernel()) {
> +            object_property_set_link(OBJECT(vms->gic), "sysmem", OBJECT(mem),
> +                                     &error_fatal);
> +            qdev_prop_set_bit(vms->gic, "has-lpi", true);
> +        }
> +
>          if (nb_redist_regions == 2) {
>              uint32_t redist1_capacity =
>                      vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
> @@ -2039,7 +2045,7 @@ static void machvirt_init(MachineState *machine)
>
>      virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
>
> -    create_gic(vms);
> +    create_gic(vms, sysmem);
>
>      virt_cpu_post_init(vms, sysmem);
>
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 34f8daa377..0613454975 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -525,8 +525,8 @@ static inline const char *its_class_name(void)
>          /* KVM implementation requires this capability */
>          return kvm_direct_msi_enabled() ? "arm-its-kvm" : NULL;
>      } else {
> -        /* Software emulation is not implemented yet */
> -        return NULL;
> +        /* Software emulation based model */
> +        return "arm-gicv3-its";
>      }
>  }

This is OK as far as it goes, but I think we need to add the
versioned-machine support so that only "virt-6.1" and later get the
new ITS, and "virt-6.0" behave the same way (ie no ITS) as they did
in older QEMU versions.

thanks
-- PMM
