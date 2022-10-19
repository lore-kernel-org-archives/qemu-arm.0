Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp625967ejn;
        Wed, 19 Oct 2022 13:19:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7md1Z0m2W9sJ9kNLRvPCeNNOXojOQqJOAFmzLclVmWh2alpGYe94G2MD0ZA6qr9Ujfb2KW
X-Received: by 2002:a05:620a:1709:b0:6ed:4817:1d02 with SMTP id az9-20020a05620a170900b006ed48171d02mr6975093qkb.73.1666210759181;
        Wed, 19 Oct 2022 13:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666210759; cv=none;
        d=google.com; s=arc-20160816;
        b=Ia2xrdZ0kGzXYlemE2P8WG5m8px2cPL7P3UjAOzr/5QG7ioZp3fAbkMePRrnlKqSI8
         mRk9IXCwuW+BNGfCwgxdgHIDEml7q55RWhlCO28fhlgKmSGaUIR/or19VcX/DxbvGLqj
         hqxRJlHI6IjpptzAH1S2dQHsVQOiAVU4eg9FKp0gDi5SrQVu0gYDD3IHDyi3jRczR31l
         sydZswpKS/tTZjrDyEuxNARgBTVz6BTMVB7GfPjZLfgWRNRkcsSdgoRzoQUgc5MvHgYI
         G/Oyh0DqzaccUVAPZ/VC6vYI476p7GwBTAubec8s41qCQA7Br5w3ruePVhPCq/guy34D
         543A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QkyOWE8uZ/FzeM3/viPJ2IB6zRQhk/LK5xmOMXldqIk=;
        b=Xe6SyK97fpZR8F4/wEmaGvADeiPi1RMdxkWJhOg8CD37EqpEQ16w2AyMkndKUTUGto
         3DiNqyR/754nM0e2/7q+h/XM5DcYgemP/eOLrKZkLtzae/1Palu3JCMgybJ+r9BGM1xE
         rr7riwXdEpBHCT31mv08/UODqMesM8ul9g/BSLvd1hBL0VAIcFSBkgB4/NYVGja/fTgg
         1OhqpM8vleNy/hrjGWX7DkCfQafztw5DhteyqbUa3qTk9bCLRZzBHQKDlvmdFVaFWXBq
         Rhkdsid7FDAG7VJTsN4EKlYb8GwA7qWiqScU3WjQgTiKwfpIpQwJvdyh8uFdsPr5lxci
         Z6AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ekdEekPX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020ac865c2000000b0038c8b0b06d4si8930073qto.370.2022.10.19.13.19.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 13:19:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ekdEekPX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olFX4-0002NQ-Lg
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 16:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1olFWE-0002LT-BW
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 16:18:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1olFWA-0001NM-Is
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 16:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666210701;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QkyOWE8uZ/FzeM3/viPJ2IB6zRQhk/LK5xmOMXldqIk=;
 b=ekdEekPXG6BeEy0egdtNgZfJVCQHlQz5UePhT9flR3fPn8aufG8xczmwwMORgI0sDpvZ24
 6LrKkvdsfYoX0vUyyP/W5+6AIFPmXWo0mBWiKeg5O+Q1uv3bHMom6/BKUcNJIXnxjzcY0D
 0Ji+UjtxZNXt70RHx1tvYqg6vOiYWow=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-142-8na-FAqEMD6fTeGpcuoY-A-1; Wed, 19 Oct 2022 16:18:20 -0400
X-MC-Unique: 8na-FAqEMD6fTeGpcuoY-A-1
Received: by mail-qt1-f198.google.com with SMTP id
 17-20020ac85711000000b0039ccd4c9a37so13647579qtw.20
 for <qemu-arm@nongnu.org>; Wed, 19 Oct 2022 13:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QkyOWE8uZ/FzeM3/viPJ2IB6zRQhk/LK5xmOMXldqIk=;
 b=RlvmftmWNj9tTZq52uTrfUyc/26Z6K3mogxlbCvLwiwCRV1eciwYYWoc2CVHS48IRZ
 aIojOjvF+ty+LTKRUyt3RG3EN1fBq03ub8yUGCt5cBJmV1iHPBu3jlojKHQTgiIAcX9P
 5I8k6vX9Ep2ggalv3TOnh0VYASvYNMs/aYnm19QfC7Coa1LKsAABOsuNOGRJS+rnlo0J
 F6Myeye3cnrTIKued3pqXNwyjpRJsz8xdxkrBMbNwfYwXCdIR/W419Q2Xzbj4GXkwJqf
 mrSDfq5it8b9Xvtg+3R4A0hm34pfK6t+uFWQU9wtB5DEmNLR44/sp7Z52ROL3j+9A2aY
 CitQ==
