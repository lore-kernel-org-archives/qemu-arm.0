Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBA4C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 23:44:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whyPq-0007ch-TJ; Thu, 09 Jul 2026 19:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1whyPp-0007cB-Or
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 19:44:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1whyPn-0000Z9-La
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 19:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783640662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g4EYloUwHPFb9+k5XAAGETquHtV4tqhX91bkpTXI8ww=;
 b=ZCkL2VIX8VEX0NRTSKa+vPmQNnrFvYAatoaxdyPGMMlBdYI5tD+HqeNbHhfCK9efuudqQt
 ReL4U1B01Vj/sAL7kAq4brZ5pqmVRoaNMUznDr+HBTpb7lxV0Lgc7k389qW7PpYHTcImR/
 QPolJkHnsnOFiB3iuzSP0NKIKJSKEPA=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-qCD-r9J3PD2xrqRqveGfxw-1; Thu, 09 Jul 2026 19:44:20 -0400
X-MC-Unique: qCD-r9J3PD2xrqRqveGfxw-1
X-Mimecast-MFC-AGG-ID: qCD-r9J3PD2xrqRqveGfxw_1783640660
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-c88aab7c1d4so284319a12.3
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 16:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783640660; x=1784245460;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g4EYloUwHPFb9+k5XAAGETquHtV4tqhX91bkpTXI8ww=;
 b=EDgzi2d/2kAF0adiRS4C8OWcDjAvy0kwwMBD/6urpQz/6P739OEzqUP+4XG3C1PgPE
 7wrm6bUMQ3gradDlvbxuUnRGc/CtPGXftWbWX/ez9TcMppcwa91Q+qeXxHg+6PEG5N7N
 GeTdwHiQo600ZFUni3MWcesZhBloBSSkOh4wiF6YnR8PvQZruGDEXwC3Xu2yzjAYtYMQ
 PGHnCnfKw2p27HZWfyQVhnt1r3MJVvz73sgLF2cV+//CoROwmDxtSgM23eZTC6JDfiqq
 fxExKgBC2L2/kt1xkmELNY5p1PZ48r0mP1dngIzrgRO7u5jQCc16xsXTQqKi56j3aKTY
 7DkQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpcQ+dfyz8VWmhU+HM6XjINo0wKW6AmpJXum6Tr755z3kHi3COHV4Zlh9Oge01c5xxCv6xBNIekqw==@nongnu.org
X-Gm-Message-State: AOJu0YzmCMvOm3dGaixULWbWATGrdccZvUptUFst+mbkrX2iE5BowcdD
 wl2NcLKPyphGpKgMQX77T7FQEXGz8j34qlcs1pcuo8ZoKvoAWaZKdMVuqxCFxow/SqiRVt47IDj
 Fa/tAENr7q3n99j0M0Jz0F9ZzbHyDyDnGYHyYZEyIn9RZiNSiua6/HA==
X-Gm-Gg: AfdE7cnG0Hw9M+x8Q3ZlyTpvvCtOnZF8jNDz0LQusq8HZO4JNMOxnqDnq/+HAAdvgMK
 PE/6rXPINxi7nom7kdRAJDJECYYmMog8IOQz8pKnl2g8UMIajYteMJHgZMnH8Ml118E6PMGrArh
 1SD50+bCfTqqw/Tw07zGNrKKM346G7XJGzK5GLewfZbX7zTWLf/7wGvFkwbFlh3TF4apoYEXsAE
 wJkQukVqSMy3AgSY77RxLLlo3fslfHONJhh2F2mPg+0PSicTvpVXnpSU3DemWCWhMBodVuAkm4Z
 fYBR5BxQsNqY8mLTrRt6bXxjdBYA7cVhSTyd7lqSKyid9CVm0V/IX8ezLMV39aFG1iBEEsELcji
 rp3he8Sxs7nhrXglwwyWvA2fFwFlBjyJPQ4MWk/E6+0HJ6LXKcVlJag==
X-Received: by 2002:a05:6a21:4c13:b0:3bf:5539:f8f with SMTP id
 adf61e73a8af0-3c0bd0fa84emr11241161637.37.1783640659794; 
 Thu, 09 Jul 2026 16:44:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c13:b0:3bf:5539:f8f with SMTP id
 adf61e73a8af0-3c0bd0fa84emr11241136637.37.1783640659263; 
 Thu, 09 Jul 2026 16:44:19 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13b659c8572sm35146664c88.9.2026.07.09.16.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 16:44:18 -0700 (PDT)
