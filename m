Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF78CA5FCE
	for <qemu-arm@archiver.kernel.org>; Thu,  1 Oct 2026 23:43:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCQQE-0006uh-9O; Thu, 01 Oct 2026 19:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1xCQQA-0006tn-H2
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 19:42:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1xCQQ8-000342-By
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 19:42:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790898154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h1rty/hi1E13diYp3gmh8YwjoDszZTbFvppq31VQMDY=;
 b=JHsULws3a327/0dvdabsfgKW6zi32GbaIqzjvl++L51NJLCXxbtdEu9L2aFcOxnATAtvYz
 UmJvBGCNP0DJuFLtz7TLvLII8SuZ1TN75icc1jAsZ4qjnMgxleZYDvfriESwjdKrljjlT6
 v1h950aa1F7wtYIBh4kq9INatZ2MSqI=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-blYK6HklPwCNcIh8ZEFJOA-1; Thu, 01 Oct 2026 19:42:33 -0400
X-MC-Unique: blYK6HklPwCNcIh8ZEFJOA-1
X-Mimecast-MFC-AGG-ID: blYK6HklPwCNcIh8ZEFJOA_1790898152
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-39b6416441eso11890899a91.1
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 16:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790898152; x=1791502952;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h1rty/hi1E13diYp3gmh8YwjoDszZTbFvppq31VQMDY=;
 b=HcDl0+d/G/JQyWMU36hGsSfMxX6EK0Yya6S4GPggzAo3bF/mGcqZLiEvtmYhPvgGNo
 R0Rug7KZMm6dIPkiZlnjDeENDEkFypATAte+WEnEbV4cPRHhQr4OT5KBvWVvXYPR6/35
 yvORg1Wm2D7/vBYXBW1EZiSTpQ/lm7xUt5+JJCp8b7KLhlCufPcC7dT7QkaRVsYlMKER
 zZ7y4JjktqkCk+LZjdxyzXz5FL6SQYnEyvSzhHd6wVPCtqAROmPQZKSU2pFtKBgndKJA
 Fysejl6ZeHJzEZjVvFFz/FGYqri2Xst6cAbTdZBQwVi5u4p6GknC5SMvJN6hcsrKzziM
 oHoA==
X-Forwarded-Encrypted: i=1;
 AKwUvByyxB5MuJ3qeE93K//WkELO7ocdRebMX9uLAeU6rxsB9Trxho7C3jNS98x1pcIKlUE3XF0KOJQprg==@nongnu.org
X-Gm-Message-State: AFq9FYIzk8hYn4AKUjqujifLoo4P4FYYPlLVDUblavJV3HuEvkv7Gt1C
 XrjvUvAeo7k92aL+60EBYv5DTd5Bn9G/0Idwzl+z0biEs+svMwDGx9k3f9wRcev7ezVpLR1EsjC
 vsIzwhBeq4WjVoUmVBTkE+o0WAg9aalw8866vJ1u65WRjrbQsWuatvg==
X-Gm-Gg: AYBFou1qfdOKAXBlqQuN80FCARi9tAJZb1nnorQbmWPILNNXK0QUvjAHYLZzIaAhmUx
 l8soCfmVv64Q6aIgxmwUOuOdoWFqfMnJG4HadANFvDSCG0au2vIt0wm6B83nNiyfhipoZ5tAsQP
 nqn8cBqAqPeAVt5Le/rBNEgvVgr5W06qzQSufSBLu+YHd5XVel3azM2v5mS430GjtYFtKV74Nc7
 y4tKJ1vQTOTnhq2UNnQ3oIApx/rl5e5DBBUZAPhFmxHlKrOgKSGC2m9zHAtv/65v2+wYZml1VI0
 eU27b8Bth7HOTtsLm89UtvJnmZMRZoDpuRgDS98w/KBBrj6kzKEdLfDZgp9h5mPsien6/y0xExK
 yXt+qQRhVMcEcvoAJoXmIoe+ArAWzvJXfpf3sw98Frg==
X-Received: by 2002:a17:90b:1c86:b0:3a4:d5c0:f826 with SMTP id
 98e67ed59e1d1-3a6ce9b0fe4mr918281a91.65.1790898151995; 
 Thu, 01 Oct 2026 16:42:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1c86:b0:3a4:d5c0:f826 with SMTP id
 98e67ed59e1d1-3a6ce9b0fe4mr918273a91.65.1790898151463; 
 Thu, 01 Oct 2026 16:42:31 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a4f4709a7csm6244308a91.8.2026.10.01.16.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 16:42:30 -0700 (PDT)
