Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4B1CD3447
	for <qemu-arm@archiver.kernel.org>; Fri,  8 May 2026 11:37:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wLJWJ-0000UG-Ii; Fri, 08 May 2026 07:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wLJWI-0000U4-FV
 for qemu-arm@nongnu.org; Fri, 08 May 2026 07:37:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wLJWH-00080K-4A
 for qemu-arm@nongnu.org; Fri, 08 May 2026 07:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778240243;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SKWhW+r8Pp69V6HBIP2YQiABQjyC34ZorijHUDp/RqU=;
 b=ZMX/i5Q6hg5eyxox9iGjs4CWoRc7+ramCO5N/URWLj/aEGb0kn/3Hag0DygvAMKEC+SR4v
 4AsV2JFVpx62ctD4QwU49fiGAhxXyUUREGAvmN4w3yfvSX/azDhBLdXDqj1rbqGA32VOFa
 gPoAaSqBxNqcFND1DsRl2REXBYNDBqc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-Y2Tpo3REOKaCIEGX_pOE-g-1; Fri, 08 May 2026 07:37:22 -0400
X-MC-Unique: Y2Tpo3REOKaCIEGX_pOE-g-1
X-Mimecast-MFC-AGG-ID: Y2Tpo3REOKaCIEGX_pOE-g_1778240241
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-44f1b4d0fb0so1298128f8f.1
 for <qemu-arm@nongnu.org>; Fri, 08 May 2026 04:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778240241; x=1778845041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SKWhW+r8Pp69V6HBIP2YQiABQjyC34ZorijHUDp/RqU=;
 b=LwgxU+eKSpFfW2tSkkaVt4P+XuhFn7woDDRNPziPNwLvE3BmFbE00sgZK2vUkauCF7
 7m1gbsAYHk1GjvOu+OT8dhh9qgrrmbmCIlq8qhb73c1vfjSksnGfCTcZZPjUGidH1ty9
 IptuUp817rT1Wgz/vze6icGeruCYOsTbxkIFfKYpXX2ZhzAYYdl5DraPka6Tmwwa9qfE
 hatSHCzfzZxk3wyanjfskVqQSjcRL7Xu8SpRL80j7JSos2ggZrSk7o6klEXgc2yPIS1R
 3eaPNIub+HDYRKIKZrHDLp1nO2zg1Fx4msUsHTF4H1GzVW5kStdWrVNHvkIeJZXsVEas
 /7VQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+GLuSFiF3gV3NEineA2Uq80yBZbt8S5xKGkAw5rAIQVN3W7N0XRSgdWOfoTjfO41En+jyhrJdL9g==@nongnu.org
X-Gm-Message-State: AOJu0Yx7pV0oJsw/roZ13VH4YC63xK1rCo2QkLS+XaUBzKvvQPYMSeIt
 4i0jef1mEoVXYnAEsaNjrdgv6FXcMJmmGAC/xrVpz1RYR4Zgost83GCF5UPIsQV9qZ4T5YLLyJY
 B57e+1VhYqmImkF1I+nqLK6+Aj38Inf/2G5Of3bigs6K4nA50foeEbg==
X-Gm-Gg: AeBDievTIii3Tb72UIMyQ0BwCnmAww7y87aBTKR6kHLd+zQ3IeK1w1HqH/02ELnmYMv
 +fNRXIo3zYm4LLtxYLZqWiKzqy/C80aHE9l0ivkVhFA6YZ3rmvAsoAdDP8MLhCicfVd6UHd33if
 FVfQO/ygOtbJ+mdiIHJrMsx5ci9a8kO97UUb2V4FqqyU6+17oj3KxDxDbyjHMEOHU+dn8b9lOnJ
 3uUN5wRMWO04KMtQwqTb7n9t1dT0zqh7muRdIyYRujrFQA0EjOkuNJDaVMOurp2bSjjRBzN0eeJ
 cYyNeUTnBpBS5yrXyur33Ba4dxOQ4ABf8gPJgi9Y+yxxX0VHBZwBV0eCLTXDYUkm6tYPLr+5TBA
 UaJBr5qvpFgBZ3TedTO+nNvo/+tbYVNZ6C+bF4lAT0T0U4dwi6Fb5neIunPRvPBZQDR31Eg==
