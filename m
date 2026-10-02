Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D42CA5FCE
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 01:16:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCRs0-0000uq-Jh; Thu, 01 Oct 2026 21:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1xCRru-0000tw-Sc
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 21:15:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1xCRrs-0003Ib-Ng
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 21:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790903719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=47kV0KPyHe1GkaaHQZyr7eIJ1DCCCT2lh5D1q3j8m6g=;
 b=XGHsgbTnIkUiSbBCmuLLDQATg/sMd1SDrY31SG2xGvLMXx4DsLf8QrX9YZUWqkTGwgI8QT
 H4JfxgPe+0H8PHivb1AFh4oSU4tznSUaR9fGgaRc4eDjl+q9gLqDaM5uC3l0RfzURQGt0K
 10YNylL9X9Iu80BkWTDs9WnTAyth3Q8=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-ftV91YszMfO8nh8v5QV0Ag-1; Thu, 01 Oct 2026 21:15:15 -0400
X-MC-Unique: ftV91YszMfO8nh8v5QV0Ag-1
X-Mimecast-MFC-AGG-ID: ftV91YszMfO8nh8v5QV0Ag_1790903715
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-88b59692e0dso82287b3a.3
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 18:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790903715; x=1791508515;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=47kV0KPyHe1GkaaHQZyr7eIJ1DCCCT2lh5D1q3j8m6g=;
 b=BAjrILEoIwR3/6YWzefeoTle/9rkDgNR1g6jnGIvkbavYke5aMlF0syUuK4zP+b4y2
 MLnYKE1R6zmt1O5y9WyO39IsbmhVhk/cMUpozzcPG4JCETAySY4UUALxMLDjwZXTLDAg
 vFYkl++EO7RS9kGNEq6HDt+OYw+oBx+9nT7bs+x313G8URHKlcYaRnZbuhdANJYSw0P4
 tKC4mQdDLAC8bqbifUixz45c4eoVqQR7lgw8gCBF7dTV69mHpiFxOQkkYRp8MltZYMLE
 EWRFRgTi5yNLs+0aIqze3Einu4tOG2Lr4KPO1Szrad1qkyPb7doxLWkJyRiMJjAjxToW
 JpgA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzsAez0Ynh0mMTKWWRBiASRf9W8pmxzh8iz+Rf/YXANfFtfup4shQRhuoJzzZgFhH1wpFfvSdxyug==@nongnu.org
X-Gm-Message-State: AFuF++mU+Giy/TVfYSeVC89UfZX2LnVc6ZXZ5Q6ThH8PvdMcIrbJQmoz
 FzztHdo++AzQvWvsnRZ6tgtlDVGJWUHA0vVfNWd6ddk+x7GL0ct+zf6semzbmUrzliAuO8mNmH9
 fcKltsVwhwPNZktZZFL4imFeUny+xsA8il1c34qtrLksvcsajxVtQgw==
X-Gm-Gg: AYBFou2+NpGcDPoO80lQI/bbtlUFXpElhDYK+/kjAoURbBkKfxCwzYhlCYJOgfp1vmo
 6kOn9MW+9vK0Y0ClvTZtFb9gMeOZ2HJwUWrvuC39L2vQe0HDnGXYfKJHkJSMbXmUP2ZDr1uIKTz
 Q/9AXOS2/kNhXrlfv6342SO9NTf1yHQIOv+X1NqD2HMfTPHnYlzHcUS78th3ldGzA33ZpGnhfAm
 tEflVe1GYyW4D2dRY/r9USB3cBzTYyvJc4xKzi/ABrWIikzpVt89eubVEEQBikUFpvawr6zSLaL
 Iir+paeDVD9+9nQd8o6tHM/FuhqXXnIEd+bjBGAClFfSxjRp4j2m2SAwdi+a/CbijSAxT9xoRxw
 x0k+QxFo36Lc1CS9KCCGe6jRncpxu98MCgsYw3OX1Hg==
X-Received: by 2002:a05:6a00:a12:b0:880:5a44:9367 with SMTP id
 d2e1a72fcca58-88af58d5270mr977473b3a.30.1790903714564; 
 Thu, 01 Oct 2026 18:15:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:a12:b0:880:5a44:9367 with SMTP id
 d2e1a72fcca58-88af58d5270mr977430b3a.30.1790903714012; 
 Thu, 01 Oct 2026 18:15:14 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-88b0bfc3dcbsm285307b3a.24.2026.10.01.18.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 18:15:13 -0700 (PDT)
Message-ID: <ad73d89f-6615-49c1-a35e-3f01e7305744@redhat.com>
Date: Fri, 2 Oct 2026 11:15:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 09/24] hw/core/loader: Add a ROM loader notifier
To: Mathieu Poirier <mathieu.poirier@linaro.org>, berrange@redhat.com,
 kchamart@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
 lorenzo.pieralisi@linaro.org, enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-10-mathieu.poirier@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260903193611.1058589-10-mathieu.poirier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fWjfPoLDuIEATNoHyyufQs4UIC8z8-qCLYlQyNbLU6k_1790903715
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
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>   hw/core/loader.c         | 15 +++++++++++++++
>   include/hw/core/loader.h | 17 +++++++++++++++++
>   2 files changed, 32 insertions(+)
> 
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 5cbfba0a86d2..388f10e828db 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -74,6 +74,8 @@
>   #endif
>   
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
> +            .data = rom->data,
> +        };
> +        notifier_list_notify(&rom_loader_notifier, &notify);
>       }
>   }
>   
> diff --git a/include/hw/core/loader.h b/include/hw/core/loader.h
> index d9431e8a8d12..fdfddfa7443e 100644
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
> +    /* Blog data */
           ^^^^
I guess it would be 'Blob'.

> +    uint8_t *data;
> +} RomLoaderNotifyData;
> +

There are enough space at the tail of field declaration lines, where the
comments can be put:

typedef struct RomLoaderNotifyData {
     hwaddr  addr;   /* Address of the blob in guest memory */
     size_t  len;    /* Length of the blob */
     uint8_t *data;  /* Blob data */
} RomLoaderNotifyData;


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


