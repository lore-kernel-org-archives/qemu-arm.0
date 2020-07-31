Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3600568lfy;
        Fri, 31 Jul 2020 07:54:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWyddixy0ODfMbOoU/L/vKGj0+smhA1H4REjzWOJZ68dNc/OXe+iQZMW1BcU1a0fKVAhdy
X-Received: by 2002:a25:814a:: with SMTP id j10mr6980664ybm.374.1596207271741;
        Fri, 31 Jul 2020 07:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596207271; cv=none;
        d=google.com; s=arc-20160816;
        b=FkdHBQRjzr7Jfm+YvrDAZ7PSf93cJnGmlQ0AeSFzp/s91IyAGWAcTc9XMh07aN+1KJ
         V0k91Yrqj8nkbEoj6yLb3nqKclFmEAXFCTcNeXTufrUdcRUrMYpNgmF8DpW3LF3j+zXy
         u1GDNwgeX9UXkcdue+O11y0UWppDy+3W7uJGfunRbSX6yH354fHiKwyIV86SYaWftDRr
         StImPJQE9/Id0SQ0DUNB+i8huW2WbF9qS+V5nspy7U1G7PFe/8l3+/Rby8qOzaA3ZbnS
         WmDm6A6/Uu0mvAm1mZnooqrmyc8CXDi+mn9wp4xrslWladmmckSzE7ZO3N0tv8LkDTIA
         +IZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HL8rbpItYh57rQFmhUGenD+1qALQXnHJtL9E29zbp44=;
        b=N2mzIX8HjOzoTKnkuMS+4mQJNDMeTPoOWXc5wlXn2D8ytTPJcZu8pRKxm2Mkd4NhJ8
         cUzMJ0Kv420n8+OAFNwBlMki74aWN69AoO4fJV7dxYwDEm6fTdAAXxgOv6VU6mgqJHzn
         NosfHsy6bbnpjgkIAs2+zK/XWpUj7Hw/bDfhm9k8lqvhy17ZtY7qKnyZUW+8NvtN43V3
         rVRMGIdjx/7tyHrX89/yjsikCKNWyjfqrqKjJ6Wo/fFRUcaWTfdk6gxQFWOVsLtbYvKN
         OLTWMARxOJ62THMpaU2NRP4EP6EjSRzPziwWEwaAHWGV2jqT3W9+qOouFy7QSDh6VlbU
         wfdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LO2lyY5c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si10761657ybt.216.2020.07.31.07.54.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jul 2020 07:54:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LO2lyY5c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1WQZ-00078z-4K
	for alex.bennee@linaro.org; Fri, 31 Jul 2020 10:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k1WQQ-000785-Iq
 for qemu-arm@nongnu.org; Fri, 31 Jul 2020 10:54:22 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k1WQO-0001eG-2O
 for qemu-arm@nongnu.org; Fri, 31 Jul 2020 10:54:22 -0400
Received: by mail-ot1-x344.google.com with SMTP id l26so6283158otj.4
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2020 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HL8rbpItYh57rQFmhUGenD+1qALQXnHJtL9E29zbp44=;
 b=LO2lyY5c5TytM2PBSAqntH4qzLGqBjLHvSomlgJF2xLaI9xKl37ZutbrHMFEdog9aH
 Jn2LWnqBS9EcNnm7ZdOLzaK1VUdY6cCWQ+Trcn3mNYRgwauMBZ+hV4kiMOFxOprFkqkb
 Pge6KlgupI+TtYxz0qj3DryaqhAJyBaG8jv1bGKQ8qN1LRv37n0qZgRHK+fVwmlVEEio
 yjPfe0cq4x+OeI5ScjTa/X4zI2yOY+nNGcuTdabKjKMjUvDl0S2KEBpOxUWQ1iAcSVi3
 N087xRg7yRoxTxhfCyfM2drlufjbGJIVFFkTe/AESVrlLnnyFI674jj+L0sKXstsGecx
 BFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HL8rbpItYh57rQFmhUGenD+1qALQXnHJtL9E29zbp44=;
 b=MB8q65tH3rgX/DbQdJhtKOKDIkfC8zwsza9q1IAjPCl1fhxLJCEkPmiRaXMWaZqKEb
 LNC5jE19eKLVRIZV3pvo2eYHbxJ5g5v8dERnMxzk9ay7Jm8bFisG47ct1H0uUH5yzf8m
 v3/6nEqnjDYdhPeYmFm0zoYn1vBB7SHU+6ZuYDgO1citBt0N9y+fexqBlpMKQGC0/ebo
 9w1qxcgJapaoGeHRyNvNQpMg6SrYnbnTNXqfQZN8mPpYL+p+y54E4TTjeHnPsAUIShCk
 8FEJpnGTZQFLIsyT9nw2xJhvaNtW/OFHAwcezlmJK6r0z5IGB4cPIpoq40jcMKQtuGhd
 fIMQ==
X-Gm-Message-State: AOAM531e1xaWPbauyC/zv+He5IY6ZKriWh5A8ELbdF25UHMxYptC9Gt6
 giqFbZH3Fhc6/6tiA3k4QaUly9DpZZ7aMH3LcQ24Fw==
