Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10909419wrv;
        Thu, 25 Jul 2019 10:58:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVNGEwElWLrSfCO/6gNcyqnQQ+nqIVp/DJ65VgJudnhGBlBKrJRuMSeM8HfCOP0mOddNR3
X-Received: by 2002:a17:906:ad86:: with SMTP id la6mr66155674ejb.43.1564077487715;
        Thu, 25 Jul 2019 10:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564077487; cv=none;
        d=google.com; s=arc-20160816;
        b=vIIofIxjybPeNAJJcAriRBpULbqPlpxkr7zwOF2dl/IscYJhAH63n46VYScIsL4rDp
         iu1X/zCDVfPM6R3Q7Us/RTuvmpGT5C9cCODKgdcZ3Gp0vF7REx6/e8PrnKN3Nl2EmClY
         gdDFpNoiTHlGY+RCM/mG3SBDT8OEzBem8Yo0JAkaV7Ec+Xwg+1AiM55Nd0Zcsg+kYhvj
         AMNrR7io7bs1oW78figvWNdkrka8CnpBwuk7ys308fEi5K7UhAwIQMfZX5j2vpQnMRBM
         /ByZgS/SUshq00JL5fwU35Er4/rOY2nUitwJdxhz71gM43TzK5CzqStAr4OLSzC14X7x
         ffwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SrvQJHhbgxkTfVbg9JKYbdlPyaIOvl90pvGXP3Jzbgk=;
        b=gJCFYB9C5WqeNTfOzpjcOMWKq9G/OX8pqKyYom2u7LTcwcbUn0X+FLUfHJ1MCPR1+s
         UtMDvmLqSu2+ybBABFKf4EIQ4JOu2F6yvpdFNMHOIVmkdyg5Y0sN/URoxzB4THfQ5twR
         3mSBPAL1q6mi0hPKj13cRBfoMCScB11uMzvlMFGQ/sxAwKVNhVj/Kpy+VKZPFseYq0Bt
         gFVvGem6Dxaqknjt+IzZysGyImMa3iO8BJfRY8nAzWwbH8zRtK1uiu3+gXjjal2/ZgBD
         mCBw9CWYxUHLGctX+hpchHw+yct9UYhFsMGza+1gVvfrN5//f3dGXuYZ0/WWZQNtUINC
         g6dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GX1nDeta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8si11464246edm.69.2019.07.25.10.58.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 10:58:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GX1nDeta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqi0E-0007Ts-HN
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 13:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41424)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hqi0A-0007Sc-87
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 13:58:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hqi09-0006yj-2q
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 13:58:02 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34494)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hqi08-0006xk-RO
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 13:58:00 -0400
Received: by mail-ot1-x343.google.com with SMTP id n5so52608767otk.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2019 10:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SrvQJHhbgxkTfVbg9JKYbdlPyaIOvl90pvGXP3Jzbgk=;
 b=GX1nDetatmNCIBdmRL638ibfMja/6Mv4BkyLI/P8fLhSn3DHelryc8tp5wviTefEga
 RbHoE0WNWoSk7zTvKs+GhfpFP/HcLHYCe0Hnovoz3bKeq48bXAiPlCQsdSIb3L53umt0
 pMU8dFEwBFORmHsFk4MkvoCuCYRANlLekqbphzpbmRJwxOVKwVPLtKEEpjtgM4vcqX/M
 /6CrELeD2bp0doZcsHWAJhHZ4OSelYt/qGjFWL2V9m9U+CExaZ1WSMqITnhrlBNx4RX6
 w4LGhQEF+atBNbHEdl4Pu+2StWHK/u0KX2Jd5CPyn5VwV8hC94DdoNaZwvZi+KdtjD3a
 pifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SrvQJHhbgxkTfVbg9JKYbdlPyaIOvl90pvGXP3Jzbgk=;
 b=L6w4B85YpwhlgCj3ozisCcjQo0pn0EWkrKDN6vrVhS2bCNiyGxq1y686oW28Fs7ZtK
 yFj2ZrJ0Mypu4CaQDoiyCrnetsSsIL895EyXKm9m+E5eohdvGDhJ0Ns0vSYnZwZKOdVd
 g7gULciOZ6eJpl+/dACWZoJYCNXcgkllP2yPdpYPPPIj0Ue5haco786QAftpo5njm41m
 f8WdPIU41YdWWjbFGhPq/zV3dCUQroABDR0msTYmCUj5TF0zhWCAyVZLtZgdVAhFSqQk
 YUN/xNWiRZo1NT94IOk6PzmEIGDsSG3A49xq+UtdqXSJluJqF7Evmz4Mr4eo06/ARLTc
 9mqw==
