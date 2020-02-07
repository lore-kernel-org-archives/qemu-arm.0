Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp585688lfp;
        Fri, 7 Feb 2020 05:37:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqyKzGZ6Dv85yXEgUGHQgYd7WPj/4WVNaJTEb514jEJs+DPCHqBIScssLkN3uuPSlO/fCWDX
X-Received: by 2002:a37:67c6:: with SMTP id b189mr1375152qkc.146.1581082624217;
        Fri, 07 Feb 2020 05:37:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581082624; cv=none;
        d=google.com; s=arc-20160816;
        b=AFCec3setcYxz2RWiWVmyAV+8ZcgCEwT1kJr4PxsDPvAepoYh2WH3OyN23SCthBk0w
         IwUYLjZ3SjK8gvIh0/OjjV4QCWVSTGl6t0dVJQJUK5puwocm5mKlJ8RQLOfKUopIuZSb
         nB0KeOQPsLG0x2vpo9DV4SA7+WKiS3VXm/d0y+C8T+0/rWGOYlPuWzMLYdIEqkS5BNcd
         vBkatz+Rga2ciyGqk2yIeEXqwrn7bI5UaylIs7JlA7QNPTzzwJa7BXpsD0mzsFZaO94o
         sYVrmZKXYNGqUWPSVltCWfzGHQ50D6zbNF1zmwsJrAbXYPreuFdOCt3h419d6R+9bXli
         eAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=mFKOQXnbjPCOHC53DmP31TRPNZG4/glAvd2SjGayMKQ=;
        b=EY19XVI+cQD4wEu8830D/8kaS9oyokM1i2n/BK3p2XCzzHL2DovzWLSK83S43Dtk7C
         KCnWSmaBQZhAnqGGbR7oigkCVvdJIUoD6vw4qpJHbTrt2va7Sy6MNvYFdcTEmAfWebWU
         KosJj7d9hk1akBU2B5l17apk4ECwqM8oDizY2snYOPdsDikH4tvSWSBzc3pSMFLk8i+m
         ALTBiEFhZodyCUH4WAJGMrkm2I8WD+orwoKTFZ8brv+T8wBizXLt2fgXpBeAZ3XxCOJl
         BJz+QeDI5YPaGhSKmn24mEbFR6p69fvCXpxswEHdBSN5HpCOvDeiOKOrTT9LW5NmAM5T
         FpHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Ne83/KJU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18si1443075qtk.120.2020.02.07.05.37.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 05:37:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Ne83/KJU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j03od-0003we-MU
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 08:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33890)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j03oJ-0003dW-R7
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 08:36:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j03oI-0000w2-KW
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 08:36:43 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40727)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j03oI-0000tc-Dk
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 08:36:42 -0500
Received: by mail-ot1-x344.google.com with SMTP id i6so2136038otr.7
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2020 05:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mFKOQXnbjPCOHC53DmP31TRPNZG4/glAvd2SjGayMKQ=;
 b=Ne83/KJUTxzMZeVvAeY1MQdKNafUoc354vYjf+6GvKHmOObKHGVh/UbNaRXhsA9Ffx
 wxC99Rmhe+2PFbT+O4evSXYQgVPMIeqSOck0ewEgWmOuJh8iu05pMyN0tQVTLz4IVXmv
 P3Z5xSySKsApeVYIm7wDCyed+ZNSM77TjI5EX/JyZNFVSCmDn/ES5gSg3f2ofG4pnzNC
 cqCnj0dX6Pleh+jNj9JemLVu4qF8H1bKtmVTWkPENlj0jyR+hbMSeI0Vlf9QtD+SX1sA
 nIvQjWBcvlNzVa0n94ZCWkc1Fyl5c3ABn9YkyzbhW6mL+rYt7F9nl26/OwuYvHbhQIqy
 VH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mFKOQXnbjPCOHC53DmP31TRPNZG4/glAvd2SjGayMKQ=;
 b=aw9vE5dxtog2M9Yp4bPyAlP4SmN1PfgNk1NI56lIXQm9j3A4mgTtr+xvdT7eo7FI4d
 ca8oMx4dB8o9eCuWEl0MGrd3dF32aVsjMy7IPpPYrm+Gk86iUzi14YrdddOLLHBU7Qfr
 /F+zDNN2alyeu3g9SoejAUDqBEMjO/u9JWh29aeSCFoehya75ODjwnSUBKFLOMarMQKL
 sQQ1275emPr/55Qtk7ofNwQc90Bv9CbH1t/44dk3MvSy7O/zwJoH8YajKAPRTq+g6IY/
 hocM9GHgENV8s7ju3bibNjbc5PxdqI15SW1604ce5EJ91eZMe+ZBke24yn9y7q3f6E89
 EIHg==
X-Gm-Message-State: APjAAAWGvbNOwQEhp5SwPXGfW9P4CqJFOi58+ABpibBzNVjihhCskU1C
 ExycLucxidJtbYvLUsszyEO6QVUZ4uzr9cMnhO8XLg==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr2543438otq.97.1581082600069; 
 Fri, 07 Feb 2020 05:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20200206225148.23923-1-philmd@redhat.com>
 <20200207082643.m7pkyjbx5h2o4zh7@kamzik.brq.redhat.com>
In-Reply-To: <20200207082643.m7pkyjbx5h2o4zh7@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Feb 2020 13:36:29 +0000
Message-ID: <CAFEAcA_yEgCtTR3MJ6-co0uHbckUkvduHFi3yiqYV-N-M-ZUUw@mail.gmail.com>
Subject: Re: [PATCH v2] docs/arm-cpu-features: Make kvm-no-adjvtime comment
 clearer
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AXHoOgmXmn6T

On Fri, 7 Feb 2020 at 08:26, Andrew Jones <drjones@redhat.com> wrote:
>
> On Thu, Feb 06, 2020 at 11:51:48PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > The bold text sounds like 'knock knock'. Only bolding the
>
> Who's there?
>
> > second 'not' makes it easier to read.
> >
> > Fixes: dea101a1ae
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> > v2: Removed unrelated hunk
> > ---
> >  docs/arm-cpu-features.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
> > index dbf3b7cf42..fc1623aeca 100644
> > --- a/docs/arm-cpu-features.rst
> > +++ b/docs/arm-cpu-features.rst
> > @@ -185,7 +185,7 @@ the list of KVM VCPU features and their description=
s.
> >
> >    kvm-no-adjvtime          By default kvm-no-adjvtime is disabled.  Th=
is
> >                             means that by default the virtual time
> > -                           adjustment is enabled (vtime is *not not*
> > +                           adjustment is enabled (vtime is not *not*
> >                             adjusted).
> >
> >                             When virtual time adjustment is enabled eac=
h
> > --
> > 2.21.1
> >

Applied to target-arm.next.

> Not-Not-Reviewed-by: Andrew Jones <drjones@redhat.com>

:-)  but for the purpose of the commit message I've dropped
the 'Not-Not-' prefix, since we want to have a standard set
of tags in commit message rather than a random accumulation.
(We really should make checkpatch warn about nonstandard tags.)

thanks
-- PMM
