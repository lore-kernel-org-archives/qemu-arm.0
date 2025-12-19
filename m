Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB12D711CA
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Dec 2025 05:53:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWTPz-0007E1-T9; Fri, 19 Dec 2025 00:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1vWTPy-0007DI-Ax
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 00:52:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1vWTPw-0005a1-ML
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 00:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766123563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7x6j5a3NfXLyyHRfR4AIZGH8Jw5CNt+6316Uz5MXqg=;
 b=c07+jNZTiVTJPiHmFHu+hrUdIHcNBas2NqPPjQbJamExgb0JHjczwOPBOZUG3y/xC80XHL
 ITw/TJFGG9+9FZ7mf4B1flSG68dfAFXl+lNN/ybDsXX+k6Kh9BYJb8kOVjggGLtZbBMNeX
 0ZWq1bjkmAFsnMjb2jqyb4EVVi6gxOw=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-bc-eQy2QOmqaaFd6s6usGg-1; Fri, 19 Dec 2025 00:52:39 -0500
X-MC-Unique: bc-eQy2QOmqaaFd6s6usGg-1
X-Mimecast-MFC-AGG-ID: bc-eQy2QOmqaaFd6s6usGg_1766123558
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7b90740249dso2602005b3a.0
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 21:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766123558; x=1766728358;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JJVwqGdURiRGJsYInZDpCrCMlBUPnbvc668rjGArdHA=;
 b=sP8ekGyZbiyDc6qVu/0TmiCBqEhfFCnQRnwS+iCmReA2dWxgpA+zWz3hKO77WVTu82
 l9Kns7YFyJ2vQeSZJIx470tiPOIi3D5+dTz7c6jWdTd9Z70MMOYENFqOB0kN8/D9Tkiz
 kznwMKDVAdY+g/PgtI+nbNMPAjkeIu8PIMrH5yt+k+ZW1jvG95NfWrLZDHLmASBNcXdk
 V/0oEVpyMbcEoYg9gGgINH9KWBfveq+nR1BB+QyT9Emj0id+v6NUU7+s3MY+EKYAeOGV
 48XaLRlquJbzvllgIz2w949ODetFnE8ZCJazHmI/zd62hymuPVCmCuruNJs9QafwGEe+
 mIzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb1EFQC011TTKDcvyHLQ9Mzx+hEz0OaHuUtQ3tr8wA2AxRmpeVj+gIZyeF25kQ0Bk8kT/yD/fVzg==@nongnu.org
X-Gm-Message-State: AOJu0YwZKcZoZsSeitQYUtYhrOYdBgRmihD3uw4sifGOeWIGgSLUd/Zi
 AQT0TBOecRPtbikzSoIQr2wxFj6bo+W6RAe2z8u/paONNQ+eGhfTrzad4//ci90S5N0V7xog8D6
 bGMCB6W++m0r3jgtITEWxo1m2nRQJMRjw/B6UfTVbbm7/QCmxoU2Fuw==
X-Gm-Gg: AY/fxX4lrABzbH0KftS8nMz4s8ODcBSZ976iivIcoo4zbyP6+zTMt35KAcGVwwAcogz
 2k7fuyTTTi8i20NBPDgv7V9Vyrw3Kxw24C+JZrCUYdMMfQovW4o4jGoqN1M8PRwVdZyuo07EKea
 QA1Ps0aAyJ5ckrOfa3fCIYsdY3HJeH2DwKg0T/xyXcMnzwPOOya/x4CFnOTbJZimbgngEiS5//X
 cR2hwgAvX9RS+QH3BfWlhzZtvkqgzq6Wapr2h4DAVpgMwoz7fU8nW2NDyK7ouKR86hMvI0uqEle
 wTKe59BcLwuXowmJ3SFoEXRmtumScmtQTgDT5PqRB0vMyoZwnDrs29TL3cK2gIGrB22wjVLgVsC
 P38ha+1F/pwW8dbUWUTFi1fI6O2zi9/J9hNPHTlhTtUBTq9ZJnNXIBBGGsw==
