Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp505975njc;
        Wed, 13 Nov 2024 08:49:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUj5HGjsa4d6It3Tt6FHqEDs5mDDxsxZGgUZgJGWJLnAcG2U5nZ4OKeUCoGABIY8G3MPwq0p/Gj72g1kw==@linaro.org
X-Google-Smtp-Source: AGHT+IFBHJtqooiq4NJVwbzVJD14eXwuvbcamj5dUYNtNIouWwX8MjiX8/+a3EDDerVa3TxZfLsS
X-Received: by 2002:a05:622a:591a:b0:461:3832:eb37 with SMTP id d75a77b69052e-4630941892fmr299412131cf.52.1731516563041;
        Wed, 13 Nov 2024 08:49:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731516563; cv=none;
        d=google.com; s=arc-20240605;
        b=iqTv65TgwfC6j7TMqvbaVu4hyqX90Ou0yMfqCZfYWVkH3gshJyqEYtYUsmkwZCR4t3
         Wl/wrXc874Ak82jUAKX5DTJ2eDl9/HMkPZ49rCOrrnXhTvw97MwgNDb0MFKzgptJTf7m
         Gy3QHycMHnvZ30IF187a8QXKwHGFaXFiZbqvXyKj1+rMsCnjm5g3HTVPFIvnJ96QEF0g
         56yQwbWNjto/koIFVPdoCbH/a/BoEm0+XJT305B4yqfYAne6ZRS73a4S05VmPCsZHYNX
         vZYUVAAmvhUpbNHyWJikA0OpMaIEqlilErt9nrf+1wthQGPBIA3iD0Iw048bb4Vh75O1
         /3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Q5lxgJju3VDJD2N/GXeMJZtK5/RQQ64Bmm3cQ/TKIEo=;
        fh=FfDv8XetbHgLxYv9vRbCRIGS4/X3y+cABZfyreAm++s=;
        b=kTRf9oXYeGHg2YQ7zX71VBpBayloZ3zokIFhgx/IezEOab8KfAqGGkkxHzdMBVA48S
         epyvB+eQHLZUc5JRSB1qdVuZJb0st8zkHNmF1J1VZX5xR2k0l8U5MvssyFZqUYWy4+kb
         TyRSN6rgnczn9wHXv7UY3pkmDiSQNgewZrVGJxNPzQxcVO3WiHh/SaxgYpo/8nqg3Wcn
         e1Nt2k6D+G4pSrj3RltqlrknQ5fmE7LFomsP8/08u7FIxOrVZrvF/neIujCnzgD9KR3v
         qP/Z2NctfMEIOIEoKVjw6VgfDH+PeW8PMoLSikEnV5kMrQoDaRF8PHQJTqmw85oiHCRL
         AQSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="f/jtP7Bw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff40e69csi180331411cf.103.2024.11.13.08.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 08:49:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="f/jtP7Bw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBGYB-0008KX-DK; Wed, 13 Nov 2024 11:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tBGYA-0008Is-58
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 11:49:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tBGY7-0000ax-Et
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 11:49:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731516537;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q5lxgJju3VDJD2N/GXeMJZtK5/RQQ64Bmm3cQ/TKIEo=;
 b=f/jtP7BwhsnIVu4rVrSadLIPKCAHZT1mZ27d1FeEdNXoKMLHBHPgapyXIjQmIR4v2AbGM2
 +SNf14DPaDb7j6CIojTRsLjclsxYe+x2mGHy5J0bEz7KXvyUVvPsiONJqtgPHFcX31zNf8
 LzrD7BhnFQcie0wGWF/O5q0mV85mPAo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-3PPGKhSeMLSY0hWoA_ukww-1; Wed, 13 Nov 2024 11:48:56 -0500