X-Gm-Message-State: ACrzQf16xcSSMxsCRDxRcdLmXXLkGcH4CSdZuJWb7MfBO725T7VqY85M
 Mq+cR4b/5JMN3PTyo8tukKfZTXi2bGI/WI7n+SwR05+2tGMb0k9YJVkrKAsDBWI/N1f2BcZYdWt
 B/LWFFg4D6yuL
X-Received: by 2002:a05:620a:450d:b0:6ee:5242:9f50 with SMTP id
 t13-20020a05620a450d00b006ee52429f50mr6956727qkp.82.1666210699651; 
 Wed, 19 Oct 2022 13:18:19 -0700 (PDT)
X-Received: by 2002:a05:620a:450d:b0:6ee:5242:9f50 with SMTP id
 t13-20020a05620a450d00b006ee52429f50mr6956708qkp.82.1666210699351; 
 Wed, 19 Oct 2022 13:18:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 oo12-20020a05620a530c00b006eeae49537bsm5422253qkn.98.2022.10.19.13.18.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 13:18:18 -0700 (PDT)
Message-ID: <9a43b31a-63d7-d312-870d-168df1b41921@redhat.com>
Date: Wed, 19 Oct 2022 22:18:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 6/6] hw/arm/virt: Add 'compact-highmem' property
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20221011231832.149839-1-gshan@redhat.com>
 <20221011231832.149839-7-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221011231832.149839-7-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QRO3LRNKv4Ic

Hi Gavin,

