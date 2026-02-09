Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1DFEF070B
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Feb 2026 04:50:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpJDW-0006sJ-Lt; Sun, 08 Feb 2026 23:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vpJDU-0006rh-SX
 for qemu-arm@nongnu.org; Sun, 08 Feb 2026 23:49:44 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vpJDS-0003Kb-HB
 for qemu-arm@nongnu.org; Sun, 08 Feb 2026 23:49:44 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-8231061d234so3900126b3a.1
 for <qemu-arm@nongnu.org>; Sun, 08 Feb 2026 20:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770612581; x=1771217381; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jkJ5o8AGeg/mqjE1WI0/WGRZFm1PqmyUvMTB3WwatAs=;
 b=AUtkHFNbrs11BjQw3ot58Kg7qNauWezpXWQI5qtvvBumAUgs+RGVgHpExKtcBzTeY4
 2uK4SWzvc3TsPQM/1aUTBK/AMRmWP7equ3XboFjLmuRPdDtRgXzR9zLLc/ag7B+cHPJn
 qE9/SatMIJiq8eCCTd97dxhjsoZlPQZul1AoPZLnT8bPqp4YJkqQEtnDN//UE/4ysnOx
 l2foVwlexm1vj/YF/ldNV/uQ24kkzCu7pCqSNq62kXs0pUaqMVOT1igBlliGbdZAquI5
 wE1Ur4NckU4CF7BxlJRRAjS1WUNAZtn9/FOFdICkMZ0X6BhEZpoDhFcwo5A0RRYEwCmO
 kIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770612581; x=1771217381;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jkJ5o8AGeg/mqjE1WI0/WGRZFm1PqmyUvMTB3WwatAs=;
 b=oiB53LMIw0RHD6XglanarazK+93hxv+bpAqHIoka5l5wdBBguey2r6j0t7In3uNDQW
 xrmLU7JvuJ6gHLHekTf4oZpNGhMVDlpIhUbMce+lVXJYkP4YDACwByKDU8OluVYUrDQ4
 F1LlTfymMg+zjzo65reAnj+jpWNQjXqQD0oPyULDkLhpc+DkCRmkYLikGyNJrhSTeD+r
 xFNL2OlDGX0EpyVtysqdNf3vzRjlLwpDyEv7Ot8PfOwdssjX8akA6wEG66I20dGth8sn
 njnxAX9/2EqTzzFJygi6v6Ael/oit9vIEcMX6bgjFT5lN0CyU5wSuNxu/qAuHnJATCaC
 nhQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/tEoZrCwelMU/nd4fdx/PLPKS3DvLFix38A5uVvX31T12+vyMiGSvLGLc9bIU7zmbymat97mEyg==@nongnu.org
X-Gm-Message-State: AOJu0YxLeyvqO3Nvx8yaFdLS415cGGV6sRhTMWivbYiImVtZNUvxVzxn
 QOBt7czw/HlZ/rcAWCc/X+NhAbOdqyyxASlEi25yt8YIwoPjoui0l2M+C0V41ATIX0g=
X-Gm-Gg: AZuq6aI7u+cjIfv5HwrywnRI3vAr+o2ypAWMRU67hz7zSltwNJ1N3iHnN+gjC+AwGQF
 SbJK6/dc1cTeNCoeRQVrSCfjyN2pUATkPTn1rz8f6A0IK0R6bBaRfN+l8J7GHzxqQXKDujrgi1s
 dLn3FxYJZY4noYoW4/IRqMYuoS9mnJMyaWssffi0VxuuI/v2K5hebVQo0YjAEtzeFR74bj7Udan
 VpMDbd+yHWwo0QmoQCG/hO7x/ZgQiiykiOfXHtjqmULISNP2DZqOvsG5+XTX0vEvXIcL8kk+C64
 j49iVyr+dU7nAqVHAGWO9wiBCojwjc7skcwJRZW1OO3xcxb/QcyphhPBeqDYfsg+tP44X1JPSlZ
 uV+nE2EiV0LtnV51y/LtIDimmuZj6opEJd0yAOUVxOWgTvHt+UI+SedVk55eB65qcisgvJZGJ6u
 rcPzR70Zbn1ikaGJ1TVVyKpT//58HXLae74XePsx7VtGVYPD9e2NvEVtjaATEYWF1OGFaT7FfiB
 A==
X-Received: by 2002:a05:6a00:2c98:b0:81f:50ea:5da1 with SMTP id
 d2e1a72fcca58-8244161079cmr9706170b3a.2.1770612580898; 
 Sun, 08 Feb 2026 20:49:40 -0800 (PST)
Received: from ?IPV6:2001:8003:e109:dd00:9c4:a3d:914:f9b?
 ([2001:8003:e109:dd00:9c4:a3d:914:f9b])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82441677169sm9503784b3a.6.2026.02.08.20.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Feb 2026 20:49:40 -0800 (PST)
Message-ID: <bfc4b21e-cdf7-4afd-b734-ba328f5112aa@linaro.org>
Date: Mon, 9 Feb 2026 14:49:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] target/arm: extract helper-a64.h from helper.h
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, Jim MacArthur <jim.macarthur@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org
References: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
 <20260206042150.912578-4-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260206042150.912578-4-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 2/6/26 14:21, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper-a64.h                            | 14 ++++++++++++++
>   target/arm/helper.h                                |  1 -
>   target/arm/tcg/{helper-a64.h => helper-a64-defs.h} |  0
>   target/arm/tcg/helper-a64.c                        |  4 ++++
>   target/arm/tcg/mte_helper.c                        |  1 +
>   target/arm/tcg/pauth_helper.c                      |  1 +
>   target/arm/tcg/sve_helper.c                        |  1 +
>   target/arm/tcg/translate-a64.c                     |  1 +
>   target/arm/tcg/vec_helper.c                        |  1 +
>   9 files changed, 23 insertions(+), 1 deletion(-)
>   create mode 100644 target/arm/helper-a64.h
>   rename target/arm/tcg/{helper-a64.h => helper-a64-defs.h} (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

