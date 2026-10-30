Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E85F606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 05:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P5Of73LV
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMf8C-0007Hk-WD; Fri, 30 Oct 2026 01:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1xMf8B-0007Hc-Sv
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 01:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1xMf8A-0003ML-3A
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 01:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793337981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TnBvos9RVeKePGwIM6MDBb1D9bojitbnrupJwU4Zieg=;
 b=P5Of73LVQc/mkhTMdZqsdA74rr8Ef2Ku3VAfLyO8g4A6aAqeAPXaMLESyfW8Z7yGI9Akh0
 7skFTrOTrOJ6WhdH0R8xXrJQlWCBGp9l6qriv4dEqibKWVJCxZx/nQkwtHHBQRzbHsYMlI
 6zui7wOYbpy3l+eDev/xUvH8Yy32nqE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-AFG2-zYVOp6kdjREyzZduA-1; Fri, 30 Oct 2026 01:26:19 -0400
X-MC-Unique: AFG2-zYVOp6kdjREyzZduA-1
X-Mimecast-MFC-AGG-ID: AFG2-zYVOp6kdjREyzZduA_1793337979
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3ab67ff8ec3so249638a91.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 22:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793337979; x=1793942779;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TnBvos9RVeKePGwIM6MDBb1D9bojitbnrupJwU4Zieg=;
 b=AJmR7RQ851EmcaNZCjKmYl+5FHJE/d6dBjM6yrT68d386iuAGGQLYJhWwYVLKDyoht
 aqPBLFCNOkr/JERcavghgTbURfhwjGkrTT5f6jiTdno0F2zFbnHZPn93aRf+uJWnoZ1r
 0nPUaCLaonz1xTgKt/0vOhx/rN/e2EEAxzHyRrDD/vm9vjS6JBx3H3ibsQYK+UIgzQH2
 F9TOwgrgPO7JxwLf7EFdsZGkO2jP7OMxki+ETYcaD1r+gP0inhWJgZVVTDEpXOMQP7Fm
 qfBSsdBtyGaLqjVqmMLUy0KRGMnmfHZHCUzpir0ZROK35TKiqO0cKa6zC+HV9qtkFwPw
 fM1A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzNaqSKs1DvcoDVHLty03Q5a/zy48CBvJukKGIeN2EDkcqVmv3yzedlyvx3O2mIYnp7Nd3RV1GK9g==@nongnu.org
X-Gm-Message-State: AFq9FYJzwaMBRhum+lNqbMni0u1Sm30cRdDNSSHyyf9BFWq3Qfr8HEr7
 js1NYjV2Bzc59ggnWXj7MR3S51UuJUJUefmpS53Rx17H1qkREsIz8k4PAppGcOx1CFfVIKlDSEg
 +nz/nBtNnrZ1QT9po7SYkswdm3ep2bnzKpU2YrZzO4/1WMzPesWNZRWPjCXZ3G8unNAs0F7lbhm
 /bM2MjZkztcwc/catn/aYwD1AEjziH
X-Gm-Gg: AYBFou2484LLIiFWkIU5gGiPlUJzx43Ppm2nb9mqNqq2q1gzNPDPksVAoydOka8mv7I
 8gkineXUnCWDbvhLLg6s3Zle7p2uxOgUcS8ACLSJrGVtdEX51WQ+q1vSHOp5FSnTnA7ZOK2hiyJ
 DJOgd866O2bHmpNwamM4lLAFtcytusEl0gQJZzsORcTwl527NVCnECG7S74lWzI8cLaL1OLaxdA
 VC61bnICd+wzlSS
X-Received: by 2002:a17:90b:4c11:b0:3ac:8897:7b88 with SMTP id
 98e67ed59e1d1-3ae8985cb53mr996738a91.58.1793337978612; 
 Thu, 29 Oct 2026 22:26:18 -0700 (PDT)
X-Received: by 2002:a17:90b:4c11:b0:3ac:8897:7b88 with SMTP id
 98e67ed59e1d1-3ae8985cb53mr996710a91.58.1793337978119; Thu, 29 Oct 2026
 22:26:18 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029143742.294275-1-eric.auger@redhat.com>
 <20261029143742.294275-9-eric.auger@redhat.com>
