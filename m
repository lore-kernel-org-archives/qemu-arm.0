Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp336039njb;
        Wed, 3 Jul 2024 20:08:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUsFlZ5c0I7w2gyujTLO77mjgLKzVa++YZUY+DCkPmM3outpm/yzRAQ1rrp6Qb2KB0olklgg61T84OwJeUZjiFljcnELlO
X-Received: by 2002:a05:6a20:2591:b0:1be:d1bf:a371 with SMTP id adf61e73a8af0-1c0cc8928bfmr316758637.33.1720062490541;
        Wed, 03 Jul 2024 20:08:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720062490; cv=none;
        d=google.com; s=arc-20160816;
        b=fhGT/RBf70gPblL/MtkTvM1iGoZz+8Bs0PSawsHHANNlnshIu9zHtFWujT0y5P5WlW
         vEqYDh6OXV+qB2oF02Y6X2zCuXamMz642wwB9+uSixlZ9P6PoZAAA3M+543YBVMUfjoq
         /19LRhJz6aYv7Bl/YrCY/9SZWZ0f7nfZbCiXurUlWMfmVxwg2pvqRSOQUPOUhM9SLFne
         O5Uj1dkVPmrf0MfHMCYEaAwpE+WajB8KnglnTAWp7lFFcPfUDMAd0zxyDdZhNLFcYkCC
         swvS9bOKE9sgCVMazFTQ0TSlXKGAZohddKe4nEdIguh7Bs44Al10/FhSV2VYDwmPRTDq
         vWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=VHiSBZnxS40GSLKvLVKSV6Nxm0QoNiS8xCzamFxaQ3w=;
        fh=IM8R08qb86NnaItUTBCPBEszi2gT7RrzrlnYBkLHcPU=;
        b=fsCDSmcH/yN90T/Bl6hzrD3n5bL4fJH/gpwNdYMMnU0bmkj33VkbYqBuQDlHTPpg/g
         Sq7Xyqxo595/RjsIepw/r7cwWANDMUmmLYRSU4I5XnRG7rFfHurwZup2CWOF0Btvi5SR
         NdkhxdN3FzUkAKJ7m4/J/u5Bcj28qFq8DHJzPctwGUQqOF6K6k0LZCpCqZKatcLxB0cf
         hVVY5K8vpygOr+drxf35EAfmRXor+CFR3N3A49YmIOIIwwZ4zt1ExEysbT9MHhraME8d
         HhJlbwMD9Ii/mbAf4LQxmIiRyhsHgYZr7dndnGxrUM0g2n0/yORaSUbSIhynYkmmk5OL
         H4jQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=i5Y8IyXa;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1fac1303027sor113702975ad.3.2024.07.03.20.08.09
        (Google Transport Security);
        Wed, 03 Jul 2024 20:08:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=i5Y8IyXa;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720062489; x=1720667289; darn=linaro.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHiSBZnxS40GSLKvLVKSV6Nxm0QoNiS8xCzamFxaQ3w=;
        b=i5Y8IyXaxIw643F9DKJPLIryltsNJ8Hj/Hj4VtVqRPvX+5lAQaevAHbVt+EC1Y3XXY
         3NZt28s0c7BzsF/biycw7VKPZ+xGRu3/yL6dTixuO1d8CRhNzP0Rmv+9BfYrFrIwUFV4
         jXJF8TjkTSq/xUJkoSiP4YMUKHp5du2XcX/9aijfGnxlt72IN+rutlbeeUZir8iPc6vV
         nCYPb0cyCeER27nhdIzQSuX+6/1eOaDwy1zmsG9/YZu4wckInVHXV8TQ+m6i81THVV2r
         nz9fFvzLsdaOWdUp7jiNLNuW5suo8d05b8PQtpUmhj5gVcb1myffSOVCAxfNd8gn4BwM
         Zrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720062489; x=1720667289;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VHiSBZnxS40GSLKvLVKSV6Nxm0QoNiS8xCzamFxaQ3w=;
        b=D2HA0AEt2FwmPhBlmHG5xgTBfuQ8O0cbcEa7tLCY1TxUgMt24B4yRYe7h40VIkQbZq
         Zrqtls6CA1V8Ux/lELT7fJx6epDci1cFrxrRypt10ojZubFTmkmGTNO9DVcmybWvMAM/
         Ewnv5bXkdtB02V2J+EJuWMuvMGUpvjabJ1ZqkalEgv1piaYPUHueoVTSz1iatecEoJ71
         JhucJIN75Kng8l7EkDk1xoTmv5rI/mOmmcTyAEcrdWdAEakTnwPZV0K64aaP791sHxkp
         wl1aJD0A53r8ccGY8PNak3pb5PJphUFkMr7N+41QMMDXGQu0iEjmNOW0wCwEfE+L4RCj
         v5EA==