X-Received: by 2002:a05:6a00:e13:b0:7e8:450c:61bc with SMTP id
 d2e1a72fcca58-7ff6607cfc0mr1791925b3a.44.1766123558531; 
 Thu, 18 Dec 2025 21:52:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqF/m7PhYSoU/kq0rN3DwIEZXBg4VgSAObW4lEgr3/k3Akp1nbvuOll/KxGLrqWsCct67vag==
X-Received: by 2002:a05:6a00:e13:b0:7e8:450c:61bc with SMTP id
 d2e1a72fcca58-7ff6607cfc0mr1791889b3a.44.1766123558070; 
 Thu, 18 Dec 2025 21:52:38 -0800 (PST)
Received: from smtpclient.apple ([122.163.94.242])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7af2b60bsm1134278b3a.15.2025.12.18.21.52.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Dec 2025 21:52:37 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.3\))
Subject: Re: [PATCH v1 04/28] accel/kvm: add changes required to support KVM
 VM file descriptor change
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20251212150359.548787-5-anisinha@redhat.com>
Date: Fri, 19 Dec 2025 11:22:16 +0530
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, kvm@vger.kernel.org,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Message-Id: <6725C685-0245-47D9-8DE3-5E2672B22D1B@redhat.com>
References: <20251212150359.548787-1-anisinha@redhat.com>
 <20251212150359.548787-5-anisinha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Thomas Huth <thuth@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81.1.3)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pf5K3XLse_dHJlH5Qc7SCSd76X6sAoPCh7PDigRa6RE_1766123558
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



> On 12 Dec 2025, at 8:33=E2=80=AFPM, Ani Sinha <anisinha@redhat.com> wrote=
:
>=20
> This change adds common kvm specific support to handle KVM VM file descri=
ptor
> change. KVM VM file descriptor can change as a part of confidential guest=
 reset
> mechanism. A new function api kvm_arch_vmfd_change_ops() per
> architecture platform is added in order to implement architecture specifi=
c
> changes required to support it. A subsequent patch will add x86 specific
> implementation for kvm_arch_vmfd_change_ops as currently only x86 support=
s
> confidential guest reset.

Some more fixes on this patch are in order which I will include in the next=
 spin up.

<snip>

>=20
> +static int kvm_reset_vmfd(MachineState *ms)
> +{
> +    KVMState *s;
> +    KVMMemoryListener *kml;
> +    int ret, type;
> +    Error *err =3D NULL;
> +
> +    s =3D KVM_STATE(ms->accelerator);
> +    kml =3D &s->memory_listener;
> +
> +    memory_listener_unregister(&kml->listener);
> +    memory_listener_unregister(&kvm_io_listener);
> +
> +    if (s->vmfd >=3D 0) {
> +        close(s->vmfd);
> +    }
> +
> +    type =3D find_kvm_machine_type(ms);
> +    if (type < 0) {
> +        return -EINVAL;
> +    }
> +
> +    ret =3D do_kvm_create_vm(s, type);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    s->vmfd =3D ret;
> +
> +    kvm_setup_dirty_ring(s);
> +
> +    /* rebind memory to new vm fd */
> +    ret =3D ram_block_rebind(&err);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +    assert(!err);
> +
> +    ret =3D kvm_arch_vmfd_change_ops(ms, s);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    if (s->kernel_irqchip_allowed) {
> +        do_kvm_irqchip_create(s);
> +    }
> +
> +    /* these can be only called after ram_block_rebind() */
> +    memory_listener_register(&kml->listener, &address_space_memory);
> +    memory_listener_register(&kvm_io_listener, &address_space_io);
> +
> +    /*
> +     * kvm fd has changed. Commit the irq routes to KVM once more.
> +     */
> +    kvm_irqchip_commit_routes(s);
> +
> +    return ret;
> +}
> +
> static int kvm_init(AccelState *as, MachineState *ms)
> {
>     MachineClass *mc =3D MACHINE_GET_CLASS(ms);
> @@ -4014,6 +4077,7 @@ static void kvm_accel_class_init(ObjectClass *oc, c=
onst void *data)
>     AccelClass *ac =3D ACCEL_CLASS(oc);
>     ac->name =3D "KVM";
>     ac->init_machine =3D kvm_init;
> +    ac->reset_vmfd =3D kvm_reset_vmfd;
>     ac->has_memory =3D kvm_accel_has_memory;
>     ac->allowed =3D &kvm_allowed;
>     ac->gdbstub_supported_sstep_flags =3D kvm_gdbstub_sstep_flags;
> diff --git a/include/system/kvm.h b/include/system/kvm.h
> index 8f9eecf044..ade13dd8cc 100644
> --- a/include/system/kvm.h
> +++ b/include/system/kvm.h
> @@ -358,6 +358,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s);
> int kvm_arch_pre_create_vcpu(CPUState *cpu, Error **errp);
> int kvm_arch_init_vcpu(CPUState *cpu);
> int kvm_arch_destroy_vcpu(CPUState *cpu);
> +int kvm_arch_vmfd_change_ops(MachineState *ms, KVMState *s);

