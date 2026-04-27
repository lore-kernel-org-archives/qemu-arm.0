Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6082FF8868
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 20:32:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHSd6-0005lk-8I; Mon, 27 Apr 2026 16:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSd4-0005kV-NL
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:32:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSd2-0002lk-3T
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:32:30 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43cfd832155so7925682f8f.1
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 13:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777321946; x=1777926746; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S6EkR0R4g6DjyArhFcSnQbudqDs5dkIUUBDhU6GnVvs=;
 b=JVBQw960ppoZNh5DDnc/4aEmPw0z7WOX1YVdc6wX1kSi5AE3XC/2xsqhsTH2uskvMx
 HHEEao937hqG60azuctkqIbOW5MKZzUrQTxELinWgqj+xO/C4QuYdYnFsEPjLlvbVc4U
 GwU8Ub5Y35lzN6CqTQdng7rsoPNaXdfBO1ZrI1a8PfcDrva9iG2jZ4V8WITL41Z7QkcY
 QExwY9muBW9ohyEUSzzWPAubF7Im8LAzJIoPDA2MvS+J7XwPnbYNSHuPNo40Lh9kJ5Ep
 dmvXuihEJ29C1oT6YJuBryhZpN4dX9uj29Ht4Ul0GqEQ3NliYtXou4ULbambgXfrHS/e
 pGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777321946; x=1777926746;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S6EkR0R4g6DjyArhFcSnQbudqDs5dkIUUBDhU6GnVvs=;
 b=jwcta84G4fd5n/EOZzkr68Bk/jC31VbAcQq8mnQee2MDkuIavIgIBip9a5II8EuNLj
 eqBI9Y/bMG/PPx0Y7LtZRbj8VUU/5/OoZdmSsAUO2w7Gnuf8Jb102rf0WLRRk9Tjo7VT
 MTJkE4/jAURcVNcnIDJINnrCT35lmG/JWpxjRy16EmzV5ZP55BOw/5uAX4Au6qLw7uR5
 QqrTHI0R7o16270gcDqnfW3jToCCkXASQYIDNQsb7tjFDazlTfX2NxPbe+WusSJ6EYRc
 fc3Uin6XCZ+mRcu3rD2WsAkU3xQ6qJhMtJ1aMicOjrKLC0YC1tXkF9HfTaRI8A68gCWY
 88BA==
X-Gm-Message-State: AOJu0Yxh3m3I8CBKU4k0ol4WdwBlgD9CU/dMOhRh2Kb/FBkYuVDp0Pmv
 NAEeknW2lo6VLDz2zIrvIFrhlkp62rsRvsxcVvDwnlUy+b2e4rq49ziaDjKFLH44Q1A=
X-Gm-Gg: AeBDieu1JpMILeID63IUnWMFzbWAf12/9rwIj8cPyQjggNG6aVtcU/4wQIyW0+cQhU2
 c2PzjXmzt7jnwUbzVv7EskltZA1WQjiDJolvQK7VghccbmAIUCFsQJbqOTEaJLZfxID0rPFLaiI
 NazGmx0Z2pdciC9UUH+OsOeXR6McDrN6LobeZ2xR7k1CUb5DmlWf3Y8sM7kWkS1Pu0twwH9evah
 GlBEGL6/E0pPOAbK9J4nJTZN3n1HBzHz4vhQ2L0CpQF0ALFi11U9wtfBgPe54wtu5hn7PlLkrow
 z6Cjw+sKn+qMGP47JoSb6VlJ1B51DgmDJME6TJkg0KQWJLhHd23juLL/zSD7FeFupfKt6SRxAtl
 IX/yS6o8WumtOA2TmHS5xtxwTEczAPdgdfQIt+S2SZILZfkvBY7q6eg0xvT4msCTnnWh5uFuCU9
 VC77jcr5Xa40yNQoFYtsNiYbFiTkVqBLW0d9VlNVoPopSmYbMNqn1K4k6FIcxDS7TbmJDn6esCE
 XJv
X-Received: by 2002:a05:6000:2283:b0:43d:a37f:8d5e with SMTP id
 ffacd0b85a97d-44647ec67bamr568433f8f.18.1777321946284; 
 Mon, 27 Apr 2026 13:32:26 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4463cb59d5esm1023533f8f.7.2026.04.27.13.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 13:32:25 -0700 (PDT)
Message-ID: <ed170a9a-90ec-4154-8321-8bde8c408f71@linaro.org>
Date: Mon, 27 Apr 2026 22:32:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/84] fpu: Drop parts_scalbn
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> Use parts{64,128}_scalbn at each call site.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

