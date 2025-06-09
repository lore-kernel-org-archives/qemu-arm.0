Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1160620njc;
        Mon, 9 Jun 2025 07:32:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUEa7deHo+u6Z1IM1IIKqBp6vskfZGQ7AlzeaBXNP6XHy26JWKgkCShFKLE/4+mfDqo0sQWnJLe7soJFA==@linaro.org
X-Google-Smtp-Source: AGHT+IEW+HNZw6ZGVb8IUuh+ZtIgGhDPhdGWUMow/iirwKr9CEyzwvy/v+5kdZl8f0ibRfMdFPpx
X-Received: by 2002:a05:6214:4107:b0:6fa:9e00:d458 with SMTP id 6a1803df08f44-6fb08fe1a53mr217085696d6.45.1749479577244;
        Mon, 09 Jun 2025 07:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749479577; cv=none;
        d=google.com; s=arc-20240605;
        b=KmsbCVanUdFFPhKZnhSx3tdi88+B4A9QK5lbjjHXOcc3dwGGjtF+xfHaCMHwh7BZRY
         DLtnwpwuXeJL+ozwOqjLpQC0Tim4dQxhXgvXD34+RO3zo51bJrw9U0yjhN/6l2arg8MQ
         XLmGD0uRuV6jDDuTdRklTqCQi47yZ6/rDnipKToD1LViMbejp6kQ5zWNtM4XSLroBjB2
         0YzU/jt5hc9DqnnUypPOWJA0d/Wnk/RC5fYjvC7Y+i9bnaSVKZN/sMq7vMUWUEWrg9pK
         xcPe9dalkHTD0FgMXP0L1SeM9AEO88vG2ynmghMNmZv+HPSGtjlfakjSgxPMNF1klpVY
         oxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3rG5HcsB4hpidPPhVtVmmdnh1ZPkuyYuDe3/kjf3D8w=;
        fh=QpfOx5+JPmxxiCMjFieczaVWDopmMXwRBM1al/XnIbI=;
        b=ZboCyS4xIqy1gEx40pyrTLjx6CZvo22GOoltwT6Ex4OyASlo5WYA8iIwpns9idsV5W
         EndkJD6BOogUoGwv1k23kZ5Qdv5trSQW/3CuRS8LrOS9KBj4a5QvZ0To0I50NYy4TZw0
         9bs8cLzX9BGTpZ9B612FEHI+/CGK0IyfZxpz6iQkeAK4ACYE+KG5Cmp4xa0v2DKINSaY
         mbMUjjiVs8aC8niTkFIEI11RkoXkJCQ3LTJeU5l9bbAEhm2+IfGk/UITMZEKoMu4Y05l
         etdDOywMRWPY4SXfrxM5onRmk+9JtKgCv2MrPUPOXWf59MUGpnlsLBcXyQrwdFUaLJXX
         8y5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XzNByj3k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09ab08cfsi79560526d6.58.2025.06.09.07.32.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jun 2025 07:32:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XzNByj3k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOdY5-00013r-Ee; Mon, 09 Jun 2025 10:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uOdY4-00013E-1S
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 10:32:28 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uOdY2-00054u-3e
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 10:32:27 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-710f39f5cb9so31269567b3.3
 for <qemu-arm@nongnu.org>; Mon, 09 Jun 2025 07:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749479544; x=1750084344; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3rG5HcsB4hpidPPhVtVmmdnh1ZPkuyYuDe3/kjf3D8w=;
 b=XzNByj3kBlg98kky8zYly6Bikrlvb+E0n2ASnBReNKH2mmFgAdrDmHsyKmrriu+TQC
 1zFDwAtBxegM9TZNOq4SDOGYRWMunGtK4+K/LngHeTgD43OKW++Yhm4x5NZE82/NPYs8
 NvP66XnzVwutSdB+V7XK9tHuWKJhvnLxsjQ5NeJR2XCetF7CaSL9cr9W2nrLSeFj2Gma
 2aPhGxC9Uw8VK+ihdBVH33ogANu1JkKHP6V4O6iemulj8Hc3pnlGSphd/+uEbVx9AaSz
 xE6/C13D+aoD/5GOsJccMYsSM0Sj4a0nHm9ZRGE5ubZtO+yIFs8lqS+m8yJpzIEv8yo3
 CrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749479544; x=1750084344;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3rG5HcsB4hpidPPhVtVmmdnh1ZPkuyYuDe3/kjf3D8w=;
 b=ifVGY0OK7eZiCISH8SUeCk+JSNx3o2TZ/o5C1FuLgLFakh0+2ZCybiZmFqvT+ommfh
 k2kg0i/H+gBZc9SrOuqPA9DznFh7pCDWRWlVNctIoaiU+bDiiVKgZnJMHVBx3w1l31jG
 KfAo4cT5dLfSt9JxUoveTzPYYGpSIILCjzato6Hu4W3FnfYmImxA6EUsFNKevP60t1LH
 uqkP+YMEYkvRHFkvp9e5kdysy7drFD5Z9hy9A+9WEjO2n787YKMc/WtGycI9SfoGErBE
 FOL7ba0yXQN51MXtdxBxIRlYx7SzYr1ds6V5042UaUk06vUZ6gXPmSyTNxAPWnh4ubCH
 B8vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuHgJDTfYIZ9VkJzThilMJB4GwIr8KsOvksiVahh8+JPDay+5iqPrvTTw/UwkTEjLF9NMd6t4EZQ==@nongnu.org
