Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp410827njb;
        Thu, 5 Dec 2024 12:37:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUbZJE+uctldX4i3U7uCV9YdP5FdeqpFPe7sHfuyaUsK2GxQbkmbz1H7aNS0NuPJFkRoau4DNScsrIBYA==@linaro.org
X-Google-Smtp-Source: AGHT+IEAjOrSapOvHuewhKRdarE2j7FDWK2NxpOLXVck+jP7Y6i0WomZY5uJdRq8dmdqg830zwhN
X-Received: by 2002:a05:620a:3915:b0:7b1:45be:2e8e with SMTP id af79cd13be357-7b6bcadf8c2mr111568685a.17.1733431073813;
        Thu, 05 Dec 2024 12:37:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733431073; cv=none;
        d=google.com; s=arc-20240605;
        b=hcjcpWpmvCbRV8H+O8goL9hNYYCNbPP1O46h9crjK7IiojL+P47NolATD0QEMble6J
         ZVwrbsu+PSmBULYqQQ7qJ1Y++PQhr0/01FmhpAudz9y/Uxpk0f+CUQ8w4Mt4HnZUKD5s
         yvZ8ZLzfWT8ap7Vif2uPV2vdDAZoQ6C5yOathftZkIdRIYJKj6yx5p3QXYnSX6s/lCDN
         NHLf4iT+Qu0sF+rTjaa89YgVESXaqUTjybTNPR9FZL4FhlVEHhvjhI3j4QJYvHahLzI8
         bhZKAGSsOamkxv7zOjS9kieeIjprinKML/cNAZ5EpuM38ZMVLozArAEjvcrItv+onWzT
         30XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OGm8EqEb1JifMuwTcEGrtstI8nwT9JKzSTAuJg9GFbw=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=SqMcmRwniF+GTBTeK9uSH1Flgo90wbNlvvcS8wlBPLklkBQpKKSNonG21vDJ2/fdHJ
         N5PmBna2F22VPvuf9u+cPIET9k4GZIIG0gNXz94S+CJoYEajiIAniVmVhdd2pkGtrRzf
         uIHTKbHdKxVmRwLIm+hFWnJwK0Vw4yygECcX5qqn2QacmeziF9cKykjgUbaiLQj796mj
         HnLwlXe+aRcmoUc8f+3vDzvPZxqmvN6O6orOkZ733SmFrZ+b4Xa2b2jbSzAkNO9mhaB4
         yTMxqbkfFLGApEOUnK+z91tTf76IeKygZlyOD3pCo2uyBqG3dl0HYqTP0Bq5TVXWIbBl
         fGsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l2TDYBoO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a853d9si254451485a.336.2024.12.05.12.37.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 12:37:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l2TDYBoO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJIbc-0003H6-TJ; Thu, 05 Dec 2024 15:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJIbb-0003Dj-3h
 for qemu-devel@nongnu.org; Thu, 05 Dec 2024 15:37:47 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJIbZ-0005IR-PZ
 for qemu-devel@nongnu.org; Thu, 05 Dec 2024 15:37:46 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d0cfb9fecaso2094144a12.2
 for <qemu-devel@nongnu.org>; Thu, 05 Dec 2024 12:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733431064; x=1734035864; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OGm8EqEb1JifMuwTcEGrtstI8nwT9JKzSTAuJg9GFbw=;
 b=l2TDYBoOVTend+Vzl59qCvv0HlAkpX5JllyMhiYd4TAdcENTiYNfTehcYgGhV4jsN2
 t1sgT985jN8wg/Tk7iILrCzJeCzZ5BuP8fRTJoFiuJ89haIK2bjwBgN4sfcBPlEaPgXy
 WS9nF2YAFgYpwi9ppJeTk8fqsCL1Q8Oos3j9+3hFuMLWcPhznTRX5g8YAL3fQViOxN5s
 Hi2FmuSrTbX1ekquVjmfbe+tB7Eglt7SCqQS7r/3jrr2HtzgGgxVl9pvpYJUIIkK2dTX
 LbsceROou6VH5zX6VkoZcYbt2dUaqFVeUh1/K5N06CPloconU390nSPaJtwaeSFRShfx
 nkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733431064; x=1734035864;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OGm8EqEb1JifMuwTcEGrtstI8nwT9JKzSTAuJg9GFbw=;
 b=Sv7PHl9VnKGxLsIor75eBSb9IajXafP/gtWmW5dd2MZtrvZzFuRGVvplctkCt98U2L
 4qvEdRzuRlewc2Y70Pk08QjjhFxAYJAugXcHNvOQWOw2TGUOngariRc3Fs3/P3W3/RQ7
 J9KabrqmKDig7xaYcgpnvYvQ787EnDhqxR5U8uOicM19Fd+DC6cubsHT38Ngh8F8uyDI
 /X5XWYS3KtlZF61BEJG6eRbr3RP+Gz42/sV8g+3on76cPxiHfBJpz5fMmo6kzxaTHJe6
 YFxmCi769ib1JpJt+1KPgr9b3kFGmUDUTCV9KZtB/svNmOlvFEML7wqy4abzpJRo/PCf
 0DTg==
X-Gm-Message-State: AOJu0YyhTgzDwK7DlZQJ1SW4ZvvwRPISznJRE10TqLGNcG1CFQ+oV0f/
 XGP+OZozkyWYqAOl/XyDrtursZffAbuumXgfyVCQGzoQNcEA+3XaQh+VPq4oByHdrMbfkvpZgda
 W59OvK/0p1A06vKxQXUA7LiyEwU3T9KAsJV4t5w==
X-Gm-Gg: ASbGncuILJyXn4SuzmxJkVgVw/e/WEo32rmd2/3HFhPKqaW7sRYZlqVlOrDGhWbiJmR
 Ug5rkteeYrfKWcDvmrvAwoOQypM6kzWivzZjg
X-Received: by 2002:a05:6402:354c:b0:5cf:d078:c9dc with SMTP id
 4fb4d7f45d1cf-5d3be763173mr388614a12.22.1733431064208; Thu, 05 Dec 2024
 12:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-21-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 20:37:32 +0000
Message-ID: <CAFEAcA8c+TrdUPa_FYJjzCj5CyQY3m2aTMq-gSBUO0++6-rfDQ@mail.gmail.com>
Subject: Re: [PATCH 20/67] target/arm: Introduce fp_access_check_scalar_hsd
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EoI9/d0qbxQ6

On Sun, 1 Dec 2024 at 15:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Provide a simple way to check for float64, float32,
> and float16 support, as well as the fpu enabled.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
