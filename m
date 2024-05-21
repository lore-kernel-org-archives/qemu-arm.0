Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1967260ejb;
        Tue, 21 May 2024 02:43:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVM6bFIzJgRIKSrovE0K73exnalhHmCqhiC6RJq4fc9iLzdMcu8dN3tpixkRg5506jksZFv6Jpbg4FyxpYcAVm6IBpAvpQ
X-Google-Smtp-Source: AGHT+IED4txodu/f7iCagB94pimbG1AMFQhw3f2kapDVkOQu5JaTzisCe8T2nHGeYGvRJr6oJTdf
X-Received: by 2002:a05:690c:6691:b0:618:8a27:f06 with SMTP id 00721157ae682-622aff908f5mr350969797b3.9.1716284628747;
        Tue, 21 May 2024 02:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716284628; cv=none;
        d=google.com; s=arc-20160816;
        b=Wr+prxVsbZPoKSEFREOcP6GoGDroJYERuy5sCAtovpmN9Tq2hYNeuMsmUXw79vDY7V
         6WhQiT3e+Vm60kuYvhTv6NabRBZ54f/R1+99J+saneDS2j6yo+1eUWSH6aG2KJ/ai6a8
         z6oWNHKKBJX63hE5uS5mD206lbRKsC7GL5in3R58Je/3nwxuv0BcZ8XkvewTQZs+ZchS
         iPc1HPD7VqLy0jP4pN6oUggVzZ29BLg1eic7F+GTGQGwhm9KorZLmrCTV9pmJGXtdrHd
         X74YxYhUg1km4oT/yfAzBqz1Dgq/2EUFH2O+xgTLqJe0n1rY0CiNE7g8XqrgIYP6kT7S
         S9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=7amI72qGHb9CShbmVHT3fpwHJPCMvUS/l9EYhYOmMG0=;
        fh=wFcHC5VQbt0qg3gLuyFAvGua5/TZDHpT/Si08tC7W8E=;
        b=O8PzSTWJnVRw3rFG2nFiIxOt/VPqghrVjyLP0RJO+rTnopAJN44z68eoTdnrC8XUaQ
         mCISY8BRvEQIoDUmqaFWyL87Nz+ymIVMcSZOZWkDwxgMSfID9L13j4wSb6F3iKfzIBng
         cwJWujWdYjSKVd/qJLcba8xbgA5s0+ukZsbU++VkJ7KPqhx9HuQw69aowCthZQzrHnpD
         4NPM9AARmGc7yLVJmgDdUw4sS2VDt5lsd4sK8AlpcQwie529xOmrY98qqlO9skYx9/yp
         a22i8Rqmi/a5v/wN9usDkahUPYg9FBdWsF8fIYxlggaeHwO4kyEsQDSyjeOU7ePMTrRq
         m58Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cr935sPx;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ab6fc26ec7si21373656d6.195.2024.05.21.02.43.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 02:43:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cr935sPx;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716284628;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7amI72qGHb9CShbmVHT3fpwHJPCMvUS/l9EYhYOmMG0=;
	b=cr935sPxlS5GBblFjDx+z+QVvaUnvUkjKO3lyhqhdbIaumu3XIxQEU6D0Q/pOWp2YE3xC8
	uD63phscrqWexvrYWLAuyLC7V/XiGop0I4t09OL9gkWuRyeGt9iStSyf7mwbONCe3kiS3Q
	FmfQi5Vmx1+BR9EkQeiwx41Q17kOOPs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-HbktQ1BiPMqPsA1OVdv2lA-1; Tue, 21 May 2024 05:43:46 -0400
X-MC-Unique: HbktQ1BiPMqPsA1OVdv2lA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-574fd71d398so3331449a12.1
        for <alex.bennee@linaro.org>; Tue, 21 May 2024 02:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716284626; x=1716889426;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7amI72qGHb9CShbmVHT3fpwHJPCMvUS/l9EYhYOmMG0=;
        b=XknK7YCEEi9nCE0frS7R3OjQC4jdt0e/ZPyT+NrhgMnKxmWNH7vPFHHW+z36QL+sBS
         RIOPqHkWVfXoz6Xu7E5egrVaQWJ74PIKpKSeteKOsd1vt7yca+bcaK42fpi+ijklQB1O
         cOSk1hvs8maxH7DMeZfRUWmq0LnsXnyrZHD5UwRclouBViHvbUZu7+hlzwKLuzLz8vv3
         UjzIPtadZ3nrLKJRQ/0g+QKQV3fAT0XoqOVHl1LE4CwDnrDrIIENHusyMwlbUdj74/Qk
         PNZKMkgcGanIndzzVL1p4Dg11Ey4VVvtgSmcr+7PBJ6ZGZRM0WafaIcWaxi/YYdsP7TZ
         DoIA==
