Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp199799njg;
        Tue, 17 Sep 2024 07:14:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVV5KtF/irJBN6WNRog0/2b2QnEKZF22UxZj0VBLk8PiDHX3DElA/fvs0DoUrop2a/DL4qB7L5AbBuKng==@linaro.org
X-Google-Smtp-Source: AGHT+IEEyMIomLY32EooHg4H7A6fEfKa7RjidYpQk5bm21lrB4rVSqEGlc3uq6YLzWQFwWiPjVSs
X-Received: by 2002:a05:6214:419f:b0:6c3:55ea:aada with SMTP id 6a1803df08f44-6c57355e845mr360949836d6.14.1726582446578;
        Tue, 17 Sep 2024 07:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726582446; cv=none;
        d=google.com; s=arc-20240605;
        b=b4HFaANSzi0IfWiPZ7VDHosc1HGq/mmeVKs3LNGZChR7LuQEbd2GF1BDflSPMCIxlp
         FOIyXhyeyupJY8c1TmfCVuBCEB4Glf7SDKYwwCAvLSjEZqHPoWhyLR+oqaaJH+WFjsrk
         p50XoCyj81YpKuj8x7P6wGQ30hwr0Exv19QMU7KbDtRQFkHwTv+BRKg30Uy27otbOdwz
         hZpG0WxWXSVBI6zx5eE9hQ5spp85rWVvEHzcqVXAvF40JYQO/mJWUptiOi59UR1u9/7v
         MPmkTF8IwOpxyBY4MYzupz71uVAswag8j5LCH5ce0bCHoWa88Kl20ssedUuXk1YMw94A
         faCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=N7udBV8DnjjbmItnUiBGZDt0GCsRhaSBO2B9+CYpHhU=;
        fh=bWNGNLrtlXu7kP8iHppMIE1A3VSQpWs/AcmeryLn30s=;
        b=PA+ux4D7Iq424Moa5sY+hq7chqAGEYomQvf4kodzrlAxrh6jZsLfTMzsqVjZRIc+uZ
         MPpKewy/gnFM+Bge3EPjM8GP62qPyS3FVC68hwWwF2ZpqCQqbrrz+FmpC7kDivTfz1iw
         1WgsRLBACciEEhjm/uJqjwrMvI3hziLsZjO0EMmev7TBkaaUYANBFGMwCcBc4v2kkM1C
         kW0Bh8/R53bqgGi/PsjVJT7lO1SOolRLDjEytuaDBRhCW6OQGN8HAfxgUm7ZS7l5HKQT
         EDCPmbzDFOzEcXrnLjNuc3j0wErw3YaPjWpt9YGMoScrFYg+tuJ2xlCaXduiMY2qjN1D
         OB+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NDq2wVrw;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-459aaf37111si85689641cf.623.2024.09.17.07.14.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 07:14:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NDq2wVrw;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726582446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N7udBV8DnjjbmItnUiBGZDt0GCsRhaSBO2B9+CYpHhU=;
	b=NDq2wVrwaE81lPE02vC8fP0wFpvEfuZWijRpHnsdSyFSFV2VEIGbYV0j7+/wpXk6bO6ijX
	4nHl+rExYnE5HrI4sfO5sBtMUdBuWQ1t5YZInXAkbkGV9axiVmUwPGMYtTLx3m7cXoxfs9
	/gEm52iOZFgFfnxD5EpTY9QXFnyvhR8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-360-gfyGS6tBPumbdqOMsW6heg-1; Tue,
 17 Sep 2024 10:14:04 -0400
X-MC-Unique: gfyGS6tBPumbdqOMsW6heg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 65A301955F79;
	Tue, 17 Sep 2024 14:14:02 +0000 (UTC)
Received: from localhost (unknown [10.39.192.239])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6CDBA19560AA;
	Tue, 17 Sep 2024 14:13:59 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 gustavo.romero@linaro.org, alex.bennee@linaro.org,
 darren@os.amperecomputing.com, gankulkarni@os.amperecomputing.com
Subject: Re: [PATCH V2] arm/kvm: add support for MTE
In-Reply-To: <20240912091616.393685-1-gankulkarni@os.amperecomputing.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240912091616.393685-1-gankulkarni@os.amperecomputing.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 17 Sep 2024 16:13:56 +0200
Message-ID: <87bk0mtljv.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: MajoeCFe4Zdh

On Thu, Sep 12 2024, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com> wrote:

> Extend the 'mte' property for the virt machine to cover KVM as
> well. For KVM, we don't allocate tag memory, but instead enable
> the capability.
>
> If MTE has been enabled, we need to disable migration, as we do not
> yet have a way to migrate the tags as well. Therefore, MTE will stay
> off with KVM unless requested explicitly.
>
> This patch is rework of commit b320e21c48ce64853904bea6631c0158cc2ef227
> which broke TCG since it made the TCG -cpu max
> report the presence of MTE to the guest even if the board hadn't
> enabled MTE by wiring up the tag RAM. This meant that if the guest
> then tried to use MTE QEMU would segfault accessing the
> non-existent tag RAM.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
> ---
> Changes since V1:
> 	Added code to enable MTE before reading register
> id_aa64pfr1 (unmasked MTE bits).
>
> This patch is boot tested on ARM64 with KVM and on X86 with TCG for mte=on
> and default case(i.e, no mte).
>
>  hw/arm/virt.c        | 72 ++++++++++++++++++++++++++------------------
>  target/arm/cpu.c     |  7 +++--
>  target/arm/cpu.h     |  2 ++
>  target/arm/kvm.c     | 59 ++++++++++++++++++++++++++++++++++++
>  target/arm/kvm_arm.h | 19 ++++++++++++
>  5 files changed, 126 insertions(+), 33 deletions(-)
>

(...)

> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 849e2e21b3..29865609fb 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -39,6 +39,7 @@
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/ghes.h"
>  #include "target/arm/gtimer.h"
> +#include "migration/blocker.h"
>  
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_LAST_INFO
> @@ -119,6 +120,21 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>      if (vmfd < 0) {
>          goto err;
>      }
> +
> +    /*
> +     * MTE bits of register id_aa64pfr1 are masked if MTE is
> +     * not enabled and required to enable before VCPU
> +     * is created. Hence enable MTE(if supported) before VCPU
> +     * is created to read unmasked MTE bits.
> +     */

Maybe

"KVM will mask the MTE bits in id_aa64pfr1 unless the VMM has enabled
the MTE KVM capability, so do it here for probing."

?

> +    if (kvm_arm_mte_supported()) {
> +        KVMState kvm_state;
> +
> +        kvm_state.fd = kvmfd;
> +        kvm_state.vmfd = vmfd;
> +        kvm_vm_enable_cap(&kvm_state, KVM_CAP_ARM_MTE, 0);
> +    }
> +
>      cpufd = ioctl(vmfd, KVM_CREATE_VCPU, 0);
>      if (cpufd < 0) {
>          goto err;
