Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9DA10F287A
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 23:47:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6Gtz-0004Yz-EE; Fri, 27 Mar 2026 19:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w6Gty-0004Ye-5U
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 19:47:42 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w6Gtw-0002Hm-4k
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 19:47:41 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4852afd42ceso20293525e9.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 16:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774655258; x=1775260058; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8U0NFvxINT5B0OqgCTNmJYQAGf5nVzmIxrMl9fgV8RU=;
 b=AU0FWZpSPnMGV+kLzwm8FBO9Z706xz71S/6oWMz2euiUFFAnpXRoAU4fZE6J3EYNKM
 efg7Ob4i1CJnfS7+oTq93/mGKk2iBa98r64QXSgyP63sxbV3bvcc5QGKw+cf+nRBopTd
 qKx/RnIvXPT+xVnpr6Ynt4dxLEXjbgGuj1O1hHhfZ1zgbMDl6GE37oRS17oGJk5BseaA
 Dt1fgXLJ+EUoyJ8i0uzzUp3ERUyUb8Go52rV4MJs1wGMS+TyWMLBw2dZ7jzUoLUXr5uQ
 vvQ6vTiog02IsFvpyz1hkjlJ1PQ5X7RXNAErtmliEojOoPIt7Z7UAiGUAEnIpaumPwka
 +Vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774655258; x=1775260058;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8U0NFvxINT5B0OqgCTNmJYQAGf5nVzmIxrMl9fgV8RU=;
 b=ZIl9HVM0U9Y42moUrgAMT6YhouEOcHE2R+53q3GWHbCAd2OVSbX9jG3Rjf7zUiiGTl
 jTZRwYI4l6g/EWk5EnRyNNEvAxT2SVTuookQrjS/ksgil7kU1eedfdZOn5kbK+f2dBbw
 3omciXCzLXMJodnTpwUDuc0ZSkts7T3ktjohL6LlIyjnmRQGEDuhaTVwRaQSrCeHrdBt
 YSEXuN96/FDKNzq/mqeqcwb1ky2pgA/7JOlK7hklXTlv1St6EjPmCSOqn9q+HCeDm/7f
 rRpW+O8eXNIX5rZ9bm9bykVnhEWNbEBwHoQBIlT+SFA+i7mQU280mYfa9kKibHj2XLKy
 87pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU96Xn1CmSfhRRsina2A4EXaodybbIoZW26rGaQqM8Qm8D9Nyo48Rc92KBXWNLLsFe/8mey6M1a6Q==@nongnu.org
X-Gm-Message-State: AOJu0YyWPdvzb1VHgC4HRLYT8ncxSSW9LSMVOhR+GCfV/ZY6rAsjC7aw
 N0T1MK2seVjtDTb+CXxDTFn0EWaJMOxhXF5lMuIHQN6+hr0Ccqlzaxq3ZRx56EyeYQU=
X-Gm-Gg: ATEYQzzu6Sqb+Y/mEJDeoorOsj+Tp7rZj4K7Vt52jzT7z/E5CoC3O9YewzRBa2TNPDZ
 yvvvhFfNNM0ERbYojd9/Mt7e/qbIsxLi0SWse39NmDp9B8RCiTFYcJIsIlFOboxWQuFxG7lS6sV
 T+R/ZIoehxIjVN/RNYlQwSp2BB7R5jKDfmpORFXpjwLrrBg4Ur8EoQlQZlLy4Qvf9/DSyTinaPo
 g5AIsID/y5WFHsAPDQvSIu3sIG3JbbRIALk4b5lBo+Jcm8G7GjcBhxSlDjrIOj88c+xnE2he/rt
 JpvAVOt/InnqWGSDMLsHrlMMXLEemiOiuA6KWrdwmNb5nDzrQkUw8Q/l9HRkPscz2Pm8e6tulpF
 W9oTkh5PLLGu/0c5njrv84oqM46TysYKAZ2//ABlWymecTQnXTJECeqXJrjxEYiRlYivmd8WUqZ
 RP/WMtByYZYHeYzmDRRqtRRSprTcALn16pDS++qVyQDGlzfK1d0QBsCUBW/xe0Lw==
X-Received: by 2002:a05:600c:46c4:b0:485:3a03:ceca with SMTP id
 5b1f17b1804b1-48727f0e53bmr76254025e9.23.1774655257674; 
 Fri, 27 Mar 2026 16:47:37 -0700 (PDT)
Received: from [10.202.147.66] (147.149.216.82.rev.sfr.net. [82.216.149.147])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4873068858bsm11296985e9.9.2026.03.27.16.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 16:47:36 -0700 (PDT)
Message-ID: <6cb600f2-5f0a-4b77-a972-967deee93698@linaro.org>
Date: Sat, 28 Mar 2026 00:47:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] hw/tpm: add PPI support to tpm-tis-device for
 ARM64 virt
Content-Language: en-US
To: Mohammadfaiz Bawa <mbawa@redhat.com>, qemu-devel@nongnu.org
Cc: stefanb@linux.vnet.ibm.com, pierrick.bouvier@linaro.org,
 "Michael S . Tsirkin" <mst@redhat.com>, imammedo@redhat.com,
 anisinha@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, mohamed@unpredictable.fr,
 Stefan Berger <stefanb@linux.ibm.com>
References: <20260327173209.148180-1-mbawa@redhat.com>
 <20260327173209.148180-4-mbawa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260327173209.148180-4-mbawa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Hi,

On 27/3/26 18:32, Mohammadfaiz Bawa wrote:
> Add PPI memory region and ACPI _STA, _DSM to tpm-tis-sysbus so
> Windows 11 ARM64 guests no longer log Event ID 15 errors from
> tpm.sys on every boot.
> 
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: Mohammadfaiz Bawa <mbawa@redhat.com>
> ---
>   hw/arm/virt-acpi-build.c |  9 ++++++++-
>   hw/tpm/tpm_tis_sysbus.c  | 11 +++++++++++
>   2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 591cfc993c..5b5ac551f8 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -240,7 +240,8 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>       Aml *dev = aml_device("TPM0");
>       aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
>       aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
> -    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
>   
>       Aml *crs = aml_resource_template();
>       aml_append(crs,
> @@ -248,6 +249,12 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>                                     (uint32_t)memory_region_size(sbdev_mr),
>                                     AML_READ_WRITE));
>       aml_append(dev, aml_name_decl("_CRS", crs));
> +
> +    hwaddr ppi_base = platform_bus_get_mmio_addr(pbus, sbdev, 1);
> +    if (ppi_base != -1) {
> +        ppi_base += pbus_base;
> +        tpm_build_ppi_acpi(TPM_IF(sbdev), dev, ppi_base);

Matter of style, I'd rather:

            tpm_build_ppi_acpi(TPM_IF(sbdev), dev, pbus_base + ppi_base);

> +    }
>       aml_append(scope, dev);
>   }
>   #endif

Hmm I see in tests/qtest/bios-tables-test.c that test_acpi_tcg_tpm()
only tests X86 (Q35). Could you see how to add coverage for Aarch64
virt machine? (It could be a patch on top, no need to repost a v4).

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


