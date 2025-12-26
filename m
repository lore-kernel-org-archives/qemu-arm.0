Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F29E8FDBA
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Dec 2025 22:57:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vZGjj-0006bE-7G; Fri, 26 Dec 2025 17:56:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vZGjY-0006ZZ-Ez
 for qemu-arm@nongnu.org; Fri, 26 Dec 2025 17:56:34 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vZGjV-0008Fg-Ed
 for qemu-arm@nongnu.org; Fri, 26 Dec 2025 17:56:31 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42e2e3c0dccso4603624f8f.2
 for <qemu-arm@nongnu.org>; Fri, 26 Dec 2025 14:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766789787; x=1767394587; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hkQfc3ddBs6MuBO1D5R2nJ8GEB8SM5gj7UXsd8Uz6Eg=;
 b=bWjO0JbbHwYH/zPas9Pqhhz5TlVPtAi59bOrO6vDpuxg596+oF9m5Y9YzNgoC4AK5e
 1KeluQG1jIuLq54WuCU/KAn/I6pP8mfNxmCu6iXUh1YJAJYbBGL2Sp8LV+daBCBa/iOj
 O5JE780DrzGpffcprNUZvwQr2WN90VFFE9qhNgLqbEju5iW7BGfIAHihxuHpHdwOOShv
 YaplEcDb11fIgUa43IpO+zHASSg5dz2R8fA9CUKnLrWZpSm7FSYcRkQC3+DPX4zVDsF2
 s133DjazOuRKVFYk/lLrxL5vsvTtCNn7ckXh27vaEQkFoRI4HTyeiLSqyXTyv+zvwu3D
 n4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766789787; x=1767394587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hkQfc3ddBs6MuBO1D5R2nJ8GEB8SM5gj7UXsd8Uz6Eg=;
 b=oYQaWL6waKR/G4V8HP5EV7R7bbiCnh+lhE/ncfiD1mReMhz+4I8ZSjJb1cWkHx+X6P
 WtfMcPprlYaMWu8ox1TWgDOBtWuzpVamZhw4OYiOBu5IhNm7jSrIVQgTEtfEIb2roVeo
 t49jXwUmf/2/e2fNcjCgXuNJncRKP1f5jBJrt/y10RGPj9G/JaZglt8b+hDvhjrRuUcb
 a0Gk6eyA4Prpqs7JvmtpZFhco0cv3EdOiiJcamweLrpbFpCKJbO918Ovd5+8AqpvQETM
 QOwFf+a2tRJEjhMiX+EPx2iVUkEUs81XHs/ZDpTq4c/18XLjK25lv54+vBNn4I5mzzYJ
 6Pnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7UEVcJgzcOK3BA3m7JO5errmxv+RAeKF2i+ENo1MmxhgSyibaCObWXk1KqymhF2swTblnJLI/JA==@nongnu.org
X-Gm-Message-State: AOJu0YyiH1oBLlZ4IOk6omJ9OhsaymCVp8iVM6Mqg/IL4HAj6GYeM9+H
 pYtr/i4shPKDMK83EmDK4lkHVLIFYo20nnRjOj/NFqVjl21dBoTxDTx/tKQ4NKEe+7I=
X-Gm-Gg: AY/fxX5yN9rGKcqW+ym21Cb59XaIZoIqo08og/VMAGfFn4p9YoaQK5nj9uTkbm0ybVE
 hc6fJ2kIFUk+cjW+J9cCrXGdIOA85UmuIYEr4fDtHrGI4LHxnWXPPflYxj+bYxfLOCTghpu/Xwe
 v9Cxm5BoLePckRETWE3AwwgRcFHRjU8V03inlBK2ucvejdLxR6W0dg/myMKBqHoCcoJEvPhg/Mg
 yIhyRp/lqgeDRG54RyM/cJts9iT1T9dW8U7RmweELNA4CKGhGEopO08aBicePjHN2nc2As61Lws
 M2ICiVCOVMBH4ryAlYLDMjLgUJy7SoCqIUFYaSrV3nV726rQlxXgYDGj794s7e+If5FlhHExuZN
 HHn5rOv2+vRPVaZje001L5i7OeUSKsPfSYcfLe4wXP1ZMHoiR4qZQlBfN8SIffLKYgzkfrTlECU
 cl3PDhkatzwI+hpTTwV+14ApHdmo3Y2waUeag/V/KfQq41GWZNVtKCTSXlA19djw==
