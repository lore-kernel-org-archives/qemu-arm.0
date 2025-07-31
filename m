Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4C0C87FD2
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:54:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbDw-0001MG-5h; Thu, 31 Jul 2025 17:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhaur-0002kb-G8
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:34:32 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhauo-0000By-PD
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:34:21 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-240418cbb8bso9853335ad.2
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753997657; x=1754602457; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OkHzUj8X79poqHM+hzx90X+R9KktHZvKdEgw3SZPIgI=;
 b=DgsAznLBY9LIoPk/e6wF9gkWG0EBgeslm1Gc6DxrCjAoDFHXg0t2/KzAmjr10A1Zya
 4uijoSYTWTNiIrXE+zdi6/beDr60/w+q3B09UBB6QpAzg28isV96izjv/eTIuslY+Ee+
 neMu2fI3MaXyAnwaYYkZzqWjZKYWqD/mHS821RB4KUkbZpKyFvOHBQPp10EXkw5a63AR
 p49C/8PVi1M6+oAWOHeW53uLkrkdy8eoaNsjhhnVTYOeyMZtAideYBM60WvoYRc78M5F
 WvhLWCDnxwsvtzNRJDzdMjKekzdXrrFdU9/BRlOMZ90BimD1VeLxCNwxrCZovuU+OY+i
 wTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753997657; x=1754602457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OkHzUj8X79poqHM+hzx90X+R9KktHZvKdEgw3SZPIgI=;
 b=VAucYtk0qk2q0pf7314Xx4J0w7P0JBuJPVfedPh6osTY0iy1P/DNLsjDMtEsZqyKiV
 uAdbaCRG8L7nX+R4gwIYWeXPeFf5lvMpYnyQqly0uSbEPCyVqdjvmVYCadXOmE709ioZ
 ZYIfEd3k+icCbFFKT1IMvekhrWz80iNYr6LstMcG6Q6qferQKrA7RJA2HEMyINjsc1j7
 TMUl2IZv8gjeka0wrVL3kW+0sWs8ssqAzF6en2tAaepp8d5PBwJVWJwQEkl1M9tM0D8X
 Xz6aVeo6LBGY1lL23qsR/2LiJ9Gliq69GFJ7gKJMoHz2AQmykqyERLy1YCDIPBxEmdfF
 tdJA==
X-Gm-Message-State: AOJu0YzRwVyfDRLpf/xRzGFHk4+Pqeu9gTBOk9tcCgVb1RJc9Qat24M+
 QgrCLmLJJ3qmCdO7UW8DjKp6E8fowfU3Zlzsr62yGIsCaIXyo67lezq0zcdY0e2F6Ew=
X-Gm-Gg: ASbGnctUfw1unYqSiYK58ak2NaMdCCm/DlhsFWG55HPGei2RMM/JUPR4skXNv+wsBON
 58tNlEd9IcuXtEkUIo/TOqXbFxdXegGGkKOqg2Pj5kQIAQoa1wceZOLkL+J6beATjMlAcPOwVCo
 GQYr1ATb9ESDRjPMLeVd9e5tvx12Xvce74N3Vj8LnZYTQuAromDXSZfm51PX+ieGN604xKAlZS2
 58a3nXyu1Vha3f//X6iwbT+ICzDx8XVbJIaTi/lwewdy1GJ0Ue2r0mvPj8WgcWwcG2Cbd1BGL4W
 ZHTBRPs2O2loqFGrBn6LFRMzHpGmQJTK7Dfw6XAnUaNePCDFX0ieSnrXx+YJGsWDwXFpeLeS9Ot
 czV/6AD6F2/rfL8zxfE1RJu35vifnmCH5qvQ=
X-Google-Smtp-Source: AGHT+IHZ360Q8T/eiSiBjjdE5U160O8+dEt35gndVQ31UV+2uknGw2jI5W9YDpH8j6JdOWjP5+u8mg==
X-Received: by 2002:a17:902:ebc7:b0:240:8cdf:f933 with SMTP id
 d9443c01a7336-24096a9dd25mr126814195ad.22.1753997657007; 
 Thu, 31 Jul 2025 14:34:17 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8976ca5sm26007085ad.100.2025.07.31.14.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:34:16 -0700 (PDT)
Message-ID: <c46e1960-7727-42af-a75c-4a74043cd6e8@linaro.org>
Date: Thu, 31 Jul 2025 14:34:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 57/82] target/arm: Implement GCSPOPM
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-58-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-58-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h            |  1 +
>   target/arm/cpregs-gcs.c        |  3 +++
>   target/arm/tcg/translate-a64.c | 27 +++++++++++++++++++++++++++
>   3 files changed, 31 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


