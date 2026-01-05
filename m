Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7412BC2A062
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Jan 2026 04:30:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vccEO-0000UZ-KF; Sun, 04 Jan 2026 23:30:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vccEN-0000Sa-Jj
 for qemu-arm@nongnu.org; Sun, 04 Jan 2026 23:30:11 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vccEL-0006xD-BK
 for qemu-arm@nongnu.org; Sun, 04 Jan 2026 23:30:11 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2a110548cdeso183008685ad.0
 for <qemu-arm@nongnu.org>; Sun, 04 Jan 2026 20:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767587408; x=1768192208; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cmURYcj4Z0IPJrFeY/4ayi0qRX2k8lhAtEZ0Ob8xht0=;
 b=YDxhvFAfG/IaC1wJISEORVACyQo0rQ/JOt9Ol0JTvdBBxzMFHmyV/NnhDnRH0Pz9am
 v6QSxK3Z5jmJ/GmVapxd2EOMwuTSxVJr6EQ9HIvKK5Y8KbcPHe8d/9rFbsQyA7BhVlpS
 uBUMaUBNlfw3BNLeb6wrPYaBJXs1nuo8ZAduCqrIAPS+/T6Q3ndd0AT7MShfIpVm5m54
 fr0xoIwC9t3T/XDGBP+ziPGYikuPQ0qMusR+Txr/sxGr2mDsMhc4cEqeOpGktGkHSA8u
 R4tOSgawSUIdtJRasWFTt2OHd8f8vUGZr0l1KK93MuBjhAUKxQQkWaUT7UsrFNcrwS1F
 7mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767587408; x=1768192208;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cmURYcj4Z0IPJrFeY/4ayi0qRX2k8lhAtEZ0Ob8xht0=;
 b=K4Z0MjO6hXGou5eoQdLUPR2AaZZWzmNAm+T9PRg96vMopBilBvFuLFz4wHz1kmrxLK
 5gokYgT9tpNE6FbVEa09w0FpLe54SXb2wqOLivzb6Y4fJXbgELqKhEdhv5dYPyEZmLxS
 Jm40nADXSG3s1dEO5DLvM5iR0aUymWqoimXdofPUGuuWtCgjE7m+FEHYEVq7Sz8h2PR6
 nrzzVOIuQYf5mnTr+yUMM/llGZ9ByxrGwlfSOmsdVuJlR/A6JR9IEpBGkiinPTKft/q+
 3BR4s+9288IwDQz4/TYmXKdRRBxDTS0oZmIWt+CSfTp0Uy7FczO45lqYlt5Pf+gbEuFf
 rRSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjAwkB2YY9YJ50HG0osvjmgVh2t/C07aq+vTlnLvzJn/G8bCpbVlnFzbtSQRo6N28xWkNz7v1zEw==@nongnu.org
X-Gm-Message-State: AOJu0YyaZNpkZPM1yzQTjn/yFCsmopWR5zaPn76iStZZPX1ApFS5D7d4
 2ofrEPUhjQGo8QYHSTW0jgEozlZ9HJ4yuxqd6ynojWmc4AHtFlPXtGFBipLNlkw2qtysGI+dTxV
 vzLwHJNc=
X-Gm-Gg: AY/fxX4jtVNQiHOr1rw8WrqMLxEk8BO7c/a2xHDRH8sq1mcrfPmK8wzQc7quYKwd7C9
 GLxifbAF2E0zJ7JzZh/x2OqQvUj4Wc4MxETze3jfUfYeiB3zUuQmo95F01F18uoDl3s5P875wBy
 up0QQCnpv7Jyq9WHeBb69y1e66Kxp8heWQdA5XCd/FkXjSrPK2pA4/1Sqcwm0qqf7hlki6FLrkB
 tVwta1YV9ldcgKZL8yq5m3/IGNwCePmmHaIbzI/vg6T487TI6RAvgIvS9ZtZEuw0MPFOMIXDOYb
 nSHU6cfMfjr43L+vXPjZgdO8SHqbq9+PalJMCiRX8rsnlXsbXzoBKGB9xdLdDoiJ10bD2DEr5x0
 /fzGTImKBCL1PyqPBgiq4+lj8IitmA7gx2CVrHTwmeL43+WG3veBrM4yPISar/qM9hA4KIshXLj
 rh+0a8I5GEzzBFgLCfrwasQ6ETz56YfQ==
X-Google-Smtp-Source: AGHT+IGBZlCzrkzOqmgxn14gfXh1iamwkAQbc+lvHXagI6UcvqxZB4vgn8lFI40J1oEnlA8OOqzWlg==
X-Received: by 2002:a17:903:245:b0:2a0:bb0a:a5dd with SMTP id
 d9443c01a7336-2a2f2a4af0amr491313975ad.57.1767587407680; 
 Sun, 04 Jan 2026 20:30:07 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c66465sm442745295ad.15.2026.01.04.20.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jan 2026 20:30:07 -0800 (PST)
Message-ID: <d864eaf2-4a48-4c0b-9396-740c8ee70556@linaro.org>
Date: Mon, 5 Jan 2026 15:30:02 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] target/arm: Rename access_aa64_tid5() to access_tid5()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20251231170858.254594-1-peter.maydell@linaro.org>
 <20251231170858.254594-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251231170858.254594-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

On 1/1/26 04:08, Peter Maydell wrote:
> There is no equivalent access_aa32_tid5() (HCR_EL2.TID5 only exists
> starting from v8); rename access_aa64_tid5() to access_tid5() to line
> up with the naming we now have for the TID1 and TID3 check functions.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

