Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4AD103E17A
	for <qemu-arm@archiver.kernel.org>; Wed, 18 Mar 2026 14:13:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2re9-0006Dq-J9; Wed, 18 Mar 2026 10:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w2re8-0006DG-5u
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 10:13:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w2re5-0005eU-VW
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 10:13:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773843191;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QUKFDcF/eO64vgTd59UYgSrhBZZ2lBaSNEAFegVROnU=;
 b=YanFbr7iuJKILO16D65DOdI9O2IyFe15C/PnouJ+EXMpzw7uy9OxhXQP7o15sJpHITUek/
 ExjVitsd1kl/938mIq7G9NVUhKDXRgPUZfVyh291Ngl05bmcT6dH/iqvWtF3N+67PtvDOF
 Eo3mKnlM3m64R3RCDiEfKCnaH3rSksE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-AN5ij4axN_S6yHic4h3gbA-1; Wed, 18 Mar 2026 10:13:09 -0400
X-MC-Unique: AN5ij4axN_S6yHic4h3gbA-1
X-Mimecast-MFC-AGG-ID: AN5ij4axN_S6yHic4h3gbA_1773843188
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4853f33b7dbso61077845e9.3
 for <qemu-arm@nongnu.org>; Wed, 18 Mar 2026 07:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773843188; x=1774447988;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QUKFDcF/eO64vgTd59UYgSrhBZZ2lBaSNEAFegVROnU=;
 b=P0EyIo+AExThFYAxt1b3dvzTT/EyX36sBGfklo/1Y/YNgt3XvvIxTKlT6VSuJU6fbC
 IwDTICACOw0Cxif6EUxlY/OLVYVyDBNWLcbv41xi6tHNs+BSZf3/YnfVbEruzur5TBxx
 ILvywD/svf8SENxC6RYj15iQF3n58DO6cuCWh4KKBUB8LGKMLtrsPsVV9dkhT5qJx8J4
 asKqRxl3Ds/+JrnM5ZiXelG661cgXlkyG+nS88PsdMZILpxPHo7EYitVnUOjcArxddQ+
 2lIpMAubDjiHum5d+5/V5E+yPSoYkL+TDUstqJ4Cg0D2cT2knUOpLL9tFvoP+KbBwdw1
 fdOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc5AySgSbCsam4+H4TUKhUIeh+5ieUJaFbqMjcVQpE+tsBejH0tXFdpAsZvRpr7iMywzSL/8VohQ==@nongnu.org
X-Gm-Message-State: AOJu0YwanwRQGIDk5+nLVWqSEK6YD/mlrd2DnE3acW69bmvVGLTyY/2U
 PogKb0ebQqAxa+frB9piBhLs68NJzA494yRf2T/pvviukErobyoBDDI7taP6049gtBECd8VoeEp
 dG/z6/JECmwjXZtpFitTTi6OZ0p8uRFXGMERU2/X8PijCeBdMP8zScQ==
X-Gm-Gg: ATEYQzwEa70fSQIFASmH73RXm43avFJGsY0Uji0bWNXJ5K7EA/ZiKiL/QaNUkkkhdyl
 3mIjMZ9fdw02mXmYMx997jLyXOkkDMa/0CEWbX6Nuu6mBVwo8X17MgIxchtUx2bBX4jM6KH9qrj
 pN8rGPRoOjjapUYZPqXr1QNu95t46GxKCrMtZoNCJTSxjnY2IV8rF1ogqPNNfZsf+PhQ52N3ozK
 jOwIBRwbvmfbowb8X9xW2b8cN/XYVEiWKCfm4qQcb1mjwSvGcgWpzh9jcRHHM/soDmgTNTF4ulD
 iktbp8qh6bxdXnRNkpHlMSW9E0h/ax5gUidhGiwekVF1fwpRTR29fdfB/xoHAacErhk8SWz6ZCU
 41+c0aqddvitGP//Psu4MyvGFNwsU12Ch9a7Zt9dr5mjYiN3SlGOV0dyRgP6adglm8L6FVA==
X-Received: by 2002:a05:600c:3491:b0:483:7783:537b with SMTP id
 5b1f17b1804b1-486f4450338mr58867135e9.24.1773843188263; 
 Wed, 18 Mar 2026 07:13:08 -0700 (PDT)
X-Received: by 2002:a05:600c:3491:b0:483:7783:537b with SMTP id
 5b1f17b1804b1-486f4450338mr58866535e9.24.1773843187726; 
 Wed, 18 Mar 2026 07:13:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f4e5495csm36268005e9.2.2026.03.18.07.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2026 07:13:07 -0700 (PDT)
