Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95D3EFCBD4
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Mar 2026 08:04:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w22vi-0003FJ-Mi; Mon, 16 Mar 2026 04:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w22t5-0001Om-To
 for qemu-arm@nongnu.org; Mon, 16 Mar 2026 04:01:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w22sk-00083F-LN
 for qemu-arm@nongnu.org; Mon, 16 Mar 2026 04:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773648035;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VU+AVgjPf8924LiZz6NH5O1/3ktuuTWlwWqJRlY+znM=;
 b=hBXBO1GMdIW7SifCh7X/AEz4Em2wcpvhFRaUIFnp6QrunxG2OEnGxpdk8H39BWyN1m0NPn
 N3FymIfzBe2EhSDnaUTPjOVIGl1yslq80U48pYmk4QESrbfBkHAYwTJGMF3fYYL/y/1rtt
 i+x0qcBFoHqMLyaazG8Ca9Yfni+TTXg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-zi0_PQ8TPvWr3ksyJopFPA-1; Mon, 16 Mar 2026 04:00:33 -0400
X-MC-Unique: zi0_PQ8TPvWr3ksyJopFPA-1
X-Mimecast-MFC-AGG-ID: zi0_PQ8TPvWr3ksyJopFPA_1773648033
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-485345e2fdfso23183925e9.2
 for <qemu-arm@nongnu.org>; Mon, 16 Mar 2026 01:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773648032; x=1774252832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VU+AVgjPf8924LiZz6NH5O1/3ktuuTWlwWqJRlY+znM=;
 b=Wxtbcs1XiJYPYmU89rxelRc1etw4qrrqQuUzx9nN4IZrJhhPpy89xfrhJWZk2w4B0P
 QBgPitO0vpFkrvRMPQew9Vf8wPgFd+9D/djB8z7DBZUtsS3sngrh/pYCQVTl5fUFCSta
 KEGfS69d6j5ML5VDxzmHmP6yNbqYXbg1fhZ011+1lQznfOOivvbLIBGRf0h2LPdv9yDZ
 2iBsdCQTJOCHoEsPwV+lQFwo6YSynkvJO5i2LMPqmZbwfmjhkEe12lk/qPdHMAY0Uave
 nrvJeCZaP0NhQr9cHEtREaPn6oIY5dtkwI80L68xh6Ef37g4b2NtLql6jGvyfpqcw+Zx
 BBkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/ogXrYvNbEsxbLm7I4xNg42Tywlh06xwzp3gpNpWCEgXT0dP2W24Un4bGTMdvnNoeDyWKyE5s0Q==@nongnu.org
X-Gm-Message-State: AOJu0YyfU2cpHbpTKfHCmUSs6ZB66c0iczV+umkpCeiNS8B4Y4PDY0xo
 1KAEeC4Y28OHW368EaNOK897tXFVHWgSb3o4I7OoiF+lUJ48hXfVSgcltjOcs7M4cAwnzEv3HKZ
 g1wLoAshEtdwRwT2yWUKNzVWz1TYkZZ0FuBEEyNdkgvLOQhHVOybakQ==
X-Gm-Gg: ATEYQzyzTbo3JXltIOAXu5QYLn7dlucVP7XYXaVNXLbnJmvI8L5q8ZAkgvXAueRDEIJ
 KpuvMmnfttVGpIH+O2emy3VfuevdhItmr7oGS6aJRRQJyCarFw2gi9kOrPvELkT7MtE76OMd0u8
 +jBVsjg9kSDYoA1M3+n55Vv+UW4cn8pJ4glBfcQEh8acKxbyKuM/ZqgMevbf6qbwhSAbSDNnH6z
 CilJMq3fUiP/HeHeL4mp+pqWTJ+X0p57b5HfOTEZplpYOXUkz1AtEmf8pF6uv9OsoIosvQ/8Pk7
 fIBpqfy1EJJvwr0WPt6Ju/1lE85kUyydd+FAimBGyW7legXxxBbbflLal35o+OQXscgsLx8R9Q1
 FAwozTMJm44aVmRSeDJvnjPhpZVgiiwPtVpxuo3ax4uMSwW+m7Ne3H0Qki/99MOsA2ev1vQ==
