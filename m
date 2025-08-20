Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F5CCA0EE4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 Aug 2025 12:30:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uohxS-00036h-I1; Wed, 20 Aug 2025 08:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uohxP-00034u-Vy
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 08:30:24 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uohxN-0002uc-H9
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 08:30:23 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3bb30c72433so2218452f8f.3
 for <qemu-arm@nongnu.org>; Wed, 20 Aug 2025 05:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755693019; x=1756297819; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nuuc7lpR+hOx7mlCMzaenxMc/SuZ/aErgHzx/AwYUCc=;
 b=yfwRD3J3jXS92nWXxCRJdla1+BhQM0M1v0BRSv3WDJreUnLhuXvlpHzE8fnVUXgV6v
 qfL2vLlAykfHz91dh0yC642naTveniUFbPue60gmo2mVKUDsDAxSonYOsAweMGjPOcPE
 YhTWTWbLgtaVH17m/ZiA44C9on/ZD1hUxyzpuedR0z4a2vnAR0Yxvco2CsZ4CFpwyRF1
 9awSQ36VGNLzixOIVvg5Fi2/TByPqt61vSlxCjA0pLH2YgM4e4xTuc/CPiUz05H+ClDU
 v1MRgjJOdE0aaIvS7B2+SBmO8k73brnbMfY7CBdjGVdwnxQ9CaUHSqtZGwobXBpGNR/5
 zl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755693019; x=1756297819;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nuuc7lpR+hOx7mlCMzaenxMc/SuZ/aErgHzx/AwYUCc=;
 b=tTorfwdZ9e6CjE7AATO3zyt/InS9uKipYfTFL3fc9xBRoKzreh+aYEv0ctbw0dOjik
 CgVg13miK1AY7Zq2LoPI5VC4zSqqdoFpBC9W41yJV+mgGNEFU0PIgs4rZSvWxA/vZdIK
 HuzFABJtC4fufZHiAHkNEYmrN8IsZ6EV0vpGTOvGtkx3F0SHNSvnbNcnlsREvopharqH
 N7UecnwRD/r4g29NNN3YcSLslLrHiDDaxjBwjgmUEEW6VpI+fkAMRqdAX268Y4aBctSO
 F30/RVPJ45DJmTLEV7EmyNRCMWUFsehbtNQE0JO7fNJFke0KkuMa1PJ92gt6cGg6eNq5
 rjZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnsLcbimRzKJRWIx4YLqaeKwLU3yzHF93P1fQDGtxXNoIu2qfDvX4VRpjWfQJKNklDyUnx62/A+w==@nongnu.org
X-Gm-Message-State: AOJu0YwPrrmco0B0NvSTcGSIp2GkSKy2iu0csVxNKy4LT9FarzDtIIir
 IGBjRiMEfNnrFn0A1EguRscaKcgY+n8hou2PTth2wIbJQP16TPQF0DzW5iRnUriu6R1YOmwg3bM
 B6nSO
X-Gm-Gg: ASbGncuxaou05/rd4azV3fjLVQVGEfcWhQwTKsd7m0Eym/DLJpQrWHrMBAlKz/xbDex
 NozmORoGemCRzChT1+SDf5isQSHbZqDLKAxJ5fpLyCbmDCvOTLfwOKzF0/8U7V8WLDLw4nBl3Mw
 3yWA0wVcgak6Fb4Njl43Jfs+OeKhc+ohI/ylHDjpc5Gx0c6pTr/4P2xm8M8fF8VdLocsjmIYtcf
 pcLBOUHNblbNfOw+l/E6rtLYvCjBpzUqV2cF0pvcuDlDDBMG0DjhFbZSUWkje7n3iD2S0kT2uKG
 cjsHwusyEPfK6x+re+c0g0haecpcPtUL5AUjAJB8fx20t+QQbBB+MLsYyjnkL4+vEVE158hD/4M
 Vy41pOeAA35azq3btDTxxDB5BeIgXeYthjAySIgZwaXekI1MaLGHeAijg99yT8L3bD1WY2iw=
X-Google-Smtp-Source: AGHT+IHHN5wTmuWxeU1gF6ZOOcjvSxrbRh++kDhXWGUVVWbMQpSiHbDjjNgZVGIKsDBwI3309C7XCg==
X-Received: by 2002:adf:efc5:0:b0:3c3:973a:fe40 with SMTP id
 ffacd0b85a97d-3c3973b03b0mr1297084f8f.58.1755693019216; 
 Wed, 20 Aug 2025 05:30:19 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c0777884e8sm8224084f8f.45.2025.08.20.05.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Aug 2025 05:30:18 -0700 (PDT)
Message-ID: <a6a9b8ab-9de5-4d2f-a9eb-7ae9a638df36@linaro.org>
Date: Wed, 20 Aug 2025 14:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 41/47] hw/arm/xlnx-versal-virt: rename the machine to
 amd-versal-virt
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20250820082549.69724-1-luc.michel@amd.com>
 <20250820082549.69724-42-luc.michel@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250820082549.69724-42-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 20/8/25 10:25, Luc Michel wrote:
> To align with current branding and ensure coherency with the upcoming
> versal2 machine, rename the xlnx-versal-virt machine to amd-versal-virt.
> Keep an alias of the old name to the new one for command-line backward
> compatibility.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
> ---
>   docs/system/arm/xlnx-versal-virt.rst | 26 +++++++++++++++-----------
>   hw/arm/xlnx-versal-virt.c            | 11 +++++++----
>   2 files changed, 22 insertions(+), 15 deletions(-)


> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 0f114ade652..4495b20ee1c 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -1,7 +1,7 @@
>   /*
> - * Xilinx Versal Virtual board.
> + * AMD/Xilinx Versal Virtual board.
>    *
>    * Copyright (c) 2018 Xilinx Inc.
>    * Copyright (c) 2025 Advanced Micro Devices, Inc.
>    * Written by Edgar E. Iglesias
>    *
> @@ -24,11 +24,11 @@
>   #include "hw/arm/boot.h"
>   #include "target/arm/multiprocessing.h"
>   #include "qom/object.h"
>   #include "target/arm/cpu.h"
>   
> -#define TYPE_XLNX_VERSAL_VIRT_MACHINE MACHINE_TYPE_NAME("xlnx-versal-virt")
> +#define TYPE_XLNX_VERSAL_VIRT_MACHINE MACHINE_TYPE_NAME("amd-versal-virt")

While the alias works, can you also change the machine name in
tests/functional/test_aarch64_xlnx_versal.py in this commit for
clarity?

