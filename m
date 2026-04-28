Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37A5FF885A
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 06:06:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHbaw-00081p-8A; Tue, 28 Apr 2026 02:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbaI-0007oP-4W
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:06:24 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbaD-0006uT-SU
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:06:11 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43fe3e22e33so7084399f8f.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 23:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777356368; x=1777961168; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+rm9Hoy31MeEj9OFlS9+anNDsh9EkzpabdHA7DEMnxU=;
 b=ov56OGCQ0IcZmGtSK/yXvnKRpgk3dZ5q/Tf0jm/LN5CCUmLGtp6FT61P5SsHJHaeIj
 uup4W2P/qAUyPLbAo0zdhZTSd9jmOK2DYHaO+UuxeB7IxecfVHfkeYMAkqXejS9RDkh5
 PdHtWX1N9j/XmPJmTorafE7yznBTO0Uhk67xV2KqH2N/PAGKA8z+FVeQz6p4piDF9LHY
 2jTgzew1IOCpFVRxEPeeOl5f+6di/KFO0F3Up7Fgz2Gbg9DiO5UQ5YKLsK1nH2P2sEUH
 JwWH+15RCGazdXFaI1vGYYeVNkvn23zuwT2NiZD7RnNOS1qKko4NpfC0bbAVKz0ulzKm
 nDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777356368; x=1777961168;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+rm9Hoy31MeEj9OFlS9+anNDsh9EkzpabdHA7DEMnxU=;
 b=P7uFKj3Z1SWO3u3w2txaHQjKd+X6i0llXPvBIqL7wKiHn5vNOXoiDt6JzRx9KtCjaB
 SFOFP7c+GbFAjyh1Ii9HOgnF+Sv5cv6g6J2GFZASBozLfWi59xR56tvuhO1Zz/mfbaz8
 FPrtKHnolsi4SoqmxyVTRHYs1YCOTqZjn5HMUlzZsRJ5mBQHnIsa2eCKvgwO/uJgLK6S
 Y/DkswVzFZAd+sOWHScB+oxbcumofXb5K+evsP5BeSFNWjVNU/bWBvSWNGUk9xUevn+p
 mqmv+PO5pKEXCs15bJGpPBxFFbqe0zx1HQ/BthDs4xMK9Tg7g7Txm7FscNMItdNTaNr4
 cCgw==
X-Gm-Message-State: AOJu0YxMIIfFYrBNN8TGB9N2r3/G8T7b4rpx+fKGYqJ9vPkViwMyKBLn
 2KfyR+g9U5O9qyJpQXVDP4M6i+ucvDPGInrRV3AnZT9Weiyoi0jEeckZ0Uq8SwAdNdI=
X-Gm-Gg: AeBDietcBg4o/EoVGNuiTPY2B6+oq+Uj4wo3v1MLf/XANj5BLZm2IDwTfT7P+1Ukrmy
 tjzS5jpmfKWM0RqhlDFpuXq0ianWLh8unRxglaL13HrkgL/dwNfNJJCBe47pPYbEexoEXLWsBkW
 OOCQL4M/YvaGX/CSjY+0qFUpYZwMvHYInMorMDR5az4arMRMQymTAelGbjz0o/2uHk8McWF/ojf
 z1luUMP2z5YdE2MPc14Ll/CfoZZbf13AX9ohaFOAjvYf6HBfrkC4aKWsROyAeifYBItQfThFoQR
 h7NABbloILbJfoAHhX8V6v62EywkEffDE8Usv/qMBiV38flzA9RJrqsDz3hbhGsPYdVesjr/0yK
 vRrH6nrBIqEm7+zelJCO8UgTdxp9VSrHUvQMNlYCF7ONTCBAfAIbmWjm+9ze6J1GzBHXZAps+xC
 tuTK6QiYLesw9p5qO0LUVWDpNTUNmLDKrXvLNvWH+h1NArxYr9VgJ4EZ+pSAuIrpbH0zJhNqKe/
 0z3
X-Received: by 2002:a05:6000:18a4:b0:43d:7e11:1b72 with SMTP id
 ffacd0b85a97d-44648f28e43mr2973123f8f.9.1777356368194; 
 Mon, 27 Apr 2026 23:06:08 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4463cb59acfsm4825274f8f.2.2026.04.27.23.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 23:06:07 -0700 (PDT)
Message-ID: <cd599efa-18ee-4cd6-84c8-9887aec6eaab@linaro.org>
Date: Tue, 28 Apr 2026 08:06:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 44/84] fpu: Inline floatx80_unpack_raw into only caller
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-45-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-45-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 17 ++++++-----------
>   1 file changed, 6 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

