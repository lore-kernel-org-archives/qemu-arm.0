Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1224566njc;
        Mon, 25 Nov 2024 03:58:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUTN490CEffDbZ21tbB4iQ9ey7PxIoRtXLkSCwmJ1Dal3cKgpT/pfXV3dwHmyzJcwaL3kXJ1jbMjmGbxw==@linaro.org
X-Google-Smtp-Source: AGHT+IGyF5cAPkAZg9hAlQwigXrQ1/f8/xv9TolE+eRC5CNrVol2tG6+zq46LPOkI9CMJeC/T5Cr
X-Received: by 2002:a05:6214:2243:b0:6d4:1425:6d2d with SMTP id 6a1803df08f44-6d451362fafmr259643406d6.43.1732535919587;
        Mon, 25 Nov 2024 03:58:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732535919; cv=none;
        d=google.com; s=arc-20240605;
        b=PcZkvW8p09P4JVklzNjmpnXtX5p6pgydjDhutmBNEbGSes/hQaJZafZE2o82GQ1Pn/
         GEEHNe+ExRxCaURj6wxH8oUK++lQJeYaW655TkZTzjS6ThY/WsELz1rpHv+4w44s/ULB
         pJT4cj8ZJ9+QmS4f6lVgKWpjR4cswRW64PUxz1gNP12rGAKnWLkr6IzwawAr5fjxb4iJ
         e0kKGlkdB7ATVtgKZ5E/7drKw/4pi1HCiBqKz5rpI9wZq07HoFTqeyX2ldBiDgdymnMq
         B+wIj71//lgjQPt7eha7w0NDIIgnjVYs3urTPDHPBJ92Q4faQuiKzb92h0g0qPAOI+5o
         nNhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HktPphgw9wf/x2lyqTJ/BfyoWoO9q6nqOuABLrI8JZQ=;
        fh=z5oSVXU4erAcdMYc3nq7EGIE4K3cnaxmDOhrEBky/tQ=;
        b=LLgzn3oNZ6Q6JoGn5GMVJ4zoEXiKGUyBEL3mT88fNkjTWnzc15FmgBz1sjy28jsVfD
         PGwIvnWHvfSlDSrlSP+xLvbtNULz5eYXWK8Mc94Jh4snmC3OCjyZdZu0XfKN96zlF9Ii
         mhOB6+iz8KLHHuNgEk7DrE+SNTSirHt5RvWqGL5Q48YG2hvW5CRqhnzoQa0WXkvHbZn/
         bAOo99c6ZB6jIU5tR869LvEhjEPWIXC69MOORLtIU4udnunmM4+RI7jUAyz02TZx1Poc
         A3MU8uBNmD12zzL5gCujrY1phtKBNjOjxkdHO1H1Bo+SY7mhwABy9e0acJnHuSKAjMne
         FA7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vSJ2dYIH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451b8c3d6si90771016d6.544.2024.11.25.03.58.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2024 03:58:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vSJ2dYIH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tFXjQ-0004sx-T6; Mon, 25 Nov 2024 06:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tFXjO-0004sU-GY
 for qemu-devel@nongnu.org; Mon, 25 Nov 2024 06:58:18 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tFXjN-0007Au-0q
 for qemu-devel@nongnu.org; Mon, 25 Nov 2024 06:58:18 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f804233so5218593a12.2
 for <qemu-devel@nongnu.org>; Mon, 25 Nov 2024 03:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732535895; x=1733140695; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HktPphgw9wf/x2lyqTJ/BfyoWoO9q6nqOuABLrI8JZQ=;
 b=vSJ2dYIHz5gFU5/kXvN3qjn+oZvc8mVJZK6wWY+VQr5H150xABCFgmd6vL4utK6GtC
 PmpoxsEa1vdtnEph5perWD9/OdDbC3T8kRJK67MsTc6lUT9RLql+4SUWW+eTIwCoeoGy
 Xz8e7g9mMHLDNamif75gJM8wcIG1oGQGRUXco5vCKDJQqgPEAfFnldUoawejpzncKxST
 zZinEhGFteCJiRFVDYvNs6P48V8raLuuo9tyu608p54Gdn6xqgeA/3oAr5VsaTdk5guI
 Etnyw9BjXni65GXOYSnsVltQPqhms0Q+jv2YNzK+tNE0X3wBXNZa7epm1hjHyudwI4Y/
 gQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732535895; x=1733140695;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HktPphgw9wf/x2lyqTJ/BfyoWoO9q6nqOuABLrI8JZQ=;
 b=qiPsVL5spycLuxCBgUaKw+Z2TAWlPz+/J9rTPqvs+o9g7aHUXno+ReOO8a5X5XmDnw
 9XP3m+K0xeAdF+nqTHqivNCwDHqfTVZavlTMTBIoqCsFYkslyKBUAxWvNgmZHRRJljZg
 X94hT0roPyj4kChou4vz7iOkHB4JOtXQ5mizthshc1xNmEvlok4U/p5SwYOEtqi7Wdcy
 6JSf8iLsbo5ZJZwVZf2jCOMGYrANASC76Bvw7f9adaKQi8T3NY46aVK4U6qhZLgkuFY/
 B8MoknNm+c26gExxh5yoCn3WfLxhbIaSb4Q+EgR3i7L8YJXmsHDC3Q1zq5MrMqaM3EvH
 gmPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt0hC6SlAbB4nIO5BOCcDKPMYeH15URuXIr6xRfCnwo84Q3haGlZL9YCvupzqw6HndQZ0ehNkK8v6B@nongnu.org
X-Gm-Message-State: AOJu0Yy1Un6MzbPJAyOx2jm0bZE8zFgtrZIhH5wXck/U0CJF+cXDayeX
 lmUwnZrTy7jlLLXozUxs03qKMuORpXrYCB/7HaqQ7rbp4eyVPanPDkK3usf5Ln+1n1WrlNmXuoe
 bkEYh124Hn1gonlJecetTbBBLlLg1g/gvN3Cmvw==
X-Gm-Gg: ASbGncsiHiHOqfiOoyfZZSIpCUosiUiXKRCDJ/RVSSbX4ldXQjwL37KXnmERXHZhsSU
 UQVkmx62qtNELAahwpy8y30NxPeRP3wPH
X-Received: by 2002:a05:6402:50d4:b0:5cf:dfaf:d60e with SMTP id
 4fb4d7f45d1cf-5d020625962mr10886567a12.14.1732535895288; Mon, 25 Nov 2024
 03:58:15 -0800 (PST)
MIME-Version: 1.0
References: <20241121171602.3273252-1-mjt@tls.msk.ru>
In-Reply-To: <20241121171602.3273252-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Nov 2024 11:58:04 +0000
Message-ID: <CAFEAcA_ywbza7rF_DcpsaiJbokOXPUn_s84VrvGKiTmwrDEMrA@mail.gmail.com>
Subject: Re: [PATCH] target/arm/tcg/cpu32.c: swap ATCM and BTCM register names
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: WMFRGJHFEdVL

On Thu, 21 Nov 2024 at 17:16, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> According to Cortex-R5 r1p2 manual, register with opcode2=0 is
> BTCM and with opcode2=1 is ATCM, - exactly the opposite from how
> qemu labels them.  Just swap the labels to avoid confusion, -
> both registers are implemented as always-zero.
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  target/arm/tcg/cpu32.c | 4 ++--



Applied to target-arm.next, thanks.

-- PMM
