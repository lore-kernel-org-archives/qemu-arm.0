Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49D0F8DFEA
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 08:44:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDeoJ-0001dz-PC; Fri, 17 Apr 2026 04:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDeoH-0001dA-La
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 04:44:21 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDeoF-0001Dp-3i
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 04:44:21 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488b8efed61so4610445e9.1
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 01:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776415456; x=1777020256; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I9ONhNnfPGD7Vg2OAy+xTrrKGyqdfiOiZUOUV2O8k7U=;
 b=O6M46r7scLOOl3mqhmPKcQGDvBkuRSLrPdMZOY4rj0iMsR7aHVSnH17+A6nYTZ9kBV
 VrWxMq121WLbPy7x2/t7b5GyLhKQ0v9cBK8mAaBNgIPq0gSS8QBltmO1HsT2T/xC7YQc
 A+x7BaWpslk1tkCTCTgy0mzItvmFPTRUFAQVN/xIkUnozR5tepiMVWM8Wr72u7eu4Y/r
 876QoKgFWf55JaakJbEZ4Z3EuLM23rbkekGGLFaBFD2DYD1VmrZ6ExJz/fLc0Tuo3akN
 WPlzT4xO9ZRYyOpWC4K9cFuZpWVVe9V2mLrOdwXZBcGy6e+wwOFX1Vqm0wS/7qA+3QhV
 M+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776415456; x=1777020256;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I9ONhNnfPGD7Vg2OAy+xTrrKGyqdfiOiZUOUV2O8k7U=;
 b=TWuu/N9+6lt5Gq7ZEZMy2dKR2A4GYPQWKSjUjiVWzuwSrZCZn7ajuSUN2FwdV/Pp1a
 Ss8/MsDUtJ4FTCHQ2J9n5+8F+3/UgGmeLXIBzkaw5/PJ89A6vF38dX9JBsV2mu1hebkJ
 FVHky+DuhcmjfMqCLOye47IejgodSy/gNMXVeSpvXVKX3f1asUgSI9VEemQe6Y3/puDV
 2Y2/y64fYjqeozYrWmOpOZx506pu61lzcCnbW4ZYcbyZrX2u4LsSW3jWX0CK8Wzxv7ov
 j78BDXK4kMmY3AMaZBL9IV7FAZySrbPbueFTTPU+fAGRG+//b4xequ2+gQ1s5LFxlwDY
 5nkQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/xAaFJ58fdFbzc/g+uYiWrjw55pZwU+ZJPpL31JXYZTtaRvMlTqG48ZSgYHLFPP/Yv86zb//jikw==@nongnu.org
X-Gm-Message-State: AOJu0Yyo6DLOjUBI09vwo9LG4umpNvfQc9+HPtY4SJEVqdEF5bG91Wwg
 Mh+oPJSJiompFhu8G8jWUoJE5Hy3fRRE9OkHmhcMXkWQiPsRMahksS4OfVer1pwBNH0=
X-Gm-Gg: AeBDietLN26XmJFpx4go2MAShCmdrCMGIThi3S6kFvMvqcpXFVGjlzVI1UHyaFmyvRY
 QEXINqyRL9jxXDHgno0eYWgy3FtXYP7zyUJwjcMElqfB6SRLL8NaiPM/F4xmz+9rnmdDT+KQrbD
 97NU8OVqXdCv+9eSM20tqlx5sIJH53AgnL08/MEw5CQCh1jv+mwpZxLuozXCgcafn0Gtd/9TOFO
 zjDWeDBHC7xhl+klqG+x1z20Dxrt9HG/HYsZA0Wq4htCPURV7I6xvi2XVSPEifE+J9+ro4Worur
 bUeh7jhN/n9Cc+zf0Ts7+kk4msrCh1CA7AUQsud/zDePqA9BhSBin7fMavO/IYeVB0db/wUC+OF
 dJHNI56FJbX3Jium1YyMZ9XfyVIwrkuusfkO/bY1F6yntUP6o47AHT1dydgTbeynQtqxqsbFjHt
 LI6lxib9Y4qwsK0j+xtv7hHwmja3cEWt2raCI/kR/5LKy0U2qFABxTZd/fs1gV7oIq0h01W8jmo
 LjX
X-Received: by 2002:a05:600c:691:b0:488:9ec1:4976 with SMTP id
 5b1f17b1804b1-488fb88b81emr15928825e9.8.1776415455659; 
 Fri, 17 Apr 2026 01:44:15 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e591cesm3941926f8f.36.2026.04.17.01.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 01:44:15 -0700 (PDT)
Message-ID: <4ee72e0c-2fd5-469d-84c0-ca0bf75f1143@linaro.org>
Date: Fri, 17 Apr 2026 10:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/17] tests/functional/arm/test_aspeed_ast2600_sdk:
 Add USB EHCI test for AST2600 SDK
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260416014928.1279360-1-jamin_lin@aspeedtech.com>
 <20260416014928.1279360-17-jamin_lin@aspeedtech.com>
 <1738caec-dfa0-4d88-b7dd-5eabc075f5ef@linaro.org>
 <TYPPR06MB82064C14C44392EEA1F98BEBFC202@TYPPR06MB8206.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <TYPPR06MB82064C14C44392EEA1F98BEBFC202@TYPPR06MB8206.apcprd06.prod.outlook.com>
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

On 17/4/26 09:40, Jamin Lin wrote:
> Hi Philippe
> 
>> Subject: Re: [PATCH v3 16/17] tests/functional/arm/test_aspeed_ast2600_sdk:
>> Add USB EHCI test for AST2600 SDK
>>
>> On 16/4/26 03:50, Jamin Lin wrote:
>>> Add a functional test to verify USB EHCI support on the AST2600 SDK
>>> machine by attaching a USB keyboard device and checking its
>>> enumeration via lsusb.
>>>
>>> This introduces a helper routine that runs lsusb in the guest and
>>> validates that the emulated "QEMU USB Keyboard" is detected.
>>>
>>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>>> ---
>>>    tests/functional/arm/test_aspeed_ast2600_sdk.py | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>
>> This should be patch #1 :)
>>
> 
> This patch series updates the USB EHCI model to support 64-bit.
> 
> I added a functional test (AST2600) to ensure that these changes do not impact the existing 32-bit support.

This is also my understanding, first add the AST2600 test to ensure
we do not break anything while implementing 64-bit desc addressing.

> For this reason, I placed this patch in the current order.
> If you still think the patch order should be adjusted, please let me know.
> 
> Thanks,
> Jamin
> 
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


