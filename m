Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609A1FDEE50
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 21:11:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG1KQ-0006uT-5o; Thu, 23 Apr 2026 17:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wG1KJ-0006tU-1h
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 17:11:11 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wG1KG-0000oz-LD
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 17:11:10 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so87685595e9.2
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 14:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776978667; x=1777583467; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xf4e2tPMUiv5P95Z/xnw7mO0jVJQzPQ9bRvycsodzvo=;
 b=tU6uhbFURPYZtMbswAFxLnAI/k8LlLtvndDaryh+V5bQ2h3/X17+hkuVyOshclKm2O
 va8GyyYKjqZC6PkAG+YzdR/L0fgcVuV53vuXQEIVsvNgr9GNiwn5DpKQJB3b0oDmtEqz
 Z4ioCJ/8KPUYZr0j+xLSkUKS/Jj5Z46tIZ1ZrILUHO4/Bl18yRTnxh2fuB42joPN97N5
 7+/+TOKo5bTjq3JwzDfh2Ho4T3C8E5hBqD0dyFl4a23B+/rsusOUbRkTJyb0SqnPPLB/
 S901HB0efbgW5Nlr6Pah1SiBWp322ztvfMQd9xPQzllRYKe+vSzj776nkYAjJDN+hMJ5
 GHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776978667; x=1777583467;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xf4e2tPMUiv5P95Z/xnw7mO0jVJQzPQ9bRvycsodzvo=;
 b=S/Aopith6F6GoO8SNXrJ05hqFbwqXE+DGjkp9D5D9d8ZPkumVlEP4jzKc1+Ib5qJVs
 IRkEHC00mFffeeJz73Rzc8b0SlJFtYA+mm9iuHLZaLu3ypj13ahpPIAC50eAga2M13fb
 tOuFRcBhHHxKzG1eZ8RsDAbfsmjhXGF7+01eKI4JzZhUYbgast5gtsvbcC1F8oD9ZILd
 Djn1etg0cWurRbKdxs0rGvTGCcY1uwE16SxwKVb327/aFoBIgTeRdIPHaaWleHJpRlg8
 Osm+mUsEsV6wHCXyEB98tMMk+7lsh/gVUBuW2l/3evEd4PixDjKZ+jxXZsKOu932aQ2x
 1JGA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8+xttHn3RGX0ZxXoIs08fdiROBpUL+3b0YzlvGy7fv/AdqRoCD3EC46rkkkwnz6YPIRwIGwUDjYQ==@nongnu.org
X-Gm-Message-State: AOJu0YyykV7QVdM108RO5E62cPsTtjMECOwFuTS3UXlt+MABWqtp3YiQ
 DncCDu/BIWonC+3eglPcwcOWLPCyhgXGzJPW4d5uFB7tv5zUG+6qm0FGOhedUdPkKac=
X-Gm-Gg: AeBDieuV/Ri+zQW6Sn2eSi6su+8LIEjhsl0SL+w4e8SRWW/dojx49qa2d4DIS5HzL1c
 ED49I2zlToTwaS8BCUERlphCk5LJVK7g0RaY8Umh03RMhMSL2PhGSzj/Bmy2W2dYo+LoLEIFCGl
 WV/haf7pARet4AhlOxSW4cQHm6qXF+iI6cYXAtfgr0jGE+dUU1R2eqYqAHGpzYJUji7lMBvnicM
 fWyXRnPomEr32wTPArIsdY/dKUj0GDR3aqf9lzq11PeJA5VtfjbMT+gTdrZu6E+tuowoTqLCkC0
 o38q/LwBFNefqpJ0b9z8Sxc7FfmedmgDS2QREz5i0yQi//+DePmVWfV5eRLS8gh7Daa16khvkrU
 KR5QjX3FgO/FVrXGaYA/GfMOus9ONUlVS4UXMBLdcApPEsJaFSTmBJd6NC/3uDGMMxuxX5JC1Cv
 pNfr/Z+Riny1mfXYePgyossZy36VyPaeFY6sPlVtU4n8IX9BJdZ5SzdOv9QqU2314ORdeZbZEtP
 epa
X-Received: by 2002:a05:600c:4895:b0:488:ffad:6728 with SMTP id
 5b1f17b1804b1-488ffad67f4mr209453995e9.19.1776978666796; 
 Thu, 23 Apr 2026 14:11:06 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb762f56sm170177185e9.15.2026.04.23.14.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2026 14:11:06 -0700 (PDT)
Message-ID: <ca138704-a6cc-49eb-be1a-5811784bb8f4@linaro.org>
Date: Thu, 23 Apr 2026 23:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm, hw/ppc: Remove unnecessary audio.h includes from
 board code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, =?UTF-8?Q?Herv=C3=A9_Poussineau?=
 <hpoussin@reactos.org>
References: <20260417093805.1076954-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260417093805.1076954-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 17/4/26 11:38, Peter Maydell wrote:
> Some boards (mostly arm, but also ppc/prep) include audio.h, but they
> don't need anything from it.  Drop the unnecessary include lines.
> 
> These seem to have been introduced with commits 2b16397264a8e,
> b8ab0303de, which added the machine-default audiodev handling, but as
> far as I can tell they were unecessary right from the start, as the
> machine_add_audiodev_property() function has always been in boards.h.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/integratorcp.c | 1 -
>   hw/arm/musicpal.c     | 1 -
>   hw/arm/realview.c     | 1 -
>   hw/arm/versatilepb.c  | 1 -
>   hw/arm/vexpress.c     | 1 -
>   hw/arm/xlnx-zcu102.c  | 1 -
>   hw/ppc/prep.c         | 1 -
>   7 files changed, 7 deletions(-)

Patch queued, thanks.

