Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A6BCD8C9F
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 09:58:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWWk5-0003Li-Ue; Mon, 08 Jun 2026 05:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wWWk4-0003LE-Ou
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 05:58:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wWWk2-0003uz-Vx
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 05:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780912677;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iuBJaN/YtBUgwbFNdFlWpHosRwBoW5ttr/j+UgLeYyc=;
 b=B7/jWTRBcU4l/qaYNmrm1gr1uYAGvMqRTH9DVcTXVtRawglrEFTUtnDxwhaeSvh25riLun
 MARE9Uw2FuaGqdPmJ5WAAcg+xYRmG8SLC8LHdSF5H7FW62uG/1jWO9GjDNFMuWFzMZcVYz
 sBjiAhK99TI97dFfNnh6v/G+ros6DNI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-mTllEh1BNzWaE2bpzMiCWA-1; Mon, 08 Jun 2026 05:57:56 -0400
X-MC-Unique: mTllEh1BNzWaE2bpzMiCWA-1
X-Mimecast-MFC-AGG-ID: mTllEh1BNzWaE2bpzMiCWA_1780912675
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490c56e2576so23560955e9.3
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 02:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780912675; x=1781517475;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iuBJaN/YtBUgwbFNdFlWpHosRwBoW5ttr/j+UgLeYyc=;
 b=J8gG+ZUa76oQ6D/XJfT/82cDW7HBRC4gFFoX3OywOmNqBqI59KAfKoH8ILkQw4tNa3
 ubWTwDmEP8Ss40DKvqa7OY0VZQlXTBx93XqzKtR5RgCuqV5GtkcuDZSEDWkrs3ygeIIf
 ip3mdjdm0r4e+3ufOSwET2X5WQS0GweAKrtn5m6VGQgHmFBWasT/lpcZsRz17oKjup9y
 4/S1LcTzBn47fJjizne12RUSeyMA4jvlOCwUTwGRt+DU82Ps0Doh3vjZa7JJzExulK70
 N/4KzW64ytjkIpnk9910svSgHJtLRvhndn9YKEVlmtcYocfmxl3hM0TlkObvmfscAU/B
 sojg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9cB/OkoemIXhla/Ny/FMK0s4/3Ch6TjdSzWY68Q+xZgj60sbpYuupysqyMaB2Ct1b505+irRj4tg==@nongnu.org
X-Gm-Message-State: AOJu0Yz8sPp9c5BwpI13TcLXhsZRtTMbrPVc8PG93F9ZWUcj17MTOOiY
 vFgFdZqqGCqBD0KfPKwRcBwuo4yUx0H6kAnVFB/cgkHSsEl//ERclxMMLEnVSPs2KCgWqI6OVUD
 I+drNDVn1KBd4a3nHbhhbI24Jt7DRd2wxADeoRsJDi/SeWRlsnbUeug==
X-Gm-Gg: Acq92OHdMvF2jf6nNDm1sP+gneeE+79x8DQEhhR6kDc+m7qOLNsic0GizkiSo0XPDOo
 /9YvoaGyvPVmq9NxQ6oXoOOnb2deLFwvyUw9ag8NYDCgmAqv8qB3E4HMef5+kXKK4l1YVvjthAi
 X5A9a8CAMqcV2jO80C8qKGdwTz/SqCwWgbnyaIbzAVhmeGiC7IDWpUU/jIUM8EUznKCnNTcDDjy
 R8oUTsXcvASnFphR463Zs8UiUcg+BhWQgjYnc5tiSzFnX+HWgUJLLDJCaRkQ2S444eVUUuePAfO
 ugSH5DobO0iiFCtJUi7p5648kPpD5aKZmRZIzYkihqHN49bNmwRaKHx+LJZkaUiJ+vm5IbMrHpv
 vwFC7RAFKhJ3DoFXqEaPJRohAYroug6eNE2GNkIWh9FCKAuycmdqDRWswImJ2AyhL2a+84VbLiq
 dRLQKA
X-Received: by 2002:a05:600c:34cb:b0:48e:6db3:ff3a with SMTP id
 5b1f17b1804b1-490c25b09a2mr248279625e9.16.1780912674953; 
 Mon, 08 Jun 2026 02:57:54 -0700 (PDT)
X-Received: by 2002:a05:600c:34cb:b0:48e:6db3:ff3a with SMTP id
 5b1f17b1804b1-490c25b09a2mr248279095e9.16.1780912674571; 
 Mon, 08 Jun 2026 02:57:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc4082c3sm366856915e9.13.2026.06.08.02.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 02:57:54 -0700 (PDT)
