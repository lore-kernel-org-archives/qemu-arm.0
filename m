Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66845C44512
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Jul 2026 22:05:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkUCV-0004WQ-SZ; Thu, 16 Jul 2026 18:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wkUCU-0004W3-3A
 for qemu-arm@nongnu.org; Thu, 16 Jul 2026 18:05:02 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wkUCS-0001jO-6E
 for qemu-arm@nongnu.org; Thu, 16 Jul 2026 18:05:01 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-ca00f126b7eso4729608a12.2
 for <qemu-arm@nongnu.org>; Thu, 16 Jul 2026 15:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784239498; x=1784844298; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=b5j0f+ollCEoqfIjlMJS818pgRqCyg9kfb00GQ3Q4P8=;
 b=dB94ViRvqQYA62fJTGeClBSSESSyCoOO26LszHULZrpHtK3nKWi0I58cgzNi40TeG1
 kTl98LS7rXtxzac9E9FPpmhBFfLuFNoNcrk5fcJb+ZtNPmxFuay9cWNOQUhNgx/GR84J
 vL5vGvaT7N8TmtZjYAtn/FYf+4urZhXdzBL/CXfNpJSR8Iy1NOaLsB4ysF0nd6HTV8XW
 QagtPDmzKgYJPuw9iKgHUkvW4LuVpXc/MieM+JbUmzlhWu8MCnTeOID8DQg4JRdt1pmd
 jSUzlrYeYv2Qym8qEd+17LgzfRXyWCN5WWgNSKcChSu/aL32mkfMXa8EtAPoZ8Chvx98
 L93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784239498; x=1784844298;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=b5j0f+ollCEoqfIjlMJS818pgRqCyg9kfb00GQ3Q4P8=;
 b=rHEjZKkxWrkroKJUj4CM9GygLWFLNURRQVfjPGMUIFFzO3cuuGWmQ7+1tfl2+miz9P
 yxrbWdB9dhlUYIu4VFahF60TQFHj3Nb1Pl1Urm2tG7qip3rhxGn2Ymj2jetOj4832e2s
 ojPSrYC5ixWUWRoSnA1TBz0xth6Oij4rfeQcK+gVEptIQsbkrAm4x6nHxoV9NpnKwkId
 VlSeGMaoZxcyzaM31bui/UHuwd5FWWJmh5v4n4tymfVUIdfhC6Zn/bV+trj4TLgx407Y
 3ZchcUrOenUNYVAz/aNj291fZvdc8I+J9OelMohxVpv4iJFbmkpMB9dm6P8gasHHFXRs
 h1cQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqIjkjBrwO5QXpP1hp7BuZF1FGW396CJ23bDVRSD5xK5Xmi+s9Sqks/i9vdkN73Qo73L3YPpefoQw==@nongnu.org
X-Gm-Message-State: AOJu0YyAft8/2TRKhf/7OjWF1sG5r9bpCU6HstBG497/d9+6w0nivpzK
 txIfGwuYLBQlnIvk9yh4EXQwYSK4jVV72xZu5moY11xUn0ZYJ4yUyRMhKYboUYiB+kE=
X-Gm-Gg: AfdE7ck1cMNL+4dur58+ztgMYH/4jVDS4j+BudOoEBLbIT59aalU5vx2Gru5xkNPh+e
 rCGO52da1miKi/qMId0fYBwZ2QUtm0yj15cKViHr4TxhkGexxn34nzetEs/bGPzhbIgPMFUwXHt
 h8NX42swRXKZdVLLDi1IJGuQxyg+0N3nAW6QS6MRD6qLhzRvrnWRpwEDcb7nnH1nQczZf6E9bBy
 XVpXyIg42jDLex7L8j59Wswa6Ai/Vrtl6QPd5//z9jnt4mCSErLagmHJxQ4sdJxW3+K0fg2jI0v
 qKtsrewsjy0/o5E+MtLX+eI/1yHfeUETy5NPHJohUJbjpju5Mz+OMbStLz3r6wtKHRpCJHHHrDo
 e5dHcnbhrOIfKNVRKh8dnHpiy+mdK4TDvIbwoodB02EnoFhHwk2H2HSED6J/zF8c6csR9VpofU8
 HbvlLx1A==
X-Received: by 2002:a05:6a00:a29:b0:848:2f71:b656 with SMTP id
 d2e1a72fcca58-84a6739e5b1mr9204252b3a.65.1784239498450; 
 Thu, 16 Jul 2026 15:04:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:bc13:5578:20b0:9bee])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84a4f7dc8e7sm5355094b3a.47.2026.07.16.15.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 15:04:56 -0700 (PDT)
