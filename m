Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4367C982D1
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 13:56:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7CbB-0005Uo-DZ; Thu, 17 Sep 2026 09:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1x7Cb8-0005UQ-Ru
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 09:56:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1x7Cb7-0008AS-8I
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 09:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789653379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SeeVHLhsNNmXNhyLrRU75c16AY5Z+goC/mThK3A06qY=;
 b=NJjL2GZhNAkrURYuP6zCd5Grp8b4sS8HKZfsAAn7MT8BzIWY8uF7T5nHbWPKUg23+uzr+m
 TxbfUyzzPNmGPJgg1B3J9VKK//nSCPArPPn5V2t9j9tq2f/GhMALPWVYMJ8lRhunvSCi5e
 ifoxo/pDTXZI4QnTdD4W8k65X0I9K6c=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-7YFUpT8fMGmNWaIJV28nlA-1; Thu, 17 Sep 2026 09:56:17 -0400
X-MC-Unique: 7YFUpT8fMGmNWaIJV28nlA-1
X-Mimecast-MFC-AGG-ID: 7YFUpT8fMGmNWaIJV28nlA_1789653376
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-6a3e6916a5eso1285222a12.0
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 06:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789653376; x=1790258176;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=SeeVHLhsNNmXNhyLrRU75c16AY5Z+goC/mThK3A06qY=;
 b=I/jbf7p5SF3qkXxPHNuOXcqrQFnuZdHry8rtAdVh9MmatPkAxes8d1Lc7Uc9K2YUF2
 w2GetVfjsNRZIGlkpdCFZ5UgkIWHHpJJCRDSnennREbAvYz9xxcuDwlRdlaUB5+5x6uI
 hhbCol5ep0YQF17UtKoRhVYvW8o4xsRm+JqbVqt/QHEZk0iywaZ6cO0BNnxYN4/WnClc
 SgHeOOsmnqN2R4zMjycO/iEx+sP/guEkpzFlEGlDWvgCR/qI/L1C+EF+/KOo9osO99BA
 QGvaNTFf/buT7eUjQdizTI7z/jhlFsHnEvdJTn2cVZXVOBNcFmUEQotGcBIaVa8fKV7r
 QcYg==
X-Forwarded-Encrypted: i=1;
 AKwUvByKjJcHGhqmJI0idVhOQCudKn5uysp4XANKa44WTyy7eeIzmXC+p99rRTTkNckNyknF04u16VukrQ==@nongnu.org
X-Gm-Message-State: AFuF++k99R1NT5eLuuDqXS1qy3BqPWTiJgqqwH44IaJQBWFtEmAr22uF
 nTcLd/0/sT6vEutSR0lvSHpXLCZz7Pe5b8MxkTWRBkC6mlW9PnOJwi7zjTQzb+ut+bgeBhcilh3
 2AqCZV+fnOWfyimRFfA3gEtkzf0kLkLeAus3xotHaRQSDJJJh/uQsZg==
X-Gm-Gg: AYBFou0mDUlXmjp8bRZHSBCEA/gEKu+naxeFNtLy+HrZPv6JmIIObMbzYjdj+Ve6rJX
 PLx8ptFpey8Qu8yvlZYKrASCziIyElx5t8pkuSC949slLnWtEWaIIA0optldznQ2yLuZeFVeQw+
 kkvhXXYgBMG9l+xqdF39yY039dZDZaeGjTYRSk81dQtprZw2llNh1zsJx9dY6Wg+h/unMDkrTDL
 RnTGvFjMw/mREyIJ34e993svxx3JWU7b+7ymbIkvey86KD1E0S9FN/5iB7gHJbAqJMS7l8DzmzB
 6WDe8UzgaAV4VAuCcF+UrFMGxv4uroDZkp9dXaq/VGKIdSH9lTNBMimY+bTbEHFqtu/1DXCkQcL
 hoDWUxrZ5YJmDdBzxNJiVuIAVs8Jb/QmMLnK6IOXY1A==
X-Received: by 2002:a05:6402:28cc:b0:6aa:1da6:3536 with SMTP id
 4fb4d7f45d1cf-6aa2235ac04mr4345205a12.10.1789653376128; 
 Thu, 17 Sep 2026 06:56:16 -0700 (PDT)
X-Received: by 2002:a05:6402:28cc:b0:6aa:1da6:3536 with SMTP id
 4fb4d7f45d1cf-6aa2235ac04mr4345173a12.10.1789653375597; 
 Thu, 17 Sep 2026 06:56:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:1292:d530:e939:7a09:c368:e5d5?
 ([2a01:e0a:1292:d530:e939:7a09:c368:e5d5])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aa1d2727bfsm3365323a12.20.2026.09.17.06.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 06:56:15 -0700 (PDT)