On 10/12/22 01:18, Gavin Shan wrote:
> After the improvement to high memory region address assignment is
> applied, the memory layout can be changed, introducing possible
> migration breakage. For example, VIRT_HIGH_PCIE_MMIO memory region
> is disabled or enabled when the optimization is applied or not, with
> the following configuration.
>
>   pa_bits              = 40;
>   vms->highmem_redists = false;
>   vms->highmem_ecam    = false;
>   vms->highmem_mmio    = true;
>
>   # qemu-system-aarch64 -accel kvm -cpu host    \
>     -machine virt-7.2,compact-highmem={on, off} \
>     -m 4G,maxmem=511G -monitor stdio
>
>   Region            compact-highmem=off         compact-highmem=on
>   ----------------------------------------------------------------
>   RAM               [1GB         512GB]        [1GB         512GB]
>   HIGH_GIC_REDISTS  [512GB       512GB+64MB]   [disabled]
>   HIGH_PCIE_ECAM    [512GB+256MB 512GB+512MB]  [disabled]
>   HIGH_PCIE_MMIO    [disabled]                 [512GB       1TB]
>
> In order to keep backwords compatibility, we need to disable the
> optimization on machines, which is virt-7.1 or ealier than it. It
> means the optimization is enabled by default from virt-7.2. Besides,
> 'compact-highmem' property is added so that the optimization can be
> explicitly enabled or disabled on all machine types by users.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
>  docs/system/arm/virt.rst |  4 ++++
>  hw/arm/virt.c            | 47 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h    |  1 +
>  3 files changed, 52 insertions(+)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 20442ea2c1..75bf5a4994 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -94,6 +94,10 @@ highmem
>    address space above 32 bits. The default is ``on`` for machine types
>    later than ``virt-2.12``.
>  
> +compact-highmem
> +  Set ``on``/``off`` to enable/disable compact space for high memory regions.
> +  The default is ``on`` for machine types later than ``virt-7.2``
> +
>  gic-version
>    Specify the version of the Generic Interrupt Controller (GIC) to provide.
>    Valid values are:
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index c05cfb5314..8f1dba0ece 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -174,6 +174,27 @@ static const MemMapEntry base_memmap[] = {
>   * Note the extended_memmap is sized so that it eventually also includes the
>   * base_memmap entries (VIRT_HIGH_GIC_REDIST2 index is greater than the last
>   * index of base_memmap).
> + *
> + * The addresses assigned to these regions are affected by 'compact-highmem'
> + * property, which is to enable or disable the compact space in the Highmem
> + * IO regions. For example, VIRT_HIGH_PCIE_MMIO can be disabled or enabled
> + * depending on the property in the following scenario.
To me you shall rather explain here what is the so-called "compact"
space vs the legacy highmem layout.

If I understand correctly the example rather legitimates the use of a
compat option showing how the layout can be affected by the option. I
would put that in the commit msg instead. Also in your example I see
VIRT_HIGH_GIC_REDISTS is disabled but the code does not disable the
region excpet if it does not fit within the PA. This does not match your
example. Also the region is named VIRT_HIGH_GIC_REDIST2.

In v4, Marc also suggested to have individual options for each highmem
region.
https://lore.kernel.org/qemu-devel/0f8e6a58-0dde-fb80-6966-7bb32c4df552@redhat.com/

Have you considered that option?

Thanks

Eric
> + *
> + * pa_bits              = 40;
> + * vms->highmem_redists = false;
> + * vms->highmem_ecam    = false;
> + * vms->highmem_mmio    = true;
> + *
> + * # qemu-system-aarch64 -accel kvm -cpu host    \
> + *   -machine virt-7.2,compact-highmem={on, off} \
> + *   -m 4G,maxmem=511G -monitor stdio
> + *
> + * Region            compact-highmem=off        compact-highmem=on
> + * ----------------------------------------------------------------
> + * RAM               [1GB         512GB]        [1GB         512GB]
> + * HIGH_GIC_REDISTS  [512GB       512GB+64MB]   [disabled]
> + * HIGH_PCIE_ECAM    [512GB+256GB 512GB+512MB]  [disabled]
> + * HIGH_PCIE_MMIO    [disabled]                 [512GB       1TB]
>   */
>  static MemMapEntry extended_memmap[] = {
>      /* Additional 64 MB redist region (can contain up to 512 redistributors) */
> @@ -2353,6 +2374,20 @@ static void virt_set_highmem(Object *obj, bool value, Error **errp)
>      vms->highmem = value;
>  }
>  
> +static bool virt_get_compact_highmem(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->highmem_compact;
> +}
> +
> +static void virt_set_compact_highmem(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->highmem_compact = value;
> +}
> +
>  static bool virt_get_its(Object *obj, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
> @@ -2971,6 +3006,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>                                            "Set on/off to enable/disable using "
>                                            "physical address space above 32 bits");
>  
> +    object_class_property_add_bool(oc, "compact-highmem",
> +                                   virt_get_compact_highmem,
> +                                   virt_set_compact_highmem);
> +    object_class_property_set_description(oc, "compact-highmem",
> +                                          "Set on/off to enable/disable compact "
> +                                          "space for high memory regions");
> +
>      object_class_property_add_str(oc, "gic-version", virt_get_gic_version,
>                                    virt_set_gic_version);
>      object_class_property_set_description(oc, "gic-version",
> @@ -3055,6 +3097,7 @@ static void virt_instance_init(Object *obj)
>  
>      /* High memory is enabled by default */
>      vms->highmem = true;
> +    vms->highmem_compact = !vmc->no_highmem_compact;
>      vms->gic_version = VIRT_GIC_VERSION_NOSEL;
>  
>      vms->highmem_ecam = !vmc->no_highmem_ecam;
> @@ -3124,8 +3167,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
>  
>  static void virt_machine_7_1_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_7_2_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
> +    /* Compact space for high memory regions was introduced with 7.2 */
> +    vmc->no_highmem_compact = true;
>  }
>  DEFINE_VIRT_MACHINE(7, 1)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 709f623741..c7dd59d7f1 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -125,6 +125,7 @@ struct VirtMachineClass {
>      bool no_pmu;
>      bool claim_edge_triggered_timers;
>      bool smbios_old_sys_ver;
> +    bool no_highmem_compact;
>      bool no_highmem_ecam;
>      bool no_ged;   /* Machines < 4.2 have no support for ACPI GED device */
>      bool kvm_no_adjvtime;

