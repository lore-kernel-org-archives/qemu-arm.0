Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EDFF8E4A7
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 06:24:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDccA-000803-LV; Fri, 17 Apr 2026 02:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDcc9-0007zM-2K
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:23:41 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDcc7-00065r-8k
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:23:40 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so2279625e9.0
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 23:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776407017; x=1777011817; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TSAFGKcWXwWRumwKLaW02KedM46CTeUlkHFKmLPuTmM=;
 b=h+cQ+4LZzsdt0oyUii7TyvFD2T2IBgpqePTk08brvKcsio7fxNpTh38sV84VgIacG4
 4K96cm2wYV4FFCDD0H7t1UPEJ3rJj54l0/dUAxETfz2NoCMR5B6S7OGM52MjQwQ/XZnE
 DjZPc3BfTzpZsm97eduCWKyD23jWpXHtTiGxduhJSbkLAGhNgdqe435cN2SPUEFJixsO
 ORbAcwC5GxEgavbjtaxSFa84g5NUWKQdN2GZt/No4ljPE2r5NdMTETBUXSjAh0XmYsm5
 8NbLYMzmvGyau3Z+sKT0xcrzzwfNE+zqQNHWRFrUBMvhGbTKZADSuzjTEYvePq52jXNw
 7UAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776407017; x=1777011817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TSAFGKcWXwWRumwKLaW02KedM46CTeUlkHFKmLPuTmM=;
 b=X7D53OfP7psCXI4Y5xiZkt9ybvkZxT5PVKUniExyU9ralFif2FD/fP5xXPe5vA2Qrc
 5FEMAZQY/RGN7DsxaG1Gy8Sa2AeywgVmj5cYbrL8O/tqkb6RnAw/HGa0anktV9I4ysZ9
 zPZZi6afougIYQ5lz4qcAyQmnu2LJOkiCmSgQXFUeFX/haH4Ze6AoJtY3v+zkCT1xbjm
 ymWF3T8QoCLYdhVQa0lWwHJfLtEajIIc2+vBPsDW0HIQ1s2+qCEdgoY0jUop9OFAjfse
 f0iRPYJNsasg3EkYKDgyMhrFfGLXwNpcWzQDCO3XgOVEC2f31KTuh/Cttsps7QQBbSKp
 MXWQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8NlQF2y4VGaN+8rHWN8dug3u8oZ035Vwq8noSyoOIUE7G4tA92httAdyY/IwPYwBqZ00iaeAa/ig==@nongnu.org
X-Gm-Message-State: AOJu0YyUXc2ofChEAohMrOpgC1+LVrWg2VEDcPE2AKVyT8j8GfL4osk3
 ILToogQmaSCVGlfwkYwnkbVj0/xBY2Y44EYMXUPUINC63P6xNZ4mF/fidLMi5MHfs8U=
X-Gm-Gg: AeBDiesRaeSASGlvSf0sHflMB2BU/IdJ+198SWKX0hzb8M/DqUhhDsFoqTtVNNP14T1
 Lp9o2DcNMWY5GuXqN08NeVPLLwHQPPSDmN0sgVjRlpk7cj40TCkHe5qqRr4HtOqpjfwpVfNWZIJ
 nqmGnrjedlo/uhmoSzWffg5FAeLWLkeEW76ImGwtIZtN8ZaFXO/YCwBguOCOFvndA/WWRW0J4Li
 4xj0TJ6QlQh3aEruaow/P+5Ntgq9FXgniRLm4OUwlORLTIOw1ixyYh1xCteeKGf57u5ZHDVOypf
 w2p9GZm0OUsQ0AwBs4tTLyxUCs2TKXBF8qwkolswwT8bVuX+RfvnR0cLKA1BYKbnz+LhMg7x6o1
 QR5weHmt8kyRRmzTUJySQn2WJ+ehUHqPEc0J1k+vWGTz+o2opDvHCofYE6Dwe5aodksTQjmGL/5
 GigXXG5kEKXRYRlxNlYHtYp+K2Urg+La+tiaSQoYVi33T+dUcv9JLgj8psiyEL+Lqgk0ZhwycRf
 ZC5
