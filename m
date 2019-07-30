Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4120040wrv;
        Tue, 30 Jul 2019 01:49:36 -0700 (PDT)
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr3321975otk.221.1564476576216;
        Tue, 30 Jul 2019 01:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564476576; cv=none;
        d=google.com; s=arc-20160816;
        b=sgyWfE2V6QBCWvfAKDLDTtqQm/5KYp3iWV5XaCANh2n9mjDMSBnUOTltHmWWoom9sF
         WHfDiszcXa4CaBYEh1MfIo8N7jpUh1P75tyU+89Y1sfpTvu7wKnvhtL1VFLODnzBEzUS
         6dG9Q8ARKSLFgI99PZ2reKUVherl4J4MaP67sIfb+tNKv9xElJWJY5AWX6rg18SDiMh4
         mkEuE8rYO68uWgsUYb0wckSGhwksoHy21u0gNsufFxatRDrAthBuyWN61On1xDE5HVr5
         KcLlcF/3Z7EQa7CIu+n4qhSC9jX5jjr6ALjkqnTKpJ9U84YP84p2ep/43tKwOoV8x93q
         +WOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d0M76miacXcy9t9W9z/UiYD80nYbOLxzcDAmZ1GSUAQ=;
        b=ZTUV5DPYwH5iALFBOqBnlz4WJFzJ2UhesO80j1AKfJZBV3/BtLL3a5/iZpFu5b83/f
         fiqFxco+77AlgDOGAWMOT4g+eAzkG2Zr2abzS8TgDj6LE+SAggPJEVrQnRoYoKwxNs/v
         v73d+YCSK34xErJ8B+Tj5hEBbLQNhRASTyN39NPbMN3cMkAprG2Z3FTO4gC2+KUIMcqA
         plyMIBtM6hO/XGQ3rqySgORvIgBti0gOHwqqxwlhZVVX1L+a1oZdJkOhdztA9vpABAG9
         RDLqxL9guIXxP+xRa+pltQok1R6zioiIRkLNjWHMnkrnqPoJnYRQd2uL1GqFnVP8C0k9
         FJng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=onyZoQ3N;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x22sor32941584otj.151.2019.07.30.01.49.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 30 Jul 2019 01:49:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=onyZoQ3N;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d0M76miacXcy9t9W9z/UiYD80nYbOLxzcDAmZ1GSUAQ=;
        b=onyZoQ3NX5AoNs9LDSFOwbASz4tCB9bvWVy8XOMCYQA/81DVZWRIST6LNfU79goepG
         LwUN3VmW1V1Gy3y+IY5dhBHWALN7/rSAf8QcepjnSIqBpXafCtcbnbnp8rHHpguW+zfs
         aeE5PkdzTYqUSebBj8g5RS5Hd5kDpr8q+4DZgf22WqSR87yGYopWyfhSI1Hdsla+ank1
         H4+hL/IojGzHSExvywQPRdr/5AaSY7nQyiXT0U/BUtnULvfwztq4LUFsH00qI36NrVPi
         M78n+aZfLMStw0DwKeH51TMsFqETFLurP7K4LIpiRghWwmb9iPA60GQxwJve/2Qpk120
         JTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d0M76miacXcy9t9W9z/UiYD80nYbOLxzcDAmZ1GSUAQ=;
        b=md0IpCS2etvJsp1LczyTiS73XQn6dpKJ6aFQy5NAZH4sGEp9mgzTl9aKQxfyHVTwP2
         rDtkzsl9ZuVni+fqBmO3CWEqGe2yAonR5tZD5y/2nQIaoQCcfZYX9fCrdEkvHkykLg9f
         iq8H9pksVkC5WCaU6IPz1SpY8Y2DR9IfAZAg28KOMNNJ1nFeuECm58jYXfI6nBvIvs8W
         Qjw9o7A7Qyt30lNo8C5eg8+LuUhLonHZLK3jGjlqA8Bqd2BcGbtdNvwUdJGnXI1fKfha
         1RXVSh80UjrHxyC0EN7Q8Q7I42tgvjS/5zo0nIR82Ydtb+sYG+nKutSV6dQfdWrxcnt5
         hkTQ==
X-Gm-Message-State: APjAAAVOi/3dVpomMM2x+Amj1bj8EkvIsZMwLy2b8Vhkh2DujWnVGzUM
	xTUo4G1Wo9M5sa4yBKxrULZVFCbf4opAsDsVzeMbr2ig
X-Google-Smtp-Source: APXvYqxAopKCkS3QXrIG/ah+a9YvDdOY49l6Gbt6Jyoj/NEF2VSdLfGi1YRqB/kRz2mh4qsXokWArOgWKBAJtBqSPGU=
X-Received: by 2002:a05:6830:1653:: with SMTP id h19mr30281165otr.232.1564476575763;
 Tue, 30 Jul 2019 01:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-11-richard.henderson@linaro.org> <CAFEAcA83GM6wgWs1xGygmqCoir=CXtFXYkzPBMdUeb638kCzmw@mail.gmail.com>
 <28a5710a-37a7-2d6a-1609-5218d5e8e931@linaro.org>
In-Reply-To: <28a5710a-37a7-2d6a-1609-5218d5e8e931@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Jul 2019 09:49:25 +0100
Message-ID: <CAFEAcA9WF3Ou4Nm8+ihusThyiyd53y1_ACpT_ygSROM-qyyBWg@mail.gmail.com>
Subject: Re: [PATCH 10/67] target/arm: Move test for AL into arm_skip_unless
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: IqS2d50RReBU

On Tue, 30 Jul 2019 at 01:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/29/19 7:32 AM, Peter Maydell wrote:
> > On Fri, 26 Jul 2019 at 18:50, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> We will shortly be calling this function much more often.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---

> >
> > In the other callsites for arm_skip_unless() the cond argument
> > can never be 0xe or 0xf.
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> In my original version I included cond in the fields collected by decodetree,
> and so every single trans_* function called arm_skip_unless, so that would not
> be the case there.

That remark was more a note about why the change is ok and doesn't
change behaviour for the other callsites that the patch doesn't touch.
(It's the kind of thing it's helpful to note in a commit message to
show that you've thought about it.)

> I discarded that in the version posted here, but I still think it might be a
> cleaner design overall.
>
> In the short term, maybe I should just discard this patch?

I don't have a strong opinion either way. Putting the cond check
inside the function seems cleaner even if we're only calling it in
a few places, I think.

thanks
-- PMM
