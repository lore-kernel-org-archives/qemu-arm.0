Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82295CAC5A7
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Sep 2025 10:39:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v10QJ-0000ss-T4; Tue, 23 Sep 2025 06:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v10QI-0000qP-Ex
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 06:39:02 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v10QD-0005Gn-Ce
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 06:39:01 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45dd505a1dfso38191795e9.2
 for <qemu-arm@nongnu.org>; Tue, 23 Sep 2025 03:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758623935; x=1759228735; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CRbwK4NBPHdo4l0/P5FLE2ifGdo+X2eMPuXGFnC1gKU=;
 b=RqClT7cVdYrXcw1Tqqflfsrk6iU1moDAb3YG6WIBhUuEqbKB/5uaGoPJkZ0vonmjwT
 Ei00cUMwb77QADmV0wLUAP9j0V1sUaw/2Y1WseELthh/AM5KNGtgBfayl4JYU8gs9ze7
 H6JKUzGFjZ79t8b5oKoZd3Tqm5LB4EHds3W5DevQPf0eXMwHpsC9zOiUwVAjJqzRFzQM
 XjDIF5N51WUgUB63mjvK+DkemB9USqvdSGqC0SIIWPmAe3GungOLY1SKKLoZqVapKDDu
 AXWRO0KCIawrLpxzDuBwqYf5KYZwHJGNnjSidgkpRozBHe5TinZZ0mjD32AfzKxP3uU4
 osiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758623935; x=1759228735;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CRbwK4NBPHdo4l0/P5FLE2ifGdo+X2eMPuXGFnC1gKU=;
 b=JdUN02WW9sR+w5suKidAQDpGirRM8UqSOIh9UODR5PAsCDauiA+bqM774ItZjsEdMS
 fSF7wgQazTXsjoE1W7XcCowHCVzQ8fQ/pSgWtyiy37QrpPjChF5dGy/8MEfFN58IZ2IO
 d6ZrkWIVoBzBJKEgxgQxEXl/inXoAMI1L8C96OyFTFby8YYhXvlqJrfSQwVZ7ONSAfxv
 d9PltW/DaCPvD7x4RjAhjfj7kBXWTqybug5GsRw5n7j7iSFJxddHTV+8cUu0gYeFKbZn
 RFO3nC+D6MdWYHiQp6TE2CX8JupzyYIeMZkW6teNZz0TIRHJtR4/LpPEWdFP/J0Aw22U
 wYvg==
X-Gm-Message-State: AOJu0YzIt2eliawq7F4veLseTCj334LqYG8+8uik9aj64xJww0RVK4v7
 bR4Gr05gOB4ISj1mRNB68GglxCgTvvennluElyJn5L0TCAnOWJC6rVaXMoV1ZKmVyANrB4ufAcY
 lJxDOo2i4Lw==
X-Gm-Gg: ASbGncsipO47BzVrsTxwJ1Q+DCyb2R7uBfJflUPBi4k0LPnqk85OdboV9oJj77APQhS
 HhMtvuw8fcyrA8BbB0d44goNU5A49k9h/YaseJ7IPayIMWM8gQlshnqW1/VUzK5JryeNehkTAFf
 AsoB1BAwViAYWW/t7dGmiaGab8o1SXqGdgzisfTckelvTOmRXO4M3aUBwTVKapCrBpWg1+JQ4U5
 OqJSiKmGyl9pyGpcaAwcUg4mRQyI+Ujbm0aCjDPLDCTtoO3AMELLtEl3LbRuZyGZUGTW1UCzSHh
 XKG3Pyrw1sAX1kaPTnk0z85RAi31cegdodqzULHKA9DrGgBtpL0SXg+yhYfoX5apLCE/NyceRKS
 XqdaaYDVfOQCiYNyt1Y52fnj9SFO2PvQie/H/iIHEm9pa1p+HveUxzTcG8JcBxIubHA==
X-Google-Smtp-Source: AGHT+IEED/1eEDvqGeN2HUpSyohwO+hqti9yS6VXZf7uwr0ifC7od9VYb1TD4Xyqu0W/DojU8UBkMg==
X-Received: by 2002:a05:600c:3588:b0:45d:2ac9:4240 with SMTP id
 5b1f17b1804b1-46e1daacc85mr32542705e9.17.1758623935036; 
 Tue, 23 Sep 2025 03:38:55 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46c9d5d52dcsm107406275e9.8.2025.09.23.03.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 03:38:54 -0700 (PDT)
Message-ID: <43943c2c-126e-425a-b32e-f15fb144a1b5@linaro.org>
Date: Tue, 23 Sep 2025 12:38:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/36] target/arm/hvf: Reorder DEF_SYSREG arguments
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-5-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 16/9/25 16:22, Richard Henderson wrote:
> The order of the parameters in the Arm ARM is
> 
>    op0, op1, crn, crm, op2
> 
> Reorder the arguments of DEF_SYSREG to match.
> Mechanical change to sysreg.c.inc using
> 
>    sed 's/\([^,]*\),\([^,]*\),\([^,]*\),\([^,]*\),\([^,]*\)/\1,\4,\5,\2,\3/'
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/hvf/hvf.c        |   2 +-
>   target/arm/hvf/sysreg.c.inc | 224 ++++++++++++++++++------------------
>   2 files changed, 113 insertions(+), 113 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


