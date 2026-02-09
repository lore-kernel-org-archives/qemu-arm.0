Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8E5EF070A
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Feb 2026 05:13:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpJag-0003ZZ-IL; Mon, 09 Feb 2026 00:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vpJWM-0002Vf-N1
 for qemu-arm@nongnu.org; Mon, 09 Feb 2026 00:09:14 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vpJWL-00085S-3w
 for qemu-arm@nongnu.org; Mon, 09 Feb 2026 00:09:14 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-8244c048d41so1920498b3a.0
 for <qemu-arm@nongnu.org>; Sun, 08 Feb 2026 21:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770613750; x=1771218550; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H9/1jawVuRkI1L+N0DjtmxsYJhIanQWdbekURSZOiDw=;
 b=io/ZvgQxqZ8aa+17evMsfHRTNGPV+xqlNxDa4XIY3sJ01mGFFeTxbE+aV3IrjMgHAG
 pAJ8g+qrhVQJBDn1lQFhxL/ZLihJtQoL+m8S4Lk2RybQNYJzMiy5CU39wmaURkS6gysd
 NibvCyBzkdrgU/w66E9Avy4jRjW1huF43l1EAolqAW9EAeeNSyy7fKy2Xcy3eP0OAPJ3
 JE+H9AOu6IFS2aMJMSvK0b3a1rFzlVrpXZLo9dkRrqHeuS0AXsh258Lx5vZQ0cQbNN/u
 dhPOhD3H/jU2WY3Rh3uTQVluXbvBU+vSljzqhZuyjZ/uv3dDT5nUrpy+teqynair/Kft
 yZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770613750; x=1771218550;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H9/1jawVuRkI1L+N0DjtmxsYJhIanQWdbekURSZOiDw=;
 b=NBKbHw3UGACacRcP/Sm4MM3Jbiky1LfGlEu510+zJV9YM65TnABU/smkxMruwQASrV
 Bfwz73MIIO8VfId8sYggd28Dd6+fEmLbBwy4djckXLKAbhBO/G1lWy1yr4D5ge0A9K3Z
 sOXMu6gPmOEe8UE7skQRSnZcBttTcGAsBMxp0po8MW6we4GCc2h7tJkgEoh9bg2aww2+
 O3YqkxgkuIEJldinHyYE7Alr4f2ObtEBZiqGVeNZOhSHUduzuzhaeogHBadshAv7Ivii
 M9IjcajT8+cf0VPli0+InpiiVUfOBR4wH0Djg4RZUJLhRLfMJM8rnsLLGZxiknvqF5S8
 UykA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnl89Y7mPutSDkCmwz6v0HKjPU6YRciwaxQVV/Q+IQ7JFcR6j5hbKP5y+FI5L1sbAeqSJMgz1XyQ==@nongnu.org
X-Gm-Message-State: AOJu0YyAjU/ItU5eeo3AwOrMCjVgtc8SNtFLo381qlg6eciVGbPgqLAY
 Zdyz47EYrvvI0bSXWg2e3kDg0eiZMbiqgpk2KlAmLKW0HLk3E4OcdEXvXWwzdulwb4o=
X-Gm-Gg: AZuq6aKSdLJZeob/XiObMcSv8hUs33ZldT3OwnZK1qggVfUYAgCC7FxsVJ5ahBqOhBd
 HVqEGr/I1yJrPylBj/H2MJOt+DehB/jtYbHnA1/41jDh5CT8aUi0ZWsykd124zLaDRAKKKM+oAM
 l/lQ/rEZGLlU2J1OBS5c6EHN0+M+wjZSb8jkRxVtre2HnBmZhpMySuH3MGqi1RM99eEgm2OUB7r
 gOziqkT3d7iKPP+XHSyBbeiqmfmueAplophlxC2uiMIw7NT1tymV8RZvjkwvfW+PqTqcqL4d7KN
 ZX5gf/56mJAWkVB0c7exPZxUtOXHLtZvGUT3u4h9OLm5Iw/1/G1ijJ5k8UBlYecjWEsWtofqHxF
 efAVtS7LfzH6uOSNS9QpoGjBvFy2uCGnc/HeCXNjlembSvtH3pf0Kmz/VL2Z4xxCgU14ua9hvg0
 Yr9yhAVlTGWXyvrZmKmrVTbHds3cZU7bE/RvcQ4FKKIruCd0xWs1wQOj5w3UnwExo=
X-Received: by 2002:a05:6a00:f0d:b0:81f:31c3:2e34 with SMTP id
 d2e1a72fcca58-8244162fa69mr10269391b3a.25.1770613750478; 
 Sun, 08 Feb 2026 21:09:10 -0800 (PST)
Received: from ?IPV6:2001:8003:e109:dd00:9c4:a3d:914:f9b?
 ([2001:8003:e109:dd00:9c4:a3d:914:f9b])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6dcb5e5f98sm9324749a12.17.2026.02.08.21.09.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Feb 2026 21:09:10 -0800 (PST)
Message-ID: <8f64a18c-b2ca-4665-898b-917031c53cbf@linaro.org>
Date: Mon, 9 Feb 2026 15:09:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] target/arm: move exec/helper-* plumbery to
 helper.h
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, Jim MacArthur <jim.macarthur@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org
References: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
 <20260206042150.912578-8-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260206042150.912578-8-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
> Since we cleaned helper.h, we can continue further and remove
> all exec/helper-* inclusion. This way, all helpers use the same pattern,
> and helper include details are limited to those headers.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper.h                        | 13 ++++++++++++-
>   target/arm/tcg/{helper.h => helper-defs.h} |  0
>   target/arm/tcg/translate.h                 |  2 +-
>   target/arm/debug_helper.c                  |  4 +---
>   target/arm/helper.c                        |  5 +++--
>   target/arm/tcg/arith_helper.c              |  4 +---
>   target/arm/tcg/crypto_helper.c             |  4 +---
>   target/arm/tcg/helper-a64.c                |  2 +-
>   target/arm/tcg/hflags.c                    |  4 +---
>   target/arm/tcg/m_helper.c                  |  2 +-
>   target/arm/tcg/mte_helper.c                |  2 +-
>   target/arm/tcg/mve_helper.c                |  2 +-
>   target/arm/tcg/neon_helper.c               |  4 +---
>   target/arm/tcg/op_helper.c                 |  2 +-
>   target/arm/tcg/pauth_helper.c              |  2 +-
>   target/arm/tcg/psci.c                      |  2 +-
>   target/arm/tcg/sme_helper.c                |  2 +-
>   target/arm/tcg/sve_helper.c                |  2 +-
>   target/arm/tcg/tlb_helper.c                |  4 +---
>   target/arm/tcg/translate.c                 |  6 +-----
>   target/arm/tcg/vec_helper.c                |  2 +-
>   target/arm/tcg/vfp_helper.c                |  4 +---
>   22 files changed, 34 insertions(+), 40 deletions(-)
>   rename target/arm/tcg/{helper.h => helper-defs.h} (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

