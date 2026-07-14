Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5528DC43458
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Jul 2026 10:53:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjal4-0008Ks-Su; Tue, 14 Jul 2026 06:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wjal2-0008KA-9G
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 06:53:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wjakz-0003FJ-Jl
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 06:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784026375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a2PTzILu9qclnqywy4EwJ0RRR+3PTplTn770qnj4URY=;
 b=LcWa2vmoxBXx7EZBX2LmnWXH1hU7E5lK5BTEZ9jyhYUGu2KosiJQNwY03hL4VVsziSDGfW
 WB/ktdsih1/NkPWrg04fw+ClgOTTjrpsqeRAyT5gu2nMyWTqOa33OWRoMMdW5w+tEex0qc
 Gte2qZGJ1EByXPa5tYIoFpm/0LakuIY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-IEHbqSqDMECg6WIaAXff2A-1; Tue, 14 Jul 2026 06:52:53 -0400
X-MC-Unique: IEHbqSqDMECg6WIaAXff2A-1
X-Mimecast-MFC-AGG-ID: IEHbqSqDMECg6WIaAXff2A_1784026373
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3811ae55313so898281a91.3
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 03:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784026373; x=1784631173;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=a2PTzILu9qclnqywy4EwJ0RRR+3PTplTn770qnj4URY=;
 b=Y6BEGKyeFIAPoTELaDxApN14iPeKNhsMpxzReDYJPSiLYtvc6O4STi/FyEQ/9baQyq
 YEgt6dfwsdTWMyJq++NaIQtcKa1U1ndOZw7RuxonQQkBCNVMBeGBYUqVp5sfYmQ2IXge
 r1s5y3F9SBMyYM/U6JN4EtGDD+bUUOHhQdVs+CIdi56xOvMt/4t6H9KV+1End5ryTxlR
 w25LwWVWsYwd69oeIDyxwKSwyqCvCR5llk65MP0KLQ/mHmxK2NOndujV290iSq6T+rIr
 3ue5IzmUNZ60tIr44x9Aph46UKY67in3T1DDxYG+LXIKzX7vPzGltJvz56yYeOq5ivrm
 sMUA==
X-Forwarded-Encrypted: i=1;
 AHgh+RptHieiauEv+uqghnQjA1M4fl7rW/yuoovoNr7UABQ1zez+/QepeYbi1Msxdlr1hvEqzFZSQ3qJkw==@nongnu.org
X-Gm-Message-State: AOJu0YxHt+21CWsh5hQv8WpFtl3ZiwpFWfdX1yGVxYSCbwtHfx4gVjFY
 4sRxXmmbHGKq0rwKdhIm1N4ev61zgCN8fRFeUJK9dmfwM0A8NIwW/vW06mluLe6BiFc8hgUXCYY
 ovvuK+GANKCas69gwrKXpZlFRKAYH58pLf+OSv10SnATyeP+g1+PFsw==
X-Gm-Gg: AfdE7cnR6y6aWrtVu5zv1+BlFvUblfHGIvkfPdO3US57urY8OonjHIuJ3YKJr3q3tZg
 YI15nF8yXHt7ewc9I6iIetcD4lZzRh/CCz3A1TyiLQKTb3T2W7T98sY6MJyuoMn0D3ysmf7o1vT
 BGWoGuXQIBDsV489lWYHb7P+m+F/BXSIKZIISLiMDH4XBBH6ED5V89d2+rXnFojSLDkHpB0/Ckh
 YrALmusFQvYEtyjZRlo+pcKdnobzHHhZx94ldIy0IyIytNRdTGC1lTAb3sttMVt7x5fAVekMsD0
 dLLuGP6m5ih4ZO0iw6BNcdNWJb7P5M2cNhTq/mT8XjwszQCSsgConPhLps6pm7i19vcOU4ZOqkx
 t0ZHqDmxtwVeFx7WcLdOgHdqYzp8OGJXe9ivo6R1z32QTpsZF1IQvpA==
X-Received: by 2002:a17:90b:3e44:b0:38e:21da:9257 with SMTP id
 98e67ed59e1d1-38e21da9302mr743575a91.37.1784026372685; 
 Tue, 14 Jul 2026 03:52:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3e44:b0:38e:21da:9257 with SMTP id
 98e67ed59e1d1-38e21da9302mr743524a91.37.1784026372146; 
 Tue, 14 Jul 2026 03:52:52 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38e172cf625sm1297479a91.7.2026.07.14.03.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 03:52:51 -0700 (PDT)
