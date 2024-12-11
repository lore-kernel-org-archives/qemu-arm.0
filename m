Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4172695njb;
        Wed, 11 Dec 2024 08:10:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWNPZaCmQ0nwICntcs8M97CNjaf2kNBVmcffVyV2DzdO3GrLhON6lfnCwHmFsiu5EoazS+9zLM4P9ST6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IE+VKrSV0OnRqeKahhcHGlbfXVRuqCqFFUTPOh28lZMoNKin53CYC7Zp8p2szmpQAq82cUx
X-Received: by 2002:a05:620a:31a6:b0:7b6:da21:751c with SMTP id af79cd13be357-7b6eb41fd98mr615876885a.11.1733933434597;
        Wed, 11 Dec 2024 08:10:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733933434; cv=none;
        d=google.com; s=arc-20240605;
        b=IxiroaurCwks6xI31AhbjyZqnZeeta7Pe9LokF78SbrN+cX4Vc7Rfv8sffFns7pGdQ
         FN++mYar5vBwcz9wPoIZQM03Y6wNhC+aaDWUBdhW0tByKu7cpMhx1yQRbo2DbhfimhV6
         gFew5MA42LX+cfvC2xk5/ZAi8BWdH8khXv52Jhh6tz+bL5X1m3wZTHdCkyeKCQeoQdAQ
         uE6/Po3F83BxsoftXn+8oDCQ7BRxquOXpFPbnCPbGdWjQoZChb+n+4GTPyCsxmcN/SMM
         GEob6a2WzDAFfRwRCZvSghsI+CjYXaVKKgjSKuJEs5qfIn9BB4ytUisEelT0GgPMTZeD
         WHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8biidVMmOxgF97yUIesnJzNMpRHgvFxmy9ix4gxPD+g=;
        fh=f1zuOPLd0jOqPQDKcYjhaovgx0jLmXOBeITB3+ygQ+w=;
        b=CoTg5bXisXikAxrBhSYFutU1nt66bA/0/vJAUuIBqckKZEvT17fgA673+a7ar2ZAFI
         pGT8oEgf1Ywu7TiLiHL/bwp3kxQgXk2BCnCVuG6ra7ujXf9BUJ3LfMFSkhjwVT06te4o
         IXj2sOZATjdRqB8v8MdWQEgBW0J9TSmKkuCw1+TFLar9kk/Jj1wUfJHPz640YEOzLGV/
         PW+SkF82b7RE0x5OqpAf9RmjwClAPpGwJbeu+jVpkIQnl0qT2shwF6bBRZ9VxJaQLEYt
         vI3ssQCp8vDO2Ptp5GEbBgxKDm/abLAOtRCIQK3RFdDPMKboWlC97aQHzID5gAqTt0s5
         2tAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yVCcGv6R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-85c2be6dee5si3735651241.205.2024.12.11.08.10.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:10:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yVCcGv6R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPI9-0005Z2-Fz; Wed, 11 Dec 2024 11:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLPI5-0005XQ-EN
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:10:21 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLPI2-0005y2-SW
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:10:21 -0500
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e2bd7d8aaf8so5267045276.3
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733933417; x=1734538217; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8biidVMmOxgF97yUIesnJzNMpRHgvFxmy9ix4gxPD+g=;
 b=yVCcGv6RQzWg0sLpeIVlj+en9uyIEXd49OuHYQf63JhzYDXboE9c4ZQhTM9SYur/ob
 4v3FsntV8j6LD/+FcHr4Dj7yqGMLgBonl/IRddprsHdshL4TCpMc0VNiSE0wCpRi9jkz
 MKstMxnqh/p6EPL5rmepdFjXakTS6vtXMXXJJEYPMWepj4TSzPENNvu7h6ZP4qSWSFzd
 TtLErplm00mznnZFB/eS8ZxPitsqaFE0wO0F8fNpJb3HDlTRNPAWKOlW2qNNGgcvFlUm
 8jmgj9C92fyh0W6TCwrcWfDDGmn5bxArWB3Jd9vE2skAPYQQdY/4xfp7XHZHxPVs+fs7
 vMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733933417; x=1734538217;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8biidVMmOxgF97yUIesnJzNMpRHgvFxmy9ix4gxPD+g=;
 b=F9VGSitbWCAEKpm22QyWqNbbsF9HwAiNjFzcGSWFud3sYfYrSWku35tDMoOKUKwb4Y
 xnboQItSEMO+9mVFnvDQQ9HKzAmJI5FzDBEF4yQGjtg4oaaAkyqPsll+4dsCeaDfxkx4
 1/0v3Z30mwgE3djcU+tKtPpH/rBWw61taeIy/9yTL/TWMmJPaCbhmAPSEh+ukqjb7Add
 Hq6u/6WKyHXVt6MxVlDK064n30/ysGksmsPLx2bfYiEUWXvpZf0zorg86izay3aieLHs
 NpVtYl7enMtLUOhDoIDQa8C0QTSh+jmi7J1D+VQMGG2w7ffmHM9Jq/sBVIYHiCulB2Q0
 gVUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWelfALG94BaLh8IRsuYTOJid+EArgC82e11ZLsAor5J0yemR1m/bV7p7QzRdu8t8nur39XRF1DqA==@nongnu.org
X-Gm-Message-State: AOJu0Yxm0F4nZNkDrzSY1oXY2yZ4wqoJBcsGh9XyMn/cN3uXoLVmwN7P
 0Kgwbmr8XJMGohPIkjB+V19WnpA05YOzmFRGPlrriBSAQlpEIZnBEWjbv093v5VBBQuH1ceHE7r
 QS8omI8T30xNMVW59EwG+VS9Oob5HdcSh4l9x4Q==
X-Gm-Gg: ASbGncuBhJWIZm5b6EQgOitG2wbuGkM/GOpNRKL+eR+MZfKD1gbP18uBrVJB4lpPRrI
 /aGLjlBwFBLVE6B/FFBjpnrQpFnXTF5c9jBYa
X-Received: by 2002:a05:6902:120c:b0:e39:8e5e:494d with SMTP id
 3f1490d57ef6-e3c8e42da05mr3125361276.3.1733933417596; Wed, 11 Dec 2024
 08:10:17 -0800 (PST)
MIME-Version: 1.0
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
 <20241210161733.1830573-68-richard.henderson@linaro.org>
In-Reply-To: <20241210161733.1830573-68-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Dec 2024 16:10:06 +0000
Message-ID: <CAFEAcA9e7qEGE0k3yCR=gFfK836hKfGtjoXYQeLNStToeRBOXQ@mail.gmail.com>
Subject: Re: [PATCH v2 67/69] target/arm: Introduce gen_gvec_urecpe,
 gen_gvec_ursqrte
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NeTOh3EnM+4Q

On Tue, 10 Dec 2024 at 16:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h             |  3 +++
>  target/arm/tcg/translate.h      |  5 +++++
>  target/arm/tcg/gengvec.c        | 16 ++++++++++++++++
>  target/arm/tcg/translate-neon.c |  4 ++--
>  target/arm/tcg/vec_helper.c     | 22 ++++++++++++++++++++++
>  5 files changed, 48 insertions(+), 2 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
