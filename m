Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D17CA0FF2
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 12:39:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utmlh-000793-Gq; Wed, 03 Sep 2025 08:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmlf-00077x-5M
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:39:15 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmld-0005hY-It
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:39:14 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61e3b74672cso2042520a12.0
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 05:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756903151; x=1757507951; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z3dnTggf/aXiLs2mixonXKXQs68HM3zX5ZINDqYdG1c=;
 b=kbKjAPFAqttTQFSxqw+mz6S7kMAWZmMJmoaBZ9SZm9MEaoXMzZ31sKYO4+yHeFtA0u
 tRhEJQP6X9vzTD/fdVX6ESeKXKd0XIr4MjsFZQ5zhyUGBW7XZZueyHJvgUVwMM9URkRS
 orVGg4FXDP949G3O2mOzpch1uHINiFq7GzoNht7UkuXRaU8FRcBydSPym45ItJLlHWIf
 wm48cA0O4mXU9sDzdrvMXbMFvY5xPAjD9TMr1Wo+xEoV654pt3WGFsFO6CgvSJCX8Nq2
 MwWi8NRInn1FrbpXMvUTrvhlLZNlPaZ/4hFTPAngEM3HY+iHu7YRKgInZ4lFdE5o1S6i
 2G1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756903151; x=1757507951;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z3dnTggf/aXiLs2mixonXKXQs68HM3zX5ZINDqYdG1c=;
 b=CZ5xpoOzJkioU6PfqcQD9veTF1F0cxUAPkFX6rzpjbUyyJhfjvRFXTP8kTOMkl4qSF
 Ci4uIv1LBoNOCLSf9ge2CzzFRkj3ZZswgHGF7tZnGGbW/BGgPE/UH+v3jp8OTAHIeMVl
 NkugqEJ8Xt+GNV6j+uDniLFIy4sbBLJcjx03WoW4+q0K2mUHcB8vMejleQWXE95ug8zh
 M1Xg4l9nKO3Ws94zeOV9eof3mNDdOd3mY1KQnFIzyby6dreGkW+7GY0XRe81Y67CKio8
 hVjokCeiWhNzwUi565c4b9s0LCMBIqJSBUH1k2aa0H822yfCWCyzKpcr4f1z1fzHS3bi
 u+KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5GFH+4etH+9c1fMqZYms4NjEQNjitMOELIDMe3v56xRd/u/UZsY7l6fU8nOLncpgGo4KKr815qQ==@nongnu.org
X-Gm-Message-State: AOJu0YwsdPPqluuwGi7l9S3H71spGz/dm0CQ4WsPcel/uETaT1W+bTdW
 KAQcE9geNa3sWNxIpyzDioGhqubZvE6hYNDCN+9DBmD5N8pp6iE36FRwSWMdSz5/o3E=
X-Gm-Gg: ASbGncuVxHjv6XOYhjB0RtUT8IT3FBL64wQBVXczvAIQKjJB6pycPbEVT/qj58iA1m1
 lLwlo0R2o8LeODUxI2n6e3ffMXMywymTHlbQgf7rxU0Ri4WS/Yq6F+Z6eG7ivOzINtbqWarGvNK
 9z4l0n5gfyk+nxPeFfp1T6DHrEPbHb9DIBB9fLzDsvdIM2z5rB+vlFwtIBK5ex//HAHrWld6AYW
 zfZkXO3zwU3/TWEga4VRzeVjf9M48i+Tf14uBkYbqeSlWwHLHpcwjKdnXSX7VJgTHKE1PVg4QDM
 7BOBORcDx8/r8WLHZVh9u4H2yyrxjPgUO5iVrSdgwFZUGdy1xsya0MU6Hx/QFtRu7Bkf8Py3FTa
 k1Kr6qICRyMQlxpXBd2uh+xFPc6JfgapkBm6xNKDjefrvx++c2KCv4mTV+bWVLItEDKRKvM0+L2
 9b61C5dA==
X-Google-Smtp-Source: AGHT+IFMVaiBiu2X/r3QXWVJDz+O9j+wp2iaJ86qCxQeGkQXicDdtLEJ4APQsJCWltcqVmG5msEH5w==
X-Received: by 2002:a05:6402:2681:b0:61c:d3f1:9b02 with SMTP id
 4fb4d7f45d1cf-61d22f522f3mr15137413a12.14.1756903151470; 
 Wed, 03 Sep 2025 05:39:11 -0700 (PDT)
Received: from [10.40.6.207] (93-51-222-138.ip268.fastwebnet.it.
 [93.51.222.138]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4bbd09sm12070989a12.33.2025.09.03.05.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 05:39:10 -0700 (PDT)
Message-ID: <b5896eba-54cb-48c7-93c4-e9191e08bf52@linaro.org>
Date: Wed, 3 Sep 2025 14:39:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/24] cpus: Trace cpu_exec_start() and cpu_exec_end()
 calls
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250903100702.16726-1-philmd@linaro.org>
 <20250903100702.16726-20-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250903100702.16726-20-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x529.google.com
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

On 9/3/25 12:06, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   cpu-common.c | 3 +++
>   trace-events | 2 ++
>   2 files changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

