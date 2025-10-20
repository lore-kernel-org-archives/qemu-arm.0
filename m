Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997DFCCD193
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 14:53:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vArFO-0001OB-4w; Mon, 20 Oct 2025 10:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vArFH-0001Gi-54
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:52:23 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vArFE-0004bT-Rp
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:52:22 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-63e330a1360so1394084d50.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 07:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760971938; x=1761576738; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QiSL4e2fBIcBs9tIEwvzCnJiabzxAMhBNjHMe14nYRQ=;
 b=VqdxQGk6MbYL4aOoTyiUP6mSMwW7xADw/yiUOsBi9vSVCrfhxi7Y3RAZAJcsSCzSti
 DFc4Ue1XsrjE+jx7q2YIpysGJ1a2r5v9ucKDT+SRZRD37r1Y37GHugMsIg1pFD+rHvcZ
 0HSqk9HZOe5eqUBNBaOl6GlbsDl7r9RK9701ANDstuBEWYKjkOEFPUxoxyIo6RJJG2KO
 vdalU/UVL8/EkYohINIyWr3dd40hXU/jkthIlk0XjoMA/yEMGSlD9/S5rmOAjdNxx702
 Utx29Q2AwGtFsm8o59HSOYsFCCIsWiveR7ClnxgjTIpkpYcWrg0oyGvmUQ3Sn7kHX0+e
 wXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760971938; x=1761576738;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QiSL4e2fBIcBs9tIEwvzCnJiabzxAMhBNjHMe14nYRQ=;
 b=aBkUMwLTVHfkv7U/YcvNVjOiECm2VJpyU8nYgvD+7elVnaW1B7UL4ps8kDWin7g7GO
 c0S/Cfh8gtEE6nmh0AoOXAz2hsnDHoLKJivAQ7/LEkFQZ3CgoXovBAjig3IZiLxDeT/f
 Jnh1tAiXx570gXGbheN1zOGXHYI9T6n64x8gcsVqIIkChEH4PyvcabHAMdgy8B1VXLfb
 y6RQdZBjdcSpikEV0PiIRrK0pTbm4lzv7nBXWHTqQ7r/8g9g8kpdI1aBTATKVzvySOkp
 eQOLrua6fAis60aQFHQ8AhB7X7x8GY0L9MGakxx69fYyZoPc8btJJ1nh2wpuaqCfiWlD
 0ybQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5zWBRIf6cGCGzgxUnK321PRm0zK6fdkgUmF9imT8SKCrzJMGgmwbCyCtp5yelqmIv64fbXV3JJw==@nongnu.org
X-Gm-Message-State: AOJu0YxCDUKPjAL/1bijc/Z2aogSuhCXSslRsdJlcPWcyYGDB7gxAgZh
 yTQPpv6M7nVsXM/B0Qe/QlQmEulx1gN3zNbEdzZNrMukDeMJY1SyRirU4j5earffpyx01eUJw/X
 khz1WzK/0eFoFV0DCecnR51gmSmtRtFtttIWeXcoQMw==
X-Gm-Gg: ASbGncu52wyXdGhYVvqtXV308GlKz2l5cTZIO3GfrPG5ZaBI+CJ0DgUs6uVOpMKPmJG
 4rC4BbfqGYaLxqmBsVI//K6WBKHHg/i6913BF2rs7Kv34itQw9w9ByVGU7cvekHMmMOneA3pAMW
 kRVMynLqvvU++0Nwyvu4onRLOWiEPUZdYNj4BrkcTWWbNO+BhJhVXA+o/mU+IyZchHxGCcqh8/m
 yjd80JaK9vkCw/ywg3FZn9Pqbz6A3w5RiOzrcGALXNQ8k/DpvvSCncMOqXBGA==
X-Google-Smtp-Source: AGHT+IF4J72fmMDhzbJoHGvzDUzfx6tOvgiPYIOQYpC5HbLG59UrIEmzCKCtvpahu/JlRfa7qjOKKjlabgjnbsOUWrw=
X-Received: by 2002:a05:690e:1541:20b0:63e:14cd:f988 with SMTP id
 956f58d0204a3-63e16168238mr8770357d50.6.1760971938015; Mon, 20 Oct 2025
 07:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-33-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Oct 2025 15:52:05 +0100
X-Gm-Features: AS18NWB5NfEXx0zAMz68z2l41x_k0WU7yblEhOOHI7Y8kcEhVY8Kw3F69ogBgwM
Message-ID: <CAFEAcA8C8vvH6_ObJzPyBu7Hg6kT6V4zPMo7z6_szfje0TU6Qg@mail.gmail.com>
Subject: Re: [PATCH v2 32/37] target/arm: Implement TLBIP VA{L}E1{IS,OS}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Tue, 14 Oct 2025 at 21:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

