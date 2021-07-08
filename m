Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp544573lfg;
        Thu, 8 Jul 2021 10:48:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhM7Q3ZNvs1r2EZ+5c5O/lNF101wdfqTyS/990bSiF7V6qOOh0H7JT8qev7FDSe10K15u9
X-Received: by 2002:ab0:23cf:: with SMTP id c15mr20771035uan.14.1625766523040;
        Thu, 08 Jul 2021 10:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625766523; cv=none;
        d=google.com; s=arc-20160816;
        b=JTnDQPH4WR3KKqeAQEWS+eTP/N9uYJcXvnaA3L6X7XRhcSWQ8cJkL3AZrrJAZblUWi
         Jz4LX4WA18eR2McxF7J/tGk4wRRlw6wFUDsS8YhCsUAbBEsWFgysZRP0diF3C+kqB6eM
         18SgXVadUF0ZQB6G1I7RJ5oIO9vqh1v1Ltq1+457gVhg+XrszjXQp1w+xEPJTt5GsVwT
         lZQFDSDsW/LCC1CP6f8Gf2UxziYfDIYaXjTQwqSTZ9wO5JlKXl/eN20muXVpMZgfMUdG
         Mq85Nzp6CHFIjGhf4uHK3FX0bh51kJRewN5ADUlMmctTj6C/c+ZTYtmHZAREkC71Nu0Y
         bKPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tB6Kn0HoWYECRjlZB7Zwu29dcbSg04VgmDYeKQVwPSw=;
        b=nxCgJwkns+gMOooLuZhd/Vm+O9vnSW5S0P85u/NrQl/PGqIiuxJup4h/xFPMt/6bQV
         App7N8NiYgbo6pkNOk1HK/7s6PX/C18XBumTaEx8UjNLP6gMbp2DBIt8rZNb44ai7rrl
         EPQfjTHBN7n+BaN4bT3QIlz1oUyCDpsujxtumwstPmcIz4wK1fykw2YsxSivwDe8ub2Q
         Oh7m86dEqcZGvvRoW4pS9yZY5urva/3kzuwNF/B7RL4Ot6HZN54bUUA1+0Yib0WWy8Jt
         FSyEL5fYGN5xejTf4ekxkQhjBEbDbRittZl0fk/ycNWQAJ7c9R3pD0kApilWUWdtlhkv
         gDjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hwUm3j08;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10si3517226vso.13.2021.07.08.10.48.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 10:48:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hwUm3j08;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1Y8g-0002lx-Aa
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 13:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Y8R-0002hI-Bm
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 13:48:27 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:33571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Y8P-0004Fd-H0
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 13:48:27 -0400
Received: by mail-ed1-x52e.google.com with SMTP id eb14so9800560edb.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jul 2021 10:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tB6Kn0HoWYECRjlZB7Zwu29dcbSg04VgmDYeKQVwPSw=;
 b=hwUm3j08PHIIs8GMELCjzzJpG6MT3yBVKU1Un9eI+p2J5Zj3SepAwycWbRBZurmEpu
 7XHp3/dOooUG2sZbfTcKQJzBGvZx+im8W2mbhy6CDIRjb3t/Tw2S1AJy1BFgQjCfJ1lV
 pc9ugahFIaEVVq1KjCv07w/JlecMrhT6uBzwuf5kcfNID9e73LWawOxasRC9gW/Axawi
 vghNrdiaApCEArdODrr3mZOcuR/LvDsE1OElaoU6UScisqM8o/+p0AJM8CwDjzlCxbte
 hBXiGtq/E+MTaEyELiL1LAxY+luIpdP3U9UKP30slW+s6LSI5HC+9AySjdut6R8uCWJu
 fYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tB6Kn0HoWYECRjlZB7Zwu29dcbSg04VgmDYeKQVwPSw=;
 b=AqYk5TPP7nCdmGYnVU6sQZFV5OaE7MDauZDp9NpB564ZRa5WznPq1glufnnSgfnPdi
 iM8dqNcLPaCaL0sQbrtiSqSgTQSpcaGXDXx6URtqAy6LgOaY77GNfAorP10u4f4yZXxv
 TpXSjrd1r0YrkdqoP8zVQA+4GSFVhtZwmKKXLtZBC2wXPHBEM2zxqSU8p/4naiIE8v+5
 IpznGmYA/1UnvJ5I4+8zdoNPiejleTlo7mO0FrYYUvJFHEcX09jviPOiyvMdVaNlqtO6
 cv+yxy2RHIy3EU1GZ/csZlqHJIQXA/I9qEnLJitn8wJIEBjgFsDh3oNhS0T0fxPvhix1
 wFyw==
X-Gm-Message-State: AOAM533P0Oq4FWyFqtXDH33+//E8hpDHyhfD8LrKm7dHm1ny63n3a8BL
 uBRBzpjXshR2SxWU7vPzaAW0xJpMAPuES9chEJCkew==
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr15934437eds.204.1625766503266; 
 Thu, 08 Jul 2021 10:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-6-richard.henderson@linaro.org>
 <CAFEAcA_EkW7a6SFuAHxdYvu_gdcdDwY4xQVOFnmtatcx+T1qGg@mail.gmail.com>
 <88562e08-3d6c-3224-5d84-67e3ffd3774b@linaro.org>
 <CAFEAcA8Xs0Ct6hDBAk-N7TVhb66dwv2EJudo83XzJ5dQn9k7VA@mail.gmail.com>
 <589d27e5-58e5-6af2-dfd8-11130fdbc2d9@linaro.org>
In-Reply-To: <589d27e5-58e5-6af2-dfd8-11130fdbc2d9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 18:47:44 +0100
Message-ID: <CAFEAcA_JFx3g0rOqeHOuoryuwvhHwMUzjrSDw=BqH40rj6UATQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/28] target/arm: Use gen_jmp for ISB and SB
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: p7j6l14QN2I9

On Thu, 8 Jul 2021 at 17:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/8/21 9:11 AM, Peter Maydell wrote:
> >>> Why isn't it enough here just to set is_jmp to DISAS_NEXT ?
> >>
> >> You mean DISAS_TOO_MANY?  That would work, yes.
> >> At the time I was just thinking of replacing one jump with another.
> >
> > You've implicitly answered my question, which is that the main
> > translator loop code treats DISAS_NEXT as "keep adding insns to
> > the TB" :-)
> >
> > It feels slightly like misuse to use DISAS_TOO_MANY, unless we
> > renamed it to something like DISAS_END_TB (which is what it's
> > actually doing).
>
> Yeah, better naming would have been a good.  In this instance I think I chose an odd
> colour for the bike shed.
>
> The problem with just DISAS_END_TB is that there are many ways to end a tb, with at least:
> (1) goto_tb next, (2) goto_ptr next, (3) exit_tb.  We wind up replicating these three
> across many of the targets, so it would be a really nice cleanup to standardize, and with
> good names.

Mmm. Anyway, for this change

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
