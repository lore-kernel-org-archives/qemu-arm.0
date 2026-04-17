Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A455F8E4AD
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 06:27:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDcfo-0001rv-3f; Fri, 17 Apr 2026 02:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDcfg-0001pf-1a
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:27:20 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDcfd-0006kE-6e
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:27:19 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-488b0046078so2644825e9.1
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 23:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776407229; x=1777012029; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uZBK7VnQA184JDVn213bMuprP8pWfTARfJ1pC1t6qzk=;
 b=J45i7XewuHsAUzD/id32G5i9GIgxcC4Hj3t2kWvLqGHY3enc1gTxCmNpy7FjwHtf6D
 XybKErk9OW9Ww5OGOYFa3O+eiCFH03FLEcqBAU/8X6RhwA11BjIILDlewgczJujo6IdH
 0hwUA0tF92ovJKQgZrcqxWrVqcOtOjOeH/2WgPk3zXFYGHozisMg1iXDtYTiZnoOU18V
 Xz1Ybs+vJfenTRC++ZFHh68nF6egHaI2gi3+AdMwASPhA08G5F8iGS3CPiRMzZc7hrDh
 4iZDY3SFJEU3n8vXDhy51WFNh26FEEP1uyHA7RKknYFVa9lOoOS1InCu1puP0x4eJKjq
 YTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776407229; x=1777012029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uZBK7VnQA184JDVn213bMuprP8pWfTARfJ1pC1t6qzk=;
 b=JO1Rw6ouMTf/1jWgX9AQOrm9N8QZvAlx5TQRP7oqg9zIMrQQVHbf789ckppQ+qvQsX
 NXI7VNhUkpZKKaEuDEn67BEZKpIaD707Hp150Pbp2TvLcI7KJRrnQPvxvPWq1/OKFVe7
 7Xn6qg8LV6D5QY5CyuWsX+fReKWFi3fDCragcEaYsvtbIiKCeftY1onLN9MTOnzH6m6M
 rp6hvNsaVfrlo0z9JV+ZhmbCWovWIvvDrXHl0/Ncbqvme4Pj4QiZKUF+pZaMwZ87srDQ
 zQRls4/wK2YW30b5PPluxK/cDkSMV912KwKPraJ9zfQ95c9uDOlogjTo7wD0A8Br07DX
 qoZw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/hYOtKKiffwYnLJDB+J81MxiFI2L9n71objZ4LA//l9HAB8Edhk6yy9nyZyUUPkNHk/tQHy+au3Q==@nongnu.org
X-Gm-Message-State: AOJu0YyP1OX/HAlVB2E7KH6ikoB/BvITpH7Pzms7pjDleBpnUgC1l2W5
 xJCW/JFNL7eGWAD+PyseYEtFJC90RHo2uo5bWe0l+N6IgNDxCpgASbtGVtzk5oue0Cs=
X-Gm-Gg: AeBDievz2ze3nsSCMhLifJjzHMq1tb3ktcZ7w4cEBC8oZ9fE6Wuu22xLTj1k517bvuM
 brpuDSlMvCvdWwpy853nXGizbAd7yfFB7KPqkbzIPixUlKn65Mo3vhU1zl25NYUM62VRHJLZfBv
 epKs6UnqHD5L4bKMSiLD+GQoGR3NM+sQ09mR6UN7mJO0RjvmKyjSgzMOx7Lp4jdRKYU6My4kJXa
 Z66Gw/7IYHwJf6N/wN/3Vu9YKM2RIo0I85eYD+vBZYwon+x/VcFvge5ihls/s4lCYUbGYtlxSDl
 aJTfefy4g21255A6VLP1I+kpok8LPqPuwKV114WgwdzH/ch+jFlR+RN/MeTDERLxQXDnBc1b+B+
 ZnaZlTNqvwjykaogeUGpzEboO/BeC1ajXNc6x0f9e4HshAtEqU3xizYKRWqWfcERxoS9zWqi7pL
 fJNschCsfcoXi9EqgZNpmhAs59qq2JfoBpwnsoA6a+YrGO9/+uMXULsnfu1iF7M5AnS3lsd6vD5
 JiA
X-Received: by 2002:a05:600c:3513:b0:488:a977:8de with SMTP id
 5b1f17b1804b1-488fb77a3a7mr18327335e9.16.1776407229345; 
 Thu, 16 Apr 2026 23:27:09 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb1365sm1944840f8f.7.2026.04.16.23.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 23:27:08 -0700 (PDT)
Message-ID: <1738caec-dfa0-4d88-b7dd-5eabc075f5ef@linaro.org>
Date: Fri, 17 Apr 2026 08:27:07 +0200
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260416014928.1279360-17-jamin_lin@aspeedtech.com>
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

On 16/4/26 03:50, Jamin Lin wrote:
> Add a functional test to verify USB EHCI support on the AST2600
> SDK machine by attaching a USB keyboard device and checking its
> enumeration via lsusb.
> 
> This introduces a helper routine that runs lsusb in the guest
> and validates that the emulated "QEMU USB Keyboard" is detected.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   tests/functional/arm/test_aspeed_ast2600_sdk.py | 7 +++++++
>   1 file changed, 7 insertions(+)

This should be patch #1 :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