In-Reply-To: <20261029143742.294275-9-eric.auger@redhat.com>
From: Mohammadfaiz Bawa <mbawa@redhat.com>
Date: Fri, 30 Oct 2026 10:56:01 +0530
X-Gm-Features: AclHuK_R-VEXVGZs9Wp4-jXBd10GMHKMhNuEBJ026QFIXmMT1wUrLKrjVdjKvn8
Message-ID: <CAJg9KkytEHptR1g4t8PFnaSTKF+uDv_-a1tX7CXvqrHnLPvrpA@mail.gmail.com>
Subject: Re: [PATCH v2 for-11.2 8/9] target/arm/kvm: Introduce
 kvm_arm_vcpu_prepare_init_features helper
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, skolothumtho@nvidia.com, 
 philmd@oss.qualcomm.com, 7746591750@163.com, maobibo@loongson.cn, 
 harshpb@linux.ibm.com, amachhiw@linux.ibm.com, 
 daniel.barboza@oss.qualcomm.com, milesg@linux.ibm.com, farman@linux.ibm.com, 
 cohuck@redhat.com, alireza.sanaee@huawei.com, armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sVFJn2m2Wb2IdBYirMntCRgmwPKAYFI1uDQF9GGo1ms_1793337979
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mbawa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 8:08=E2=80=AFPM Eric Auger <eric.auger@redhat.com> =
wrote:
>
> Factorize the code that initializes the kvm init features from the
> cpu settings in a helper. Use it in kvm_arch_init_vcpu(). Soon it will
> be used by another function.
>
> The only change in the code relates to the check of kvm_state. The
> future caller won't have the VM created when calling the helper and
> for this caller it is OK ignoring PSCI version setting.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gromero@redhat.com>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> ---
>  target/arm/kvm.c | 50 ++++++++++++++++++++++++++++--------------------
>  1 file changed, 29 insertions(+), 21 deletions(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 2d37c2bfb4..1c5be9ecf4 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -2015,34 +2015,18 @@ int kvm_arch_pre_create_vcpu(CPUState *cpu, Error=
 **errp)
>      return 0;
>  }
>
> -int kvm_arch_init_vcpu(CPUState *cs, Error **errp)
> +/* Determine init features for this CPU */
> +static void kvm_arm_vcpu_prepare_init_features(ARMCPU *cpu)
>  {
> -    int ret;
> -    uint64_t mpidr;
> -    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUState *cs =3D CPU(cpu);
>      CPUARMState *env =3D &cpu->env;
> -    uint64_t psciver;
>
> -    if (cpu->kvm_target =3D=3D QEMU_KVM_ARM_TARGET_NONE) {
> -        error_setg(errp, "KVM is not supported for this guest CPU type")=
;
> -        return -EINVAL;
> -    }
> -
> -    if (cpu->kvm_target =3D=3D QEMU_KVM_ARM_TARGET_CORTEX_A53 ||
> -        cpu->kvm_target =3D=3D QEMU_KVM_ARM_TARGET_CORTEX_A57) {
> -        warn_report_once("Using the cortex-a53 and cortex-a57 CPU types =
"
> -                         "with KVM is deprecated. Use the max or host CP=
U "
> -                         "types instead.");
> -    }
> -
> -    qemu_add_vm_change_state_handler(kvm_arm_vm_state_change, cpu);
> -
> -    /* Determine init features for this CPU */
>      memset(cpu->kvm_init_features, 0, sizeof(cpu->kvm_init_features));
> +
>      if (cs->start_powered_off) {
>          cpu->kvm_init_features[0] |=3D 1 << KVM_ARM_VCPU_POWER_OFF;
>      }
> -    if (cpu->psci_version !=3D QEMU_PSCI_VERSION_0_1 &&
> +    if (cpu->psci_version !=3D QEMU_PSCI_VERSION_0_1 && cs->kvm_state &&
>          kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
>          /*
>           * Versions >=3D v0.2 are backward compatible with v0.2
> @@ -2066,6 +2050,30 @@ int kvm_arch_init_vcpu(CPUState *cs, Error **errp)
>      if (cpu->has_el2 && kvm_arm_el2_supported()) {
>          cpu->kvm_init_features[0] |=3D 1 << KVM_ARM_VCPU_HAS_EL2;
>      }
> +}
> +
> +int kvm_arch_init_vcpu(CPUState *cs, Error **errp)
> +{
> +    int ret;
> +    uint64_t mpidr;
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    uint64_t psciver;
> +
> +    if (cpu->kvm_target =3D=3D QEMU_KVM_ARM_TARGET_NONE) {
> +        error_setg(errp, "KVM is not supported for this guest CPU type")=
;
> +        return -EINVAL;
> +    }
> +
> +    if (cpu->kvm_target =3D=3D QEMU_KVM_ARM_TARGET_CORTEX_A53 ||
> +        cpu->kvm_target =3D=3D QEMU_KVM_ARM_TARGET_CORTEX_A57) {
> +        warn_report_once("Using the cortex-a53 and cortex-a57 CPU types =
"
> +                         "with KVM is deprecated. Use the max or host CP=
U "
> +                         "types instead.");
> +    }
> +
> +    qemu_add_vm_change_state_handler(kvm_arm_vm_state_change, cpu);
> +
> +    kvm_arm_vcpu_prepare_init_features(cpu);
>
>      /* Do KVM_ARM_VCPU_INIT ioctl */
>      ret =3D kvm_arm_vcpu_init(cpu);
> --
> 2.53.0
>

Reviewed-by: Mohammadfaiz Bawa <mbawa@redhat.com>


