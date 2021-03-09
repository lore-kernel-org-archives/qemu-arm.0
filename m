Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3146240lfg;
        Tue, 9 Mar 2021 12:36:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxYSm7YnCpWpxUlATcied4xB2FtgtiOyy2Th1ZOvItJSDEVxbIjBFO8gE8/ef6sDUIvXZ0
X-Received: by 2002:a05:6102:417:: with SMTP id d23mr18463345vsq.5.1615322176061;
        Tue, 09 Mar 2021 12:36:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615322176; cv=none;
        d=google.com; s=arc-20160816;
        b=DkJg1pILr2LYoqXmnbdyOfOAFie/NfMTaLOuKutPlCklghs1NrwJUA7z5waEsQ0KBi
         5r5XUt/gAfx8LsFs/DT2vVSK1bmgie+fuHYRrtfGevvrLSFxgYlQ75ZHt//JetsM0UqS
         YBOB0fY9GGuOoqVfuXyA9lFzhKlUPxizUfQBqNpXFrXiGrfzxXMb4aDotLCORfqd4cKh
         RXXLgxvTQNt84JuVUYys+9poW4RtONaPSimWiG1vFzbTMu8LA9KbY1tEe2A4d8zuKTWE
         PhYag4uVCAOQoTZmnGBb1smm5a7jkcs7lLb5cDbynj9BSnrLeBkbKgUQRf/xE2prVDG+
         VFmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=V31TjWu6XYS8JIBkyxYoGF9fOdBz5OJ6asSh2+PvSs4=;
        b=y/qL/RLrv86C+dklYhrFz52tMxXd+O6wDF6/Z89HV/LBrYGM7U8gZuJZc3Rwwi2UnX
         qiCTQ4AlSA4GVpZzWbk0CSkgK/5G7IN40cYzLw/e19moYnNu4p+pVhSwEaTgAQdwkzko
         Y3vvTPLeZpLngLFEDgKM1RVOd082VbJUNyCwaN5B0QpzUXdJXhKnvvK22axDNY/56jiM
         /RMhq8H5vrgkRi2nJrEA93OUxIWAZSkb0vFuZK5GGKjyXKEbVacjI3lsQkByMUMAl2SL
         /uk3HAdDFLML6+6gTYa/ceDPvFuYswWy1KZrxlegbRmkMv1XJkBOq7f3YKhqxWRz6/oR
         psrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Emp1+wLf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b4si2913229uaq.125.2021.03.09.12.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 12:36:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Emp1+wLf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJj5T-0002YT-AG
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 15:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lJicY-00021s-FS
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 15:06:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lJicV-0007zR-Ct
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 15:06:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615320378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V31TjWu6XYS8JIBkyxYoGF9fOdBz5OJ6asSh2+PvSs4=;
 b=Emp1+wLfKsQs6XKoPtst0q3V3BHcxgRBhuyaeLaV17hA8Y3o6LzQVM+Vlqn7MEoRq9Kg8a
 /jyn9q+AhBfA5j1cZeDB+1SHvnw9h2nHr/uUhzBIfvDh5EWt+7qmWMK/6LqhdIwRM7l7Lt
 bwfL9dklhUAJqxia9/5pykjBJnGR/K8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-himc4tNnOPqC0jOfO2y2Aw-1; Tue, 09 Mar 2021 15:06:17 -0500
X-MC-Unique: himc4tNnOPqC0jOfO2y2Aw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C7701005D57;
 Tue,  9 Mar 2021 20:06:15 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9433A1F406;
 Tue,  9 Mar 2021 20:06:10 +0000 (UTC)
Date: Tue, 9 Mar 2021 21:06:06 +0100
From: Andrew Jones <drjones@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] hw/arm/virt: KVM: The IPA lower bound is 32
Message-ID: <20210309200606.kjjbxyyzijv2qsd4@kamzik.brq.redhat.com>
References: <20210309185939.188431-1-drjones@redhat.com>
 <87eegoxhd5.wl-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <87eegoxhd5.wl-maz@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w6I1N6HyRnhG

