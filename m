Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2B9C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 22:44:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjPNw-0000Ox-QG; Mon, 13 Jul 2026 18:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wjPNv-0000Oh-85
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 18:44:23 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wjPNs-0003gQ-W6
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 18:44:22 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-8486ac3f347so365089b3a.1
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 15:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783982659; x=1784587459; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=LgcBlPclbkMdbp/HtCXTu51Kc/xPI2S2dvfoAEfAMNM=;
 b=q9YWIdnIjpolD3h27FlGF4kg5T4lJ/zBASnjK0MyFDVCvnv1DnlPap/PelQkghu3w2
 NkRDWf3KPrB9W6tQHyiUASRecPsKJ/xaXpV6D3sGCwxNtUyvW3Q1fDj5a4iJzlPOJl6E
 K9EkOfongAOwCWz22diJ+QGOSifTpeLVAvtA0SftqEW2tui1gTN6L4/NHUFU4AF6h80Q
 qlSICvznxBbGj/Ue8Nxj/2SXXRN98XWHSpjP7HRMNubiBP9P/D6bOsahC0Z3ODQ/ZFA3
 qRPzuk1c4NB5bZSZ9aOW28loirkQrWNddSBrXWZdxXZpZjHrwxN1uJhmGHOvR/Q6APLs
 XGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783982659; x=1784587459;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LgcBlPclbkMdbp/HtCXTu51Kc/xPI2S2dvfoAEfAMNM=;
 b=rKMiWnKjEVAiKeGz4ky/C1HuU0tUlIb7Q2vZYwOOcRKoLfnW7kYZM/Vg0HLjSwkP/Y
 +IbXg//yBiKg3POhdw4d+qhezhGGpvHFIzfU2auroUc7pweQ67Zd9faOXDS0q2GPZXzm
 +74rMEI00rqM1hOC5muabSRRrmSRwDGADnl2BgkogVYDCtPb+ff+ijz3FhL6GU0z+Kqa
 3lzDuH8iP0tzWkh8ZXaCAn7DykMLDbkBNdqimTw3W7tOxT3vAWYB2Or3dCHpUGMSZc/m
 tKpi67IvVttD6CjIKBUtTJGmYHJWDpGwJEngT04WSQfxOoY3rH9Y7KOw8VC07RoZ64b3
 OX0A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp6n8Odpx9x8DlJyCTBpXuDIcJwsPMBFBgLBDM8sSAZIlI2xmjildOmWQJVJT8g0HvzBwcODHJ3ng==@nongnu.org
X-Gm-Message-State: AOJu0YxjNSd60GRL4kGrUXPEw2PZBi53LA6YLdd4yKfX4bMy5EO/UNL/
 DWcfefVhSCvSCDEvcqAtndxA+UfcSn3rhzgvqrmOEDoS36lt/y08zfJs2igB82Xa75U=
X-Gm-Gg: AfdE7clBhsgLrGPsp+GJgHbHE2L0HSLB0cOPk+aOEnfe1m0ff5w2ojKqLfg6S2XPFKT
 Qu72/L9wUlTNumkPDmK6eRn7C2+gHfDXE5RJiGccjEU4xLZUSXhyAic0lpcYxqgfGF8THsa7gAA
 YnxYxi1KCorgsUF2vVZjjWmSQkMTpmFlP+L/aGj4qoesvvMbzQ7z18qGwEgoZEScLmrSoOoOrac
 j2xA/QwPMMmoPnXKsTmBqfq316vfPXarsebPZpUVMwwZ3G8wFj1oqJJvnizU/BPXj5F6KJ+/cXO
 SEXTgbQAdHe75eLYUUv2ytkCgCjDVQrGdEzfU0LekuTXvEsrc5aNuXg5XfOwVzmV3sCkpOoLC2M
 Cbf5RmEmvMMJrZ3NbnJENw7Nj2kC1w28yCI31XEBEwINpjTWfdmSJ+ACJEmki1+EG519XdN4UYg
 3qfR6FkHX2t4E4F6+W
X-Received: by 2002:a05:6a00:2286:b0:845:d2e3:b9c8 with SMTP id
 d2e1a72fcca58-8488acd5302mr8622187b3a.28.1783982658927; 
 Mon, 13 Jul 2026 15:44:18 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3ead:2a56:27bf:77cb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84a4f238f75sm464398b3a.9.2026.07.13.15.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 15:44:18 -0700 (PDT)
Date: Mon, 13 Jul 2026 16:44:15 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Gavin Shan <gshan@redhat.com>
Cc: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, jpb@kernel.org,
 lorenzo.pieralisi@linaro.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: Re: [RFC v1 04/25] target/arm/kvm-rme: Add mechanic to initialize
 realms
Message-ID: <alVqP3H9N5Hh5jyF@p14s>
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
 <20260707224306.1202330-5-mathieu.poirier@linaro.org>
 <618fa1ec-c986-4075-9b6f-c720b48d75ce@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <618fa1ec-c986-4075-9b6f-c720b48d75ce@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Jul 13, 2026 at 03:14:05PM +1000, Gavin Shan wrote:
