Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3128892wrs;
        Sun, 25 Aug 2019 13:43:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxvMtnVXlweax/4yIXpuLS2/Mq03Fm8DgMqoZoAiMoY6L8u9mQtjywEwQKJabYRT9tAipnp
X-Received: by 2002:aa7:c0d9:: with SMTP id j25mr15538419edp.166.1566765829517;
        Sun, 25 Aug 2019 13:43:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566765829; cv=none;
        d=google.com; s=arc-20160816;
        b=Knh95UInKRwfoH2Sg2yf7fGHE0exFashRqLcm5dsbWYHnT9bMcNn5DUjs9hCaLUYU4
         sUY2hMJ8J88NL5gHbHNYyYc8for0Mj+7L2fvnpkuoN0C8HHjWXfH8RL0dPfnwcBQCZII
         FDcO15QUaJ8UXMG3CBrIrdw2SuLFtP0pwt09/1n5DBICSKdjDLlsul7f6WlqzLANAAj7
         1IB2INDZEzcRQdVWKfAV4zIBrgVmSmhobQvqn3oL+g5QkQkeioKP7GybPFUjZNZZukRo
         +8Tcynui8FgY4nqJPr1RIoBm96GFPf12bUzKT9tb+KvhoKRrbnQ47xummIO2btj2OgeL
         J6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=otFYkDYO1CCJWJ6//sofYnaWi+8sSZ9tkLiYX6S8Pgo=;
        b=MSnX+Czm0YVlvfi6F3drEwbHQc7Wz5DrXCMa9xYBrAI9Qrblpeg5V2JwjUR0iDOvLc
         GObi0CIVxXlNUz6sPkB7qUdaXkztKol1vvDDYnr64PlanwV4CfwCqqVoRIauYip+LM6O
         2c0Ez4siplah1evJOcyyi4wZkS2hP2rcoe+ENfHJgcRyKwvY42Of5e5Ozw7rd+Ql1YkR
         UQV2EPzfFe1pqq3KSfWWgIfxYlKbiXvDXiHzLUC/bbspBZfnhDMfEVZvMV3vxDF5wmwU
         pw1VDc5Td693t9c2fusrHOIwM1g4LPMjvYHyYKc4ifxab67ij7IZwZyNC8W7cIyWKoGT
         Rysg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=db3F+n5+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e35si5058366eda.401.2019.08.25.13.43.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 13:43:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=db3F+n5+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1zMZ-0000NA-HC
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 16:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1zMM-0000Mw-EL
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 16:43:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1zML-0005zv-4s
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 16:43:34 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45626)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1zMK-0005yo-Mp
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 16:43:32 -0400
Received: by mail-ot1-x343.google.com with SMTP id m24so13335566otp.12
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 13:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=otFYkDYO1CCJWJ6//sofYnaWi+8sSZ9tkLiYX6S8Pgo=;
 b=db3F+n5+3xokQPra7+ckyTNMEe/hGj2nWekZnqnnirQU6MxjclPUR/F5A8xhl04EOc
 fYW9MFzoHqpoeXtioTgiELmGw+fgvCnRs/IkXbpagir9Vi7fCkPR8BG7eHw184zkmz5z
 u+DE/DD9DH4plrYonkfRBM4djnV8NGQKZl+IclJd3/pzqbqZo3VSzWqWc+HZVu72WNg0
 ae2neBobcJAdCFlAJ/Zs9HSlkBEmux9lgIA3hdszdaaJQ1uDVoZhqqMBNy06Ql+k4dXn
 MH2csh4uw5Tq5Atqh/A9YDx+OWMN3BopJ8iXqI9dNCL6ph0yIup34aK1H2XCHncGGz0T
 ElXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=otFYkDYO1CCJWJ6//sofYnaWi+8sSZ9tkLiYX6S8Pgo=;
 b=Db/z/63NemO5Ne877Y4avSbUYF5/ccsU5mpQoeubHpRjbiqviD3CJpFNt0ye5Q8WJE
 aFpHrnGnOmWJ0Mp92OzTu220DV0DIutn6ZW+vm79MdsyJhDoydF9yiZdm3KvSU4+Ca5Q
 72V8ytNTZI0J5oyG47jEbLQNMwBvrslpnwze89WwbYsy8KIrVr+1/Ot7WvaYNLFs1gyC
 OCnGS9f8mFaPxyJnOCOgz/YbVL+w8qztjudRkh1c7oGcoyAxUVC0Jc0mUt+yjLE0h2yU
 xa/AjLDYII/rXAvNkoTRSA8h5W4vQnj7Gv5a9pcyUvBWFvExeg16x4dMOyjDzmcgStB8
 B+Zw==
