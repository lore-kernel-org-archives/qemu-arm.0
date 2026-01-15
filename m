Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009CDD46607
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 17:57:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgRaw-0006Z4-2m; Thu, 15 Jan 2026 12:57:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vgRat-0006Ws-PN
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 12:57:16 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vgRaq-0000e4-HK
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 12:57:15 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42fbad1fa90so1128069f8f.0
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 09:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768499829; x=1769104629; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+mMd8+uq4RQ9gxshvZ3aMOaigD8tQdNbIE/NTd7OiDc=;
 b=p2B/QYnYUt12rWV/79sEFa4C8UF3DrOz5C1ojJwhqZwI+nAyKsK0XCHBTgLiqHez7t
 vu0XHUyOQzAF0XA44taRaV2uTmUrE9412fyw8huKvM7PdbgsoC+NZYuUJWmEs1g/oCAG
 pd+Bx3f9Le0lC0+/f99g6u8mQrCCl4LRjB67e4N9hYwM9QdjK4T/Gw4gy0RWErO9jvLP
 VgQBbQsZKbOBxQkl3DVSGbqbELY0QX7TNNaf9HBKsuTEPbMGhuKPCKUMkeJnCxtZ8+Fd
 ASjq/34WgCHCcRwh1TjiNy+FdyfbAo1/4Cg4t6frQJV5yRSBfokT4V4ILFyxDX+boKqR
 9TIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768499829; x=1769104629;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+mMd8+uq4RQ9gxshvZ3aMOaigD8tQdNbIE/NTd7OiDc=;
 b=uL7KO0QGd8VX3By4Y/UdV0r16y5hc+y+ABfzkkvDqIibc3AZgGzHxOhaiS0Db7LiR7
 LHf5kMNleZaF0rLkDD0NbcBzq/+Q+JOnySDeO6N3VmOZ6iTdTJtrxP8vISCaqY6tc00l
 4ql2QMiVJ335pNxbplMndPQLBd+T9TJUAplZgfk3QpPF9cEn+CX0N+s/EhA2u8WRR8tC
 NkC2fo6M67HjZTWNw7c2qrWicucNFJsBYRROXwZraTXCcdQqoUABd9TKNP9c+7HbpO6i
 ls272QGZxOILgHRjJfHaK/kkMDzZmyK/AQqyQTS/WLBNyEsn02RapD3V8g6rea2XVOLp
 pIEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX49oGoQBtd73JavLrREl/3l1qNSo41GUctVpD+gfOBPglu2JZ+3w1g9fQIKFaMPUdquM86ziFruQ==@nongnu.org
X-Gm-Message-State: AOJu0YxR3Xumzbt0f9N23acmWtUe46VqAoxR6zLAxEsbvZLQwA+m2WNy
 lqv77SDds4CsT1Pj4ehjT8bMQrZ5lqtQyX96FMReSTHlwM/iMtr4OVXpLi6fPLbtSyA=
X-Gm-Gg: AY/fxX5UGLu4z7oOtS7o7FmO9bhqDYnR0Oi8dWv7yuRYRzc1iTzU4qgjYqin+k28Z59
 b0FN3v70hRCRtb1tN6mZPe5NqC0cvjqulDWyZB0P7xOfgBRFakRJYv0KfTC1+LL/GOgx/itV4RR
 bEXLS01YaWWopnYhNBQ9aA0m7TzlXTn4wR8ifNCn1zj74Yx7WxR0v9Ppu1E0wrpQaJ+H/Udn54i
 KyggoUhowdIHSw1t0KSdmJW+/m/yymVqjL0q2Mt0slMrQ3C4HTiVJxNFX7aNYtXY2fJ4vW29gwW
 VB1/fXNh2P+vMjkWdg1YSXtzXD+imppc7/KzpoLjxILCSGocfUBpqcbybqYJCjoeOS6vvtYk7Cs
 y+N83t3F/075gBW2rbqlIu4371a64oJzQ2yc84u476PYBNBmQ8xcCHZAVcyH8vlbcDWs8utw2sa
 nIbwSsDbKgU/2eO5DRRIQ7nfwmFClXIYfAvi0APpTcVluciDt6mlzl9lExZOUBp1Iv
X-Received: by 2002:a05:6000:2910:b0:42f:b3b9:874d with SMTP id
 ffacd0b85a97d-43569bc4a81mr259220f8f.37.1768499828800; 
 Thu, 15 Jan 2026 09:57:08 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569997f41sm283293f8f.38.2026.01.15.09.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 09:57:08 -0800 (PST)
Message-ID: <30ca8aa6-3e07-4d09-b09f-58d7a6a480c6@linaro.org>
Date: Thu, 15 Jan 2026 18:57:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Be consistent about capitalization of 'Arm' (again)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
 Eric Auger <eric.auger@redhat.com>, Zhenzhong Duan
 <zhenzhong.duan@intel.com>, Ninad Palsule <ninad@linux.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20260115150545.669444-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260115150545.669444-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 15/1/26 16:05, Peter Maydell wrote:
> The company 'Arm' went through a rebranding many years back
> involving a recapitalization from 'ARM' to 'Arm'. As a result
> our documentation is a bit inconsistent between the two forms.
> It's not worth trying to update everywhere in QEMU, but it's
> easy enough to make docs/ consistent.
> 
> We last did this in commit 6fe6d6c9a in 2020, but a few new
> uses of the wrong capitalization have crept back in since.
> 
> As before, "ARMv8" and similar architecture names, and
> older CPU names like "ARM926" still retain all-caps.
> 
> In a few places we make minor grammar fixups as we touch
> the sentences we're fixing.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I have left the uses in xlnx-zynq.rst because I fixed those
> in a different patchset that overhauled that file.
> ---
>   docs/devel/testing/qgraph.rst        |  8 ++++----
>   docs/devel/vfio-iommufd.rst          |  2 +-
>   docs/specs/fsi.rst                   |  2 +-
>   docs/system/arm/aspeed.rst           |  6 +++---
>   docs/system/arm/b-l475e-iot01a.rst   |  2 +-
>   docs/system/arm/nrf.rst              |  4 ++--
>   docs/system/arm/stm32.rst            | 12 ++++++------
>   docs/system/arm/xlnx-versal-virt.rst | 16 ++++++++--------
>   docs/system/guest-loader.rst         |  2 +-
>   docs/system/replay.rst               |  2 +-
>   10 files changed, 28 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

