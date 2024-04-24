Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp445928ejb;
        Wed, 24 Apr 2024 01:44:58 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVh5gh0DgmKby2QZQRYa4iR8AhbvDZHxM+CFru0UgyEAQblMTFZn4BL4qADjl927YwfS6adTjmAA63/PxALFtvaoyXwATOr
X-Google-Smtp-Source: AGHT+IEzsFx/g7rVR+IO4nL1lzoR2h76oEM4ti7p5aycIbjSFdbbxpG1Q+eCd5AYhXrltcxGWYWs
X-Received: by 2002:a05:620a:98a:b0:78d:3b41:cc41 with SMTP id x10-20020a05620a098a00b0078d3b41cc41mr1934687qkx.27.1713948298704;
        Wed, 24 Apr 2024 01:44:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713948298; cv=pass;
        d=google.com; s=arc-20160816;
        b=n19rvSZnYMINU2tGiEkxpSNgEqtMExpwBZ8BmMi/AekEcIsvfzC6atJP24OOJhcgay
         JWMB7AJD62YuQVUhrPLBdPM3tYx1dm/uMYny3vELrtuZL8EVswrkrthsleqkV3aWVKKN
         B7+a4t5iFjVY1qlZogPALvMfaaLnZlt/q9bMMrZojOzInL5a+SC8lqWUzdCMTuUP/iDe
         gmIfWjVmx4a7jebkcctEQMxv7WuvApEzNEYNiqvSSLU/9yOIyMRws/sO8mggPrTObzQU
         KgfhAo+s+nING4VdxC1VBs/oTnFoGZBYBvo9JTaZCxODoaXeTHpyZpLqdCFdfpA7IYLe
         YfHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=hgALXVVjSwrwkltp36vxTj/9Vt2I0zuQY7MS0AYLINY=;
        fh=8tKMoTIA/b8v3MYYy2Idf80LKcFBUtAT96ygB2sHNPw=;
        b=vcZihSiQAOuJeAZ3W5QLLhTy9o0R7l1Akm1bcQ7LJnzqkw81ORxDpaJiW9Us/atOZC
         FWlZWQq2Yu85NDCQrdiIbKFyI1dH1ypG7jTIk2+1WFr/jS7Z1Cq+JHpXSZskGyBEWaGj
         /EwEtKYofGXibD8XNHER2sNbx66y82wKzvoqlmXxg9fF2fBMbN6SOkxanLX1yVyuWA4o
         x0g4iGYxiPQjXtBfWlvMbRghoDKejlbtdFFnNPyfbTs6wphvUQO0vgwX7ZSKdZwByh15
         xzBWPXNX7JV8vfbC5RTPsGpxrm7XYRGBKyQI2O23TFPYeYZujwIlFNyUubeypiH/yGxO
         EEdA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GasqYpsr;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-15763-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-15763-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-15763-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id z7-20020ae9c107000000b0078ede12018csi14262495qki.275.2024.04.24.01.44.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 01:44:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-15763-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GasqYpsr;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-15763-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-15763-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F6541C21F80
	for <alex.bennee@linaro.org>; Wed, 24 Apr 2024 08:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56176156F2B;
	Wed, 24 Apr 2024 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GasqYpsr"
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5688A156873
	for <kvm@vger.kernel.org>; Wed, 24 Apr 2024 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713948288; cv=none; b=tZ1M4xo4EiTHf/K0FE45wa+STP00HoIoHWjNs23u0UDt89hkIj4oWEyLQ9Tt6hU63bLyrmHMphjd43nU/mRY6AYEh2LXnW2h4EsHPGSbtwaPMD1ICp7bHOzghmoW+4U3m7tfO1txyYp1hBi0CqVDZIR6OJ9kCk7AD17VuHiyhg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713948288; c=relaxed/simple;
	bh=BoRG69zw6J1f6zgdXG3/0ES7cH9DjUekP594Sk3yzY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sfVTpcDKP2n6+x/0u6brqiVUmAgBsBLKIQaYgHi7mIakZ7dfckSi9ZzklvbECNKmz5+FXqUjAY1LKAlAFRmqNAwGgEIM2qK1T2cLrdDekcIW4LQk/MgvHoobH6UfceYfn2/mZpfnNHw+/v2xARszj6R4pHu3+sjcg5y3HsSruuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GasqYpsr; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d8b2389e73so79700011fa.3
        for <kvm@vger.kernel.org>; Wed, 24 Apr 2024 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713948284; x=1714553084; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgALXVVjSwrwkltp36vxTj/9Vt2I0zuQY7MS0AYLINY=;
        b=GasqYpsrcGXFJaOb4Iyo2tI1ZM7snQub15GgDWhlSHikY50OLXNx+x+k+KmmuHIOIE
         atXl2RjjrBCymcfBJrgVC4TJOhms8bYzsvWz/myooIuW92y2U9GpZ7BXOZLynGvcz7tV
         hD/3lywY5p2yJGes7ByN/zKzucNAe4JKyF0gnjFjZrc7PCznBx6aP1EIhKquKsCKhlb8
         gbwAb/rAT1FoENm9xWDIlI0GhoV5T+XAkMV9zmdnBqEhIMssxVve3/Ln6MLXQ6ezvtZ+
         x5MpiEsUmjjCxh9LrzTUSR6p1P7Z5RMzqVn5TIjDdFjWCMBW3Dx6pxl+9Nfzh6wY+LFi
         dCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713948284; x=1714553084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgALXVVjSwrwkltp36vxTj/9Vt2I0zuQY7MS0AYLINY=;
        b=V43/qrn9qRj5CppmwCagkDa8NhnS79fF6LGfU/5d8xgQcdepQkJuKveGyexCgSImgd
         eb0DVBqp1FUiNew5CO1rHRNL/J0hw83jSVFPjmZgs1a2Y10sROAM0QRjSSAoAh02UZ0t
         c1625tvvrwGax5YSE1u4RYUjJW6uYz6QXH2bbMVqHGOvon6//mMvx8ae1BM8PvNvomqp
         VWnnKfX2ZaCgLgLi+wVxRjCYHZKGP+3gfkEY+M1d/2Y3Z40PI6D5AE+PwXaYB3+Jlx9U
         M7LA/EzUun4aXGLuxxfpZTnBaldWcWBZLb93jCjGI5cafa4WDYpv3Ve+6YRIqOehWY0X
         mutA==
