Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7ABC83F10
	for <qemu-arm@archiver.kernel.org>; Sat, 12 Jul 2025 10:25:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uaXPc-0006gi-Uo; Sat, 12 Jul 2025 06:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uaXPX-0006O2-Vu
 for qemu-arm@nongnu.org; Sat, 12 Jul 2025 06:24:54 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uaXPT-0008Jo-TW
 for qemu-arm@nongnu.org; Sat, 12 Jul 2025 06:24:50 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4560d176f97so2130485e9.0
 for <qemu-arm@nongnu.org>; Sat, 12 Jul 2025 03:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752315885; x=1752920685; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HSfZDC0vov3/SEuDpR5eeoQwoq2SNjKH4mFg1TnOJS8=;
 b=SbrJH8LJydbctBJ9UT9irN27la4LpCximkoFnDUxWuy6Fvr69G46kybJdPgsmJBhB4
 FXgHGLUMISHbtJYRrhckbz0qfzwTgyzweHd1Zz92HtfiqgrNnBp6d4uEs4ilDtrDKW3f
 xOnHueYuk0uVlOMi1RLoPGvTfSWi1AplEVyMvmKaiRYlQZPClVLK2iDCPQYvDvEPRbF8
 JLm0gIFP2E78G9FDEVOyB8ZgM2OYaDWnziOggrCPz32QSX2cLn6l9gohzCpyJfLKsRqT
 dpY2x0It8nUkTN7RDcoHO1q7Q0ZOt0XMhvAPNJEKlRg5dSn/EPk9BLk+U+wk2etDoP4l
 5E5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752315885; x=1752920685;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HSfZDC0vov3/SEuDpR5eeoQwoq2SNjKH4mFg1TnOJS8=;
 b=iWn5wbr8l6NJFNKQ3h9aUNxfnonAbSmDPRPjiSvxCrQrOcvBthyrPRBsl5cHcAxzTa
 71JCy1TSJN4dR6KIyd2xPlWBW5s364jfBJZTa0FhTUB+4VgEBF1IhxBV1eT3xXu8YbpR
 XiBHvBUm7jddVSeIlXB+4muKNrKz8BiujGABfpCf0JypMwlTEpnQAXbgrBBO8222cTtG
 tnVh6PM3jw6d9PZdR4uTG3wZAPhwLbigfGeY3EwEfDxdjgmGDociZLW1A0K5Uliegqpi
 WAoKQLN0XjjYr4IALHBomD0nZNdpbfO99M2LPS80J1M6XxS660XZP22WU0xrjzHG6pq7
 V9Uw==
X-Gm-Message-State: AOJu0YzDyX14qvZUCfVtPHdLSvJus3OLXZsZZYv8GBUCM5LZxBxqWNtH
 ZJSjrK2gUmrubdQmAXynRr6zOCVl6HfYF/mERztid0p6K+3pYhVYRjEhKImPIRxyGcw=
X-Gm-Gg: ASbGncuBf2rb+Qu1c23mFI+abrNUSSwC1zAb4nkzFJ53d5/7ILEhJLBU30VdWMATUsP
 hgCWXpojnkd55wjZ32zLalUZD2YK46Bi/Qk0IGqfrp6PYZ9Ri5BOu6//iPZRJ7I0Zfs3IAIjktr
 2r/U2N+BOYMnpz7eF36o+ROMfA2lYbGGQ9ONH4U82sWIiEP51x2579wzG4Jx2iL/c2yPa60bXWh
 DjVHvdeTXMof4kYwvgAC8bB1MScmAdCOU/UjxO0WoWWjen54tjTPLBMxNXak8G082PJqZtq6G/7
 flnnt/h/s6va7jFG+82X/Z/b09DR8Tky6rV1dSw+bADunLQdHaww1M6lR6ZNHVrkFHfBjSWVk1n
 KAB8liuejd4x+bVkP7OndLc+b0AhZke/soms75wvQ3sY1aLC2JvBn4Fln724Iq8HpMJGlH8qO15
 YevRQ=
X-Google-Smtp-Source: AGHT+IGk0JRq8y/ZKQ/apUbVqs1JfegRdAEi633Y+6DiiyFuys2abuyvlMm0TvXtog7V/CHeBqfxNg==
X-Received: by 2002:a05:6000:2c04:b0:3a3:4baa:3f3d with SMTP id
 ffacd0b85a97d-3b5f2db14dfmr5198818f8f.6.1752315885383; 
 Sat, 12 Jul 2025 03:24:45 -0700 (PDT)
Received: from [192.168.1.117] (lfbn-mon-1-970-120.w86-227.abo.wanadoo.fr.
 [86.227.5.120]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd437fb0sm73613895e9.5.2025.07.12.03.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jul 2025 03:24:43 -0700 (PDT)
Message-ID: <531271d6-f243-496e-b36b-431eded7ea79@linaro.org>
Date: Sat, 12 Jul 2025 12:24:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] target/arm: Add prot_check parameter to
 pmsav8_mpu_lookup
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250711224915.62369-1-richard.henderson@linaro.org>
 <20250711224915.62369-2-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250711224915.62369-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 12/7/25 00:49, Richard Henderson wrote:
> Separate the access_type from the protection check.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h    |  5 +++--
>   target/arm/ptw.c          | 11 ++++++-----
>   target/arm/tcg/m_helper.c |  4 ++--
>   3 files changed, 11 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


