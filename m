Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCD4C87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 20:50:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhDkj-0004ug-GL; Wed, 30 Jul 2025 16:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDSV-0006Yf-Sv
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:31:31 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDSU-00054D-AB
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:31:31 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-b391ca6146eso168298a12.3
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753907489; x=1754512289; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UHIVOnELgIuhPcblRnUH5DxMLJA8aU4b0HX0Lu7iUc4=;
 b=d5HjubU/hvQ77c8yyGv3Rsogvo+vWAtA/O04g+U4U6F4pxIMAhor+KMxUFBuZUhxDu
 SQxrz6hPEaDs61kSe3j/p1om8tvHerNKiosdcyhBs63PyOgJ28/7aCtR0eXHt7L1Ygdz
 ++2L5ynUr1Kc3S4ShPOgeUzJ5T4crZ/Kjlxcd81+U1UzrFuGKRfiWxbPOTOGbADxoxIW
 Q7wzMGgAg0aIfxLjG/q5BJvHegWrcEFcW5wfvKI9GyEuHVakQNcDEmLewiWwLH5jQ8vr
 sJvKcA1UwbBF6nHnUY97AiAsSyeZXaHFnQN/5GDpOTeYqT18NVYh+c5Mo8Nw4TkQznoC
 Fhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753907489; x=1754512289;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UHIVOnELgIuhPcblRnUH5DxMLJA8aU4b0HX0Lu7iUc4=;
 b=OJxWwuLKRcBheSFrbxeEGnktnEEx9m2ERBmm/B2ikWOSWkw06hfBgNRkIt9B0NzDnM
 erYIyzNn+q05o3J9eyS065avvkZ8RL4zO6Uwv1K/ZgEjk796thnNOzLSBGUqE1LFLV0O
 drXhdgOQGq/LNOrW1FLuWF/2+F795NyHVwHz26jDnhl4qykdJLkFW2Foqb0v/ObHeXoq
 DwPY/t+DYoHgjX+fnAVDt7Ix6GyoKy10ZwCxqLZwfZvQIe1dMbyRdTmSrDmeUaMHTQ4h
 548IpSneV4W5kKCtd/V7bZo+/3KnsREZbo5ftrJiLSEfIlSttKtrUjNKaVliVvz0HuEJ
 EVOg==
X-Gm-Message-State: AOJu0YxQViqlpXm9g++MC9ppogLySQC1YakLB7fzPHkxqfw7s2d/6v3P
 UEwnantgXfPQG1Mlk2sr2r8AfK41GFC6OGI55JB8PNpS3t4wzRysAow9n4ulIo/X+iasu+8TVZx
 jPUgB
X-Gm-Gg: ASbGncv2pqVB+2DWt2Xxjk8YrIAm4my00sa3zDbPkkavQ0W3k3F2sSH5i1axbzX0GfU
 VKu1pBOy6Qe1T9PWr0UjEhgT4RXjLyTM4eJrx3Ic4n3MsyyoakntMFhLwV9s0r94vxBq0NnaDLE
 QxozY1ulmCVjDeE1w5PTD7TgAfzT9eXc2vZUYYdTYeYAhvjFSOWcLuazSgYulGPm8Ici86B3EaW
 oqRIMLOQXc/w1gHoziGuZfz3rUnarWIX4ZtbdBq/6c+07WecXr9k95rXFlnN4AA6OEMHWPtzJ7Y
 Kgg/VxmWdp/SHNzpJksSaZwtvaYYId+E7nPwZkqP1CUZa72WBmYsj65ilUIH90RAYK+SkSBLm/+
 W7clj4WhoIvyS3BpPUkGxG2eMcxKeUyfwwbc=
X-Google-Smtp-Source: AGHT+IEyZ5NQv69fY7EKj7H8yowrxQCngayeeT3sOz2a6GFc/VpRil971N7cYzjine9iSxlnkVHkoA==
X-Received: by 2002:a17:90b:5286:b0:313:17e3:7ae0 with SMTP id
 98e67ed59e1d1-31f5de7bac5mr5696285a91.34.1753907488761; 
 Wed, 30 Jul 2025 13:31:28 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63ee4f42sm2787770a91.23.2025.07.30.13.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:31:28 -0700 (PDT)
Message-ID: <32d2c522-142e-458b-be9b-098d464c93fa@linaro.org>
Date: Wed, 30 Jul 2025 13:31:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/82] target/arm: Skip AF and DB updates for AccessType_AT
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-6-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52f.google.com
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

On 7/27/25 1:01 AM, Richard Henderson wrote:
> We are required to skip DB update for AT instructions, and
> we are allowed to skip AF updates.  Choose to skip both.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


