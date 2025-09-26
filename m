Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D558CAC5AE
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 16:13:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v2B44-0007MY-Ah; Fri, 26 Sep 2025 12:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v2B3x-0007Lg-GH
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 12:12:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v2B3o-00077k-Cw
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 12:12:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758903154;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KJdb/L+KFYMkIctsBP1lxeu8sdCseNUPRWxPpD9JrWw=;
 b=HhuaUs2h0miE5+HDW608uAkgpf1Mix4Kk5Fj33xEQKNpU6AyogXMrqU/RUOrSCdS/rq8lk
 gMe/mbjc6Cgwi52GANgcDm7FUyLxiOx5ugyCj+po+rEGtyyWh/SLSeky8Nh0PxrkhsroCV
 WIFrOSdAoTkjwnBANkNBbKLWeVQkiZQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-Ftnh-iiAO4qzQ6oknswlAw-1; Fri, 26 Sep 2025 12:12:32 -0400
X-MC-Unique: Ftnh-iiAO4qzQ6oknswlAw-1
X-Mimecast-MFC-AGG-ID: Ftnh-iiAO4qzQ6oknswlAw_1758903151
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-46e32eb4798so12602115e9.2
 for <qemu-arm@nongnu.org>; Fri, 26 Sep 2025 09:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758903151; x=1759507951;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KJdb/L+KFYMkIctsBP1lxeu8sdCseNUPRWxPpD9JrWw=;
 b=wB35AllNuJ9nvxsL4eyn3A+ekInPjfRTTejBLDWh6Hf7RiqP4OmAhiCfg9Nbp2nhbo
 R9QbidMA1NiWZLl/ioukbr0ANZwskU9YISj6ERae2GHsHMXGvpqFNjjMhl7a3PVxSzS5
 MPLB+eFD5nmA9FZlODBZ3V7yypsdUmFUZMDnKSAhQrd+WaJfplSwaoela8FFxWd3HVR6
 Kc3yOyjttzx+UCI/tvVUTiRsPp9YRZHy4H75WdxOGbpXBigtHfi0i+qOz3iiSWVEQssv
 v/kqGPwm19u8KlqY2RrYVVWDz1jerWpixcSVRrKDvQ4UJHJYxAdnwGbBdrvQ25MY6Zn4
 9prA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULsm9dUYnj7KmMDXWKWBPV5prgaVGwpH7ahcdUiNAd2+86tvVGrxgUt6Tf9tbZLEb9mA9i448OLg==@nongnu.org
X-Gm-Message-State: AOJu0YwFJ9mAcluafqsGVIgUskXFqEoiJVqs5pCJsc1t3XmAZbhTF1DN
 CSe6bsgPmgUuiZZEw24Ua9a8/fpgwJZ/sq/GTzItMOe8VCwVJAjrhriYfZuOkud7kXXlrS7vO3T
 k4OQLx8sz2mtb+KIZx/IdHTgRzi52qPXsJ87iZITePeJ16iiV/DmZ8A==
X-Gm-Gg: ASbGncv1NZTtCJPn49m5MrZQiZImcSrIoSEUY/8U9GYtaUm0l9zNnu/RgIxOyNb+IPH
 rQANExwQCNWAXL4tTx37n+ZjY01yVt9oGXzKwLY4h86h/JoAREW5WgZ8F4e2Ap+DJOFDzM98Ist
 S7ygu+14tc4aILPmmtEomRJNcYP1FjqE69fY0yLr7HFvSxfinf5Fa0HLyAAy02aYv9Fng43kmsN
 zAfhjbniSXjKqDSodlVm/SQhyi8pqemp2eYFp2h7z+nzafnss7uX+VOzoGNG2jixjCnRRQ0vmcJ
 Fl6kePOoH0cPLoTTLx1aBKjsIu/ot6GlnFndfdAnPKSt+w3QfroK2caIQkggTdCtLGtBn4Hj2xR
 SDN1g7hBvAcQ=
