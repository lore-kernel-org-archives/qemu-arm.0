Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21604C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 05:14:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wj8zp-0001HD-N6; Mon, 13 Jul 2026 01:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wj8zl-0001Gp-8O
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 01:14:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wj8zi-0003ci-PU
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 01:14:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783919657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pd7YyxNvDAuEnjFNK+Ewr3cRxfagtzALbzN/XiFNig4=;
 b=SOZqtyxMyyqbyC546TvoIIny3UcSZf4tmNLdDNsIm6H67dR3lwsUI8pHHCoWubNH23Uzix
 DKH2r8rUBkReIpKrgDq42JZduKcXK/q2ljG98hsCqJMa5p5U/OyZtcUQRQvGZlIEjNarHZ
 qaIRj7aprBUyej6a4AgVbKQRQ24vekY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-v2kDeRTdOBylbCpHlkzo5A-1; Mon, 13 Jul 2026 01:14:15 -0400
X-MC-Unique: v2kDeRTdOBylbCpHlkzo5A-1
X-Mimecast-MFC-AGG-ID: v2kDeRTdOBylbCpHlkzo5A_1783919655
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2cc86a9ef97so59776525ad.3
 for <qemu-arm@nongnu.org>; Sun, 12 Jul 2026 22:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783919655; x=1784524455;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Pd7YyxNvDAuEnjFNK+Ewr3cRxfagtzALbzN/XiFNig4=;
 b=VQXDPIq8BFj6aFT2q8COSxCAyKDxUK0gMC1nKERo1TYXjO8Qkd2CZpoDui2XOIBfXq
 ZvCA4OcnE56s+U4UATtHpOnrI+i2btfAkvWVSwZwYFMr38qUrb3ljnoZAzBJYu0Hj1L0
 e3JMrIvpBDYLx5H7QMp3xsD22YCOH3ZOy0+VFd8nMOv0wFXY6CAVgOfBFnhT6q97RNzS
 QfzSG1IAYFpM7nmzwnCrUQP3/QtBf95R/cSiVgi9BXtffvIJBcuO4PB1xa1rLBR3nFSw
 qG+CwYAkPLCdVz5k30sNlXlyoXuSvHumpqKt0gEEd+AeACSz7uAsNZILNg1jqMIWzPF8
 Ba7Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RqHBj6LuFWm+j5TsMZS/Et4dE7DxGt8Ux6HgKKZs5U1Rnd1k0PUsAybIiXvEqwkliwuXMF2cUpRbA==@nongnu.org
X-Gm-Message-State: AOJu0Yz1L4D2hBy4QU+84itpAvr25d5BfKng5JQnd8fTYZMfMmyanNRw
 Dia03NYlDbo5qrldGnWRpNfdLZJxeNzRCbJs+P95tGBwaAd5PI1Do3MPG/ignyN2wHPByW8qOaM
 wKwgVdo8tjQ1FpVWPXWkPBTROJEMb9bwL4eXlcsXWSU78a8Lcqvwwbg==
X-Gm-Gg: AfdE7cnOFweSmkHfxwyk+tPA/0e6TaliR3XCUxM1zeY7I6jZpbmd+rPgo6zG6jtAi5c
 eVJEcPkIZW0EPdjCLaPYpxAH8vxao1QeIhFqh6p8LxqncIme2xzCsa3bX0bwjTK9uemVrUSo7wn
 Bi72ilKQALnoEsXcrjlTya//aK/VsfwbxtdnZPCwTDzL59mpmkM/DXlpFLakqkX+mH8MgebHAop
 novcCH7lkZ8Dl9QSe3e3HHIyzRWdHONdIEN0MMS34V4cXy+tsKHRAcZV7V4iYNyN3TXoNu7rWZe
 Sz7WMgY+y1kiwRKN8BCfkc4BJ/yk98N50Deaf7wp7tEUZcR+h2W++ZZ2f4qjHy4FHDvAU/HpC4T
 QWMc3GJ1Ouzxl0BqSzi0PMtXif5buWDUsvUyUIAHnvHg9qTgDOnH8iQ==
X-Received: by 2002:a17:903:2a88:b0:2c0:b5c1:8e22 with SMTP id
 d9443c01a7336-2ce9e9b9691mr77163535ad.12.1783919654713; 
 Sun, 12 Jul 2026 22:14:14 -0700 (PDT)
X-Received: by 2002:a17:903:2a88:b0:2c0:b5c1:8e22 with SMTP id
 d9443c01a7336-2ce9e9b9691mr77163245ad.12.1783919654157; 
 Sun, 12 Jul 2026 22:14:14 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc99cc5aasm93166495ad.0.2026.07.12.22.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jul 2026 22:14:13 -0700 (PDT)
Message-ID: <618fa1ec-c986-4075-9b6f-c720b48d75ce@redhat.com>
Date: Mon, 13 Jul 2026 15:14:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 04/25] target/arm/kvm-rme: Add mechanic to initialize
 realms
