Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FB2C87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 22:55:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj45o-0002tc-HE; Mon, 04 Aug 2025 18:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uj45g-0002rD-Bc
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:55:37 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uj45d-00005y-P9
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:55:35 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-76bddb92dc1so4389618b3a.0
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 15:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754348132; x=1754952932; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1gRXBSmLKGaLNVF2FdE2ZTYiCMmsp/V3kiOQiKyG3Io=;
 b=Aa+1QTE+W0N/hZRjhIhss+AAS2IOYjyZABVtYAUPG6Oh4ablkOtweuCT58yzNU/IBk
 r+ZefjZzIiZmcqW49fDBZbUvL2Awjgj7qsLJH8ggSq0AxYgptQa0MRz6sbGiSzxYhXTa
 dp6JKCiehSa0TFcG5Yj6Ac2CCAWnT0jGIeehSXn6/iLgIMFhPk/HX48wXYznx74odIH2
 5LftUiJ3b6cV8ITPG6eHOnP6d4FIzRDGJmNvJ1t0soh44tCG4j3rwBAeS31j+riGM5Pa
 Cfu76Sxq6sid6CKotEK4UQf0ONIM40q7nyJl3MT5BOiOvFWrM5WsXDL3kgdqS5vTR22c
 Ajww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754348132; x=1754952932;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1gRXBSmLKGaLNVF2FdE2ZTYiCMmsp/V3kiOQiKyG3Io=;
 b=w/6tqq/Qnu0aeBjxnBb4yK/7SjFy+HpEtq7yrOGvFIL2btxy4WX0ezAQq76kSq+fe8
 vUgt9xjr7Wdp9bVxJTZHZi2LO+TVPvn1QTu75MhH6/p1C729wMPVaXCZnNJ9KGFb0FyQ
 yws4YtG7r7i53NWS2+yuyQHEso/4Iz4t2faXZYf/F65RFXiNWH+M+yvDL1Y0dMxBtj2Y
 qDa2g0Ceg0oz5PB7M9D/0zHEhP60miaR0ZymUP9wjb2iSclxWY/kr5ugUpimb+e54ioS
 Ed+t+Ueh5Qeptee+sXakYDNE0EucYGGHy6/4/B5NdY6+cCyqM5IqW11H1KVsreFNuPs6
 v8Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4uSJ1KRjpt7fSbfx0+K0ZPl5eWkBg5ShdL1I9ONC18oWgQzlBxZOMn4wU9B0G9WUE9v1HeB5wUg==@nongnu.org
X-Gm-Message-State: AOJu0YzL3c29m2IrTK9Ijk2erXcx/Wg//7XUiM5PMasLazXrzTQd94s6
 ZKugY8Oc+rldRZIKVgtc2Dq93Tme5gFNEzTb7SGSzbOlms9tpP2PXXq1/iJI7fTK7ic=
X-Gm-Gg: ASbGncsKz3JYJeIyBUAzMTayHXIVxPnjglLBbNod2jDXRhB6ihKgNLUPPgeSlzkNm8r
 gSXF+3/+7KnKka/ol8vuuXOObK3nXqhv3oT0oZINWGwG+mu/zZ8Y8rIaxfm8cnKzX5PeOgZANyK
 RyfuLaZb2yUMxvmFAyEAPXQRi1iB5sGGOSYNVHFX+ZyPo4iD83RmvDXJjDO2Ron7dHMhP43CNgs
 2PZykuehhBwxsCQdR7SgM5E0EjLywhAKr1DCjMqHhMJP1SoA5kVFElsLMBp8XIiP5AQjVRNLDtI
 xVLpJ6FDNkHoD8BpiHkHaD5mvSuhYDZnFIFFG05010twQY8U0g20fqY5Uk6EXMlH4+DyfUprYiZ
 L1Zcc93fAXB9fHs2cWBWGWvPRPBRAm2SBHbKcf9vb
X-Google-Smtp-Source: AGHT+IESCQBHKNoHTUnzaSGR6MwUqHVi9IYXSqqW9hiqFK+MEiyCA3HV/KV8UpoIzWnHMUsxUKjr1Q==
X-Received: by 2002:a05:6a00:1a14:b0:76b:d791:42e5 with SMTP id
 d2e1a72fcca58-76bec4bf168mr11445432b3a.17.1754348132013; 
 Mon, 04 Aug 2025 15:55:32 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bea205365sm7109511b3a.83.2025.08.04.15.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 15:55:31 -0700 (PDT)
Message-ID: <3db084fb-0646-4dc0-91a1-a7dba275d18d@linaro.org>
Date: Tue, 5 Aug 2025 08:55:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v2 02/11] hw/sd/sdcard: Factor sd_response_size()
 out
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>
References: <20250804133406.17456-1-philmd@linaro.org>
 <20250804133406.17456-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250804133406.17456-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 8/4/25 23:33, Philippe Mathieu-Daudé wrote:
> Set @rsplen once before switching to fill the response buffer.
> This will allow to assert in a single place that the buffer is
> big enough to be filled with the response.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/sd/sd.c | 36 +++++++++++++++++++++++++++++-------
>   1 file changed, 29 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

