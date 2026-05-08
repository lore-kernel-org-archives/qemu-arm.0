Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909F3CD3447
	for <qemu-arm@archiver.kernel.org>; Fri,  8 May 2026 11:35:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wLJTp-0007ay-S4; Fri, 08 May 2026 07:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wLJTm-0007Zf-JN
 for qemu-arm@nongnu.org; Fri, 08 May 2026 07:34:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wLJTj-0007Hp-TF
 for qemu-arm@nongnu.org; Fri, 08 May 2026 07:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778240086;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20eMuVkvaLbxUFYeCwvrl5EbWjupAJeu6G5JhJoCS1w=;
 b=QSsdZdT9jbJS0O2/RS7hloWymagkn5nQf6bpiupLbVqIetAaso1w95Tu/EfQagxTbRwxfP
 i4GoZg+026aKN7dp22tixrOSv6KE1nefPqbgeIiuCzrMnXD1u5KPjPO1aQ/FOBDEQ/Et0S
 /Zlu3MblS1wRYG0MZVmIpKCdL1+SgV0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-_Isvr4XJNm-LYlOfrqAIkA-1; Fri, 08 May 2026 07:34:45 -0400
X-MC-Unique: _Isvr4XJNm-LYlOfrqAIkA-1
X-Mimecast-MFC-AGG-ID: _Isvr4XJNm-LYlOfrqAIkA_1778240084
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-44cc3c9b2feso1680896f8f.1
 for <qemu-arm@nongnu.org>; Fri, 08 May 2026 04:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778240084; x=1778844884;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=20eMuVkvaLbxUFYeCwvrl5EbWjupAJeu6G5JhJoCS1w=;
 b=OkBA0+qUK9lVv7P5+DGOS2hYuRBKGe0xOF+mtc7nWvdNsQLqK4MTzl0arzBb3ejArl
 oMKJYlYKivQsiWFrFH+yveaRKxzMUZYhiOp9Mjkz/YqGEKY2Qdh9GgvH+PjPhI+IuAYQ
 oNsc4w1kHaBAHTvz0m4dr0TcpfHMrpqVb5BRCOlM8BfYYq/NJ/r6Aj3UNp5oYurVPpwG
 hEe1i92ui3Oky7MPk7vVtZFsFf3F7V/E1G7qIiJRyU3AAf47bNY3SMY6Z4d0TM5ozvvF
 jyBZu2t1yKcoiDe1N0qf8US8njeq0xtxdQX+MhRhyUC4K/+ZuaHERu5tcuLtSCdn6oMa
 /hDQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/h4BSChPUCtFzbVs4G+7JUpSnJ90746poNBwUJe1AxggqIPTTziBdqorNpZwxLl4sIP2aMw+kojw==@nongnu.org
X-Gm-Message-State: AOJu0YzMG/1zOBajkXLXxfeMy/TLcSRp9/4boNGIY5TJ0OysVmR2SPRP
 qq/PsisIshlY3XVsf3UrM2KJJHif2DI7DSr/OGjCutsONMZ6dAkirdUS1ghL547w/8LfO+OcvPp
 5xjgXQlVQ3xymQrN8jpnm+V7DxvmV4a+BcX1rysdm+qPb6WVa4Hz8Vg==
X-Gm-Gg: Acq92OHCozv2EeMnwyxvs2ykUcJDr0nlzkhTpFC0bFo9+FeJgXSH33Ut5KplsPBo6Is
 UdMRnhidN9knPzJ+zkHR89OS1H/+kXpDIz9T2d4HfSr5rgSD3mjdH2T7e6DVriVU6OonkzvMHzQ
 88sFvcY6rwvshtArCUHLKcItgLt2GObdX7VLOKOSBRR/SIcnxAj45l9IfB6nkNj7X1p3h8EIsWj
 vn8jVx1FEy+O/V5wwbbfkWyxOHFEF09c+Qv5FQYgmcQZNL1AViRNgFC5NgrzX7GsglZmhPugXU7
 ZGAXoYULF8ffTmPwo/TgdxJ0fNRdAgv1Y9I538OB1G4gtCBXk/EAm+xR6au1ZEepui9asrrWUTn
 Io6Kamd5t5QfDVJvZXwVRn9d26agTjfhguJ7CCLGbTlltTC7x6ivCNvLIScYrWuN7U1TugQ==
