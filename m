Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2189712njb;
        Mon, 16 Dec 2024 06:02:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXhC4OFU5X6qbA3wL7tcszxq0rive+EB5mXrU58/dIQp7vPf6xyvonjtW1e8+xwf44FHiWjaxUTn9j1zg==@linaro.org
X-Google-Smtp-Source: AGHT+IH7ZEAm3euJ4lIUdadq9fYgtHMnOnVOP4SJrtwEktNbY40PQ29mR2e7/RfaDoZzFKzPNiT9
X-Received: by 2002:a05:6358:cb09:b0:1cb:3e77:ee1a with SMTP id e5c5f4694b2df-1cbd4e9fd0amr4162355d.24.1734357720365;
        Mon, 16 Dec 2024 06:02:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734357720; cv=none;
        d=google.com; s=arc-20240605;
        b=NDBvulpK63CFAq+YMV/sO65oEfzRpAHTpaZFHqBiNyZ7aFyMJxITDAHB0WxbOXS/NE
         OdTXy71VJdRPnh6wwHz/T828j+UW865iVywCs7MkcIGeAlFvAu3JWvwQK7KRxfEwMYnO
         Kkrb/+v0J8HDGPN10GR7Mz+gff0M1uWhPSM2l71qBRDDqaz058y9981QuAk0QVIsFwOO
         yxhqmWszUOFduH8G3SPsJQ9gNIPS6JUAy5HfCrlWVqoqXqRVvkmJ293+pMvqJqotBctg
         1jb4eFPSDHbUCGZCEg44oWU0wjCfRg21hHRc538y0rYV+uURZth2sdaxlZsa570JukPJ
         0JEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=utJvzy3zZQcbbkMPAN++kwF5ocQoRVsyPTFt71LWUTw=;
        fh=z+2ipDnnmA1rIsfOiW9ZO2azEEpJcV8PJddZUr9bh3I=;
        b=GMmL9xVUtRolR7NO5EzC1lzrr+LJgk2dZ+6GzgqlCuuP+mukFxBfsPvXl/QEjK06rm
         I+0Qp8WGDB6olm8xTb9419DDBkLSImaOzjmQ0EYpS35nI2GoEmLIloBjjgykedMKqT2X
         NQ5XBdGuM+ZKhO3xTENF5KfY5p47WRSg3athwG0+eesNpUqOorsFpeu2UJkYwfqX3Tx/
         +eWHw47p87ydgVSW12P/mmCG886/ddscMNyJ6zTbWMNTwUSn7xgxmuQqAFX483GflYiZ
         R7OZP7JHVUb70+y8uffcPv/iXoPL22C8PI9OxP25XW4a50DH34fORiX+yH3jHAl+AO2i
         2hQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rWojyGXt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b2703e8988si1460495137.272.2024.12.16.06.02.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2024 06:02:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rWojyGXt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tNBfM-0004zO-2x; Mon, 16 Dec 2024 09:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tNBfJ-0004yn-1T
 for qemu-arm@nongnu.org; Mon, 16 Dec 2024 09:01:41 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tNBfF-0006Mj-Rt
 for qemu-arm@nongnu.org; Mon, 16 Dec 2024 09:01:39 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-6ef81222be7so38313277b3.3
 for <qemu-arm@nongnu.org>; Mon, 16 Dec 2024 06:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734357696; x=1734962496; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=utJvzy3zZQcbbkMPAN++kwF5ocQoRVsyPTFt71LWUTw=;
 b=rWojyGXtDcAhKFOcdtsYWx0ctdJ2sVDSSj39awzeY91RhQgkjyjyC8ZEUfgEWwmTCJ
 Dtn9ZIne/Q+dehwlhaCbw+BJSwAExq0VCD+0xF7oe2PzHcV+PuEbjx/qO/yByZY0ldiR
 PYTKrAf+Y3V/6Q3Z59w6qCEmeQvvq+DqKcH89JoQDiXjbQhvUmpTfmhw570pK8UguLmT
 EZmpcnwOoVobExwwKSMbCKqq2fLwIgQhU3nl2eXAo+HjUeE87XgoauFEoNWTkR/skUPT
 xtvenI677gY+yF4BNEAJYPv2g+H96r4g+tMTI4joLZgpcbeJzAajU2hM4VxOs9g4lrtk
 qNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734357696; x=1734962496;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=utJvzy3zZQcbbkMPAN++kwF5ocQoRVsyPTFt71LWUTw=;
 b=iQeWs8nY4isrXbRR4zhnjPIg5Z24IZDzRL9glzn6oM/D+zEGI25fnAbt6QdDFFNVeS
 mLTPTjmaXUz/4XIZhbVijAya/JUNHHwRDKP9eWbS8LfTE5jJiXy+MmwKSTKgtiQik9ML
 oUTORsy5OCqVXrOYYns2lUmNphnbgyJQmF/88iBwPY4EXPmmlAN8QxylJSdme5ZY5ytw
 w8AFBQfbdXK+oEx8bGWWAFUvN1ux5wgieJOJoY4NkiRaIzGqTWChMRLRcwytFFzgSTNR
 0D1w2K/K48ryG29+oUsbwc6mH9080IsiZEn/6+oWGUz5IX9AF5wRGcdNZSuyWWjvskK6
 Wbuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo0IHxP6DGEN9RAtroHPsta2Mv8L7bZKKSmtkBIfiKaMfy7mMk15vmebTmnIZlhNsWFYqr7L2xDg==@nongnu.org
