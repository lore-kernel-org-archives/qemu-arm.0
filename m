Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1FBCD342C
	for <qemu-arm@archiver.kernel.org>; Wed,  6 May 2026 09:10:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKYGq-0003lm-Sz; Wed, 06 May 2026 05:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wKYGp-0003lC-0T
 for qemu-arm@nongnu.org; Wed, 06 May 2026 05:10:19 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wKYGn-0000u4-5Z
 for qemu-arm@nongnu.org; Wed, 06 May 2026 05:10:18 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4890d945eb4so4122525e9.0
 for <qemu-arm@nongnu.org>; Wed, 06 May 2026 02:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778058615; x=1778663415; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=snPqNajal7y6qubnA9pyHb7+O7dHOfLjv5cOqMGADZQ=;
 b=R/VmTEs3M+zm2ibvIxYNarHeTaqERoQTpol1xp7SBcJ7pEQoYTdORsE46BTtR2nY6K
 A2n4aBzZ3uhAmfgHx6Dqq+Vc6SAgiAwenRE40RXEaPsob4ag1kEh9pKy0NMzo2nG6HUZ
 2BzB5h28V1QfuOhEqUo0sGBMLCf/QnudIxR0t7wBNZb/MMZlP9gZT7uiO9lpLLNMuRKX
 9Fm7wo1gkjLIgTmXH7tJ0Fs3jduMe8VdBzbfyh9i6fMk5oQLlFid//3EDvoi4i8dD/ba
 AxF9VA93i4sLkwq4pN6hkhDrSuNBspn0EZjDbYChmsDX4v7xmjhJyTa4gHNvtYG3Fl5i
 5reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778058615; x=1778663415;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=snPqNajal7y6qubnA9pyHb7+O7dHOfLjv5cOqMGADZQ=;
 b=WZy8Wi1kye/39+vXRUdOCwykDzdxZTWrLmyCkTeu/qqgOrpLHKmlA0pbGXNAgGHUzC
 AXC0ZAFu5FcnUTvArtDNLalzP6CovucAzgXlsRg8jjvWBKdfcFGgLloitbUTwrhvdX0R
 6kLb4Z5iWklHF2FL0YDjSf8lqLwschlmg9zccb2QDx0ZQzqczj6HymJYEIU+J6Otl1SI
 1W/Hr4/55T+6KMvnpt7ab1xWxTkh01B7sTz3h/NQV96R6hoGnm/xmtmMHFMkMuHIdVyj
 1DHx8MxTTp9vBZjtxTjvmkeNhruKppOI2HqYYQiWaqEZSIh8szbCwCSkSGo/C10w+t0j
 XZgw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ki0VRpS8csmgALKjzRLrPJpeDQl9klxXBa7whwPEouGWpxD+INa603B4rWtXJ71l+ZRKXxM4eBw==@nongnu.org
X-Gm-Message-State: AOJu0YwEuTTyU6b+PFeWM6xR3bHOmQy84zqy54CzNHrv5SGJJWgXl/rb
 EgkU2CvGdKSsKkpEkuVxMJx8xOdFOIaekM1w44uDLPBsVJmjvAC9PkJl3LMnWFXHzHQ=
X-Gm-Gg: AeBDievqDT4S8R8W8B3ugDDQmXV+cOfV3fCpZY4HImcVI+GP+KMWF8O7PWIY7F7Lbtk
 9fmHo2HpsR+yaBMfF+iRm/N7nGye5lBBi3NdVCF31g40IRNuGjShVK2AZG8ZcchW/khEi0eO4AR
 OiFmccWhrmfc1Hbi9ZruWJfcgECSEtNLK72Lu9e5Sl0GhgpB4P363xbLNhjlNoc0ptprClH/ciR
 fDjJiefaA12w+wueczuZVEZ62IEM142WlrQoovvcTo1ABc0/xFOAJZgUOUAX0YLmM6HuIfVp8mz
 8CEku4d/vkbZRuTdIhBNmfZ+CEYUQ1xJNCq7AHXTTnJW0X89Jr953pSCb/V7+ga1COXDIUPKAIL
 DNzhyv3FySwH6X5tc+khVapmFLXGpfz1oJe3EBkrODdSO9ELLDLl4qSRTMw13tV5I5fp5tKcGZk
 6zSLWvM8L1hQWxLVz23/EKVnB/2guOrIKFEopIx1GJ6IT8TTGliFL+tZRw9g64AVSPUK0ZijzKd
 Unc8Hf0YbU2b3U=
X-Received: by 2002:a05:600c:5747:b0:488:fbf6:ea59 with SMTP id
 5b1f17b1804b1-48d142654f9mr89061925e9.12.1778058615263; 
 Wed, 06 May 2026 02:10:15 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45054b02802sm11036870f8f.17.2026.05.06.02.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 02:10:14 -0700 (PDT)
Message-ID: <7e37497a-212c-449d-9a12-cba93d7d48e7@linaro.org>
Date: Wed, 6 May 2026 11:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] hw/usb/hcd-ehci: Rename migration compatibility
 fetch address fields
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
 <20260506032643.2510575-2-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260506032643.2510575-2-jamin_lin@aspeedtech.com>
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

On 6/5/26 05:26, Jamin Lin wrote:
> Rename the 32-bit fetch address migration helper fields to make
> their purpose clearer.
> 
> These fields are only used for migration compatibility with older
> machine types that transfer 32-bit fetch addresses in the migration
> stream. They are not runtime fetch address state.
> 
> Also add comments to clarify the relationship between the migration
> compatibility fields and the runtime 64-bit fetch address fields.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/usb/hcd-ehci.h | 17 ++++++++++++++---
>   hw/usb/hcd-ehci.c | 12 ++++++------
>   2 files changed, 20 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