Message-ID: <5461472f-8ab2-4549-b04f-85f0030b4b79@redhat.com>
Date: Fri, 2 Oct 2026 09:42:23 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 04/24] target/arm/kvm-rme: Add mechanic to initialize
 realms
To: Mathieu Poirier <mathieu.poirier@linaro.org>, berrange@redhat.com,
 kchamart@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
 lorenzo.pieralisi@linaro.org, enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-5-mathieu.poirier@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260903193611.1058589-5-mathieu.poirier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZMQ3zNZiXgu7ikP4rxmfyyXXkEfAoJKg9-aziO8CU_I_1790898152
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.331,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/4/26 5:35 AM, Mathieu Poirier wrote:
> Initialise an @rme_guest object and install a handler to get notified
> when the Realm is ready to start.  That way we can finish reading the
> Realm once we know everything is in place.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>   target/arm/kvm-rme.c | 51 ++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/kvm.c     | 15 +++++++++++--
>   2 files changed, 64 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> index 42e1d1e7b859..a4a5e195c196 100644
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
> @@ -29,12 +30,62 @@ OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
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
> +static int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
> +{
> +    KVMState *s = KVM_STATE(current_accel());
> +    static Error *rme_mig_blocker;
> +
> +    if (!rme_guest) {
> +        return 0;
> +    }
> +
> +    if (!kvm_vm_check_extension(s, KVM_CAP_ARM_RMI)) {
> +        error_setg(errp, "VM doesn't support Realms");
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
> +
>   static void rme_guest_class_init(ObjectClass *oc, const void *data)
>   {
> +    ConfidentialGuestSupportClass *klass = CONFIDENTIAL_GUEST_SUPPORT_CLASS(oc);
> +
> +    klass->kvm_init = kvm_arm_rme_init;
>   }
>   
>   static void rme_guest_init(Object *obj)
>   {
> +    ConfidentialGuestSupport *cgs = CONFIDENTIAL_GUEST_SUPPORT(obj);
> +
> +    if (rme_guest) {
> +        error_report("a single instance of RmeGuest is supported");
> +        exit(1);
> +    }
> +    rme_guest = RME_GUEST(obj);
> +    cgs->allow_convert_in_place = true;
>   }
>   
>   static void rme_guest_finalize(Object *obj)
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index ed99be7fd80c..401a6f669cbb 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -33,6 +33,7 @@
>   #include "hw/pci/pci.h"
>   #include "exec/memattrs.h"
>   #include "system/address-spaces.h"
> +#include "system/confidential-guest-support.h"
>   #include "gdbstub/enums.h"
>   #include "hw/core/boards.h"
>   #include "hw/core/irq.h"
> @@ -596,7 +597,8 @@ int kvm_arch_get_default_type(MachineState *ms)
>   
>   int kvm_arch_init(MachineState *ms, KVMState *s)
>   {
> -    int ret;
> +    Error *local_err = NULL;
> +    int ret = 0;
>       /* For ARM interrupt delivery is always asynchronous,
>        * whether we are using an in-kernel VGIC or not.
>        */
> @@ -610,6 +612,15 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>   
>       cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
>   
> +    /* Initialize confidential guest (Realm) if needed */
> +    if (ms->cgs) {
> +        ret = confidential_guest_kvm_init(ms->cgs, &local_err);
> +            if (ret < 0) {
            ^^^^^

            Code alignment issue here.

> +                error_report_err(local_err);
> +                return ret;
> +        }
> +    }
> +
>       /* Check whether user space can specify guest syndrome value */
>       cap_has_inject_serror_esr =
>           kvm_check_extension(s, KVM_CAP_ARM_INJECT_SERROR_ESR);
> @@ -660,7 +671,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>       hw_breakpoints = g_array_sized_new(true, true,
>                                          sizeof(HWBreakpoint), max_hw_bps);
>   
> -    return 0;
> +    return ret;
>   }
>   
>   unsigned long kvm_arch_vcpu_id(CPUState *cpu)

Thanks,
Gavin


