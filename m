Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp13007njb;
        Mon, 3 Feb 2025 21:30:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUoqQw+iC4t4sKElGll1yUQDUlRpbL9Hr01r/vu8KYxa6jjexHtwgRe0TeKunFj52Zf982JveRQ11mp0g==@linaro.org
X-Google-Smtp-Source: AGHT+IG3SA+qYhjoTDZ0FjAs6Ren8QOABAC7MHckSdZgOYjDLTbj/QPhnvKo0GA3pec2bqk1obu7
X-Received: by 2002:a05:622a:4d0a:b0:467:630d:85ef with SMTP id d75a77b69052e-46fd0b6b4femr371818681cf.41.1738647011704;
        Mon, 03 Feb 2025 21:30:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738647011; cv=none;
        d=google.com; s=arc-20240605;
        b=GKL0Ywx10zSOPFijF8MCgduSWaf5JqlfvPokyVp26yJ2HKJrkxG3LNBfND3TA5lJBw
         htgg9w1ZF/WuOpjqnm8efU72y1rINpYRT9QDa0aZ8qegH5GaL5uaxkLVH5Sg1lnJs1mO
         Ntl+Ocmyn0yvhGTSunRvV1KVayn6IS+/YQPzt7MnxHb2OaINN7A8DQfPPNX6MLOanJhp
         vK3bleM6NDeHgTMAN83g4mG+oH6ODl86VX7xRbGJi+2x39hr2gjO0JsyihrsElS6WEnt
         teWpeEPtZ2p5hNV8KJQZ5XeJyfj9jkbd1eyg/oyO8reA28a6VUvHUX36qT6ul0to9YPN
         mkvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fsh1mX2fTPgCm5zaVVBg/eCP2E3sojwW1XaxhbF3L2g=;
        fh=dscOG/4AeXG51z9H8GAKKIkQa/i/wXNYX8a8uukuEH4=;
        b=jivtxvOyOmL1qkztDOT5U9pd9yxG40toPlYwDCuDjY3mufyDrLGFLedQF1bAogWPEH
         N++JYwbg985Sxc+P6i4xooWN7mgOFVtCguW0TJsB1YoXceC4tB1tzwP+h27RmQrjFaFi
         Xz6LqfjFwcC72+9EUEDgFwjKDISbOoYrrkDpSj9c0XJih7Jr/lSLNNDdWJlXCCwLUi93
         NPYWUqN7ZwTmNGcHeClCq6COjnStzUV+pyvHzYXnoFXKZUL+pza/KM3bbCGqrbKDItBI
         rL7Q5RATK+AHs2Xez9uZthLr4jrgbVG51FH431AEmbckcNQwzK14sr9oJH+xB2jNgDC1
         Uu1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a0lV6LwJ;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-47016bab97esi18258601cf.431.2025.02.03.21.30.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 21:30:11 -0800 (PST)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a0lV6LwJ;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738647011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fsh1mX2fTPgCm5zaVVBg/eCP2E3sojwW1XaxhbF3L2g=;
	b=a0lV6LwJpLFDCsW1cf3zvQOWT6L57llyd5v4QRfvxBYZC+a284WAhut8G+5nB0gOOLcfyA
	S4sq+AvtH8H5QW0P2YpykqHs8dHf1xJG7A9DrFn5Ip2MiJjxN2xxWUU8qTTTvbpY/BgXFz
	rsutnT6po5e6ybiR6gOoOb5swhkLeq0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-1eyrtw5bMyuStFJYnJsqUw-1; Tue, 04 Feb 2025 00:30:07 -0500
X-MC-Unique: 1eyrtw5bMyuStFJYnJsqUw-1
X-Mimecast-MFC-AGG-ID: 1eyrtw5bMyuStFJYnJsqUw
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef9e38b0cfso9603081a91.0
        for <alex.bennee@linaro.org>; Mon, 03 Feb 2025 21:30:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738647007; x=1739251807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsh1mX2fTPgCm5zaVVBg/eCP2E3sojwW1XaxhbF3L2g=;
        b=buTaBiVTTG2eXaeMD6MM1xqrLo4itcjzuLJ1IoktVu8i9ti0clJhzGJIna9yzZ2vn0
         Ec9QeIWXtt+0mJ+X655mcB0gqjqFayz/BI2bnq1XJqyxs1nsmc8kit2SrqdDjXYZMukc
         wP2nD/Zj2v2MdehuLQmaC7YuCUNhGm24f8AoiZAExG/RKGIjYJ57+9ePWIdjZDohg4BM
         V2QYCL72OKmUR983RvuqBs3BnAG80I6cfi85ciU7CvSJj17dKvPGr3U/3V4hWy9cdIqj
         ER/8Vmtmst8rk6rxtDoBEAmg2jiwGTiGn4R2vSCjvXW4lE4zgJSOudcJuouDu17lGb5W
         4wTg==
