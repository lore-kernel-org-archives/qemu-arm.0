Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BB4E9904A
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 07:37:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wB6QK-00061U-6p; Fri, 10 Apr 2026 03:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wB6QI-000615-TH
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 03:37:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wB6QH-0008LB-9k
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 03:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1775806620;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ubV0vkvEAomTpEkTf6CuJhHEwYGUPp0mMDoCQtn74pA=;
 b=PKDSt1jmh9ubhFfSbP371NGoZEBF49wGTCVWz1wb/Xnb9bx243OVqWAoWUt2nCEFuEj33L
 ndYEjLEPOr4cJwepreQYhCQDEQncPcviJGyOhPZT2YJ94WhiD1gEqGV3Tdzmqc1nwVTKGL
 MrEuwPSFIwUU7GkVO00sjJjN0/gYhrU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-HkDl-DLZMYqH2buBGxTXjA-1; Fri, 10 Apr 2026 03:36:56 -0400
X-MC-Unique: HkDl-DLZMYqH2buBGxTXjA-1
X-Mimecast-MFC-AGG-ID: HkDl-DLZMYqH2buBGxTXjA_1775806616
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-488d2cd2674so8898435e9.0
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 00:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775806615; x=1776411415;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ubV0vkvEAomTpEkTf6CuJhHEwYGUPp0mMDoCQtn74pA=;
 b=n8nyJpS8RGt5JamKluVdS86gKbSUN87F7QDfasqeo9jYSg/mb142FGF/igfFTQnycL
 KETfe81kJu54Qx6mfIUyO1IRNGdtLOyFRLBjq7X1O7bCQRkvMf4Nim8EGoe8/lh8ufhP
 mrPWEZ8mnVnfpkGvpyy/XK9YrdU4F9dU30eMLwmFbj/iBwj1zVGqX16H9UZ3QfzrcWsL
 Tr8cNJZv2W+EGJzb7AthEUSRud3rtp0NqCgDaOk2ADb4n1QGyh+nmHX01wnNnJZzaoNc
 Ls9im+RbiI4sc1/xersbjx7N+eInLA9Bf604YXadBOxS3uf3JfcPn2TIW11MvMlS+LlC
 +45w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDOB3Pr0rDc/XQ0u/LT6yO09vIAzdbARw7A9vcbEeqtFT1UjkY8zysQOIj3tXdyp2Dl9NISt8S5Q==@nongnu.org
X-Gm-Message-State: AOJu0YxbSHORKY489NMLxSNIoQqHv9ro8mYx2cm+51RFKeG21785psG7
 +p8UWekKougWXbrXbQIuz4sHpCcJxtzoR6ZLXByF8pzINsXLuG59qeqGmxKkhKMUir71kPX4bC0
 jRkqAGZ7ngvBqX+BadzQ7ZsA3B9RLkV5RS8v7A/QVxEDquNbxiE6vmQ==
X-Gm-Gg: AeBDievM6fr8an64o1V2FSPFy43CyHFANKGgTgW2NPUMgmseL467oT+o1Q84SoT5OAk
 /cedblAtDQ97p+xQ/eh7KXsA6zm2ISOf3tecUbKr+xRS7zSUqgw12MQ2V1OxzUcvY7RIo/tnedQ
 yfjomq6nUd7RN6tZf2Kn36tTn73TMAKa7aPcLBeBoYfFmrnabUwh37hbvhig3Fm9MeZOUUP0O0M
 wfWdv7s98G8Oubwpzi1MSoKmX54TZaroUjml7y1GqRs7a8tlb9R8E0Jn1lTjxISNenlMYpLr5Pc
 B3jNE9giDXLwRusM9JtAoenwSTatGUlV0OzuGq+sDcEzhRcJMNtwDkLuacvipMxIphvtBehQJdX
 m1EjLQVzRuJeasEqYsUMx2zbmfhLdlxbIwlcR8KefyvJ1bX443A5jqdh3LeTGUuKhSJHlFg==
X-Received: by 2002:a05:600c:c088:b0:486:f9d0:aac8 with SMTP id
 5b1f17b1804b1-488d6843187mr16116415e9.18.1775806615470; 
 Fri, 10 Apr 2026 00:36:55 -0700 (PDT)
X-Received: by 2002:a05:600c:c088:b0:486:f9d0:aac8 with SMTP id
 5b1f17b1804b1-488d6843187mr16116055e9.18.1775806614974; 
 Fri, 10 Apr 2026 00:36:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d681ed50sm14090595e9.15.2026.04.10.00.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 00:36:54 -0700 (PDT)
Message-ID: <46116b64-c7a7-4d9a-bd99-a6b81fd45fed@redhat.com>
Date: Fri, 10 Apr 2026 09:36:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] hw/arm/smmuv3-accel: Implement "auto" value for
 "ats"
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
References: <20260401010231.4166776-1-nathanc@nvidia.com>
 <20260401010231.4166776-3-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260401010231.4166776-3-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n64auC5MBki0mwN8esk3aurTqjmGWATwIkGCQ9nEDJw_1775806616
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 4/1/26 3:02 AM, Nathan Chen wrote:
> From: Nathan Chen <nathanc@nvidia.com>
>
> Allow accelerated SMMUv3 Address Translation Services support property
> to be derived from host IOMMU capabilities. Derive host values using
> IOMMU_GET_HW_INFO, retrieving ATS capability from IDR0.
>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 10 ++++++++++
>  hw/arm/smmuv3.c       |  7 +------
>  2 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index a0146c8d31..a835c8f220 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -44,6 +44,12 @@ static void smmuv3_accel_auto_finalise(SMMUv3State *s,
>          return;
>      }
>  
> +    /* Update ATS if auto from info */
> +    if (s->ats == ON_OFF_AUTO_AUTO) {
> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ATS,
> +                               FIELD_EX32(info->idr[0], IDR0, ATS));
> +    }
> +
>      accel->auto_finalised = true;
>  }
>  
> @@ -938,4 +944,8 @@ void smmuv3_accel_init(SMMUv3State *s)
>      s->s_accel = g_new0(SMMUv3AccelState, 1);
>      bs->iommu_ops = &smmuv3_accel_ops;
>      smmuv3_accel_as_init(s);
> +
> +    if (s->ats == ON_OFF_AUTO_AUTO) {
> +        s->s_accel->auto_mode = true;
> +    }
>  }
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 09ea08eb18..f3603554e3 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1973,10 +1973,6 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>      }
>  #endif
>  
> -    if (s->ats == ON_OFF_AUTO_AUTO) {
> -        error_setg(errp, "ats auto mode is not supported");
> -        return false;
> -    }
>      if (s->ril == ON_OFF_AUTO_AUTO) {
>          error_setg(errp, "ril auto mode is not supported");
>          return false;
> @@ -2196,8 +2192,7 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>          "is not supported.");
>      object_class_property_set_description(klass, "ats",
>          "Enable/disable ATS support (for accel=on). Please ensure host "
> -        "platform has ATS support before enabling this. ats=auto is not "
> -        "supported.");
I would explicitly mention that auto value is supported.
Maybe:
Set ATS support. Valid values are off/on/auto. If set to on, make sure
the host platform supports ATS.

You have examples in hw/arm/virt.c. For instance msi option.

Also note that the doc in qemu-options.hx must also be updated. 

Eric
> +        "platform has ATS support before enabling this.");
>      object_class_property_set_description(klass, "oas",
>          "Specify Output Address Size (for accel=on). Supported values "
>          "are 44 or 48 bits. Defaults to 44 bits. oas=auto is not "


