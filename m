Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE09CAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 10:37:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1jLc-0002BN-U3; Thu, 25 Sep 2025 06:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jLZ-000297-TW
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:37:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jLF-00054z-3l
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:37:04 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so624647f8f.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 03:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758796603; x=1759401403; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ly/axfF7fUyaUOYjaVc2/I5qFMYdx0A7yG5xF5VGyMg=;
 b=MAwIUXFL/+eS38MKJ8nL1c3TKYQu+z9yvdy5+jjkZK1MgTn9R24dpBmE05npWaYqGU
 nGEvdUT6WzDpy8e0XZtc8JhFSeU7e2MEy5+lTt/RTynexgHqovtzKJ77PmIdfULbC3J6
 QexwimZrwkHAIY3nmVRPbsJmbYosMC2qOELkeH+mx8WsxPPRHXbx+djQW+NUKvEQiLmu
 8g8NPrG65KOkSII3iJlxvHDc5pL03zysg40xpKhgB0sFd7pMl0JqmK+0I27+igimuoJi
 JyB50C/eeDkOG73Y3jaV+gHX7SORhHDJ4l48CE0PbenyPc2ZQ+M79okPrqs9GL1C4lHW
 aWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758796603; x=1759401403;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ly/axfF7fUyaUOYjaVc2/I5qFMYdx0A7yG5xF5VGyMg=;
 b=IuLGifVqQNDcUiB6p2lYnhktv6U+7LnVtbtWD1eKKqAba7TIGfWQG6hZJ8Q5PFtdMs
 JYYA42VRFZK9cXv4F7Q9vFrAX4zb0nbIOuBPmEJWdS0JkSXH/Hcp8Px2O/oNZwvYNR95
 +Ew9MJrXFz3HKVso9kqkFKc9poD8V/dlV52k9NouD3uI4HZJYZid8K3tNQXL8O6VW/WR
 8ugbjnP14O1VvrcLwGlog2hlohT/yKhnjP4lpYV6ySaFVSeIKZtwkRVQ0Zrjfvas7q07
 H+aTdaAZwpRJ1RApoBIv849SGXVwWEBfJv3s2ZxRdUOtBGkjfLcdrowdKZfMU/JwhPWM
 f2mQ==
X-Gm-Message-State: AOJu0YyGLtg/PE7MX1uDcilVlwNLOkyaGfR4YJm7X/FmSg3i/gysV+2I
 bXY5qWsFTTHFNV4aDtITE2mD/Z36ztfaOM4BdUvoCjA5qHgWI9Wu569avEFnarfmVsU=
X-Gm-Gg: ASbGncsjCBbYBg2P+yjfd6ip/hBW37Oc1tZEvZU/+HsYSyf6iWEe78VdWIwQhj/Al34
 b/erHks3b4ZFJguqDvYm7ZLw09hafBVYaSXA7DeTlOHGtIx+AnoHf2eD5YeNg0w2bZ4mQ7qTXYF
 ZM0Mh/0tQxq5kXsUJFjYEoYj6jSq444r9/e9ye2F8W9B8xLTKVKU5nc92akt2jQb8IK8+lmpCy9
 NmTymcuLosyMGjcMUTNETQGei8fOzUf3OAPmTiKyYljmESWO0GjdsjJcXDq900M+Fprw3VTNB5n
 qH0kBw+h+TnOdevPIQ59rq+aumZzVUlzFUBMosnlxf4jksc8bD/DZ8AZb8xoeSNzUEmCsEoR6Xm
 kCDbSWrQ37lRmMnD16O4QScTZqNQii3zr0sUcCWsNkOPzADUh9FD5XQiAWhSlq+5NFg==
X-Google-Smtp-Source: AGHT+IFW/R+aMmmdCplYNVfoK03N2En6sWGcm1242H2b78TYYFkFgiIiv1oRZqw1XyI2d3p/jZlg/g==
X-Received: by 2002:a05:6000:400b:b0:3f4:8579:36b8 with SMTP id
 ffacd0b85a97d-40e4ff1990bmr3250343f8f.45.1758796603262; 
 Thu, 25 Sep 2025 03:36:43 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5602eccsm2545901f8f.40.2025.09.25.03.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:36:42 -0700 (PDT)
Message-ID: <1af5ea72-47d6-420b-8c13-35038bb6117d@linaro.org>
Date: Thu, 25 Sep 2025 12:36:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/36] target/arm: Rename all ARMCPRegInfo from opaque
 to ri
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-12-richard.henderson@linaro.org>
 <9cf69af4-fe5f-4998-acae-cffee41d2c91@linaro.org>
In-Reply-To: <9cf69af4-fe5f-4998-acae-cffee41d2c91@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 23/9/25 12:31, Philippe Mathieu-Daudé wrote:
> On 16/9/25 16:22, Richard Henderson wrote:
>> These pointers are no opaque, they have a specific type.
>>
>> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpregs.h | 10 +++++-----
>>   target/arm/helper.c |  6 +++---
>>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

FWIW:
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