Another API should be added here:
bool kvm_arch_supports_vmfd_change(void)

It should tell kvm_reset_vmfd() whether the underlying architectures would =
support all operations that need to be redone after vm file descriptor chan=
ge. If not, it should bail. Something like:

    /*                                                                     =
                                                               =20
     * bail if the current architecture does not support VM file           =
                                                               =20
     * descriptor change.                                                  =
                                                               =20
     */                                                                    =
                                                               =20
    if (!kvm_arch_supports_vmfd_change()) {                                =
                                                               =20
        error_report("This target architecture does not support KVM VM "   =
                                                                      =20
                     "file descriptor change.");                           =
                                                               =20
        return -EOPNOTSUPP;                                                =
                                                               =20
    }=20

>=20
> #ifdef TARGET_KVM_HAVE_RESET_PARKED_VCPU
> void kvm_arch_reset_parked_vcpu(unsigned long vcpu_id, int kvm_fd);
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 0d57081e69..919bf95ae1 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -1568,6 +1568,11 @@ void kvm_arch_init_irq_routing(KVMState *s)
> {
> }
>=20
> +int kvm_arch_vmfd_change_ops(MachineState *ms, KVMState *s)
> +{
> +    abort();
> +}
> +
> int kvm_arch_irqchip_create(KVMState *s)
> {
>     if (kvm_kernel_irqchip_split()) {
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 02819de625..cdfcb70f40 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -3252,6 +3252,11 @@ static int kvm_vm_enable_energy_msrs(KVMState *s)
>     return 0;
> }
>=20
> +int kvm_arch_vmfd_change_ops(MachineState *ms, KVMState *s)
> +{
> +    abort();
> +}
> +
> int kvm_arch_init(MachineState *ms, KVMState *s)
> {
>     int ret;
> diff --git a/target/loongarch/kvm/kvm.c b/target/loongarch/kvm/kvm.c
> index 26e40c9bdc..4171781346 100644
> --- a/target/loongarch/kvm/kvm.c
> +++ b/target/loongarch/kvm/kvm.c
> @@ -1312,6 +1312,11 @@ int kvm_arch_irqchip_create(KVMState *s)
>     return kvm_check_extension(s, KVM_CAP_DEVICE_CTRL);
> }
>=20
> +int kvm_arch_vmfd_change_ops(MachineState *ms, KVMState *s)
> +{
> +    return 0;

These and others should abort() uniformly instead of silently returning suc=
ess.

> +}
> +
> void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
> {
> }
> diff --git a/target/mips/kvm.c b/target/mips/kvm.c
> index 912cd5dfa0..28730da06b 100644
> --- a/target/mips/kvm.c
> +++ b/target/mips/kvm.c
> @@ -44,6 +44,11 @@ unsigned long kvm_arch_vcpu_id(CPUState *cs)
>     return cs->cpu_index;
> }
>=20
> +int kvm_arch_vmfd_change_ops(MachineState *ms, KVMState *s)
> +{
> +    return 0;
> +}
> +
> int kvm_arch_init(MachineState *ms, KVMState *s)
> {
>     /* MIPS has 128 signals */
> dif


