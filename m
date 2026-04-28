Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC40FF885A
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 06:10:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHbeX-0002gM-LJ; Tue, 28 Apr 2026 02:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbdj-00027e-Rw
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:09:55 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbdh-0007oR-68
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:09:47 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso154867545e9.3
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 23:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777356584; x=1777961384; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VJIliAY2FoDu9qYZv6alSSLBi/On3sCWsnPpCQuqEww=;
 b=B2I4rI0QZm8AK1rwvdUCoQvEgHPxYUZT64l+BF3YYibGRcTFF4ofPh9grs0KvVR/Xm
 D0K0TRIgwvDzPMGz5IaWUo/g9uyRNaSm3xRsihwJ5TdZ3MPyYuMojvOWo1LQWNu40XA1
 ly0OMUSEuOyVVU4RCtnyFrSySBODqgCLJi/WGP7VOT83aSQre1tgJgRj2ZMBUvu2Swdr
 2WPBqCxiC3x5jqUCIRvDRGv0+Kz2EgeD7L2jVwoPGMPCtIfYDo/zWVRCyvwA4yxcaqWq
 jv4IBYJ8iAOTLi3E+jSI4PHexRQmSIUUdAYJB80HH7SoGOgvjxZMpWuRlXYrdW87Zhg4
 rk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777356584; x=1777961384;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VJIliAY2FoDu9qYZv6alSSLBi/On3sCWsnPpCQuqEww=;
 b=QszmJxaqq08ytNxaLYcs1mRk2mJVyaPT7WOfJrmqYdwAGM2yHglz27B2gWzdh9PG3J
 a6EzRiXtoEVZF+mlilSMKY8PWitbo+hdL1qBsCC+nP6ndTK6exxdkWzjRrQFx7SedKu0
 IM8fYW7DD6ixuy+/U0OABUCRBxu4urfd1n81D1QjQmjEFnyD07aFdl0ufzQjYlAtbTwB
 fM2ZhYSZnmWw3gQbYv0c43KSYeaAci8zXWISrWXN1sfdl4NC491nSyS9v6EAjVxQbf8S
 GlJVkwti12U5NOVAxD59/O3w2WkBOw8vFXzIEWzrohBkw0RaaggpmMsbb+EVFm4B2m7t
 pCsQ==
X-Gm-Message-State: AOJu0Yx5nbx+T4A2lx94FhplbWuuWVmrpLLWAI5E/BxMhgkX/eDFi+2V
 sWoYQj/RqyQ5PSAyPkiLpc2l9zTs9dTmBYFFvrAT5zozD9DRniRDuzq1vDoCxZGraNU=
X-Gm-Gg: AeBDiesDeP1y+iwoaJQsU7PhZ0+pGJ/goGTAcW6WTZ5zFuTL09QHg5iwgKAONpzE9Zp
 CcPnRg7c2TnNkyg5GF1f4uSXbI4mmegOv6vtFDckthmE/Ug9y93HbvwkZKA9tDK9s35ORSezxjJ
 gsnguSUaiTq7ANdfUO8rTcwi1naixw5VXDVukTVgs+TLxPP6s99v4JAZGI7Pt/LXGjVou21eYX+
 ZWZKwm2A82AbW7ZEfJ8nQX1RXUjAGRiGKdtE/rYMDs0xDXcONDHASQASfDUvJjr/TKX4uVtbLP0
 aiBzLjXM/RT6OBxUYJbQTxA+pkEGSaCU121R8BSVHJnxohCgTL5zsCRYzQeqRi3xlHbYhO+bohn
 oCWAFXWyQSZNywJh4poyQsWQ6dSp+uRAVtmhz1020h3i65XaVkJpLA8b3SSiNZLXjJ+Cd8Nrxj4
 HSVs2d/iid26hIYnUmxTH6gc5flu8fUwWL+2wth3ygQTgUETKkN4iQDKKyECZ1xRSUCZidMSj6h
 b3T
X-Received: by 2002:a05:600c:1d20:b0:489:6c22:e081 with SMTP id
 5b1f17b1804b1-48a777b4b4cmr31345205e9.0.1777356583599; 
 Mon, 27 Apr 2026 23:09:43 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a775d9329sm15932035e9.4.2026.04.27.23.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 23:09:43 -0700 (PDT)
Message-ID: <009e6600-be19-4c28-81b7-b9a4b45c0fb4@linaro.org>
Date: Tue, 28 Apr 2026 08:09:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 52/84] fpu: Inline bfloat16_pack_raw into callers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-53-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-53-richard.henderson@linaro.org>
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

On 26/4/26 15:39, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