X-Forwarded-Encrypted: i=1; AJvYcCX6/AaZJe1kM5Iexcu1y+7HoBVKwqYNzhtd2n+Zr0C4Ks4YgNmCB7sx2BUS0UoIpXvTYJkjHoSHEOqVJ/sQlX6297AbR+uo
X-Gm-Message-State: AOJu0YzFBhNS0kPBT2qbv1dy+rxU70jJkUxMsmMIGUfH5Mn4uz1u4W6J
	JjG5vwsoCOUCkMF1wfqCiD87BTtFJghoxJxoU2/UXBg7SJLjuOwTamIxpXdEMaq5Ubyz91JwCg1
	9XI4vPSiUU5FgycXY7+zEDeW7cPvZx90VjgSJLXL3b6Scld8doaPxfA==
X-Received: by 2002:a50:9ecd:0:b0:56e:7751:ae4e with SMTP id 4fb4d7f45d1cf-5734d67bf42mr21696420a12.33.1716284625677;
        Tue, 21 May 2024 02:43:45 -0700 (PDT)
X-Received: by 2002:a50:9ecd:0:b0:56e:7751:ae4e with SMTP id 4fb4d7f45d1cf-5734d67bf42mr21696402a12.33.1716284625276;
        Tue, 21 May 2024 02:43:45 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57421480d99sm14481198a12.8.2024.05.21.02.43.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 02:43:45 -0700 (PDT)
Message-ID: <d75ffd2e-8fa2-4161-8f35-56fa8c72418c@redhat.com>
Date: Tue, 21 May 2024 11:43:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 18/18] hw/arm/virt: Set SMMU OAS based on CPU
 PARANGE
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-19-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240429032403.74910-19-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: CD1iupkn6jWn

Hi Mostafa,

On 4/29/24 05:24, Mostafa Saleh wrote:
> Use the new SMMU property to make the SMMU OAS match the CPU PARANGE.
> That's according to SMMU manual ARM IHI 0070F.b:
>     6.3.6 SMMU_IDR5, OAS must match the system physical address size.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/virt.c      | 14 ++++++++++++--
>  target/arm/cpu.h   |  2 ++
>  target/arm/cpu64.c |  5 +++++
>  3 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 3c93c0c0a6..f203b1f8e1 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -252,6 +252,13 @@ static bool ns_el2_virt_timer_present(void)
>          arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu);
>  }
>  
> +/* We rely on CPU to define system OAS. */
> +static int32_t get_system_oas(void)
> +{
> +    ARMCPU *cpu = ARM_CPU(qemu_get_cpu(0));
> +    return cpu_arm_get_oas(cpu);
> +}
> +
>  static void create_fdt(VirtMachineState *vms)
>  {
>      MachineState *ms = MACHINE(vms);
> @@ -1384,7 +1391,7 @@ static void create_pcie_irq_map(const MachineState *ms,
>  }
>  
>  static void create_smmu(const VirtMachineState *vms,
> -                        PCIBus *bus)
> +                        PCIBus *bus, int32_t oas)
>  {
>      char *node;
>      const char compat[] = "arm,smmu-v3";
> @@ -1404,6 +1411,9 @@ static void create_smmu(const VirtMachineState *vms,
>  
>      object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>                               &error_abort);
> +
> +    qdev_prop_set_uint64(dev, "oas", oas);
to me you cannot handle that this way because for older machine types
the smmu oas needs to stay the same as it was before, ie. 44. So you
need to properly handle the compats.
Since the new default value depends on the CPU PARANGE this is a bit
more tricky but maybe you get can inspired from no_its class field trick
in virt.c and introduce a no_smmu_cpu_oas_align to disable the settings
up to 9.0 included.

Thanks

Eric
> +
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>      for (i = 0; i < NUM_SMMU_IRQS; i++) {
> @@ -1578,7 +1588,7 @@ static void create_pcie(VirtMachineState *vms)
>  
>          switch (vms->iommu) {
>          case VIRT_IOMMU_SMMUV3:
> -            create_smmu(vms, vms->bus);
> +            create_smmu(vms, vms->bus, get_system_oas());
>              qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map",
>                                     0x0, vms->iommu_phandle, 0x0, 0x10000);
>              break;
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 17efc5d565..68261ffbf9 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3287,4 +3287,6 @@ static inline target_ulong cpu_untagged_addr(CPUState *cs, target_ulong x)
>  }
>  #endif
>  
> +int32_t cpu_arm_get_oas(ARMCPU *cpu);
> +
>  #endif
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 985b1efe16..08da83c082 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -787,6 +787,11 @@ static const gchar *aarch64_gdb_arch_name(CPUState *cs)
>      return "aarch64";
>  }
>  
> +int32_t cpu_arm_get_oas(ARMCPU *cpu)
> +{
> +    return FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
> +}
> +
>  static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
>  {
>      CPUClass *cc = CPU_CLASS(oc);
