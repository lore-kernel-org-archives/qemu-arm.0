Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7491C531D0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 09:58:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woI5y-0007PS-TK; Mon, 27 Jul 2026 05:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woI5v-0007OR-T0
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 05:58:00 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woI5t-0005hL-OQ
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 05:57:59 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-6680ae2031fso2167241d50.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 02:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785146276; cv=none;
 d=google.com; s=arc-20260327;
 b=nFoYslbkUciAAB+dvBOgmDfsLYeLVO1D6vccv4+oqK0D39QZNh0oeIYc9pfSeX0X3E
 0JN5C5SC4eDHhQxHxVaNjuQ6497paTqtqjhPCjcrAVpsYZXPifrKWoxTgHdLfJ/9rZIZ
 /rdCAFe6E2Hl7Si3zATdO6Pb+MVfkCms2edK5SCC+XrJogrOugj82cF4gGODm01RpiFl
 DY8aBiNck4/SxfON8FIpjo8ZB5Js7gq0UgezSInyVhyq+9R5iLBwvz4Z05ITpsuXobje
 0nFBqKz5kCH1dhFs3/UBAvvMz/cVPm0UvUij5JFm7Fxgma23DL50wOQO/kkLBxwBk7jc
 vTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rADByToRfCJRBNorNgUKQmQtIhFvp2y25lBhfZHPZmw=;
 fh=lVFIqYiqEqVYmPATrnLYLXw7LH3f6k5705ffSDvsET0=;
 b=MnxhPDHYz/TRm5IRZLlwQqufi3lGmeEWWIlRX52aA88nP3Ev/ewuRK+57RF+iq8C1t
 ccTXQV7XmcAAJ7Eyps52fVRWwTfAYvKYVLGe97fvk3A90Kz8aqnk/4SwHIVscn1ee9A/
 wCgdO/fK09V+dDHxUw+w6NubriYO4CLdHX58uc0Ml0VGjbI8wMdKcl/amuPzejh2Qrd6
 Xei16gxY8tuVfG5k81Vf57qWdtBKRc7bzWu6ZRtyVk0VfVd7qvRvIknMeemdmEjYvhng
 ulYPbLXzMK5goYVrJOQ9yg/4OSsT+iS9+FtrGEKm0E15huhDKHdlGGXJhNQ/omBVT0UD
 9zIg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785146276; x=1785751076; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=rADByToRfCJRBNorNgUKQmQtIhFvp2y25lBhfZHPZmw=;
 b=WXdUvNYsj40ApWm6FcLtAs5gLKX7E8KP4z16NMVUQviGTijYkNE6iCkxmtrdUZUAZ8
 kHChwrAFilObI3PsrKp/RIxfMAexVZ7XIM2P2tBqVFKeSLosfHMECvDIZpbCHF6Jhtyl
 bT6xv7Au6VXHfJHlS7OonNKKYfY4m5DqucWPvFewSS5TtGcOHic5JBz+IKsXE953KuPn
 K2+xQTBFaqtxp6zeXk/sdtO74JK6ySYADp3Mh75XsA0JkD9nipgQVtdqi29TYaCA23Xd
 Hb8xKP5C839x0GW+dtT6lbOqCLqr19MqvBVI/LOwDYEE5LjA6M9se65Q+C6MZ3SqvqwV
 8KVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785146276; x=1785751076;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=rADByToRfCJRBNorNgUKQmQtIhFvp2y25lBhfZHPZmw=;
 b=XBR8zQ+rBxWuPGqhjEBoCjfscad6TdoDfdzgCDTLc32Hq1NMnD1VZd6PLMx0KFyScP
 vpJTlGLSoZ8lYXlbXP7db/dWnpLuuRdGKbB4L39sELa/oqUI9UzQZ9X9BtJ6sj3wda1m
 /oMoHoWZFBkEgyfFoqQQ1flY43bnQQ3o5JtrIemh4CtuGHK+4VjVaWXyun2ch3ScYq53
 2T2Q9Ft//FMMNVA7gLJZ+P08FPiM1d8iOxuLCWl7PezbGdSfkgVkrKPtPDxs1WUCRj9t
 P23FeeYb7gzYhRKZzcevVeFyKWOXlrZZT3QqUpGgNtRhwq+FXRtzm1bczx9qXvA6hWim
 RZHA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrWcSgO9bW4wrEwxRdzNZvIBHHiKjg5RlL0D9YeN/gZW3kayRyZzs7BF30IUJWFBjNbCVx4TrtsQQ==@nongnu.org
X-Gm-Message-State: AOJu0YyGYkawTzy5h/KslShFJPGCYjBCpNnRUAXKF7FnLOHPqZcE4vFC
 RKqxUt6GIJ/N0TRst3/zLjOfn9DWA2wFQZeUXPaXqsjKRQBe7FDbQS0cXnNemNanjg8xfbuIlMe
 mnkMq7ZYWFhvzOOkN7MTg3m7e7gY20s0Ucd6Mcr+Tl/x5dNpbXYDA
X-Gm-Gg: AR+sD13iY5yhdCvcaNDlgfzvB13j7r0jLKCILBGE8aUMygflgmZQaiZJF2K8+IGuVTZ
 K6Rd0uUAObsVqaVA7M6rbJ1VoaTWqu2Ygqg0D6jmkZXxi3jJARpxCRnR5+yfq6lSNrSQZi0Fb4x
 w2JPWHBIZhTaX3JirVLGQt0pwmKdIBdA1esPVDFsYLE+ow2Y83qe6MpfL9fMaLGcOTMD6DA1xWS
 3LdBJY1zj0eDoK3jjWcPI0pWGKpEIxKlvqFfEdpYBAQkqNVKJQy1Uk2c704wp+xerIeUlG/yZS1
 b3VdHLpsPASqNnwtnLw2B0GL0yCcAQCW0zuXJoD6xG/jBNRITEY0fF5r
X-Received: by 2002:a05:690e:4383:b0:667:b234:d5f4 with SMTP id
 956f58d0204a3-668c7ab5949mr1078440d50.66.1785146275903; Mon, 27 Jul 2026
 02:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260724160943.52509-1-simonxhy0404@gmail.com>
In-Reply-To: <20260724160943.52509-1-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jul 2026 10:57:44 +0100
X-Gm-Features: AUfX_mxGDRTQrSvi2zX91N-yKkiOp_k2P_0k-CJfwu7c8vXh2A3KTuowsbgDoa8
Message-ID: <CAFEAcA-SwN3dE1vrmAP+rdEs0U815D4xz93MdC4JUBm-GaxouQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/misc/mps2-scc.c: fix scc_partno and cfg7 write
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Fri, 24 Jul 2026 at 17:09, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Split commit from v1 into 2 as they are unrelated.
>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
>
> Simon Xu (2):
>   hw/misc/mps2-scc.c: fix cfg7 write
>   hw/misc/mps2-scc.c: fix scc_partno field width
>
>  hw/misc/mps2-scc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM

