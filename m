Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB5FCD5BD1
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 08:42:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSWJ0-000570-F6; Thu, 28 May 2026 04:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSWIy-00056M-Rt
 for qemu-arm@nongnu.org; Thu, 28 May 2026 04:41:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSWIw-0006R8-OL
 for qemu-arm@nongnu.org; Thu, 28 May 2026 04:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779957685;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G/23fwhqV8WXgPI1wN0ormXP3YWePW2QiVTBvod5lQY=;
 b=Xd0ZCpBWFa+nCsgfjloRvpaguyx4cySY6rPiHHW/nYVqPclRsLI0ShKisUojyoPPEW/rPO
 DTq37B3Jgj0gEFk7jmp7L+macBNmv1uAhN1JHzVGJ6es/QOI6P1SQtcEo2pDDaKr8RAgQl
 Psnen1XdNrPHI7ISuMmuAWNlSngzh8A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-H-_C142KN2m6vq-hsy26kQ-1; Thu, 28 May 2026 04:41:23 -0400
X-MC-Unique: H-_C142KN2m6vq-hsy26kQ-1
X-Mimecast-MFC-AGG-ID: H-_C142KN2m6vq-hsy26kQ_1779957682
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4904ee02e72so46357325e9.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 01:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779957682; x=1780562482;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G/23fwhqV8WXgPI1wN0ormXP3YWePW2QiVTBvod5lQY=;
 b=ou6vgxXv+SesWSyHrx0ljJhLhhuypDOcnSFikQTSlE+ywQekNDFWkm9cEM8kpA7++u
 7rwTYUiK74I6RQ8d1nYLpyd8UIGstSHupX/hOmLuEZKFcdem8XLjD5LtV21t8yHWHXe7
 +vUuPwtlTT8B4t1k5ThhXQ1PNHZuHKo238Q6Dk5uKaxI2M7rd1Eli3WTvvWEy3lqdIz0
 8i4getrSrsward3NIxFzwwFxOH2PB1WOo04r1SAnC4uCmNYwubxa85sxHSzsVZe1aS4p
 nlYY+30l+5wyFUIr19+pnH6jYYtk7EQhDW9AupkBN325aUybF0i/oM/ISdk4kyhqdBSs
 SXEg==
X-Forwarded-Encrypted: i=1;
 AFNElJ//mhUcURNf+XeAy5Ev/uTZ9j9+dXX8Gb9O2Ntmy2AWwKBmBthIH/7NcCU5cwFh3FsVQ1CvFZ+q1w==@nongnu.org
X-Gm-Message-State: AOJu0YxW1gADBKgTRrqKXKfdINbw27tgQZSZS4CJZj0L/ohjHeSZYXra
 wztsu9/hGpsK27YEYFkU04hpfZvDBsbrAtX2DRkdEg+Y4puG/A4lgMDOVqKh7rNEExVg8vxfjGQ
 6p5WX+veZ+kdfNMTKNW89gQQ6aypJ7HCbA/azLEzhL61VdkGo/ky89Q==
X-Gm-Gg: Acq92OEI1tQ3vtll/P3yER6mMPt+ZLv5iNLrO3aKZji/MXQF+xuykHm7OPwp20rc+gw
 96O6ah7fh2r8pXQY9/dan+Y5eGSHVOT99BTkh4yksMXHPdO9Ttidd9x0+a4ig9LkmIhV+XIYgqF
 G/a0kBxQouXZAwZ7epgKgzgEzHjvxCyk+THPCkRMK2J5lBFtKEpl5tn4dMGuUL89vJDBb+yL6uF
 t7NZ2K3QOJa04qrHD5sXJsrMiFFbEBZhqlc5GZ0p8UIWUPZY7rO7TFgKx3hAVBo+XRFMReqG4zZ
 JcyBelE8MLZ48PNaYBJ82jmJwY3svSu6klIS2JniLWpJwyBKUoEnJorr2mGFzPsY9crgJcnt76K
 Gh0Tzo1FIVJtiVQPD8Kvmc1cE/VB28kPlGAfE7qU6bc45HaPYNDWnX9dGCGcjUIMgLTzcCYHkXK
 SALqX1
X-Received: by 2002:a05:600c:4ecc:b0:48e:5fb8:f80f with SMTP id
 5b1f17b1804b1-490426d1ea7mr420821855e9.24.1779957682339; 
 Thu, 28 May 2026 01:41:22 -0700 (PDT)
X-Received: by 2002:a05:600c:4ecc:b0:48e:5fb8:f80f with SMTP id
 5b1f17b1804b1-490426d1ea7mr420821415e9.24.1779957681908; 
 Thu, 28 May 2026 01:41:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4908dcf850fsm15796915e9.4.2026.05.28.01.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 01:41:21 -0700 (PDT)
Message-ID: <5a0afcaa-3fa2-498c-86a9-32480619e973@redhat.com>
Date: Thu, 28 May 2026 10:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] hw/arm/smmuv3: Improve accel SMMUv3 usage
 documentation
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
References: <20260527221631.612026-1-nathanc@nvidia.com>
 <20260527221631.612026-3-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260527221631.612026-3-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pSpWrxxX6bVEFcKLIlPaYfoovgAbmdHZf8-bWXwg-Wg_1779957682
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
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



On 5/28/26 12:16 AM, Nathan Chen wrote:
> From: Nathan Chen <nathanc@nvidia.com>
>
> Add a statement to clarify that the host SMMUv3 must support HW-accelerated
> vfio-pci device assignment when setting accel=on.
>
> Suggested-by: Eric Auger <eric.auger@redhat.com>
Hum did I suggest that ;-)
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
> ---
>  hw/arm/smmuv3.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 0c65dc8c91..a8c49a48ac 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2165,7 +2165,9 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>  
>      object_class_property_set_description(klass, "accel",
>          "Enable SMMUv3 accelerator support. Allows host SMMUv3 to be "
> -        "configured in nested mode for vfio-pci dev assignment");
> +        "configured in nested mode for vfio-pci dev assignment. Please "
> +        "ensure the host SMMUv3 supports hardware-accelerated VFIO-PCI "
> +        "device assignment before enabling.");
this is a rather abstract statement. What is the actual host
requirement, dual translation stage support?

Thanks

Eric
>      object_class_property_set_description(klass, "ril",
>          "Disable range invalidation support (for accel=on). ril=auto "
>          "is not supported.");


