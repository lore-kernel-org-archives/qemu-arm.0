Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1657141lfu;
        Thu, 28 Apr 2022 04:33:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh3mEB0gBsQP5TMUUR3mZ51k+6S4wSHHWOfuMSMWnTbWo/DuEQs+ILSMMr3qASiBOsNSCi
X-Received: by 2002:ac8:7f91:0:b0:2f1:f9ce:d21b with SMTP id z17-20020ac87f91000000b002f1f9ced21bmr22389264qtj.399.1651145582554;
        Thu, 28 Apr 2022 04:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651145582; cv=none;
        d=google.com; s=arc-20160816;
        b=h0brcOsX7tdiKtC54L2MrSFMOAhnibfDp7hQoPXuRTBhS0j3QgrH17oVmkYcIcdfi8
         UhGxrLGhyzOgRPiOsDtAwxO34VrwZQ7u7tHs2WV6gIjD7b5NX4gy/hYCk4th9OJugJYz
         UxG/dzs756J6OF2VpTO+RfAggq8pYjYtoZeMvtEl0p9UTdp6bVb5plkk/eesbocgtxVH
         +62SQ2egbpZqg+0S/efpiJSkbqyRwMFDmvz90hYL0u+OEUwTAr6SqhXCrMh+66UXqUJ3
         z50bAz37kFDS5k5ZS85BVLRlK7Of7pdzIPeicLTdqoFXzDUs5EEeyRCoPXno1CLX131m
         BqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ftcG1UMoPISvDyEvmfyNuVQlesGvyIR/ez35ybPwW3U=;
        b=rQ1ENAFu/bFIQE38DsEmH3AHwzuLc2okmhJOQsPOKJ0oO9UBLV/4+U4mwp6jFGLpZ9
         5NzM+Vc2Qzo1HxiZFpa6Ztm102SDsgx+yBgCmoyr3z3Whh9pUvpazbFSrlLFlCfEUByY
         +Xz+TM5usO9usvuvdABLzUKVe2iDjJyhUES2ZDR3qupoQWAv85rzNes+8PRjboAsCgh8
         fHijo6Wk0tlE30b8JhUx+0tzBhOPwkUTmMUdvv8uLv+xR8iqtR7EWYtT7ulr6DgaM/5B
         +fNkcg8Ot4tXf+dJa7bVuORE4k4qBbGE7DuJ3LSzrZOkGwsf/UO7PreIf0Yln9G+q4ZV
         5yqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DnRr39ON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020ad45c42000000b0045646c6a4a9si1776431qva.99.2022.04.28.04.33.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 04:33:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DnRr39ON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk2OL-0005Vf-Rs
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 07:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1g1-0005sN-QG
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:47:15 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:34865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1g0-0001vm-6P
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:47:13 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2f7c57ee6feso48362937b3.2
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ftcG1UMoPISvDyEvmfyNuVQlesGvyIR/ez35ybPwW3U=;
 b=DnRr39ON84BqLxv+7MNQ0ZCixs+O016BVNllOAe3JzkW2FwfeHnefFtHpboiGlJrr3
 SLpEzNDpzbbNCfx9w16EQVGxjcFsG0TNUwmuBFFJUZwLElQhTQHAS038pFY6N4LT/7bs
 C0gtHosjPzH4soEhLuxYZSxKqZSZrF9MWKEF+IPjnwueRZ4ywSW4JnsSHA5eFaKAGuzl
 Q8cCTF9Mk//a6ykXhhoe/w3QQ8/nyhS4dr/U+Wit9yxN9lkKKQVqLPGr1gxMKejGAPkx
 ovk0LzChOro0wKuIB2OWWTGTTbPC264/lXXSFh7uKkPee/sPnYDioF6UbT9ovNXrL64s
 rAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ftcG1UMoPISvDyEvmfyNuVQlesGvyIR/ez35ybPwW3U=;
 b=5T07SQOaaUAAm4YKc3IHOfjYPMVsPXO1qep6WzpMLA2QJY92eNPGHmrX5bJ9OqC1pq
 OhlTR39FhPE+QCwAFqehveseEEiL1R232TGPmf1LgH91GKgRq8NtLqmEokKmaM5jPDET
 xUz5TjiUArOsvV3tObtIX1NatFmnHh//f+4oZg4itvXkHdq0xlKIFW3bX2miMsOFhKzM
 fDX8vKzfqwS7Uyn6HhTVInWmqjVY9T3MeQRnkfLrjtKdpZheXc9CXcXHvlDTAn4QGYnp
 p30U3uOdFvIZE6lsfSvvmONpcxmY3Sdxz6VJM+fJMD6ml5AHVLPqNhjnDFZIzANAhCN4
 1pKw==
X-Gm-Message-State: AOAM532UEDpcASmW7wTc3mOW3sx4C08pDts7i7bRMB4V1TMOPKHSZpbK
 9JnF0FhncsuGygMGSOJVEiQiSHk7uTee83KxHTjGVpN/xuY=
X-Received: by 2002:a81:6642:0:b0:2eb:c364:b8e1 with SMTP id
 a63-20020a816642000000b002ebc364b8e1mr31224025ywc.64.1651142830785; Thu, 28
 Apr 2022 03:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-43-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:46:59 +0100
Message-ID: <CAFEAcA-mNhGMo2VG0hqUgxO1-z=K6xh04H1KHJPdmPJQZ7h8fQ@mail.gmail.com>
Subject: Re: [PATCH 42/47] target/arm: Use tcg_constant in LD1, ST1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bY4MlQjMAUmn

On Tue, 26 Apr 2022 at 18:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