X-Received: by 2002:a05:600c:1385:b0:488:c085:22ad with SMTP id
 5b1f17b1804b1-488fb78a39dmr18859905e9.29.1776407017459; 
 Thu, 16 Apr 2026 23:23:37 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e46898sm1833867f8f.27.2026.04.16.23.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 23:23:36 -0700 (PDT)
Message-ID: <6b535f08-8ee8-4227-9dfb-3d4914d825bf@linaro.org>
Date: Fri, 17 Apr 2026 08:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/17] hw/usb/hcd-ehci: Add descriptor address offset
 property
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260416014928.1279360-1-jamin_lin@aspeedtech.com>
 <20260416014928.1279360-14-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260416014928.1279360-14-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 16/4/26 03:49, Jamin Lin wrote:
> When 64-bit addressing is supported, the Linux EHCI driver programs the
> segment register to zero. See ehci_run function:
> https://github.com/torvalds/linux/blob/master/drivers/usb/host/ehci-hcd.c
> 
> The driver comment also notes that descriptor structures allocated from
> the DMA pool use segment zero semantics.
> 
> Descriptor memory is allocated using the DMA API. The platform driver
> configures a 64-bit DMA mask so memory can be allocated above 4GB.
> See ehci_platform_probe function:
> https://github.com/torvalds/linux/blob/master/drivers/usb/host/ehci-platform.c
> 
> On AST2700 platforms, system DRAM is mapped above 4GB at 0x400000000.
> As a result, descriptor addresses constructed directly from the guest
> EHCI registers do not match the actual system address used by the
> controller when fetching queue heads (QH) and queue element transfer
> descriptors (qTD).
> 
> Introduce a descriptor-addr-offset property so platforms can provide an
> address offset applied when constructing descriptor addresses. This
> allows systems where DRAM resides above 4GB to correctly access EHCI
> descriptors while keeping the default behavior unchanged for existing
> machines.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/usb/hcd-ehci.h        | 1 +
>   hw/usb/hcd-ehci-pci.c    | 2 ++
>   hw/usb/hcd-ehci-sysbus.c | 2 ++
>   hw/usb/hcd-ehci.c        | 7 ++++++-
>   4 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
> index 6406f536e8..05d8db4a5d 100644
> --- a/hw/usb/hcd-ehci.h
> +++ b/hw/usb/hcd-ehci.h
> @@ -264,6 +264,7 @@ struct EHCIState {
>       /* properties */
>       uint32_t maxframes;
>       bool caps_64bit_addr;
> +    uint64_t descriptor_addr_offset;

I note OHCI uses "dma_addr_t dma_offset;" here.

>   
>       /*
>        *  EHCI spec version 1.0 Section 2.3
> diff --git a/hw/usb/hcd-ehci-pci.c b/hw/usb/hcd-ehci-pci.c
> index 2ea8549db9..115d05ede0 100644
> --- a/hw/usb/hcd-ehci-pci.c
> +++ b/hw/usb/hcd-ehci-pci.c
> @@ -139,6 +139,8 @@ static const Property ehci_pci_properties[] = {
>       DEFINE_PROP_UINT32("maxframes", EHCIPCIState, ehci.maxframes, 128),
>       DEFINE_PROP_BOOL("caps-64bit-addr", EHCIPCIState, ehci.caps_64bit_addr,
>                        false),
> +    DEFINE_PROP_UINT64("descriptor-addr-offset", EHCIPCIState,
> +                       ehci.descriptor_addr_offset, 0),
>   };

I note OHCI uses DEFINE_PROP_DMAADDR() here. Single use, maybe better
remove it and stick to uint64_t as you use.


Could we have a DEFINE_EHCI_COMMON_PROPERTIES() macro for common
entries instead, such DEFINE_SDHCI_COMMON_PROPERTIES()?

>   
>   static const VMStateDescription vmstate_ehci_pci = {
> diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
> index 61215e9f3d..df138fb339 100644
> --- a/hw/usb/hcd-ehci-sysbus.c
> +++ b/hw/usb/hcd-ehci-sysbus.c
> @@ -36,6 +36,8 @@ static const Property ehci_sysbus_properties[] = {
>                        false),
>       DEFINE_PROP_BOOL("caps-64bit-addr", EHCISysBusState, ehci.caps_64bit_addr,
>                        false),
> +    DEFINE_PROP_UINT64("descriptor-addr-offset", EHCISysBusState,
> +                       ehci.descriptor_addr_offset, 0),
>   };



