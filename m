Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E239CC87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 20:49:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhDjH-0001ZJ-1f; Wed, 30 Jul 2025 16:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDOb-0004Gd-Pw
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:27:38 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDOZ-0004AC-U2
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:27:29 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-73c17c770a7so255110b3a.2
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753907246; x=1754512046; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MojvVvW2NfqxG8VDPwFIJ7B1Sz+fQ/Ctg+H+idda7i4=;
 b=pgtsCFoVQDL8HYT5JpfjNaHO+lhKkIG90HA272iBiwK1Dpzpbd5WKNreaGfVIhvBOK
 kDoC94+O64P1V+BWM8n+CzA9gjMMnqqU0w0eVaNf/9D64NlTfuBcyTJPq4H19qBM/UE/
 hl4zXhdBP238a+vj1sBSvBwVIkhg+wWvMu612vLX1t3ydwMHk/8OobT9G+8CDyoNJd4C
 qypKjsx6RJ/4FZCdcWtZcf1IMPzvNDm97VNyH4nj26Z2WlUJzf2riQLQI9o+ERmGC1ZS
 ploZtQ5/GqNe9N1NcwiTJuQs4zLTE+p4EI61ADbY5HIySYlTjEsPxY2J/U7kEudK5U28
 s+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753907246; x=1754512046;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MojvVvW2NfqxG8VDPwFIJ7B1Sz+fQ/Ctg+H+idda7i4=;
 b=PxFkOvHv1x4ABfjjyopaSZeFE+ASQtDwHa/LHU9RFQj7N8H7NtYt1GE/JzAPUWJPS5
 29dcXI42WE3Oj5s1uQ+rqGVz+wdhWSxh9XZksrCnvWBBd6HX2cagLE4R3xGHEK/tn9vy
 9RwfRs7Je6lKuTsJrYrqbzwA8KLmpQq2uHGbAyySp8OxZC73hSznGyI7KK0l/rKleoc4
 x6JweNzqLTT9mlxJcdBknSNtXw89BxgXHhyLKViY32v9AZIUJWIwUGP4/cyasWioQyo6
 JyrT/mgR8vHj4ah4B/qzf4uTcmIc7lYT/r4Hmzjoae3PLtjRrK+w1zjfJk0G97YeKjbX
 OSnA==
X-Gm-Message-State: AOJu0YzyQ1E7QIm1IEIsiLdDI4KlbApnN6SH5Z4OqQ4RWrrrpYwxZOH0
 fAcdTX58FdHq6RuJ8Bbj8jrFtmm9Rpctz1d1hALG+QTGIbe68VprE4lTk15U1ZR5dDw=
X-Gm-Gg: ASbGncujzXdL2+OK2IGzT8lhuw0j8atYd31COeQh4VduUrN9qs7IL3k6dujccCeixLb
 cLQgChuQ5S9YdPeS+7U3tgV3ls4jxmwxsMxi/eO5Bj0T/0ecDl6mc0+pDDWrq1FDxpknIAvwNSX
 AQblckgs9NO49TEuvcNF9VrJFWPUJ9E4UGhEuA+G8rOZy51xPglvoo9tEYZqnyLTtKFLBg2nv8a
 n4aiaI5ijwTWiLAV4kgo27XC+bQRsR08jNzw21kHMBqSAAOHOYPe/2Ei2g2Rv8QPEet3k/DwNFt
 xG//4YsWespxgx9kcou9kRy72hRMxLwM/ygYPtI0uFvesPYIIh+23asBSHby1uSgVsnbSueMP9+
 kQoNbxj+shtMXHSlWageN8ocMMiO6YaHfLLg=
X-Google-Smtp-Source: AGHT+IE26xwVdJ7n7FYwsqGjJPYkjfxfKLR5D8jq09qmoNOKHVatMHO8vEVvTmdgMExhU+Z04/RJwg==
X-Received: by 2002:a05:6a00:3a1e:b0:730:95a6:3761 with SMTP id
 d2e1a72fcca58-76ab092f862mr7940878b3a.3.1753907245877; 
 Wed, 30 Jul 2025 13:27:25 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640adfe5f3sm11415898b3a.78.2025.07.30.13.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:27:25 -0700 (PDT)
Message-ID: <20055ac1-56d2-4100-84bd-82aa88da1b77@linaro.org>
Date: Wed, 30 Jul 2025 13:27:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/82] target/arm: Add in_prot_check to S1Translate
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-3-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x433.google.com
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
> Separate the access_type from the protection check.
> Save the trouble of modifying all helper functions
> by passing the new data in the control structure.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


