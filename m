Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3424299lfh;
        Tue, 31 May 2022 05:41:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5exSmLt0eac97Cbd8zeOB26s/TYTCk1dlXNygLe7XuwvqFHMl31nA4upjSWMPuv0EkRV4
X-Received: by 2002:ad4:5ccf:0:b0:464:494c:9efa with SMTP id iu15-20020ad45ccf000000b00464494c9efamr9611546qvb.7.1654000895660;
        Tue, 31 May 2022 05:41:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654000895; cv=none;
        d=google.com; s=arc-20160816;
        b=tJpRK1eIllf675ETARB7Me0NrrOaffbIJP05/R91iVVG+guKcOxeKuVJtIM0es20Yo
         8MqXEnkhTgaOcdAm5/qwHs4g7VzDugRf8JjTOMveSLHY5nqP2vjpGTHVBTQLInuGIkj2
         Xiylf+Ar+Zjl3T9v89HBAGhGQl7b/S97ZZt3iPcbUiJ5bRU4jLrZR8/dDjrZCcFG1+QU
         29sMylGWhVRwgA7Qs8YypD5164zhOZ6dTjtWSj6X1IVVgWCnUo5gnjdnm0wUrxZbeLiB
         6BxXfERYFUBM6Icz6XFTiKvYDPw7XmSfzOriozK+M6K7mM4kCE1HhoGGP0ePTxsDUP0c
         +baw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NEf65WokzAk1VQ6lMdWEUUnrHXinmYkcRgsE39WLyKc=;
        b=DnN3Qf71Jg00xvcEPgteQVFOWGpm4Pv8vWw29U2vBvXfpYzi5Rh6ENOM2B7iab5fNc
         q/RhFdg+tgaXPsEpcQVkoxQN1mITVbHKDbKIucNfrbUa5PqhouHsWnTTbgRh+iuotNve
         d7DAl7roX2Yf70+be/fYD2+ZMjUvQkFsshHl+PdNwI3eJeojFD8HIJ56eEGH5P0OOpk8
         nBPZHFgFk8BM7X6vumHvX2+PGp0eCGrHxBshTYcDmV0dVoybnpaBBwdYOtQjytQcG7lh
         9PZ8rmmBeAq7SXxNb8UoECQxOe1xe8MNw2ekWEv1ZZhm3ABkqcG1iJLYEYg153GfEuw4
         ad2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PMVG1rtF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11-20020a05620a25cb00b006a34795105asi10929809qko.330.2022.05.31.05.41.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 05:41:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PMVG1rtF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw1Bn-0000WG-2i
	for alex.bennee@linaro.org; Tue, 31 May 2022 08:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw13z-0004KH-6A
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:33:31 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:45929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw13x-00077b-Oj
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:33:30 -0400
Received: by mail-yb1-xb33.google.com with SMTP id g4so9964926ybf.12
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NEf65WokzAk1VQ6lMdWEUUnrHXinmYkcRgsE39WLyKc=;
 b=PMVG1rtFhzngwICuvMhuh104JRj+ttO8W4UOUkeksbjd8t9Q3/5/0eyLHu8/SEEYp5
 BpME6VYAAsyfyKtgLC37vDUAUdg/uYqWK2pIhM2UAImeOkjwGIwZTFnY7vYxpHIV0oy+
 ckoB3a3p3y3HX1TMOMNK6f5Xe50k6aM/3/c04DjDHgQtYeLUK1Xwds1iVip/2CZnMbaQ
 nrJgq0UYCSeyKkXa8IN+/ZbaR4InBU+zUTh+yyaQptXJ2mRuJ191c9dfnuc4Yzp4qsDa
 U/gdO2jfjq8wpHYOrg8ec+v5NqLOLO48PRDfKqJHzEK5z5JD6s+QTl+2GhVOQgpeMZas
 FbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NEf65WokzAk1VQ6lMdWEUUnrHXinmYkcRgsE39WLyKc=;
 b=pJbg2YhQq3orRMu7psSSqSYNY6L8ugYZT2Lc5lyO/Q/ANycdrAMSZRldHTeMPZwAYr
 vxZ1v1VNnHTsPEj3nzg6oX4gEq5F0qYf/T5wc7GxmAaW+7BTpzKLNouBWkuzu97boDCM
 tpHzCZd5g9YmeSiMw07pVqzTaHDyV+iQpIRaO7EDlrF8BmZlS3+QqBKRO0XaaJ4Kh2Ra
 ItBZw9MZ2NBmowjwPKaqV71mL4+lUMWc95svfW7A7b97dkuBM8bxJR8D2Csw46OKL2S6
 LVYUlX9zxNLnQ1n67JgWTatG+T1ZH6qaYU00GvgfUrgbSk3IBFtqnpN1hdAd0//lVt9o
 hoxA==
X-Gm-Message-State: AOAM532SpcqnYonumOcll66RHwHXmyyUseTHnVHrryDX6i/Ym4QthLRI
 NKi9M44rb0prCt3gK70c2y9a++OHnYsqWAAE2X0wZQ==
X-Received: by 2002:a25:41ce:0:b0:65b:3723:f73f with SMTP id
 o197-20020a2541ce000000b0065b3723f73fmr19965303yba.288.1654000407233; Tue, 31
 May 2022 05:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-14-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:33:16 +0100
Message-ID: <CAFEAcA8rwQPXSZkLo-1mYjipPRvzazfLrfE4vLP27dq5ic9cnA@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] target/arm: Use expand_pred_b in mve_helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0MnLU/bZs/ni

On Fri, 27 May 2022 at 19:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the function instead of the array directly.
>
> Because the function performs its own masking, via the uint8_t
> parameter, we need to nothing extra within the users: the bits

"to do"

> above the first 2 (_uh) or 4 (_uw) will be discarded by assignment
> to the local bmask variables, and of course _uq uses the entire
> uint64_t result.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
