Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EB010F287A
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 23:26:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6GZY-0008MA-5W; Fri, 27 Mar 2026 19:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w6GZW-0008Lv-Rv
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 19:26:34 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w6GZS-000795-5N
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 19:26:34 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-486fb14227cso33484475e9.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 16:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774653986; x=1775258786; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DlY173GHES0KvWxNcJWtyThmhiS1t7oZSgQDwDaQ4UU=;
 b=upJKb79RwID8cX1LyOKtzAiUkGHs7HVJSpxZUtFyStyJge1xhLAgLwoR+mR78QFKj7
 Q5d0aywS9SCd9X2CGQDYfJQuJov4KKNG7yB2UpprcRN2U8qjsWoa76Iy6eedwRpppJGL
 awDRSTqAQv2zRndpmVDzOnMdbpNrhaBnwDDo8ielx6HpidU5PINHrTNNyjuC6RHKkam1
 f842GTDu8FUNDEAwCm4KDsmdQcegZsnAzJrGprDEnrwr/ZNPCd8YfT3padvaPbkbRtPE
 rvaXKIMd4zdJO6VglCJhC7/f7syTDCu1waWebbXR0oNf+QSd5uAP2TNV3wDbWw+qLnar
 Lfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774653986; x=1775258786;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DlY173GHES0KvWxNcJWtyThmhiS1t7oZSgQDwDaQ4UU=;
 b=d4eTN1tTSJUWxpZN6KTzVJXHeWYnB6dbZUxBnW2jFG+3oa+8ZngXKWCtOaAk9Pk+3w
 EcwPRbyTxYm/otYkxk+4ILelUoPyVqnain2/JsQvc7QJT7PR81zfIPFqrBPuYvfbt3y3
 BCwaama5MY5dXRsfSYdrnH0CelfOLh7h1bvuVzjipHtZ+MO05gDvz3Ql8e2H2QIM9jbt
 M48ml6Ry9IulssukUQmcI8KCF5eHijpPyA5C4RvrIdw00rtZFq/6bueGvp0hdKUCWMgh
 6hlpeRSlw/S7iTQyEoX/YtLTtkN7M0N8KSb79fShiVPCOJmyl/25S9ddatu8HmsL05l8
 VzJA==
X-Gm-Message-State: AOJu0Yx2FUrT8xgBueDBk2K5nmvWx08pMjHLvCoZx+Ez4saTBPU1OGYD
 eXe7dIi7UWMXMigepjJRI+M8fJvAEsKFcZqgXmsh5b8rav2p8qvDb5k47iWQDVBUOmwFQo6Vi1P
 by3zi+JM=
X-Gm-Gg: ATEYQzwugbi7dN1d4ZTWDLGWfrszaS+Q3ksKqXuDeyOuBnga3jiwzxf7ewKig0PAkPx
 W2Chejvz/hLumf/yigcsyOMWj8ly8+as7Q9xp8bDYr5ORNBlfBgxvzkCQeoa6tdmd1/UuwHigki
 gmebbP/cqv+VH1QbqxoYv+1zIGKCR9ntcx22Exc5luDj4VX0XsAo2lu6LOTBQns3qVqoofJVDTK
 Pa5j5XMwkIWJ/oInP0RgL2l5+TficoGmzLeIH9RQf2TpyoIBND5QR6PZfVlk/Tf20qUskawoP+z
 NfK6vv01/J/KXDNSIzttieaLcxFXxsl2vpViOanFhl09Q3IktQtdy7rsrRr+h1wjN+oHquBdd5W
 WZuQ9HiUOlRQ4MD3HFgTwfsYlHLvS57UZmGo32V25yxqX0qpiRERZZvVy/knk8u/qDGyYjZCNTO
 t/S5gRgnAqytyhLiliX24LWJuniwPZfVeqC6ioqW5vPskeLXLF4nb4u+KRZUxBPlD/8o81QFsK
X-Received: by 2002:a05:600c:45c4:b0:486:fe45:483 with SMTP id
 5b1f17b1804b1-48727efbed2mr73079765e9.22.1774653986466; 
 Fri, 27 Mar 2026 16:26:26 -0700 (PDT)
Received: from [10.202.147.66] (147.149.216.82.rev.sfr.net. [82.216.149.147])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722be608bsm153255555e9.0.2026.03.27.16.26.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 16:26:25 -0700 (PDT)
Message-ID: <dcb18b56-4fa3-41d7-81aa-3ef38d60a144@linaro.org>
Date: Sat, 28 Mar 2026 00:26:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/12] target/arm/tcg/op_helper.c: make compilation
 unit common
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
 <20260327165042.604105-10-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260327165042.604105-10-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 27/3/26 17:50, Pierrick Bouvier wrote:
> Remove unused header accel/tcg/cpu-ldst.h that has target specifics.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/op_helper.c | 1 -
>   target/arm/tcg/meson.build | 3 ++-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

