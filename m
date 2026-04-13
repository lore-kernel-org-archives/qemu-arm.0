Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFCEF531DE
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 23:13:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCQTJ-0002se-92; Mon, 13 Apr 2026 19:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCQTH-0002rn-EY
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:13:35 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCQTF-00014O-U2
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:13:35 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso57923515e9.3
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 16:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776122012; x=1776726812; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ts2ZbD9i00cs7EoaPmxXwe/dereLWU9IapSFE0Zgdo0=;
 b=D0sIGPQf/YDyD2R8lSto5MGKCk9uKDiwxYoNkUiYg6W9ZoYpEW4PscC1RQb8VmwtSm
 t9QAjJjz6+kADrUI5DZOaa32EhxTEX6EFfRnuC3aZTtp3ttfco/9+PCpUy8ea+sPuN6P
 aW6v7BHEZf7V1jx/3KNiY7c9Pj26H8BTsU+EaTEU65ET4Ink4UrnapqFRmP/0sS0Ez7y
 ZvpXSdgSzRk1XZfJkeXdEGl1Z91UJbAQz7cD0b2jY3zY5EJjHBsffNsi+cdg1ZoCad1z
 NocQo3crKZSg/o3yGDLvO5OplisjymUgSsQvgxl3+ZhzKmRl/EB9hVzKN4bubf/vdYma
 YUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776122012; x=1776726812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ts2ZbD9i00cs7EoaPmxXwe/dereLWU9IapSFE0Zgdo0=;
 b=MdeBX69UkJWdIk3h/W9GnjSJMbwHVdcisbB+5odNWjFJ3rdJgtZ3Fu3N00oBD6wWty
 pbNDDv4pd0fu2yLV/x9AL/OuhaNb/D30rhNB2qDXENTSOCOwPM9PPfViq2H4txE5BZpY
 3OyWNR7GF590QoqZMobyl9ZYHpKTpxpqydp8j1z0LRKQM5t+xYEnKUPqIEyyCWMBYbqH
 4qi54r6onbeZB54LC3DR5p9/wQIeY9TLG+k2nVcp2mZHioncBkTnojjD3fv88fGMmC7D
 dDu6Xhuj+Feo/AxeuDGq3LCZJGQlLQSLJiAekhA7ELEF6aTDBo6NQ8KXWWTdphcU8lvL
 eKcQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/xiQkIXRtMWMC6fCNOL3XK3OXFO8q2MQNKGFkcpWalotDUPi4KB8cNOOsQzebLXXCRxc5B7hbUhw==@nongnu.org
X-Gm-Message-State: AOJu0YygLEVHbBei1+omR3F6CNZhAi+S7Hd8EzBNGua9bCXefc5gXB8y
 A2j6Tus1yDFlNk5hFYGDXVZ4Pc24CZ+WFOmRz+KLoWcg7Y2EJgoE3kw03+APxnYH4ow=
X-Gm-Gg: AeBDietEY2fqLdCwPGcFTHzEFbANVnAgPULW/kURt3azvbtnIamL4eDPXXQxIGJm/qw
 WKigONXgiOkjynOZ1NV5prlVcsyqv+hPogh9BBoM2YOJa8ZuWH97U+k438W+xbWGf2ITKYGuVBu
 vhN7OpABBBalwsS/IkA/B1nKxjdLV0oB/MiH4IooieKn8jB3Zq/fOfwxz6Y/C1mfnxs9t0fL7Fk
 3bIunOhik+bBT0f6CM1tBEAIS9hTwNuhlqqeKEquWwPByQLZ9TXkOW7YdzSz5lBoGZTZ7XwkwfL
 U6xlVEvRJRWFXU1ubYh1Ah1Mk69Ne4+IkfEvU9xThDchZw0MHxSmgCu9ApnhBsG7RaxVfRQgcpR
 WDM7UDmCOZHveEiER5sJDlRnsfwQVFx0xLIfDQ1uHMid2Ejb8DrehEtyLybFTsiI8iyRKxFisfE
 Cqjgb8pkgCEq2RbmWJcTep70zBTpPoPNjkAX+A/+Y3VHM980EIy0MRcDou+9JUbAVAv66lkJFK9
 JS3
X-Received: by 2002:a05:6000:2dc6:b0:43d:7670:84d3 with SMTP id
 ffacd0b85a97d-43d76708565mr10193991f8f.0.1776122012229; 
 Mon, 13 Apr 2026 16:13:32 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e5062fsm35269433f8f.31.2026.04.13.16.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 16:13:31 -0700 (PDT)
Message-ID: <aa57949d-1d83-4a47-8cd8-2128e69ee952@linaro.org>
Date: Tue, 14 Apr 2026 01:13:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/65] hw/intc: Skeleton of GICv5 IRS classes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
 <20260327111700.795099-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260327111700.795099-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 27/3/26 12:15, Peter Maydell wrote:
> This commit adds the skeleton of the classes for the GICv5 IRS
> (Interrupt Routing Service).  Since the IRS is the main (and only
> non-optional) part of the GICv5 outside the CPU, we call it simply
> "GICv5", in line with how we've handled the GICv3.
> 
> Since we're definitely going to need to have support for KVM VMs
> where we present the guest with a GICv5, we use the same split
> between an abstract "common" and a concrete specific-to-TCG child
> class that we have for the various GICv3 components.  This avoids
> having to refactor out the base class later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>   hw/intc/Kconfig                    |  4 +++
>   hw/intc/arm_gicv5.c                | 39 ++++++++++++++++++++++++++++++
>   hw/intc/arm_gicv5_common.c         | 31 ++++++++++++++++++++++++
>   hw/intc/meson.build                |  4 +++
>   include/hw/intc/arm_gicv5.h        | 32 ++++++++++++++++++++++++
>   include/hw/intc/arm_gicv5_common.h | 31 ++++++++++++++++++++++++
>   6 files changed, 141 insertions(+)
>   create mode 100644 hw/intc/arm_gicv5.c
>   create mode 100644 hw/intc/arm_gicv5_common.c
>   create mode 100644 include/hw/intc/arm_gicv5.h
>   create mode 100644 include/hw/intc/arm_gicv5_common.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

