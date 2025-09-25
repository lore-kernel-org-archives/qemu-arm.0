Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99282CAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 10:39:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1jNH-0003iA-Rj; Thu, 25 Sep 2025 06:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jMy-0003bS-UC
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:38:41 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jMn-0005TT-1p
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:38:36 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46b7580f09eso5074645e9.2
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 03:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758796696; x=1759401496; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9PbL6NQnWyxoavrDNdDaiuOGCD/mo82PXktNucPzjYI=;
 b=XGFP6hxoO7Rpe9Aol00vb9ab6L+V1s6Vhpq7RwlHoFYYCgMkR8uJXKuvc+FIaHzNsz
 Rsv7orvsmLlJ5a1b9t4wqjmW5A2DcCk1uxbse0Wyv+Nkte4GcC5l+JEgG6emrbDZVH8Q
 Vciq2V5FJlh0/aOQ0Oeg+UVeSNKVaJ9QwhxLts9o9pyF4rRa//qvQzyX6NAck885G1Z4
 SBTRMmajQOfmceA4sxXv6teILAl3VNg11lrSqQ+PiMmzWbsbcWJZxcaEZVH3bKfiAa2p
 LL9plCkVg0v1qrU9PyoRMiFNsvACiQaDziDV4F/qOQNMvoCJEjgJUMjIhy+BJoJ0Delo
 B6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758796696; x=1759401496;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9PbL6NQnWyxoavrDNdDaiuOGCD/mo82PXktNucPzjYI=;
 b=S+Hef7Ir+u8K5sKzbxKG4lDeNCnfy6enpj4SnvGoXs11YQfYHlBWvYnydhMaLihFrD
 g53wNR7d5PNP+Oqf7TfklLUIhZiwUSbu6DGTJ2eYzWZleu3MpDFTlIKlK7FA2uOILBWA
 bCulP0HFU5RMniRHgnM1BeTz82ddu0Ri+iAm+hIzzssBNEocxy22adLjFAWhZV8wH1nL
 kUkGsjmsX+ClcStjdNNK2Vh57GzH85P2xPoTYe0ZYzARhhjLH5/lqN6pxmOudlCbP/wz
 ujJm/TzqbZ85PvNWmsjB7liVVYmx2m+H+UtZkK+SYCd4sJfUyQyglbT2k/9bQP9Z+8iq
 CMBQ==
X-Gm-Message-State: AOJu0Yy5dGC5dCXhuJ8tX+DLdPfca58thkBY2x8CZXPCLQKY5xMpbKeM
 HsRosBaiSuUSoXnRNCaowbisuD2+PNHgNdXrZKl5XOnK/5rWAaovvuJ13Ui/lJEiku8=
X-Gm-Gg: ASbGncv70mMvA+ShhXv/k1jN9wdRkqfEpWOfjbGtYySaTXvyf89OptDyodDOQIJcJbS
 o1ToHYVGgTRHb0ZA2tc075hSpJZ0EV2FlTEX3cW/bucIM+clL7OrQQwE9bASLcsvqj1YJKeBFYY
 2wHCWEw5qfoHTtnI5pCogkkCSx2AQ42XzIxf5/LkWgozqGz2AkZHXzmsf4YYySHrf5T6cqqqSJl
 qSDo4sMk5VRqLHTdqdH6+7BfWIMf9VGGkyz8p49gjkEOSIBFEwQNfQLUm8c10cHZSE1c9UMKKNB
 3HOr79th+qGMDcOrfbckiQ4GmX57dN3+lrvxmUab49U2f5/0ty3qsX+ZIl7SClgLM1re6GJS2Yu
 PdJV/ltEeo66s4yN9OFDAnpOv1MH+7wAyK0WJW5/WIKucBSyVgfKyFXvYJLCr8vRvNA==
X-Google-Smtp-Source: AGHT+IGLe9d3Xg67w/f1Zpl8nVLJb+4ZGH9pTmXKHHx5h1rBsJM4SqS9BfxuX+grVams023mcJUGng==
X-Received: by 2002:a05:600c:35c8:b0:458:bd31:2c27 with SMTP id
 5b1f17b1804b1-46e329fab19mr32973615e9.23.1758796696506; 
 Thu, 25 Sep 2025 03:38:16 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31f1dsm71175885e9.13.2025.09.25.03.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:38:15 -0700 (PDT)
Message-ID: <8ee0b130-6504-4922-af32-48db65d15a42@linaro.org>
Date: Thu, 25 Sep 2025 12:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/36] target/arm: Add CP_REG_AA32_64BIT_{SHIFT,MASK}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 16/9/25 16:22, Richard Henderson wrote:
> Give a name to the bit we're already using.
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