X-Forwarded-Encrypted: i=1; AJvYcCXwklp77+wJhCNCuuvsx/y6VlOS4zVSzRJe1WcnvFMwd+9uHz+8VCjwdZFRnF2afJw3vjagDYYn2aGdmg==@linaro.org
X-Gm-Message-State: AOJu0Yz6BR/2sxZt6xYEE3uY1SkUtUxEGmhpHRUdCUxKZH5vYBNM5Xpw
	D9J3t6eTHl2Ktog5FdWa3v8/IF3vuyFM6S+yfM3epT5KmI16BeNa0jC0Un+xQt4njOtPPaWoXjU
	Q3wVAK4Jnp5LPw+mDUuTa6yFNOYxMdwxSWZ3VxeNyd8w8+P4OwTO8OQ==
X-Gm-Gg: ASbGnctXBkxfp8vnZFPKklvWlmqWRbdZ6Jy0bodNS2KIxlh0UYUOziE7YdRHrbZ2qvA
	P4qTn0N1v5eOuYDezCPd2A3PNZKIerQxBlF9oGyiY5yNvkAQiVyk6qHvA0AmAqE0nC3Swkz3ifq
	wpj5utC9HyFQ/GwAjj/r0ngm6f56gN4PlSiWh7JEG8lg7jxkdjYTO09gpnCQIvdCrEkorpG3XEH
	jpmY1VLVHBisR+oY3lJx/yE9PljlFpvGkCa3JaunvhQPItkxPIoHoaYEmrVUo639zMr+mfluw15
	6Kamkg==
X-Received: by 2002:aa7:9306:0:b0:725:d956:aa6f with SMTP id d2e1a72fcca58-72fd0bc2572mr35091216b3a.5.1738647006642;
        Mon, 03 Feb 2025 21:30:06 -0800 (PST)
X-Received: by 2002:aa7:9306:0:b0:725:d956:aa6f with SMTP id d2e1a72fcca58-72fd0bc2572mr35091174b3a.5.1738647006219;
        Mon, 03 Feb 2025 21:30:06 -0800 (PST)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba44fsm9914108b3a.100.2025.02.03.21.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 21:30:05 -0800 (PST)
Message-ID: <91b825c4-462f-4663-8412-effa84c0863d@redhat.com>
Date: Tue, 4 Feb 2025 15:30:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/26] target/arm/kvm-rme: Initialize Realm memory
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, alex.bennee@linaro.org
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-11-jean-philippe@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241125195626.856992-11-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: re3KCf8SlgNKwC1TBX0i7t_kDYURAt4D34AIEZycY_4_1738647007
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: BuedgaQCwhFf

On 11/26/24 5:56 AM, Jean-Philippe Brucker wrote:
> Initialize the IPA state of RAM. Collect the images copied into guest
> RAM into a sorted list, and issue POPULATE_REALM KVM ioctls once we've
> created the Realm Descriptor. The images are part of the Realm Initial
> Measurement.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v2->v3: RIPAS is now initialized separately
> ---
>   target/arm/kvm_arm.h |  14 +++++
>   target/arm/kvm-rme.c | 128 +++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 142 insertions(+)
> 
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 8b52a881b0..67db09a424 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -255,6 +255,16 @@ int kvm_arm_rme_vm_type(MachineState *ms);
>    */
>   int kvm_arm_rme_vcpu_init(CPUState *cs);
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
>   #else
>   
>   /*
> @@ -281,6 +291,10 @@ static inline bool kvm_arm_mte_supported(void)
>       return false;
>   }
>   
> +static inline void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size)
> +{
> +}
> +
>   /*
>    * These functions should never actually be called without KVM support.
>    */
> diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> index e3cc37538a..83a29421df 100644
> --- a/target/arm/kvm-rme.c
> +++ b/target/arm/kvm-rme.c
> @@ -9,6 +9,7 @@
>   #include "exec/confidential-guest-support.h"
>   #include "hw/boards.h"
>   #include "hw/core/cpu.h"
> +#include "hw/loader.h"
>   #include "kvm_arm.h"
>   #include "migration/blocker.h"
>   #include "qapi/error.h"
> @@ -20,16 +21,85 @@
>   #define TYPE_RME_GUEST "rme-guest"
>   OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
>   
> +#define RME_PAGE_SIZE qemu_real_host_page_size()
> +
>   struct RmeGuest {
>       ConfidentialGuestSupport parent_obj;
> +    Notifier rom_load_notifier;
> +    GSList *ram_regions;
> +
> +    hwaddr ram_base;
> +    size_t ram_size;
>   };
>   

s/size_t/hwaddr. To be consistent with RmeRamRegion, we may reuse
it like below.

struct RmeGuest {
     :
     GSlist *populate_ram_regions;
     RmeRamRegion init_ram_region;
};

