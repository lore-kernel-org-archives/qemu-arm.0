Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D525CCF9EB
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 19:41:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDT5B-000261-JA; Mon, 27 Oct 2025 15:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDT51-00024z-RP
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 15:40:36 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDT4y-0000Dh-8E
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 15:40:35 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso63534075e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 12:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761594025; x=1762198825; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5brc5qyLbooxSabCjlWZku5y1ceMf1JYxwGzirNblyg=;
 b=WieTEGPGK+A91sSSN+DHuRx2qFb1QvhXtdzYeUeA8Ke2TKXo5iw4XGzM/BBhujrj7T
 aVXUdvVkU4YGiacIumCl4P2qyRIOpyPvtnffySlKPTxC5Mypm8wYW0iNnSLORPHsv955
 XwRtUH0Wuj8evd52fQ5n/OI8jofvJukBDV+odqMnmVuuegIsgoTLM+X4Ak9giA2btAJF
 vtJ18EYfTmmVgT/sU0SpQPA+lTqGOxu43y6qodcsPtVxdK0Oz8NSB4eEwEGCX1BlEy1I
 wjPKokmxmeaQ0MW0H5VgLr3s/CJyzmvemsEqH33Jkan6ZpeVCErAULy/dO6Bl6+0ONAD
 Dqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761594025; x=1762198825;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5brc5qyLbooxSabCjlWZku5y1ceMf1JYxwGzirNblyg=;
 b=GzzofHdr+0infklNfG30nLL/VXrtzD7GUjJd3X65/eDQvSZ/SH9jaoNTGaPmJLEA9t
 U5TGXrWbFh4ZcPFLuxvn8Yr7/Gd1Dl+O+1ZGMiSdI96ntSrjzwAywwxgOq/wsYZDABHC
 1wf6KtfvjWboyfP9PIBshVZsCb/476A9qFr4d4cugqV5GP4J3HES1qhRj6CnzFA/ZCea
 QmMbPQ+hHM8pC6GeaAKarEZRa7cHapYmvJQvnvovtGjfUsDNwLURHlpr2C1DqweC+ZWv
 CwlbnvZ5DsiDn0DtBPnfWP3zzzKM4y8f6dDXWRbPpffnRTuV4QFJQhfZmz/l1P/XyXZD
 JlgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV81TUCNLmBaJNdcjd3FSfmZFK15qdSipHmXCHHlwlF06R5BjRM4hQmt/VL5AcbaFmMYsdtmWBQbw==@nongnu.org
X-Gm-Message-State: AOJu0YzNFhRQM6W8QeD/nmyIYHwAr+z/gdQrFW5PHJjwtjOoBUwS8NJu
 VrdFHjyPbS7IgfcL8cpgZ9pmEcXsU4Md0wN9mQku5bRW3f9LB0gTkf5CPPhdfJ2fE4c=
X-Gm-Gg: ASbGnctFXOPaQ6eUPd47gc1o2LgCWRDtA+JnB/GBlwL4b11nvLB0hhrt0sKETzFnxBp
 49SNcKK0Rx/azgLF857aQIk0aWrRw8vRfS+SlBBUe6Kn2SIEIXw9g1KfmNzrKelQZLJ1ZU1i0Aa
 D5J0Dqa76wPsyrULzTxUe6bLhdhtpy3ym6QaKQX10hniD550Wp9Cenn1yit3M5C3HZheNf+DvLj
 q9RYZfUxK+2KMckotL5YDUx8m93iEjRQC6fLjJkmoIOqsGpiIMU8kneK8wzlgXiUNhGvGnODvvp
 5aqk7r/B8O6cmL7wtVj4GWrljvyYJl7mXfRf8yVm6N1Gqf02S2ePtOneSW6ToLvXUV+uOaYxZVo
 e8KlqADbknVFA2paRs6s8l6R1CyUPuWZnNk+JLrjgFcc40o22I23sAeMfqJ3iePZoZ8agFCU/k/
 sZkpJPklSKNN6bgfVVpvVVCtt7ZqGfblg5xJeAiTdXyh4=
X-Google-Smtp-Source: AGHT+IEcN/DKny5fmLBPSD6ormwN6HPLeG4cZiM9KGf3kCN1b/B39lDV0CG8A9Fjn7kkoY7J2kuQmA==
X-Received: by 2002:a05:600c:524a:b0:471:ff3:a877 with SMTP id
 5b1f17b1804b1-47717e414afmr6557625e9.20.1761594024656; 
 Mon, 27 Oct 2025 12:40:24 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952da12dsm16121824f8f.29.2025.10.27.12.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 12:40:24 -0700 (PDT)
Message-ID: <6106f968-4a4c-4fc1-a7e5-ab3955adf259@linaro.org>
Date: Mon, 27 Oct 2025 20:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] hw/arm/virt: Remove virt-4.1 and virt-4.2 machines
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>
References: <20251020094022.68768-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251020094022.68768-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 20/10/25 11:40, Philippe Mathieu-Daudé wrote:
> Since v1:
> - Do not remove virt-6.0 -> virt-7.2 (danpb)
> 
> Remove the deprecated virt-4.1 and virt-4.2 machines,
> which are older than 6 years. Remove resulting dead code.
> 
> Philippe Mathieu-Daudé (4):
>    hw/arm/virt: Remove deprecated virt-4.1 machine
>    hw/arm/virt: Remove VirtMachineClass::no_ged field
>    hw/arm/virt: Remove deprecated virt-4.2 machine
>    hw/arm/virt: Remove VirtMachineClass::kvm_no_adjvtime field

Ping?

