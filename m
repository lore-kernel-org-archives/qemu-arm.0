Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AE8CAC5A7
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Sep 2025 10:48:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v10Yd-0008SP-R8; Tue, 23 Sep 2025 06:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v10Yb-0008R5-Em
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 06:47:37 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v10YZ-00071w-BF
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 06:47:37 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3fa528f127fso1381770f8f.1
 for <qemu-arm@nongnu.org>; Tue, 23 Sep 2025 03:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758624450; x=1759229250; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=asyMX6RGarJwtYqKiU05VkUrWICDnMI/IdEa60s8inU=;
 b=mxDlCkHKHnE693sJJkv6S5hjFpvTVQm94J6tVAOnsvb5fesQUUVRe+EDyxWkmXUkEB
 ftJbGp6CJtmhRNVXxcpwpM0CJGl0NROyFLl0BlkYcheB4NU3OZFxCC7rgfUx2p1Wz7nE
 P9es/bD+tByH0gR7v6qiTHSvFsvT6SB8aa8Q27QbP/xP4KcuO/eUGguvlg6/wnHDS2vV
 hurr0+uxKKjV9Bj6nZkv+AqFOg6u05dGFXIvDDJ83szMATUCgA6+37vkId+Aq1ror38L
 auaCCDu2ttEMi0zAOXzTOG0TiYoetKJEm1/t6XErx9yq8zpO9e/TLCnClj2+f1UrMN76
 HPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758624450; x=1759229250;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=asyMX6RGarJwtYqKiU05VkUrWICDnMI/IdEa60s8inU=;
 b=H9BDRdFBDIjX/79Ukfzs1+7EgBA8Oj5EtYloBod8I524dcWFoMZMo41OKL5FNsXQe3
 F0KAc64nlU8y3W3/EX94Air6LHam+3q1nDfeTsPZ2kmKuSqmKcXyfWmzHWhgUyrKVvbG
 PKw+8lA4WAWzd2F3jNav06VFbYy2gv684TqeUuhfzMwNd2WUFdQismxQ1AZNPbHe+jPH
 lzeN2f4g5qj3NsSknW7MzohZsA1dXog5UNN1RaSbjOTErILVU7e2tpqqdk/bxus5Ddhw
 ZZR+FldVFNQevR4pjRr3qbkeLveEejFVk+7WHd3F1m9d6NkUoSe+xUWdSNcQf6BtOxIF
 GfIg==
X-Gm-Message-State: AOJu0YzmOoYOmi9fB3IlHTbJGKcxGuKb/6f3syljiGNmW37AzPQ1lAob
 aON65EAgToUIgG7gLt+jWXMC6cFHZCYxaW6jfR7wYiTOqlDZNnWkO7Ntv2NRRqjn/p4=
X-Gm-Gg: ASbGncsPg0qctTkNkXHy4kkCjpc0JQ/x6+fcCTnJJkisnLFFIF4xrFOP0IlVuQ0pjvC
 Ibt2UAgcS1aet5ApWJEPg7B2C6iFX0URDc+6/UlFya5Vi2AwN7ypkEvgpmki6bN41s2gCtPoYkN
 tj8BzBEkx9ciA4zLNAHm+Yp2yLL7fI+ymndCk/tMunq0eYXUpTwLUClKlQXJBdMm3ys0gXyWfMV
 OBEIwtOEFeniUwB6iyLwutSf88ilwmji0dpevHH+902/c5ueSQqzgLFlih7hge8iMO+MUst7qRA
 h5ArA0pyGwvFFU8b8FRpT8flVngjYVO0579m7WpxCntzcUFxTxs9uR5LQhiZolsESYisK7zEYWH
 O0xdsTWVNVxJHlPO45AIldAUIcVY9Zhn5ZNV4Zm4FxbPmafiyBU0c5gaHG3XEv2Qyyw==
X-Google-Smtp-Source: AGHT+IELJXo5w8pgpy0XVgbieWBdGazxRrNmS14OWZtggIGsBoFUox+Tw7VjPHdxtEHCp+15/bvdRg==
X-Received: by 2002:a05:6000:615:b0:3f4:ad3f:7c35 with SMTP id
 ffacd0b85a97d-405d2c7ea8cmr1691409f8f.27.1758624449960; 
 Tue, 23 Sep 2025 03:47:29 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e1d4cfd57sm27781265e9.5.2025.09.23.03.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 03:47:29 -0700 (PDT)
Message-ID: <0f89784c-1562-4249-bfe1-82248fe676e3@linaro.org>
Date: Tue, 23 Sep 2025 12:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/36] target/arm: Reorder ENCODE_AA64_CP_REG arguments
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-20-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
> Reorder the arguments of ENCODE_AA64_CP_REG to match.
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h            | 2 +-
>   target/arm/helper.c            | 4 ++--
>   target/arm/hvf/hvf.c           | 6 +++---
>   target/arm/tcg/translate-a64.c | 4 ++--
>   4 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


