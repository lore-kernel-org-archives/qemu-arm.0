Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19847CCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:17:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kIv-0004bz-DI; Fri, 17 Oct 2025 09:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9kIg-0004RQ-Ux
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:15:19 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9kIU-0005dd-KJ
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:15:18 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-63e1591183bso1165094d50.0
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760706900; x=1761311700; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7KBvpUL1h3bSz5p6pHNnSy7lLlY15drjVxsXUrLr7D4=;
 b=BN/srSQmM/rLN6Wh+ih3e94kJSpkDuif8BaywA9o5+G/WXa3nByDtX97wp7oYJhr86
 ZyZMIh31gVAzRGzaKUOBWB6f4MhxRIA4s6sx+yWtUSaaS7kjxkQT1+sKOVkHb6RQNL0l
 7VKV7GTZSNYH9SFEhvRgRQ7v8gzjNf+5qheMGhlHBzT9YsjgsSOdwxPmJHCi7b9fbv7q
 wWQKLx9VtKN3RYFl6i0Kw+6vKYuMEcImpKEjC/s6zIJDLpk0GuIHp0+0ONVVN9+FZjxZ
 6wMa4P1hg3xuvIkc/iwadPtlfB8aJqUpHeXN6PnzwbAEdb19sXfBKCms+ZPQdUXSBZgX
 vaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706900; x=1761311700;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7KBvpUL1h3bSz5p6pHNnSy7lLlY15drjVxsXUrLr7D4=;
 b=EbFyXtjjtYWVDub2n45dPRYmhBLKpORTc3tjHC7E89hQaW9CS7q6AySZbIHnUeugJV
 cZZepgAKUlRBElA9VnJbO4DSyDNS+yKM3t5tCkz8k8q3EgJMEOWQmx2u48pxxMV8Yz/j
 orneNiQ65coEL7GrRaEJb449PL/j6I1/DFcPeDK9pZBoSdwhXIZeh6W55C7KYT1wl+3c
 52gO6zitcT0Hp4KSItC/37JA9zIQA2z1tXZ2W4h4nMIxuCbt+FTor1xzEYX8UfWus0CN
 QkolDZjdgvHx2aogb83pXR+hu+hVRmGXSBSN2KKx8kSfTtRzUQ4ZXp3R8aEPm9FLpTzL
 CwyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCot+E7qGpyXros5bEWGAReZ19DxmlJA96kThhAwzqtAyo/zBWKU7e5Cre+LK4HqEWl+jpxByHuw==@nongnu.org
X-Gm-Message-State: AOJu0YxpVeaJXJ57w3SPtthq6mVPRuqvSYcYqLUeeSdVsR4CJaEyL1/7
 rBdkqBmFPLkvsJh2MDLGFb0Dc8JQmzuErqqKSRmqRpT4CCi4gGbNC8iu6lxDEhEWUBDR/hU6Ngj
 q1y809Ncv6U/2CPEtLUY2XKRCTtpFPA9YpDqecwibMw==
X-Gm-Gg: ASbGnctihhgmwzu0yFZoxM82grFPebSj/uiseTbVZUFrd0Wttcodkw3OOdf9jbTT4yn
 Vc6uw9d0PiHVkJJyA/v4urukepae0cKnMFra3+66OmcMZewbZQccfVnje95VOXUtAlBv5EJ8T0x
 vW1ioFOI/Zyjdu2LLhGA8wM0Mtlwq4qrsX1Cp7uWlSlaLPfGfhACZPYilmQBH2kZSUmYeWzWz2+
 b/0yLakTPp5JILopWGhyNK3ZpS1aGedZUyGTcmZPUVfIRtjNsoftBEAxq3ANT4fidTjxW53
X-Google-Smtp-Source: AGHT+IHJ5wcHMu2tTN7KcRdFZQq6SEIEPVpMtQY7tXYm4VtPs4ymux/OYrfiMuverZzdXuPtaibO7uQ2LGwDZKyZGJs=
X-Received: by 2002:a53:accc:0:10b0:63d:215c:e29f with SMTP id
 956f58d0204a3-63e16199e6emr2858404d50.23.1760706899801; Fri, 17 Oct 2025
 06:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-9-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Oct 2025 14:14:48 +0100
X-Gm-Features: AS18NWDVETvYNDKD0r02FzQxcODfIwB4zY3T6XrMTE3q-x0uQTCI7BlNhkqSesE
Message-ID: <CAFEAcA9nA=bsOX35bAPsBRRaZyp9pvMCU_uQ=TUmKpYHBJvRJg@mail.gmail.com>
Subject: Re: [PATCH v2 08/37] target/arm: Use cpreg_field_type in
 arm_gen_one_feature_sysreg
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 14 Oct 2025 at 21:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Deduce bitsize from cpreg_field_type.  With this, we can
> simplify arm_register_sysreg_for_feature.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

