Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0684CCCD185
	for <qemu-arm@archiver.kernel.org>; Sat, 11 Oct 2025 00:32:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7NWG-0004kK-Ly; Fri, 10 Oct 2025 20:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v7NWC-0004jN-SR
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 20:31:29 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v7NW7-00087N-1T
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 20:31:28 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-78f3bfe3f69so2497193b3a.2
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 17:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760142679; x=1760747479; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4r8BHN40JRbCy4U2pRuK88b2++kY8Q43hhZHmQLex8I=;
 b=jgfJ9kjI/LnanJa9sZM+eB0kHmAlxumMFqNPZOsE7fa/oZR7BybA9VygdtSlpdlgsE
 2EZgJFGcdJZ24StrLodlATZ38y9gPMUiiG3Wrh9YulV828U1PKA/uKpAIeRLMA3vpAgU
 zy1FkRVHiMg0yMh2+yyit6ou3cSzFqirz2b0hvZWkArsZs2U5DWrEtGRqzs0eJXUbnnE
 BASTT7J4x3WGgZqykE+dson13S3Ldqbaf//IbsgYvmwL4wLgeiyHkI57qY//88eQGZk6
 53pHRZ8DMdkGJQhcXpXRrtQ4lVWSe1h67hEOxl9OO3Yq+MN3lHPBmqZaA87nY4h6eW2Z
 O4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760142679; x=1760747479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4r8BHN40JRbCy4U2pRuK88b2++kY8Q43hhZHmQLex8I=;
 b=vbtAe5h6uMvynrSlG6JVukbNjw4j+oPaDjvgKko/6IlrA/ak/hnwoV6sP1zHFDfC5O
 DOdJOqDf2zgI4HXaArzal5kZx8LbA1ukjEN0qcaqC3mm/pyusT8Cu6zDak/uhc0I41gU
 bbxOUWCshj8JRlbP3pkZe7QyZJ4aVSD8QlCC/UTqlZV7l46BswL2O2MOOGYx0U7UPP8T
 +k9vj3Lr71xkdE1QzMbdrvgjX5xnDsXHortB2jSL7aJ2FTFz8bTgrNaNuEM69BY04fp2
 Abr426eumthJrJitgZOXCnmGP40c59AC2xU3NhR12pHatrjHPVcY5w5nKQj+Ps+nCJfm
 nq5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD9ZJh3ztwDAmP/ttoOJxxhG8v/vk+mnSM6ije0+bMrA/2+RiyWCVF+yNdY9x9n3MsfFcvfV3v2Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx9SF7LaB4xGrycyLAk8eoPUlXiNIiib3FIA5TgCodLgQBiJN9g
 uqfr63+JRZdQk+3pLErv4Z0o3Q67iYjX9YkJzXW2mN7uEMs/9/O/OL4QohUfGxKHKr8=
X-Gm-Gg: ASbGncuZW1cqbg3+AFjfPAj+NThxDA8NS3/ZBU3TsVEX95V8ZaAUBU185YvgvS0ZcsC
 1vGIk0rXu6ziHK7ax7OAOn1xhYE/yZ2dg5WRPqNDIYNchTLP+vrWLAOPG7ujgd/IPE6nSyYzCtK
 ToiMq2LZog7Rf3dIP+C8fL0BYXvwKTs+jp07SD2y/RkZ/ELmomAmTytZtStc1d2rvH1B5Trfxpq
 af+vGCJZn256zPadG7nlIhzYvXpgDQATdb6CbbQGorsp5O7WtEUDyuCwnCJDPYxIjnd/P12eeSL
 UdevedQpkhWzOxeSIxIs9237uaYcwRHTnUS1thBruBXyJft2bAJkFwyUdJKbXoREChGu3PTVqM4
 n1+elG2DPIiaQQOYdXyJFznH855yntJUR1rIdVi9gPajEp33Y6QwXnnFRs8BHgxXSuMVP
X-Google-Smtp-Source: AGHT+IFt5P0oviDbnYmdu2jgB6N+VWIy4OfOwDHoyPkvb6+JY6Au/bNNK2jEF2xSF0SsYyK4DM4pvw==
X-Received: by 2002:a05:6a00:3d52:b0:781:9ae1:1be6 with SMTP id
 d2e1a72fcca58-793857098a3mr17368114b3a.6.1760142678830; 
 Fri, 10 Oct 2025 17:31:18 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992d2d2e42sm4148274b3a.62.2025.10.10.17.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 17:31:18 -0700 (PDT)
Message-ID: <f297c8ef-cc18-4374-82c1-5f0d64a1708a@linaro.org>
Date: Fri, 10 Oct 2025 17:31:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] hw/arm/smmuv3: Add initial support for Secure
 State
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger
 <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>, philmd@linaro.org,
 jean-philippe@linaro.org, smostafa@google.com
References: <20250925162618.191242-1-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250925162618.191242-1-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi Tao and Eric,

On 9/25/25 9:26 AM, Tao Tang wrote:
> Hi all,
> 
> This is the second version of the patch series to introduce initial
> support for Secure SMMUv3 emulation in QEMU.
> 
> This version has been significantly restructured based on the excellent
> feedback received on the RFC.
> 
> This version addresses the major points raised during the RFC review.
> Nearly all issues identified in v1 have been resolved. The most
> significant changes include:
> 
>    - The entire series has been refactored to use a "banked register"
>    architecture. This new design serves as a solid base for all secure
>    functionality and significantly reduces code duplication.
> 
>    - The large refactoring patch from v1 has been split into smaller, more
>    focused commits (e.g., STE parsing, page table handling, and TLB
>    management) to make the review process easier.
> 
>    - Support for the complex SEL2 feature (Secure Stage 2) has been
>    deferred to a future series to reduce the scope of this RFC.
> 
>    - The mechanism for propagating the security context now correctly uses
>    the ARMSecuritySpace attribute from the incoming transaction. This
>    ensures the SMMU's handling of security is aligned with the rest of the
>    QEMU ARM architecture.
> 
> 
> The series now begins with two preparatory patches that fix pre-existing
> bugs in the SMMUv3 model. The first of these, which corrects the CR0
> reserved mask, has already been reviewed by Eric.
> 
>    - hw/arm/smmuv3: Fix incorrect reserved mask for SMMU CR0 register
>    - hw/arm/smmuv3: Correct SMMUEN field name in CR0
> 
> The subsequent patches implement the Secure SMMUv3 feature, refactored
> to address the feedback from the v1 RFC.
> 
> 
> Changes from v1 RFC:
> 
>    - The entire feature implementation has been refactored to use a "banked
>    register" approach. This significantly reduces code duplication.
> 
>    - Support for the SEL2 feature (Secure Stage 2) has been deferred. As
>    Mostafa pointed out, a correct implementation is complex and depends on
>    FEAT_TTST. This will be addressed in a separate, future patch series.
>    As a result, this series now supports the following flows:
> 
>      - Non-secure Stage 1, Stage 2, and nested translations.
> 
>      - Secure Stage 1-only translations.
> 
>      - Nested translations (Secure Stage 1 + Non-secure Stage 2), with a
>    fault generated if a Secure Stage 2 translation is required.
> 
>    - Writability checks for various registers (both secure and non-secure)
>    have been hardened to ensure that enable bits are correctly checked.
> 
> The series has been successfully validated with several test setups:
> 
>    - An environment using OP-TEE, Hafnium, and a custom platform
>    device as V1 series described.
> 
>    - A new, self-contained test device (smmu-testdev) built upon the
>    QTest framework, which will be submitted as a separate series as
>    discussed here:
>      https://lists.nongnu.org/archive/html/qemu-devel/2025-09/msg05365.html
> 
>    - The existing non-secure functionality was regression-tested using
>    PCIe passthrough to a KVM guest running inside a TCG guest.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> 
> Tao Tang (14):
>    hw/arm/smmuv3: Fix incorrect reserved mask for SMMU CR0 register
>    hw/arm/smmuv3: Correct SMMUEN field name in CR0
>    hw/arm/smmuv3: Introduce secure registers and commands
>    refactor: Move ARMSecuritySpace to a common header
>    hw/arm/smmuv3: Introduce banked registers for SMMUv3 state
>    hw/arm/smmuv3: Add separate address space for secure SMMU accesses
>    hw/arm/smmuv3: Make Configuration Cache security-state aware
>    hw/arm/smmuv3: Add security-state handling for page table walks
>    hw/arm/smmuv3: Add secure TLB entry management
>    hw/arm/smmuv3: Add banked support for queues and error handling
>    hw/arm/smmuv3: Harden security checks in MMIO handlers
>    hw/arm/smmuv3: Use iommu_index to represent the security context
>    hw/arm/smmuv3: Add property to enable Secure SMMU support
>    hw/arm/smmuv3: Optional Secure bank migration via subsections
> 
>   hw/arm/smmu-common.c          |  151 ++++-
>   hw/arm/smmu-internal.h        |    7 +
>   hw/arm/smmuv3-internal.h      |  114 +++-
>   hw/arm/smmuv3.c               | 1130 +++++++++++++++++++++++++--------
>   hw/arm/trace-events           |    9 +-
>   hw/arm/virt.c                 |    5 +
>   include/hw/arm/arm-security.h |   54 ++
>   include/hw/arm/smmu-common.h  |   60 +-
>   include/hw/arm/smmuv3.h       |   35 +-
>   target/arm/cpu.h              |   25 +-
>   10 files changed, 1257 insertions(+), 333 deletions(-)
>   create mode 100644 include/hw/arm/arm-security.h
> 
> --
> 2.34.1
> 

I've been working this on Device Assignment software stack recently 
published by Arm, to run that under QEMU.

[1] 
https://git.trustedfirmware.org/plugins/gitiles/TF-RMM/tf-rmm/+/refs/heads/topics/da_alp12_v2

As part of the implementation, I had to define SMMU Realm registers and 
some root registers as well.
I based the work on this series, and the banked approach works well to 
add Realm registers. For Root registers, since they have different 
offsets than NonSecure, Secure and Realm ones, they need their own 
{read,write}_mmio function.

Just that to say that it's a great start, and I'm looking forward to 
work with the v3.

Regards,
Pierrick