Message-ID: <c17dc055-405a-42ab-b028-b12ed8feefea@redhat.com>
Date: Mon, 8 Jun 2026 11:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v5 0/9] hw/arm/smmuv3-accel: Resolve AUTO properties
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
References: <20260605001712.1823737-1-nathanc@nvidia.com>
In-Reply-To: <20260605001712.1823737-1-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pm1EA4yVW9KqD6LCfFSuBCl37w7IdJuNYTrrgi4vNe4_1780912675
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 6/5/26 2:17 AM, Nathan Chen wrote:
> Hi,
>
> This is a follow-up to the series [0] that introduces support for
> resolving 'auto' for arm-smmuv3 accelerated mode's ATS, RIL, SSIDSIZE,
> and OAS feature properties based on host IOMMU capabilities. This is
> dependent on the series [1] for changing these property types to accept
> 'auto' values.
>
> Accelerated SMMUv3 Address Translation Services support is derived from
> IDR0, Range Invalidation support is derived from IDR3, Substream ID
> size is derived from IDR1, and output address space is derived from
> IDR5.
>
> The default values are set to 'auto' for all properties. If accel=off
> and the values are set to 'auto' or are omitted and resolve to 'auto',
> the default property values defined in smmuv3_init_id_regs() for OAS
> and RIL will remain unchanged, while SSIDSIZE and ATS values will
> remain initialized at 0.
>
> A complete branch can be found here:
> https://github.com/NathanChenNVIDIA/qemu/tree/smmuv3-accel-auto-resolve-v5

I am afraid this requires a rebase on top of laterly landed

https://lore.kernel.org/all/20260601215410.517009-15-stefanb@linux.ibm.com/

Thanks

Eric

>
> Please take a look and let me know your feedback.
>
> Thanks,
> Nathan
>
> [0] https://lore.kernel.org/all/20260527221631.612026-1-nathanc@nvidia.com/
> [1] https://lore.kernel.org/qemu-arm/20260323182454.1416110-1-nathanc@nvidia.com/
>
> Changes from v4:
> - Added R-by tags, thanks all!
> - Re-word smmuv3_class_init() accel description to list nested
>   translation support as a pre-requisite
> - Fix typo in smmuv3_class_init() SubstreamID size description
>
> Changes from v3:
> - Added R-by tags, thanks all!
> - Include a fix patch for resolving ATS support in ATC invalidation
>   case
> - Update host requirements documented for accel=on, oas, and ssidsize
> - Fix style issue, update comments
> - Update function name for smmuv3_accel_machine_done
> - Remove unnecessary early return for smmuv3_accel_machine_done
> - Fix formatting in qemu-options.hx based on html render
>
> Changes from v2:
> - Added R-by tags, thanks Eric, Shameer, Cédric for the feedback!
> - Re-worded descriptions in qemu-options.hx and smmu_validate_property()
> - Emphasize accel=off auto behavior in a comment for smmuv3_properties[]
>
> Changes from v1:
> - Update qemu-options.hx to explicitly mention auto is supported
> - Update qemu-options.hx to mention auto as default
> - Simplify comments in smmuv3_accel_auto_finalise()
> - Update descriptions in smmuv3_class_init()
> - Consolidate all default value change patches into one patch
> - Implement and use smmuv3_pasid_supported() for setting PASID support
>   flag
> - Move smmuv3_machine_done() and qemu_add_machine_init_done_notifier()
>   to smmuv3-accel.c
> - Register machine done notifier only in case auto_mode is set
>
> Testing:
> Basic sanity testing was performed on an NVIDIA Grace platform with GPU
> device assignment and running CUDA test apps on the guest. Observed the
> feature properties being set based on host IOMMU capabilities.
> Verified that the VM boot will fail without a cold-plugged device, and
> that a hot-plugged device re-uses the resolved values from the initial
> cold-plug. Additional testing and feedback are welcome.
>
> Nathan Chen (9):
>   hw/arm/smmuv3: Update ATC invalidation check
>   hw/arm/smmuv3: Improve accel SMMUv3 usage documentation
>   hw/arm/smmuv3-accel: Add helper for resolving auto parameters
>   hw/arm/smmuv3-accel: Implement "auto" value for "ats"
>   hw/arm/smmuv3-accel: Implement "auto" value for "ril"
>   hw/arm/smmuv3-accel: Implement "auto" value for "ssidsize"
>   hw/arm/smmuv3-accel: Implement "auto" value for "oas"
>   hw/arm/smmuv3: Set default ats, ril, ssidsize, oas to auto
>   qemu-options.hx: Support "auto" for accel SMMUv3 properties
>
>  hw/arm/smmuv3-accel.c   | 77 ++++++++++++++++++++++++++++++++++++++-
>  hw/arm/smmuv3-accel.h   |  2 +
>  hw/arm/smmuv3.c         | 81 +++++++++++++++++++++++------------------
>  hw/core/machine.c       |  5 +++
>  include/hw/arm/smmuv3.h |  3 ++
>  qemu-options.hx         | 25 ++++++++++---
>  6 files changed, 150 insertions(+), 43 deletions(-)
>


