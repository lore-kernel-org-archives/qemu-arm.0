Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE803CCFA1A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 17:58:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIsd0-0000bq-4z; Tue, 11 Nov 2025 12:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vIscw-0000YW-Kn
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:57:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vIscv-0002OT-AU
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:57:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762883874;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lgu0Ck5YyznAWG1i65dblATGVHtQNlg1aO/WGnU5EJc=;
 b=HWl9CdVM8O7fOQhQDhumldLFDD/dl3Px1ymvUDUyI8StkZ47u5R93CPIpU71Wdl5tnbIVQ
 JCZD46AJCGj3gyzowRUTlXK5vxt1FR6X9gs24vHtFQvgwmUCjUjS80Hs0vfgkqWwgtNFkq
 YS4dhtrxpd5zbRaID6wXDzBmvNfpAmA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-96CSjfq8Owq-WriGMJUGBQ-1; Tue, 11 Nov 2025 12:57:51 -0500
X-MC-Unique: 96CSjfq8Owq-WriGMJUGBQ-1
X-Mimecast-MFC-AGG-ID: 96CSjfq8Owq-WriGMJUGBQ_1762883871
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed6855557aso26000711cf.1
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 09:57:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762883871; x=1763488671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lgu0Ck5YyznAWG1i65dblATGVHtQNlg1aO/WGnU5EJc=;
 b=Wde6sr6DrXN/9zC0y0KVa5CAGS7EyTC60AU8k5Y64igWH1g61EVh2Aul13IGAbWlxX
 OxMZC6gLFg0O1alCrPy1qGZoSx0xlghdk69o8Sd4pj6ye4+OJ8CphCzJld9ZRBoTrIc8
 r1NcrI2dDTOAdBh8RzbQHpCwQRLHVBAI9Q7PDGRb7AxxqCkLuFLSi8d6jDJFf8MP/h9V
 Xi+Yxgxnoo4R3IeUILIhQLnY2xaSsWMAO5FZfruY+oT3LmW7dsW3luMyCMsKco7pLZ3y
 LiF1IKYT534M6Lhtx1ZdDPI3LmADQukzU4XLWMZRgqmSCfSc4M9U06T/xADv91k7SYRJ
 ff9A==
X-Gm-Message-State: AOJu0YxLDRJi0L137M0I6IpJbVV2Z1MuTardLnWophAWVk5z/BIx+Bl7
 S9z/CmZePFzlelRn+gA0hBZ+uvDGQl65uBSa+91jXiTwKidmqVF4oNFPXek1sERsC4zcNFSXPBK
 /MCL2OQLdZ1JuFYfDpyQsdCV/76Hx8fA5imVGCIr8DW53+PEpMTZYXg==
X-Gm-Gg: ASbGnctOHSIlb1YHYOK6Fwz5q0SjteztGH6pQNSANe/uyXhPM2eYuuBbBLLIqmEMis2
 rbw5/fbH25hbO3fFPcF07ORMmY0h5nn7HwKPQyqPb74oz0v4JNVbPAUeByPXszRKHJx9wshFRl0
 XFQvH3R/QoRG8ocO4NrXPjGn8v1IzyqvaE2//zxRIX3MwsKTS/89E024S4om4uklrjsWtnWSPE7
 DZO+b0ZvjNdQkBsxVFSvgibGb8fVRSjoRJ8uASZvtvTbx4bloFgNdstfQ0YnBxXCHo7h+AHVX+F
 QGFEqIANqzblDgFEeZ2Jch7fTV3Xu7DsCF5ncgB1IA07jOjfu3QLqg3KFpdSJgrw2FDhXd5EuR0
 X8SAO6l+D0UV3n9wFwJhweicVFqZp6Nfe1KdYgG5hvvRrXyDB+02xHTtu
X-Received: by 2002:a05:622a:188d:b0:4ed:1ccb:e604 with SMTP id
 d75a77b69052e-4eddb82b388mr2963281cf.11.1762883871013; 
 Tue, 11 Nov 2025 09:57:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgy8Y2ETN6jhMS8VG62OyFcw269nFSuIGAcybI6nZ8cge2kSlujkUzY+J9XzGPpFYAEfeCTQ==
X-Received: by 2002:a05:622a:188d:b0:4ed:1ccb:e604 with SMTP id
 d75a77b69052e-4eddb82b388mr2962891cf.11.1762883870608; 
 Tue, 11 Nov 2025 09:57:50 -0800 (PST)