Date: Thu, 16 Jul 2026 16:04:53 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Gavin Shan <gshan@redhat.com>
Cc: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, jpb@kernel.org,
 lorenzo.pieralisi@linaro.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: Re: [RFC v1 09/25] target/arm/kvm-rme: Initialise Realm Initial
 Address space
Message-ID: <allVhevKwehXUoqz@p14s>
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
 <20260707224306.1202330-10-mathieu.poirier@linaro.org>
 <2a12f7ba-1c6c-460e-bbbe-07187548a719@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a12f7ba-1c6c-460e-bbbe-07187548a719@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pg1-x535.google.com
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

On Fri, Jul 10, 2026 at 09:44:11AM +1000, Gavin Shan wrote:
> Hi Mathieu,
> 
> On 7/8/26 8:42 AM, Mathieu Poirier wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > Initialise the Realm's initial physical address space based on
> > the VM's configuration.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >   hw/arm/boot.c         |  4 ++++
> >   target/arm/kvm-rme.c  | 18 ++++++++++++++++++
> >   target/arm/kvm-stub.c |  4 ++++
> >   target/arm/kvm_arm.h  | 10 ++++++++++
> >   4 files changed, 36 insertions(+)
> > 
> 
> Thanks for the posting.
> 
> If RmeGuest::init_ram isn't needed in the future, this patch can be dropped.
> There is no API exposed from (v14) host series to initialize RIPAS for the
> specified IPA range, as we did in the earlier revisions. So this patch was
> added for the earlier host serieses, not for (v14) host series any more?

I scrapped it.  There is a lot of churn in the kernel baselines and it is easy
to overlook a patch.

> 
> Thanks,
> Gavin
> 
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index 9b7553dde5e1..bcab21d349b4 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -32,6 +32,7 @@
> >   #include "qemu/option.h"
> >   #include "qemu/units.h"
> >   #include "qemu/bswap.h"
> > +#include "kvm_arm.h"
> >   /* Kernel boot protocol is specified in the kernel docs
> >    * Documentation/arm/Booting and Documentation/arm64/booting.txt
> > @@ -1210,6 +1211,9 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
> >       /* We assume the CPU passed as argument is the primary CPU.  */
> >       info->primary_cpu = cpu;
> > +    /* Mark all Realm memory as RAM */
> > +    kvm_arm_rme_init_guest_ram(info->loader_start, info->ram_size);
> > +
> >       /* Load the kernel.  */
> >       if (!info->kernel_filename || info->firmware_loaded) {
> >           arm_setup_firmware_boot(cpu, info);
> > diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> > index f763d5ed6199..697e7d507f0d 100644
> > --- a/target/arm/kvm-rme.c
> > +++ b/target/arm/kvm-rme.c
> > @@ -22,8 +22,16 @@
> >   #define TYPE_RME_GUEST "rme-guest"
> >   OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
> > +#define RME_PAGE_SIZE qemu_real_host_page_size()
> > +
> > +typedef struct {
> > +    hwaddr base;
> > +    hwaddr size;
> > +} RmeRamRegion;
> > +
> >   struct RmeGuest {
> >       ConfidentialGuestSupport parent_obj;
> > +    RmeRamRegion init_ram;
> >   };
> >   OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
> > @@ -91,6 +99,16 @@ int kvm_arm_rme_init(MachineState *ms, KVMState *s)
> >       return 0;
> >   }
> > +void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size)
> > +{
> > +    if (!rme_guest) {
> > +        return;
> > +    }
> > +
> > +    rme_guest->init_ram.base = base;
> > +    rme_guest->init_ram.size = size;
> > +}
> > +
> >   void kvm_arm_rme_vcpu_init(ARMCPU *cpu)
> >   {
> >       if (!rme_guest) {
> > diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
> > index 6d52f172c5df..790e1940fd8a 100644
> > --- a/target/arm/kvm-stub.c
> > +++ b/target/arm/kvm-stub.c
> > @@ -42,6 +42,10 @@ bool kvm_arm_el2_supported(void)
> >       return false;
> >   }
> > +void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size)
> > +{
> > +}
> > +
> >   /*
> >    * These functions should never actually be called without KVM support.
> >    */
> > diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> > index 65ec1b970606..c7dc45595159 100644
> > --- a/target/arm/kvm_arm.h
> > +++ b/target/arm/kvm_arm.h
> > @@ -267,4 +267,14 @@ void kvm_arm_rme_vcpu_init(ARMCPU *cpu);
> >    */
> >   int kvm_arm_rme_vm_type(void);
> > +/*
> > + * kvm_arm_rme_init_guest_ram
> > + * @base: base address of RAM
> > + * @size: size of RAM
> > + *
> > + * If the user requested a Realm, set the base and size of guest RAM, in order
> > + * to initialize the Realm IPA space.
> > + */
> > +void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size);
> > +
> >   #endif
> 