Message-ID: <2a12f7ba-1c6c-460e-bbbe-07187548a719@redhat.com>
Date: Fri, 10 Jul 2026 09:44:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 09/25] target/arm/kvm-rme: Initialise Realm Initial
 Address space
To: Mathieu Poirier <mathieu.poirier@linaro.org>, berrange@redhat.com,
 kchamart@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com, jpb@kernel.org,
 lorenzo.pieralisi@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
 <20260707224306.1202330-10-mathieu.poirier@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260707224306.1202330-10-mathieu.poirier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LlAZu3q6UzzK8NeO1xfMDrRSLg22U2g6aftw0cJASgU_1783640660
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Mathieu,

On 7/8/26 8:42 AM, Mathieu Poirier wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Initialise the Realm's initial physical address space based on
> the VM's configuration.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>   hw/arm/boot.c         |  4 ++++
>   target/arm/kvm-rme.c  | 18 ++++++++++++++++++
>   target/arm/kvm-stub.c |  4 ++++
>   target/arm/kvm_arm.h  | 10 ++++++++++
>   4 files changed, 36 insertions(+)
> 

Thanks for the posting.

If RmeGuest::init_ram isn't needed in the future, this patch can be dropped.
There is no API exposed from (v14) host series to initialize RIPAS for the
specified IPA range, as we did in the earlier revisions. So this patch was
added for the earlier host serieses, not for (v14) host series any more?

Thanks,
Gavin

> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 9b7553dde5e1..bcab21d349b4 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -32,6 +32,7 @@
>   #include "qemu/option.h"
>   #include "qemu/units.h"
>   #include "qemu/bswap.h"
> +#include "kvm_arm.h"
>   
>   /* Kernel boot protocol is specified in the kernel docs
>    * Documentation/arm/Booting and Documentation/arm64/booting.txt
> @@ -1210,6 +1211,9 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
>       /* We assume the CPU passed as argument is the primary CPU.  */
>       info->primary_cpu = cpu;
>   
> +    /* Mark all Realm memory as RAM */
> +    kvm_arm_rme_init_guest_ram(info->loader_start, info->ram_size);
> +
>       /* Load the kernel.  */
>       if (!info->kernel_filename || info->firmware_loaded) {
>           arm_setup_firmware_boot(cpu, info);
> diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> index f763d5ed6199..697e7d507f0d 100644
> --- a/target/arm/kvm-rme.c
> +++ b/target/arm/kvm-rme.c
> @@ -22,8 +22,16 @@
>   #define TYPE_RME_GUEST "rme-guest"
>   OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
>   
> +#define RME_PAGE_SIZE qemu_real_host_page_size()
> +
> +typedef struct {
> +    hwaddr base;
> +    hwaddr size;
> +} RmeRamRegion;
> +
>   struct RmeGuest {
>       ConfidentialGuestSupport parent_obj;
> +    RmeRamRegion init_ram;
>   };
>   
>   OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
> @@ -91,6 +99,16 @@ int kvm_arm_rme_init(MachineState *ms, KVMState *s)
>       return 0;
>   }
>   
> +void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size)
> +{
> +    if (!rme_guest) {
> +        return;
> +    }
> +
> +    rme_guest->init_ram.base = base;
> +    rme_guest->init_ram.size = size;
> +}
> +
>   void kvm_arm_rme_vcpu_init(ARMCPU *cpu)
>   {
>       if (!rme_guest) {
> diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
> index 6d52f172c5df..790e1940fd8a 100644
> --- a/target/arm/kvm-stub.c
> +++ b/target/arm/kvm-stub.c
> @@ -42,6 +42,10 @@ bool kvm_arm_el2_supported(void)
>       return false;
>   }
>   
> +void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size)
> +{
> +}
> +
>   /*
>    * These functions should never actually be called without KVM support.
>    */
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 65ec1b970606..c7dc45595159 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -267,4 +267,14 @@ void kvm_arm_rme_vcpu_init(ARMCPU *cpu);
>    */
>   int kvm_arm_rme_vm_type(void);
>   
> +/*
> + * kvm_arm_rme_init_guest_ram
> + * @base: base address of RAM
> + * @size: size of RAM
> + *
> + * If the user requested a Realm, set the base and size of guest RAM, in order
> + * to initialize the Realm IPA space.
> + */
> +void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size);
> +
>   #endif


