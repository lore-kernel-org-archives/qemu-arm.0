Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FA1F8D76E
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Apr 2026 19:52:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDSkZ-00041U-2V; Thu, 16 Apr 2026 15:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDSkX-00040n-40
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 15:51:41 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDSkV-0004TM-Eb
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 15:51:40 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43d03db7f87so5268808f8f.3
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 12:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776369098; x=1776973898; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kQGGhomqIL6L6Vmuy+gI2rr2SCBTHNJKM8cuxcyUo2g=;
 b=FoA5brEzB/y1dsraxQteMN6Fn6o/FnQ/xKjxE5AuWOHwtecuHCWCn2/E6b2sjyP9hi
 OPpeyKw0V+DvGJS0pw3A07OD65ytgDBBfl+l3o1B82oRVVOxe8PKgz0LY65glUIUvaZi
 6diIHqpUr1IO12uUsYwkT+2k7dNB6dpaL82Ng3vl9BDuo6R+2K2tKudUNPqsygJNX9Mh
 ZLl0Y0DHABWE4i/UYZqFE+lSMELUH99NDV5dt/ivLx1aYrqBWpRnHm8053WT+7uBgY0t
 MTlE3DINxKAWOorDjXCrkxcqdT5abRKs+y5Puj9gtjqgDO8ESxC+rPnW2OoGaK9wZyw+
 hdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776369098; x=1776973898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kQGGhomqIL6L6Vmuy+gI2rr2SCBTHNJKM8cuxcyUo2g=;
 b=nwDF4xadyWau6+W2mCIxD57yYCX0pV0Tgkk7E/z9D5Xa9dzU4HQCwZ5b7B7N8hiD33
 AyDnThWZSE69+Pu06OVweUgQX21ND+bZVbqTM2JZiP+SWKkYz0HK/jmIqcSxwMDNVDGW
 oiHRH4TLggQqLL0mQKLVChDOfZfQszRi5AdIumMjsGLsaIBsk0bFDxrt/82+SFqkLwJx
 g2wvKAJpMXpCe4+vTqE7Pvv8P/Ied8vhQeFWB/byqRzM5ilNEIJI+I3GDgeYhPYJLgO6
 gsxerMhFtBgeFkpAFqADkzZ78+oF+E3Fe1t90MW8uhUOGTmjt+UCiDnkLkq8gwBs1RGF
 pDbw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Kj6wMQbDBhdWVfl6VxaHhJTWCjiie8XMz1TuRudF6OMn3wI4Q30CrmuSo671d86bJvIskJmJf4w==@nongnu.org
X-Gm-Message-State: AOJu0YyBNatW9RrQx0sfZwUJHdnCQ2O3tq7Iw0zNnTX3PPElQ7umKnVU
 0wTW3PlxZyzEOEfc6bEaRSNCACxY0NuQf9WYdYDucVv8RS76ClQi6HnAIvgFJe9S9qE=
X-Gm-Gg: AeBDietrotMWsH42Br5lIT38J1x6O0usFi4+xBa/Kl/UtcX/XGIhKBX27U/ezsUpUCt
 UfaKoqc5Rb/bIJfHhcdO5yhQ7+94YOX60mdk31Wjj9xmiUBL5Ywxa6L/b6j07Tq++Mhkkpo48mA
 W7vjceMeh/I5m+MCZrHp/25TorcU7TCGFSMcPwg3U2CZf3FtXO9lchMrJAVulEm+W9L3ZiWv646
 FYq4EMcIpEC43X+WbRgrQsmjJ5p0L1qLryX7CDTkEIGE1VROGdT1U0VLqAbiw3jGoB+ZJsBfil9
 X56gPflQ+0/szleqd+hWaPHQr6rjTk5/5j5q0rcefD5pcA0QECBlVtZ3832HzB27LPAWPR4WWVe
 3AZxGM9tOa77+3IfDsYqX0FzmsjgzejSG1WSPbpLPXCjBUHxr/HcX7/a2eqIDHQjDtl59XnLzmJ
 7SLo95WoF9UyA2ZYLT5v9WyNRx2O75f+4ka1SkdtaIvSOiDp+MyOSdkwQb2L51OrDns+tzvPru3
 VL2
X-Received: by 2002:adf:f08e:0:b0:43f:e211:1090 with SMTP id
 ffacd0b85a97d-43fe21110dcmr468632f8f.1.1776369097485; 
 Thu, 16 Apr 2026 12:51:37 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead2decafsm14813107f8f.0.2026.04.16.12.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 12:51:36 -0700 (PDT)
Message-ID: <73d6cb95-454d-49c3-b8eb-d8711941ec2d@linaro.org>
Date: Thu, 16 Apr 2026 21:51:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tests/functional/aarch64: Add basic test of TCG
 aarch64=off
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
References: <20260416165353.589569-1-peter.maydell@linaro.org>
 <20260416165353.589569-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260416165353.589569-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 16/4/26 18:53, Peter Maydell wrote:
> Add a basic test of the TCG 'aarch64=off' functionality; this is the
> same as our existing arm/test_virt test, but it runs the AArch32
> guest kernel on qemu-system-aarch64 with -cpu max,aarch64=off.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/functional/aarch64/meson.build          |  1 +
>   .../aarch64/test_virt_aarch64_off.py          | 37 +++++++++++++++++++
>   2 files changed, 38 insertions(+)
>   create mode 100755 tests/functional/aarch64/test_virt_aarch64_off.py

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