>   OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
>                                             CONFIDENTIAL_GUEST_SUPPORT,
>                                             { TYPE_USER_CREATABLE }, { })
>   
> +typedef struct {
> +    hwaddr base;
> +    hwaddr size;
> +} RmeRamRegion;
> +
>   static RmeGuest *rme_guest;
>   
> +static int rme_init_ram(hwaddr base, size_t size, Error **errp)
> +{
> +    int ret;
> +    uint64_t start = QEMU_ALIGN_DOWN(base, RME_PAGE_SIZE);
> +    uint64_t end = QEMU_ALIGN_UP(base + size, RME_PAGE_SIZE);
> +    struct kvm_cap_arm_rme_init_ipa_args init_args = {
> +        .init_ipa_base = start,
> +        .init_ipa_size = end - start,
> +    };
> +
> +    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
> +                            KVM_CAP_ARM_RME_INIT_IPA_REALM,
> +                            (intptr_t)&init_args);
> +    if (ret) {
> +        error_setg_errno(errp, -ret,
> +                         "failed to init RAM [0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx")",
                                                      ^^^^^^^^^^        ^^^^^^^^^^^
The type for 'start' and 'end' would be 'hwaddr'.

> +                         start, end);
> +    }
> +
> +    return ret;
> +}
> +
> +static int rme_populate_range(hwaddr base, size_t size, bool measure,
> +                              Error **errp)
> +{
> +    int ret;
> +    uint64_t start = QEMU_ALIGN_DOWN(base, RME_PAGE_SIZE);
> +    uint64_t end = QEMU_ALIGN_UP(base + size, RME_PAGE_SIZE);
> +    struct kvm_cap_arm_rme_populate_realm_args populate_args = {
> +        .populate_ipa_base = start,
> +        .populate_ipa_size = end - start,
> +        .flags = measure ? KVM_ARM_RME_POPULATE_FLAGS_MEASURE : 0,
> +    };
> +
> +    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
> +                            KVM_CAP_ARM_RME_POPULATE_REALM,
> +                            (intptr_t)&populate_args);
> +    if (ret) {
> +        error_setg_errno(errp, -ret,
> +                   "failed to populate realm [0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx")",
> +                   start, end);
> +    }
> +    return ret;
> +}
> +
> +static void rme_populate_ram_region(gpointer data, gpointer err)
> +{
> +    Error **errp = err;
> +    const RmeRamRegion *region = data;
> +
> +    if (*errp) {
> +        return;
> +    }
> +
> +    rme_populate_range(region->base, region->size, /* measure */ true, errp);
> +}
> +
>   static int rme_init_cpus(Error **errp)
>   {
>       int ret;
> @@ -60,6 +130,16 @@ static int rme_create_realm(Error **errp)
>           return -1;
>       }
>   
> +    if (rme_init_ram(rme_guest->ram_base, rme_guest->ram_size, errp)) {
> +        return -1;
> +    }
> +
> +    g_slist_foreach(rme_guest->ram_regions, rme_populate_ram_region, errp);
> +    g_slist_free_full(g_steal_pointer(&rme_guest->ram_regions), g_free);
> +    if (*errp) {
> +        return -1;
> +    }
> +
>       if (rme_init_cpus(errp)) {
>           return -1;
>       }
> @@ -105,6 +185,43 @@ static void rme_guest_finalize(Object *obj)
>   {
>   }
>   
> +static gint rme_compare_ram_regions(gconstpointer a, gconstpointer b)
> +{
> +        const RmeRamRegion *ra = a;
> +        const RmeRamRegion *rb = b;
> +
> +        g_assert(ra->base != rb->base);
> +        return ra->base < rb->base ? -1 : 1;
> +}
> +
> +static void rme_rom_load_notify(Notifier *notifier, void *data)
> +{
> +    RmeRamRegion *region;
> +    RomLoaderNotify *rom = data;
> +
> +    if (rom->addr == -1) {
> +        /*
> +         * These blobs (ACPI tables) are not loaded into guest RAM at reset.
> +         * Instead the firmware will load them via fw_cfg and measure them
> +         * itself.
> +         */
> +        return;
> +    }
> +
> +    region = g_new0(RmeRamRegion, 1);
> +    region->base = rom->addr;
> +    region->size = rom->len;
> +
> +    /*
> +     * The Realm Initial Measurement (RIM) depends on the order in which we
> +     * initialize and populate the RAM regions. To help a verifier
> +     * independently calculate the RIM, sort regions by GPA.
> +     */
> +    rme_guest->ram_regions = g_slist_insert_sorted(rme_guest->ram_regions,
> +                                                   region,
> +                                                   rme_compare_ram_regions);
> +}
> +
>   int kvm_arm_rme_init(MachineState *ms)
>   {
>       static Error *rme_mig_blocker;
> @@ -132,11 +249,22 @@ int kvm_arm_rme_init(MachineState *ms)
>        */
>       qemu_add_vm_change_state_handler(rme_vm_state_change, NULL);
>   
> +    rme_guest->rom_load_notifier.notify = rme_rom_load_notify;
> +    rom_add_load_notifier(&rme_guest->rom_load_notifier);
> +
>       cgs->require_guest_memfd = true;
>       cgs->ready = true;
>       return 0;
>   }
>   
> +void kvm_arm_rme_init_guest_ram(hwaddr base, size_t size)
> +{
> +    if (rme_guest) {
> +        rme_guest->ram_base = base;
> +        rme_guest->ram_size = size;
> +    }
> +}
> +
>   int kvm_arm_rme_vcpu_init(CPUState *cs)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);

Thanks,
Gavin