X-MC-Unique: 3PPGKhSeMLSY0hWoA_ukww-1
X-Mimecast-MFC-AGG-ID: 3PPGKhSeMLSY0hWoA_ukww
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6d366683f4aso108039626d6.3
 for <qemu-arm@nongnu.org>; Wed, 13 Nov 2024 08:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731516535; x=1732121335;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q5lxgJju3VDJD2N/GXeMJZtK5/RQQ64Bmm3cQ/TKIEo=;
 b=hA7XP/KEEMVIOtaRWfV04uT1RjQhaXnL0P+YEbk8nwUjKesSfOgxNUpH1kgLwG4lq7
 AqAXECwTkh+VCkxdADtqxwsPE/+h5CiEA/Uo8/IgjjjOzpVnKXxBmy+g1b8pKh9b3b6W
 i2zJUy80EycOAl2raon9Rt3I6hKkrgkfyFHILjhBFLVrXocZ26Bc2Mfodk13hXu4LnRz
 Q3bIpyo9E5Y3KhdHwPEhbyrX0ryixmjarZsCMBo1AMAY2K7UJlRLlyA8L0GXEbf+4AAk
 faN2EvCE4y968fKKRVYkrcV33QTSnB/tOqX4xbVuV20125mYxHoceKr/ueekSYM9mdVO
 3PMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKievmOedunRg9r34xcMVRgkGGSRJr2ND0zNg7s0ImKMuNo5F4gBjr4Zmfsu9/Hl5WkOtU1rkXUA==@nongnu.org
X-Gm-Message-State: AOJu0YwC4lqbuZIB24FI7fumW8QW4sflHBQSaqDOqY2uDzLF4YRyTp1Y
 Aq3K+C8S9seYiUMuS3+XjwuYe3L/7gcGdAK/8PztUy0kaa/Tg7yXzCDkH61ucRRyBgh1BQ6kK4r
 np/XtGCP6gP6NG+Qz2Lhx3leSTKycaDZuzKEXPVNXTMFvSO4/vQ==
X-Received: by 2002:a05:6214:3987:b0:6ce:34d5:8882 with SMTP id
 6a1803df08f44-6d39e19e2a1mr284192026d6.39.1731516535721; 
 Wed, 13 Nov 2024 08:48:55 -0800 (PST)
X-Received: by 2002:a05:6214:3987:b0:6ce:34d5:8882 with SMTP id
 6a1803df08f44-6d39e19e2a1mr284191736d6.39.1731516535422; 
 Wed, 13 Nov 2024 08:48:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d3961df2c5sm86079806d6.4.2024.11.13.08.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 08:48:54 -0800 (PST)
Message-ID: <f739eaee-4890-45ab-9f8c-f406bdb085cc@redhat.com>
Date: Wed, 13 Nov 2024 17:48:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] hw/arm/virt: Add an SMMU_IO_LEN macro
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-2-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20241108125242.60136-2-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N4GfgnjdQjmeMpxuTxOTbpRKBL380lSm8B_V8MdvAkU_1731516535
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.119,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UUfTClQgENzs

Hi,

On 11/8/24 13:52, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> A following patch will add a new MMIO region for nested SMMU instances.
Nit: Add a new ... is generally preferred I think
>
> This macro will be repeatedly used to set offsets and MMIO sizes in both
> virt and virt-acpi-build.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt.c         | 2 +-
>  include/hw/arm/virt.h | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 719e83e6a1..780bcff77c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -174,7 +174,7 @@ static const MemMapEntry base_memmap[] = {
>      [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>      [VIRT_UART1] =              { 0x09040000, 0x00001000 },
> -    [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
> +    [VIRT_SMMU] =               { 0x09050000, SMMU_IO_LEN },
>      [VIRT_PCDIMM_ACPI] =        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
>      [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
>      [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index ab961bb6a9..46f48fe561 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -47,6 +47,9 @@
>  /* See Linux kernel arch/arm64/include/asm/pvclock-abi.h */
>  #define PVTIME_SIZE_PER_CPU 64
>  
> +/* MMIO region size for SMMUv3 */
> +#define SMMU_IO_LEN 0x20000
> +
>  enum {
>      VIRT_FLASH,
>      VIRT_MEM,

