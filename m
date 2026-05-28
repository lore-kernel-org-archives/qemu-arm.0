Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0F0CD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 22:26:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSjAv-00024c-Qp; Thu, 28 May 2026 18:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wSjAu-00024K-OH
 for qemu-arm@nongnu.org; Thu, 28 May 2026 18:26:00 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wSjAr-00066K-VX
 for qemu-arm@nongnu.org; Thu, 28 May 2026 18:26:00 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2bf2247e38eso44695ad.3
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 15:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780007156; x=1780611956; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dmFYsMCqZh7ftK9E47vfa/Td1kXRDKvR8tOLKhJ3MBs=;
 b=zOXQIP9q0r9BfH1308wQjb4bMR+nVmsH6O2DtN49EyWxREzAHNhJrHblEUPvmMSDHW
 7wMXFITlRYAgQUdBkOTPWPikuv6HofLnhQ7GNJO1UFrXwQvbYSDLMSgoyoeyeasqDx2d
 UKPyFmRr0KadYJ6BoaFdX9oWZqVJlJyCo8K4r6MBfCMrcEkjH6igv8E0izshlBAcmIiD
 pfhRMpTU6a9C0hjqVbIlhmaoRZc6fN5AaMg/N8jRtEwvx8Kp/7bdiFvmyZG/L9mR9edO
 NhNVJI5fJr9zAcgLu1Z6JlQMeUB+XUX0E+UTuaSnR1vVYjdhqU0FyunygfynYxQicMHo
 zmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780007156; x=1780611956;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dmFYsMCqZh7ftK9E47vfa/Td1kXRDKvR8tOLKhJ3MBs=;
 b=Caec223HqKCK/vM3/1NoAWHksrevdO6vJysWdJozfwTITSkqzU2Fhc0W0UwG/74zw9
 UA1LesRUuaHdPXZzXI3KZxmIQ3oBnE1goj6nXfcypERmGs7PcVnQqKkFYCvYlcpNSImd
 /O7yeSdplKf6Oom2cDIhPmvKzwnZhePmhQAmFqoXD+mZwKZggUtIqTJNOOLlk9QlIlZo
 iw4azYvi1Sodf0LNo1aUBorcr6Xn7NKiRItixeEh4vhQaR5LKBjq0zwB6p6ntSeUEGe6
 HbUOCWm4lqJGf9YJhv3VlTOo56QQONwQL7aqHnQxt3Ctlx/QNIWR3z6HFkb9cNxMpODw
 kp0w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8hC55D51wCO2Il6nSmRpiYJ/TdAGX6F6RwhT6suF3mcA6O2H8MIRcAomjsRbyVwQptneGUQMg06g==@nongnu.org
X-Gm-Message-State: AOJu0YyW33BghcU277gMP/YlV1ZE1OH/P4thGFhE46uWkeymRgk22IAD
 5fsQJITd1OlCbLUNVRZZNVD63CatuMhvVHg7W+mLCztUdvyRFmYf2bBhTB6q3OJJ82Y=
X-Gm-Gg: Acq92OGD3mpUUQM48OwngFC8jWhYq6wzD7neiRX/ge78LsDfDZMbsndCv+hfcOqKDkt
 fpa0SpzRxkEcsRuohflFQa3PWtylsnDJKfvftqd18J56FxPzJSG+wbUfQwWK1nBQP9QReLB2kbH
 rjb8WCPSon0hy97o4fnUnf+yPIv0O0pmvq52vDzEfhVaIFFjOrK27Xnw7bXhPSx9lQAaQheGnIj
 RpCLk0BAyFrBpbzy4reffo4nqF9uqEooBUjRcra56tU1iGGfd/TRRNyT69NDgwe260TVb0eP9jw
 wZ7BgzM51iz400PeFV+WRXf7iIPc+di+SufE7MbHjj8VTaEEvXpUTXVlak28NugtnkMA057z6h4
 s+7uS9z97Skf6OCjcfAvU/WJ7Q6cCDNGQBfnQhYtnPzrkykBtLn+pYScNnwYBJhdrUl1/M/uweh
 qz88TUDLZyq8IIvbgSqjNgd4KHq+4vlAfq8Q7E2zGqB/QuJ+k=
X-Received: by 2002:a17:902:e744:b0:2ba:4e84:966 with SMTP id
 d9443c01a7336-2bf20bd7939mr3107225ad.36.1780007156227; 
 Thu, 28 May 2026 15:25:56 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf21d28ce6sm438535ad.61.2026.05.28.15.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 15:25:55 -0700 (PDT)
Message-ID: <8d57e90b-e5b8-4c5c-b0ef-91c7ef01e287@linaro.org>
Date: Thu, 28 May 2026 15:25:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/15] target/arm: load on canonical tag loads ext bits
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
 <20260511-feat-mte4-v6-9-8557cc1313b9@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260511-feat-mte4-v6-9-8557cc1313b9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

On 5/11/26 07:01, Gabriel Brookman wrote:
> Loading tags from canonically tagged regions should use the canonical
> tags (extension bits), not allocation tags. See AArch64_MemTagRead().
> 
> Signed-off-by: Gabriel Brookman<brookmangabriel@gmail.com>
> ---
>   target/arm/tcg/helper-a64-defs.h |  4 ++--
>   target/arm/tcg/mte_helper.c      | 14 ++++++++++++--
>   target/arm/tcg/translate-a64.c   |  4 ++--
>   3 files changed, 16 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

