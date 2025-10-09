Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3507CCD185
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Oct 2025 14:33:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6ri0-0003hV-4C; Thu, 09 Oct 2025 10:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6rho-0003O2-AB
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 10:33:23 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6rhj-00038U-Jt
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 10:33:18 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e542196c7so12130435e9.0
 for <qemu-arm@nongnu.org>; Thu, 09 Oct 2025 07:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760020388; x=1760625188; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wXsMIdvvb0DfWGwhIK7mVi32a4taePpSpmapThvDfYw=;
 b=V+2pmdXxMQl79jvZdfiDufRXbPD2ZaRF6BeCWFX+PRvcY36m4XOti99kQT6yAydMR+
 DxD4Z69UffA4u0uqRQ3UtHT0f4waBpjaz4Xe3pmhqPRAVXnloIeS1PcXy6V1+ZFnQ6Ug
 KTJ5AomkkDoOXN4akjNDbHR9YXZ2BnptPMXeBqLeH+p8gps1tzTymzE5qU2OV9rYaDv1
 dJcaCFrIm4uqw8yKgC2bs1m1KlYV5U8/w4V6A9z5oGtncAWk1cBTxyrVCW/2TJg/0BY9
 JmziGpPZ7cUe0fVuwn1mNMNRJf8P8mx2eZruizocC/si/7yorO/f13mdT20urY9CV2wq
 Ye1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760020388; x=1760625188;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wXsMIdvvb0DfWGwhIK7mVi32a4taePpSpmapThvDfYw=;
 b=lgk+q5WJRPIg0jtXxE9oeMyqgix1AR5g9Ld8TwhWvSN8RoxZXRRE61fLo7GFSfG8rZ
 CaaQJRYdJhtNQz84jN3nvqKt3S7Ne5U07DVC9m4ERcg+jRVn5aX48Nxu+dH24HwueQrL
 OK1RDOTv2YzyQl/rhRTUjs6dRyps6RDhxBVzxMBl2KH8jA/RRmrKYqvKoCSmGQTfZgR1
 0z4ALLwj6HYMqhr9AMBLitSVCJrVQk823d3deGn6p+7yOsRYyCpsbB/G6hJ9fJ/mzIGW
 WjTRVoPv5AaGjs4APSYZ/698UiznPPAyd1s9e8zOZcy8K4RB/cuSuo9qzhYHFKXLXYyP
 hAxw==
X-Gm-Message-State: AOJu0YxZPeRv42rfx978UvSrZF2fut2M9FiY1CBL0ZH8FC29yAAUIrxI
 ztZD7J0DQDAMCrmwhBgxR3S22S2qSsTPy2Uz9dFJ/V3YdiFiaPQ5+8LGauo+hOSuSrY=
X-Gm-Gg: ASbGncvR01p51bLNBLoNPOuYPg6uHU7hDZ3WWz8NOXqBCjPrCO3/+qfUEt+nvr8MbWG
 iNMu1lIIL+F2nPv6oLaNVhakDEVySfVVKPZQI0O3LrTs+rgsDltd09Sp6OHkfKUuvjoK7GUlXj0
 LaujKYUPouXoXs6HmQ63KgWYYEzmPCvOmGUddYeicS8W4mL6GU486u/waeacaH5KQ8sBGz6lpfX
 pW/XLqDfU98NFFsxGM49/1sNCuNwN7bGTIDpF/K61usOv1P2YlIU6jmnY7Mv2IWVuqs9WELbQgu
 HP/iBkNf9kRgCDPhIvq0JxmxFV+L9VYWRd8+bJ2hFg2gQ37gxWrXVmqlFoRYf+AEtERvm6i5Dff
 UMj63cmeiE+sQMiPUANEWcw/jHm0KT2/yJBVmJONp4O4HBJHlZn8fVchmflUhQsinbAv0uJgj2T
 n4N9E9+cAxlL5iMRwAMQ==
X-Google-Smtp-Source: AGHT+IEzajbMwtWMj/xCAARLEevJqO6yPVJixkubzhsuH/zmLQNPYUNER6Mr96Az9D8vta7iImCLMA==
X-Received: by 2002:a05:600c:4ed4:b0:46d:1a9b:6d35 with SMTP id
 5b1f17b1804b1-46fa9ec7718mr63301735e9.14.1760020388302; 
 Thu, 09 Oct 2025 07:33:08 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3e3520sm41033875e9.2.2025.10.09.07.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 07:33:07 -0700 (PDT)
Message-ID: <b1d23a95-7fff-4f02-8c92-62899dfc9849@linaro.org>
Date: Thu, 9 Oct 2025 16:33:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 62/73] target/arm: Enable FEAT_GCS with -cpu max
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
 <20251008215613.300150-63-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251008215613.300150-63-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 8/10/25 23:56, Richard Henderson wrote:
> Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/cpu64.c        | 1 +
>   docs/system/arm/emulation.rst | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


