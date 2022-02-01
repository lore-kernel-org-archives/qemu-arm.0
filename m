Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp755141lfk;
        Tue, 1 Feb 2022 14:17:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJnLpa4qWjfYRbb2y9835hsQdy19q5Y+QDb4HlNiFYLzPQfnXV6p/BsagMVwSZKx+vpWkx
X-Received: by 2002:a05:6902:102d:: with SMTP id x13mr38261484ybt.610.1643753849011;
        Tue, 01 Feb 2022 14:17:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643753849; cv=none;
        d=google.com; s=arc-20160816;
        b=UECxc92rmMnTi1jSHLziK6zhkIj4xXLxyN0a8bKNajih5WT8wcbCEQt5P4BxOLHlb8
         5umlNwgFaX5c51flfXIOROw0Cyk6Jl0b5OrmAWzVeULlKf5R05t3OE22Ce/OenYD0NHi
         n4L5YWKAzQSokbW4dqs8qzHyHDPPO0xfF8EDpoolgQzaWzCCOctwgEvZn2+wy5MMu9p0
         5FF23Nd0tckiHNR5ENzmW4hQT1rp35Ff+aQNhZlC0AZsirn/mQsXdJqZnNFa5HHMjTY8
         DLe1qGxTEViN5bjRt210NpdSNOstV43XUj8hNN1v2yerNckgs/EpIv0++bcjYGlzAmY3
         ZE9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5WUEeYNPOa6KPrLQCOTlEC8GWAy7O/61/UC48ILxp/o=;
        b=yxwc2RRZyV42BajBZIAlRjSVLrVn23hnZXRQnzfoOfiKEh4ytRVEP1wP/pBNorocpY
         D/ccCxnUoLeR9BPTUCToRlh6eSNCRrhJSVQmvMq6/TEYMj0Z8BYj1Nfa6Y4BZUPxHDgW
         d7Nr0zDXBJ+DYEqhvLehSOxj7CNodZcivNF2AEL8YHOq5h7J6myaLPAu2m8FPnMYEVwk
         b271YnrcYDF96nK/GC8XWCLFwPWkEn5PZ8Ymsgh15HR83nTojdH6+Kd+OiJRt5GaNotC
         Z5eSLR23tqHx3yJk+c7+MfF5OxC0wyiHdp5LjH+dOft4OtOCu2zTegucTHS9rb+CeQpb
         CLjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bFzeMW9L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3si27075458ybk.19.2022.02.01.14.17.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Feb 2022 14:17:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bFzeMW9L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nF1Sq-0002wY-DP
	for alex.bennee@linaro.org; Tue, 01 Feb 2022 17:17:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEz4G-0000NN-Qv
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:44:00 -0500
Received: from [2a00:1450:4864:20::429] (port=39926
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEz48-00049v-Sj
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:43:50 -0500
Received: by mail-wr1-x429.google.com with SMTP id s9so34022358wrb.6
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5WUEeYNPOa6KPrLQCOTlEC8GWAy7O/61/UC48ILxp/o=;
 b=bFzeMW9L8Es/3K5/XhGt0T/2xDszvFu5lhe12rcnxr3aw/pGnHIwOQfqljy2mBnfiq
 l4Dm31tF9/RqY87yb4LeCOene8+dQ0tMwysuMv9ydXzgRnw/G5vb/XMqqTKe+Up7/ji9
 iiug+yNk2GTGgm66kMY/+GzIsvWjUlriBc1LmH4b/+SkGkePJyi+2tkH0er0zwUmUpml
 2/4VoKvqpnvw9Hi888g24cSAlrmte09FlNAdxxJL/vc1/XAw/bB+vcw++OItKbkehurr
 adx1+MqaqCv8NHcuvUxdnRQl1l9CQpQ1tGiSMJMPtcuaCtlIao+zP6/kRxiWgshhXrBK
 BE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5WUEeYNPOa6KPrLQCOTlEC8GWAy7O/61/UC48ILxp/o=;
 b=42CAtz8+Y3bo4rQeKeOtU3QlZ8zJBxykOqUxjDhlKD4v3hGi4146n7jkKjGKBU4hme
 UUGLdEG0WAflOqCWkzFLoPycs7g5+0GQSPGbsj8BYhgA2Nm0/wwHSQfDxqrctcNsiuqo
 1eHeEK5vjgLlkojVA0mcYFZvOpKY6xBJKvDCjeB7f/VP/Rr5e2qxFM1pGGit5tOe6Ole
 Qw2I/nxxHJ8BLp5XsEiJZT0ceph48tCAA6KyRVoS4O40uzHx7jR6tu/rWT9/zGAdRzAj
 LcCe3e6tmNgxbHxRxTjzM7YdciulynBsiplef/uCjsNRjsxizabLE7NTn0RFJqu4kVaX
 XJZw==
X-Gm-Message-State: AOAM533veI0Wwi49n2e0L2PhBhGmy9OpLxzpk0tXJJyNI74RXmskjWjZ
 Eq9DimjNEsYvj4VCek2TVAaFj5GR45OtjDQOdM17yQ==
X-Received: by 2002:a5d:438a:: with SMTP id i10mr22101663wrq.295.1643744622619; 
 Tue, 01 Feb 2022 11:43:42 -0800 (PST)
MIME-Version: 1.0
References: <20220201192650.289584-1-git@rpls.de>
In-Reply-To: <20220201192650.289584-1-git@rpls.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Feb 2022 19:43:31 +0000
Message-ID: <CAFEAcA-amKEjN2p9UbPLw2-1CdnPGqY+xG7bTMgnGdLnDKirzA@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/armv7m_systick: Update clock source before
 enabling timer
To: Richard Petri <git@rpls.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:ARM cores" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7KyNk2bJR+Ut

On Tue, 1 Feb 2022 at 19:28, Richard Petri <git@rpls.de> wrote:
>
> Starting the SysTick timer and changing the clock source a the same time
> will result in an error, if the previous clock period was zero. For exmaple,
> on the mps2-tz platforms, no refclk is present. Right after reset, the
> configured ptimer period is zero, and trying to enabling it will turn it off
> right away. E.g., code running on the platform setting
>
>     SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_ENABLE_Msk;
>
> should change the clock source and enable the timer on real hardware, but
> resulted in an error in qemu.
>
> Signed-off-by: Richard Petri <git@rpls.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks, you've saved me a debugging session! I had a bug report about
a problem with the systick timer a couple of days back, but I hadn't yet
got round to investigating it, and now I don't have to, because this
patch fixes the reported failure :-)

-- PMM
