Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BCDC83F17
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 19:52:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ublgZ-00073L-R7; Tue, 15 Jul 2025 15:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ublHd-0006os-5Y
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 15:25:50 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ublHb-00074h-Gy
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 15:25:44 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ab112dea41so3232907f8f.1
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 12:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752607541; x=1753212341; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=epbtau3mfk9DJMdMl9jVXDpnXezgjmAx1/t4HCFUui4=;
 b=qYhXzhGbHiNhlvI5cnfoaVbLpmVAqEHbVmrMWJLwrXZmPT6eWLtnOVsoQwJDb3VEEF
 3yHYB7Lksppm0rQhhALzJzMkyqRBWXxdHyhqwBjZ9hbtShEqNpiPJarDnb3Ih8faQKVe
 J6bn364VeJ88yllqd1bic422IjHmC9+P3LOGt+YZKRBlD75OrkLeX0qxmGLOKvN/Q/pt
 5QrzhRVdQsDyq9wZdd6gbC5cHKlJf9uky1CD6cVP5VIFZFo2LDmLq6L5522ZMAShKhtd
 iKGzYBWD9qmcCX8CFYctawWZ4r2dsNXhnXKu5tyHU/5Qf4dQXS4cFnLmQjDC0/TXDx6/
 qlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752607541; x=1753212341;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=epbtau3mfk9DJMdMl9jVXDpnXezgjmAx1/t4HCFUui4=;
 b=E+SD0SiIm2BBdYAdYQv7vAXXsNFPUG7qvieLzYgCovNOXVVyM3m6OZtoS2+t7NZoN3
 7Mz+FwA7IhiK08295lsFQmI/Oshg6sr+BD+4AIclvMTeySR9U9e8/VL39t3uhE6apU0a
 t07agA10Pw9NUzNMilhmxG75WGImxGM2rcN7+8f8OnwQKODfbmJXQy46Ib9VRmyDHDtQ
 HvYkkD66/cx+yo0Zi/7QjrtgmT12h3uCP6eyxzmhBZh35oxU3bhsA7dkYu4b85mJWYHX
 txLMJZe+NwylkHdZe6raTxFNbn1NTX6mpI3I6i6+pcDeD7ZtlLysOS/VU0WbjxW7XYc6
 cBcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc2rRO3NzxrXP4ojtWd4Hg3/qYcx93iZHyeeaGrtebhn6qolxYkChGjPVcCxpKPJk/AzYopN6msQ==@nongnu.org
X-Gm-Message-State: AOJu0YxzFbmw2j9c9hieKAnS1AGVC29XdbqHgHkUG2/pCR0MlN6Ab/el
 SYq6kXQ/5HlPrQyjTbX+vsDDNlBiWnIYZq3m7HeT9HJLgMqdunZaHWxs/JIWgq9q0tM=
X-Gm-Gg: ASbGncv2rYVYQCpvZZgyfbZ2IK1e/biri9XTiWLPHaSl5G3Aq1XrtJn8HuzCXhMQ79u
 /OoANopQbyXgGR0/Ha6JDXY0KT/4OEy67jM56Zy1lSBMtru69jX3tXIcqlLNKAY0yb/j2seykoN
 P3/+rRapp86wH7kZ7oa9p3IrZaWGS0XA1uG9p46PUFtl3j9z1eJBF66GYxdh/yfE5G0dpWzsehf
 hUGtOuzQlOBkGPOTCqcEtGDJ1paBSYQ6iNTciKU4rJ/R5HkD1vqq7KyHpQ2oXXf8qrLdxPuevQy
 hMk9+7hiK+uBLq24hj2lvWwCPVK2NhLU9+J0DPMKSLa2iJHf7WY1HrMTdEtG1l22SVVpuqHQB7C
 FGy4zfgHCQokJUc1Eh3Y9RPHeE69gTlMPGPCcJe/rrlywbT7EQYtXKIKlwHWLrYr5ACCstMo=
X-Google-Smtp-Source: AGHT+IFpze0b7WsXfdePVDOr1+gg0YPpVi33rfy6T+pguMPneExVvnAdiPASoy/Fln+H+OoB9yKF3g==
X-Received: by 2002:a5d:5e8a:0:b0:3b5:e6bf:5e0c with SMTP id
 ffacd0b85a97d-3b60dd95baemr277349f8f.31.1752607541370; 
 Tue, 15 Jul 2025 12:25:41 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5032e9esm208334115e9.3.2025.07.15.12.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 12:25:40 -0700 (PDT)
Message-ID: <98715ba8-a2b2-4a07-9cac-cc6a40a9f7aa@linaro.org>
Date: Tue, 15 Jul 2025 21:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/xen/arch_hvm: Unify x86 and ARM variants
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250513171737.74386-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250513171737.74386-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 13/5/25 19:17, Philippe Mathieu-Daudé wrote:
> As each target declares the same prototypes, we can
> use a single header, removing the TARGET_XXX uses.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/xen_arch_hvm.h  |  9 ---------
>   include/hw/i386/xen_arch_hvm.h | 11 -----------
>   include/hw/xen/arch_hvm.h      | 14 ++++++++++----
>   hw/arm/xen-pvh.c               |  1 -
>   4 files changed, 10 insertions(+), 25 deletions(-)
>   delete mode 100644 include/hw/arm/xen_arch_hvm.h
>   delete mode 100644 include/hw/i386/xen_arch_hvm.h

Queued, thanks.