Message-ID: <0991dccb-a123-471c-8a72-e4194da6c596@redhat.com>
Date: Thu, 17 Sep 2026 15:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/10] hw/vfio/pci: Back the CXL memory with a
 RAM-device region
To: mhonap@nvidia.com, alex@shazbot.org, ankita@nvidia.com, jic23@kernel.org, 
 dave.jiang@intel.com, alejandro.lucero-palau@amd.com, smadhavan@nvidia.com,
 pierrick.bouvier@oss.qualcomm.com, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, pbonzini@redhat.com, eric.auger@redhat.com,
 peter.maydell@linaro.org, richard.henderson@linaro.org, cohuck@redhat.com
Cc: kjaju@nvidia.com, vsethi@nvidia.com, zhiw@nvidia.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, linux-cxl@vger.kernel.org
References: <20260916184412.3825713-1-mhonap@nvidia.com>
 <20260916184412.3825713-6-mhonap@nvidia.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20260916184412.3825713-6-mhonap@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EFdiUs9vwByPSK7v1eeI_WcLeS4JpLsX50AEDFVMwjg_1789653376
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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

On 9/16/26 20:44, mhonap@nvidia.com wrote:
> From: Manish Honap <mhonap@nvidia.com>
> 
> mmap the kernel's HDM memory region so its host physical pages back a
> RAM-device MemoryRegion. It stays out of the guest address space until
> the guest commits its decoder and QEMU learns the GPA to place it at.
> 
> AI-used-for: code (prototype)
> Signed-off-by: Manish Honap <mhonap@nvidia.com>
> ---
>   hw/vfio/pci.c | 34 ++++++++++++++++++++++++++++++++++
>   hw/vfio/pci.h |  1 +
>   2 files changed, 35 insertions(+)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 10b13f200d..4716266595 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3221,8 +3221,11 @@ bool vfio_pci_populate_device(VFIOPCIDevice *vdev, Error **errp)
>       return true;
>   }
>   
> +static void vfio_cxl_teardown(VFIOPCIDevice *vdev);
> +
>   void vfio_pci_put_device(VFIOPCIDevice *vdev)
>   {
> +    vfio_cxl_teardown(vdev);
>       vfio_display_finalize(vdev);
>       vfio_bars_finalize(vdev);
>       vfio_cpr_pci_unregister_device(vdev);
> @@ -3696,11 +3699,42 @@ static bool vfio_cxl_setup(VFIOPCIDevice *vdev, Error **errp)
>           return false;
>       }
>   
> +    /*
> +     * The HDM memory is host physical. Set up the region, which installs the
> +     * fd read/write path, and mmap it for direct guest access; it is added to
> +     * the guest address space only once the guest commits its endpoint decoder.
> +     */
> +    if (vfio_region_setup(OBJECT(vdev), vbasedev, &cxl->mem_region,
> +                          cxl->mem_region_index, "cxl-mem", errp)) {
> +        return false;
> +    }
> +    if (vfio_region_mmap(&cxl->mem_region)) {
> +        /*
> +         * Without mmap the region falls back to the kernel's fd read/write
> +         * path, which works but traps every access. Warn rather than fail.
> +         */
> +        warn_report("vfio-cxl: %s: failed to mmap the HDM memory region; "
> +                    "performance may be slow", vbasedev->name);
> +    }

vfio_cxl_setup calls vfio_region_setup() then vfio_region_mmap()
back-to-back when other 'normal' BARs split these calls across
vfio_populate_device() and vfio_bar_register(). I guess it is fine
for CXL since it is not a PCI BAR.

>       cxl->enabled = true;
>   
>       return true;
>   }
>   
> +static void vfio_cxl_teardown(VFIOPCIDevice *vdev)
> +{
> +    VFIOCXL *cxl = &vdev->cxl;
> +
> +    if (!cxl->enabled) {
> +        return;
> +    }
> +    if (cxl->mem_region.mem) {
> +        vfio_region_exit(&cxl->mem_region);
> +        vfio_region_finalize(&cxl->mem_region);

However, the tear down should be split between :

1. vfio_exitfn (unrealize)
    drops mmaps, removes subregions and removes references so the
    MR refcount can reach zero.
2. vfio_pci_finalize (instance_finalize)
    frees the MemoryRegion.

Thanks,

C.

> +    }
> +}
> +
>   static void vfio_pci_realize(PCIDevice *pdev, Error **errp)
>   {
>       ERRP_GUARD();
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 7fdd695704..06d15e807d 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -134,6 +134,7 @@ typedef struct VFIOCXL {
>       uint32_t comp_bar;               /* component BAR carrying that block */
>       uint64_t hdm_offset;             /* block offset within the component BAR */
>       uint64_t dpa_size;               /* size of the HDM memory region */
> +    VFIORegion mem_region;           /* HDM memory, mapped at committed GPA */
>   } VFIOCXL;
>   
>   struct VFIOPCIDevice {


