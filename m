Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E35CE8D6B
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 09:51:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKvtB-0008OT-BX; Mon, 17 Nov 2025 04:51:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vKvt6-0008Mv-IK
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 04:51:10 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vKvt4-00082t-17
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 04:51:08 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477632b0621so26760765e9.2
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 01:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763373064; x=1763977864; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nKONbSrTlAEP/nsJYKwQbpWyuXv7eV+LOegkhBERaIk=;
 b=tMnyasecxCpgikXf3zLGRsjwWmvVbQPBUu2ZagZ8NloZnwN9fJ3KoGUeDBygtBTAvi
 NyJKc1bKBG0K8z7LU7OWV75SkoJORnQfeu1sJpr/d72fsWwzn1eQty+/IenVgGV286EK
 UyszpID0CAcxXYDmmElV0G4iBHmw/M9VHXfPAMOa9hXmzPWMUbMnSGGOmL9zJg3mY/Wt
 LzRzU8m2LZ1+wIE/8Pe9jUpL25O4eLp+MN5kg71FBGRO7IJvOs71zmuM89KlkSPlmJyi
 teWAKfrqQcd9cGzuuq/WyTWuPC9xfWc3050guJuyp/QG9+O2zw4b/wvB1v5w7HQThkVf
 WFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763373064; x=1763977864;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nKONbSrTlAEP/nsJYKwQbpWyuXv7eV+LOegkhBERaIk=;
 b=V0yMifS4iHnwsCBhzykAEGP6NagVZlmHJMZWuyu1HolvhtEs+pxW72+5FUT3RaQNfh
 mPDbG4mxegDec4kTooQAiHvNZxp7G6DO83tSWBgYEA9uZFpA1WHHijAkAVF/+Ax9tD59
 tZP1RSeo/wYwCfvh+FjMRSTFIi+nl6r7gCZgXyAmzR5HQ7lWMSkgUSe3EziYS/riFxzQ
 SrgMUv5AkoED5h1F2K+DuhE+0NQoHMCzUgke/VTpYI8YfDdTrJK466bm4SbX2c2FEdhV
 xdwio3vYmD8LEYt4Jbolo1tFek/xnrGaZf5Wthx/KeiCBN+Djr4sFdOk7/8EuiaOy4Up
 eygw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNovvA5ij5U/kRYPxK+UtiHhoms2EYARxS0LjkuATDlXgqgEbXeQLbVnkZTjVfik6NvJdrTRYECA==@nongnu.org
X-Gm-Message-State: AOJu0YyxJqzzD/o05uqWWiLENr+S5gih9jmkdoKcNjRs4mjSdJcDQk+M
 XE+F2XyDH5UA7PnblHsiKAAPpm+sQglWCKxFZOl8uLSi4XHShd6Md//XePPxZxkBp4k=
X-Gm-Gg: ASbGncu2IXSAUjVVbY90hxTFcb1In1qWorSbkgy7HUKahUhThZX9/gInCQGzyMR1qmy
 ezNpR8SNGXy5/5FcFYON2qy1ouv8mO6XFsm6X2h/j/WVcN0zj6jBG8qU9d868EHWxAq+ZTHJhlO
 hjsKl7U87lS6emm/RrMRRVDyBIWBAe4A9TDP6yua/c8nZOwwPFyEG0iZOcaNuC73fso5EF3HKpa
 7Oj4gETpG5TxZIOYVW95GvFITy6x0BW8VgZMY0AH507oSI3wBjZOetm4lm+QzejRSCwUOiIVaOM
 n5I3vMSCzMvGoCR42WWAtk/sH4OWCGpnH4A03WUkhf0wr+8OECNQXdxuSpHKbp0lV5uZuiOTi5h
 keRURtcKc8Vmnu/86Xv3TZayBKbckhpYeP5C9J7hyqPODvIbUA5i21ni+OFLOLmR3r2/7CEIPn/
 tdQyIOx5qzjq7dRwL8k0sELDvvcpNHpsVidb/nXj6nmq+aMg2mh9I0ZJqYQQ30BEFy1512nWs=
X-Google-Smtp-Source: AGHT+IGjkKnGdSb+/obGz/sDsRmULiS4jXvZg2ckIAugBLWtXGzhMtnWtiGNi9he5N1FUzT1VL0IJg==
X-Received: by 2002:a05:600c:4f53:b0:477:8985:4038 with SMTP id
 5b1f17b1804b1-4778fe5e5a9mr91845205e9.13.1763373062868; 
 Mon, 17 Nov 2025 01:51:02 -0800 (PST)
Received: from [192.168.8.105] (66.red-37-158-132.dynamicip.rima-tde.net.
 [37.158.132.66]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4778bcfa2e9sm108631585e9.12.2025.11.17.01.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 01:51:02 -0800 (PST)
Message-ID: <295cc1dd-664f-432d-8f50-fd4455011a72@linaro.org>
Date: Mon, 17 Nov 2025 10:51:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 02/10] tests/tcg: added test for MTE FAR
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org
References: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
 <20251116-feat-mte4-v2-2-9a7122b7fa76@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251116-feat-mte4-v2-2-9a7122b7fa76@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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

On 11/17/25 02:40, Gabriel Brookman wrote:
> This functionality was previously enabled but not advertised or tested.
> This commit adds a new test, mte-9, that tests the code for proper
> full-address reporting. FEAT_MTE_TAGGED_FAR requires that FAR_ELx
> report the full logical address, including tag bits.
> 
> Signed-off-by: Gabriel Brookman<brookmangabriel@gmail.com>
> ---
>   tests/tcg/aarch64/Makefile.target |  2 +-
>   tests/tcg/aarch64/mte-9.c         | 48 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 49 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

