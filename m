Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273AECAC5B0
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 10:27:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3B66-0005Op-J5; Mon, 29 Sep 2025 06:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3B64-0005OA-Aa
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 06:27:08 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3B5r-00007z-T5
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 06:27:06 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso3572585f8f.2
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 03:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759141604; x=1759746404; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NYTAV9zE56S/egR+ACWy8ich8evJQkYP4VGR3uTOsHY=;
 b=s5jSoROakjmL2kVCZpNAqyCYHmXNrYSAq2dLlbHhHgLKRbo2ssqLhwTs1HKC1HSXKa
 SUV1hPdw1f0K40nKVNAGNnZ68MtwLK7ksWv5hd7/J4MPCwZl5F34RdSd2tktHIwZTLF6
 4q8SlRMyzK9u/6/fyxEwvfmE+yXGqn6l2J1oFfuQkIrAFJHXVDefd9fjoS4sro9WNsKf
 R+xCR90dN8X3QN4dhbDdOXO6hQSpfMF+0jTQxW1zZx8mEJMddSn706s1Vod3fK/GNpuj
 DDq2LueCjioUX18IjFz34OHOETslkyyr8LnNhf7xr7SM/sdxhFfnzBYaA4kFQ/xa1CZv
 GM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759141604; x=1759746404;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NYTAV9zE56S/egR+ACWy8ich8evJQkYP4VGR3uTOsHY=;
 b=CaX9/atIX5PzIYIQ8fePJej2Brvvkc2xaPH5y1yFwYijXk+iKuxTjCY8q3eqVOQiU+
 nMlyZmlv4vGoM0shE617SphOC7/Ii3mlSVovwdg975qqzWsRC80hHbZSBJZEXpBMVyMS
 B40pdMaNQUPsWmpTs+mtEpU7WF+C3r9FzCHSimR7FnBYuSOuTuLfJ0KMxR7GcKqLbDEN
 vii0WhZGLx0BD+Sg0CVIXg31iRHR4O6unIrnow+MEHOdFySUGgQ7Fic9Z5tIG0b+bec4
 AvuWzmWdxRzGVrNmF3UKVQSw4VKQOizp/DZ3qvoqLlq4BipJw5s0qICvM5RyD6Zpee0C
 J7Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgw1tqixC5Ir3QV6FiRcyw5V+F69ARryI94WLlGWqjp+C3tQohYFzC2DAbDoFLATu0f5UJIi1xsA==@nongnu.org
X-Gm-Message-State: AOJu0YxBuF+UeoEDEdyBVoYv4fIIHMG8nW4h7y2/Cic6JW8Y+iDd7cqL
 69B7/urqxgIBa5mKzs/hBKc9fJKfnRd5zvBhbMBz8Z1ePPuoE8+JX+eCTDTPhfWDlMI=
X-Gm-Gg: ASbGncsUoUgwTgRplNQ8MSd/x+oLx3EC/XIfXare1tpbbF3fDyWiUkhJuKQJ+PjbBMT
 pwHKrQwSaKAbNlww+jHvQUsrflN/Phyq+kZkN1iuUJFLYBXYTrefasQwrADaoGht5n3SuhVStjo
 sCUcTvukyPrkgtSOEuexP8BhPZoqlrlUJ1QOoltZGSDEGnBqGtlsPEyWYFMZUVFt66xGFlJJbpT
 aEq7DsbA8IuejnnUeW6OHm2BCcxuTwDTOMj7348gn3qOx/lMu8wctMJ2mTpL6CyM93oP3gr4FPQ
 NpxcBvGTEU7KvtdoPZj5x5eOB5EfJCPjffnV9/VvRgrle10xSm+wlv1gOf7NdpnaGYQds59dicu
 k9PK/tM6NAchxDQYbYjmytvMwYaCfl9RZ4Kx8YxkgTF15IPDuBoFj1/t2dd0O3LA5vX76z8Fkfd
 MM
