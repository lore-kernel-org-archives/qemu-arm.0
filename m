Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0625ACA0EE4
	for <qemu-arm@archiver.kernel.org>; Mon, 18 Aug 2025 06:14:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1unt7x-0006L8-IS; Mon, 18 Aug 2025 02:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1unt7v-0006Ht-6N
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 02:13:51 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1unt7q-0006wA-8q
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 02:13:50 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45a1b05ac1eso16567685e9.1
 for <qemu-arm@nongnu.org>; Sun, 17 Aug 2025 23:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755497624; x=1756102424; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nb92msXl+7f2wIHgt7PCMqQqDIBurBLcqJcGfcC8y7g=;
 b=Fc4/J75XyYoImtWeuEKm1QZdhJ+FbDVN3/wEk7zJwaN2JcqHh7M4mOh9niWba2Nhxs
 bBjqifvFYo0aGabF/nwHyzQGH+x7m3txhwFHecQ9HAjMYdCBInrd3SncZX/Tn2tr4R6J
 lZGikh3d08ymsA8C4/oB1a8aR2ZWUXCkPoNivv+bojuXTDeCBKaaYGq/AZC+Kvvbqv++
 Uf/Xksn8GSJDRUghCgMjCNxgpDUcd7x29pqJiqZZd4ez/qw1Tb2VlrOOouAmG+DYn/RJ
 9jXAad1yrUkJL5WzUeuwC9aYSWBDUu9BRd+Vq8ciOFksmqRbnR6vLxhoi14OD1CwIDcq
 DUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755497624; x=1756102424;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nb92msXl+7f2wIHgt7PCMqQqDIBurBLcqJcGfcC8y7g=;
 b=k4gWGZgEqWyrTB6SAu6/aVNQpDWRjurwIZzZ686o9Ebwz5l2eIEOxCF8tEcSH8tXEc
 P9ruwyflDOGJnYtmdtsx0eyLTrAhKMrz5WPoWVv63cLWWiIQ9IUefhqrwzU2B/cgZiWD
 qo1TKqh7OWLZ3WQdxttH2qTxwgo7ZZqzm2CwpXomT0tx0oyK3Zae8kKJQqzSk9xVx/JX
 VL73MxcwVkq3seVYKbKSVOLDTqx5sEURhNQgyyGivtWBahzR7JQ+MGNro/V6AklHuxJ+
 L5jZE+55wNJy++KhfoV3x7VN7+8g9zGUPV4jjeauYvnmvjCORsD+vhQJ1iUoIZxOvrAY
 OwMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+wSABMnknipVqhSpz2kTA+HrVWKPW56M7yRVwFNpGjJWK2GWfC3mFOUwVPnov2J2wrnk7yECrvQ==@nongnu.org
X-Gm-Message-State: AOJu0YxW53zRQeFPo24eIffWYAoTXNA2AV2eMWKgO9rlbtbyJak8tafO
 YdgwU1gpOuHAunMXErsltyJIYGCLlNVMaMue10qK3vHEogXia7hETy3/L73navfTTYE=
X-Gm-Gg: ASbGnctTCPdqI442jQ9F9hJBLYPese+IX7a+s56TAi0jX1ImPzzBT+DGcr0Vsf0qKAK
 EOR/xINRiyDMFlfhFWlKHRFiWpau6zbEqQwld8wK2WfeF4EAIVrEYgEJDYQIQH14hWRqtgydx53
 3qhvHZn5StdxImeH8wHiIQ27MlR+UtO4I7hR287h9tfz47B/UF157M2N8jopALMs7F4onAz0Cj5
 oT909zxQgM5KlCFE79H47O7HAXml+VSmrF7yfWrVjgmEwCuuiQkdiK1L5UhXoZZTrEiyTBgmOOG
 bhKhRGm/Zu18HsH0iRgp6QjhZMuHyATtw8UG+/b7q/BAl6Wisb8vUF2/u66RHNeQWOpX1RbIHn8
 PLwRqDtdxRjkF9/XBe+w2185NfZC4meowKCfaaSYCKBNQuEVSqcJouxYlSk7cKgg/lUcUocP6mX
 rt
X-Google-Smtp-Source: AGHT+IGEWPVXZalkZbLXPN0135/2f4gKaMkTsSUbvxH1B0yyehvrq+2jeI5IGyraYhL1Ojvmo1FUZA==
X-Received: by 2002:a5d:588f:0:b0:3b8:5b26:b3c6 with SMTP id
 ffacd0b85a97d-3bb690d22f1mr8178215f8f.48.1755497624575; 
 Sun, 17 Aug 2025 23:13:44 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb676c9431sm11979239f8f.40.2025.08.17.23.13.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Aug 2025 23:13:44 -0700 (PDT)
Message-ID: <0b1c9546-9104-4af4-8bb5-1cb0fb0590f5@linaro.org>
Date: Mon, 18 Aug 2025 08:13:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] target/arm/hvf: Split out sysreg.c.inc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mads@ynddal.dk, agraf@csgraf.de, qemu-arm@nongnu.org
References: <20250818041354.2393041-1-richard.henderson@linaro.org>
 <20250818041354.2393041-4-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250818041354.2393041-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 18/8/25 06:13, Richard Henderson wrote:
> Move the list of supported sysregs to a reuseable file.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/hvf/hvf.c        | 147 ++----------------------------------
>   target/arm/hvf/sysreg.c.inc | 146 +++++++++++++++++++++++++++++++++++
>   2 files changed, 152 insertions(+), 141 deletions(-)
>   create mode 100644 target/arm/hvf/sysreg.c.inc

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


