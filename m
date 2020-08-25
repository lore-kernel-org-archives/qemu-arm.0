Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3394439lfy;
        Tue, 25 Aug 2020 05:35:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR/VNxSNiCfm+/HmERPNbeQuGHMt+YjCIixPXQ4ckpxRbv4IDcWEExvsb//GYPLWsWwjx/
X-Received: by 2002:a05:6902:6b1:: with SMTP id j17mr13530640ybt.238.1598358945750;
        Tue, 25 Aug 2020 05:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598358945; cv=none;
        d=google.com; s=arc-20160816;
        b=imq/5scwbiadKyNecS6MAEYqyd3UuFUNWtUHnDk+9ERkraBQL3ekASpf+JlIAPOq9u
         FArc15ovN7bj8xK77xN+ieSvF0m1mPz+dTCwcZoC10qKZlkKOawe9o2ewGHT7Rh4dOzP
         a//oOdD1WVbWtBDJ9ITkVtfGrYVbrUbwx46d8hC9Z0QTEYJUHzSOZzCVz2Z/WxZKbwQz
         04AMvuxxCyNeTrPERV4cSHkVLeBRn2ecEBiVRWU8xYIWnlB3nBIGRNR7B6U3uUPvxkjQ
         WsvRWra3PE0/KC++fwTjBeHjkCWstzVT6MipNbJ2eLgvQodtnHIiv+mKDoXuDFC5M780
         gOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8A737/DKrYh9uyX44xcwujC6YeU+OC0xxDzLI1ANFW0=;
        b=snnDP7tqzu0L7C/6VS2Jd6fzwwGmE15Ayqw9ib9PfIbQ4awjhbgH5gOG8MAlcNy2NK
         Z/0FItHOmAn95ljbniTykvENThsPZgYEXVJB7jYqjlQ4dB+/nmMAFXrDGru+EiIOaaO2
         7N/gyv8z7I+AX2d7m6yjRgSvFrmq1Uu4FWvrcVqTaTB3d0T3/eNou3sa5uqgvqj8wpyD
         M0PVjsIE6FXhbff5XXeziutMfT7+SbGdbpLXyo3vHPOF8vTcoER+RIzffuTU2QtiSm6V
         p0zoDVcJU8R90tMciwncTbxQKLd6ZRypwngNyzUNe0MX8J3Z5BRh0l2EBk2UY4dEX86s
         NQVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S5vv8DGt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j137si14094116ybj.253.2020.08.25.05.35.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 05:35:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S5vv8DGt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAYAz-0006OE-3h
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 08:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAYAp-0006Na-0A
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 08:35:35 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:41228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAYAl-0006nk-HI
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 08:35:34 -0400
Received: by mail-ej1-x641.google.com with SMTP id b17so8014248ejq.8
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8A737/DKrYh9uyX44xcwujC6YeU+OC0xxDzLI1ANFW0=;
 b=S5vv8DGtFwBS03ICqE0tEHu2hRoK3m/gELrFRePiSnEDauLQIVmv04uAxjoDWOq730
 S9jpYcZ2Dx4Qd+YMRu5XL0LfVhfPV7Xt3EGtAsg26iDgh2lG/oBj7jURtmdZVhLSbO0B
 FvVgGQZamN7ck+S7xFwvlKsyrhF4yzY2SEfRhVmmfk7voHJGaI1HxYwQ4WE+ESUnsDo7
 nfo4VzngueORoQ2ErbPUGOqNNqePBDishFUYQ7bV84MLLc5EmozsEpCqXdCQp8yQ/jcL
 Pc61w3ZSEA8y6oZkCQ3kU3SF+jRpg6Dzb2BAHPHgSYqrwl7rAzgaQuH9nURvMl5CLaHx
 +n7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8A737/DKrYh9uyX44xcwujC6YeU+OC0xxDzLI1ANFW0=;
 b=WNahwm/PxOL9dPLpaog0fFLRddcIYkczf4w988uRxSAGqshgHSJkyP0h5J1G3hSwwV
 tr8zakn0v9DdkIFMKLgvMYNf9Zng4RVliDZDvoa1R5SGzh97pOgPIDCtUJhJZlsTMiKJ
 OPXXuuUI7sAPQ9ceeFcW+xP0uyIpk9YjXX/uOlC41ZwS4WYWpkIc+6gRUNB5TqanQ++7
 wgxuLz1c4jr+eXvKps4AKy8234v9pzLPg5K5Q+p1mS4diGyfZuH7kRxkbCMz9MaaiG3C
 OI6eFFVkoElA4lQ2uRHQCUSM09snLvwVVWvIEPFON0u57u+4sLfTTxP30m8deTf8luPR
 4RAg==
X-Gm-Message-State: AOAM5318aYnWbf9ae7wROTna6Q4x+m/mGvXtJzDD+spzP9l/m8KDsSUm
 0jknkavZQ5q8GnA1ynPmbe7jklvu8Nesh55UZPvLNA==
X-Received: by 2002:a17:906:2b0b:: with SMTP id
 a11mr696161ejg.250.1598358929313; 
 Tue, 25 Aug 2020 05:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
 <20200825112447.126308-3-kuhn.chenqun@huawei.com>
In-Reply-To: <20200825112447.126308-3-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2020 13:35:17 +0100
Message-ID: <CAFEAcA-MJZp5RVvg=tM45kz+=pZ6t8gm-zdkLLzC9C59QVCoDw@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] hw/arm/omap1:Remove redundant statement in
 omap_clkdsp_read()
To: Chen Qun <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Pan Nengyuan <pannengyuan@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G74o8TyeF2Q9

On Tue, 25 Aug 2020 at 12:26, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> Clang static code analyzer show warning:
> hw/arm/omap1.c:1760:15: warning: Value stored to 'cpu' during its
> initialization is never read
>     CPUState *cpu = CPU(s->cpu);
>               ^~~   ~~~~~~~~~~~
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
