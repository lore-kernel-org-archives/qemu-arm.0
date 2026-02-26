Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F87FD9E0A
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 21:18:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvikQ-0001bH-3h; Thu, 26 Feb 2026 16:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vvikO-0001b0-Lr
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 16:18:12 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vvikN-0002j4-59
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 16:18:12 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso11152865e9.2
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 13:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772140689; x=1772745489; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K3TXAVBN7MpXjT3XNhSjyqBVbt0OAdFa0FF16B4f+RI=;
 b=KRVUzDl55Q2uQgHx9Hwcz0EgzD1coajk6j+s7z9KoHzn8zc78/1SCxBlV3nkL5MZGk
 5NMazjYSqS/SFnOOZz8lGxhgeJ5rPftvocn6MN/2oQ0PvkhUXWcGUl7rBsByrLu3cqXq
 4v7OlSNunao0JacxjZJ1MlocEYWPTjhtZjWGFt1bKZysVnZmlmAhP3jan503loJnkmLk
 iL50rZZ5a3uEbYdlSxNaZjK3GSOXnVAAlmy9u0RQAxPoNyHHsaNlZyKTNjugoIH3t5Em
 yiuilI1Jh9VF3YcLa8qmy3xF4Ht3lgZkoKmvSJwm8cBmKxXLi7d4HqQDrDl7vQWtT+Si
 IcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772140689; x=1772745489;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K3TXAVBN7MpXjT3XNhSjyqBVbt0OAdFa0FF16B4f+RI=;
 b=dkFTL0tjNyG9DlBKHnvZ3YwT6o60TnEc2mmi65ERvGV8k5nwBLY5Zhr0W6WyqiXXu0
 PYYrKVp6RFKALI7CnefjHdAaKoM+f1iG3uBAupIiHvvD2pFMFRgVVup41yrrOSMeLaWt
 T+LwbwFFYWiy3SR7LSSmOX3UVNJoIqishuUmvBYfu9nEEoawDEkueEEOTNtdv0LBIEmC
 Wm6KYkSI2syAnJqQ+6r4Zb/tR6gOfOaTcAfteezpkuL+nDhXMdamouqTl34CfpAE+dr8
 5yehjmoccBqjjnfB0Dl3Qqg/gFNET8bTBDqtvZuXWGFa3UHLgTTyAOitUYd92HQNx3Ny
 LZbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXOpFjRDu5PZ7SMo9Qgaj5kOBEwYSguA+EnF3n8+cJt47u+Y9M2TQE4AEnrrdhCe+knulGXlaQvQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx9t6Uejp+KcxUvop2Eqj3ZqLTuWM2iTDW68tmRp6HHQKIEAeZE
 81LsW1cSIGApr5Z/fGTYQtxImiZte7ulcGTBnPyacR4dRVV7R3/1CsLzIAmoSZXeEa8=
X-Gm-Gg: ATEYQzxUo+i+aDmORAFyRAtlUrYoxY+GjJETjWBXooJd47Opz+6fFNylDCgTyZL/c8K
 15Y1Gj6kCfsLjdledwhze/6PtNvUeQ/Gq6iBFAXUwVGkJbRu2Ed55hvxULVmXB8Gg7CLXBO1QDe
 E+nNtxbdtlNiGvA4+5uRlFXUvizIDlW1yT3auCy7YsrpwS5mxDnAXCqiI9yE7cPa+CngYFqQ/78
 a74G2T/FKKRjj/Fe+TPjL4jhgkBkYf9sbSBDG25JHIG9zIYoIHUhRxr13gBmvXAVLAYtzcTC8W4
 xuho3uor4nPCKpTU3aI9cvrM/EDJ+zErDg1T7No9nQiNTQKjfnQewhFu3CoMapOYh7vrqfHXonA
 45jC1VKgyPBnpuP/8RTBP96JomKJCeIcIUXj70H7J0T1RK74sjFabnKpdjAUrPB6VTP/8KaZdpI
 +Ed46yw4DTSJD6NMPGZU4buKQeuO0ZuToVcKgPvgqoFcTC6zXBBzWlHqmIFnI7YpMkuw==
X-Received: by 2002:a05:600c:1daa:b0:47e:e970:b4e4 with SMTP id
 5b1f17b1804b1-483c9c0afb3mr3276855e9.29.1772140689176; 
 Thu, 26 Feb 2026 13:18:09 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c75a25dsm2057787f8f.21.2026.02.26.13.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 13:18:08 -0800 (PST)
Message-ID: <dc3f2862-95aa-4a16-a06f-2b44d59e38bf@linaro.org>
Date: Thu, 26 Feb 2026 22:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hvf/arm: expose FEAT_SME2 to guest if available
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260226-sme2-hvf-v3-0-ea5763dbeba2@linaro.org>
 <20260226-sme2-hvf-v3-2-ea5763dbeba2@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260226-sme2-hvf-v3-2-ea5763dbeba2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 26/2/26 08:25, Manos Pitsidianakis wrote:
> Starting from M4 cores and MacOS 15.2 SDK, HVF can virtualise FEAT_SME2.
> 
> Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   target/arm/cpu64.c   | 13 ++++++++++++-
>   target/arm/hvf/hvf.c | 25 +++++++++++++------------
>   2 files changed, 25 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

