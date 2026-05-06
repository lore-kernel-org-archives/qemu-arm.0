Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95832FF8855
	for <qemu-arm@archiver.kernel.org>; Wed,  6 May 2026 13:34:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKcOU-0006Bw-3p; Wed, 06 May 2026 09:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wKcOR-0006BS-03
 for qemu-arm@nongnu.org; Wed, 06 May 2026 09:34:27 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wKcOP-0001zq-Gq
 for qemu-arm@nongnu.org; Wed, 06 May 2026 09:34:26 -0400
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-479e6bc357eso2454291b6e.2
 for <qemu-arm@nongnu.org>; Wed, 06 May 2026 06:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778074464; x=1778679264; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MTBxwUdDAXq/27h3AIzTobRIIsRqrZ0As0hz6xY9Dsk=;
 b=P/hdhFWq1CefuOFM5YVDE9Px03Hx3V4e22r/BoYmrtc8RGPx4Nuf5FDe/ylhb59xXe
 qjmfVrmiuB7CPXbbo8HfsAw8ik+5fgT+20auQ86nlV4lD4lrvD87y1/hZg6aYc04BUDB
 R8yjnirI9p3eV3YHYivyDw76Yn7SB4IyxK1ZnWBJerc3Cc21RemuR671ZVwAe2Q4QBve
 8Bvtyagi/mQxJFQyjPw2Cefwv+PZG7Npu7I3d1KWCXzIVmo0Jzh1pMpJYjWY5I3SiuZX
 LxCwSzz3FVub8g0w9W29qJOY4ChkeQGcZuHG1vMQlD2o21usSIccPon6Jh8R5KKelPL9
 dpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778074464; x=1778679264;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MTBxwUdDAXq/27h3AIzTobRIIsRqrZ0As0hz6xY9Dsk=;
 b=psr1d4U5P+U5D/aCq6kNYtIPdFd9oB7VW38+NK6xyx+mknO8j0rBTG4I3g+t6S/jBh
 +RN8pJdgq+jnl4KvMFF4rWn7PE2SPbRj30xIi9K00PGWC+EnLkPiYGDabJ48XVHGhkiw
 F3ifOx6Db50QMo3VYDvz9MmHbIEau1ecQ678V/OVO6P2w49dkFbJX5ysuHuDoU/nUH/3
 ZTFC71amXI7AeWOZ7Pqk06fSzpazDFKaYi49ww72DulpEpVy7Ixpk8ZJq4CxiNKpM2yI
 YE1uj5m01PQmU8MQRwr+Tb0sDrcJtqPsjUpMdF4WMd2TbdSjQWa0i6MiMmlzZhgxIujp
 gV+w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9LqvjoaObzPa/AV0NcU5XII4uuwOBFKNDb9f1Q7379nc9guMfmBnazXk2sdFehf/u1d3dXmLTy/w==@nongnu.org
X-Gm-Message-State: AOJu0YwTH+Hih40PALnE/LLZRPVJKyE1DVBY6QldOHeihXT/a1HUAuz6
 3f4fxQNoqFHeVwpljEzB2RHLPHy+2QVu467OOJUL2d1wwqs0SIBewBc87uhDI5q+CDQ=
X-Gm-Gg: AeBDieukJPLS8jHSPt1+yjGDIYi9o4ZLS64yjPaU2NQNJbv0aep+mI//VK7Z3DKWAqQ
 dohxLKJ9ZofLZp1a/qr+fNSTaWwBXRycky6BQqQWfzyvqmfQBqgX0G8NP8Nku1KlCYCOHI2AnsI
 SR/qLloAKno+0HKIKblcQEAIbdlr0N2So9YEtEuyljswD5Xk1bL0d6YtfR18b1F888aJ6QpeJNJ
 5LXHFqgw17nec9s0GYEDHYjqvWZJcu2EjBDGAsZXCrZJAJ7BX49ohkpimm5Y3ujaSPXpL3Lg6q7
 juyvCNlHZgCLlJEuI5rUIYbSuDC0UWCxMa/2iqbcQvUBOrN3XEsTL2tMBXf8ae+phifiLxecldS
 3qa1JkOiKs0TM/3yu1Knn3daFnn53SeEfTw/DLI2IU9kjsxhzKHPKgMGMFfCeNDK4tYXuRsjVcg
 5yWcZ5dlZfZkvJrmpAlZt9msqxygo5jAvPkBGo6V4V1dK/fFloRpNXZWTCWVlkAuCJUvbgD33ol
 HpvsGLVwppsXz0TWKMd3TFRD9gPlfI=
X-Received: by 2002:a05:6820:2015:b0:694:9cb9:ace9 with SMTP id
 006d021491bc7-69998d5b2a0mr1532022eaf.52.1778074464013; 
 Wed, 06 May 2026 06:34:24 -0700 (PDT)
Received: from ?IPV6:2600:381:c938:6375:5307:cd92:1ec8:e891?
 ([2600:381:c938:6375:5307:cd92:1ec8:e891])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6968947934esm9870521eaf.8.2026.05.06.06.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 06:34:23 -0700 (PDT)
Message-ID: <83afc091-2825-4a63-af3a-ae5697e02b8f@linaro.org>
Date: Wed, 6 May 2026 08:34:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/15] target/arm: implement MTE_PERM
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
 <20260504-feat-mte4-v5-1-232a648e63c6@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260504-feat-mte4-v5-1-232a648e63c6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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

On 5/4/26 10:50, Gabriel Brookman wrote:
> Introduces a new stage 2 memory attribute, NoTagAccess, that raises a
> stage 2 data abort on a tag check, tag read, or tag write.
> 
> Signed-off-by: Gabriel Brookman<brookmangabriel@gmail.com>
> ---
>   target/arm/cpu-features.h   |  5 +++++
>   target/arm/ptw.c            | 25 ++++++++++++++++++++++---
>   target/arm/tcg/mte_helper.c | 38 ++++++++++++++++++++++++++++++++++++--
>   3 files changed, 63 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