Received: from [10.188.251.182] (cust-east-par-46-193-65-163.cust.wifirst.net.
 [46.193.65.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4eda5956968sm71729391cf.6.2025.11.11.09.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 09:57:50 -0800 (PST)
Message-ID: <0795ff4a-50d1-4b2d-84bf-e1bc9da11ba6@redhat.com>
Date: Tue, 11 Nov 2025 18:57:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] target/arm/kvm: add kvm-psci-version vcpu property
To: Sebastian Ott <sebott@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20251030165905.73295-1-sebott@redhat.com>
 <20251030165905.73295-3-sebott@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251030165905.73295-3-sebott@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 84GfRrCUPlfuXz2tl5a7KQ2syp1m4ZF45a24OEoNGBQ_1762883871
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 10/30/25 5:59 PM, Sebastian Ott wrote:
> Provide a kvm specific vcpu property to override the default
> (as of kernel v6.13 that would be PSCI v1.3) PSCI version emulated
> by kvm. Current valid values are: 0.1, 0.2, 1.0, 1.1, 1.2, and 1.3
>
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
> ---
>  docs/system/arm/cpu-features.rst |  5 +++
>  target/arm/cpu.h                 |  6 ++++
>  target/arm/kvm.c                 | 60 +++++++++++++++++++++++++++++++-
>  3 files changed, 70 insertions(+), 1 deletion(-)
>
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 37d5dfd15b..1d32ce0fee 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -204,6 +204,11 @@ the list of KVM VCPU features and their descriptions.
>    the guest scheduler behavior and/or be exposed to the guest
>    userspace.
>  
> +``kvm-psci-version``
> +  Override the default (as of kernel v6.13 that would be PSCI v1.3)
> +  PSCI version emulated by the kernel. Current valid values are:
> +  0.1, 0.2, 1.0, 1.1, 1.2, and 1.3
> +
>  TCG VCPU Features
>  =================
>  
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 39f2b2e54d..c2032070b7 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -981,6 +981,12 @@ struct ArchCPU {
>       */
>      uint32_t psci_version;
>  
> +    /*
> +     * Intermediate value used during property parsing.
> +     * Once finalized, the value should be read from psci_version.
> +     */
> +    uint32_t prop_psci_version;
> +
>      /* Current power state, access guarded by BQL */
>      ARMPSCIState power_state;
>  
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 0d57081e69..c53b307b76 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -484,6 +484,49 @@ static void kvm_steal_time_set(Object *obj, bool value, Error **errp)
>      ARM_CPU(obj)->kvm_steal_time = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
>  }
>  
> +struct psci_version {
> +    uint32_t number;
> +    const char *str;
> +};
> +
> +static const struct psci_version psci_versions[] = {
> +    { QEMU_PSCI_VERSION_0_1, "0.1" },
> +    { QEMU_PSCI_VERSION_0_2, "0.2" },
> +    { QEMU_PSCI_VERSION_1_0, "1.0" },
> +    { QEMU_PSCI_VERSION_1_1, "1.1" },
> +    { QEMU_PSCI_VERSION_1_2, "1.2" },
> +    { QEMU_PSCI_VERSION_1_3, "1.3" },
> +    { -1, NULL },
> +};
> +
> +static char *kvm_get_psci_version(Object *obj, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    const struct psci_version *ver;
> +
> +    for (ver = psci_versions; ver->number != -1; ver++) {
> +        if (ver->number == cpu->prop_psci_version)
I still have the same question/comment as on v1. In case the end user
does not override the psci version I think you want to return the
default value, retrieved from KVM through KVM_REG_ARM_PSCI_VERSION and
which populates cpu->psci_version. So to me you should use
cpu->psci_version instead

> +            return g_strdup(ver->str);
> +    }
> +
> +    g_assert_not_reached();
> +}
> +
> +static void kvm_set_psci_version(Object *obj, const char *value, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    const struct psci_version *ver;
> +
> +    for (ver = psci_versions; ver->number != -1; ver++) {
> +        if (!strcmp(value, ver->str)) {
> +            cpu->prop_psci_version = ver->number;
> +            return;
> +        }
> +    }
> +
> +    error_setg(errp, "Invalid PSCI-version value");
> +}
> +
>  /* KVM VCPU properties should be prefixed with "kvm-". */
>  void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
>  {
> @@ -505,6 +548,12 @@ void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
>                               kvm_steal_time_set);
>      object_property_set_description(obj, "kvm-steal-time",
>                                      "Set off to disable KVM steal time.");
> +
> +    object_property_add_str(obj, "kvm-psci-version", kvm_get_psci_version,
> +                            kvm_set_psci_version);
> +    object_property_set_description(obj, "kvm-psci-version",
> +                                    "Set PSCI version. "
> +                                    "Valid values are 0.1, 0.2, 1.0, 1.1, 1.2, 1.3");
>  }
>  
>  bool kvm_arm_pmu_supported(void)
> @@ -1959,7 +2008,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      if (cs->start_powered_off) {
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_POWER_OFF;
>      }
> -    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
> +    if (cpu->prop_psci_version != QEMU_PSCI_VERSION_0_1 &&
I don't understand what this change stands for. Please document it
through both a comment and a commit msg explanation

Thanks

Eric
> +        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
>          cpu->psci_version = QEMU_PSCI_VERSION_0_2;
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PSCI_0_2;
>      }
> @@ -1998,6 +2048,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          }
>      }
>  
> +    if (cpu->prop_psci_version) {
> +        psciver = cpu->prop_psci_version;
> +        ret = kvm_set_one_reg(cs, KVM_REG_ARM_PSCI_VERSION, &psciver);
> +        if (ret) {
> +            error_report("PSCI version %"PRIx64" is not supported by KVM", psciver);
> +            return ret;
> +        }
> +    }
>      /*
>       * KVM reports the exact PSCI version it is implementing via a
>       * special sysreg. If it is present, use its contents to determine


