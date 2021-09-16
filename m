Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1069520lfp;
        Thu, 16 Sep 2021 05:20:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIrx8cRDYtT3J8n9l+Sx2LlZV6jxI7XnXAnec0Xr7xGFrY3mCQjrnTbXCZdq29pD7FPFgC
X-Received: by 2002:a67:844:: with SMTP id 65mr3535696vsi.20.1631794845640;
        Thu, 16 Sep 2021 05:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631794845; cv=none;
        d=google.com; s=arc-20160816;
        b=VJlk/uHkuz96Mpg5DzDVNHsxp94O7O63W+I97S/Z67v6K9iVv6XzmNDZm1yiVpiZsO
         9DHAJEcYadSQvEQoIgHeHBGOjeX6TLH7huA53qKvajMNhulf3ZHWXLakC709IK+i1unj
         xS2eeFzAw3/J1DeTxPVI/e4QDrwe2/R7G2z2QK5amQlA6sttUB0Zwj5pmZzcZHt69zJi
         q/sgUrY70uH9IEjfH1SjEacpMGZ6znnSR8IjwmODJRKmijZmv4MEB2fIl1ytescpdRy5
         qL1UxVV6FbTVg8wpiejQw2IoU3rF8K4yURuldPLJ915+Y95lqv2px0tmpbaIupmiHds1
         JpbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x6+2J429AKKWmA7iWiebRHTPC6uL6qahB8bMeVZb9zU=;
        b=ilguHn355VOtEbP3jzngbVWjx8HfbpqdmT1VJD2o2nKNpf7IXoEs+Ko5VJSzpV7tWO
         NHfnzLvxbQekEBiK5jlxJMJ8D9ualRypAtpnio1tJPVeEkB2w97DTtWK/AQmwP0YgsP4
         P43ugJO1k4tAna16sm5M9Co6C2j5IBOm8I7exNsJHglKZsvsKdj9Szck+xuFuNAgYuVl
         q9g+Z92eWQL+ZoAm38mdd4/VB4x4lZM+rhbpMKXJcOAlflcr+qIeEypJx5nbui8rCfva
         S6Nvm0gYw6T9z+mDEDmqX1s2dCiL6ilnnkttD2gVMNyUYcASXkVZGMrtwwteESYwZf/X
         ns6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H3jOEU1s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si1293392uaa.217.2021.09.16.05.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 05:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H3jOEU1s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQqNf-0001eg-KB
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 08:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqMC-00006o-Or
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 08:19:12 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqMA-0007Jw-V2
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 08:19:12 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so5669793wmh.1
 for <qemu-arm@nongnu.org>; Thu, 16 Sep 2021 05:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x6+2J429AKKWmA7iWiebRHTPC6uL6qahB8bMeVZb9zU=;
 b=H3jOEU1sqM0YyUSCbfQKN1S4HIxkuvsEKfA8RX8cqcHsQN46xcLwyJ3kqkLzsMuDmk
 JNMZEorHMdChl1sIkeDN1g4ZfJ+TjdeGD+hHF11cpbAyhINriTWHCUgIq7XqGtYIqhNw
 wbddWJ/xDap8lWdskaKv5818QWweCLJbhMlpQu1yjLMSV3QlZ6QYV5sH+r450ihvELHj
 sDL7eBJhZbED+oiOs1pIe0fuVYOS5X8Jwuy7Xnll9psckp/IY+Ghfz9dYxHmX2YrnMVU
 jkpCwmfISuVHv9AgwW901TP23KvyVCQwmkj/uDC5iaKR8N4ifoTkOCnIO8/mdqWwojBX
 I+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x6+2J429AKKWmA7iWiebRHTPC6uL6qahB8bMeVZb9zU=;
 b=xcOPD3LA7MY/kKVmCkYxF8PKJRtgawWdlUmc1gIkC4/fdRikdS2A09lr7z/RIFNi74
 Rk1QWg9vR7wDSlqA8i8Wd2YP/IFZLc62JH9FOYpAF1Olbzer8NDcWUXBYwFi2PoVxP8B
 35MB7tgZrjzTYseU3kusRbLptYsZjHSvaMxn0t4OAGC2mAL32SPgFAvyWvM90rTFdHi3
 3Us3WNsUmEgmVB1Uq6KdO2t9wVmarlLeRnYCijEpqE5CGsQke119DVVWO8Nh/WJEDhlc
 M2nal2YiwIdS93n+FTsaamn40CttxPFYFKfyYDiOLobtKOWnLhfYyC0uEhFGpu19LN61
 skWw==
X-Gm-Message-State: AOAM531zv76G/BR7PLTMdWSo8igx8upS0+URcctfffNsBDf6bCvJGJKR
 zA3PKgd0y3ozlOf8iKPO02NcEr94WT70l4POohxBiQ==
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr9626908wmo.21.1631794749402; 
 Thu, 16 Sep 2021 05:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-6-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-6-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 13:18:18 +0100
Message-ID: <CAFEAcA-gYow+rkW+LDgGPE0tWP4EJVLjZu3yMtNBcfhuNmhh7g@mail.gmail.com>
Subject: Re: [PATCH v11 05/10] arm/hvf: Add a WFI handler
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8WyiQsiQb6Vd

On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>
> From: Peter Collingbourne <pcc@google.com>
>
> Sleep on WFI until the VTIMER is due but allow ourselves to be woken
> up on IPI.
>
> In this implementation IPI is blocked on the CPU thread at startup and
> pselect() is used to atomically unblock the signal and begin sleeping.
> The signal is sent unconditionally so there's no need to worry about
> races between actually sleeping and the "we think we're sleeping"
> state. It may lead to an extra wakeup but that's better than missing
> it entirely.
>
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> [agraf: Remove unused 'set' variable, always advance PC on WFX trap,
>         support vm stop / continue operations and cntv offsets]
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>
>
> ---

Other than the points Philippe raises,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
