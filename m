Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0579DE63FE6
	for <qemu-arm@archiver.kernel.org>; Sat,  4 Apr 2026 23:39:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9Aah-0007kZ-74; Sat, 04 Apr 2026 19:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9Aaf-0007jx-Hw
 for qemu-arm@nongnu.org; Sat, 04 Apr 2026 19:39:45 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9Aae-0006u0-0v
 for qemu-arm@nongnu.org; Sat, 04 Apr 2026 19:39:45 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-35da2d35eccso1842336a91.0
 for <qemu-arm@nongnu.org>; Sat, 04 Apr 2026 16:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775345982; x=1775950782; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3+vVJKpGt4Ir0Jq3Y1rQ5Oz2j81xkTcnzfMuAaNFhCs=;
 b=Py8d460nLXud+BrNqhNCc/opOVmf3fzcz1Y/wFchnK96Mwm6kTBldbEAXWRDm0iz94
 P2nr4ajWIbjZdPK0ralGpZYnXVgh69LG6WUrsND7GFgK5SNEBa5NboQQZzn2EOHMFhG+
 HmQsVCdXQDy3G/YKjaTFDJopKmrFk1lsuPyHlz+IYR8mv9cLLd7X7hZMpNmfh0NYuekp
 wiFW/shrjayP94DSuq1Zc0E4GkElf9RN6vI6eZ6gQNPzNE3N9AP6+cGe2RFF4fp+Ks6Q
 k9sTWqW5F/5trUeI+SI19g21EOPO93rRgWffqdDGJNtIG0H1t9lbpeojdW2Dma3a3VgC
 Omkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775345982; x=1775950782;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3+vVJKpGt4Ir0Jq3Y1rQ5Oz2j81xkTcnzfMuAaNFhCs=;
 b=SDtHYytpajNNBC94Iv+JjtHIH8Xp7m7xuYi2QL0QhTKjsUGMU/enizprwIS0Y4W6s+
 j2zIYTxtjxBTvODeBNBbncVkoZZpnt0xoWIBKvCUB5kyGBoKRcTVibC88LfQJwwiZml6
 1zsbigygwWTclNcd0NgA792V9AnusdXRCliVfHWGaMLBXj7ayK6RDiGt9My6gpWuSkCd
 J4TETE0IEsnmid4VwYdP3DQCadR49RHwIUFvbUkBAylMdO/X6MnWZq1yQoDysTIjFL0i
 ZsWjgPXmJs+qpOzKeYZRWWjNzWca1+WzX0MQi7lMgTb58aUJl42xwIlyo+B9ogQbbTxS
 dcrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuZWrHCDxToMtO6f0kpYN2ZT/YlnIYT7Txw+GkkgMMHykfAFGESgYRZHAF30HLVt6LPXVV9/SiAQ==@nongnu.org
X-Gm-Message-State: AOJu0YxZ5lTj4RToFHWrWlvKhUcSs3njRMdrZkeCD70cvQxX4/W5L2Hj
 S8gw32k+up296Xr0akGWxxY+DLlNnA81XJaRcwAeWWco97dzqXh35txNuNIXphY/W7PUlWSRAY5
 FVvJKUvI=
X-Gm-Gg: AeBDiesGeKImoIINwq7c+HU6wbVoan38bVSa3RCE9OOzMYFDGIztSM9MzFtMd+ZkpH6
 q+y/twhZcNuoLfx6PweNk3HMEy8fmFVz6jKlq4yNM/GLXlsxH+zxhMYrmXOJAKz8cAgAWKTDYM0
 FQGqCnkhshhzeOLk1S3Ut6mIpsaMMpMvLHLFjfHMLwF3Eexs7KsQYj09gyuNmiUqNMrj9y5cIiS
 Rb4E919yWpsz9Y7eoMERRxZL3WcUSnNnk9cgU5KvWdcO+1R03LLK18MGWSEKMNNiPvFtPW2eqBn
 j7ZA9ag1xn5HgIOatZnV0qSoL+OpR0uPFyzn8clyUgqxpSlzRflfVsvQvhmo5+ZeH9PjM0sFkN0
 uqw1/sfr9nLObIEjT4P5nDOJVxqnws6LeF3UqWr6nuCim0IaXGjl/VaSu61ODcgBGlPF24V42zV
 BP6KmH5oovU3SaM3ET6PpgisbSExNpbl/KC53EqvOx2WFFOcszhf/XNuf8vHYdrNiMqVI=
X-Received: by 2002:a17:903:32cd:b0:2ae:c816:ec5d with SMTP id
 d9443c01a7336-2b2818bc0e4mr68972505ad.32.1775345982251; 
 Sat, 04 Apr 2026 16:39:42 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b27472cdfesm97140715ad.14.2026.04.04.16.39.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Apr 2026 16:39:41 -0700 (PDT)
Message-ID: <3230449a-1c07-4e20-80d0-8a4e92fc0439@linaro.org>
Date: Sun, 5 Apr 2026 09:39:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/13] linux-user: add MTE_STORE_ONLY to prctl
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260309-feat-mte4-v4-0-daaf0375620d@gmail.com>
 <20260309-feat-mte4-v4-4-daaf0375620d@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260309-feat-mte4-v4-4-daaf0375620d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 3/10/26 08:59, Gabriel Brookman wrote:
> Linux-user processes can now control whether MTE_STORE_ONLY is enabled
> using the prctl syscall.
> 
> Signed-off-by: Gabriel Brookman<brookmangabriel@gmail.com>
> ---
>   linux-user/aarch64/mte_user_helper.c | 11 ++++++++++-
>   linux-user/aarch64/mte_user_helper.h | 14 +++++++++-----
>   linux-user/aarch64/target_prctl.h    |  6 +++++-
>   target/arm/gdbstub64.c               |  2 +-
>   tests/tcg/aarch64/mte.h              |  3 +++
>   5 files changed, 28 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

