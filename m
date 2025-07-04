Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1261999dyc;
        Fri, 4 Jul 2025 07:42:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWkKeFWQYzGYL1oQxPTotcMGvbeB6KzjdsUhlU5tkjkqYGzS5N2rVIbaMMm0z5NDvO+Hd0FC1pAyTjc3A==@linaro.org
X-Google-Smtp-Source: AGHT+IG2kYDezgsRBASnzq/NRHpJGuenSialCUZZEySBCMPCYBAqk9aKgOhELKFGqBybq2UI9att
X-Received: by 2002:a05:622a:a95b:b0:4a9:72e8:9346 with SMTP id d75a77b69052e-4a9a078758amr16485561cf.41.1751640160884;
        Fri, 04 Jul 2025 07:42:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640160; cv=none;
        d=google.com; s=arc-20240605;
        b=DnxnHVDDPUPBE4LD9BdDg9yceQxpTlCBr8sQQybRHSAYjwsGNmUSgx70sCa4a4vLnV
         kv0+YI/ldIjdYrJJd/FHl1CGAFj798tjB8zHvxC7nYwB67rWfWzSsFw2RT9UVl4f0CBb
         pPx6YFeOzSIXvVKwt4z8BXLYEUbMzT6fleIsLaGN8FUPWjsvbyz1FV3uxFwpOJC4LWVf
         5SBn0EpDnQbUPqxC5GGmdWtQAIWg8EEye9nct8rEG2KsjG3QI4z6eEJGBdCR17jmzwm3
         2ZHfUByiWqrx73wv1JC0ZFskF6cBIELXzfxt9xfqmh5UnJJMZCXauxQufkdFouC2/dPn
         VO6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pz2qbzXz3RBUZr1h2ZLsOJYtjSHVglXojMEtSCas/tc=;
        fh=KGi6FkdjQYShbypeA95z+NDlOk1QRr838qwW+nhxR2A=;
        b=NfYQWq6riyh3ecTqXw1CMSFRLY241gENh0Fu0GjzCm6PG7IDOpsP9GuzaTbMfTTtBo
         K0yeDdtLVJS6yDlrAJ+VPP09k/NgJ2ch2kKWcWdCtj1HFHVwtQ9Nab83i9l0Bqgjs+ly
         kerrNCn6x1i+26/HAutQUqAZfQLReM9X2BCt8VWNc6V3iCV94oobnz5+/rZAbYTArE7z
         LggzAEfgDmMdqZoNU/Uy/nJZ8yqY4upUnyTYDj647eYdkvDY6pi46Fkq5Mai6c0EsuCk
         v4E4SIDMam2LIahJ6E7NaPQO1aOf6WtsxRbscmfwQaxCQx/5nW5YWA8iMMFYfxYfgkCo
         L/Pw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o3hCAVkl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a9949f63bbsi21109161cf.1.2025.07.04.07.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:42:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o3hCAVkl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhQN-0004FO-Un; Fri, 04 Jul 2025 10:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXhLs-00042V-2m
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:22 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXhLn-0007x4-Vo
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:18 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e85e06a7f63so873031276.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639113; x=1752243913; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pz2qbzXz3RBUZr1h2ZLsOJYtjSHVglXojMEtSCas/tc=;
 b=o3hCAVklDW4ZZnaXqazhTHrSstqgXXe9hQ70DtJhtEavP63Js8J2decLhsIV1DXhaW
 DFzqduO0mZOB6bwe4ZpeZckR8gv1YvqbaRbqXLbnNhoLFz0pY6acT9LkWmiJ98zUTnM0
 bwUqfigDLskpMSUIm4G8M4hUfS5ZmLC4wLu2+RVqJNLDCTqpwL6Mmg09bRP344gaRCxI
 /ZVAzRx9UZgRIkfHCSz6PPNkVTaWtYNbwQu3aDjc4PIT/bpcXbg9ouTnhceFbZvcGy1E
 bJt4up3Wj1AKrWW8e3mbhlK/f0RGqEOnWcwtU06P0bfvz1HZeVq7n7PYHZUtLJdRBH0M
 N+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639113; x=1752243913;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pz2qbzXz3RBUZr1h2ZLsOJYtjSHVglXojMEtSCas/tc=;
 b=c+V8G0nYXl0ex2rSBT2srTrDufapM8EQSUTPJjyBYiDVywuf9YlPgepD/2CTFTWJMb
 1GQ3a+Geix/dFmMq0woUYtXb1xnqzu5DB08QNcQJGn+D3envEPDv9u/Ctxqdf4pMKxPd
 OICdoBE6rfEBQPO418vQVLTovAy+MpFmI1ik6iGasBbE8UR49iP1MbQfalQjr5NQiHYp
 J56sFx+7zZVXTj1poS6qFYav11hxsP57SUrd5VuUZE3e9cZas4QWAANnue2YmJn6Gqk2
 Efo/hUwh80yoA0gCnRIAMhDVzpQ40Lshju87kHNTYNhFDHa8ZEwXfAIoY3FZvcDmoUCg
 OKvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiKVACNW+rYfw1KJGkJVgXnPa/OXbCXvbhZ08/fWQxffsLhfIlOdTJifGIyGMIwsk9Ld98kbBnnQ==@nongnu.org
X-Gm-Message-State: AOJu0YzCq2t69A6A4LeNxLeg8r5z/nOuK5YbZ/t2Acvb8n5JNsxw85+z
 +hjz/yZXYt47/TGQYGB9kVtDY7ju7E2JCOS5YEMKId+8SJyXb7cHnW/xbA+zM6wiKfsahdTDVYs
 7KtVFFiss/pICbwv1GMKpFNetOhnRVBTuu4EhPjoYIg==
X-Gm-Gg: ASbGnctiODRJytgE4Lp0Hek2yEzpPflCklzM5jpmNf1GDgkjAqmgwUlqoKXqswZB6HI
 ailSSmcRW4ZnZIclCGWK0c8mqzR47npiU8J+d70Vw/kZ8D0eMy4WNDSsZnkYgnAn42mtPC6FgEz
 /z2pSIXfALFyVvHsK4daaQF4ZB254lyZmO+FgDgmFcw+XU
X-Received: by 2002:a05:690c:b84:b0:70f:84c8:3105 with SMTP id
 00721157ae682-71668d73139mr37409777b3.37.1751639113268; Fri, 04 Jul 2025
 07:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
 <20250704142112.1018902-10-richard.henderson@linaro.org>
In-Reply-To: <20250704142112.1018902-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 15:24:59 +0100
X-Gm-Features: Ac12FXxf6R7UWgQa9JQBAJsxtTd--2vaJRu5LT6qyxXkRUiSZ3o571m3SwOWq-o
Message-ID: <CAFEAcA-J7whgL_Y1GW3uULdBAVZw0P1M144BYB7RC=mqAcX3bA@mail.gmail.com>
Subject: Re: [PATCH v4 009/108] target/arm: Fix bfdotadd_ebf vs nan selection
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
X-TUID: no0xfg91eq2x

On Fri, 4 Jul 2025 at 15:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Implement FPProcessNaNs4 within bfdotadd_ebf, rather than
> simply letting NaNs propagate through the function.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 0e1850182a1 ("target/arm: Implement FPCR.EBF=1 semantics for bfdotadd()")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/vec_helper.c | 75 ++++++++++++++++++++++++++-----------
>  1 file changed, 53 insertions(+), 22 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
