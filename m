Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2850CCD3436
	for <qemu-arm@archiver.kernel.org>; Fri,  8 May 2026 13:36:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wLLNB-0001pn-K3; Fri, 08 May 2026 09:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wLLN1-0001nT-Kq
 for qemu-arm@nongnu.org; Fri, 08 May 2026 09:35:59 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wLLMz-0006Yl-Vt
 for qemu-arm@nongnu.org; Fri, 08 May 2026 09:35:59 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-45297094718so1633747f8f.3
 for <qemu-arm@nongnu.org>; Fri, 08 May 2026 06:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778247355; x=1778852155; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uaPAJWNOba7k7wzsMIlyJdSxA3zB9u+1R8heCdLP2p4=;
 b=RYvTpjCOhIAIj/imR/7hSq3467I8TXhnk0AOxT4NunH23wy21lE2xrHpZn1Rd4tmIM
 OZju0b6Fly+Ad1zaya71uRFWd5rq0NovxkH6WHwXrXrfzleuOZ3DodnG2JSxAdN8/J1q
 XNbQ8pRP3ZDNvfsKQS87F9g6ZEybQ0z0NW7ydjVcb0sx5VeTbYKdihkS92gy3JmNoaXl
 PkiEl6We/J3fahW3x57z0ZCyA3p1VH4WpOHuOPp7jfeNSBWbLdr1ymss088tgiGKk/wJ
 nlR4i9Ued2JwUpiD/FUn5sTKWJxRpmeE+uRRuDNWqwgXJ2bDDPiM8pffYVGVCwYOlM8k
 HNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778247355; x=1778852155;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uaPAJWNOba7k7wzsMIlyJdSxA3zB9u+1R8heCdLP2p4=;
 b=Zic7YbQdm6yBghfR8ZU9AEOPF/Lc8xmwlDymFNLa6IDvOYn0efuoVulvVrYGKhEiHL
 AqMGKS7W6o7qTDJTOFO3MZtsS1Nra7BUqfyGIYuH5bazg6/CvXve0G5Gd36TSVuM8tDw
 RYz0PKog85lu+QUIFszGB2/ihXZrgJtDtkWGNCj5nUWflLgbNkxPxSKVOeSnaTvVYkX6
 xXwoNv3bPs0GSpgqaJaQ7njGbB1yBuYFCsSwCXrXfWBQf0exHJquRFbE/8fDMmvZqWUy
 wrt3V11wg185o02Mt5Faq+LMMuD23JYE7pbOryOkkSizZ8pMLSKzVcOuAJRnzBNJ2Hv1
 GKDg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Az3Dl3SMFHKUuGFLAUk+PKVHxhlShag+zve/L9UL/VYk8MzWcCHGSELe4meL5lmVOUjMlOL1YOg==@nongnu.org
X-Gm-Message-State: AOJu0Yx9u5RxiKT4FSD2kA3jA0BKdu7tr5tSKp+RJS6S1gPn44ZqOqt8
 y7hCDsnaXDNQjPtn4dc4KnPnjv9qmQUgpTc1suxNVe5QRT3DtjXGeq0bkVzwoVDLW18=
X-Gm-Gg: Acq92OFyvjFzQELxPaawtGSqpUG3I65cI3LQtW7wR3Tdq/uP49PIiFGSxhuFG9de6+i
 TE0eSbpKK3Bbh0ozzMbVIXBG2tk5ZqkbyB8Go/ZGPrrBhun3FMbw3Q3CoiiDL98wDibehTiIZAd
 +Z2A0HFsfDA/zH40gIIfkfPGiAduqSU+snhRQB/A7pg6XDcGHYtIm43zDSKzq2HzNQw0AgEww86
 dWbWLrNmRxfnqVHqXCLNww9W/RihRzOxM3bjF4hHIn3JQiKX0p0PqH/KQ1aF7VpWueZ2UPlhbDC
 b29UBdTpb60g5cp4q/FBeVdtnzyuoB5CKccQyQwD9sU7eLfwhvY/dE7ZI4v+KmsgTnQhJm/Na6G
 8pvNJ1+4jZqrlkEAhd6k5WWIT7ipQBec+nXeMJZy+84jhF37cZwp0yVOr4oXUBd2nj7AZwPNC5f
 4c2038dVuezWyKQ/uYw2cNt+jzwiek/XEx09XRIrEw7wdszjWJerWgbmNdr+njrPqDWg==
X-Received: by 2002:a05:6000:1789:b0:43c:f66e:f24 with SMTP id
 ffacd0b85a97d-4515da95ffbmr20566082f8f.35.1778247355454; 
 Fri, 08 May 2026 06:35:55 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548e6a68ebsm3950042f8f.1.2026.05.08.06.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 06:35:54 -0700 (PDT)
Message-ID: <17295abb-58c4-44de-bac3-d67b995ff793@linaro.org>
Date: Fri, 8 May 2026 15:35:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] hw/usb/ehci: Improve migration helper and property
 naming
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 "peterx@redhat.com" <peterx@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "farosas@suse.de" <farosas@suse.de>,
 "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260506032643.2510575-1-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260506032643.2510575-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 6/5/26 05:26, Jamin Lin wrote:
> This patch series is based on the following patch series:
> 
> https://patchwork.kernel.org/project/qemu-devel/list/?series=1089061
> 
> hw/usb/ehci: Add 64-bit descriptor addressing support
> 
> The above patch series has already been applied to the aspeed-next
> branch of:
> https://github.com/legoater/qemu
> 
> This series only contains naming and comment improvements based on
> reviewer suggestions.
> 
> This patch series depends on the aspeed-next branch of:
> https://github.com/legoater/qemu

Since this isnt' it /master, it makes me wonder why not squash directly.

> 
> v1:
>   1. Rename migration compatibility fetch address fields
>   2. Rename CTRLDSSEGMENT default property
> 
> Jamin Lin (2):
>    hw/usb/hcd-ehci: Rename migration compatibility fetch address fields
>    hw/usb/hcd-ehci: Rename CTRLDSSEGMENT default property
> 
>   hw/usb/hcd-ehci.h       | 23 +++++++++++++++++------
>   hw/arm/aspeed_ast27x0.c |  2 +-
>   hw/usb/hcd-ehci.c       | 14 +++++++-------
>   3 files changed, 25 insertions(+), 14 deletions(-)
> 