X-Received: by 2002:a05:6000:144b:b0:446:db72:e8ec with SMTP id
 ffacd0b85a97d-4515ce1c55fmr18977228f8f.23.1778240083997; 
 Fri, 08 May 2026 04:34:43 -0700 (PDT)
X-Received: by 2002:a05:6000:144b:b0:446:db72:e8ec with SMTP id
 ffacd0b85a97d-4515ce1c55fmr18977170f8f.23.1778240083548; 
 Fri, 08 May 2026 04:34:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491bae13csm3786923f8f.29.2026.05.08.04.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 04:34:42 -0700 (PDT)
Message-ID: <816c53b4-7447-4831-935e-9335ad0c8833@redhat.com>
Date: Fri, 8 May 2026 13:34:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] hw/arm/smmuv3-accel: Implement "auto" value for
 "ats"
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
References: <20260422204335.23116-1-nathanc@nvidia.com>
 <20260422204335.23116-3-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260422204335.23116-3-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OhlTC_2oWZamRuZ-_MbhzYwWlj3kVRy7QS1-tkwj_NY_1778240084
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

Hi Nathan,

On 4/22/26 10:43 PM, Nathan Chen wrote:
> Allow accelerated SMMUv3 Address Translation Services support property
> to be derived from host IOMMU capabilities. Derive host values using
> IOMMU_GET_HW_INFO, retrieving ATS capability from IDR0.
>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c |  9 +++++++++
>  hw/arm/smmuv3.c       | 10 +++-------
>  2 files changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 8b3bbf3ef6..b42d189d29 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -52,6 +52,11 @@ static void smmuv3_accel_auto_finalise(SMMUv3State *s,
>          return;
>      }
>  
> +    if (s->ats == ON_OFF_AUTO_AUTO) {
> +        s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ATS,
> +                               FIELD_EX32(info->idr[0], IDR0, ATS));
> +    }
> +
>      accel->auto_finalised = true;
>  }
>  
> @@ -963,6 +968,10 @@ void smmuv3_accel_init(SMMUv3State *s)
>      bs->iommu_ops = &smmuv3_accel_ops;
>      smmuv3_accel_as_init(s);
>  
> +    if (s->ats == ON_OFF_AUTO_AUTO) {
> +        s->s_accel->auto_mode = true;
> +    }
> +
>      if (s->s_accel->auto_mode) {
>          s->machine_done.notify = smmuv3_machine_done;
>          qemu_add_machine_init_done_notifier(&s->machine_done);
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 7fead1c3cf..5671649fee 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1972,10 +1972,6 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
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
> @@ -2175,9 +2171,9 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>          "Disable range invalidation support (for accel=on). ril=auto "
>          "is not supported.");
>      object_class_property_set_description(klass, "ats",
> -        "Enable/disable ATS support (for accel=on). Please ensure host "
> -        "platform has ATS support before enabling this. ats=auto is not "
> -        "supported.");
> +        "Enable/disable ATS support (for accel=on). "
> +        "Valid values are on, off, and auto. Defaults to off. "
> +        "Please ensure host platform supports ATS before enabling.");
I would rather be more explicit.

s/before enabling/before setting it to 'on'.
>      object_class_property_set_description(klass, "oas",
>          "Specify Output Address Size (for accel=on). Supported values "
>          "are 44 or 48 bits. Defaults to 44 bits. oas=auto is not "
Otherwise
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