On Tue, Mar 09, 2021 at 07:21:58PM +0000, Marc Zyngier wrote:
> Hi Andrew,
> 
> On Tue, 09 Mar 2021 18:59:39 +0000,
> Andrew Jones <drjones@redhat.com> wrote:
> > 
> > The virt machine already checks KVM_CAP_ARM_VM_IPA_SIZE to get the
> > upper bound of the IPA size. If that bound is lower than the highest
> > possible GPA for the machine, then QEMU will error out. However, the
> > IPA is set to 40 when the highest GPA is less than or equal to 40,
> > even when KVM may only support an IPA limit as low as 32. This means
> > KVM may fail the VM creation unnecessarily. Additionally, 40 is
> > selected with the value 0, which means use the default, and that gets
> > around a check in some versions of KVM, causing a difficult to debug
> > fail. Always use the IPA size that corresponds to the highest possible
> > GPA, unless it's lower than 32, in which case use 32.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  hw/arm/virt.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> > 
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 371147f3ae9c..7bf563715b4e 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -2547,14 +2547,13 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
> >                       "require an IPA range (%d bits) larger than "
> >                       "the one supported by the host (%d bits)",
> >                       requested_pa_size, max_vm_pa_size);
> > -       exit(1);
> > +        exit(1);
> >      }
> > +
> >      /*
> > -     * By default we return 0 which corresponds to an implicit legacy
> > -     * 40b IPA setting. Otherwise we return the actual requested PA
> > -     * logsize
> > +     * KVM requires the IPA size to be at least 32 bits.
> >       */
> > -    return requested_pa_size > 40 ? requested_pa_size : 0;
> > +    return requested_pa_size < 32 ? 32 : requested_pa_size;
> 
> Doesn't this break on older kernels (pre 233a7cb23531, which is
> anything up 4.19), where the 'type' parameter passed at VM creation
> time was expected to be 0 and nothing else?

Doh, of course!

> 
> I had a quick go at qemu a couple of weeks back and came up with the
> following hack, but never actually tested it (there is no way qemu can
> fit in the initramfs I am feeding to this damn machine...).
> 
> Thanks,
> 
> 	M.
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 371147f3ae..3301bb8dba 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2534,8 +2534,11 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>  static int virt_kvm_type(MachineState *ms, const char *type_str)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(ms);
> -    int max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms);
> +    int max_vm_pa_size;
>      int requested_pa_size;
> +    bool fixed_ipa;
> +
> +    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
>  
>      /* we freeze the memory map to compute the highest gpa */
>      virt_set_memmap(vms);
> @@ -2550,11 +2553,12 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>         exit(1);
>      }
>      /*
> -     * By default we return 0 which corresponds to an implicit legacy
> -     * 40b IPA setting. Otherwise we return the actual requested PA
> -     * logsize
> +     * We return the requested PA log size, unless KVM only supports
> +     * the implicit legacy 40b IPA setting, in which case we return 0.
>       */
> -    return requested_pa_size > 40 ? requested_pa_size : 0;
> +    if (fixed_ipa)
> +        return 0;
> +    return requested_pa_size;

Looks good to me. I think we should still ensure requested_pa_size is at
least 32 though. I can add that and test this tomorrow. Should I post it
with your authorship?

Thanks,
drew

>  }
>  
>  static void virt_machine_class_init(ObjectClass *oc, void *data)
> diff --git a/slirp b/slirp
> index 8f43a99191..ce94eba204 160000
> --- a/slirp
> +++ b/slirp
> @@ -1 +1 @@
> -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> +Subproject commit ce94eba2042d52a0ba3d9e252ebce86715e94275
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 00e124c812..5f576730e6 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -230,12 +230,14 @@ bool kvm_arm_pmu_supported(void)
>      return kvm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3);
>  }
>  
> -int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
> +int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
>  {
>      KVMState *s = KVM_STATE(ms->accelerator);
>      int ret;
>  
>      ret = kvm_check_extension(s, KVM_CAP_ARM_VM_IPA_SIZE);
> +    *fixed_ipa = !(ret > 0);
> +
>      return ret > 0 ? ret : 40;
>  }
>  
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index eb81b7059e..75d7133a35 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -311,10 +311,11 @@ bool kvm_arm_sve_supported(void);
>  /**
>   * kvm_arm_get_max_vm_ipa_size:
>   * @ms: Machine state handle
> + * @fixed_ipa: Indicate whether the IPA address space is a fixed value
>   *
>   * Returns the number of bits in the IPA address space supported by KVM
>   */
> -int kvm_arm_get_max_vm_ipa_size(MachineState *ms);
> +int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa);
>  
>  /**
>   * kvm_arm_sync_mpstate_to_kvm:
> @@ -409,7 +410,7 @@ static inline void kvm_arm_add_vcpu_properties(Object *obj)
>      g_assert_not_reached();
>  }
>  
> -static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
> +static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
>  {
>      g_assert_not_reached();
>  }
> 
> -- 
> Without deviation from the norm, progress is not possible.
> 

