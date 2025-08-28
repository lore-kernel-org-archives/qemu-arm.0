Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF29CCA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:55:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usOeG-0007Qb-68; Sat, 30 Aug 2025 12:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urkjx-0005fV-Ky
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 18:05:05 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urkjv-0003L2-9v
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 18:05:05 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45a1b0c52f3so8758305e9.3
 for <qemu-arm@nongnu.org>; Thu, 28 Aug 2025 15:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756418701; x=1757023501; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u4K+eWzK88L/l8rxX7vzJ5F8HAu28QXPtpWi+TLyHio=;
 b=jQB3eShYAk6Ts1CQf8MGPyEBJGweiC16IJHEJmVKyVUasW7308566zVSBN+cXppi+Z
 JtzZ1UiYZCY27GPvcLbYutZ6bo/Lje2wzNsoUuydDpwUI7T4hQ3s/ocHKflMHJohlrOv
 FjxFwEDlR0DdXjfQ/mu1BIh1usJAI8YRm1SkAV4t0u8i882J/+UGWpfvwYzcMK3s7dWG
 +zI0dXFxYKSLPdKXMpAQlSxCxPlp5N3M1edNd9i3sdEKj2gcjqrIw+m7CM9Zit55LmOu
 mh2D01/OfqSwCN/rtde3dbGXG93RAdWUpjDI+kER7NkIWOT8Mll5E0PZBi13krgxDxZW
 lGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756418701; x=1757023501;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u4K+eWzK88L/l8rxX7vzJ5F8HAu28QXPtpWi+TLyHio=;
 b=pSOi723rrT02RPyKjJZktXJN7sRAKsVG1yjbaplYclEOY7+JGam0sYwuX/h8aavgJk
 sZkv/1vmPqWMRCyzgbwOJZ2piGIDOKsZ5rSf54yKKRoRIlvH1hM50O/deFC2WeYdo5ow
 jcXsVUowHAh3u9rC7ayxPDBAeTrBks8Yf+yvyfpXCuUtNXy/g5DkjUNx4YvYfOandugr
 s0Ep0o8Ro46wV3fPF1AtUrKdpdHmyJCLGkwsfmW6F4hhuxuGPT4K5bQc7YB0uPbWy9w/
 QlVhSVYkqhRThv29iU0zRcZHpYzuotHsBiWL3FHLN2LXErhet5sFLHwevEe3cU0ygzDx
 Tksw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPspcCLIaR34L3vgNBUUPTP7/YOFZFb62IOqTXUdsA/+7XcWbui950UDSsFcUTtyqthEYg7fsUJg==@nongnu.org
X-Gm-Message-State: AOJu0Ywx+U0aU62s5d3v72u+TO+68anaLht5d63yzX+2DYtKnGL/SQux
 E0Mz7L0JIo37uH/UCvhsR2RbQ64z+a7m3cKSffdyrKsHXj1hbIYgVBZ5mQqQJ/v1ah0=
X-Gm-Gg: ASbGncs1nvRFEsFfS0XaTypw9k+l779XQTXrxQAkHDjcFYSzsC8zFSmgxEYuMSujZuu
 yo/Y17ScSCEn1VLxkjVIP6PAafhD29TO3BsfOm0Lt7SsYCcG/FiVlOu+sCvJUm22E05TENS22NR
 Sz0eiDbzQ/TdC6ksPK0dZ2UcYZ//RIk61Men+O0BCbYbDSz6kwdyg+Vlo4YJcX7T6aLCRlcFxqv
 NnUPKdr4MOAOe1ms95rTSfWJDT+a/0ZHUOI/rUvEg9UxGWgbEY4cB9FRgaapKIeXNf6ILm/X4Ht
 +jHQmY8XvmhlpQ5rEld5E3n3hqJHOWgUDn11ksUjWHIgpKkzxXTcCDBweQbJjrbrR90ityhpAB4
 gJmBM+ymS8vnpDkdyJ8g2xScYoo40KbV5WkyhF/lWwIYAUMtelYBFzbBIbHz7sKY4Cg==
X-Google-Smtp-Source: AGHT+IEW8/4xQuWFGgJtc1ykUI19JormtQ244fCXfHvBPu8h+HzsOIGsiBq7ltSgFPUiu6HPXxH2mw==
X-Received: by 2002:a05:600c:4e90:b0:450:d37d:7c with SMTP id
 5b1f17b1804b1-45b517cb8b3mr199084225e9.21.1756418700647; 
 Thu, 28 Aug 2025 15:05:00 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf276d5e5fsm814066f8f.27.2025.08.28.15.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 15:04:59 -0700 (PDT)
Message-ID: <03c4a8d0-6246-418a-b55b-d7047b7844c6@linaro.org>
Date: Fri, 29 Aug 2025 00:04:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 40/47] hw/arm/xlnx-versal: add versal2 SoC
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20250822151614.187856-1-luc.michel@amd.com>
 <20250822151614.187856-41-luc.michel@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250822151614.187856-41-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 22/8/25 17:16, Luc Michel wrote:
> Add the Versal Gen 2 (versal2) version of the Versal SoC family.
> This version embeds up to 8 Cortex-A78AE cores (split into 4 clusters)
> and 10 Cortex-R52 cores (split into 5 clusters). The similarities
> between versal and versal2 in term of architecture allow to reuse the
> VersalMap structure to almost fully describe the implemented parts of
> versal2.
> 
> The versal2 eFuse device differs quite a lot from the versal one and is
> left as future work.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
> ---
>   include/hw/arm/xlnx-versal.h |  17 ++-
>   hw/arm/xlnx-versal.c         | 207 ++++++++++++++++++++++++++++++++---
>   2 files changed, 209 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