To: Mathieu Poirier <mathieu.poirier@linaro.org>, berrange@redhat.com,
 kchamart@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com, jpb@kernel.org,
 lorenzo.pieralisi@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
 <20260707224306.1202330-5-mathieu.poirier@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260707224306.1202330-5-mathieu.poirier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SnhOCd7RkI6_6MhdtZW5PufixZJHZLZmAg50iTAO20k_1783919655
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=170.10.129.124;
 envelope-from=gshan@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 7/8/26 8:42 AM, Mathieu Poirier wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Initialise an @rme_guest object and install a handler to get notified
> when the Realm is ready to start.  That way we can finish reading the
> Realm once we know everything is in place.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>   target/arm/kvm-rme.c  | 50 +++++++++++++++++++++++++++++++++++++++++++
>   target/arm/kvm-stub.c |  5 +++++
>   target/arm/kvm.c      |  7 +++++-
>   target/arm/kvm_arm.h  |  9 ++++++++
>   4 files changed, 70 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> index 42e1d1e7b859..b86b9d6a25cb 100644
> --- a/target/arm/kvm-rme.c
> +++ b/target/arm/kvm-rme.c
> @@ -13,6 +13,7 @@
>   #include "kvm_arm.h"
>   #include "migration/blocker.h"
>   #include "qapi/error.h"
> +#include "qemu/error-report.h"
>   #include "qom/object_interfaces.h"
>   #include "system/confidential-guest-support.h"
>   #include "system/kvm.h"
> @@ -29,14 +30,63 @@ OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
>                                             CONFIDENTIAL_GUEST_SUPPORT,
>                                             { TYPE_USER_CREATABLE }, { })
>   
> +static RmeGuest *rme_guest;
> +
> +static void rme_vm_state_change(void *opaque, bool running, RunState state)
> +{
> +    if (!running) {
> +        return;
> +    }
> +
> +    kvm_mark_guest_state_protected();
> +}
> +
>   static void rme_guest_class_init(ObjectClass *oc, const void *data)
>   {
>   }
>   
>   static void rme_guest_init(Object *obj)
>   {
> +    if (rme_guest) {
> +        error_report("a single instance of RmeGuest is supported");
> +        exit(1);
> +    }
> +    rme_guest = RME_GUEST(obj);
>   }
>   
>   static void rme_guest_finalize(Object *obj)
>   {
>   }
> +
> +int kvm_arm_rme_init(MachineState *ms, KVMState *s)
> +{
> +    static Error *rme_mig_blocker;
> +    ConfidentialGuestSupport *cgs = ms->cgs;
> +
> +    if (!rme_guest) {
> +        return 0;
> +    }
> +
> +    if (!cgs) {
> +        error_report("missing -machine confidential-guest-support parameter");
> +        return -EINVAL;
> +    }
> +
> +    if (!kvm_vm_check_extension(s, KVM_CAP_ARM_RMI)) {
> +        error_report("KVM doesn't support Realms");
> +        return -ENODEV;
> +    }
> +
> +    error_setg(&rme_mig_blocker, "RME: migration is not implemented");
> +    migrate_add_blocker(&rme_mig_blocker, &error_fatal);
> +
> +    /*
> +     * The realm activation is done last, when the VM starts, after all images
> +     * have been loaded and all vcpus finalized.
> +     */
> +    qemu_add_vm_change_state_handler(rme_vm_state_change, NULL);
> +
> +    cgs->require_guest_memfd = true;
> +    cgs->ready = true;
> +    return 0;
> +}

I think it's more reasonable to set ConfidentialGuestSupportClass::kvm_init to
kvm_arm_rme_init in rme_guest_class_init(). confidential_guest_kvm_init()
gets called in target/arm/kvm.c::kvm_arch_init(). With this, the pattern matches
with that for x86.

More details can be found from commit 631a2ac5a4be ("i386/tdx: Implement tdx_kvm_init()
to initialize TDX VM context").

Thanks,
Gavin

> diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
> index 88cbe8d85c41..eec1ca3dd2e5 100644
> --- a/target/arm/kvm-stub.c
> +++ b/target/arm/kvm-stub.c
> @@ -119,3 +119,8 @@ char *kvm_print_register_name(uint64_t regidx)
>   {
>       g_assert_not_reached();
>   }
> +
> +int kvm_arm_rme_init(MachineState *ms, KVMState *s)
> +{
> +    g_assert_not_reached();
> +}
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index ed99be7fd80c..28d5643d6779 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -660,7 +660,12 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>       hw_breakpoints = g_array_sized_new(true, true,
>                                          sizeof(HWBreakpoint), max_hw_bps);
>   
> -    return 0;
> +    ret = kvm_arm_rme_init(ms, s);
> +    if (ret) {
> +        error_report("Failed to enable RME: %s", strerror(-ret));
> +    }
> +
> +    return ret;
>   }
>   
>   unsigned long kvm_arch_vcpu_id(CPUState *cpu)
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index e7c40fb003e4..6d058b0e08a2 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -240,4 +240,13 @@ void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3);
>    */
>   char *kvm_print_register_name(uint64_t regidx);
>   
> +/**
> + * kvm_arm_rme_init
> + * @ms: the machine state
> + * @s: State of KVM
> + *
> + * Prepare the machine to be a Realm, if the user enabled it.
> + */
> +int kvm_arm_rme_init(MachineState *ms, KVMState *s);
> +
>   #endif