Message-ID: <47136344-8e15-498a-a4fb-0dbbb0c71861@redhat.com>
Date: Tue, 14 Jul 2026 20:52:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 10/25] hw/core/loader: Add a ROM loader notifier
To: Mathieu Poirier <mathieu.poirier@linaro.org>, berrange@redhat.com,
 kchamart@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com, jpb@kernel.org,
 lorenzo.pieralisi@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
 <20260707224306.1202330-11-mathieu.poirier@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260707224306.1202330-11-mathieu.poirier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XncyQsPJDukf0CIv0P9ySeUaRBmd3IT8UUnQaT4q-EY_1784026373
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
> Add a function to register a notifier that is invoked when ROMs get
> loaded into guest memory.
> 
> It will be used by Arm confidential guest support, in order to register
> all blobs loaded into memory with KVM, so that their content is moved
> into Realm state and measured into the initial VM state.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>   hw/core/loader.c         | 15 +++++++++++++++
>   include/hw/core/loader.h | 17 +++++++++++++++++
>   2 files changed, 32 insertions(+)
> 
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 5cbfba0a86d2..b3d769bec5cb 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -74,6 +74,8 @@
>   #endif
>   

The (edk2) firmware for the realm guest can be specified by the legacy
'-drive if=pflash' or '-bios'. The memory region corresponding to the
firmware image specified by '-bios' is recorded by the newly added notifier
and populated to TF-RMM properly.

I don't see how the memory region corresponding to (edk2) firmware image
specified by '-drive if=pflash' is recorded and populated to TF-RMM
accordingly in this series. So I guess '-drive if=pflash' isn't supported
yet?

Note that I didn't give '-drive if=pflash' a try yet.

>   static int roms_loaded;
> +static NotifierList rom_loader_notifier =
> +    NOTIFIER_LIST_INITIALIZER(rom_loader_notifier);
>   
>   /* return the size or -1 if error */
>   int64_t get_image_size(const char *filename, Error **errp)
> @@ -1201,6 +1203,11 @@ MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
>       return mr;
>   }
>   
> +void rom_add_load_notifier(Notifier *notifier)
> +{
> +    notifier_list_add(&rom_loader_notifier, notifier);
> +}
> +
>   /* This function is specific for elf program because we don't need to allocate
>    * all the rom. We just allocate the first part and the rest is just zeros. This
>    * is why romsize and datasize are different. Also, this function takes its own
> @@ -1242,6 +1249,7 @@ ssize_t rom_add_option(const char *file, int32_t bootindex)
>   static void rom_reset(void *unused)
>   {
>       Rom *rom;
> +    RomLoaderNotifyData notify;
>   
>       QTAILQ_FOREACH(rom, &roms, next) {
>           if (rom->fw_file) {
> @@ -1290,6 +1298,13 @@ static void rom_reset(void *unused)
>           address_space_flush_icache_range(rom->as, rom->addr, rom->datasize);
>   
>           trace_loader_write_rom(rom->name, rom->addr, rom->datasize, rom->isrom);
> +
> +        notify = (RomLoaderNotifyData) {
> +            .addr = rom->addr,
> +            .len = rom->datasize,
> +            .as = rom->as,
> +        };
> +        notifier_list_notify(&rom_loader_notifier, &notify);
>       }
>   }
>   
> diff --git a/include/hw/core/loader.h b/include/hw/core/loader.h
> index d9431e8a8d12..94cf6ad2e26b 100644
> --- a/include/hw/core/loader.h
> +++ b/include/hw/core/loader.h
> @@ -342,6 +342,23 @@ void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size);
>   ssize_t rom_add_vga(const char *file);
>   ssize_t rom_add_option(const char *file, int32_t bootindex);
>   
> +typedef struct RomLoaderNotifyData {
> +    /* Address of the blob in guest memory */
> +    hwaddr addr;
> +    /* Length of the blob */
> +    size_t len;
> +    /* Address space of the blob */
> +    AddressSpace *as;
> +} RomLoaderNotifyData;
> +
> +/**
> + * rom_add_load_notifier - Add a notifier for loaded images
> + *
> + * Add a notifier that will be invoked with a RomLoaderNotifyData structure for
> + * each blob loaded into guest memory, after the blob is loaded.
> + */
> +void rom_add_load_notifier(Notifier *notifier);
> +
>   /* This is the usual maximum in uboot, so if a uImage overflows this, it would
>    * overflow on real hardware too. */
>   #define UBOOT_MAX_DECOMPRESSED_BYTES (64 << 20)

Thanks,
Gavin