X-Received: by 2002:a9d:5504:: with SMTP id l4mr3087480oth.221.1596207258592; 
 Fri, 31 Jul 2020 07:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200711101033.47371-1-drjones@redhat.com>
 <20200711101033.47371-4-drjones@redhat.com>
In-Reply-To: <20200711101033.47371-4-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jul 2020 15:54:07 +0100
Message-ID: <CAFEAcA8h+6btvjvx=j5v7Gn12+bros_UgFScKHaWVxh0dmi-Qw@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/arm/virt: Implement kvm-steal-time
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DtAj+MNzMjq5

On Sat, 11 Jul 2020 at 11:10, Andrew Jones <drjones@redhat.com> wrote:
> We add the kvm-steal-time CPU property and implement it for machvirt.
> A tiny bit of refactoring was also done to allow pmu and pvtime to
> use the same vcpu device helper functions.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Hi; I'm forwarding a couple of comments here from Beata,
(whose secondment with Linaro is coming to an end so she won't
have access to her Linaro email address to continue the conversation):


>  static void virt_cpu_post_init(VirtMachineState *vms)
>  {
> -    bool aarch64, pmu;
> +    bool aarch64, pmu, steal_time;
>      CPUState *cpu;
>
>      aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
>      pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
> +    steal_time = object_property_get_bool(OBJECT(first_cpu),
> +                                          "kvm-steal-time", NULL);
>
>      if (kvm_enabled()) {
> +        hwaddr pvtime_base = vms->memmap[VIRT_PVTIME].base;
> +        hwaddr pvtime_size = vms->memmap[VIRT_PVTIME].size;
> +
> +        if (steal_time) {
> +            MemoryRegion *pvtime = g_new(MemoryRegion, 1);
> +
> +            memory_region_init_ram(pvtime, NULL, "pvtime", pvtime_size, NULL);
> +            memory_region_add_subregion(get_system_memory(), pvtime_base,
> +                                        pvtime);
> +        }

B: I'm not sure whether it wouldn't be useful to have the area
allocated with size determined by number of VCPUs instead of having
pre-defined size.

> +        if (vmc->kvm_no_steal_time &&
> +            object_property_find(cpuobj, "kvm-steal-time", NULL)) {
> +            object_property_set_bool(cpuobj, false, "kvm-steal-time", NULL);
> +        }
> +
>          if (vmc->no_pmu && object_property_find(cpuobj, "pmu", NULL)) {
>              object_property_set_bool(cpuobj, "pmu", false, NULL);
>          }
> @@ -2528,6 +2558,7 @@ static void virt_machine_5_0_options(MachineClass *mc)
>      mc->numa_mem_supported = true;
>      vmc->acpi_expose_flash = true;
>      mc->auto_enable_numa_with_memdev = false;
> +    vmc->kvm_no_steal_time = true;
>  }
>  DEFINE_VIRT_MACHINE(5, 0)
>
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 54bcf17afd35..b5153afedcdf 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -80,6 +80,7 @@ enum {
>      VIRT_PCDIMM_ACPI,
>      VIRT_ACPI_GED,
>      VIRT_NVDIMM_ACPI,
> +    VIRT_PVTIME,
>      VIRT_LOWMEMMAP_LAST,
>  };
>
> @@ -126,6 +127,7 @@ typedef struct {
>      bool no_ged;   /* Machines < 4.2 has no support for ACPI GED device */
>      bool kvm_no_adjvtime;
>      bool acpi_expose_flash;
> +    bool kvm_no_steal_time;

B: It is slightly confusing : using kvm_no_steal_time vs kvm_steal_time

P: I have to admit I get confused about which sense this flag
should have. I think the sense of the flags in this struct is
"the false case is the one that the older virt boards had",
so original virt didn't have an ITS or a PMU and so we have
no_its and no_pmu. Similarly here old virt didn't have steal-time
and so we want a no_ flag (ie the patch is correct). Why
kvm_no_steal_time rather than no_kvm_steal_time, though ?

>  } VirtMachineClass;

> +void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa)
> +{
> +    struct kvm_device_attr attr = {
> +        .group = KVM_ARM_VCPU_PVTIME_CTRL,
> +        .attr = KVM_ARM_VCPU_PVTIME_IPA,
> +        .addr = (uint64_t)&ipa,
> +    };
> +
> +    if (!ARM_CPU(cs)->kvm_steal_time) {
> +        return;
> +    }
> +    if (!kvm_arm_set_device_attr(cs, &attr, "PVTIME IPA")) {
> +        error_report("failed to init PVTIME IPA");
> +        abort();
> +    }
> +}

B: I am probably missing smth but .. there is a trigger missing to
update the stats
and write them back to pre-allocated guest memory.
Looking at the kernel code the stats are updated upon pending
VCPU request :
in arch/arm64/kvm/arm.c:
static void check_vcpu_requests(struct kvm_vcpu *vcpu) {
        ...
         if (kvm_check_request(KVM_REQ_RECORD_STEAL, vcpu))
                kvm_update_stolen_time(vcpu);
}


thanks
-- PMM
