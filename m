Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03408C88E75
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 13:25:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6T9h-0007RB-5P; Tue, 15 Sep 2026 09:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6T9Z-0007Q3-ON
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 09:24:54 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6T9Y-0001WM-DV
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 09:24:53 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 956f58d0204a3-66e4ab19127so3327586d50.1
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 06:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789478691; cv=none;
 d=google.com; s=arc-20260327;
 b=sXViqcYD8IWxgVjY0de5dUpy35y5lnUaDFWUCWvOoRzks23c3XScw8/JhRtj5oZMnu
 yf1LdMD94jwv7+Y+jSrPyJnfUsKKxYMgU+NJcLH7eja7vATArWu7PF+wMwRhpU1Fk8Ii
 +VnoxF62mwntE/GbUMKxgbgcXomiWtiLMbkcqCBIzd6wHYJxqWKGt8Ukp0/rVoCyOsi1
 CBBPiUf4iCG7RGhSHmxKh2/IvqLismnVWn50F4l6iYzn1Xa9XQmR1szyv7pAALM3tvHQ
 GruPQbxr3ZLDwqOVcVDHHxwrjot/CofvBkPEwy91/76Fz3pahK0zEYZ3U4KK/PtQ3xBI
 Nkjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=6+uIadRXMt1YyyZJrfNME7Jp4XW/MuXCFcCG/Lhvxos=;
 fh=w7mEhL7s8FgPzKqpVJAK8VVWqGpnKMnzi9yRG0dT5EM=;
 b=OAnUUWS6mUxZXdBJa3e+onaJpv9Fe/3id1Ns/faRgnmlrtQrWsOAc05FJpYBCRRBX6
 X/BQA3Qnm7yeDhuhqDhvNru9un2VPNO/X7tddA2mABqishMf1Ux02Rmd+E3ktbGFDGnN
 mWxdYT6ch8sHpPZQScrLd1JDNvH7qyY7jzsFxvr50T3X50ZmrR5rZ15moYbduMrauP9i
 hoKxnBcQBkbkkXr98l/HcNkj8nPgMgI0PUWd9rPpTopgi6ZJUeX1wNST1LoZ9kLReF09
 Qs7rw+3GbWKMDEBbgZOyHwt1qKIbRtnMb73/nBi0+a0x+K4qxwRVkDds+VLd5908dIq7
 ORfg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789478691; x=1790083491; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=6+uIadRXMt1YyyZJrfNME7Jp4XW/MuXCFcCG/Lhvxos=;
 b=IPQcqdBPmcyaixitxdh7xpWh+BcFrPUrlXcS96oUsrlfo6GwQ6tbOhLdTLRFx9mHL3
 XehDABcLwUPDaygeDjery5TTdzyBxtwTT2xbJENsPOFvPupaG9A6jX0gEmz7XsOWwm2q
 EKc+NpHX/jCB1MxaXl6E4ZJnz2p5BqnBryHGca3utTBMILl5L3FJh5vLIMU3+HW8Lj/T
 4hmkvNO4tuwUSW1jBqm30yzdiVJproTTdN9laEZJFzT31xqCy/k0qlZ6lM7w+Ds5TutU
 NSqb09hYch5F54U7je8kPx3v8bH5/EVImbdptgL0Z46iuRU+OrNLOvNgtK7u2hxLXxs/
 Bbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789478691; x=1790083491;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6+uIadRXMt1YyyZJrfNME7Jp4XW/MuXCFcCG/Lhvxos=;
 b=YqZLj8ZE/lsULKWmB6vcYkxn4zzoCF2BlFtZsSwe0wwE6Oi81/qIfdxUB8yCs0jIAl
 Eh1Lt9czN/Lo1SaXoqQEssVZeFQexIf+fmmITC5M6OySsFc/WSLlxyoyRn5LSDvbi3k3
 4cR6KrKLmDZUoVYN+lm5XY9rYiqSPyFFmjF/a/s/pgDL509I8gvUoy1WVlfWQn1IURxx
 FHUcc5yzYgktrjfbBU9Yse9VcQ1o9McLdRtEFsuwUqY7luEcNLdwUJwqs0i2w4RlKqLw
 M9WH/dpv2ZOCU6tVYTkaSTCU+/jYmkwX48QRU+HHUxKpnIy4sq/AuQTSqadYl2e2Gboy
 AxpA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzu/uhvdN+zewVQ8qQoDVoIhMBV86i/UkTmNE1TAk3tw4jIWEYpEmlGXSCAw5jiEJRXeBruRQl+pg==@nongnu.org
X-Gm-Message-State: AFuF++lHbBWkHsjBfZGGc4S96sN55YF8j8fjK5UcIiSTea/WfdksbdjG
 h6FWp/5LZzR9NG0ei285rx/DTou0Pc1A+dFhkSj8n92Fcrxn4X/sy1uLhZCVPWsqIKIz5z6OZcK
 eam8JKnRx/IkARnAYfPabJNGGtu1nj7xpLch0ylJRqJOd2O4opPNKfXI=
X-Gm-Gg: AYBFou2UqucgcisrzMx6+uNjNG61H7HHlx56YLWUuK4cfGlEV9Tdr7aZfzQeb4MCWfR
 qCeP58KQSYUuTzM9UtRuE4DOqUTQ9149w9s+LTo6ncJDl324nLGaDkNhda1+gXMrDXoBpxuLcKF
 eRoCWCnjdW7Zw6UikzgeCaOsIzbo1o4t0yXNieliwfo0M56pDTh4QkNqsFENq6wWzR7OGzYs99Z
 X2e0v9wGHrJNcG5NNObErdzwoHZNEhu+JLG80joLB2zZSDrUzB5tGgMsW8DPsKF+t009SBgEbtC
 ECj9HMucOzgsD4WwS0b+X5YQF8T3Zu5/aX/1pODavq/2QNytvoFwzS7E46cqPybw1BWvNu5G8tx
 30V4I9HAZC36pLQiUTt55YJ/a6d4P9OvGlm93Ra4=
X-Received: by 2002:a05:690e:4847:b0:671:3036:42d8 with SMTP id
 956f58d0204a3-6714e195eefmr2109528d50.45.1789478691139; Tue, 15 Sep 2026
 06:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260914192323.29250-1-gilles.grimaud@univ-lille.fr>
 <20260914192323.29250-2-gilles.grimaud@univ-lille.fr>
In-Reply-To: <20260914192323.29250-2-gilles.grimaud@univ-lille.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Sep 2026 14:24:39 +0100
X-Gm-Features: AcwNN1VZcTL8MUriRccmhp4MrsAftCIaOrq_UzFByKnLYUYJKKWYT10Jn36EyUQ
Message-ID: <CAFEAcA9R82YEX8qcz+CK7=ypSLZFadfrx+jWqMBnGGq6NYn5_Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/6] target/arm: enforce Armv6-M NVIC limits
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x10.google.com
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

On Mon, 14 Sept 2026 at 20:24, Gilles Grimaud
<gilles.grimaud@univ-lille.fr> wrote:
>
> Armv6-M supports no more than 32 external interrupts. Its ICTR and Active
> Bit Register locations are reserved, and Cortex-M0 implements two priority
> bits.
>
> Reject Armv6-M NVIC configurations with more than 32 external interrupts.
> Add a check-tcg test that verifies the reserved register behavior and
> priority masking on the microbit machine.
>
> Signed-off-by: Gilles Grimaud <gilles.grimaud@univ-lille.fr>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

