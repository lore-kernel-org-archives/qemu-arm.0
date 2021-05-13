Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp781624lfg;
        Thu, 13 May 2021 12:33:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWS1qbJrY5FZKu43MRjuEypZO+JKU7T3HA1wm9yIL5b3qzqopA6mGnkIxGIdKIkUxakPL5
X-Received: by 2002:a4a:b389:: with SMTP id p9mr33187121ooo.71.1620934384960;
        Thu, 13 May 2021 12:33:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620934384; cv=none;
        d=google.com; s=arc-20160816;
        b=ZWn5QRZrG/p+kj4/ZrIOb574xMuSYt4h+9n4yC9soLRnTHx/w/MB2mvMjI7Uz75Hws
         igGjCLvUWRE3EELwhyWHt2mwLw3sAqibu4qQ1VZsLZemi28xfcZFPGUJV2Q8ARDJbpJZ
         4mRYMmG2gKzjhXdjE3gYxgSJL7crdzar1dgldSSw3X9OVHXbNcnRtEVOjqo2DSQhDRbU
         RmUAeWSG8Ftbo90ukkT4CZ7xELr6YABHTpOe89u+Ce5PnME5Sd6K7+Z1RNA20/3e185W
         QWiiwCzPJfuBVvRv67J8eeT6v+iUx60M9hePYucs588SQ4ni5ErEyvwDx8B8bgugW/c5
         e+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j9SGZbB1OzgyJEb4kcA6Zdi+g7wB2nC4OBfOakPZ4Iw=;
        b=qvh1g8upLGlGkjSXxfWQf6Iv13ymVzcSHUa6Q+WHDAVzj4ZcSJ2xDc198X4h9kFY5j
         5zzRnHaskj13d7BXmcQpHY7TYcPBioQVMoaj7q1iOs46EEnTSc5UKC46YFII2wOlieNS
         HZU/tcReeLtZZ7zFWkNG7tX+IHkFxoFPpO4V0QcNhRpTFW5e+d4Z4qezKJk+8KsKmyNv
         Se2JXfdZTmeVCMiMGjqQX7577kD2Y4wD1lSmfArowepjvt/G4d8lgtPUnp5UpJ8yOeWz
         7Ec9yDRrgm7fWSA5dPDN8Ed0HGMYoR3jF5ECruT8am7l5Nh8tPyjVKM+XuHPL/evRNYy
         HpTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CIHT2MOW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e128si3933852oia.45.2021.05.13.12.33.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 12:33:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CIHT2MOW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhH4x-00051s-OS
	for alex.bennee@linaro.org; Thu, 13 May 2021 15:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhH4o-00051a-4d
 for qemu-arm@nongnu.org; Thu, 13 May 2021 15:32:54 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:41913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhH4m-00034K-Nu
 for qemu-arm@nongnu.org; Thu, 13 May 2021 15:32:53 -0400
Received: by mail-ej1-x62d.google.com with SMTP id k10so10202078ejj.8
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 12:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j9SGZbB1OzgyJEb4kcA6Zdi+g7wB2nC4OBfOakPZ4Iw=;
 b=CIHT2MOWIIaCBPD+L2O1qSnao53Kp1IkTggedh+yTcj6kGGeJc9Gg2Uu4oCERrBMiS
 5Lgk54xtUhMcYiI1SAi4CogqnuABYQmww9luF7kFpQowv2gIKiiuUTnXKviDWnuwiMLs
 lhbGMPyA4IekEcure+/x/jEZNmHr86kuS814+/B761Wk4tCgetgehflQVhwwh6b9Jl9v
 QY4VdM4yZRWMwgArJK4OWLTIn+F4N9dqXYfLu2zriNzkc7tThMflFS1inwBKthBUH1GC
 tur1yigvr5xTA2NSUwnUuHvV19ZSSz5c7RVg8b1YCZoP+7F9W9kbOjt1X/A5BZf/N683
 rE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j9SGZbB1OzgyJEb4kcA6Zdi+g7wB2nC4OBfOakPZ4Iw=;
 b=pyOdqhsdySqUqGXn3WyyNhDejC3ZwxF2Msm15CTT9IBZCyy9WhToFUDH7B8Sb4GgRA
 ZWMEB8r3aQb/sBLBOTcJwfddtZVW/cIxVJuu015VOs7HqAzntNqPhrpcEs4wo4dzJDbW
 qI3u/Q8ASR/oD4xA0FKZy93qu96ODoZemGNswusgC3nY+q9fs/G7nr9nILrzNxhJyFRG
 EGf7osBxHNV7r4I2FIyuKmsfEa0keUHsPiZtxPImWPcj68XD4D+ZrdIgUb6UJ09MtNQd
 ENEXEqU5xzJ79J2RURuJPi8x/XpKoNnP8Y4oMIvkSz1jSD9JMymzCQWzT3xxEjt1CZMR
 Ip/Q==
X-Gm-Message-State: AOAM530Ppajm+RDPIb1HoEGzAOGBL4aNh6TlzYU9OVTtJWdowC0ykILW
 Zbau4p/vObfrIpuSLtKt7KtFdW/BJ39T4ZOgL0CpHw==
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr6322412ejb.85.1620934371014; 
 Thu, 13 May 2021 12:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-80-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-80-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 20:32:39 +0100
Message-ID: <CAFEAcA99Mufd5uke47XJbNjG251JnU6oZQNDTQxL1zkorGpfEQ@mail.gmail.com>
Subject: Re: [PATCH v6 79/82] target/arm: Implement aarch32 VSUDOT, VUSDOT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C1ZReYfKRGPG

On Fri, 30 Apr 2021 at 22:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h              |  5 +++++
>  target/arm/neon-shared.decode |  6 ++++++
>  target/arm/translate-neon.c   | 27 +++++++++++++++++++++++++++
>  3 files changed, 38 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
