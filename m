Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C60FED3E3
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 15:24:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGIO0-0006ph-Cm; Fri, 24 Apr 2026 11:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wGINz-0006pI-Rm
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 11:24:07 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wGINx-0000x5-Ev
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 11:24:07 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so97846325e9.2
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 08:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777044243; x=1777649043; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1AU33mHcOoBqcvM7nu571k0mM8qZPnKiwu43LZRhmtM=;
 b=MoMIt0CEsAPiw2R2cvNbFhAbdVCG4Ao6jPMMYKClH4FkGF5Hl4K8wS0z/v1VI1c1rR
 CrWqOX6jHXjw0IGRFMBU97MlTOKC/ZWGN5FPAkm2LzfmUOAzgANLN5NpN+srJbrnFRmj
 A07fGDIQHyUqY0+2+oNWm0Ms0IfwuuF2U2tMK+BVjhputlkF8O3k92TtPUPSxI4RU02M
 hkTH+A009O32+PTZ0O141cJ+syeqggYy2qm0//2vIMhk+rLXe5vIIs4JHIjit20NXQl4
 4ksc/6ErVFtrYdRQNhFI925f/K3VsyLchCoWX0pigTAOL3sIjqrxxSvBufkRNUIU1k8C
 Dk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777044243; x=1777649043;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1AU33mHcOoBqcvM7nu571k0mM8qZPnKiwu43LZRhmtM=;
 b=KC1JDrOyCx5tyT1AJ3aFpFpWybmWeey8aJrbp62hY+j1Q/7QWZyZyeJGU8Nmj4F4+X
 u0fYwjYs70pFUHo9n83UhMub1tEB21teafrITG12Sn12kUiPH5yY0BbOCQvokoavVbbI
 2oBB/XBp+2+D1JSx+Zl7wdzSFAVUy2oG+9f8He2nNlTxzBvurEssdeMURuShKFcRty+k
 Z5zHbnIOLvyOubUw2pcO5jsnD7pd4z8PUrTyWr0iRBvOXTGz8SGX1Fc7ns/B53t57XwR
 aGtQhplLHCrs9yL+sGnRQ7mzpZvWCe6cymk6JE63k3BmMVnRJ6bdnbqcOrqSrmASM5sr
 qo4Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/D+PNPo+rPHB6LbrRRcyGsNWUqOj1Ro2WP5NDCHvXZw3IPrp4SrWkdD5XzHBOQAZKPG+xD7cb5VQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz7GBOdnePeKDsj5AxNZBK9eAvWhtRx2ATSJyKh4Z0yQQvCy/Bu
 XgxHLITZkbBEyhBmPlyaOp1abaa4tArcEVwPus8123x/DCE+J2IqIS3AX5T3IDPBF/g=
X-Gm-Gg: AeBDieu0zDYHe4l7o0VgDIJkPyfuaAhkNgeIaYOqNA0s0XVXzXTzBJjVBIwSKZCf+/r
 gsFzIeKqWiS0Ym0Ww8t6lUj7WQ7dd/yXr1GmMLMOZYppqu1dL+g6UGguw94aahHDVJ+iLX+BkKl
 sVRcagH88n3CYwQazyStdAXQ5UeRKZKkCLmSS5x+ek7b2fS6RZwgdrIFptl4bq9UnWNUYnPt2p8
 7yAEKWzsdH1qjDTDP369nZHfyXPxY9gVV1euCyZa7QgBPhsM70sYSGZm/LopInzvs1H/6zkhm7R
 /p9iSrLdEReS5R6+gJ2NvTisOPmRZMEV/RoVZscnW0xrEgzZpuTsvJe20fT7JppG+PrRYfqCbgz
 3uH1xyLt5MFOZzh80LBLkc7SGdEYgBWE83LMdQCiV2qEUBrZaDj639389/N0YANRpnodAlbGT4u
 wvt1+3mGWLBBdxvanmTweOtrJB4BAeT8xV6w9hvtQz+IzGr1Ps2F/SoY9sdP5N8Oukv9poSEPLX
 H6f
X-Received: by 2002:a05:600c:3f0c:b0:48a:563c:c8e0 with SMTP id
 5b1f17b1804b1-48a563cd16bmr222575785e9.1.1777044242862; 
 Fri, 24 Apr 2026 08:24:02 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cc375dsm54738446f8f.14.2026.04.24.08.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2026 08:24:01 -0700 (PDT)
Message-ID: <8dcdad92-2981-4d57-b605-871c748424c9@linaro.org>
Date: Fri, 24 Apr 2026 17:23:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/18] hw/usb/hcd-ehci: Introduce common properties
 macro for sysbus and pci
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 "peterx@redhat.com" <peterx@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "farosas@suse.de" <farosas@suse.de>,
 "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260424080508.53992-1-jamin_lin@aspeedtech.com>
 <20260424080508.53992-8-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260424080508.53992-8-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 24/4/26 10:05, Jamin Lin wrote:
> EHCI properties are currently defined separately in both sysbus and
> PCI implementations, leading to duplicated code for common fields
> such as "maxframes".
> 
> Introduce DEFINE_EHCI_COMMON_PROPERTIES() to consolidate shared
> property definitions and reuse them across both EHCISysBusState
> and EHCIPCIState.
> 
> This reduces code duplication and keeps property definitions
> consistent between different EHCI device variants.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/usb/hcd-ehci.h        | 3 +++
>   hw/usb/hcd-ehci-pci.c    | 2 +-
>   hw/usb/hcd-ehci-sysbus.c | 2 +-
>   3 files changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