X-Forwarded-Encrypted: i=1; AJvYcCXIoMoZrgfbRt3aKv36dlvGyaa7udXMP4M98LN0/ZcjLiW7X78MOfmh9Zpx/gtQLGnZjRV4uBXLafXKwBeS7ehzgeDg
X-Gm-Message-State: AOJu0YyqQMyMfZr2DxpRJwqDoLsK0nmrPuogm24/xcSAEpDG49M1teee
	q8bPeADHZ5ukKGyD3EjRXP2sk4R5CZKR/9KlnrOItdCY7tyUGWXH58YcGVGB8S0=
X-Received: by 2002:a2e:8507:0:b0:2d8:394c:6e7e with SMTP id j7-20020a2e8507000000b002d8394c6e7emr995796lji.15.1713948284501;
        Wed, 24 Apr 2024 01:44:44 -0700 (PDT)
Received: from [192.168.1.102] (mon75-h03-176-184-51-42.dsl.sta.abo.bbox.fr. [176.184.51.42])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c3b8500b0041a3b5ed993sm11257643wms.25.2024.04.24.01.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 01:44:44 -0700 (PDT)
Message-ID: <17f53dbd-4eed-4375-a5e4-b00a3b2a48e5@linaro.org>
Date: Wed, 24 Apr 2024 10:44:42 +0200
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/22] hw/i386: Remove deprecated pc-i440fx-2.0 -> 2.3
 machines
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20240416185939.37984-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240416185939.37984-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Gbwb7qTT1DI3

Hi,

Michael, I expect this series to go via your maintainer tree :)

Thanks,

Phil.

On 16/4/24 20:59, Philippe Mathieu-Daudé wrote:
> Series fully reviewed.

> Philippe Mathieu-Daudé (22):
>    hw/i386/pc: Deprecate 2.4 to 2.12 pc-i440fx machines
>    hw/i386/pc: Remove deprecated pc-i440fx-2.0 machine
>    hw/usb/hcd-xhci: Remove XHCI_FLAG_FORCE_PCIE_ENDCAP flag
>    hw/usb/hcd-xhci: Remove XHCI_FLAG_SS_FIRST flag
>    hw/i386/acpi: Remove PCMachineClass::legacy_acpi_table_size
>    hw/acpi/ich9: Remove 'memory-hotplug-support' property
>    hw/acpi/ich9: Remove dead code related to 'acpi_memory_hotplug'
>    hw/i386/pc: Remove deprecated pc-i440fx-2.1 machine
>    target/i386/kvm: Remove x86_cpu_change_kvm_default() and 'kvm-cpu.h'
>    hw/i386/pc: Remove PCMachineClass::smbios_uuid_encoded
>    hw/smbios: Remove 'uuid_encoded' argument from smbios_set_defaults()
>    hw/smbios: Remove 'smbios_uuid_encoded', simplify smbios_encode_uuid()
>    hw/i386/pc: Remove PCMachineClass::enforce_aligned_dimm
>    hw/mem/pc-dimm: Remove legacy_align argument from pc_dimm_pre_plug()
>    hw/mem/memory-device: Remove legacy_align from
>      memory_device_pre_plug()
>    hw/i386/pc: Remove deprecated pc-i440fx-2.2 machine
>    hw/i386/pc: Remove PCMachineClass::resizable_acpi_blob
>    hw/i386/pc: Remove PCMachineClass::rsdp_in_ram
>    hw/i386/acpi: Remove AcpiBuildState::rsdp field
>    hw/i386/pc: Remove deprecated pc-i440fx-2.3 machine
>    target/i386: Remove X86CPU::kvm_no_smi_migration field
>    hw/i386/pc: Replace PCMachineClass::acpi_data_size by
>      PC_ACPI_DATA_SIZE
