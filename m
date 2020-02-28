Received: by 2002:a05:6214:603:0:0:0:0 with SMTP id z3csp2449167qvw;
        Fri, 28 Feb 2020 09:37:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqxdmjCJpg78V+1bWGZBmZdPW1nrM4tfM0gSF7sjlavJ+iVXh6zHtXFLYSMBLWcI8iypb2nD
X-Received: by 2002:ac8:3227:: with SMTP id x36mr5224909qta.349.1582911468064;
        Fri, 28 Feb 2020 09:37:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582911468; cv=none;
        d=google.com; s=arc-20160816;
        b=ZSJoKMrvOgU1IeX9blruyBee9iLrsRw5Z9bZl2HZhOYTGGytDfhYtJ9tNPbGP0sR4P
         KZTzJU9S34Atp+GO/WjzG8MCiKYJI6yvH0FovGj8KGEhxDU9CqvSBszzoPspwYc2Ui8Z
         5ybPd7P9DN0rgkAS15hxNLEqxNPNEnAbJIt5CEOwBZk61H+SkmQChtouDC3cD0vmaXRh
         YF4t0b+W7xTKXBvuYwBqPs2rXIi6sMClgzP155+kQEMSuzR+Sk1OXf5E9qsefW1b1IcQ
         go15Y2qIIhQyiF4n8Qedk76GuetWWFuAnxKipFH0iHMVNh6+L7iytoZa2OKt27/b4HDm
         3tQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sBIUHdFk3EbrkRCJts37Rg10Bb3EBo8aVHGIuB60uZ8=;
        b=gk5IKjWPZCp72T8F5sm7d2gBkfLmXvg/ujSnugwD5PlRRAQyV779uBHm7fX1gD4uLw
         jmcTSJd9hTOrPC+qH4eJwei1WxJk52xCTZuaubbSuQCNu9mpUFE8vuhPesDX+W5N4ez0
         YB+k9Lo37OzU2AmuNapvAIZFZDpa4cNNacbxL+rSJigUf+GmrMuYRJZ9DJFui4pWT1zb
         hpp9Z/JmhtsyMKNmcUEvHfywQUlQOviLo9VNAvM8L20ZsqxPFSsBfY7mL3TXesBPF0eJ
         LRvcVTwwqyYzRpHsNBDFQhHFjz7Ye5ZFjxXqEqRxy2dnlkocbuFhWJbxdiEUZgayrHBO
         Mppg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hPwgdEYu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si1688618qti.48.2020.02.28.09.37.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 09:37:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hPwgdEYu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7ja7-0006kH-Fg
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 12:37:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38852)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7jWr-0000XA-5t
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 12:34:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7jWp-0001OT-Rq
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 12:34:24 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46698)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7jWp-0001NL-Kr
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 12:34:23 -0500
Received: by mail-ot1-x343.google.com with SMTP id g96so3273694otb.13
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 09:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sBIUHdFk3EbrkRCJts37Rg10Bb3EBo8aVHGIuB60uZ8=;
 b=hPwgdEYusz22FKDuFz7kNfZipngEzkEYDkSf+K5Q1Hw+r+m4dxrMgaEyiTqmvwKyYN
 8X/1R+uxjXlIS96+r/dKGCq9Cfh8T6mWb7XeR1rnY7/Wg9tuCPTFrWQe0f/Y9+oFbqkS
 mi3zo4DrVRc3VRCQ4xeAV5D2sVmThPzYf4FAi5qXwiQlYdrYlpcepGXGa81lttEmkgQ6
 DRpi6G3vlSajW11l2qL+MQmhAqnoPwPXFOKoWK2x+EQ8mXNq5H5XaehyRw7te0rfF3CC
 El8eFQCH4RvvZPAqMbULoG8L90ODQIOQKFJYargHj6gbgmd9IqO7a63lLIsHkgoJbs/0
 857A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sBIUHdFk3EbrkRCJts37Rg10Bb3EBo8aVHGIuB60uZ8=;
 b=qLK/TacfZ2NiPvtFT3qMjWd7GMtHZZK4x7RtYD6tYJ/DnOJE2Xu0o2z94qdFjR/qap
 VrDe9ZPXCJNRYp0GieqncdcfZRRmoDG9M2ya6++uYUSlJvNfOZxC7zlFv4ufo6d8iFpO
 /7MpKY+O3cYcGdAWJh804NjjlbJrZhu9ZaSywG8MOhmNPy6JwslgNaStep3CPzd9iIyU
 lRZhW10Jb6w79FYQHnT+TkUTbUpoQagW+HTCLKe2YJMcq/GqcZdo3P6WhBUTrZU/ZpZX
 BDrsm3/ipdXw6ez0dqxdD6OGnfKZUiynAufdQttbT/QZJytgN8D6Ojq9RIgM1f0/8JnE
 09DA==
X-Gm-Message-State: APjAAAW9s0Vfqg0hNCwayAg2eCMPQguJUB6Y4etrFiwkm7ZRBsHm+5bW
 Voyoy8qr9qGVUjJQENM8iVYLN8FldOALcX4qUxEWUA==
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr4295899otd.91.1582911262143; 
 Fri, 28 Feb 2020 09:34:22 -0800 (PST)
MIME-Version: 1.0
References: <20200225180831.26078-1-richard.henderson@linaro.org>
 <20200225180831.26078-2-richard.henderson@linaro.org>
 <CAFEAcA8ipK0nZioEgbNq5B1L-tqA+rzn-C2yyfet4_4yNVnYqA@mail.gmail.com>
 <e4a70637-f4b7-eaa7-237a-57053c5a63cc@linaro.org>
In-Reply-To: <e4a70637-f4b7-eaa7-237a-57053c5a63cc@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Feb 2020 17:34:11 +0000
Message-ID: <CAFEAcA-8a4eQXf+LRS3KLURyyEPpPm9uh6q6r6D-1-sh3t8Pdw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] target/arm: Improve masking of HCR RES0 bits
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
X-TUID: OSYQJCfb8ADH

On Fri, 28 Feb 2020 at 16:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/28/20 8:22 AM, Peter Maydell wrote:
> >> +    if (ri->state == ARM_CP_STATE_AA32) {
> >> +        /*
> >> +         * Writes from aarch32 mode have more RES0 bits.
> >> +         * This includes TDZ, RW, E2H, and more.
> >> +         */
> >> +        valid_mask &= ~0xff80ff8c90000000ull;
> >> +    }
> >
> > Isn't bit HCR2 bit 16 (aka bit 32+16==48 here) also RES0 from AArch32 ?
>
> Yes, and it's set in the above.

One of us is miscounting, and I don't *think* it's me...

bits 63..0:  ff80ff8c90000000
bits 63..32: ff80ff8c
bits 64..48: ff80

bit 48 looks like it's 0 to me.

> > I'm not really a fan of the hex-number here either, given we
> > have HCR_* constants.
>
> While plenty of those bits have names, many don't.  Shall I simply name all of
> the ones that have names, and that differ from the aa64 masking?

You could refine the valid mask as the & of the bits which we
do want to exist in aarch32, rather than &~ of the reserved bits:

 valid_mask &= TTLBIS | TOCU | TICAB | ...

?

thanks
-- PMM
