Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BCFCAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 11:50:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1kU3-0001Ki-Qh; Thu, 25 Sep 2025 07:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1kU0-0001KA-OO
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:49:57 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1kTx-0002WJ-DQ
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:49:56 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46e384dfde0so3957085e9.2
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 04:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758800986; x=1759405786; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GrslQH3j2gS6RCEFMkGPo6cpGZbJIbtUB9z8eMpeoRY=;
 b=ciltX4wwULx1WMTsSxW0z44tNfIrakFqjea/zropGxYTykAR3xjxrwyaUzGfGtUFGb
 p8r7gEZYBjgp2PFciQOf+OoVfavg5g5du78Rs+N1bTUjpQTP6N5inJv+1whwhFmwzi1a
 D4Kl72Sgl+Rwnn7zYYV4qi0XBeIdCJDR/8a9ka3moY2nFQp96G3QKZG7JZYYwWXWGl7p
 UIbCLrP1ro2NUO8oQObIA/TtTuwJPi0ibM8YZxEdzmaGaHs6jEQfHa/WjM8+vOcIg4l8
 N2hXcFvSCbqz/QkxNsRSINJEXfz3vMx6nQp0jhOwiBeckqkVx/6kpA7urxPMwha5vPOZ
 Qmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758800986; x=1759405786;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GrslQH3j2gS6RCEFMkGPo6cpGZbJIbtUB9z8eMpeoRY=;
 b=B3xMdswvpJwb68KB/g030deWsjRxso/1cp0BGztbV/wWSeoR7oSb2aaV9qRCRdj71T
 LPHAz5YxPx7ujDM9VxZ+WfoTlUadhXeXqeqIek5cZ4caF8Z5fZsdnlFfF0cW24SqlE0p
 mSi1XYbmw10XPsRNRXuQgUb+BLOayvHkfiQMMJ5dGPbpb4L+CbyGJvyYIsnNCJjTR2np
 Mq3fJ5MB7TbJfQVNKnaj14QZbwF2geIO7F/xPsWYdoIiCQGN0RiU3GO0IXnybQCEYIoo
 R97y9i7AFLrmjTiJhyfXOF1DjhXasoErWH9VNH7zBJJtAh/2kvIbJvblBpUDK+rxUIt9
 fLFA==
X-Gm-Message-State: AOJu0Yx9sga+NGTAQHMx3JtaF8FLRxLBdDjPJ/R734rukv/2O3Y/9FtG
 fFOW+qN0N/dK4xE8m0cf4sXH1J2vGOYuzszgjJuLi9+e3QfA7XvuIcxjU1/BsZWT9vo=
X-Gm-Gg: ASbGncvYj8IrFe0putEP/FfQUKsLQFNw8CUdHgfHTKw36yk/Oje3wv0Flt6Dsi6mCkF
 PS45u19nay9Lc29AQ5WuIsRKpxfqTAOWl63lQo68ZYYiW/cBUFu9T4GuUIBZXIm0VLjr7xHZLAa
 LhzfvMayNbBLbIUM969Zi9m6vNCVOHsLBCAVE93EhHGhj6dssbvUVNpKJdWrti+fYMLiUfo0POc
 7Iy+Jz7IvaWA/TKDU2wj2J8GQ1X8JnQOscdNcecyiSI0cRF8bV1RPzB1/zDDbCzy+fCX51WhSM9
 Q4No1EUUjprbDhXuNly8MQ2BNQ3Bko4qgMO+7jFztrWNmF7tRUOw3EDJ88nv0vV+GBxWq7nsZ2q
 juhkVyCLkzyRMa0Vpka7BR7UHVuT6VbbK9rS8daytLieiiftR6yr82nk3+xSoqnKlOg==
X-Google-Smtp-Source: AGHT+IG1sPx0l5eU8N9L1QmhlTviUUBgYwVkpQSUcDWxmb78Y8hn5ssOqCgzFz1S4FTbbruRqwtSyw==
X-Received: by 2002:a05:600c:1ca5:b0:46e:2637:d182 with SMTP id
 5b1f17b1804b1-46e32a08feamr38667365e9.28.1758800985673; 
 Thu, 25 Sep 2025 04:49:45 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc8aa0078sm2637874f8f.59.2025.09.25.04.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 04:49:45 -0700 (PDT)
Message-ID: <f8476922-5594-4a44-9ae4-ebe95d201887@linaro.org>
Date: Thu, 25 Sep 2025 13:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/36] target/arm: Move endianness fixup for 32-bit
 registers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
> Move the test outside of the banked register block,

Because not related, OK.

> and repeat the AA32 test.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

