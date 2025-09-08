Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7EBCAC581
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Sep 2025 14:15:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uvcdw-0008Kn-VH; Mon, 08 Sep 2025 10:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uvcdv-0008Jp-Fq
 for qemu-arm@nongnu.org; Mon, 08 Sep 2025 10:14:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uvcdn-0008CR-Rb
 for qemu-arm@nongnu.org; Mon, 08 Sep 2025 10:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757340877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=P746Pq4DmH41UsZx5jfPuND4CSRD4mDFfTKISjddDyE=;
 b=IAKXcXf8blj4kp+w+e0c+LUSRb5A33Q9ve+1k5s7HxrUZyuxrED3Nneo9OlzMvVJ5ve+xt
 YFvTvrDrocbQ6TWo0XL2N1De/lRPc2Fh1IuQXcQT0aFIXRKgOoBl982+YWY6k2G7X0RC4y
 MdYLLwj69jp2nlbvrlbBslyw3oECI9o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-jQ2_INxKOKyT9-tMWMW4Ag-1; Mon, 08 Sep 2025 10:14:30 -0400
X-MC-Unique: jQ2_INxKOKyT9-tMWMW4Ag-1
X-Mimecast-MFC-AGG-ID: jQ2_INxKOKyT9-tMWMW4Ag_1757340869
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3e424a186fcso1324627f8f.0
 for <qemu-arm@nongnu.org>; Mon, 08 Sep 2025 07:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757340869; x=1757945669;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P746Pq4DmH41UsZx5jfPuND4CSRD4mDFfTKISjddDyE=;
 b=TrUKizb9DkzFEPKDzVdlNz79spaHc3QH6F22YFyM1FBbryt+CXzya/YbED6xtjeW6M
 rxr0yANlyIsjVfjQpcpA2V2LN8W+22WqaoVU8ZqDwzlx1vCgypVEj4dlIajYPT8jyhx9
 XBN16DpzG+61S8d4wJBzDthLH+Q28Pik7cGqov4iRFeHxIm5DsqT5XJUpSf6jiWcbHo/
 NGgUK4Uf6fONiVG0867Dgcwi6J7026Bj96s+AildxfFEFur0FSBVig7v9RyFToAo2jaP
 0UgzTCJHN9nXKjLsTx9lRTewUDqb2D8Q7rs0AnZaPmP+/h62jC35NEjB0CIwRuE6qeNx
 NKVg==
X-Gm-Message-State: AOJu0Yx+QSvMJNKGTuHaS5KcUMszRI76YvKcvNqQuIDDb2/qjJPfSrqb
 7RjdDWA47N5Vw9KnLACglkMOy3Hglk60jCetflwhNMeex/O09hrwSSyaxbY2N1uOtWbFfALa1TE
 OTgUvobVqXZiNYurjm0LkwWth4nD3rse1NlX+71x+82BdTxg9pUAZxA==
X-Gm-Gg: ASbGncvrFfVOjvMZT9vKDd73p974NkH4QcnggPTZzfKmJZGCROeg4gbwzNmrkevaMFZ
 V3lJ6EUJm2Zn/Ja0wD4ChuT5XtfnYoF2iG24mLFIN3oGySVMsb3NlOL3meE3CDaVSTfjQgSGMRt
 ONzqrUU6dLPqak9X3s5QWHdTBycxCbwNJvPTZRSg7XXOvrgtZYpuWc4YdB08IeBL/LiRW8Fi2R3
 4rWGNbShzzdAhypp6+vLfxD8swaOA7Ks8tXVOKBSZOTES+tuu4pZiVgjNWnL1kzjy7/+WHGE4Gp
 DkvTzlrdj2xRs4QtP+dAsxW+pdxRzW9wmLngU+/Tx+6q9+4APM14Mnm1aujv697UxySCImS/T0d
 CSZo=
