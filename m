Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6515913lfg;
        Thu, 4 Mar 2021 11:29:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyC0pc7Tj827qLAipnSzSfsLxtvEwyriTjsZcdVowMuZuYSjsIgzrPADims7M9n4MylCCFY
X-Received: by 2002:a02:a90f:: with SMTP id n15mr5752736jam.110.1614886157696;
        Thu, 04 Mar 2021 11:29:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614886157; cv=none;
        d=google.com; s=arc-20160816;
        b=E3pA1pu3p3Az7Tc0/9/WNw9C2G4sZIx6UIFWjDpg7yS/76LsFQXD4T5TqhFoQQ2Xss
         GlFDcBgENpwQD4HfjE2SG8vSeshh9tDAVt88pCbDg3/FlWjjrOaOcI2MNnkcqz1RPBBn
         hP+uxlTRTRLpcUFguT+Ik6bj6PooJuWQPf4wLu8zXpDKEYgUWWpdFdlBmw+vrY2FzMlF
         6vWhdTAIJwmduaTlcp6LOOA/8UOy1qxGalwuy73LevPAFWfXDy6Bcqb6fkABe78aRMUj
         w8Ykbf00kdk03ql/dmKpysN/DMqma92I1WInvj3jB1arTQcBmKn0DMVsv7fq2t5Hsbv7
         IVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KwJAPoKl3SYf3zrzot/xlP7HZPeG50bVh9ZpNeHTlXk=;
        b=hxAkfmIkS/kOPtfl7B/ppWFwb238fnA/A2bPF89xH3AJVUHViud8SLct9yWngyFz1r
         bsRGG9b+B8Xggl9SWiJn1zMaEZMIo2qyaChDnuk7xBkJa7uZJTfB4VxE4gFyv3WA+LPd
         K8PprSubPUyy1U84ZBpAbtmYWxQ7kZEncevi4Ht4wUFYv4q1Jdg0iInrOGRhCXJhDV2L
         Y6rGP/adwZB7wlVm6FjJkjuDCdCa/AsGqe1Ef1PDymVcpds00C0qVS8E3wg/QiO2ISWw
         NQpnJ9JbXy9ZRVHXdSMVj2LOcMeLebx+/ZAfPiUEp1PljgbBm1q/Pw8kFZbrZRrgZ/ez
         qffA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MastUhiS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16si27811ilq.58.2021.03.04.11.29.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 11:29:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MastUhiS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHteu-00043O-Uq
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 14:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHteT-00041i-VS
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 14:28:50 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHteR-0001r9-Om
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 14:28:49 -0500
Received: by mail-ed1-x534.google.com with SMTP id x9so4676538edd.0
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 11:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KwJAPoKl3SYf3zrzot/xlP7HZPeG50bVh9ZpNeHTlXk=;
 b=MastUhiSlu87UCnKxRKyi/B1r5HFN3B99nH/5g8X5gehLiNfaprzBz+Wrqu3ICF23V
 Yt/jGRSWytD6oZE7bOJot/PCNrowfpfR4F4FhOXl6e+yjWj3v9UOUp3r4Phmo6tx5/7m
 qSK+R4QCXHtueWJBl0rb8cebUVde0If8JLg9ypkcLJExvigs0uMsS9WA0sXlDmFWaJs7
 ou4qbQcByB9Y7FclGOjEpglF+lzxogDLznLqFsn9W5oIvSNqxzou93MyzxNpFWvmPHpX
 woHRb3iNiab3t+WPvmFYNMu0v19C58CujyXnOy3wMylxgppIZGqKSGnLvDaT7u21ATCu
 dOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KwJAPoKl3SYf3zrzot/xlP7HZPeG50bVh9ZpNeHTlXk=;
 b=oJ0+4AFGu07toTTu01Xjs0lfhTHpMBPLgWDCdFtM54lX8yz5byKvvjVFxUKL7oyTVB
 rqHuT+3ZI3qnc11l+MypQ29W6CaAl6IFVsOY1jXEMouN5mlqfvsv8OLycpKdXrXWXdbh
 IacETd4d6VMxw7/za2rHzzrnEBDowhAM+ZXoLcXbXWxm1NyelzBcjvnr5x6SVwajXkJH
 krfk8oklZeM0OFIE5zawKobP9lt4s9bQARhM/nppU2ZISKsDNdy1dHptl7RNWdBHaNR6
 w5gW5dFG9osVGf4pmYSfOYgwvwS2c32P+Ya1G6Rky5drc6OPRRlX9WxJvbqX8iy77Nn5
 gDIQ==
X-Gm-Message-State: AOAM533EkWvLPmAfddvQ2aKvG9Vq+K+7FKYudZu9IJi8pu5q9ytf1sYR
 yozyPnwjjU3cDgitubf9yY4qvFsYaI4bP3LmqC3kKA==
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr6153236edr.52.1614886126269; 
 Thu, 04 Mar 2021 11:28:46 -0800 (PST)
MIME-Version: 1.0
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-8-peter.maydell@linaro.org>
 <0f167565-0af3-ee18-4f16-ec0a8aab12f9@linaro.org>
 <68619933-adfd-2240-8910-2d8e6e0ef6f9@linaro.org>
In-Reply-To: <68619933-adfd-2240-8910-2d8e6e0ef6f9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Mar 2021 19:28:30 +0000
Message-ID: <CAFEAcA-JBnqJGqHnBpsU=f68p3WJbiCgatirG+je3=z5k-42_w@mail.gmail.com>
Subject: Re: [PATCH 07/44] hw/misc/iotkit-secctl.c: Implement SSE-300 PID
 register values
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3+gSnnJieYMT

On Thu, 4 Mar 2021 at 17:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/4/21 9:29 AM, Richard Henderson wrote:
> > On 2/19/21 6:45 AM, Peter Maydell wrote:
> >> The versions of the Secure Access Configuration Register Block
> >> and Non-secure Access Configuration Register Block in the SSE-300
> >> are the same as those in the SSE-200, but the CIDR/PIDR ID
> >> register values are different.
> >>
> >> Plumb through the sse-version property and use it to select
> >> the correct ID register values.
> >>
> >> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> >> ---
> >>   include/hw/misc/iotkit-secctl.h |  2 ++
> >>   hw/arm/armsse.c                 |  2 ++
> >>   hw/misc/iotkit-secctl.c         | 50 +++++++++++++++++++++++++++++++--
> >>   3 files changed, 52 insertions(+), 2 deletions(-)
> >
> > Which document am I looking for here?  I found DAI 0547B "Application Note
> > AN547", but I don't see these register definitions.
>
> I finally found the sse-300 subsystem trm: 101773_0000_02_en.

https://developer.arm.com/documentation/101773/latest/

The URL does turn up in this patchset, but not til patch 42 :-/

thanks
-- PMM