X-Received: by 2002:a05:600c:8289:b0:485:3a93:3a9e with SMTP id
 5b1f17b1804b1-485566d671cmr198381685e9.10.1773648031947; 
 Mon, 16 Mar 2026 01:00:31 -0700 (PDT)
X-Received: by 2002:a05:600c:8289:b0:485:3a93:3a9e with SMTP id
 5b1f17b1804b1-485566d671cmr198380975e9.10.1773648031371; 
 Mon, 16 Mar 2026 01:00:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48557a7473fsm84071995e9.14.2026.03.16.01.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2026 01:00:24 -0700 (PDT)
Message-ID: <6c12bb86-6004-4ba6-b46e-e66da41f2e9c@redhat.com>
Date: Mon, 16 Mar 2026 09:00:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] qemu-options.hx: Document arm-smmuv3 device's
 accel properties
To: Nathan Chen <nathanc@nvidia.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Matt Ochs <mochs@nvidia.com>
References: <20260312210328.2016191-1-nathanc@nvidia.com>
 <20260312210328.2016191-9-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260312210328.2016191-9-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b_vSJ8x9fy8DwinsmveD7Jelan-Lb3GFqNxEaenFXMo_1773648033
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 3/12/26 10:03 PM, Nathan Chen wrote:
> From: Nathan Chen <nathanc@nvidia.com>
>
> Document arm-smmuv3 properties for setting HW-acceleration,
> Range Invalidation, and Address Translation Services support, as
> well as setting Output Address size and Substream ID size.
>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
> ---
>  qemu-options.hx | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 890c4f1d23..836de4532c 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1274,13 +1274,40 @@ SRST
>      ``aw-bits=val`` (val between 32 and 64, default depends on machine)
>          This decides the address width of the IOVA address space.
>  
> -``-device arm-smmuv3,primary-bus=id``
> +``-device arm-smmuv3,primary-bus=id[,option=...]``
>      This is only supported by ``-machine virt`` (ARM).
>  
>      ``primary-bus=id``
>          Accepts either the default root complex (pcie.0) or a
>          pxb-pcie based root complex.
>  
> +    ``accel=on|off`` (default: off)
> +        Enables guest to try to leverage host SMMUv3 features for acceleration.
Enables guest to leverage
> +        By default, enabling accel configures the host SMMUv3 in nested mode to
I would remove "By default, "
> +        support vfio-pci pass-through.
passthrough
> +
> +    ``ril=on|off`` (default: on)
> +        Support for Range Invalidation, which allows the SMMUv3 driver to
> +        invalidate TLB entries for a range of IOVAs at once instead of issuing
> +        separate commands to invalidate each page. Must match with host SMMUv3
> +        Range Invalidation support.
> +
> +    ``ats=on|off`` (default: off)
> +        Support for Address Translation Services, which enables PCIe devices to
> +        cache address translations in their local TLB and reduce latency. Host
> +        SMMUv3 must support ATS in order to enable this feature for the vIOMMU.
> +
> +    ``oas=val`` (supported values are 44 and 48. default: 44)
> +        Sets the Output Address Size in bits. The value set here must be less
> +        than or equal to the host SMMUv3's supported OAS, so that the
> +        intermediate physical addresses (IPA) consumed by host SMMU for stage-2
> +        translation do not exceed the host's max supported IPA size.
> +
> +    ``ssidsize=val`` (val between 0 and 20. default: 0)
> +        Sets the Substream ID size in bits. When set to a non-zero value,
> +        PASID capability is advertised to the vIOMMU and accelerated use cases
> +        such as Shared Virtual Addressing (SVA) are supported.
> +
>  ``-device amd-iommu[,option=...]``
>      Enables emulation of an AMD-Vi I/O Memory Management Unit (IOMMU).
>      Only available with ``-machine q35``, it supports the following options:
Besides,

Reviewed-by: Eric Auger <eric.auger@redhat.com>


Eric



