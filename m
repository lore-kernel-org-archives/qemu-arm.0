Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F74CCF9EA
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 14:13:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDNyQ-0002mz-UQ; Mon, 27 Oct 2025 10:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDNyO-0002mg-5F
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 10:13:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDNyC-0003NS-O1
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 10:13:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761574387;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JY2I+CuSnEJGmFKCR1qlFkMIZYu3OX8adq9vemAvaic=;
 b=PZvUdav3UBL2W9uh4KRkgN6MBsBNOQ4inkwGQmsu6C8i2mtTC/neeri0gVVUIQBVH/skND
 mx3uIcPS4hEUSUk84Ew+nmqRmZoSuhmOgWxgB+gF31CES0mrqV9Rz5DBLXKUJA4yzmGUUK
 LhAt3doPwZiw6PHphHkLO3dCMGZt9rk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-WPmOIZmoMKSfPPlzeJ6irw-1; Mon, 27 Oct 2025 10:13:05 -0400
X-MC-Unique: WPmOIZmoMKSfPPlzeJ6irw-1
X-Mimecast-MFC-AGG-ID: WPmOIZmoMKSfPPlzeJ6irw_1761574384
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4770e0910e4so10488705e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 07:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761574384; x=1762179184;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JY2I+CuSnEJGmFKCR1qlFkMIZYu3OX8adq9vemAvaic=;
 b=MuebkMMiPcbFg1YOCBbRvKOVKAhUWofwRHz0LiaOtQ7Z3YqEdYmK6xr1NmrrCRL8Os
 gOkq39FlMIUQ4o44CMicgWiKkv/SHUicv1uPyfbGN3QlGgeDwI3CGCEWKdFVuKgEXJ8D
 oFfZnBNBpgKDzCu7Z6fhmLs18+Y6tluUn4Mdakq9ZMsDqYNEeuiuOdyoQ4J7vio5h2Bq
 b3GbetfYXLW4MRb317gqhQk/zg8uO8uRG6GbUj8iRCEu0U+v+7v26c31sS6idMU1T5na
 BePlpf/H3iRoPQ34vNR9Jttl82Z9lHaM4aseYNc2TJVXYIXJu9EjDpMF8z6/J3hbyfXq
 KfJg==
X-Gm-Message-State: AOJu0YzIR8AT0U8TvbAtr2WbWE8S8EFtuy8fHRIEMOWcjf5pt+DceyPm
 aHlfjg+p2NSYh2sEpIvVJzdcKhy1+DXvmyeW0ZD/nSW3aUg7mb8PPASb6OFUItIqiBagP/v5rZQ
 g2jCYmv8+o4CbHoNFWjJcLY7fpV0TsvmhH7BLiq65Z2QasGX/0lNbIg==
X-Gm-Gg: ASbGncu3bEItceYmChTZ79vh2+wjU4xNNePICCbGAUU7iySqn1Btyc3DP3RPeHRs6o5
 i28lkn+NMYfGgGc5Xwpp2mffTqKIwXIO+bLPGgpk9iZqBkh6y9KP5MAo24mEQsW9sX7W4cdgygJ
 kD6a47MFQklQ6vw3ZAJwP+XisKkkwzPBgaVql94bMv4GGxX3DJuKYInrrR0hC8nFav1fLimiLA1
 vW4T06iN3MvDHaWnoraM+I3ejMEKSWwwMDlo1R+q3V3IWr4M2gmfb3DB6/Pzz6n0bfCxIfXCiR3
 NEk16kB1Xcs+C/g1c8zUJaGkP84KjVGMbUP3r4yJBaHx1msuLeQtxo67SqgH3YEDj//CS0ueh3a
 ibDwqdpRBAHU3djcO05T/b5SV50fg0HpTTiHsigGbwZHw9g==
X-Received: by 2002:a05:600d:8303:b0:46e:396b:f5ae with SMTP id
 5b1f17b1804b1-475d43c85bemr51478275e9.16.1761574384247; 
 Mon, 27 Oct 2025 07:13:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI8s35WcDa8996lClXOIJimns/C0qJooJhanZdE2Z13csYyt58Lq0V9i+9uR7BnswBCFqquA==