X-Received: by 2002:a05:600c:8115:b0:48a:53ea:1408 with SMTP id
 5b1f17b1804b1-48e51e1804amr178978825e9.8.1778240240814; 
 Fri, 08 May 2026 04:37:20 -0700 (PDT)
X-Received: by 2002:a05:600c:8115:b0:48a:53ea:1408 with SMTP id
 5b1f17b1804b1-48e51e1804amr178978355e9.8.1778240240408; 
 Fri, 08 May 2026 04:37:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4549120ec0asm3681752f8f.17.2026.05.08.04.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 04:37:19 -0700 (PDT)
Message-ID: <1014ae70-5d3b-480a-b094-a8c86ddebef7@redhat.com>
Date: Fri, 8 May 2026 13:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] hw/arm/smmuv3-accel: Implement "auto" value for
 "ril"
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
References: <20260422204335.23116-1-nathanc@nvidia.com>
 <20260422204335.23116-4-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260422204335.23116-4-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F6RIlOI_J_oF0SeXL4vR1jkqrRf05CAV-ebn8ZxMsBs_1778240241
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.44,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 4/22/26 10:43 PM, Nathan Chen wrote:
> Allow accelerated SMMUv3 Range Invalidation support property to be
> derived from host IOMMU capabilities. Derive host values using
> IOMMU_GET_HW_INFO, retrieving RIL capability from IDR3.
>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>

> ---
>  hw/arm/smmuv3-accel.c |  8 +++++++-
>  hw/arm/smmuv3.c       | 10 ++++------
>  2 files changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index b42d189d29..98c2cdcb5e 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -57,6 +57,11 @@ static void smmuv3_accel_auto_finalise(SMMUv3State *s,
>                                 FIELD_EX32(info->idr[0], IDR0, ATS));
>      }
>  
> +    if (s->ril == ON_OFF_AUTO_AUTO) {
> +        s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL,
> +                               FIELD_EX32(info->idr[3], IDR3, RIL));
> +    }
> +
>      accel->auto_finalised = true;
>  }
>  
> @@ -968,7 +973,8 @@ void smmuv3_accel_init(SMMUv3State *s)
>      bs->iommu_ops = &smmuv3_accel_ops;
>      smmuv3_accel_as_init(s);
>  
> -    if (s->ats == ON_OFF_AUTO_AUTO) {
> +    if (s->ats == ON_OFF_AUTO_AUTO ||
> +        s->ril == ON_OFF_AUTO_AUTO) {
>          s->s_accel->auto_mode = true;
>      }
>  
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 5671649fee..b7aa4122eb 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1972,10 +1972,6 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>      }
>  #endif
>  
> -    if (s->ril == ON_OFF_AUTO_AUTO) {
> -        error_setg(errp, "ril auto mode is not supported");
> -        return false;
> -    }
>      if (s->ssidsize == SSID_SIZE_MODE_AUTO) {
>          error_setg(errp, "ssidsize auto mode is not supported");
>          return false;
> @@ -2168,8 +2164,10 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>          "Enable SMMUv3 accelerator support. Allows host SMMUv3 to be "
>          "configured in nested mode for vfio-pci dev assignment");
>      object_class_property_set_description(klass, "ril",
> -        "Disable range invalidation support (for accel=on). ril=auto "
> -        "is not supported.");
> +        "Enable/disable range invalidation support (for accel=on). "
> +        "Valid values are on, off, and auto. Defaults to on. "
> +        "Please enable if host platform supports RIL, and disable if "
suggest: any attempt to turn it 'on' while the host does not support it
would fail

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> +        "host platform does not support RIL.");
>      object_class_property_set_description(klass, "ats",
>          "Enable/disable ATS support (for accel=on). "
>          "Valid values are on, off, and auto. Defaults to off. "


