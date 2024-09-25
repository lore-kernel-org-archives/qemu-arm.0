Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp305038njb;
        Wed, 25 Sep 2024 06:00:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlq83w44bOoDRpRuLpDHUTlJy2Jr7heob+gPdcHFTA+0EpVnmPkZBRHZ2yoSNuQASA5VrNil5T8dHVPg==@linaro.org
X-Google-Smtp-Source: AGHT+IG9aB1AjO9RUghhFJ5M8iehOLcQqMJRrQ+431l39Pbovd34tkhTG/+TJd9PjCyOZ8LeyIRl
X-Received: by 2002:a25:c481:0:b0:e24:9dec:40e6 with SMTP id 3f1490d57ef6-e24d85ac5e8mr1761428276.28.1727269206909;
        Wed, 25 Sep 2024 06:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727269206; cv=none;
        d=google.com; s=arc-20240605;
        b=al96Wyhayka06BZ86x9qn0JsrMYG/dDylsD8zURj8OULru5yxjEflnqaUftI5zYRob
         uO7uiPucZsbhgE+jP3eqkpANeVUnGAz4fbzQgKsgay5SlarJrsfF31Q0qyjAEJaEvS3Z
         uddacreD4RY8BQ7yyy0MJbjU/PCYTdZea1JbwbXbtVzT2yQV2b4HktxMiwtCVDgltcRI
         CsThqhQxw5sLNjRf1poC7csJOa3+RwQPGG880ZyYSSDda8P8iu7diq2iW+vK7h9H6TrY
         LH2A55W/LG377exRCC4YYPmiPN8FzHrEOlRnIQ5sJONFeRnalbpdpLNzDVBRkGott6eN
         uctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=rrjoMpF9/kns9trt8yQb/TJIx2Qo5Tf29m6MR5P0tCk=;
        fh=bWNGNLrtlXu7kP8iHppMIE1A3VSQpWs/AcmeryLn30s=;
        b=M7z5FME/0f06QAcQmlSvzXyjs3/Rf8cdWv+KAMJgePrqZv4eHPEZaj3C5CxAPWwdgL
         Yh3Egm+edBV5Mz0lG83yXSvO9i/rC0VB7rCGbln2YT8l4ux48ZPuB/1K31udSNQ63QHD
         VIb2u5CmUu0Akaj8fdothkNvCY4YQ0g576xe0b6bmGQLFsOu89EggxHiNQzxo4fV8uYG
         hggLBzuASIoakeAufQ8CarbwH8XjfxgtVK1xRneX0UiyOFys4ce25dM8COLsJhzCQ0Zf
         bSoVzIL3jCb13lv06K+QXhmJzIXQpb9+OazFIAZZnhMExA9NLc7zTQOYJVpsdvK1FLfy
         AY0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iFtqWqSx;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-45b5272d5e0si36912381cf.619.2024.09.25.06.00.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 06:00:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iFtqWqSx;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727269206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rrjoMpF9/kns9trt8yQb/TJIx2Qo5Tf29m6MR5P0tCk=;
	b=iFtqWqSxsF9sZMfGSSVeB/YRHGVR/eqSR1hA9CJm/3L1zLTNZ+yWEn50Ds000i8E+9OIUK
	EzHQfc6nuiAk/qfuqLYHNXimNaFKfyKkfSGKyNe7unKGd2ghR0D1ODNHpE2CAaEgpeASU3
	u75s3qb4HfQVsf+aYpPpUA9/spB+tq4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-80-sBnzVGviNZyfYYfzwG8AXw-1; Wed,
 25 Sep 2024 09:00:04 -0400
X-MC-Unique: sBnzVGviNZyfYYfzwG8AXw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 074991944D3F;
	Wed, 25 Sep 2024 13:00:03 +0000 (UTC)
Received: from localhost (unknown [10.33.192.244])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 812241955F0F;
	Wed, 25 Sep 2024 12:54:26 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 gustavo.romero@linaro.org, alex.bennee@linaro.org,
 darren@os.amperecomputing.com, gankulkarni@os.amperecomputing.com
Subject: Re: [PATCH V3] arm/kvm: add support for MTE
In-Reply-To: <20240920073725.410373-1-gankulkarni@os.amperecomputing.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240920073725.410373-1-gankulkarni@os.amperecomputing.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 25 Sep 2024 14:54:22 +0200
Message-ID: <87tte3sxkx.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: mS3tCp7wT6uy

On Fri, Sep 20 2024, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com> wrote:

Mostly nit-picking below, otherwise LGTM.

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

I think the more canonical way to express this would be

[$AUTHOR: reworked original patch by doing X to avoid problem Y]

>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>

Also, the S-o-b chain is a bit confusing that way, because you are
listed as author of the patch, but I'm in the chain in front of you -- I
think I should still be listed as the author?

> ---
>
> Changes since V2:
> 	Updated with review comments.
>
> Changes since V1:
> 	Added code to enable MTE before reading register
> id_aa64pfr1 (unmasked MTE bits).
>
> This patch is boot tested on ARM64 with KVM and on X86 with TCG for mte=on
> and default case(i.e, no mte).
>
>  hw/arm/virt.c        | 72 ++++++++++++++++++++++++++------------------
>  target/arm/cpu.c     | 11 +++++--
>  target/arm/cpu.h     |  2 ++
>  target/arm/kvm.c     | 57 +++++++++++++++++++++++++++++++++++
>  target/arm/kvm_arm.h | 19 ++++++++++++
>  5 files changed, 129 insertions(+), 32 deletions(-)
>

(...)

> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 19191c2391..8a2fc471ce 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2390,14 +2390,21 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>  
>  #ifndef CONFIG_USER_ONLY
>          /*
> -         * If we do not have tag-memory provided by the machine,
> +         * If we do not have tag-memory provided by the TCG,

Maybe

"If we run with TCG and do not have tag-memory provided by the machine"

?

>           * reduce MTE support to instructions enabled at EL0.
>           * This matches Cortex-A710 BROADCASTMTE input being LOW.
>           */
> -        if (cpu->tag_memory == NULL) {
> +        if (tcg_enabled() && cpu->tag_memory == NULL) {
>              cpu->isar.id_aa64pfr1 =
>                  FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 1);
>          }
> +
> +        /*
> +         * Clear MTE bits, if not enabled in KVM mode.

Maybe add "This matches the MTE bits being masked by KVM in that case."?

> +         */
> +        if (kvm_enabled() && !cpu->kvm_mte) {
> +                FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
> +        }
>  #endif
>      }
>  

(...)

> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 849e2e21b3..af7a98517d 100644
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
> @@ -119,6 +120,20 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>      if (vmfd < 0) {
>          goto err;
>      }
> +
> +    /*
> +     * MTE capability must be enabled by the VMM before creating
> +     * any VCPUs. The MTE bits of the ID_AA64PFR1 register are masked
> +     * if MTE is not enabled, allowing them to be probed correctly.

This reads a bit confusing. Maybe

"The MTE capability must be enabled by the VMM before creating any VCPUs
in order to allow the MTE bits of the ID_AA64PFR1 register to be probed
correctly, as they are masked if MTE is not enabled."


> +     */
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

(...)
