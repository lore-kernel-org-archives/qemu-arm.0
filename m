Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A09ACD8CAD
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 00:39:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX6yF-0001Qy-Ol; Tue, 09 Jun 2026 20:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX6yE-0001Qi-OV
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 20:39:03 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX6yC-00087N-I6
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 20:39:01 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-8421f0e9c5bso2827437b3a.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 17:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781051938; x=1781656738; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+FY52UL9ljOj+o26zMfRGfGB94OLL9pcUszNxj/CUss=;
 b=RoFlJy6rZhEOOZx0hOAWsovEck1cAxf4zKJwQ14JJuIF5+oLWPBdiMWmkdm5Zs32a9
 FXHaDuWL4JXv8qbJk5/D16t9XsciIcUQuC1NfhPT43zEUjBWYjOaaKk2YpbZ3jgczY3v
 i/U3Ih+GCVvuYmoHFg92/IW6rJG5vPggy2Pusjxd40a1YFzJcbwfYVQ1sEdtp834q+wX
 Kqt1oZ7Rv2dFNez8ADSo5etDUa3t83qfpMnigzM9kd0Gl+0/4FmOmP0Irg9AQwcPfjbA
 XkGqhO0YtrnDAEi+OtRk9cZW+kD2yBypyHiaJu8WayPylhHrpkcJ+p793nutvKCxP+Nd
 Izjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781051938; x=1781656738;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+FY52UL9ljOj+o26zMfRGfGB94OLL9pcUszNxj/CUss=;
 b=oH9hixFu1ALk7wwL0C9lzivQQ4a04eeLjCyFuiGhDRa8bjJEvlZoIajIMQ1SaDsF+h
 qxAxDFXu4OgRuHiApk+RtbiadIl2s1fvAkhEVWrMsfOyt7uzpRc59bL/o/nSOWfh+Ivz
 sLaiAGKeTm2/d7kXzuMGH2ftFfmZ10OIdI6jyEqHmKM7tAfry8nHaU0q1hKl+z0GDqEt
 n3BpZFLgYfPMb7HEojAjDzm0qkRj4fuZdyQ/nvGXxBQWDekO9KwZ3WQULeiyaPFgQa9M
 q2kFOacVrukl7NuWEZAMsZ+VwpHeIvAjPzeZcneZIf3D6r/4mW3F3i94BwbvrAL6Z5sx
 a4yQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/xSHuvcjvhjRIg2neOr/TyAw5bGyNNQrBr/i2px+/10uVsu5r26lhgGfFFDSa0ceoEHkfTBk4NNw==@nongnu.org
X-Gm-Message-State: AOJu0Yw2M5Bor7nAuPh4KHeYHSmqx2QnXLPXINURho1+fy2mM6umre1k
 OxU/R816tuGbV0YGNENxeZ3Ea6UZ3olfEFcDK7AHugfXyoiwKung7qIbkPEEwRtiTZU=
X-Gm-Gg: Acq92OFTZSRx0CGypiuaQ2FX7UMt8AZEpa8mHI7DI6UP67eM/wvq67ZQxFylyIADJpD
 L8OuZTf1rw6GnIFz2bJ2Va5CNZBfZ022yG0vhizPDRioSTuiQi0vpzwgi8sE3XTLg7mPYQSVawf
 p/E4N1wrxydwpPKH8oQ/nYa7rEDhXNIxZL/FxiRS4q/sgC7v+Q3sB0doLBx4hI6vUj6kM2lIw2A
 7UEKDrGRWka4WgTnd/BNrGM4OrLHCJvLKyNSEOTzPltuOnA5S4uUVcUItwbAqMpJPKWC24ihLIA
 LsHfI6MsfT2jFbgmc2+7GqsdrNNgyXKLIXvQPRZXA3XWP+Gi53n0/TTvDLRuqlG38GHL2ZgP1z0
 Rz00UaSKWkda6va8Ynz569LndsWrfkdf9oB6LrlA23rrhAPG8gUjA4WQvAFxy5X5bKk5Yr5e1A8
 jKt28LqeFbv8TfKaJ3WTPogRHVLS6yGPPq4yZHdlHz5NmewOk=
X-Received: by 2002:a05:6a00:1304:b0:83e:f208:b113 with SMTP id
 d2e1a72fcca58-842b0e1c959mr24170802b3a.7.1781051937919; 
 Tue, 09 Jun 2026 17:38:57 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84282915fe8sm22827891b3a.54.2026.06.09.17.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 17:38:57 -0700 (PDT)
Message-ID: <da486ab5-9745-48d4-99ec-2c40b5eb7dae@linaro.org>
Date: Tue, 9 Jun 2026 17:38:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/27] tests/tcg/multiarch/plugin/check-plugin-output.sh:
 take test output as input
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-3-pierrick.bouvier@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260609214745.772536-3-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

On 6/9/26 14:47, Pierrick Bouvier wrote:
> Instead of executing test, just read it's output from a file. This
> allows to standardize how to call check plugins scripts.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@oss.qualcomm.com>
> ---
>   tests/tcg/multiarch/Makefile.target           |  3 +--
>   .../multiarch/plugin/check-plugin-output.sh   | 22 ++++++-------------
>   2 files changed, 8 insertions(+), 17 deletions(-)

Could use "done < $test_output" instead of cat, but

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

