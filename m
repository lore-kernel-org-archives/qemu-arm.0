Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp474678lfm;
        Fri, 19 Jun 2020 04:04:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwM7rZ4ima/9DFtzBZ2qC5JLBdawYxfBWbK+nlPr+m72RcV9aGU5WUAUmKY7rx8xilC2wuf
X-Received: by 2002:a25:8011:: with SMTP id m17mr5308079ybk.370.1592564675924;
        Fri, 19 Jun 2020 04:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592564675; cv=none;
        d=google.com; s=arc-20160816;
        b=PeGn5k3kxfejP1UiTxleUkIk5sZy8NJtWo/XVdTPvm4rqw0GUqDmyTeyLPHCIwhVfi
         cyymfWgNQzCI1W8AeXuwpSjfZq5c8kj+izTMJMZF3PnfjIcnj9L+XHTVOanJo/EIk4ir
         7FrGwP9U8jCFa7dNx8LrHlmcvo+WpyAmubEiZo/uIyrymnrNCw7uvMHKKbcy8Y7I0Wgg
         1Bhs5/prOoT29k9QJYXQxRvr48eoLsJHuC5Rt8rMotqMkssNOVN67QHokoXt4Yef/9V5
         zVwuHvFSRXABlQOvYBqSZz2n17LFfLJAsFD05lRbYvIWCdTUr3lEvB09w8146p2ac747
         JusA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=00nb53DQBh2iKXbOY7W3WK7e7J38B3c5DAmLhVafIsg=;
        b=lRAqY78+okaR8Vv0aXFE3+dqaf8VPhoTfud9xslF/o697Av2sMfcS0pdZ/ENEId3tE
         OBR3vBgftRdsAjBwWPOLi+OwX3m8ZaGYKO1k6MHhv9wWF9B7d8bJKMf2qodVkUhKQigN
         QO6jkbJ7wEH570zBWAL7Wu4EzsNkt5ZL7d5E+UeA58ncepFzk6WjSBR5okuOgmfaSs1G
         s8tGMZT0Xr6hHj0d7pXsOEUw/5CRzcAq2mC4hJrzLmsdFeRBL5lLjDi1S+9wxCmIAaIR
         uVCYzoeigGRqKlXa0+IbNOAC/v36SOu1lvSnjPeLmWqCUCRLXyj0ieQPbw2rXgPamqta
         IAxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dXSFBhBG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1si5108486ybc.209.2020.06.19.04.04.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 04:04:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dXSFBhBG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmEp1-00044Z-8t
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 07:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmEor-00043B-R7
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 07:04:25 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmEoq-00051a-9I
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 07:04:25 -0400
Received: by mail-ot1-x344.google.com with SMTP id m2so6940970otr.12
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 04:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=00nb53DQBh2iKXbOY7W3WK7e7J38B3c5DAmLhVafIsg=;
 b=dXSFBhBGeQkLCoxEJck8uGJkTaDoBEn6KV+fszx+ma3TQ/C2mP1zmbzoybUntLlEk7
 xF1FSyTd/XaSvjB7TxJ3bvBi1YtJWcfQH2tQ9A6IQcqR0P7ljmddMl3Ph53TyqWOLNdf
 kgqy3I3Z54+VMnH1U127vzccNPYjrjrw/dz6l8CMnGdj0NLoJeoYgPqBQHx99+5D7AOh
 2hMJ/WW+l3xQHz4qmNOYR1ciHM2nLXnGwAe2k6NZLgfvtGhnohMPBMEfjT+bjRcu9Gr6
 NGN5OPmR2tAxKiy9XZlbcwKQu5VZnlVnszlrL3g70gmDkQRlrSky7AHRJr/gJyrnaPQ1
 nb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=00nb53DQBh2iKXbOY7W3WK7e7J38B3c5DAmLhVafIsg=;
 b=hl3asj7AcHI0e1PN8nicLYORejp4qcoWfKY9s0HbOgLIN5u/yr0S+El/yHA9TjzwBc
 8RyYXaefHLRXPqfjLuPzJaEUOVirZd65F6Zi4xJu/Xf4QmWa6i+vV3zv/f5QXhosAewk
 oFQBDOhjd6i/RmzAyDXUb6gHFv2cKQSa5L19qNKaAlx73XWrXhNGyd3Rf2VXw7pwnuV0
 xtIApdq1w1/pRKkIMZIyNu9L9AvZrKThKBUU0z/UIAyRL5SUAxgzSAqVhg3DaTl1D75o
 P5r+AXcT0jauT3DoHP8euQQHBzDkVBrEoSv535Yb6rzD3aNYZgOfMOqyB2Fv4iJUcw9u
 1hgg==
X-Gm-Message-State: AOAM532rLnt4TEaluHQaGJ734sTHQKMdZC3cGfrOwiwZ+vnW3KLz/HsD
 Y2GI8fTGyzs/Bv54v6szUP75xOEeVIyA2lqOF1+BEQ==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr2584288ote.135.1592564662926; 
 Fri, 19 Jun 2020 04:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-20-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 12:04:12 +0100
Message-ID: <CAFEAcA9Tb1X6E-6FnbAEUJM=Jzam6tt5c36-Zm_yWp_=E8Ms6g@mail.gmail.com>
Subject: Re: [PATCH v7 19/42] target/arm: Implement the LDGM, STGM,
 STZGM instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g2nPd09FGGtK

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Require pre-cleaned addresses.
> v6: Check full mte enabled.  Reorg the helpers

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
