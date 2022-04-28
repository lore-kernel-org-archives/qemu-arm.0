Received: by 2002:a0c:cc02:0:0:0:0:0 with SMTP id r2csp732248qvk;
        Thu, 28 Apr 2022 03:50:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt+XaYjrMxQ+d9IwYyjeSssRXE8hlzK22E7TttknIzyWqVirjC9C1rkDcaSACJW2qRrRTV
X-Received: by 2002:a05:620a:440b:b0:69e:c0e4:6a3 with SMTP id v11-20020a05620a440b00b0069ec0e406a3mr18435329qkp.370.1651143053976;
        Thu, 28 Apr 2022 03:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651143053; cv=none;
        d=google.com; s=arc-20160816;
        b=hKP6nBM1wuhQk6rc8K6FPtCCLat8nL8nYLD7hDl+Wr7rxfBbbv162U2TjPN1Ga4T9p
         ZpaQu1paQn2qEkeWUyQxrsSp3EniMsmCFKrbeKXAnuJJorIY8Tw7nzW1eelIZwGDGhvq
         ozSi0uh3g9+Zi5WMwqPnVcA85vw9qMPC/tts/0whBkA4CBvb5aPEjVLLvoTXLk2iVgUw
         M+9wcKKUdQ4Um1QIPF7Kocq/nymRrFX/XelT1+2GPaTGfcce9Cvz2JF1d+qDtot0oz6o
         HeR7WMuRvrQ/Jr8IE2QFxGklpg9oD0mmYydImaZkraX1aILajBPQiMqGRVCeeeloBcb6
         DVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=niPxWWeB0PtjmqhVVw/3ijfl+grPyzwd2h3dJH4pzeI=;
        b=N+aQV0isW0BQiuQuhqJsuYjMuu9uWyR6hpK5RUxrGbsot7/gYoVui7G7ha+YUJu4MQ
         qQ91atD93LU8YCnmiBoo9Cah9HPhQLDJbHl7qlWwTXu5Kaqm3Yr4bhboK4YBPTFn3I9r
         0yN7VljdqWnrodTkpcVTfj5xWWVw0WsegE84/ZGcDAqPquQ1XIb/judZIRyPBUAg/E8V
         A5kvzc2hYmsdb/eGEowRfVOmTvYqBwdbDxkco9/+gM1eiLgVB/01ypWwTnoASyys51KG
         kDzpHXlV8zkIrdY4jdS1MvAidLtANffV6HJ8e2106zTnMd6+fGsilGwKqeC+ZZNxkIgn
         ywkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qCYXMrI3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7-20020ac87f07000000b002f3740ac603si1731296qtk.523.2022.04.28.03.50.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 03:50:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qCYXMrI3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk1jZ-0006on-2k
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 06:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk16L-00012m-Oi
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:10:26 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:34467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk16I-0003Vm-0A
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:10:20 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2f7c424c66cso47387217b3.1
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=niPxWWeB0PtjmqhVVw/3ijfl+grPyzwd2h3dJH4pzeI=;
 b=qCYXMrI3QWz9FMM8B1d6Vv1juywPgi9KRk6hgtZu9jqQJqbfj0A/lumQiY/C594vaT
 ci2mjldlg0gp1VTM2u+1raZWkJ5Ht+xlmBTHEm/ntUAaMsUe4b7hm77QbETaAFiJe/2W
 S37XHAvkJzEQYtX61Xb3SlX08ZI4xUnTeSuCFAvNZ/D944nJFhhn1TRHeaTTcox/Wugx
 OflGsaOHm9BPp0PvyI727XZrjLWfcEfkDb5G0G4XGzCzHjVCtoeK29Ih1XIzLxHVj/W0
 1mMOMVCivxO6b8OBqbShS/HlY6nsh5nCm+4Taj+hruTr9ecSoxyCGpms85GPqn1HslEa
 hNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=niPxWWeB0PtjmqhVVw/3ijfl+grPyzwd2h3dJH4pzeI=;
 b=QsPT1rNwkH75YuMr7U0Ldf3s0u86VJLXDnmh0tKbsmjuGShtf9BKgBfqtQv+NUHTIn
 01iN80zPyW/vy+Myg8Lv0HdF64c77zfMcazfOWzL9LoPtNJAjASshCApXO4Jr+m2/jf4
 msfrvmpHAZxbHRoFFop3EOHlg+4uTMfXQXgxOkQojS7q+gBZcFniB9ZDHhAcAvZGmB/5
 c7xqf1A4ZKZumcYaTARhuO4aJyD/W663bLd6G4j3ZJMvOsBXFtOwuK00gTTiGUTPbhuV
 wF2zxZNY1iB1gLVpYYPYI2LJtMq3KPVSL0zq3z/0XTbjPGScjViLq9DucCSbptNRKumL
 tc7A==
X-Gm-Message-State: AOAM530Sumn6IW/ixk8XZKfcFh4+9qO6Wrwmvdod3lQdBeX5R/2E4vC9
 xUovWANR8dQaBT3hJyma8EJ+5cE7+A1Vz+BfTV9hEA==
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr32104528ywf.347.1651140617111; Thu, 28
 Apr 2022 03:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-20-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:10:05 +0100
Message-ID: <CAFEAcA9ejvnFWyEaTL11jKi3p114M9f3u1TWtDi-_1hfxBJZsw@mail.gmail.com>
Subject: Re: [PATCH 19/47] target/arm: Use tcg_constant in simd fp/int
 conversion
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
X-TUID: P+0FnDF3n7Wn

On Tue, 26 Apr 2022 at 17:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