X-Forwarded-Encrypted: i=1; AJvYcCWePIGBiL0s1B78qw4pRZLFai9ceV6yKjePLjWnhcyamjkxviIObuMqjc55CjuyUZgrwHhueVzTNO+kp2GGJR/CG3r2kkqYLt0WBk0/r14hdCj6N8A3hkPTF2U/0Clnx/mqrWlEBYx31c3WEZ8Ub4q4MIxIKkrAOOkcVJGms0Kt22Q0EZ7/aXQcjIl/vsOKR1fEIAivgrkzV0+mE7s/5oUL54hP255Q0ctmj2I=
X-Gm-Message-State: AOJu0YywoYmAJYxgJRSMtKQxo1IkxV4SUSfVNsjHJsadOZw+Hfp0dEz7
	f2nSfmGl3b2KdsT4L5WqGTcsUGjlg/gq2g7DBkmPcfEIWG+woDU0
X-Google-Smtp-Source: AGHT+IHAw52xSXmCVkVsSv9/zWXJAZpGYwx7sSfiHkRI/9TRSsUYjdsGiDOu4FnjihuLnrxrUklBUQ==
X-Received: by 2002:a17:902:d484:b0:1f9:9768:ea61 with SMTP id d9443c01a7336-1fb33e05067mr4520595ad.2.1720062489397;
        Wed, 03 Jul 2024 20:08:09 -0700 (PDT)
Return-Path: <npiggin@gmail.com>
Received: from localhost ([1.146.95.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10c8f81sm111305105ad.28.2024.07.03.20.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 20:08:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jul 2024 13:07:50 +1000
Message-Id: <D2GF9A9AJO02.1G1G8UEXA5AOD@gmail.com>
Cc: <maz@kernel.org>, <jean-philippe@linaro.org>,
 <jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
 <philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
 <ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
 <gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
 <alex.bennee@linaro.org>, <harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <shahuang@redhat.com>, <zhao1.liu@intel.com>,
 <linuxarm@huawei.com>
Subject: Re: [PATCH RFC V3 08/29] arm/virt: Init PMU at host for all
 possible vcpus
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Salil Mehta" <salil.mehta@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <mst@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-9-salil.mehta@huawei.com>
In-Reply-To: <20240613233639.202896-9-salil.mehta@huawei.com>
X-TUID: nqWrCQjNg4yu

On Fri Jun 14, 2024 at 9:36 AM AEST, Salil Mehta wrote:
> PMU for all possible vCPUs must be initialized at the VM initialization t=
ime.
> Refactor existing code to accomodate possible vCPUs. This also assumes th=
at all
> processor being used are identical.
>
> Past discussion for reference:
> Link: https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00131.html

I guess it's something for the ARM people, but there's a lot of
information in there, could it be useful to summarise important
parts here, e.g., from Andrew:

 KVM requires all VCPUs to have a PMU if one does. If the ARM ARM
 says it's possible to have PMUs for only some CPUs, then, for TCG,
 the restriction could be relaxed.

(I assume he meant ARM arch)

>
> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>  hw/arm/virt.c         | 12 ++++++++----
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ac53bfadca..57ec429022 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2045,12 +2045,14 @@ static void finalize_gic_version(VirtMachineState=
 *vms)
>   */
>  static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysm=
em)
>  {
> +    CPUArchIdList *possible_cpus =3D vms->parent.possible_cpus;
>      int max_cpus =3D MACHINE(vms)->smp.max_cpus;
> -    bool aarch64, pmu, steal_time;
> +    bool aarch64, steal_time;
>      CPUState *cpu;
> +    int n;
> =20
>      aarch64 =3D object_property_get_bool(OBJECT(first_cpu), "aarch64", N=
ULL);
> -    pmu =3D object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
> +    vms->pmu =3D object_property_get_bool(OBJECT(first_cpu), "pmu", NULL=
);
>      steal_time =3D object_property_get_bool(OBJECT(first_cpu),
>                                            "kvm-steal-time", NULL);
> =20
> @@ -2077,8 +2079,10 @@ static void virt_cpu_post_init(VirtMachineState *v=
ms, MemoryRegion *sysmem)
>              memory_region_add_subregion(sysmem, pvtime_reg_base, pvtime)=
;
>          }
> =20
> -        CPU_FOREACH(cpu) {
> -            if (pmu) {
> +        for (n =3D 0; n < possible_cpus->len; n++) {
> +            cpu =3D qemu_get_possible_cpu(n);
> +

Maybe a CPU_FOREACH_POSSIBLE()?

Thanks,
Nick

> +            if (vms->pmu) {
>                  assert(arm_feature(&ARM_CPU(cpu)->env, ARM_FEATURE_PMU))=
;
>                  if (kvm_irqchip_in_kernel()) {
>                      kvm_arm_pmu_set_irq(ARM_CPU(cpu), VIRTUAL_PMU_IRQ);
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 36ac5ff4a2..d8dcc89a0d 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -155,6 +155,7 @@ struct VirtMachineState {
>      bool ras;
>      bool mte;
>      bool dtb_randomness;
> +    bool pmu;
>      OnOffAuto acpi;
>      VirtGICType gic_version;
>      VirtIOMMUType iommu;
