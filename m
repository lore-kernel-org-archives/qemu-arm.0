Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp673751wrs;
        Fri, 23 Aug 2019 07:50:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzfS04XKTza4Caw1r3qVPTmmDfOW2g+w+jYtXcrwZgVxQ02egR65I9//GnWDHpepvKEDi24
X-Received: by 2002:a05:620a:1411:: with SMTP id d17mr4271545qkj.81.1566571825876;
        Fri, 23 Aug 2019 07:50:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566571825; cv=none;
        d=google.com; s=arc-20160816;
        b=SAaKfctxrxA007hUuD5MsZKzYSGAKhLj+DJrzDIpUmxLbQO6v1i7YzizSCdLCCkt4h
         sJl4FxA4erHfCh3UbhPCsWxl4ZqoctqqYNQSVfUdJEQFqjZFv8JbbbmJqFqekMVpb5KQ
         xp7J/OnVmmgepE1g+S5ViIGvQiVyZsn6o2E4/9OnnsprqOe4P1CVLMOs69nIfYR98lsB
         MUEJo1qLk2ORxJSqTwXsgG9LvnFf6tbCwB7ptEWxAyeCmc4gVoVYvA7EOuA7OpxMR/vq
         iozy1fSkl3SwVLrns3U+G5gMJKHVQvOn0qPziptENCpcqi5XJ26n34y4kvIsUn5H93Ew
         0THw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RwV0aNMRcjdNVhgHO2URJ0Fn0gRb2Mvt2rirl+7u9G4=;
        b=EbkZEj3y0EaZh/vFGrxQaJQaWzYudbpzBXdK5cztcV1xi4cCjmvNU1mUYffsRiykfi
         cOzQYDGu+nH9ks8srCtUbJS/AE/k8GgjgtRNlxaQNnI2mDc+RR0QKKWgPlsxAlaU3eJ5
         wocL6uIwbOQcO/BydVK+JAmrKkw21+OEk/D5WNBEtIE4N/E+5SqLluKMjv6LWcGf3juJ
         PgzKU/w+troJLmZ8vRvpUuo1jFH8iYFnWrtmScgOlHxVrxTpEt8E4IgiKQefEJwLADl0
         h17bzheLPqr10em7VBZuAOTtbVG3LQybD6RwZ20aabhDRWzV+GqMPTc9MtA8rtzrhqDk
         oryQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZQxlTS3a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si2143966qta.336.2019.08.23.07.50.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 07:50:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZQxlTS3a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1AtU-0000pX-5c
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 10:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53343)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1Aqf-0006lT-NB
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:47:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1Aqa-0004Qz-Ut
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:47:29 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46312)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1Aqa-0004QD-Mp
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:47:24 -0400
Received: by mail-ot1-x343.google.com with SMTP id z17so8935254otk.13
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RwV0aNMRcjdNVhgHO2URJ0Fn0gRb2Mvt2rirl+7u9G4=;
 b=ZQxlTS3aBS6FklFVFj9c8RM5oCVv3QaCy+zLECKcJXnyoGqK8bYRc3QSui6S0kAf6n
 9z8QvOUS/kJtYxovNdS+ZuCssLoZKbazn+cmg2FzjX7qiGBJrLf8OKbT1/+ZQNkKBldJ
 eZ/u1K1lh7Yk/Sxoig7fju5fwYpmKbSoJ94s9gtvh6vQ14YEjDBx+MUIEZXFzUgWfktN
 7RIWC/DyQwexN5o8FYdf6pvbHrS4SXr5MCLORFWOr/4cFA/GEW9C3JoVlmupqTzftT2u
 uxOIyxupUJPCO9VDmoswk9xBm+VpB/Y3qsgVfzL/5+bfD4wUk+Dp+UWjURLev/xoCK3n
 NgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RwV0aNMRcjdNVhgHO2URJ0Fn0gRb2Mvt2rirl+7u9G4=;
 b=FappsQRoBom024+d1CdUrPI8oT1bWD46zNlJZus7byTe0zJCXf7hEEibU6ZsIerKQ4
 Bxbw9/8GZVBmXqDBoXt9QGN50h1+fZZ+qOe6A7P+LT9x98EGfrFihwvBn67JJtC5RzJK
 CBuIDHCeCXZtAnK42go0AwfM47zCXyUCco0i6kxrOcND3xsrAf/3YTKqEygVdeN69MMh
 i5196tmlA0dXzGkcOuIVZy44bzfDqV9RYrqnzsQ1oIsdAwP7wsk3YJkP82R0bn+PWqhX
 B2kZ13CGy2M4pBvtqNLHS/RNEryQaqPaK5Nblo3mIgnVd1Dsuve2gIT+OFgZRz8adPcR
 OF2w==
X-Gm-Message-State: APjAAAWjtbKACuVPWfwNHlVdegZJY2GaPbris0lEaZN8CdNFM2Qn4mPQ
 ntMO4ClKE5OT5yBtcXA96UU1Hm6z6NbPef+VhXriNw==
X-Received: by 2002:a9d:4817:: with SMTP id c23mr1601429otf.97.1566571643817; 
 Fri, 23 Aug 2019 07:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-20-richard.henderson@linaro.org>
 <CAFEAcA8Q3ujQFtZfLXTsbKBxUQAHCPo0i_TpdX9KcmnNUY04Eg@mail.gmail.com>
 <c8809173-6b8a-afab-507f-69983ac29224@linaro.org>
In-Reply-To: <c8809173-6b8a-afab-507f-69983ac29224@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 15:47:12 +0100
Message-ID: <CAFEAcA9Rq3VR3F+zUV3BiZ7zQm-gE=Ut4hv7Hi0cK3me4Vch3Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v2 19/68] target/arm: Convert T32 ADDW/SUBW
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
X-TUID: pytma4pp7pYC

On Fri, 23 Aug 2019 at 15:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/23/19 6:04 AM, Peter Maydell wrote:
> >> +&ri              rd imm
> >>  &r               rm
> >>  &i               imm
> >>  &msr_reg         rn r mask
> >
> > Should this change be in some other patch ?
>
> No, it's used by ADR.
>
> >> +  ADR            1111 0.1 0000 0 1111 0 ... rd:4 ........ \
> >> +                 &ri imm=%imm12_26_12_0
>
> ... here.

This is in t32.decode, which has its own definition of &ri.
The one I was asking about was the one in a32.decode -- the
addition of that line is the only change to a32.decode in this patch.

thanks
-- PMM
