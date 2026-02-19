Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16B2E9A055
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt7mV-0003gY-Lb; Thu, 19 Feb 2026 12:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vt7mT-0003gI-6P
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 12:25:37 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vt7mP-000261-8Z
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 12:25:35 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-8249cb73792so1042035b3a.3
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 09:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771521931; x=1772126731; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p4b3Azavpw+tV04lA/HFpUxoBK7+rKm19C/TxJ7iiWM=;
 b=Fk8w1edMDcYFKorbWJuaMkLJikW5yaw9IskaCd6uQhUp6XCoSuHKZc61Tnbywz0Fd2
 /4bstf6BmhI8XqLeM2RchjYXxsXaM7pU8nUYXTc3JAkb31/Zaly5YPadEuPbwRWSl3OS
 kv4kA+M+q9Mbw42oMmhcRdawNovbQb/I8PGZiV2hym2bCtT16JFU7BpWmLGznSL97sOI
 wHgEsfojKjds94hvJQodnX8+69ykTK7FQhqQ2M0GJj7mE43uuxy+or98R6+3ow6OxMTG
 K3Wyp8L7BXptlMDSPTt7xTmTuyWvs+KKfBPi4S3ng9K4+gj5fT88nY+lI2T41mpci0tl
 XyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521931; x=1772126731;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p4b3Azavpw+tV04lA/HFpUxoBK7+rKm19C/TxJ7iiWM=;
 b=cmJY3YVruZOEDqaj5NLbnb+KIYBTz+t5g1qZTVoRWECTrxKJ0Gb6hJQSLZwiXA185F
 Y/ZbpSluWshP7UlJfO9InYoM3HzoufYjWZBevWBGwiyhEVIaRRF/ut6tEebEkdwZrBuj
 8Fb5ur8qXfV45A6UYlPm1xXBpO4qMXAJogR2AzqrqJ42QWVhMuVghoezBgVSNd/vLuRF
 Xnnjf9USRi1Zxr+PI2TCa97VPcSuZywiY4IiAWVWksTQEM44w541gBxf8SSFkuGLmTun
 v7NpTI1A9xz+lDj+TxX5edci+QEyMKN6yyZ3fMSxmbuGxY3nVch8KsoECWzt3IIgJXpi
 zSpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV2tuIpj9BBSnhUVSrls6VpHtVY8e3aJHctRgO2XG4HAJm0FsGBOwUwwzaDKd1wM4YDM/coNUQFA==@nongnu.org
X-Gm-Message-State: AOJu0YxX5bIle8zqlclyu7pDEh88arKOjLQqroajvj4xgFbTuLG0F5qD
 6RJiWuW065aKMnUmtT/5oCSSQlxyS6r01MiYlavL9JpN6fmyjIkp1UZROrfT+9uyr1o=
X-Gm-Gg: AZuq6aJiG8/3QBFB+smQQgD0WQ65RcqWq8zUjrmkuy2u2cEimdXyqmNmSGNH/pnEhgk
 3GgtXL+i7W+pzUAMMdH1QPDKNHfuJC/72swF2nnt4kNH9w+qwmwXYJJBOt0lEXzIu9Azdmasa8J
 hr0nHKTwzJoR8L/VmzcmHVlg/ogZluGA81xDK+81EDOGiFaZZDtpalWTeIf4T5AMp6nFgpwSsh4
 /bysDGTRt8uerI06qwxXbegRFRZZ5kj1Ox4//0GwqmDGs1jhRe8ZK0BRPxyM++PTORyX/CxKjUy
 IOxKfSIVDEdInbp6b0TIIyOkoEaDL1hKtYh381lN+KJ8MKi49P7Z5BHOK5n74w910ZV7X+wzZXA
 NVkpcAcYpV/PKTZMDDM+O8n10aR54ZsiEFNZ4iV1v/KkwxtgkPDXOfcud7Sy67NvudjlgjR2c2O
 2SRSVLzFObdpvnGpFvRTARPTIOYTO25xlii/1UD/83Yp0CW0Bvv+EZtC0bEHu5DREUgjyb
X-Received: by 2002:a05:6a00:3d0c:b0:806:12ff:3877 with SMTP id
 d2e1a72fcca58-824d94c9be9mr18650189b3a.4.1771521930772; 
 Thu, 19 Feb 2026 09:25:30 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6b9495esm19993955b3a.49.2026.02.19.09.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 09:25:30 -0800 (PST)
Message-ID: <8839d767-7b0d-4f79-90ee-3bc6dde6c673@linaro.org>
Date: Thu, 19 Feb 2026 09:25:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/14] target/m68k: clean-up includes in cpu.c
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Yoshinori Sato <yoshinori.sato@nifty.com>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <huth@tuxfamily.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20260219171810.602667-1-alex.bennee@linaro.org>
 <20260219171810.602667-2-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260219171810.602667-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x433.google.com
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

On 2/19/26 9:17 AM, Alex Bennée wrote:
> We don't need translation-block.h as the TB flags are local and the
> only bits needed come from cpu-ops.h. The vmstate is a system only
> concerns so we can guard against including it for linux-user.
> 
> Finally tidy up the order to keep things together with the local cpu.h
> kept at the end.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/m68k/cpu.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