X-Received: by 2002:a05:600c:8209:b0:46e:376a:c9db with SMTP id
 5b1f17b1804b1-46e376acfbbmr55479665e9.26.1758903151090; 
 Fri, 26 Sep 2025 09:12:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2jDP056oF8tEN5bgzw1klTRTvTVc52vz+HmtjLJBvYvPnTVO/GI0V8Z4mhqmJ6DG0UdYRNg==
X-Received: by 2002:a05:600c:8209:b0:46e:376a:c9db with SMTP id
 5b1f17b1804b1-46e376acfbbmr55479345e9.26.1758903150638; 
 Fri, 26 Sep 2025 09:12:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e42eee0b6sm11434765e9.10.2025.09.26.09.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 09:12:29 -0700 (PDT)
Message-ID: <7612914c-ada2-42c4-8e68-951e2d601534@redhat.com>
Date: Fri, 26 Sep 2025 18:12:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] hw/arm/smmuv3: Add initial support for Secure
 State
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>, pierrick.bouvier@linaro.org,
 philmd@linaro.org, jean-philippe@linaro.org, smostafa@google.com
References: <20250925162618.191242-1-tangtao1634@phytium.com.cn>
 <e439e75e-6d1c-4209-aa41-f3e9d5051462@redhat.com>
 <ce02db47-f9b2-4e48-afe5-3d29a5172f7e@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ce02db47-f9b2-4e48-afe5-3d29a5172f7e@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o_IU0Z7NZmpBLVJmkoLdC2n1uyXRH8IrWB53DcCn6sY_1758903151
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.446,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 9/26/25 4:54 PM, Tao Tang wrote:
>
> On 2025/9/26 20:24, Eric Auger wrote:
>> Hi,
>>
>> On 9/25/25 6:26 PM, Tao Tang wrote:
>>> Hi all,
>>>
>>> This is the second version of the patch series to introduce initial
>>> support for Secure SMMUv3 emulation in QEMU.
>>>
>>> This version has been significantly restructured based on the excellent
>>> feedback received on the RFC.
>>>
>>> This version addresses the major points raised during the RFC review.
>>> Nearly all issues identified in v1 have been resolved. The most
>>> significant changes include:
>>>
>>>    - The entire series has been refactored to use a "banked register"
>>>    architecture. This new design serves as a solid base for all secure
>>>    functionality and significantly reduces code duplication.
>>>
>>>    - The large refactoring patch from v1 has been split into
>>> smaller, more
>>>    focused commits (e.g., STE parsing, page table handling, and TLB
>>>    management) to make the review process easier.
>>>
>>>    - Support for the complex SEL2 feature (Secure Stage 2) has been
>>>    deferred to a future series to reduce the scope of this RFC.
>>>
>>>    - The mechanism for propagating the security context now
>>> correctly uses
>>>    the ARMSecuritySpace attribute from the incoming transaction. This
>>>    ensures the SMMU's handling of security is aligned with the rest
>>> of the
>>>    QEMU ARM architecture.
>>>
>>>
>>> The series now begins with two preparatory patches that fix
>>> pre-existing
>>> bugs in the SMMUv3 model. The first of these, which corrects the CR0
>>> reserved mask, has already been reviewed by Eric.
>>>
>>>    - hw/arm/smmuv3: Fix incorrect reserved mask for SMMU CR0 register
>>>    - hw/arm/smmuv3: Correct SMMUEN field name in CR0
>>>
>>> The subsequent patches implement the Secure SMMUv3 feature, refactored
>>> to address the feedback from the v1 RFC.
>> could you shared a branch? It does not seem to apply on master.
>>
>> Thanks
>>
>> Eric
>
>
> Hi Eric,
>
> Thanks for the feedback. I've rebased the patch series onto the latest
> master and pushed it to a branch as you requested.
>
> Interestingly, the rebase completed cleanly without any conflicts on
> my end, so I'm not sure what the initial issue might have been. In any
> case, this branch should be up-to-date.
>
>
> You can find the updated branch here for review:
>
> - [v1-rebased]
> https://github.com/hnusdr/qemu/tree/secure-smmu-v1-community-newer

Thanks for the branches. I guess it is due to