X-Received: by 2002:a05:6000:26c3:b0:3e5:4da4:d894 with SMTP id
 ffacd0b85a97d-3e64392d297mr6334079f8f.31.1757340869348; 
 Mon, 08 Sep 2025 07:14:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4MY2F1vbKFxMpqai7LSgeJ+GP5U+//q7JKcQALmNPPW6erm07vAreTEHKXgpfBaiOMr39Zg==
X-Received: by 2002:a05:6000:26c3:b0:3e5:4da4:d894 with SMTP id
 ffacd0b85a97d-3e64392d297mr6334045f8f.31.1757340868949; 
 Mon, 08 Sep 2025 07:14:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf276d5816sm41479122f8f.25.2025.09.08.07.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 07:14:28 -0700 (PDT)
Message-ID: <e864f98e-2331-4b82-8921-323c2dd7e526@redhat.com>
Date: Mon, 8 Sep 2025 16:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] vfio: Remove 'vfio-platform'
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20250901064631.530723-1-clg@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20250901064631.530723-1-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9UcUvO4jiFkSOyzAn6Ruj-sk5zfKWdEB9KoMFIxRQdg_1757340869
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/1/25 08:46, Cédric Le Goater wrote:
> Hello,
> 
> The VFIO_PLATFORM device type has been deprecated in the QEMU 10.0
> timeframe. QEMU 10.2 is the time for removal.
> 
> The last patch moves vfio-region.h under hw/vfio since it no longer
> needs to be a public VFIO interface.
> 
> Thanks,
> 
> C.
> 
> Changes in v2:
> 
>   - Fixed 'system/system.h' include for the arm virt machine and a
>     couple more models
> 
> Cédric Le Goater (8):
>    hw/arm/virt: Include 'system/system.h'
>    hw/isa/superio: Include 'system/system.h'
>    hw/mips/loongson3_virt: Include 'system/system.h'
>    hw/mips/malta: Include 'system/system.h'
>    vfio: Remove 'vfio-amd-xgbe' device
>    vfio: Remove 'vfio-calxeda-xgmac' device
>    vfio: Remove 'vfio-platform'
>    vfio: Move vfio-region.h under hw/vfio/
> 
>   docs/about/deprecated.rst             |  25 -
>   docs/about/removed-features.rst       |  25 +
>   docs/devel/kconfig.rst                |   2 -
>   {include/hw => hw}/vfio/vfio-region.h |   0
>   include/hw/vfio/vfio-amd-xgbe.h       |  46 --
>   include/hw/vfio/vfio-calxeda-xgmac.h  |  43 --
>   include/hw/vfio/vfio-device.h         |   2 +-
>   include/hw/vfio/vfio-platform.h       |  78 ---
>   hw/arm/virt.c                         |   6 +-
>   hw/core/sysbus-fdt.c                  | 383 --------------
>   hw/isa/isa-superio.c                  |   1 +
>   hw/mips/loongson3_virt.c              |   1 +
>   hw/mips/malta.c                       |   1 +
>   hw/vfio/amd-xgbe.c                    |  61 ---
>   hw/vfio/calxeda-xgmac.c               |  61 ---
>   hw/vfio/platform.c                    | 716 --------------------------
>   hw/arm/Kconfig                        |   3 -
>   hw/vfio/Kconfig                       |  16 -
>   hw/vfio/meson.build                   |   3 -
>   hw/vfio/trace-events                  |  11 -
>   20 files changed, 30 insertions(+), 1454 deletions(-)
>   rename {include/hw => hw}/vfio/vfio-region.h (100%)
>   delete mode 100644 include/hw/vfio/vfio-amd-xgbe.h
>   delete mode 100644 include/hw/vfio/vfio-calxeda-xgmac.h
>   delete mode 100644 include/hw/vfio/vfio-platform.h
>   delete mode 100644 hw/vfio/amd-xgbe.c
>   delete mode 100644 hw/vfio/calxeda-xgmac.c
>   delete mode 100644 hw/vfio/platform.c
> 


Applied 5-8 to vfio-next.

Thanks,

C.




