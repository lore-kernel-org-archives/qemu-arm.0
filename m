Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp485809lfq;
        Thu, 7 Jan 2021 09:44:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOAL2/on5nUjMS8cm/t/hJbah68qJjB2AFhN/HxFl51dQbDOy+DU54U3rsBK79RggrDARa
X-Received: by 2002:a25:9c83:: with SMTP id y3mr13650909ybo.307.1610041481313;
        Thu, 07 Jan 2021 09:44:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610041481; cv=none;
        d=google.com; s=arc-20160816;
        b=vRKhqSRKto7Im9hGMQ/iZYK5xu00zgL1QSdBU60xHO2VSkfjc0NxgtwP52yIBnpZtG
         A0eN8NLEuYyqLHU5juzRhSAGaFbLuib4pQfkoCoxJdiZ1X/WFskGD7SJkg18oqw3E6eM
         lYsxJuqGuvH+S0JuQOPfYXsvGTG7tg5/vrdrejCSzXpYJmThemuTTKdJMRDFdnuxCwTt
         7eYK5km3Npy+5arQVX0b2zZ/7R84iD9X66OqRH8yav2vPgj3SO7bvqvmusUfpUQ2MF8n
         ZxdPfM2rpfSyAXM/R83CniuW71vsxRM/oTP90n94nqEPauiHqrK6i6yjrXV0Hk3K2RqJ
         UMeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LBOgn61wexeXsurZm8vyfI7SFAM/KVT0qJzidYdDdIk=;
        b=tO4QavKk8M6d+Dxaf7nIKGigiK10hUVJsYr13zLWoLoXjutMLECX1MGHV4KU6nq2no
         3zE4OrqNEyDvL4dFItbj+ALnUrg+uVMMc01uuBZ9BO4QEOu0MeJgYeSqvPi48RJzp+6O
         XinpJqzV+MTcVDY/CZj3/BGtRFish2VsdckZqS2pZjsuVB5ybkj1RGl4xT3Pv7XObL3D
         377vP6b/+ujOneoJXDdNAabWrGdNmiP4rFXiIni3taY9/igA6tLj3ns7mjx6aDWzF23p
         8ooHiLlyaBbuVxK2wfXiQjzsUyf3w+k2kDpWPPyiZhefwMFh8gLDCqFSuX4cepz9Du2L
         CjlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jeKyFhW2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m137si8064403ybm.301.2021.01.07.09.44.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 09:44:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jeKyFhW2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxZKy-0001ma-Md
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 12:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZJo-0000yF-Pt
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 12:43:28 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:40026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZJn-0004zQ-6Q
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 12:43:28 -0500
Received: by mail-ed1-x533.google.com with SMTP id h16so8539142edt.7
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 09:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LBOgn61wexeXsurZm8vyfI7SFAM/KVT0qJzidYdDdIk=;
 b=jeKyFhW2nLQEfD1NVGZ/P7iV8L40GOO1rQjSPhjY+RLb3FzrfI9NG+sDVvXMvJzA0p
 f4+FYue+YCg3BycfSscA+8vziqs36jBdz7aFf366Lxf53QZaR1g2bGB88ng0Fz4rRw+E
 E2F5i1l/XSKAZymdqabL3oLiq4cmLMIubdl82+hqM1mAcsX260/62hQS/ke9zJVQ/13q
 cGsgqhK4D8ohjkqMA+QyCXDOpThz57HwdyHFWyCzJAiKVOoojb6+rjCZDeqBA6Wn3ItG
 1/Vrw97rFMy+0o0bAjlN8398Mv91pxg9Jj8eKMTuzs/cC2W0R+Roat41zHQS0wNwdMY6
 AenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LBOgn61wexeXsurZm8vyfI7SFAM/KVT0qJzidYdDdIk=;
 b=MP3lYHkkyW6wvJLONaG+QMNvJ41/yVWQxctG5TrOAX4s24dFJE3cfDYTmxzKADJLbV
 6LzUYEmt8hfuMeBHlwWTIG3sclxsCB7CpR4csW3Nl20VVGzglgPXevs6tP5yvajT8sLR
 abn4ky6+Y7R+qtNvTU0pKJeZ6Az4+J2cj8t1i3Wadw3T7npJhH9bZhtmvioAHr49WQ3B
 IpzjG46CFpzLTXJmpYdwZQXzuuVWU2NKpyV2dg7xbodNr+4TFMhFbOy4CSm9UV+aqWYl
 WN2LYeTR8qSRXjTaTJjThpVsue6ayZZBugYj785p5QfpA1/Fe8Q2p7ZsdwtUu8FJc+VY
 XY9A==
X-Gm-Message-State: AOAM530IxtI3ldKqfdplhUGPYf/MRLUJzeFGHiMTwJC844O7zxbcrZ8k
 cO+6UzbtQZ1TCyH3j35iA0nMeH+dr0+tEJ3B9z8ENg==
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr2411472edv.100.1610041403544; 
 Thu, 07 Jan 2021 09:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20201215114828.18076-1-leif@nuviainc.com>
 <20201215114828.18076-4-leif@nuviainc.com>
 <CABoDooPXUC585huW0-1Md1WTAO0AwhKvOe20FioU=SbOJ+FdkA@mail.gmail.com>
 <20201215164904.GY1664@vanye>
 <CABoDooO==m2SiE+6t6idGjMsM71d1C0=_BBNJBriBkgg+eAXDQ@mail.gmail.com>
 <20201217121031.GK1664@vanye>
 <CABoDooP_uW-w5JaMXmo6AzUomFp5BuSS27zn6x3hu1VKbNbEVA@mail.gmail.com>
 <20201217122444.GL1664@vanye>
In-Reply-To: <20201217122444.GL1664@vanye>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:43:12 +0000
Message-ID: <CAFEAcA8huj+2Dc2+fWjkXEY1ToYEoDcSVddD+94D_vmGz1eoaA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: penytcsQvd/j

On Thu, 17 Dec 2020 at 12:24, Leif Lindholm <leif@nuviainc.com> wrote:
>
> On Thu, Dec 17, 2020 at 13:18:03 +0100, Laurent Desnogues wrote:
> > I was thinking about changing the field names, not the register name
> > because the register is the same, only the layout changes.  So
> > LINESIZE -> CCIDX_LINESIZE, etc.
> >
> > That's personal preference, Peter might have a different one.
>
> I see. Sure, that works too, and doesn't pollute the register name.
> I'll wait for Peter before sending out v3.

Laurent's suggestion works for me.

thanks
-- PMM