X-Gm-Message-State: APjAAAVJt3g4tYZbJcX1efIr+C/VAxGnLPmrLo1t+5Mv6xa3Cc1pLsaq
 Y+bYnPebTlOq5s2vB3iwMBENQQcAaiYLuEtMt1JdpA==
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr7769782oti.91.1564077480022; 
 Thu, 25 Jul 2019 10:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-3-peter.maydell@linaro.org>
 <20190725172712.GM2656@work-vm>
In-Reply-To: <20190725172712.GM2656@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jul 2019 18:57:49 +0100
Message-ID: <CAFEAcA-jGvNS4N4qobLekHYdV82qSUWVQOvTRQbrpcCRF0Yvwg@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH for-4.1? 2/2] vmstate.h: Type check
 VMSTATE_STRUCT_VARRAY macros
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /n7DOHaVWnQV

On Thu, 25 Jul 2019 at 18:27, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > The VMSTATE_STRUCT_VARRAY_UINT32 macro is intended to handle
> > migrating a field which is an array of structs, but where instead of
> > migrating the entire array we only migrate a variable number of
> > elements of it.
> >
> > The VMSTATE_STRUCT_VARRAY_POINTER_UINT32 macro is intended to handle
> > migrating a field which is of pointer type, and points to a
> > dynamically allocated array of structs of variable size.
> >
> > We weren't actually checking that the field passed to
> > VMSTATE_STRUCT_VARRAY_UINT32 really is an array, with the result that
> > accidentally using it where the _POINTER_ macro was intended would
> > compile but silently corrupt memory on migration.
> >
> > Add type-checking that enforces that the field passed in is
> > really of the right array type. This applies to all the VMSTATE
> > macros which use flags including VMS_VARRAY_* but not VMS_POINTER.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> > ---
> >  include/migration/vmstate.h | 27 +++++++++++++++++++++------
> >  1 file changed, 21 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> > index ca68584eba4..2df333c3612 100644
> > --- a/include/migration/vmstate.h
> > +++ b/include/migration/vmstate.h
> > @@ -227,8 +227,19 @@ extern const VMStateInfo vmstate_info_bitmap;
> >  extern const VMStateInfo vmstate_info_qtailq;
> >
> >  #define type_check_2darray(t1,t2,n,m) ((t1(*)[n][m])0 - (t2*)0)
> > +/* Check that t2 is an array of t1 of size n */
> >  #define type_check_array(t1,t2,n) ((t1(*)[n])0 - (t2*)0)
>
> I'd have to admit I don't understand why that does what you say;
> I'd expected something to index a t2 pointer with [n].

Note that this is just a comment describing what the existing
macro does, as a way to distinguish its job from that of the
new macro I'm adding.

What happens here is that t2 is a type like "foo [32]", ie
it is an array type already. t1 is the base 'foo' type; so the macro
is checking that t1[n] matches t2, where n is passed in to us
and must match the declared array size of the field (32 in
my example). (In C the size of the array is carried around as
part of its type, and must match on both sides of the expression;
so if you pass in the name of an array field that's the wrong size the
type check will fail, which is what we want.)

> However, for the rest of it, from migration I'm happy:
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> given it's just fixing an ARM bug, and given it'll blow up straight away
> I think it's OK for 4.1; the only risk is if we find a compiler we don't
> like.

thanks
-- PMM
