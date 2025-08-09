Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57751C87FCF
	for <qemu-arm@archiver.kernel.org>; Sat,  9 Aug 2025 16:22:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukmK2-0000fG-Cd; Sat, 09 Aug 2025 12:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ukmK1-0000dl-6T
 for qemu-arm@nongnu.org; Sat, 09 Aug 2025 12:21:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ukmJq-00013D-P4
 for qemu-arm@nongnu.org; Sat, 09 Aug 2025 12:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754756477;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rIb/1x9wab93LRAYun4ef/Ot7rHxyE1dkyauGVJlBog=;
 b=QIZfZuV9VosS1dvUA+UYYLKyFIGNSDWbHF3ZyYxf6Z6FiLLk+uSDR9mrah1uB15GAm5uM2
 5O32QGWJEy6H+nOy0LZopHElzMhLa8UEg/u8rGVpXfCugiK5TYgnqARoMAFgMdkG35WCeB
 l/lgCJzUV2Xlsv017moAtGEBxMwrwRg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-LDbv8c8WOve6fzxbFoZqEg-1; Sat, 09 Aug 2025 12:21:14 -0400
X-MC-Unique: LDbv8c8WOve6fzxbFoZqEg-1
X-Mimecast-MFC-AGG-ID: LDbv8c8WOve6fzxbFoZqEg_1754756473
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-459de8f00cfso12423325e9.2
 for <qemu-arm@nongnu.org>; Sat, 09 Aug 2025 09:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754756473; x=1755361273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rIb/1x9wab93LRAYun4ef/Ot7rHxyE1dkyauGVJlBog=;
 b=I6ssByvoFRwnvDSf1c/rusl4JzOLUmJ23C9kei4Yx83RsQ0VM6CdATa0mZOO4+NqCg
 iLymL/TSNzt2DXx+u+rnSkcLHwtoEDs8BrntQKVTsk/K80n45UdA3bIRNhzEjxGgdl5H
 fktAjOhN2iwYx9rdHvvco+4DBKUqnMS9O0YFRsfiDAiBmjzQOPbVrYShoTSar5Z6trAv
 Z6oRoZscUevDbL05qiB1Vcbe71iu0whIvBS1Pt/ioH2kxdoaaLUbnuCzhtt90KlL0B0V
 c+508VueJhWMpV9zwbH4EEL/3GYbbv8nhLl4rMZR3pXQDQ3WHHjKVJSc7bPhTJzSP2ee
 LPIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9YuiDPRZRZ1JOL7XYpkGAG2mVCajwvWF+mhSyr4WvjMmGhQHIF65LLCZS0g6aqqmyGocJj9E/nA==@nongnu.org
X-Gm-Message-State: AOJu0YwzJTpUPdBfI9ibCpDvkefIgsdzI2iak9j5UAkzbnGwh4QYiIoS
 icH6ifTY+KjWx1swTD9vY5qCmmvXk8oNorpEfuZRbuLGE84iGmef3WqVoaoBZKwd/8+nMF0eHQm
 V0K83QmrIEUP+BWbf+UssWBGUnbEm4CKDca4hTwd6yv5rLYAZuHMcrg==
X-Gm-Gg: ASbGncu7O6S5xCm+9sHgeYRrJKf2XHaDrIFKHzrSlGjtWquhbyeBGxTjUFEd3Hdu0ji
 2zayPqoUepUMCgG/P/UDpmZLUfCS2++KTVZkrjjwRcO4NsylgeqkEf37mkNWBQ/CDbb4rEsyv2U
 Ef8GtEslYEAXwr/xrMDcvga4YSTII9MSvYLY0QKcTmwjfAjvCMp82ElhqTCRydiZqXwFH1g11Xs
 nFbIu1uPgCnZxbxEYykmx2YIlnCxKbUt0qBOOU96PEiCpPzKo886hCI7fmv2X2HITN2uvCtHESG
 z4jkL2M0dBsZzG29Cat3S8gC4OS9ceAnkVS+umeDgOD7WEO5ytThFmv5St5uaCBsndJ4ZlKxNqw
 x4m+WAmXaFFs=
X-Received: by 2002:a05:600c:4451:b0:456:285b:db29 with SMTP id
 5b1f17b1804b1-459f4f43b3fmr56081395e9.29.1754756472831; 
 Sat, 09 Aug 2025 09:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh6Pdlzjr/YrQmyHXyHDs5AqT3UN7gNZwT+k3XU97Hxufb1cq2Hq/ChRdYwKZiX0ZkIJf5Ag==
X-Received: by 2002:a05:600c:4451:b0:456:285b:db29 with SMTP id
 5b1f17b1804b1-459f4f43b3fmr56081035e9.29.1754756472449; 
 Sat, 09 Aug 2025 09:21:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e586ad64sm179096065e9.20.2025.08.09.09.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Aug 2025 09:21:11 -0700 (PDT)
Message-ID: <5c29e11f-eac1-40a0-aec0-a80131f7de56@redhat.com>
Date: Sat, 9 Aug 2025 18:21:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH RESEND 1/4] target/arm/kvm: Introduce helper to check
 target impl CPU support