X-Gm-Message-State: AOJu0Yx/qwVgREMBJ9gwhp7szPEWSRs7mEOtuJEbMALzJ6WJEysd1xSE
 dZZL3O/9oxJ7gGXHVoKiKc/+gkndACer1Yhq++kA1aUADolumdbeMLi2THZl5Ulln59broRW31Y
 VlxNkWVg0ThNxBCVoFXP1imO+WnPBz9Sxi7dDNw==
X-Gm-Gg: ASbGncsila/eDRywZn4kCvhM3mCYQIY9Y4/bM3V2mq5WXVPaNRYIUlgQCdRdGlrf/0I
 0Qkv13lgcK+6RWuJb4lepmcD6mLpnqZBkKWIACNE=
X-Received: by 2002:a05:690c:6c07:b0:6ef:6a91:4971 with SMTP id
 00721157ae682-6f279ba6c8cmr108983837b3.36.1734357696075; Mon, 16 Dec 2024
 06:01:36 -0800 (PST)
MIME-Version: 1.0
References: <20241206031224.78525-1-richard.henderson@linaro.org>
In-Reply-To: <20241206031224.78525-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Dec 2024 14:01:23 +0000
Message-ID: <CAFEAcA8-P=cmov6FNP1uhD3YRpZk8BB0tdrS_yx-5L18SX5y4g@mail.gmail.com>
Subject: Re: [PATCH 0/9] target/arm: Helper type cleanups
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kMFd6EwD67WP

On Fri, 6 Dec 2024 at 03:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add macros such that "fpst" can be used with DEF_HELPER to
> indicate float_status* instead of "ptr" for void*.
> In addition, fix a few uses of "ptr" that should be "env".
>
> r~
>
> Richard Henderson (9):
>   target/arm: Introduce fpst alias for helper.h
>   target/arm: Convert vfp_helper.c to fpst alias
>   target/arm: Convert helper-a64.c to fpst alias
>   target/arm: Convert vec_helper.c to fpst alias
>   target/arm: Convert neon_helper.c to fpst alias
>   target/arm: Convert sve_helper.c to fpst alias
>   target/arm: Convert sme_helper.c to fpst alias
>   target/arm: Convert vec_helper.c to use env alias
>   target/arm: Convert neon_helper.c to use env alias

I see that commit a9af119f3d to put the fpst alias into
helper-head.h.inc is already upstream, superseding patch
1 from this series, so I've queued the remaining patches
2..9 to target-arm.next.

thanks
-- PMM
