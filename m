Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E3DCAC5A7
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Sep 2025 10:37:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v10Og-0008RX-CO; Tue, 23 Sep 2025 06:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v10Od-0008Qu-R0
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 06:37:19 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v10OW-00052c-Qd
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 06:37:18 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3f0134ccc0cso4163009f8f.1
 for <qemu-arm@nongnu.org>; Tue, 23 Sep 2025 03:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758623826; x=1759228626; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DbggQ/t50loqSyhKfMwshBp/xAJcylVBqXvVk63BPhU=;
 b=cDeF+DA7CRb8THaxb9VEhdYa4+tTnKFsDTTjHUsoCSeA1r9yM2/NGsBoCuwNfMCp3S
 Dbde4j9OJsOIXMAKyHfjE0r1GbAGfRYuTcg0pLE8QBY9A7nd9wBFCr8OjIjFPNJhr2/z
 0T/s+HbqxIleE8P8jnv7NnYuoN8Q5L1YIvfOqPKDZqkcnJuL6q+VAJoPgSIqvpipZWj0
 FpwqPnqVI5wMFjilsIHVwhBffxcWPT8wObr93zzTB4pCdyUE6uLokdCfGWS6e+Tq+Xq5
 v2M5Kxok1KAsqY19fh5mFLdURM7WzwZnACyn03QID9dbNnQM9bx4f9OZebJfKgFo12Vr
 kwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758623826; x=1759228626;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DbggQ/t50loqSyhKfMwshBp/xAJcylVBqXvVk63BPhU=;
 b=xQ2J0bnDoqrRtSt8yGdrHKrEymyHYZWY5oFKUaXQxFysO56dpRSerE2uBemgAXjW+a
 V7x3KGqvaB8oNNYeT8+4KWPviNaWvH12DkXazNSBFLoAk68xBs7B3lBKmxOjPskJ/DQU
 M0E1XvXOlPR8/9vmYLUOlZPN5v+mGwcSX5rBTY+q4bk26A4P5mtNmwrCd/NLuiaIN0Ff
 b0v3KC9Swg+8v4WCLQXXiWFPvcCAOPAhXhVO3PUsG5QjZkuismyd8IKSNYVWquMLRlzS
 XD5Icx8bO0uWVUWShlsjX01ELPFW1zVg7A8KE3h3qlXlfz+CQlE0Men4uagcH8xg6lV4
 ZnwA==
X-Gm-Message-State: AOJu0YxXzRZb0ZzSavOr1STNnQiNuNI42wMFVm0pmM0Acc8EaE/91Z1F
 mVxAcKgDzw6F72QNKq2HslaPd7JOYQVEBP9ojE90y6gNkGVns8JyVeVm0SMpeDvxiKM=
X-Gm-Gg: ASbGnctzuZ7cVAGkVleQi15DRyHbX4Hz99affBAQRPMTd/cfCCMqopuNWZd8ACE5Yv0
 +jNhlHxVC8Q4DWp9S/Y9ctH7DJ0fftREH6XnU9gQ/I6S7ZYC3dgmETRhiFhN2ZmtGXvgTojA4zT
 enk3kXv0lP9QdqvS7ill9rgabfnFJJFPf5GFNgO/W8B94dP/UZud7FBL1xEQfp9rvyG/Zx9xoew
 baDQiKs5wzr1D7c1Wm2xi+AjQv6vB0C6Lb0wBudKGSc88HozZ7OPt1JVyAfwUNLYIShIBE7fZiy
 fNz0fMqweDX+cnrEKDoT25xxroo0CuXcmmGygbHwPtT4jJTE/wyjn9j+HVqmKf8s2h1UK0RCoLX
 zExvDAWKIdnK30QcV6xFmEzaJTCZYIJT6cz62HAAbddKL/MyJvRIvzF9nyrh+I6K4Cg==
X-Google-Smtp-Source: AGHT+IGlvq8ISKz95LervAwRn/h+6DXDml1rF8BRJ8cn8z6LTYU24uOTtQDVS7Quzv/2yYwN7K3X/w==
X-Received: by 2002:a05:6000:2406:b0:3dd:981d:43a5 with SMTP id
 ffacd0b85a97d-405caa5057cmr1393907f8f.47.1758623826167; 
 Tue, 23 Sep 2025 03:37:06 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbc7107sm24492206f8f.30.2025.09.23.03.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 03:37:05 -0700 (PDT)
Message-ID: <233261d8-9496-4157-8062-32048fae2d46@linaro.org>
Date: Tue, 23 Sep 2025 12:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/36] target/arm: Restrict the scope of CPREG_FIELD32, 
 CPREG_FIELD64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-14-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h |  9 ---------
>   target/arm/helper.c | 12 ++++++++++++
>   2 files changed, 12 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


