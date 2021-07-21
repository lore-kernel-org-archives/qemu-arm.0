Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp6151868lfc;
        Wed, 21 Jul 2021 15:04:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztWgT+4PvNgeu9B2KE4siSczr/EWs+lSWXi4fH7rbyOaqapm7vZZdxsfUuO0h9g9vL7sLg
X-Received: by 2002:a67:b90c:: with SMTP id q12mr36934784vsn.58.1626905077145;
        Wed, 21 Jul 2021 15:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626905077; cv=none;
        d=google.com; s=arc-20160816;
        b=myFVd+gPFqHEw1hwZ8TKbmz8IGtGPAxajbQk9ukQBTG7Ke8uAQpyXBvzIeB6ARhSwm
         TEBgBa/EmZRmlGKBsrffXNUFqOIEpnXpsbvDrbS8Doi8o8flojomAufP+ZacAPQvY74J
         9VZjHjIh6HduA6xkSByjoX715hJp+mPkkUOK4HXOWpLfCNFMV4lwDsZHp2lIn7roD1s3
         86x+67VNSj1mw90uUTMu+KcZfr8c+YB7qF/Kt3gFoxKynOKufeIWvqqielHj+oel2LoK
         ryR4eRUfdvYfRFbI3qt8BcqUK4o6T1sQJBhMrWory7DoogNvgRelGPjNof6JFSAp7pdQ
         rdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ww7NfVvzyw5mks53Ap5neu35R3I5MURSY8TKjy4qTCU=;
        b=w3bj9b+ITOGm2+5GAOifhBwt7PWcVkNwZFNiGQvvY+IBt0Kk++4i/1WspBXJIV3n3Q
         E5mkU8Dl37PGsRzeG6GdtU7gSyz8a8JiN6z44BXMRbJnhwFvoEkfrewKNVAMdFrgyZmE
         0siJR2Q5+/bJMUA87coOmAw5AjgGn1xNWgC1DLwKvL+xRUdVDgZPV6dMDOWBRqSkkIZ0
         Jqux+CUoR6NcsPC9PKRCKXD3UYXBxbcZM27QPzY9cnSDL/txRElwQ8AHBRWz2ye15ybG
         5ZjW0Otr6P22I0TvpJGMwhMHc6F+MNUPovzgpZuhGRwFJcOATnCTOBD8QDJ+a9jz60gN
         PUqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A2zCxwZ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 79si920794uav.202.2021.07.21.15.04.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jul 2021 15:04:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A2zCxwZ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6KKS-00072l-DF
	for alex.bennee@linaro.org; Wed, 21 Jul 2021 18:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KJc-0006gs-Ep
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 18:03:45 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KJY-0006Tz-JZ
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 18:03:44 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 jx7-20020a17090b46c7b02901757deaf2c8so2691557pjb.0
 for <qemu-arm@nongnu.org>; Wed, 21 Jul 2021 15:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ww7NfVvzyw5mks53Ap5neu35R3I5MURSY8TKjy4qTCU=;
 b=A2zCxwZ2FvdcVn3CG+CnaiTNwpoIDstDDmh0X0NfJZieSE6AQQCzPFLZxV6JpNtg1R
 l/B861jUJn2UZKMqXvIbaVdb/SCf+i/6cn+I/WQ24K2xgkV2k/XkyCbxcrbdYKzSHhvw
 KGIMsH2O+uo7GkJSdm9sHFw4eh1r2Yeh+5n3O8aYKVbwelGQv5CqS0FUKek+LsfyX7XI
 rdF3rq9czJLJOX6ZoArTg/EqQ9IxIjmbQA2PZ+g38Km++1J8zI/MWOKsELK9LTJogP0n
 U+zW36Y4mmvRzJ54tWjHBkTkARG1EJhNqPjXRjB1IzrgaAD9go85tMHsU4RWx5GU55Dp
 mgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ww7NfVvzyw5mks53Ap5neu35R3I5MURSY8TKjy4qTCU=;
 b=nnvx/L+/twtWLPUjXJviYNRxPFjDlwlsXLFz8oj7qFC0W0cJ/lpMw2XB/gSLbFnaoo
 Ki2u4rPIT22NjmJ0wYQwW8Pr+QWop5t7TfwB75/32W1TcKtp3PawUrnt/6R34R7fAPWU
 JmoJ+R2AI5pIlOpJWId/VuPSU6hL/RaNGscojNemviYkkuFRs3Ji8YVg3zQmt7WhrSvh
 kCFciELKYIlonMOZH8yBms3DdXsxTihUCQR+okyNopZCWNnzxEk+ZW2wMU8Z3kjPtciB
 Ce13KjYBXOdALcPraQ32kKjXkVWLUi/2ZPzTeBqNxhn9x2FSpV3dhZOQ0UieTgBDoS2q
 TqVQ==
X-Gm-Message-State: AOAM530P2f7PWYGqIcFVcDnBHKtfUfN1LY69JAjeIlbgybK8NEhBB9SQ
 HW6P2MLyajrBsjO63jMRvn5D0A==
X-Received: by 2002:a17:903:31d1:b029:120:2863:cba2 with SMTP id
 v17-20020a17090331d1b02901202863cba2mr29753634ple.28.1626905019132; 
 Wed, 21 Jul 2021 15:03:39 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id r10sm31170157pga.48.2021.07.21.15.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:03:38 -0700 (PDT)
Subject: Re: [PATCH for-6.2 25/34] target/arm: Implement MVE VMLA
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-26-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7e0cfeaa-7125-b5dc-71db-43689b933cc0@linaro.org>
Date: Wed, 21 Jul 2021 12:03:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DNguytGHSZ4P

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE VMLA insn, which multiplies a vector by a scalar
> and accumulates into another vector.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 8 ++++++++
>   target/arm/mve.decode      | 3 +++
>   target/arm/mve_helper.c    | 6 ++++++
>   target/arm/translate-mve.c | 2 ++
>   4 files changed, 19 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
