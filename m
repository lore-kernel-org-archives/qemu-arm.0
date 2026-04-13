Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551BFF531CE
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 23:11:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCQQe-0001ZD-K7; Mon, 13 Apr 2026 19:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCQQX-0001SZ-9H
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:10:45 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCQQT-0007pD-Ah
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:10:44 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488c21c636dso29506695e9.2
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 16:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776121838; x=1776726638; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MHyI/6O0K+5so/EsQYExOJN2KDvFgpDlCHLvEUdwEUI=;
 b=tQMlbEU45t4pKPEruIoM4ZC+367avMQPg48o4pI6knnwwr9wjQ8vU9u0qgZELYNFot
 DUE5tLwBuNMeW0IjVM0shb9wXWq6xjkD4GOnd2lgBVvIizzriHUWKjGGvRayNrezAO19
 jorUtZxkNoNxy86NAFaCMR5LzujHIOlRw8xt1QR754UdyBr4Ze5UXIYA7XyN65Lsp/O3
 iIvD/WLEU67GOmWO8grqCfHrPIfsR+8oopQGpbsnG/oWU2qnCH9TormvWpYVzvCGT0oy
 8SVeD1ru+NmjGzCdEvlkTB+8hvaOZo+muyGCROk0DbMaymsafy2xbwCM5X6vAhm6sdKE
 4HmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776121838; x=1776726638;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MHyI/6O0K+5so/EsQYExOJN2KDvFgpDlCHLvEUdwEUI=;
 b=a4uaLywqiEKKg5xBxCMYn4SUlZwmZDZYRcMSY6TboFtKUZpr2AMOo134W41Ex++IXj
 WRCzkc2g3U8u2TPqx2GAyxLeQhQ7R/KvPBWAVNk/3KFVYKCfYaOQwiJovkAoUjFkANe7
 7iAEDUmHbpCUrmAfvwWfdjjdCtUs40oTNUGduVax005ExkvL/7SnA/xGOgmYN82uf4Pw
 C7yeymFe427/lWnT/vJLNxFnkmLeGrDAJhwYW/QVXEuDcC1QpaP3p0VfqJvbZbh3kPph
 MjoPCVrCbMAUhcia4ZcpvPfjhh06+6e3mvgtKqStgui39ylNVvdD254459ZhxVNHgBiZ
 OSeA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+UERDFkc1KzS5IaanVaIaScqLo/1xJBnawlzJ/Ed8sMUOiLyxnNb/MkoN7fWUhDLB7nvkSMMi+sQ==@nongnu.org
X-Gm-Message-State: AOJu0YzSZCJPee+ZivG80QSU1CKeKYUwzTwj3IA/AloBrxmerkMnr/HS
 vhCswvfCXm4ZbFR0XcJpV37V5dRbct5dSSVoKIOb9YIzNwJ48Y330k1MH/BwUkdRBIVH52+P0m/
 a2/4wCVc=
X-Gm-Gg: AeBDiesFhfi0pnmnlew66Y/JeAIrsIbsAKVqRtgh9TKu5+5l5cYNL1gGlaCP73ryO2A
 yMSC9lo/t1ODJRKxDd0vcbrMkMU/M01sgiBVdCpVEaKU1IGhvGBTg5qYRiyyn4ndmyS5mDZm3Bt
 nlzQviSOv2ayb8XrhJhc3L0Vj4VBZweNvc5/vgSxzO5Rr1/I5nT+hzOWqgUByC3xhf2J67UhHCL
 4BplHLd9dXvGJexSYynPwNFMPaymtsWKHn8rWSjbTIsh8loBC8fjkSFbGZB20Gpp24nlMLlFRju
 dPCKPI4fVEymTQ4mrZJmPkYCl7kopsx/xkUjk8DqbG7Nq/z4jlZ8O6KINnzQm1AAxZTpNuBNXly
 zzb2Er0LYIvr9HQaNMnpl9kKaQI9bq65Q7/iod5hw1Q0G3/6Z9mCFTTajEvRdDuzYGZNBp9G3m8
 2acjlqMbCl7UBe5FQSWZnGHQCbncAmawnRkuvXFS1x609zIXQyUoT+bxzm1gieKCOQag==
X-Received: by 2002:a05:600c:3f16:b0:485:3f30:6250 with SMTP id
 5b1f17b1804b1-488d6894bf6mr222055925e9.20.1776121838578; 
 Mon, 13 Apr 2026 16:10:38 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede15694sm3087225e9.3.2026.04.13.16.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 16:10:37 -0700 (PDT)
Message-ID: <43a16b17-1770-4699-9f09-c38556076cc6@linaro.org>
Date: Tue, 14 Apr 2026 01:10:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/65] hw/intc/arm_gicv5: Add link property for
 MemoryRegion for DMA
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
 <20260327111700.795099-12-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260327111700.795099-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 27/3/26 12:16, Peter Maydell wrote:
> The GICv5 IRS keeps data structures in system memory.  (Notably, it
> stores per-interrupt configuration information like the interrupt
> priority and its active and pending state in an in-memory data
> structure.) Add a link property so that the board or SoC can wire up
> a MemoryRegion that we will do DMA to.  We name this property
> "sysmem" to match the GICv3's equivalent property.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>   hw/intc/arm_gicv5_common.c         | 8 ++++++++
>   include/hw/intc/arm_gicv5_common.h | 4 ++++
>   2 files changed, 12 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

