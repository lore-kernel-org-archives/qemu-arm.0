Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4119597ejy;
        Thu, 6 Jul 2023 01:17:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHL9AY8teDT97NW89pBZoNC50t2bNTAtx3yCMv/U6ngnG7Hp39cwuiBu+iKJwff77iiZ60r
X-Received: by 2002:a05:622a:1a06:b0:400:82b1:ad05 with SMTP id f6-20020a05622a1a0600b0040082b1ad05mr5415100qtb.7.1688631452344;
        Thu, 06 Jul 2023 01:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688631452; cv=none;
        d=google.com; s=arc-20160816;
        b=lkkz7O7HZn/PMkJ2pUZTwr4stzkX5SxrqtSnQib9L8WP3ZsV5ZUaC/JVUX2rdiJeQ9
         4nJZXiyHaUa2ydXIVBiqjAPVXxXTt4DOgdOid8tGv0dBTwcrJw9dhByyoNoc3DGXHwzM
         Ec4BUDCLt1hngMnyT4HA4t3Kyt0DcOWGtL+M0C++7+y9uM18GSXyRoZI3Yb2Wle7Efro
         GHdoolos6Z/Uva+KvQbef3jfLT3vL6r19DpFFiNA1CM5kQUE5DdVm3ZrSxNNthY3/xYU
         oG2s5SvOAn4Q7G4Te2ANkIgQRLfU4j78Xlicd2LBpHWb5FCBpNqJEmfQc9dj8J9wZL7F
         1tiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ak63oS2wbQ//CZ4bFZf9UUgZgbNOOrgNyyi0Qi15lYM=;
        fh=8pVspvbGxvMAjW7+/hfX0lcXtPufnD5I4M5xrP30EgA=;
        b=i4p4oP2PmGe1Msr6EkkCleXT+BLh/tcqXqFeuf1CTT6Du/+trGeIQq+NaIOKT+/HVq
         Lo7gAhn/xZjVjD0MBk03THBKlN4IuOr+Y5U3vDjhpk4XL9fJ4LQFbuQLY5KHpM4ohuT8
         7qCV9R66eo+3gemMCNJeX+UuYHhQbQf9hscXIr60JWwHnR5hROOBn3iwxfBhtF3a7LxH
         pPQJR4aAzV8F8AGK8edmHFeLOMrOfa1lwagJ5Jjr8gUooVY1c7RXo7zwiICwIMLJwrt7
         tTsCHAmVkyB+lNF9+W/D3BYRjkxFAVJUC366qeZUd2io4kCmYq7MRidYv99gs/uooI8f
         BTwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GaZlC38I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2-20020ac87fc2000000b0040357726f32si496540qtk.808.2023.07.06.01.17.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jul 2023 01:17:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GaZlC38I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHKAu-0002BW-EA; Thu, 06 Jul 2023 04:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1qHKAs-0002AX-PF
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 04:17:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1qHKAp-0007cq-69
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 04:17:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688631427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ak63oS2wbQ//CZ4bFZf9UUgZgbNOOrgNyyi0Qi15lYM=;
 b=GaZlC38I0hRdz3HmpIRGS7Xk0kt3wj/CJWCBflJLgEoV6rei79GJb9m4osaW2pVOsCF0PL
 DqAopEFj4n3ClmY82SMVY/TW4d4n3ISnwF6h4vULXcjisj1irTR+r75WnvjPUMy3PoX8vw
 WHB01XMFThwF1TS+8Z39e/gIE18PQkY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-4HlrXQWbNAm46c9IJAsqAg-1; Thu, 06 Jul 2023 04:17:06 -0400
X-MC-Unique: 4HlrXQWbNAm46c9IJAsqAg-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-62fe5abe808so3622906d6.1
 for <qemu-arm@nongnu.org>; Thu, 06 Jul 2023 01:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688631426; x=1691223426;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ak63oS2wbQ//CZ4bFZf9UUgZgbNOOrgNyyi0Qi15lYM=;
 b=crB30xVhVJEcDtEfBF2BhGSJ0bKKNKbNoE+7FTVUwBKiCmBUKj2O0TKfoVaU/U2+7k
 ghMIS7ufzI8YlPkVq46mAf8NChu0c7dcH7Uk9E5dT+zvug/U5LSvu/ee+Ib9567gdmUJ
 ivj0nqERdi2Ih0jvWNUkF+0Vd9qoLHAdONy/IdP1/Ua+nQi5nNMTb7Bkg8c8T9GhYD9L
 RGSW6RZR7CanfMn24KEGAH2oTlRuZiWlX59ML9+6GKaiXlwT2+zCSQpPSYgLa9w2DgEq
 ZBwCEcbwmPQbejD2bcAuoaXJOPIcWliK4mNPiOIfgtfkSwT0k/3QBZYewuNZbQ3efLWM
 2Azg==
