Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E969CD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 12:10:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRqbz-0003bX-9M; Tue, 26 May 2026 08:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wRqby-0003Yr-9J
 for qemu-arm@nongnu.org; Tue, 26 May 2026 08:10:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wRqbw-000360-EK
 for qemu-arm@nongnu.org; Tue, 26 May 2026 08:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779797414;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=csEOSBTG2KZbG+8hsbMcouVzgTZMLxCUZ30OYvJTSz8=;
 b=cYUSuBtogESEHVjFnycyUNNKLQtGFee3EE277aP70uaAfQ6RTVcPrLE1GqopZipEZw30Jv
 33Y+Q8Azx3WzkmTGSmWn5DWxZ85LtQbe5SREcKCJSUWHazAwi2pAhjYNiIUGuFCpBYOPov
 wh0qQzMeWiR71JY670Q5sN+6vjF+/EI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-QQVg-3dzO66u7vnKnqvtHw-1; Tue, 26 May 2026 08:10:11 -0400
X-MC-Unique: QQVg-3dzO66u7vnKnqvtHw-1
X-Mimecast-MFC-AGG-ID: QQVg-3dzO66u7vnKnqvtHw_1779797410
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48fde68e420so83121605e9.0
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 05:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779797410; x=1780402210;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=csEOSBTG2KZbG+8hsbMcouVzgTZMLxCUZ30OYvJTSz8=;
 b=bDWHsknGLbJHYrJ3n4k7rFHiiu9C4jDOToM9p9KWpGKQwHoK0Mtx8aGK0ZOX/yA4zT
 QR2jXq3G3jcFFmfoCY9A9feEay9spD5h6ZljqsrIJQevvTUFkCuL3fCdTKO/tKp713Gn
 MHGBCds7IM6fxp0HKS2ozYsRKmhfHXEz5F+/pHhrvS3/xELCw78IMApbtXTihDTlApZf
 z2ckwua+W5emRIz0KOKzPWg2YDu5t9pA0UgPN/Nqa+bZ/3AyYIvSwhaEcd7j4Mzk0Ej6
 yD3oDCBvZhC1y6l82AENeKEl9iRNMIz3ag6j8na4k+HlEbMuPGGVsPnwl7fZiDd2an1u
 Y9jQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ85mbd+8OT0Y/2vZGVtVQ7gkPa43mBauAld4JX3RVLtxTp9P6cpRIW2kFAchrW3RzD/lUa5Ln7Daw==@nongnu.org
X-Gm-Message-State: AOJu0YwxkNzGN5cWQX9OaGQ0HnvbJHE5oYsTlqs6xMbbdWroNkLfrDSd
 OaehYsM25T5TizuUPevxlQme3b2+oKB4LVBgVkMV6tqXZQXQzbjjIF4wZVCxQBeY8lkS9v8z6Uv
 z9juhYp+lM0nVNQ07I0ZLEUyQshr4qCRTgEytuFjWi+vliYXRcHGyxA==
X-Gm-Gg: Acq92OGCT6PQJP8jHu+bsRDuSf97ZkYwX6Ol+ekpM4m2zuOhTPnJS1ChCX+XdkuPOzs
 vpYFKe7rQd6ak8jl4RBkEToeoFCq4ktMsLMFGU9DmsBHv3x1CXSaESnl7UPCyRbb9uCYWESvj7C
 h8cBCa1efBJb/T1uq7B9WxqkiFtVSC8WmoRTIUj+JXjg7VtLEttbdmsMHO03fUMhcz4zTUuki7l
 W3kbmL+ix4Lyz829/O5V6vfKf8gn5NayZfY5kBqiwVFR7aVMi0DXGDFKzU84b77U7zBJ/S9PVri
 wjotgdKyBShbRcSrLSwosYFtFZ+tglcRQqE8cb38CZC4RSUW04tHV7FgBo1frK2wOe8wU3IHxwz
 mcP+ueBaG4tMfUTbP7VgS4gDa8k7b19xRv70sVBBHxHAlpVf9QtSkU1Ncvdfo85MY6VBL6Q==
X-Received: by 2002:a05:600c:8b08:b0:490:601f:d785 with SMTP id
 5b1f17b1804b1-490601fd90amr171169075e9.2.1779797410110; 
 Tue, 26 May 2026 05:10:10 -0700 (PDT)
X-Received: by 2002:a05:600c:8b08:b0:490:601f:d785 with SMTP id
 5b1f17b1804b1-490601fd90amr171168195e9.2.1779797409600; 
 Tue, 26 May 2026 05:10:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904526c926sm569761115e9.1.2026.05.26.05.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 05:10:09 -0700 (PDT)
Message-ID: <2fc4efe0-7177-40b6-8c8e-e3a99de140e3@redhat.com>
Date: Tue, 26 May 2026 14:10:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 32/32] hw/arm/smmuv3: Add cmdqv property for SMMUv3
 device
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260519103727.899332-1-skolothumtho@nvidia.com>
 <20260519103727.899332-33-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260519103727.899332-33-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K34c1Mp--tISxB4LXcWHNdWpjIa68dSX2u0R0ZFjM2c_1779797410
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 5/19/26 12:37 PM, Shameer Kolothum wrote:
> Introduce a "cmdqv" property to enable Tegra241 CMDQV support.
> This is only enabled for accelerated SMMUv3 devices.
>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/smmuv3.c | 8 ++++++++
>  qemu-options.hx | 8 ++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 763b86c417..8c13489a5c 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1994,6 +1994,10 @@ static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>                         "bits if accel=on");
>              return false;
>          }
> +        if (s->cmdqv == ON_OFF_AUTO_ON) {
> +            error_setg(errp, "cmdqv can only be enabled if accel=on");
> +            return false;
> +        }
>          return true;
>      }
>  
> @@ -2144,6 +2148,7 @@ static const Property smmuv3_properties[] = {
>      DEFINE_PROP_OAS_MODE("oas", SMMUv3State, oas, OAS_MODE_AUTO),
>      DEFINE_PROP_SSIDSIZE_MODE("ssidsize", SMMUv3State, ssidsize,
>                                SSID_SIZE_MODE_AUTO),
> +    DEFINE_PROP_ON_OFF_AUTO("cmdqv", SMMUv3State, cmdqv, ON_OFF_AUTO_AUTO),
>  };
>  
>  static void smmuv3_instance_init(Object *obj)
> @@ -2188,6 +2193,9 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>          "A value of N allows SSIDs in the range [0 .. 2^N - 1]. "
>          "A value of 0 disables SubstreamID support. A value greater "
>          "than 0 is required to enable PASID support.");
> +    object_class_property_set_description(klass, "cmdqv",
> +        "Enable/disable CMDQV support (for accel=on). "
> +        "Valid values are on, off, and auto. Defaults to auto.");
>  }
>  
>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 46b02a1bb3..c8b8f4e69a 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1329,6 +1329,14 @@ SRST
>          - With accel=on, auto means the value is automatically derived from the host SMMU.
>          - With accel=off, auto is resolved to 0.
>  
> +    ``cmdqv=on|off|auto`` (default: auto)
> +        Enable hardware Command Queue Virtualization (CMDQV) for the
> +        SMMUv3 command queue. Currently only the NVIDIA Tegra241 CMDQV
> +        implementation is supported.
> +
> +        - With accel=on, auto means the value is automatically derived from the host SMMU.
> +        - With accel=off, auto is resolved to 'off'.
> +
>  ``-device amd-iommu[,option=...]``
>      Enables emulation of an AMD-Vi I/O Memory Management Unit (IOMMU).
>      Only available with ``-machine q35``, it supports the following options:


