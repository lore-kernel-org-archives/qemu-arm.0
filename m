Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8A8C87FCB
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 06:15:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uliHq-0006oP-Aq; Tue, 12 Aug 2025 02:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliGz-0006FU-3O
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:14:16 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliGp-0004Kl-7K
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:14:12 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-458bdde7dedso34465875e9.0
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 23:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754979239; x=1755584039; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mVEcIVK3zD18vLzY4ziQ9G08VaHwIvJckDiKC0LiO6E=;
 b=iNfKEuzChMQB2CrIZ22NYUYmSAk0Vr79z4yLs3p8YtzwbMkCnb0EDIA5KJLLmfwV2R
 iS5CIidIsJpowcZQ5EQ+tncXxlf1ka21e5Mt4meWVrd7xX6/ySFWjAlnWcI4RpGJGFzk
 VyUXyY7H6CoybYGbakAUBNERLWbJFa4VH46aog1mPy8IE59kBEOYoXyZhPYT6djJWPTC
 IJnIlGRTow/wlGiy7zBEWepDJtdlz42Vn9BQeAuVuVCREjrI0KmvR2fl3PDpogN2lmXP
 SIPIw1MwFwQ6CqR6czBDIjdBokQnPMdY96Y7vC7ZT18ZX5GRdqClbj1me9fDxfTzyvle
 08tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754979239; x=1755584039;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mVEcIVK3zD18vLzY4ziQ9G08VaHwIvJckDiKC0LiO6E=;
 b=GRqmBsm8Ds9vXfcxaF1UL30oGE2kKe2APinY6fo01ArxHWp1JowIGjlu5+snxzLCYw
 ydzoazwHTACaB1HWNN/BP4OQFuAyRryzUDyO6ensQ6HPQ7udlbu3cKEbZi7uiOprctfG
 yTR8v4YKnnCYXJSmFwDFddgrWKIm0abwRDV0Ka7Ucz5zDRBuYDG4+n8LHqOpKkvwNuMa
 kDkjfJBrBvbzC1QrbEppzpl1F1HEQi8c3DJEKF3ajg9tTWZGWIb6KCv4j9MC9Rvmatf0
 plYGZ6Ueu8zfyH9aBl6/HJIMprnKM3nnD2bDXXsnF7mrIp3aAMIEvz3dy0RCXRbLeN5i
 UKMA==
X-Gm-Message-State: AOJu0YxJSCmYO2SXiz9Y6qpxkxQ2zKkv7rASXHEdhbSPd+9ZKrD80VYz
 Ze37U4XyfGSxD+iEnMqCbOi1G9ydbLg9j0XaQTN4acG2A+GHN0fIABSqQaSPZGpM7fE=
X-Gm-Gg: ASbGncsU0MZyyxdQGohfIwJEeDif7tairpeq5XsTIIr7E2kQUMzt61+odZ4FAIa6B1I
 JZjx14ay0B9rxUJMY4WdgfgapmYwHs9wQ7BfTCURaBy/Hr0FV4H2cadKEOvisJyeTdDkMIFiL8+
 p5TQTItvdx/Nv0HkrizjrlmR0h4YXPJXKcftZ1cX/YpAcBNgZjJ/7s21ubs708IIhp1TVTFKnt+
 nzyn2JtDb7PgQhhDCn3YjVMSuGrLzwtihHsK1RAlmrs+0BE5yPZ9wUkEndScsaB8Wz8weMD5oV8
 Ex5JZVwpfgzhBOpILSviQBMKAkFdOxyqgldDeZHKWP6RD5I0LuL5Mcc79lPUn2ZgAIG/aUX4BdY
 NWnSTazQ2Bu4u98uiU5bl0ppDdLFjgdBuQlXwzbA3CK4dZ76KCWSsXphWdpZFGW8ikg==
X-Google-Smtp-Source: AGHT+IFzNcv4f5spm53pIwMQNstVjmeQCj2Mpa2pQZ+V1t66UWQ+hw+7eD4mHWJBc4aCerzH48APPQ==
X-Received: by 2002:a05:600c:45d3:b0:456:496:2100 with SMTP id
 5b1f17b1804b1-45a10c133afmr21896435e9.31.1754979238778; 
 Mon, 11 Aug 2025 23:13:58 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e0e70218sm309944355e9.20.2025.08.11.23.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:13:58 -0700 (PDT)
Message-ID: <4755094b-eaeb-4729-97ad-8c761786731f@linaro.org>
Date: Tue, 12 Aug 2025 08:13:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 40/85] target/arm: Convert regime_is_user from switch
 to table
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
 <20250802232953.413294-41-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250802232953.413294-41-richard.henderson@linaro.org>
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
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 3/8/25 01:29, Richard Henderson wrote:
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h       | 17 -----------------
>   target/arm/mmuidx-internal.h | 12 ++++++++++++
>   target/arm/mmuidx.c          |  6 ++++--
>   3 files changed, 16 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