X-Gm-Message-State: ABy/qLa0m/nTFJj0AAv8+hidTJmYmR8DxDbBwtmA/R030MOO+acTJNnJ
 eZrxW10RJdfMdEltR1ODMsgj5jTvfbM26JJxoh3vy3VLvJTnlC2E91CGfA/gnXNQKpnoEBDC4v9
 LKvyyyhCnwIWZ
X-Received: by 2002:a05:6214:242a:b0:62d:e73b:c4ab with SMTP id
 gy10-20020a056214242a00b0062de73bc4abmr6032394qvb.1.1688631426302; 
 Thu, 06 Jul 2023 01:17:06 -0700 (PDT)
X-Received: by 2002:a05:6214:242a:b0:62d:e73b:c4ab with SMTP id
 gy10-20020a056214242a00b0062de73bc4abmr6032372qvb.1.1688631425966; 
 Thu, 06 Jul 2023 01:17:05 -0700 (PDT)
Received: from [192.168.1.91] (176-152-201-187.abo.bbox.fr. [176.152.201.187])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a0ca999000000b0063645f62bdasm592176qvb.80.2023.07.06.01.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 01:17:05 -0700 (PDT)
Message-ID: <acb446c4-dddb-30f6-5faf-e976fbe0c605@redhat.com>
Date: Thu, 6 Jul 2023 10:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 4/5] target/arm: enable feature ARM_FEATURE_EL2 if EL2
 is supported
To: Miguel Luis <miguel.luis@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Marc Zyngier <maz@kernel.org>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <20230227163718.62003-5-miguel.luis@oracle.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20230227163718.62003-5-miguel.luis@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: BgWFYMhINt2h

Hi Miguel,

On 2/27/23 17:37, Miguel Luis wrote:
> From: Haibo Xu <haibo.xu@linaro.org>
> 
> KVM_CAP_ARM_EL2 must be supported by the cpu to enable ARM_FEATURE_EL2.
> EL2 bits on ID_AA64PFR0 state unsupported on the value 0b0000.
> 
> Ref: https://lore.kernel.org/qemu-devel/b7c2626e6c720ccc43e57197dff3dac72d613640.1616052890.git.haibo.xu@linaro.org/
> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> [Miguel Luis: use of ID_AA64PFR0 for cpu features]
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
> ---
>  target/arm/cpu.h   |  2 +-
>  target/arm/kvm64.c | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9aeed3c848..de2a88b43e 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3961,7 +3961,7 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
>  
>  static inline bool isar_feature_aa64_aa32_el2(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL2) >= 2;
> +    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL2) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index be8144a2b5..f7ebd731aa 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -505,6 +505,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>       */
>      int fdarray[3];
>      bool sve_supported;
> +    bool el2_supported;
>      bool pmu_supported = false;
>      uint64_t features = 0;
>      int err;
> @@ -535,6 +536,14 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          init.features[0] |= 1 << KVM_ARM_VCPU_SVE;
>      }
>  
> +    /*
> +     * Ask for EL2 if supported.
> +     */
> +    el2_supported = kvm_arm_el2_supported();
> +    if (el2_supported) {
> +        init.features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
This doesn't work if your host both supports SVE & NV.

The error output by qemu is not straightforward

qemu-system-aarch64: can't apply global host-arm-cpu.sve=off: Property
'host-arm-cpu.sve' not found

The problem is that we create a scratch VM with a CPU featuring both SVE
and NV and this fails at kernel level, I think on vcpu reset.

The trouble is that we do that even if sve=off at qemu level. So I think
this is a more generic issue related to the way we validate host cpu
features.

Thanks

Eric


> +    }
> +
>      /*
>       * Ask for Pointer Authentication if supported, so that we get
>       * the unsanitized field values for AA64ISAR1_EL1.
> @@ -714,6 +723,10 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      features |= 1ULL << ARM_FEATURE_PMU;
>      features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
>  
> +    if (el2_supported) {
> +        features |= 1ULL << ARM_FEATURE_EL2;
> +    }
> +
>      ahcf->features = features;
>  
>      return true;
> @@ -881,6 +894,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          assert(kvm_arm_sve_supported());
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
>      }
> +    if (cpu_isar_feature(aa64_aa32_el2, cpu)) {
> +        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
> +    }
>      if (cpu_isar_feature(aa64_pauth, cpu)) {
>          cpu->kvm_init_features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
>                                        1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);