[PATCH v9 00/11] hw/arm/virt: Add support for user creatable SMMUv3 device <https://lore.kernel.org/all/20250829082543.7680-1-skolothumtho@nvidia.com/#r>

which landed ~ 10d ago.

Thanks

Eric

>
>
> For historical reference, the original branch is here.
>
> -
> [v1-original]  https://github.com/hnusdr/qemu/tree/secure-smmu-v1-community
>
>
> Thanks,
>
> Tao
>
>
>>>
>>> Changes from v1 RFC:
>>>
>>>    - The entire feature implementation has been refactored to use a
>>> "banked
>>>    register" approach. This significantly reduces code duplication.
>>>
>>>    - Support for the SEL2 feature (Secure Stage 2) has been
>>> deferred. As
>>>    Mostafa pointed out, a correct implementation is complex and
>>> depends on
>>>    FEAT_TTST. This will be addressed in a separate, future patch
>>> series.
>>>    As a result, this series now supports the following flows:
>>>
>>>      - Non-secure Stage 1, Stage 2, and nested translations.
>>>
>>>      - Secure Stage 1-only translations.
>>>
>>>      - Nested translations (Secure Stage 1 + Non-secure Stage 2),
>>> with a
>>>    fault generated if a Secure Stage 2 translation is required.
>>>
>>>    - Writability checks for various registers (both secure and
>>> non-secure)
>>>    have been hardened to ensure that enable bits are correctly checked.
>>>
>>> The series has been successfully validated with several test setups:
>>>
>>>    - An environment using OP-TEE, Hafnium, and a custom platform
>>>    device as V1 series described.
>>>
>>>    - A new, self-contained test device (smmu-testdev) built upon the
>>>    QTest framework, which will be submitted as a separate series as
>>>    discussed here:
>>>     
>>> https://lists.nongnu.org/archive/html/qemu-devel/2025-09/msg05365.html
>>>
>>>    - The existing non-secure functionality was regression-tested using
>>>    PCIe passthrough to a KVM guest running inside a TCG guest.
>>>
>>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>>>
>>> Tao Tang (14):
>>>    hw/arm/smmuv3: Fix incorrect reserved mask for SMMU CR0 register
>>>    hw/arm/smmuv3: Correct SMMUEN field name in CR0
>>>    hw/arm/smmuv3: Introduce secure registers and commands
>>>    refactor: Move ARMSecuritySpace to a common header
>>>    hw/arm/smmuv3: Introduce banked registers for SMMUv3 state
>>>    hw/arm/smmuv3: Add separate address space for secure SMMU accesses
>>>    hw/arm/smmuv3: Make Configuration Cache security-state aware
>>>    hw/arm/smmuv3: Add security-state handling for page table walks
>>>    hw/arm/smmuv3: Add secure TLB entry management
>>>    hw/arm/smmuv3: Add banked support for queues and error handling
>>>    hw/arm/smmuv3: Harden security checks in MMIO handlers
>>>    hw/arm/smmuv3: Use iommu_index to represent the security context
>>>    hw/arm/smmuv3: Add property to enable Secure SMMU support
>>>    hw/arm/smmuv3: Optional Secure bank migration via subsections
>>>
>>>   hw/arm/smmu-common.c          |  151 ++++-
>>>   hw/arm/smmu-internal.h        |    7 +
>>>   hw/arm/smmuv3-internal.h      |  114 +++-
>>>   hw/arm/smmuv3.c               | 1130
>>> +++++++++++++++++++++++++--------
>>>   hw/arm/trace-events           |    9 +-
>>>   hw/arm/virt.c                 |    5 +
>>>   include/hw/arm/arm-security.h |   54 ++
>>>   include/hw/arm/smmu-common.h  |   60 +-
>>>   include/hw/arm/smmuv3.h       |   35 +-
>>>   target/arm/cpu.h              |   25 +-
>>>   10 files changed, 1257 insertions(+), 333 deletions(-)
>>>   create mode 100644 include/hw/arm/arm-security.h
>>>
>>> -- 
>>> 2.34.1
>>>
>