X-Google-Smtp-Source: AGHT+IFfD9HsF7FqbaESN2pnc246EJv3rXr5HhEjF+jNN29SEyjNSNwTIPXIbDCmq6PWwXOGmfsr2g==
X-Received: by 2002:a5d:5489:0:b0:400:818:bae9 with SMTP id
 ffacd0b85a97d-41358a344d7mr7300210f8f.32.1759141604137; 
 Mon, 29 Sep 2025 03:26:44 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc6921b7dsm17448312f8f.42.2025.09.29.03.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 03:26:43 -0700 (PDT)
Message-ID: <dd509e6e-b3ff-4b8a-a2f8-d3991066405b@linaro.org>
Date: Mon, 29 Sep 2025 12:26:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/47] AMD Versal Gen 2 support
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20250926070806.292065-1-luc.michel@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250926070806.292065-1-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 26/9/25 09:07, Luc Michel wrote:

> Francisco Iglesias (1):
>    hw/intc/arm_gicv3: Introduce a 'first-cpu-index' property
> 
> Luc Michel (46):
>    hw/arm/xlnx-versal: split the xlnx-versal type
>    hw/arm/xlnx-versal: prepare for FDT creation
>    hw/arm/xlnx-versal: uart: refactor creation
>    hw/arm/xlnx-versal: canfd: refactor creation
>    hw/arm/xlnx-versal: sdhci: refactor creation
>    hw/arm/xlnx-versal: gem: refactor creation
>    hw/arm/xlnx-versal: adma: refactor creation
>    hw/arm/xlnx-versal: xram: refactor creation
>    hw/arm/xlnx-versal: usb: refactor creation
>    hw/arm/xlnx-versal: efuse: refactor creation
>    hw/arm/xlnx-versal: ospi: refactor creation
>    hw/arm/xlnx-versal: VersalMap: add support for OR'ed IRQs
>    hw/arm/xlnx-versal: PMC IOU SCLR: refactor creation
>    hw/arm/xlnx-versal: bbram: refactor creation
>    hw/arm/xlnx-versal: trng: refactor creation
>    hw/arm/xlnx-versal: rtc: refactor creation
>    hw/arm/xlnx-versal: cfu: refactor creation
>    hw/arm/xlnx-versal: crl: refactor creation
>    hw/arm/xlnx-versal-virt: virtio: refactor creation
>    hw/arm/xlnx-versal: refactor CPU cluster creation
>    hw/arm/xlnx-versal: add the mp_affinity property to the CPU mapping
>    hw/arm/xlnx-versal: instantiate the GIC ITS in the APU
>    hw/arm/xlnx-versal: add support for multiple GICs
>    hw/arm/xlnx-versal: add support for GICv2
>    hw/arm/xlnx-versal: rpu: refactor creation
>    hw/arm/xlnx-versal: ocm: refactor creation
>    hw/arm/xlnx-versal: ddr: refactor creation
>    hw/arm/xlnx-versal: add the versal_get_num_cpu accessor
>    hw/misc/xlnx-versal-crl: remove unnecessary include directives
>    hw/misc/xlnx-versal-crl: split into base/concrete classes
>    hw/misc/xlnx-versal-crl: refactor device reset logic
>    hw/arm/xlnx-versal: reconnect the CRL to the other devices
>    hw/arm/xlnx-versal: use hw/arm/bsa.h for timer IRQ indices
>    hw/arm/xlnx-versal: tidy up
>    hw/misc/xlnx-versal-crl: add the versal2 version
>    hw/arm/xlnx-versal: add a per_cluster_gic switch to
>      VersalCpuClusterMap
>    hw/arm/xlnx-versal: add the target field in IRQ descriptor
>    target/arm/tcg/cpu64: add the cortex-a78ae CPU
>    hw/arm/xlnx-versal: add versal2 SoC
>    hw/arm/xlnx-versal-virt: rename the machine to amd-versal-virt
>    hw/arm/xlnx-versal-virt: split into base/concrete classes
>    hw/arm/xlnx-versal-virt: tidy up
>    docs/system/arm/xlnx-versal-virt: update supported devices
>    docs/system/arm/xlnx-versal-virt: add a note about dumpdtb
>    hw/arm/xlnx-versal-virt: add the xlnx-versal2-virt machine
>    tests/functional/test_aarch64_xlnx_versal: test the versal2 machine

Series:
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


