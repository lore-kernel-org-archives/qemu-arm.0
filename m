Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1524067lfj;
        Tue, 3 May 2022 09:19:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+Uu2DR1k5hjyqzdFwRDPRpssHUw0eUBWO5O9LjfnBFpiTkahI/qTYRCzBezrhYMtHWMkw
X-Received: by 2002:a0c:a942:0:b0:443:a395:cc1f with SMTP id z2-20020a0ca942000000b00443a395cc1fmr14255083qva.68.1651594750212;
        Tue, 03 May 2022 09:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651594750; cv=none;
        d=google.com; s=arc-20160816;
        b=jo3PoYw30lztRYOzgg+qb7W9k/8Fknid6w9Ravs0bESy/AQbuGp2RGB7Os7o8Z8CVM
         fCfrBXis1vKqnPElWjlhoIG62PA6GTJbq3YwClUHp8Bdkna62FjumGkOPRJ5mS/ORytD
         ZYLiiw09iAdiKMq3fq5KyO8vP7NXJqhtb30kIemxMRpGY23KmkbC3xpYSj6+RV6gdRqK
         HWG2bB8KA8kNpXDJjAvE16hqiuX2HnaFVzopDyrX9KTSRTARhCC3OyM8zc9k6Nqcy0hP
         D/n/W+MnKnYrTrdKoyxCoLX7dCUjiiZqNK0iLCKjWLrby2nVEZ2jJeOzX0S6ExYxAESi
         c/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rfZyMNEHSzH0zE8jrXafSKc+DRkhdHsZVQWiTcQYkfA=;
        b=TLSwlOITxNfRynsiiQjXwebobGXDlEdMCJ0rOKUJUa3DGCa1L3kqAK7vu2zB/wm5ve
         SF/vrGhMrmTdkONoK3rT3qEU47Ylxnh8WYJx7Qf37ZeaZTRru6h+MBr6tv+9jsVBAnMo
         Cxs+j9Ys04qHbE44G8AoSlApbQFX5+sEkwI3vjN1e7zVcidb1uXpaSa1ZX6NnuwZR/72
         HUCcmglrmRhT2AYJt66AwLS2G5rv6Ti7FI9XfcC1RXK+7mSwwyw/HTDfG7n1PyV0KKFN
         wqj/caoUZVWMJ/AkVNEAQskBwr1qIfC2GZ+kgeyY03XGJkJH2c7BsJ4yb7KVzI8r5stT
         1Iyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kE/Z8pHL";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11-20020a05622a008b00b002f3946bb46asi5668433qtw.154.2022.05.03.09.19.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 09:19:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kE/Z8pHL";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlvEz-0007S4-J2
	for alex.bennee@linaro.org; Tue, 03 May 2022 12:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvBD-0003ax-UF
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:15:19 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:44925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvBC-0005P2-5E
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:15:15 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id e12so31864419ybc.11
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rfZyMNEHSzH0zE8jrXafSKc+DRkhdHsZVQWiTcQYkfA=;
 b=kE/Z8pHLD342+qGxW2+bpmiEv7FhZHX4B2Kpr8g71fGQkZvAcXNLkjjN99LJPG+bN9
 Pr7VaW/j78GR9PflF+G1qSawDEpCKkkmqNLEAaJl0zLe0a/kvlwnENySamjASXy/KHjW
 cxoYyYB2V9q4qwcCOCtnf5635Qo7b52YCeUmV760qWth9xEZsWoOnN9s38NV1KeFJXf8
 JjeZbANQLyDlPEN5sqzMQ/Sgj8Yv/pIENVR2kydwtK6gNnreexZuI31fZCtPc6Uqn9Iq
 2knCGO7+OWEhNApAanVC65ZLOh66aFTeqjTDtDCGSyLy8GmOA0kYVs15x7skaBpXuon/
 4/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rfZyMNEHSzH0zE8jrXafSKc+DRkhdHsZVQWiTcQYkfA=;
 b=c7L8AwruaOt6T8+MNNMJGKveXwPR2oy/GXPqi9/vWOnTfIMKMxylGGFegRmGVyKPfC
 Yvx1nQPhQmZgzxlSJ8neqFWYkjWKrQkUf12aXbBpl9/1y8OSS5VA/C5/R6ZwBB00mmuB
 6utFcJCzCMSQpscdM17Fgz0Ah+cUvD++gZHLkPfeA3IvLcDPc2bmSpQudIum1SqnbDS+
 Hq/tHLbRajdkzTYr+3ChaQKKKOPCvquOJQFgu8cc1cjP10zFpZYfBxwP9yjdGXi2OBUv
 tF86tQtQKQhN+CrazjhA0p4GMzvXujVkMIjKf3MSkx2aJXlhc1Xvxp32bQEbOD3SPp0r
 2V3w==
X-Gm-Message-State: AOAM532dMnA0+XJt4SkgqcVdEIpd4ZCP8FkNBkn6kr6SBexmjRak6w58
 wFTK1zgMM37iTfV4oznT+ekaUSzUCm0Uma4YunmRVg==
X-Received: by 2002:a05:6902:1543:b0:649:3124:b114 with SMTP id
 r3-20020a056902154300b006493124b114mr14780547ybu.39.1651594513080; Tue, 03
 May 2022 09:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-15-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:15:02 +0100
Message-ID: <CAFEAcA9Lm6JF44DfsWwBuzAYmdQ5HuSg5=F_TsYYzCjGtR_Yfg@mail.gmail.com>
Subject: Re: [PATCH v4 14/45] target/arm: Consolidate cpreg updates in
 add_cpreg_to_hashtable
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: XIXOL75PiylD

On Sun, 1 May 2022 at 07:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Put most of the value writeback to the same place,
> and improve the comment that goes with them.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
