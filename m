Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35766CD3436
	for <qemu-arm@archiver.kernel.org>; Fri,  8 May 2026 11:48:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wLJh9-0003Uh-Ug; Fri, 08 May 2026 07:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wLJh7-0003UM-LH
 for qemu-arm@nongnu.org; Fri, 08 May 2026 07:48:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wLJh5-0002aj-Ri
 for qemu-arm@nongnu.org; Fri, 08 May 2026 07:48:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778240914;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0bRS+uFR1VONGWSKElv7tBWjNM1wL4SWeLMOhKQSkdw=;
 b=RJf3c+4YHQwxoECCdODB78rPfb6m6YmLPkb36B8Y1aL6wxe0uaodiwgrLZuU6UHxTLR/La
 3CEFDfF7hWQqhkp8UFe7xyBNKqF2shULsqUzIH6MucBojxUKNd6GSdqIEVM5crm6fski0E
 blIaKC5ZiCcR6joY/ykejbuZWppXkYA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-BD5vVgKRMpq4shkxXZWxcw-1; Fri, 08 May 2026 07:48:32 -0400
X-MC-Unique: BD5vVgKRMpq4shkxXZWxcw-1
X-Mimecast-MFC-AGG-ID: BD5vVgKRMpq4shkxXZWxcw_1778240911
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-488bd1ee9e7so18171125e9.1
 for <qemu-arm@nongnu.org>; Fri, 08 May 2026 04:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778240911; x=1778845711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0bRS+uFR1VONGWSKElv7tBWjNM1wL4SWeLMOhKQSkdw=;
 b=BBYO4Q2M9X8e5XnPdG4d9zdhZoVnmJKRWY+w+Nd1NgimSXyZ4rhdcPMS8eqbZrimfS
 fw0fvPuPWoYGKfnVFcwhT2siDdUVRJMgm446hZr05GF6jyTrhWx4Su84aOLgtg7qke1J
 grzEiBzhEu01Y97p6CtOrdtIpv5BhYhfPP5ryD+awKTjRHMHfjymloE3hafjrw41R+yj
 UFaDEDmEQwAEQlI/ut+nhS5xP4zINDQtnibHcbN5/9KAEIOd/xnbF0dMGm8rKsWi8WBS
 1sLFyvhzNyA5NBWZ932jVY1de6s7T7ENd+ReQW++7r5ifWr1NKM70yDDvxm7oOldBKVZ
 F+rw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9uBw5LAnCXI04Plr1cs50C4GgXwZKRwx61f+GvyvE8KG/umWhQ90wc9Rdfpw2NsB94N1lgmf3CXg==@nongnu.org
X-Gm-Message-State: AOJu0YxIrBRI0GfHf+tzrlUvlmWRCzeGG800BH50q1227Jd+JUZfpi7j
 bFf06YAE5Nk8m6ng38/z5gUlTdZ1X+RwFkK/nNlknRxZfMSd/ULO5yREjDGAGFmHZTRHCyGErsk
 DghwV/qi8zmQh9nT+hfgwavzi+zGlRv8TtSsxrJ09xzThpb9FX7b/wg==
X-Gm-Gg: AeBDieuHOKSW4fCuAuD+jcBE/UrrggYaUQCpMcakNKSfuxNocdc3NK0RBH6ReDqJ3Zp
 aRi4jvlgRS+1jj08EZhJ3rVsx/jswvUkiOPkpACga3XC5sDKVgUD2rT9Ng3+oAMyTpa62I+qRlg
 +Q+r250vZhooWS+H44gOhPRLDxbWvIF78R2TcZiu8DrtVz1ORukWEEICViT0AVxZs437WVwurwu
 eoyqqm3ZZPOAMoJim9tfy8bGaYkmCEf8GCzk0UGA/5Mlexk2YuG/B7sKuhyvp/T8gwYNFlsa8zA
 GiZal5+aWD4+osSj/183Sc3IHICpo+8ORRs7todFm+xlwfPLLsDKEJxKDL9ub++9BnL+EqBSBoE
 zIwD9wdKhQaXjOGYUhG3ZF25fvEPrs/EnmzeuSG9B+ultlEcoYh3H4kYyM3dP1k5B7USohN0oBF
 dFu4S9
X-Received: by 2002:a05:600c:3b17:b0:489:5022:39a4 with SMTP id
 5b1f17b1804b1-48e51e20705mr174896685e9.9.1778240911327; 
 Fri, 08 May 2026 04:48:31 -0700 (PDT)
X-Received: by 2002:a05:600c:3b17:b0:489:5022:39a4 with SMTP id
 5b1f17b1804b1-48e51e20705mr174896195e9.9.1778240910821; 
 Fri, 08 May 2026 04:48:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e68ef0024sm35836995e9.14.2026.05.08.04.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 04:48:30 -0700 (PDT)
Message-ID: <36d3785c-6968-478d-9b2d-133a247cc0a4@redhat.com>
Date: Fri, 8 May 2026 13:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] hw/arm/smmuv3-accel: Implement "auto" value for
 "oas"
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
References: <20260422204335.23116-1-nathanc@nvidia.com>
 <20260422204335.23116-6-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260422204335.23116-6-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cTIosM8xSeO3arFe0G5IsX0qS9hcjXc6UUbBHOPpk2k_1778240911
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



On 4/22/26 10:43 PM, Nathan Chen wrote:
> Allow accelerated SMMUv3 OAS property to be derived from host IOMMU
> capabilities. Derive host values using IOMMU_GET_HW_INFO, retrieving
> OAS from IDR5.
>
> This keeps the OAS value advertised by the virtual SMMU compatible with
> the capabilities of the host SMMUv3, so that the intermediate physical
> addresses (IPA) consumed by host SMMU for stage-2 translation do not
> exceed the host's max supported IPA size.
>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c |  8 +++++++-
>  hw/arm/smmuv3.c       | 15 ++++++++-------
>  2 files changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index d13d15a11d..f45e268bde 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -68,6 +68,11 @@ static void smmuv3_accel_auto_finalise(SMMUv3State *s,
>                                 FIELD_EX32(info->idr[1], IDR1, SSIDSIZE));
>      }
>  
> +    if (s->oas == OAS_MODE_AUTO) {
> +        s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS,
> +                               FIELD_EX32(info->idr[5], IDR5, OAS));
> +    }
> +
>      accel->auto_finalised = true;
>  }
>  
> @@ -988,7 +993,8 @@ void smmuv3_accel_init(SMMUv3State *s)
>  
>      if (s->ats == ON_OFF_AUTO_AUTO ||
>          s->ril == ON_OFF_AUTO_AUTO ||
> -        s->ssidsize == SSID_SIZE_MODE_AUTO) {
> +        s->ssidsize == SSID_SIZE_MODE_AUTO ||
> +        s->oas == OAS_MODE_AUTO) {
>          s->s_accel->auto_mode = true;
>      }
>  
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 07025245e2..39a6f72938 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1975,9 +1975,11 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>      }
>  #endif
>  
> -    if (s->oas != OAS_MODE_44 && s->oas != OAS_MODE_48) {
> -        error_setg(errp, "QEMU SMMUv3 model only implements 44 and 48 bit"
> -                   "OAS; other OasMode values are not supported");
> +    if (s->oas != OAS_MODE_44 && s->oas != OAS_MODE_48 &&
> +        s->oas != OAS_MODE_AUTO) {
> +        error_setg(errp, "QEMU SMMUv3 model only implements auto, "
> +                   "44 bit, or 48 bit OAS. Other OasMode values are "
> +                   "not supported.");
>          return false;
>      }
>  
> @@ -1991,7 +1993,7 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>              return false;
>          }
>          if (s->oas > OAS_MODE_44) {
> -            error_setg(errp, "OAS must be 44 bits when accel=off");
> +            error_setg(errp, "oas must be 44 bits when accel=off");
>              return false;
>          }
>          if (s->ssidsize > SSID_SIZE_MODE_0) {
> @@ -2173,9 +2175,8 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>          "Valid values are on, off, and auto. Defaults to off. "
>          "Please ensure host platform supports ATS before enabling.");
>      object_class_property_set_description(klass, "oas",
> -        "Specify Output Address Size (for accel=on). Supported values "
> -        "are 44 or 48 bits. Defaults to 44 bits. oas=auto is not "
> -        "supported.");
> +        "Set Output Address Size in bits (for accel=on). "
> +        "Valid values are 44, 48, and auto. Defaults to 44 bits.");


same auto mode is not explained. It must be explainer either here of in
qemu-options.hx

when set to 'auto' the oas value is derived from host smmu value.

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Eric


>      object_class_property_set_description(klass, "ssidsize",
>          "Set number of bits used to represent SubstreamIDs (SSIDs). "
>          "Valid values are 0-20 and auto. Defaults to 0. "