Message-ID: <b65e3f7c-c8cd-42a4-8eae-b673e406a31c@redhat.com>
Date: Wed, 18 Mar 2026 15:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.0 v3 0/8] hw/arm/smmuv3-accel: Support AUTO
 properties
To: Nathan Chen <nathanc@nvidia.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
References: <20260317183755.3721625-1-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260317183755.3721625-1-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: X8nIM0EMTpNfRMPSLiqvli440ErQMmMJbLbsg-Sdc6k_1773843188
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi Nathan,

On 3/17/26 7:37 PM, Nathan Chen wrote:
> Hi,
>
> This is a follow-up to the previous series [0] that introduces support
> for specifying 'auto' for arm-smmuv3 accelerated mode's ATS, RIL,
> SSIDSIZE, and OAS feature properties.
>
> In QEMU 11.0 we introduced new options for vSMMU [1], but feedback received
> when starting the integration of layered products shows the need for
> auto/host-retrieved values. To avoid breaking JSON/QMP compat, we want
> to fix the option types so that they can later support the auto mode. At
> the moment the auto mode is not supported though.
>
> A future series will introduce support for resolving the 'auto' values
> based on host SMMUv3 IDR values, as well as setting per-device ATS
> capability.
>
> A complete branch can be found here:
> https://github.com/NathanChenNVIDIA/qemu/tree/smmuv3-accel-auto-v3
>
> Please take a look and let me know your feedback.
>
> Thanks,
> Nathan
>
> Changes from v2:
> - Enforce 'auto' value not being supported for HW-accel SMMUv3 props
> - Revise docs to mention auto is not supported and these properties
>   are only applicable when accel=on.
> - Only override non-defaults in smmuv3_accel_idr_override()
> - Remove check for SSIDSIZE AUTO in smmuv3_accel_idr_override() as
>   smmu_validate_property() checks for AUTO beforehand
> - Consolidate comments for ssidsize_mode_to_value()
> - Include Fixes tags in commit descriptions
> - Include R-by tags from v2
>
> Changes from RFCv1:
> - Remove changes that resolve the 'auto' values based on host SMMUv3
> - Restore defaults values for RIL, OAS, SSIDSIZE, and ATS
> - Update OasMode to accept all OAS sizes instead of only auto, 44, and
>   48
> - Include comment in SsidSizeMode schema clarifying enum value
>   ordering
> - Replace ats-enabled prop with a helper that accepts the dynamic
>   casted TYPE_ARM_SMMUV3 object
> - Separate out guest vs. host ATS check in
>   smmuv3_accel_check_hw_compatible() to a different commit
> - Document accel, RIL, OAS, SSIDSIZE, and ATS properties in
>   qemu-options.hx
>
> Testing:
> Basic sanity testing was performed on an NVIDIA Grace platform with GPU
> device assignment and running CUDA test apps on the guest. Additional
> testing and feedback are welcome.

Feel free to add my
Tested-by: Eric Auger <eric.auger@redhat.com>

Eric
>
> [0] https://lore.kernel.org/qemu-devel/20260312210328.2016191-1-nathanc@nvidia.com/
> [1] https://lore.kernel.org/all/20260126104342.253965-1-skolothumtho@nvidia.com/
>
> Nathan Chen (8):
>   hw/arm/smmuv3-accel: Check ATS compatibility between host and guest
>   hw/arm/smmuv3-accel: Change ATS property to OnOffAuto
>   hw/arm/smmuv3-accel: Change RIL property to OnOffAuto
>   qdev: Add a SsidSizeMode property
>   hw/arm/smmuv3-accel: Change SSIDSIZE property to SsidSizeMode
>   qdev: Add an OasMode property
>   hw/arm/smmuv3-accel: Change OAS property to OasMode
>   qemu-options.hx: Document arm-smmuv3 device's accel properties
>
>  hw/arm/smmuv3-accel.c                    | 43 ++++++++++++++++++----
>  hw/arm/smmuv3.c                          | 45 ++++++++++++++++--------
>  hw/arm/virt-acpi-build.c                 |  2 +-
>  hw/core/qdev-properties-system.c         | 27 ++++++++++++++
>  include/hw/arm/smmuv3.h                  | 11 +++---
>  include/hw/core/qdev-properties-system.h |  6 ++++
>  qapi/misc-arm.json                       | 44 +++++++++++++++++++++++
>  qapi/pragma.json                         |  1 +
>  qemu-options.hx                          | 35 +++++++++++++++++-
>  9 files changed, 187 insertions(+), 27 deletions(-)
>