X-Google-Smtp-Source: AGHT+IEVFU6F2IMhjUkwHBfuPAJeQduVfJHBqcgarb7dYugu3WatLV5De2/5fnf6SDTGKXJfX4cyMA==
X-Received: by 2002:a05:6000:24c8:b0:431:a43:ee88 with SMTP id
 ffacd0b85a97d-4324e50d4f5mr31926490f8f.42.1766789787447; 
 Fri, 26 Dec 2025 14:56:27 -0800 (PST)
Received: from [192.168.1.15] (alyon-655-1-564-32.w80-9.abo.wanadoo.fr.
 [80.9.105.32]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa0908sm47250450f8f.31.2025.12.26.14.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Dec 2025 14:56:26 -0800 (PST)
Message-ID: <f3c919df-076c-4f19-ba28-686c713fc53f@linaro.org>
Date: Fri, 26 Dec 2025 23:56:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v8 3/7] hw/misc: Introduce iommu-testdev for bare-metal
 IOMMU testing
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20251224034647.2596434-1-tangtao1634@phytium.com.cn>
 <20251224034647.2596434-4-tangtao1634@phytium.com.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251224034647.2596434-4-tangtao1634@phytium.com.cn>
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

Hi Tao,

On 24/12/25 04:46, Tao Tang wrote:
> Add a minimal PCI test device designed to exercise IOMMU translation
> (such as ARM SMMUv3) without requiring guest firmware or OS. The device
> provides MMIO registers to configure and trigger DMA operations with
> controllable attributes (security state, address space), enabling
> deterministic IOMMU testing.
> 
> Key features:
> - Bare-metal IOMMU testing via simple MMIO interface
> - Configurable DMA attributes for security states and address spaces
> - Write-then-read verification pattern with automatic result checking
> 
> The device performs a deterministic DMA test pattern: write a known
> value (0x12345678) to a configured GVA, read it back, and verify data
> integrity. Results are reported through a dedicated result register,
> eliminating the need for complex interrupt handling or driver
> infrastructure in tests.
> 
> This is purely a test device and not intended for production use or
> machine realism. It complements existing test infrastructure like
> pci-testdev but focuses specifically on IOMMU translation path
> validation.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Clément Mathieu--Drif <clement.mathieu--drif@eviden.com>
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> ---
>   MAINTAINERS                     |   7 +
>   docs/specs/index.rst            |   1 +
>   docs/specs/iommu-testdev.rst    | 112 +++++++++++++
>   hw/misc/Kconfig                 |   5 +
>   hw/misc/iommu-testdev.c         | 271 ++++++++++++++++++++++++++++++++
>   hw/misc/meson.build             |   1 +
>   hw/misc/trace-events            |  10 ++
>   include/hw/misc/iommu-testdev.h |  68 ++++++++
>   8 files changed, 475 insertions(+)
>   create mode 100644 docs/specs/iommu-testdev.rst
>   create mode 100644 hw/misc/iommu-testdev.c
>   create mode 100644 include/hw/misc/iommu-testdev.h


> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index fccd735c24..b5f6fdbd9c 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -25,6 +25,11 @@ config PCI_TESTDEV
>       default y if TEST_DEVICES
>       depends on PCI
>   
> +config IOMMU_TESTDEV
> +    bool
> +    default y if TEST_DEVICES
> +    depends on PCI

        "depends on PCI && ARM"

?