X-Gm-Message-State: APjAAAXm/XC64uNe5TJexVRfpfAobYU/9A5ziA/kM5AcTQbeurKfSUeH
 jEXeN1JL1JAWTNzeL4ruWl0g92cIq1O5adpcCQjHww==
X-Received: by 2002:a9d:6a94:: with SMTP id l20mr12076731otq.221.1566765810915; 
 Sun, 25 Aug 2019 13:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-36-richard.henderson@linaro.org>
 <CAFEAcA8JGUdM5v0MCb98Jw+iJNC+ZMD5SDrPVR0dHGgtMOdk6A@mail.gmail.com>
 <162644ea-ae46-576f-7dea-6696db364c68@linaro.org>
In-Reply-To: <162644ea-ae46-576f-7dea-6696db364c68@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 21:43:19 +0100
Message-ID: <CAFEAcA-m76JW2=t8uX6nC8E54TMKLe4nbCGvd8bOKx+wSYRtGg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 35/68] target/arm: Convert
 CPS (privileged)
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
X-TUID: O/9Ao0eRBckl

On Sun, 25 Aug 2019 at 18:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/25/19 9:20 AM, Peter Maydell wrote:
> > On Mon, 19 Aug 2019 at 22:38, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>  target/arm/translate.c       | 87 +++++++++++++++---------------------
> >>  target/arm/a32-uncond.decode |  3 ++
> >>  target/arm/t32.decode        |  3 ++
> >>  3 files changed, 42 insertions(+), 51 deletions(-)
> >> diff --git a/target/arm/t32.decode b/target/arm/t32.decode
> >> index 18c268e712..354ad77fe6 100644
> >> --- a/target/arm/t32.decode
> >> +++ b/target/arm/t32.decode
> >> @@ -44,6 +44,7 @@
> >>  &bfi             !extern rd rn lsb msb
> >>  &sat             !extern rd rn satimm imm sh
> >>  &pkh             !extern rd rn rm imm tb
> >> +&cps             !extern mode imod M A I F
> >>
> >>  # Data-processing (register)
> >>
> >> @@ -340,6 +341,8 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
> >>      SMC          1111 0111 1111 imm:4 1000 0000 0000 0000     &i
> >>      HVC          1111 0111 1110 ....  1000 .... .... ....     \
> >>                   &i imm=%imm16_16_0
> >> +    CPS          1111 0011 1010 1111 1000 0 imod:2 M:1 A:1 I:1 F:1 mode:5 \
> >> +                 &cps
> >
> > In T32 the CPS insn overlaps with the hint space (hint insns have
> > bits [10:8] all-zeroes, whereas all the valid CPS insns have either
> > M set or one of the imod bits set) -- why doesn't it need to be
> > in the same insn group as the hints? If we're going to put it
> > separated in the .decode file from the insns it overlaps with
> > I guess a comment to that effect would help so it doesn't get
> > inadvertently reordered with them.
>
> It is grouped.  It's not immediately visible in the patch because there are a
> *lot* of insns that overlap with the hints and 3 lines of context are
> insufficient to see that.
>
> But the grouping is semi-visible in the indentation here.

I'm still confused, I think. The hint space is
+  NOP            1111 0011 1010 1111 1000 0000 ---- ----
(plus the more specific hint insns before that pattern with
fixed values in the [7:0] bits).
CPS falls into that space; but you've placed it with
SMC and HVC which don't fall into the hint space, because
they have 0111 in bits [27:24], not 0011.

thanks
-- PMM