X-Received: by 2002:a05:600d:8303:b0:46e:396b:f5ae with SMTP id
 5b1f17b1804b1-475d43c85bemr51478045e9.16.1761574383810; 
 Mon, 27 Oct 2025 07:13:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd02ce46sm165455955e9.3.2025.10.27.07.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 07:13:03 -0700 (PDT)
Message-ID: <c21641fd-1a35-4b47-a361-bfc2daf7dbd7@redhat.com>
Date: Mon, 27 Oct 2025 15:13:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/system/arm/virt: Document user-creatable SMMUv3
To: Peter Maydell <peter.maydell@linaro.org>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, nicolinc@nvidia.com,
 ddutile@redhat.com, nathanc@nvidia.com, mochs@nvidia.com,
 jonathan.cameron@huawei.com
References: <20251024084350.252702-1-skolothumtho@nvidia.com>
 <CAFEAcA8SAQO0frmN-rK6zp_-fEGXLefAXAxHmT=LASqEL-UU5g@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA8SAQO0frmN-rK6zp_-fEGXLefAXAxHmT=LASqEL-UU5g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a1VbRMjFiQaS9Fbklxo8AmbdkkevKXh6EdXEZNCbBLc_1761574384
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01,
 WEIRD_QUOTING=0.001 autolearn=unavailable autolearn_force=no
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



On 10/27/25 12:27 PM, Peter Maydell wrote:
> On Fri, 24 Oct 2025 at 09:46, Shameer Kolothum <skolothumtho@nvidia.com> wrote:
>> The virt machine now supports creating multiple SMMUv3 instances, each
>> associated with a separate PCIe root complex.
>>
>> Update the documentation with an example.
>>
>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Thanks. I have some minor word-smithing tweaks, but I'll just
> apply them to this patch in target-arm.next if you're OK with
> that:
>
>
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -224,23 +224,24 @@ SMMU configuration
>  """"""""""""""""""
>
>  Machine-wide SMMUv3 IOMMU
> -  See the machine-specific ``iommu`` option above. This allows specifying
> -  a single, machine-wide SMMUv3 instance that applies to all devices in
> -  the PCIe topology.
> +  Setting the machine-specific option ``iommu=smmuv3`` causes QEMU to
> +  create a single, machine-wide SMMUv3 instance that applies to all
> +  devices in the PCIe topology.
>
>    For information about selectively bypassing devices, refer to
>    ``docs/bypass-iommu.txt``.
>
>  User-creatable SMMUv3 devices
> -  Allows creating multiple user-defined SMMUv3 devices, each associated
> -  with a separate PCIe root complex. This is only permitted if the
> -  machine-wide SMMUv3 (``iommu=smmuv3``) option is not used.
> +  You can use the ``-device arm-smmuv3`` option to create multiple
> +  user-defined SMMUv3 devices, each associated with a separate PCIe
> +  root complex. This is only permitted if the machine-wide SMMUv3
> +  (``iommu=smmuv3``) option is not used. Each ``arm-smmuv3`` device
> +  uses the ``primary-bus`` sub-option to specify which PCIe root
> +  complex it is associated with.
>
>    This model is useful when you want to mirror a host configuration where
>    each NUMA node typically has its own SMMU, allowing the VM topology to
> -  align more closely with the host’s hardware layout. Supporting multiple
> -  SMMUv3 instances is also a prerequisite for future accelerated SMMUv3
> -  support.
> +  align more closely with the host’s hardware layout.
>
>    Example::
>
>
>
>
> (I deleted the sentence about SMMU acceleration because that
> isn't upstream yet. When it lands then we can update the
> docs if the version of it that lands can't support acceleration
> of a single machine-wide accelerator.)
>
> thanks
> -- PMM
>
Looks good to me as well

Fell free to add my R-b

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric





