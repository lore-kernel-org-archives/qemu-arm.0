Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FA1E9904A
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 07:43:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wB6WA-0001K6-5c; Fri, 10 Apr 2026 03:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wB6W7-0001IM-V5
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 03:43:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wB6W6-0000qw-8l
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 03:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1775806981;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CRfM/2uzYK3VTBfMBLk8dXqfUTctabwqWxHpKci4tIM=;
 b=KdS5NY0q+RZfJWDxZaiUGyXZeG6YvvgqCD5Av7sAFlipunupfS1mldl08fdj3dZJ/o2iey
 4QoG+gNZY64tNVWChdBY5VBXM6uO8rG+OT0ApOyUclIMhp8vnJMXvs8d8Hz3NVB5FzlR+w
 5m95AltzBKGMPH1RM8BUGdqvawz2GIw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-mAgdZb3eN-KpMo2bv8Fqug-1; Fri, 10 Apr 2026 03:42:59 -0400
X-MC-Unique: mAgdZb3eN-KpMo2bv8Fqug-1
X-Mimecast-MFC-AGG-ID: mAgdZb3eN-KpMo2bv8Fqug_1775806979
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-488d8deb75fso2202435e9.3
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 00:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775806979; x=1776411779;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CRfM/2uzYK3VTBfMBLk8dXqfUTctabwqWxHpKci4tIM=;
 b=Ebqm1Bsql6y3frAhWJp+3TFwinEB1i7HG0kByIGtX1NoaM3luIidmd2JwhQZy56L9w
 pxGttWoaa2bqwrdH3nFRS40piHPvq/JocAssYLrJfuYoFd8axoU4ClrPzHZeSE1biAK8
 cLwMNbdwEYR1wfhW2DaTsSuWN2BRpBB2+zJcG0VqAFM/Ipf+QyieY9bvIIfuaowcgIVK
 /uJ431+lBHFQPZ0XH3XF227fBQ0Xhc79szNBQ7D2SYBXMlW3DCN9O/K2YgpbUPsZPyZc
 1GhZOiY4hBvi+gII1bqAo/+2r/EGt2FCaBkws0revX20rIsJyhf2vy7YgeBDZThL7VjP
 DHlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQRgBLDWKqnifPQZOud1LsK2ip4flVj4AF91HsZakkOkAjXg2GwAD210/m6DIFKZ64OUEnV13tcA==@nongnu.org
X-Gm-Message-State: AOJu0Yyz6qw2h5oaTJCgTnMfwRd30dBwmB9OcBUjbFvtm8EqfSD1YXyB
 pYd5ZyQU0AN1v/rDvOazGnhVg6HDC2fwm5EzoHcaH450ZvVanTPQcqTNN9jFk4ChNfILUBKrvmz
 ocN634ByTSgQcS0rZ0lel+zlSBzDurmw5njG+BbhS73uBewyERSgFsg==
X-Gm-Gg: AeBDievAOcxIX+sUM1gQ7kXwq3Wc6pHYbpT6ZTCz+X3tIVAUNXx1+GyOO68enOvCDI5
 SWuMpPe1UpZOsgMehBlQRYO8umzt9UnKQBF2gM+RLfhNNHHENf0CgMaFDrt1oyKQI0VihMbfHPt
 48AArsUkjOBAosn+epE5waB2qgV7ZlPddIzsJ/KZnyVr14vCbHVGpx72qe6265SNeAVlrxx7n/C
 E0rfWg82VdBiuA7mZyyVesI2seMISBy+FF83zHSnI8bk6H6uRMibYpY8OmSIdbAhVTgjyrJEQ8Z
 drBUmwlIRzgLhgyCxng5L1dYoHJI8F9fcROvII346NLFZdMW4CXX1Gj0c9wcX5kml4tMKjsBhIy
 Oz7lC/GCyPKiXpYDvu4aTHfX8cX+/Q+L6CGXy6uAdlWCSxBtiB7ZBL8mpQ7ZyvXEJNHeB7Q==
X-Received: by 2002:a05:600c:5292:b0:486:fe39:28b7 with SMTP id
 5b1f17b1804b1-488d67fa48emr25267005e9.9.1775806978599; 
 Fri, 10 Apr 2026 00:42:58 -0700 (PDT)
X-Received: by 2002:a05:600c:5292:b0:486:fe39:28b7 with SMTP id
 5b1f17b1804b1-488d67fa48emr25266695e9.9.1775806978115; 
 Fri, 10 Apr 2026 00:42:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3d4dbsm50551495e9.14.2026.04.10.00.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 00:42:57 -0700 (PDT)
Message-ID: <1bdba168-e5fb-491e-a9ee-6311bc95b38d@redhat.com>
Date: Fri, 10 Apr 2026 09:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] hw/arm/smmuv3: Change the default ats support to
 match the host
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
 <20260401010231.4166776-4-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260401010231.4166776-4-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1kpE6uzEtS3u53jgwTfBnq-_wzjCx0Hv6swgXTvhLa0_1775806979
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
> Set the default value of ATS to auto. The default for ATS support used
> to be set to off, but we change it to match what the host IOMMU
> properties report. Introduce a new compat for the changed default.
>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
> ---
>  hw/arm/smmuv3.c   | 2 +-
>  hw/core/machine.c | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index f3603554e3..f353865187 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2158,7 +2158,7 @@ static const Property smmuv3_properties[] = {
>      DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
>      /* RIL can be turned off for accel cases */
>      DEFINE_PROP_ON_OFF_AUTO("ril", SMMUv3State, ril, ON_OFF_AUTO_ON),
> -    DEFINE_PROP_ON_OFF_AUTO("ats", SMMUv3State, ats, ON_OFF_AUTO_OFF),
> +    DEFINE_PROP_ON_OFF_AUTO("ats", SMMUv3State, ats, ON_OFF_AUTO_AUTO),
see my previous comment about squashing all those patches. Besides you
need to update qemu-options.hx where the default value is documented as
non auto.

Eric
>      DEFINE_PROP_OAS_MODE("oas", SMMUv3State, oas, OAS_MODE_44),
>      DEFINE_PROP_SSIDSIZE_MODE("ssidsize", SMMUv3State, ssidsize,
>                                SSID_SIZE_MODE_0),
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 0aa77a57e9..6796ab63cc 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,6 +37,11 @@
>  #include "hw/virtio/virtio-iommu.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "qemu/audio.h"
> +#include "hw/arm/smmuv3.h"
> +
> +GlobalProperty hw_compat_11_0[] = {
> +    { TYPE_ARM_SMMUV3, "ats", "off" },
> +};
>  
>  GlobalProperty hw_compat_10_2[] = {
>      { "scsi-block", "migrate-pr", "off" },


