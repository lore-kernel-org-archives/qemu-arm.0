Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1248569lfm;
        Thu, 25 Jun 2020 05:36:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzSyoCfKF2s1MjvOfyFx0HgflQx+AEdRXRm/lWEFLwZsVOLOkdtA1VyBcl9XROkWi9ERx4
X-Received: by 2002:a25:2e48:: with SMTP id b8mr48026605ybn.56.1593088605217;
        Thu, 25 Jun 2020 05:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593088605; cv=none;
        d=google.com; s=arc-20160816;
        b=C5Q92tr8t+5TtT9q/MrUA52hguDRMfqJ6O8bBaqM1kahoulRKNkXDpQGF4SRuPQ4za
         QXcmzJ717ZFJUYgAYyD74iUnDxk14MMa0fRrXh3vvF3FaKDYMhOhvUY9nzNVN+AnmZrX
         0bNsR+xQqMRofTI4ytOoFEbnlH3NHVdNT3rM8l6YEGdjDiIjfBlWHmvHt2pg0poQ4WRo
         pPJaSkAtl/nPtF44dk25mvDDhVoXWiWumy7EGPdJmPe7M8a2JE8llxcRuU4fjdh0obxs
         rofdKiowCbjZCHi2vEa1St0nivH6s1p3pjTS2TjawEGhSUoD3yblxLU7cY8/SBc+e0uJ
         W00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wqcLQrWZ7SyktUfW4P6/egZn3mCAH7O1SGQqHv9zPyg=;
        b=CtwT5dPcZV5kNluhHcMsduQfjwVSPZ5V5dUWyfsjVXc7GIJr1erofa2PObnf5WWkic
         POYjwTXIrIq6zTBZVYDM5tUZ/PxLsf7ngQ17JaV5BT8MeILbJMPWkH0IfkzttcMd1wkM
         0mCIQcr0md9flSo6QaQSSbarZdkUH761vncLmGwYdHzGR2KkxhzJQsQdX0SM81a+LLjS
         U90aXS/bvsb1sYSL+tInMqCyVPcofv1hNNcOVgc71TdMgQr5VJxCPeugfvixl0ZbL+yd
         AcsUJ50gYVwdUfYoDqMAgvxVPko9nwsbhGTnT10u8AniPhsD8V9FGMAeAPWPNgpz+atN
         HoFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="nsMY3/Zm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7si20637898ybj.428.2020.06.25.05.36.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 05:36:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="nsMY3/Zm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joR7U-00041U-KH
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 08:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joR7O-00040U-Ru
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:36:38 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joR7N-0003yi-2P
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:36:38 -0400
Received: by mail-ot1-x341.google.com with SMTP id m2so5043505otr.12
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 05:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wqcLQrWZ7SyktUfW4P6/egZn3mCAH7O1SGQqHv9zPyg=;
 b=nsMY3/Zm+/6JePqUDI+v2cJS/KS7+bjRcq514KB8TbwJZ1r9sxuwoDyhYN4rZflwhh
 lMepueDpg44MhILUdaxSd5DU7VZAAhq3LgoM6T3vT7NUpfUnZSUkmYtjSsL5W09TjUq6
 KmisHYiQQcsMxj9/54f6ttt3LR/B0g7pVqENmcZBxmy+dEBMNN26H5FITgKwtGY2leoh
 de5vtlmlsHA8hfMf6DIq3THjsMApwnSuhleTyR+xEnizM4kozlLq4/VMKOEgHIwA1Sha
 zJwSwh2wOaj7naVsegspOOS69LfWj4zrk9lrisqbpak1bNHL9dL6qLBTKJD6ji54y70e
 gAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wqcLQrWZ7SyktUfW4P6/egZn3mCAH7O1SGQqHv9zPyg=;
 b=oY469nfb5aaW87M/PBT6xlMU4rTjJkz+f5R6FhblPPtLECxNjqexozZ/NbOpnQOEJK
 tckZwDOY0a1abT+kuUrClQrXxAU4IA6mnu95KHl8TwKFBMINtaGO8LlYxoRltwSlW65L
 FMxOL8xxcYbW4bsZfXspOPWJwEV67CSMku17QrqGLEFbXVtJCjsCpZgpvhiXLAeRex2N
 mwCF0WJOsTJXkxBVXu90OMX4KWNMIULzI7NNBurKJynndd9TvIUEJ87hkuspTEMJKljy
 cCjEwOAb3Yqs+hayUCz+Y7mRCfIQOds677oeE4BCXJA/YAsjaHAS4oLsN9pM+tA33IMp
 qIYw==
X-Gm-Message-State: AOAM530KcCrkxprb1cD7Q6vHL4lwxf/oZ6hVb6qFFF0HWaxj6NKsTfyz
 NS034eWuSQfvtZqMwY7b+k46jAIZ8EB5tc1I/ZpHsQ==
X-Received: by 2002:a4a:2f15:: with SMTP id p21mr16194452oop.20.1593088595692; 
 Thu, 25 Jun 2020 05:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-34-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 13:36:24 +0100
Message-ID: <CAFEAcA9j9_1kONhpRCX=RAQnp3HWVFRRfGOD4WWA3sTC5bbx7A@mail.gmail.com>
Subject: Re: [PATCH v8 33/45] target/arm: Add mte helpers for sve scalar + int
 loads
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6HcFtlLQAgvI

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Because the elements are sequential, we can eliminate many tests all
> at once when the tag hits TCMA, or if the page(s) are not Tagged.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           |   1 +
>  target/arm/helper-sve.h    |  58 ++++++++++
>  target/arm/internals.h     |   6 +
>  target/arm/sve_helper.c    | 218 ++++++++++++++++++++++++++++++-------
>  target/arm/translate-sve.c | 186 ++++++++++++++++++++++---------
>  5 files changed, 378 insertions(+), 91 deletions(-)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