To: Shameer Kolothum <shameerkolothum@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cohuck@redhat.com, sebott@redhat.com,
 berrange@redhat.com, maz@kernel.org, oliver.upton@linux.dev,
 armbru@redhat.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, salil.mehta@huawei.com,
 yangjinqian1@huawei.com, shameerali.kolothum.thodi@huawei.com
References: <20250801074730.28329-1-shameerkolothum@gmail.com>
 <20250801074730.28329-2-shameerkolothum@gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250801074730.28329-2-shameerkolothum@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cLGeSwvSPnqRbfMmknf0Y15E9QmPGdrYzjw2BwWo6bA_1754756473
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 8/1/25 9:47 AM, Shameer Kolothum wrote:
> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>
> The helper function will try to set the SMCCC filters for KVM vendor
> hypercalls related to target implementation CPU support. It also
> checks the kernel support for writable implementation ID registers
> (MIDR/REVIDR/AIDR) and enables it.
>
> Subsequent patches for Target Impl CPU support will make use of this
> helper.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  target/arm/kvm.c     | 72 ++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/kvm_arm.h | 12 ++++++++
>  2 files changed, 84 insertions(+)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 3f41f99e23..eb04640b50 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -2072,6 +2072,78 @@ bool kvm_arm_mte_supported(void)
>      return kvm_check_extension(kvm_state, KVM_CAP_ARM_MTE);
>  }
>  
> +static bool kvm_arm_set_vm_attr(struct kvm_device_attr *attr, const char *name)
> +{
> +    int err;
> +
> +    err = kvm_vm_ioctl(kvm_state, KVM_HAS_DEVICE_ATTR, attr);
> +    if (err != 0) {
> +        error_report("%s: KVM_HAS_DEVICE_ATTR: %s", name, strerror(-err));
> +        return false;
> +    }
> +
> +    err = kvm_vm_ioctl(kvm_state, KVM_SET_DEVICE_ATTR, attr);
> +    if (err != 0) {
> +        error_report("%s: KVM_SET_DEVICE_ATTR: %s", name, strerror(-err));
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static bool kvm_arm_set_smccc_filter(uint64_t func, uint8_t faction)
nit: base is _u32 in the kernel
> +{
> +    struct kvm_smccc_filter filter = {
> +        .base = func,
> +        .nr_functions = 1,
> +        .action = faction,
> +    };
> +    struct kvm_device_attr attr = {
> +        .group = KVM_ARM_VM_SMCCC_CTRL,
> +        .attr = KVM_ARM_VM_SMCCC_FILTER,
> +        .flags = 0,
> +        .addr = (uintptr_t)&filter,
> +    };
> +
> +    if (!kvm_arm_set_vm_attr(&attr, "SMCCC Filter")) {
> +        error_report("failed to set SMCCC filter in KVM Host");
maybe also output @func in the error msg
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +bool kvm_arm_target_impl_cpus_supported(void)
> +{
> +    if (!kvm_arm_set_smccc_filter(
> +        ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_VER_FUNC_ID,
> +        KVM_SMCCC_FILTER_FWD_TO_USER)) {
> +        error_report("ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_VER fwd filter "
> +                     "install failed");
> +        return false;
> +    }
> +
> +    if (!kvm_arm_set_smccc_filter(
> +        ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_CPUS_FUNC_ID,
> +        KVM_SMCCC_FILTER_FWD_TO_USER)) {
> +        error_report("ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_CPUS fwd filter "
> +                     "install failed");
> +        return false;
> +    }
> +
> +    if (!kvm_check_extension(kvm_state, KVM_CAP_ARM_WRITABLE_IMP_ID_REGS)) {
> +        error_report("KVM_CAP_ARM_WRITABLE_IMP_ID_REGS not supported");
> +        return false;
> +    }
> +
> +    if (kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_WRITABLE_IMP_ID_REGS, 0)) {
> +        error_report("Failed to enable KVM_CAP_ARM_WRITABLE_IMP_ID_REGS cap");
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>  QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
>  
>  uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu)
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index ba5de45f86..3cd6447901 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -207,6 +207,13 @@ bool kvm_arm_sve_supported(void);
>   */
>  bool kvm_arm_mte_supported(void);
>  
> +/**
> + * kvm_arm_target_impl_cpus_supported:
> + *
> + * Returns: true if KVM can enable target impl CPUs, and false otherwise.
> + */
> +bool kvm_arm_target_impl_cpus_supported(void);
> +
>  /**
>   * kvm_arm_get_max_vm_ipa_size:
>   * @ms: Machine state handle
> @@ -263,6 +270,11 @@ static inline bool kvm_arm_mte_supported(void)
>      return false;
>  }
>  
> +static inline bool kvm_arm_target_impl_cpus_supported(void)
> +{
> +    return false;
> +}
> +
>  static inline int kvm_arm_get_writable_id_regs(ARMCPU *cpu, IdRegMap *idregmap)
>  {
>      return -ENOSYS;
Otherwise looks good to me.

Thanks

Eric


