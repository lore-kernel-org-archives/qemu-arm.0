Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED268C83F1B
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 14:14:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZs28-0003Uo-Gk; Thu, 10 Jul 2025 10:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZrop-0001ef-Uj
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 10:00:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZrol-0001oa-3x
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 10:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752156006;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dJjCigvybdlnEXFGMz7Rl4+7KN0wofLnw82pLSmmup0=;
 b=QBqcKraVJqMet17RAX4tf53YnIOwwCljGLEDI9HEbPayjxWzzsg4DCC0aWDy17fXfx7DZA
 FGHAn5FmXY/7l8nasUQdAnhvk/LnZI03kqX98Su8V7VJcsaNSRro5BCbtMmhu7iJxsn/pf
 pPqC/hIZvkLb5NMAP9Oq9hs3kyH3+Gs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-CllwdQDLM1af2Gi9MNFXcA-1; Thu, 10 Jul 2025 10:00:03 -0400
X-MC-Unique: CllwdQDLM1af2Gi9MNFXcA-1
X-Mimecast-MFC-AGG-ID: CllwdQDLM1af2Gi9MNFXcA_1752156002
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-451d30992bcso7864235e9.2
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 07:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752156002; x=1752760802;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dJjCigvybdlnEXFGMz7Rl4+7KN0wofLnw82pLSmmup0=;
 b=YraTyylS3maXEdWbAMDv26CpsoZ/VeMDq5WyhKq2s1YSIF/xMLX0iLUXMKPl2xlK/+
 bkTvdg97TS8pFL2Ur1PW/XkBVgDO2As6SRCOjrxfoT7x8lMFJsUidqo+w0v3jar5WVgZ
 HZ7oB4H6/a0xZl99IMcrrxnr9fPSUvyUtmPVDiutjq1DYtN9dSHsVOxNeJ2dqAYK/4Vd
 aBeaQRvPpP/QeDdRvBLoH5jRffEXmb4LBBiRaIsTT34nK7GpI7HVvhf9iW6nvthNhBF3
 CLUDcDMhZF5QBXMbYw2PR5gytkQlV2xzdU16VlNqX4hEQvkDEwKUBtoy06L9LZczMblk
 SArA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgo8rJsbekKqPrjSDZNsg7PlwHkxqFUOnw2WEhAt0cl6MSGRjmHH6Wo9kMYue8/380UA0xMSVzYA==@nongnu.org
X-Gm-Message-State: AOJu0YwM0vVqPtqVeaT7nhnnxM8/imFWcbgpwMWO5R8UwIiqr0Vyul+4
 x6Mu+Ts0Q+BOxE9QBQkIZbXRFwr2oYSuSvSAyHituZ64ep/nsup1LSJzIu/rGo8Ot/VD6L8aRIQ
 9us1VlutByoxQo5NC92TvXb4XZcD6/AMqo9XVwLxq+yJ74P5xukX/Zg==
X-Gm-Gg: ASbGnctGttNzic9MdS1BAgTIpEIwNrlfZEyTEUlK+fWUA1Uz75iADYEVWyvaKW0LWIO
 9onVi48nyyIw+oQ5wJcUfHhBUvIAUw30PQqVMO/+5y7oMS0rja04Ix68BA5Xhl1SALjjZZ2SJ4F
 00SjlumrP2g5UYIxzPgkxKGpuFLBLhaA+cCXrHkXS7Axkv5Y0BWa3SsMgb2qKObpoEPJITqMCe3
 QVdQh3RRo2Y1d7dOz8MGXLCQWpaogwCyXAGy/4Jh45jSwAcoC73wqysv/qTgv564O2hJ5Ec7eXi
 yjgjTHK86nI3ZN3S7quKQc5gb/4sbB1EBHOOjw5oKu+ma3AaIfAUASSKmv+JR3tTlDuJvg==
X-Received: by 2002:a05:600c:5296:b0:441:b19c:96fe with SMTP id
 5b1f17b1804b1-454dd2024c7mr34396665e9.10.1752156001526; 
 Thu, 10 Jul 2025 07:00:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm6FJrN/XV0uH6Miy8mhfVKCYdwhMYe+goTFW+Md2g6U7wm4W5fSiqezOPS50N/lxRz0UROA==
X-Received: by 2002:a05:600c:5296:b0:441:b19c:96fe with SMTP id
 5b1f17b1804b1-454dd2024c7mr34396325e9.10.1752156001066; 
 Thu, 10 Jul 2025 07:00:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd537932sm20756575e9.20.2025.07.10.06.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 07:00:00 -0700 (PDT)
Message-ID: <61464e90-9be3-4be5-a0af-ab15b92776e5@redhat.com>
Date: Thu, 10 Jul 2025 15:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/12] hw/arm/virt-acpi-build: Don't create ITS id
 mappings by default
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, imammedo@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 gustavo.romero@linaro.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 linuxarm@huawei.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250708154055.101012-1-shameerali.kolothum.thodi@huawei.com>
 <20250708154055.101012-2-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250708154055.101012-2-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h4rsY2uTEdJMTmfPiulEqgFMwMBdtmW86P5FcsRfFPw_1752156002
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Peter,

On 7/8/25 5:40 PM, Shameer Kolothum wrote:
> Commit d6afe18b7242 ("hw/arm/virt-acpi-build: Fix ACPI IORT and MADT tables
> when its=off") moved ITS group node generation under the its=on condition.
> However, it still creates rc_its_idmaps unconditionally, which results in
> duplicate ID mappings in the IORT table.
>
> Fixes:d6afe18b7242 ("hw/arm/virt-acpi-build: Fix ACPI IORT and MADT tables when its=off")

At least please could you take this fix?

Thanks

Eric
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Donald Dutile <ddutile@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index cd90c47976..724fad5ffa 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -329,12 +329,6 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          /* Sort the smmu idmap by input_base */
>          g_array_sort(rc_smmu_idmaps, iort_idmap_compare);
>  
> -        /*
> -         * Knowing the ID ranges from the RC to the SMMU, it's possible to
> -         * determine the ID ranges from RC that are directed to the ITS.
> -         */
> -        create_rc_its_idmaps(rc_its_idmaps, rc_smmu_idmaps);
> -
>          nb_nodes = 2; /* RC and SMMUv3 */
>          rc_mapping_count = rc_smmu_idmaps->len;
>  