> On 7/8/26 8:42 AM, Mathieu Poirier wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > Initialise an @rme_guest object and install a handler to get notified
> > when the Realm is ready to start.  That way we can finish reading the
> > Realm once we know everything is in place.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >   target/arm/kvm-rme.c  | 50 +++++++++++++++++++++++++++++++++++++++++++
> >   target/arm/kvm-stub.c |  5 +++++
> >   target/arm/kvm.c      |  7 +++++-
> >   target/arm/kvm_arm.h  |  9 ++++++++
> >   4 files changed, 70 insertions(+), 1 deletion(-)
> > 
> > diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> > index 42e1d1e7b859..b86b9d6a25cb 100644
> > --- a/target/arm/kvm-rme.c
> > +++ b/target/arm/kvm-rme.c
> > @@ -13,6 +13,7 @@
> >   #include "kvm_arm.h"
> >   #include "migration/blocker.h"
> >   #include "qapi/error.h"
> > +#include "qemu/error-report.h"
> >   #include "qom/object_interfaces.h"
> >   #include "system/confidential-guest-support.h"
> >   #include "system/kvm.h"
> > @@ -29,14 +30,63 @@ OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
> >                                             CONFIDENTIAL_GUEST_SUPPORT,
> >                                             { TYPE_USER_CREATABLE }, { })
> > +static RmeGuest *rme_guest;
> > +
> > +static void rme_vm_state_change(void *opaque, bool running, RunState state)
> > +{
> > +    if (!running) {
> > +        return;
> > +    }
> > +
> > +    kvm_mark_guest_state_protected();
> > +}
> > +
> >   static void rme_guest_class_init(ObjectClass *oc, const void *data)
> >   {
> >   }
> >   static void rme_guest_init(Object *obj)
> >   {
> > +    if (rme_guest) {
> > +        error_report("a single instance of RmeGuest is supported");
> > +        exit(1);
> > +    }
> > +    rme_guest = RME_GUEST(obj);
> >   }
> >   static void rme_guest_finalize(Object *obj)
> >   {
> >   }
> > +
> > +int kvm_arm_rme_init(MachineState *ms, KVMState *s)
> > +{
> > +    static Error *rme_mig_blocker;
> > +    ConfidentialGuestSupport *cgs = ms->cgs;
> > +
> > +    if (!rme_guest) {
> > +        return 0;
> > +    }
> > +
> > +    if (!cgs) {
> > +        error_report("missing -machine confidential-guest-support parameter");
> > +        return -EINVAL;
> > +    }
> > +
> > +    if (!kvm_vm_check_extension(s, KVM_CAP_ARM_RMI)) {
> > +        error_report("KVM doesn't support Realms");
> > +        return -ENODEV;
> > +    }
> > +
> > +    error_setg(&rme_mig_blocker, "RME: migration is not implemented");
> > +    migrate_add_blocker(&rme_mig_blocker, &error_fatal);
> > +
> > +    /*
> > +     * The realm activation is done last, when the VM starts, after all images
> > +     * have been loaded and all vcpus finalized.
> > +     */
> > +    qemu_add_vm_change_state_handler(rme_vm_state_change, NULL);
> > +
> > +    cgs->require_guest_memfd = true;
> > +    cgs->ready = true;
> > +    return 0;
> > +}
> 
> I think it's more reasonable to set ConfidentialGuestSupportClass::kvm_init to
> kvm_arm_rme_init in rme_guest_class_init(). confidential_guest_kvm_init()
> gets called in target/arm/kvm.c::kvm_arch_init(). With this, the pattern matches
> with that for x86.

I agree, it would be nice to align Arm with the other architectures that
support confidential guests.  Let me see what I can do.

Thanks for the review, I'll look at your other comment tomorrow.

Mathieu

> 
> More details can be found from commit 631a2ac5a4be ("i386/tdx: Implement tdx_kvm_init()
> to initialize TDX VM context").
> 
> Thanks,
> Gavin
> 
> > diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
> > index 88cbe8d85c41..eec1ca3dd2e5 100644
> > --- a/target/arm/kvm-stub.c
> > +++ b/target/arm/kvm-stub.c
> > @@ -119,3 +119,8 @@ char *kvm_print_register_name(uint64_t regidx)
> >   {
> >       g_assert_not_reached();
> >   }
> > +
> > +int kvm_arm_rme_init(MachineState *ms, KVMState *s)
> > +{
> > +    g_assert_not_reached();
> > +}
> > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > index ed99be7fd80c..28d5643d6779 100644
> > --- a/target/arm/kvm.c
> > +++ b/target/arm/kvm.c
> > @@ -660,7 +660,12 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
> >       hw_breakpoints = g_array_sized_new(true, true,
> >                                          sizeof(HWBreakpoint), max_hw_bps);
> > -    return 0;
> > +    ret = kvm_arm_rme_init(ms, s);
> > +    if (ret) {
> > +        error_report("Failed to enable RME: %s", strerror(-ret));
> > +    }
> > +
> > +    return ret;
> >   }
> >   unsigned long kvm_arch_vcpu_id(CPUState *cpu)
> > diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> > index e7c40fb003e4..6d058b0e08a2 100644
> > --- a/target/arm/kvm_arm.h
> > +++ b/target/arm/kvm_arm.h
> > @@ -240,4 +240,13 @@ void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3);
> >    */
> >   char *kvm_print_register_name(uint64_t regidx);
> > +/**
> > + * kvm_arm_rme_init
> > + * @ms: the machine state
> > + * @s: State of KVM
> > + *
> > + * Prepare the machine to be a Realm, if the user enabled it.
> > + */
> > +int kvm_arm_rme_init(MachineState *ms, KVMState *s);
> > +
> >   #endif
> 

