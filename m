Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DC9D78771
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Dec 2025 13:24:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWaSn-0002HD-9d; Fri, 19 Dec 2025 08:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWaSl-0002Gv-V4
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 08:24:08 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWaSk-0006SU-FQ
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 08:24:07 -0500
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so12568605e9.3
 for <qemu-arm@nongnu.org>; Fri, 19 Dec 2025 05:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766150645; x=1766755445; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T8oZhgC5TPS6KAZ43zGu6mquJSM0U/DmvWidEawgPK4=;
 b=EoQkZvVGZWhw+2SMJwL7fPeKlIHAYU2yNvifoqxp3zssZxf5cfk+MR8NIsgmvyXpod
 /sC/JRBpNjTHYfYnfcZvaYEFkh8DKffoAdUHC8dQN2PCkTfX6UYeNzBi4gteR07uy79B
 jtAKSNUU99TYZSE1yOJt9AxNBPwPAZQ82vM7e4209KuH6jfJVn48Ja65TRqdZzuReLCP
 LG4cT5saRyd/SIgv+8FcpNJAVG8+RsIbAHKYkf2iNeZCCYiK3BrOqUqAmedofu0EANgw
 RbwDtJengqsEjIQPsVGRUT4qZw84LHPHns66aKyNmWJs3+cO0MibhpXlbN7t6iSc3FNM
 Q0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766150645; x=1766755445;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T8oZhgC5TPS6KAZ43zGu6mquJSM0U/DmvWidEawgPK4=;
 b=GpRSVEG2Rve7zLAQ5LQFp2YMmRODvYg04eVSOULGNaYO6hM34uLLuEHxb8GcHPZwCU
 1/2ZvcFfIkNbk4fqzSJw5lNhwh3tvsPotjdcPP/xhD56NkkvnfSKEfveVVexgDck4SVR
 asN/r0ERc6Z+Tyi4ndYUPNayuXygCcs0cCKckPnihEZNNURUKFpwzTqsI2WnUXmD19wH
 w0o+QdO+3ep5z9soV2/XM4b1ngOtQb5lZe/XD9WPbiROFaYBmrCnKZxW2dCtZ9Bma8YI
 eDpfrcHR6AqBSQWCNKjxZ8pzQ2zpTCACBqPzBfbwetjUGxTPT/G7rd5oNOxzXxXepYwS
 tFPw==
X-Gm-Message-State: AOJu0YxkhLJJMpFm76fsFK8x38pqRPEAhnZ588gKzSgOykWQpovBwDbj
 CW6riZPyblEDKoQcyQLXNw8XA3iAn7P/3lJZd2daGy94EDvhMHP7BnSrz/BYFd1pk/A=
X-Gm-Gg: AY/fxX5/SGA2LfKTBqcGhYEx9oYYxJMow1Og8WmiT3kXsLl6yjT9XaBJSyY2j45+8aj
 BpvC7vkJiKeI8MoHKilbxsiG+9u5Z5YEAd8WWBeHU2RftHLZ6BmJFlc/aEE+/0CN99krcDYsm3t
 DEnZOOuVhRD1Cat7v9XW5sOqZQFloZukjYRQPAco+Vi9mrXgYYYnI9fe3MVv+yh+BKbKOnXeUS7
 R5n1cgsStp1MTSo38WHSB4jFWTbMLRpqtmJutBtkNvBFJPL+unYYEy5Y748Pw/bS01V0RVO4svZ
 V4+zt16uhoi9bNQ/4+e74C1KR0hJOOiyvDxB+oWpUtYYjH3NFRiXguTQgy3rMUDaslMG/F8PxjK
 TmD3X8ETEyzDwv7ipwwmZWDFXDV4LcTYhu/hUqz5btLWIA3TnWRctuZHMucCzOR1M/CS8iG5JlS
 nNwSgIRoeBgmRA8hM13RQSJV+tjFWzkD293eaUH6ztIAATdvw71C+ZPQ==
X-Google-Smtp-Source: AGHT+IHf47bf29taIY+tBiBHdtVv/R/K3iN8qgDJYUZSMxuMucIH+2ZCgfaQIRq3ak21EECCPsQilA==
X-Received: by 2002:a05:600c:8718:b0:471:9da:5248 with SMTP id
 5b1f17b1804b1-47d19593864mr24087135e9.26.1766150644615; 
 Fri, 19 Dec 2025 05:24:04 -0800 (PST)
Received: from [192.168.69.202] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be273e4d5sm99326225e9.6.2025.12.19.05.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 05:24:04 -0800 (PST)
Message-ID: <fa6211c1-c811-470b-b63a-d21e57d044f5@linaro.org>
Date: Fri, 19 Dec 2025 14:24:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: Re-enable the MAX78000FTHR machine in
 qemu-system-arm/aarch64
To: Jackson Donaldson <jcksn@duck.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20251218214306.63667-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251218214306.63667-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x343.google.com
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

On 18/12/25 22:43, Philippe Mathieu-Daudé wrote:
> Unfortunately while rebasing the series registering the
> ARM/Aarch64 machine interfaces and getting it merged as
> commit 38c5ab40031 ("hw/arm: Filter machine types for
> qemu-system-arm/aarch64 binaries") we missed the recent
> addition of the MAX78000FTHR machine in commit 51eb283dd0e.
> Correct that.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Tested-by: Thomas Huth <thuth@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3248
> Fixes: 38c5ab40031 ("hw/arm: Filter machine types for single binary")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/max78000fthr.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Per https://lore.kernel.org/qemu-devel/87ms3e6a79.fsf@pond.sub.org/:
Tested-by: Markus Armbruster <armbru@redhat.com>

