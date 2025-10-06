Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78617CAC5B8
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Oct 2025 20:24:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5rkH-0006f1-De; Mon, 06 Oct 2025 16:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1v5rkF-0006eX-Op
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 16:23:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1v5rkD-0008FU-MA
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 16:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759782218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MhzD7FAtaAw2QXvjxzYI48PwtcCuGtWVKtdJ1kDnUC8=;
 b=M64dHzVbRS2WiSwZev7OjTpaFTUazNyXG8lninLDlWZUXvvwg2owDJ3km9MLIkE4wL/r5H
 7fD4PyWfT6dK7/VA2BOEDoGhwstlbkNIcyQphYS2bGCg1kp96ITy1ivmlAts+FY0V200td
 72IP0uIV6UIGsT3gP9AjY4LMuceDN6o=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-ngifN7pvOMyp8z__5wgVRw-1; Mon, 06 Oct 2025 16:23:37 -0400
X-MC-Unique: ngifN7pvOMyp8z__5wgVRw-1
X-Mimecast-MFC-AGG-ID: ngifN7pvOMyp8z__5wgVRw_1759782217
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4d6a41b5b66so140164501cf.1
 for <qemu-arm@nongnu.org>; Mon, 06 Oct 2025 13:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759782217; x=1760387017;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MhzD7FAtaAw2QXvjxzYI48PwtcCuGtWVKtdJ1kDnUC8=;
 b=NiK7Mi/bZ/jVmdPH+94GZKYMuOQyZFcCKGA+bHhOHfWkuoEOok7jYuWaX0yt806dVW
 ZBrKpA2FJ2LA3pXgVZcK4Z7ZbCVj6K1x5BZyKk4KzdWHWmOVV7yHh/OxE/QbQNvmwbG1
 EMEoh/qaNSjmxUPFFN2U5f6Kkb9E5Qo+KeIS/cvFnXSPo12hJBYiUqrPnfFwB2EtydiC
 yY68ppaEaeGmjcfsrJP9/Ba6we8iH6xEkNzxenUi4VpF9GZXewiPUSrILw4yhZvCxo4T
 yNq5H5SdYA9RcvxCkEW3CXSXrQ4wlW9Oxk65lCyxJ9Jmiwjvd1mzznOya45Ae2NLW0+5
 0RUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXnBm87ibqLKJb13HT3LRPqnqlBkTEiZ9C9Mk4yFfNA5cRCVbYb9EwrRExiuZoRgGFCf9ofBz2YA==@nongnu.org
X-Gm-Message-State: AOJu0YzNgXRXc+52EaEd2oXDvqiAR5+76EnYCywGpfzOcOUKOtJFD8LX
 9c+ojurVEumMVOk2TThvUm3Vw971RdqGbfHQev9gRdkOEVcJOOrk3NKfnu+CfnHfQ0rQdpyL1kg
 HATFbZBT38C2FwtfPadodygl5AJ8H9jPFH0j/m3VCgB5EdkQB4UqLlg==
X-Gm-Gg: ASbGncuZNnZedaVVoMf0H5sDsPhdJ5MYKcqPEisvwJZL+BsG1mJnzmpyXeZNCKu6Xvh
 FAACKg6tC417DJZikH28jv/O4cEw52vQL2AcmrhSMjKsB2w1E9R35MQy442c1z67JAbTgMEk7V3
 MiQIaPsLNKWnXUqbDJb0milUmxNS+KfnMnUAh8LQw2CEX/vdNDcM9Afb/t0oUAddezLoR9Ay6c8
 JVLPqD+H6ZhpDtBhbb6zFHJYK7Xf9f84HDqSQ8JtRZvmlcfjaH7eZWaAT5M+wgetrckNXo4HV1N
 J1+oga0zK4/cNVs7tBrFBNiPbFWcLBBchmjxIWSkIcqbEg==
X-Received: by 2002:ac8:5793:0:b0:4d0:fbd5:4cd5 with SMTP id
 d75a77b69052e-4e576a45315mr191308361cf.11.1759782216818; 
 Mon, 06 Oct 2025 13:23:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIIGPUUUk2jVsxcHtl01Md60O1s+COY4irBcc9/YrXwgyitFQsVxLHRVhcsXvvoRNf4xTAFA==
X-Received: by 2002:ac8:5793:0:b0:4d0:fbd5:4cd5 with SMTP id
 d75a77b69052e-4e576a45315mr191307951cf.11.1759782216424; 
 Mon, 06 Oct 2025 13:23:36 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e5579d6f35sm128327781cf.0.2025.10.06.13.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 13:23:35 -0700 (PDT)
Message-ID: <0b8ce0de-83a6-437e-a4a6-e862fbb164ee@redhat.com>
Date: Mon, 6 Oct 2025 16:23:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/system/arm/virt: Document user-creatable SMMUv3
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, nicolinc@nvidia.com,
 nathanc@nvidia.com, mochs@nvidia.com, jonathan.cameron@huawei.com
References: <20251006182900.100580-1-skolothumtho@nvidia.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20251006182900.100580-1-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CPt7qwbHg7nHTiwx_QOUwJszBPEc6OiilGAtJYsR8og_1759782217
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 10/6/25 2:29 PM, Shameer Kolothum wrote:
> The virt machine now supports creating multiple SMMUv3 instances, each
> associated with a separate PCIe root complex.
> 
> Update the documentation with an example.
> 
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>   docs/system/arm/virt.rst | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 10cbffc8a7..2e0e8196be 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -37,7 +37,19 @@ The virt board supports:
>   - An RTC
>   - The fw_cfg device that allows a guest to obtain data from QEMU
>   - A PL061 GPIO controller
> -- An optional SMMUv3 IOMMU
> +- An optional machine-wide SMMUv3 IOMMU
I suggest a '(see example below)' at the end of the above line.

> +- User-creatable SMMUv3 devices
> +
> +  Allows instantiating multiple SMMUv3 devices, each associated with
> +  a separate PCIe root complex. This is only allowed if the machine-wide
> +  SMMUv3(``iommu=smmuv3``) is not used.
> +
> +  Example::
> +
> +      -device arm-smmuv3,primary-bus=pcie.0,id=smmuv3.0
> +      ...
> +      -device pxb-pcie,id=pcie.1
> +      -device arm-smmuv3,primary-bus=pcie.1,id=smmuv3.1
I like the detail; and wish it was done for many more of the -<option> above it,
e.g., PCIe, MSI, etc.

>   - hotpluggable DIMMs
>   - hotpluggable NVDIMMs
>   - An MSI controller (GICv2M or ITS). GICv2M is selected by default along
> @@ -176,7 +188,8 @@ iommu
>     ``none``
>       Don't create an IOMMU (the default)
>     ``smmuv3``
> -    Create an SMMUv3
> +    Create a machine-wide SMMUv3. Alternatively, SMMUv3 devices can be
s/Alternatively, SMMUv3/Alternatively, non-machine-wide SMMUv3/
Add:
'Note: user-creatable SMMUv3 devices cannot be instantiated if a machine-wide SMMUv3 is instantiated.'

Or should this section be moved up and after the updated 'optional machine-wide SMMUv3 IOMMU' above?
So all-things SMMUv3 are in the same doc area, and not split up as they are now, and not worsen over time as
more things (accelerated SMMUv3 documentation) is added


> +    instantiated directly using the ``-device`` option (see example above).
>   
>   default-bus-bypass-iommu
>     Set ``on``/``off`` to enable/disable `bypass_iommu

Thanks for the added documentation; more is better!
- Don


