Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882AAE99050
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 07:47:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wB6aK-0003i9-P8; Fri, 10 Apr 2026 03:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wB6aI-0003hL-PR
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 03:47:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wB6aG-00058t-VO
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 03:47:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1775807239;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z8274K4VyAmlrTxnjmlmyE50LY7y6DpkBzjVVD+jwXc=;
 b=JlMBA9D2L19ktrsK/f3+i/VFrub9MwrRe3ZbjZBlwFDh6sxfMOGKSrW7DOT6mAXE1o4SnB
 04u3KM7JWEMOlJ7iqrsFSkZlXGP5wxNkFq/Z0hRueU7Zcj31T6qUuSK29aicpa9DWjVhij
 24UsRBDwyhjmXQQ7K+HhPr3m57wtACc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-4sXRW9SzMHCZrZ0o6C8AlA-1; Fri, 10 Apr 2026 03:47:18 -0400
X-MC-Unique: 4sXRW9SzMHCZrZ0o6C8AlA-1
X-Mimecast-MFC-AGG-ID: 4sXRW9SzMHCZrZ0o6C8AlA_1775807237
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-488d2cd2674so8985565e9.0
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 00:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775807237; x=1776412037;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z8274K4VyAmlrTxnjmlmyE50LY7y6DpkBzjVVD+jwXc=;
 b=WARe81H285a9tGlauvaszpNqp7RR8bwlg8OhWqxZGtbfE//TwD7gdhdsP9aL6BqAs/
 s/FX5aaUExhYmU7vNS6Oe6r4i4kg2w5fEklfxOSCmgaQFosOBN27N4MUGAKvo7v1U4kc
 PJYlGz8wAA2fIdgSQJRxAMzhYzxMobwLMs7cgnQayJ/fG0is22Famr1lHZwbXg2FQUu4
 2mTVVqq1ZtVphOTM5norsLx+f71tmKb/4p4haN3x5EoBPffPRqr1F0A6ck6JAujCZ23b
 Zg3bBhnLglAMG2VmGd9EVDxqI3BN9U/tyxLhyHY9FLlWsFB5EvBnkRkWmzYWxYyBG2ud
 mouw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuzcI7Y8vK+9EH5vl8MsSGGyk1OtoC0pblTIDniWNFW10/IGsyMeTgQVwPBmn6nDl/YTmdOm2Jdw==@nongnu.org
X-Gm-Message-State: AOJu0YxstMYphNmx1/WcqUrSt/EwkjQOACFlafSLb3kqpGKkBOxnJUdY
 Fe0nlbroBq0V/JFyLLjhWIIL6WgfLIZujtUrZM+vaZz7OHoYT8ITgQKFd4umkGt3+QOgszuCAdg
 zfCCxxza7nvWh//YEDH84CuMVU1ReVaaUVJo4FIlwMXvjQaWuZdr2Ag==
X-Gm-Gg: AeBDies8d4Fm8oepErNQ3/q7zc8tznkAI1NK8pLSNgRIU9wjfUsxBTwYC+CM3FaA2d4
 L61TZTn44jUCfSX88TfKEtVATu05dIdBadiH8bFap7vm6yfuTR50MOttrlO+IGBmQPm3BcwflyB
 Ua2z69xKjEkBkPYepHXUzauEa6zRqXiSMFmkZuSsEbiEjJ6HRYXqhWCFbd9RhvC/IGzK8ZaFeW9
 51Hn/D+spXmoMVv8fI3Anmknn7wVzl6MJkKFbrzXslCyMppOHMq+FhN70RFP9z5yIIdLREoGfys
 SuWuYZAirfph1OrAJNBnxkWEhHCSxGCePbluxjmDCkt0zMt4gw/Muvs63yUjb3K/I8dt8G7FO2l
 7dsWOX8RE4iebwIMTaAYp6vRhFAUl6roxPp563Oo1cXeVevWpBKPQMf4QIRkzFUR2xU8gMQ==
X-Received: by 2002:a05:600c:6990:b0:488:a2ac:a34c with SMTP id
 5b1f17b1804b1-488d67f5bf5mr22602035e9.12.1775807236759; 
 Fri, 10 Apr 2026 00:47:16 -0700 (PDT)
X-Received: by 2002:a05:600c:6990:b0:488:a2ac:a34c with SMTP id
 5b1f17b1804b1-488d67f5bf5mr22601605e9.12.1775807236294; 
 Fri, 10 Apr 2026 00:47:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d681ecd5sm13917815e9.19.2026.04.10.00.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 00:47:15 -0700 (PDT)
Message-ID: <d4bd87ee-caaf-497e-9e4a-90051868d9a9@redhat.com>
Date: Fri, 10 Apr 2026 09:47:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] hw/arm/smmuv3-accel: Implement "auto" value for
 "ril"
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
 <20260401010231.4166776-6-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260401010231.4166776-6-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mkh4ljIaibZF3IsXwzdblJqMMjf7kAn6Vo728OXMWng_1775807237
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 4/1/26 3:02 AM, Nathan Chen wrote:
> From: Nathan Chen <nathanc@nvidia.com>
>
> Allow accelerated SMMUv3 Range Invalidation support property to be
> derived from host IOMMU capabilities. Derive host values using
> IOMMU_GET_HW_INFO, retrieving RIL capability from IDR3.
>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 9 ++++++++-
>  hw/arm/smmuv3.c       | 7 +------
>  2 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index a835c8f220..9e7ec6a930 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -50,6 +50,12 @@ static void smmuv3_accel_auto_finalise(SMMUv3State *s,
>                                 FIELD_EX32(info->idr[0], IDR0, ATS));
>      }
>  
> +    /* Update RIL if auto from info */
not sure that kind of comment is really useful.
> +    if (s->ril == ON_OFF_AUTO_AUTO) {
> +        s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL,
> +                               FIELD_EX32(info->idr[3], IDR3, RIL));
> +    }
> +
>      accel->auto_finalised = true;
>  }
>  
> @@ -945,7 +951,8 @@ void smmuv3_accel_init(SMMUv3State *s)
>      bs->iommu_ops = &smmuv3_accel_ops;
>      smmuv3_accel_as_init(s);
>  
> -    if (s->ats == ON_OFF_AUTO_AUTO) {
> +    if (s->ats == ON_OFF_AUTO_AUTO ||
> +        s->ril == ON_OFF_AUTO_AUTO) {
>          s->s_accel->auto_mode = true;
>      }
>  }
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index f353865187..a2d2f0e3bc 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1973,10 +1973,6 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
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
> @@ -2188,8 +2184,7 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>          "Enable SMMUv3 accelerator support. Allows host SMMUv3 to be "
>          "configured in nested mode for vfio-pci dev assignment");
>      object_class_property_set_description(klass, "ril",
> -        "Disable range invalidation support (for accel=on). ril=auto "
> -        "is not supported.");
> +        "Disable range invalidation support (for accel=on).");
same comment as before. Suggesting "Set RIL value. Valid values ..."
+ qemu-options.hx updates.

Eric
>      object_class_property_set_description(klass, "ats",
>          "Enable/disable ATS support (for accel=on). Please ensure host "
>          "platform has ATS support before enabling this.");