X-Gm-Message-State: AOJu0YyEY6JFGsf7fYwrnbrdx2OJo/1MwswrJCc/iEE8OnaFMOb8C4Kd
 hGT/gobOqVu4UX3bhu5rDiQ/TjBhVwOqjHkRGIpVxfCS8oSQG59ohE1kWsW/LIObkmm0aip9DTa
 K5Uw36WCNZnyhLkP1/bL4+JTDDVrOW1Rud86cfAjpbA==
X-Gm-Gg: ASbGncu6tHRi8oCLr9aM0rOyMQ8Tf8B+HbV7j6tDDL+2+JnLIllHEf+pggeXDA1bU/c
 /ADVo6h01UHAXBrtJjutNSz0sl/tsyzgjHcnw9JNQW89Q7nyIkMKiIPbAOnBsohdsMsXeK65hfQ
 O9iwmQ0xl0ZGNPa+5hhOOVMXu17m3Yid6tCDLwdHKAiqr/
X-Received: by 2002:a05:690c:3685:b0:6f9:7a3c:1fe with SMTP id
 00721157ae682-710f776cc31mr177351737b3.23.1749479544111; Mon, 09 Jun 2025
 07:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250605022640.598308-1-taotang2025@gmail.com>
In-Reply-To: <20250605022640.598308-1-taotang2025@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jun 2025 15:32:12 +0100
X-Gm-Features: AX0GCFuMAXdGQ5vQ3w_Y8wVfZPOV4HIAcF6G11ihjE5nH6imX74MHr0kdzHydSM
Message-ID: <CAFEAcA-B2o+weobCK8F7TmynexmsJ_JC+Ccr4ELbPYkPJ34D8Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Fix incorrect reserved mask for SMMU CR0
 register
To: taotang2025@gmail.com
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
X-TUID: hMQCOTCSvnjB

On Thu, 5 Jun 2025 at 03:26, <taotang2025@gmail.com> wrote:
>
> From: Tao Tang <taotang2025@gmail.com>
>
> The current definition of the SMMU_CR0_RESERVED mask is incorrect.
> It mistakenly treats bit 10 (DPT_WALK_EN) as a reserved bit

This is because our implementation pre-dates the revision
of the SMMUv3 spec which adds the DPT and this DPT_WALK_EN bit.
So for us it is/was legitimately reserved. We use this constant
value to update SMMU_CR0ACK when the guest writes to SMMU_CR0,
so ideally we shouldn't mark bits as non-reserved unless we
actually implement the feature that they correspond to.

We don't get this right for VMW and ATSCHK, which are both
"RES0 unless the ID register indicates presence of some
feature" fields, but which we allow the guest to write to
(and cause updates to CR0ACK) anyway.

> while
> treating bit 9 (RES0) as an implemented bit.

This part is a bug; nice catch.

thanks
-- PMM
