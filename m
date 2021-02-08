Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1483503lfc;
        Mon, 8 Feb 2021 12:41:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCfuBtB8Oey2bhzOf5MWs+taLWVS/fbpufF8dWKYQAgktXYhCJ7o73Svpf1BP7Oi8GZPM9
X-Received: by 2002:a25:dec2:: with SMTP id v185mr26298583ybg.145.1612816916098;
        Mon, 08 Feb 2021 12:41:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612816916; cv=none;
        d=google.com; s=arc-20160816;
        b=WiJ760/2ZO6MgwH0aAmN5T7sHOhzLaNc9pJQLVzkgMJiaB5VKkX+tKsKPHIFqgoo2w
         JD6Eb42+6AldiPsUKKlmzE10ZR0EYlxGoBt7jb1WUNDASdt/C6mFbGTiL+66GC1RIY4r
         fGSvl1xuOvOywNJTJSqr3JVfi5ITuIckne4rny681Iemnag1g+r0S9tuxbj2cRQxhItB
         511FTH+iVeZWjmDdM42GX1jyCumfeujeyuuEyi7wfbD/b0E9+SbO7mOA+IaN0Gek0H39
         2xEIUocaHzH67KLSB5dMvqNiztE/ANkWWk6poOPMh0EpEAFAYJSQO2eRcoQG9Is2Q9Me
         6aBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cl7P+KMXiC0bvsw4/BGl+7Ou86i/DCTyT1IdtL/U7ls=;
        b=Dg/nvBdSe2JhWPwywnNyeKjHuFyxeUqX2sszL6zu69Ldf942DbuF1asgO10vc8E5cH
         91wMg1pic9VO8K8KO7dO0CVqNOrtLNKPYr3JLCTWvLEOQk9jpC0pUBB+9xsHIk9Cb27b
         /94MotL1T42PHG4+jBOFa29JUgKCB5iAjWfqoQocHc/bQjtt5QvSLonV4P2ROXm/Z3sI
         EcRMppwrHjdkBIJrVNp3rNmD2D0XqCHYg8ERJ5cWhwjKR09JCL5WQrupX+rDntjLH/tk
         1LCZALLv6W7bVE3vLEYCe6euQaU9SeZ3xiKSD/5hX8Bwrm3vDVhPTTMXQRmcZvnHfdsA
         wt7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uEIG+wwv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9si20423375ybn.264.2021.02.08.12.41.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 12:41:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uEIG+wwv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9DM3-0006NU-Gc
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 15:41:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99U9-0002aa-2H
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:34:01 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:44069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99Tv-0002TX-2r
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:33:59 -0500
Received: by mail-ej1-x62a.google.com with SMTP id w1so25772745ejf.11
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 08:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cl7P+KMXiC0bvsw4/BGl+7Ou86i/DCTyT1IdtL/U7ls=;
 b=uEIG+wwvSU4e3K6NVlpwASdNoC1fz8G0TTagCOYRpuT9Oq0Pg8sYM6I8P+jufy8qGx
 cdrd1wM26jMuIEXLKDBX7aU0l1OrTXGdNw+zII/JQZOKdsTbeIgX5moX0holFC0ROlip
 M4X6fBoRVqX9fLcOv9lDgn5x85Jc8vxaW2aZgC5vL8wFEJaiusLViVkFMuaB025FiWUc
 1Lb8pco7KQ0ilwjOOOUDRCmf1mGRi7pejthfkReQLQKKU1J+aEHpfz64WOETfalJmrPw
 dGCRbg38rNlXWfFudOC5CNbEqpgJQbU1t3oBVJgRH+U7SlYFoYHPu9JkgAvN7rhetb9n
 xYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cl7P+KMXiC0bvsw4/BGl+7Ou86i/DCTyT1IdtL/U7ls=;
 b=XCI48Dwnd58Pj2BkiBadNhcfZ0DImRQFC5hXZrgihLn/qKFKNv4c1Q0LDFxzrz9YCs
 CEAiLGc7D4KCbKIEOZK22oCPr5qTVx4a1QTRzpsKyszd6BhPkscO+muxJqmrp+BAWjNU
 uhA0DRvDE05Dty3jGUmT10cWMfLTDMtcpy1UaW1EaR+42WQB9kV03CaAff+OWIw1XWQ/
 BrJoACjmxG7Owje89XWGh8ueUbi0s7ec5mtoBy5k2OioDr/i6PH4V1rSqFSwaLNH/dS/
 AUbjMYARHSCzrcXhEYp5aWVwWaGybpTp2l6nkh2bmbymGPQbf9x2X6ADAvvSfoJC6u9c
 U7Lw==
X-Gm-Message-State: AOAM5316ICKZR8iEXZfPwU2RrSCKSjeHRmJHIDVy35W+uJksZ04SKKsz
 B3IMV9eJr1nHQtrK5KU8p+10isuC2R1athZYgp7Htg==
X-Received: by 2002:a17:906:b4a:: with SMTP id
 v10mr13392179ejg.382.1612802023834; 
 Mon, 08 Feb 2021 08:33:43 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-14-richard.henderson@linaro.org>
 <CAFEAcA9JC=j4iwr9kuT262s=QonM=y9uTmcJ3Xq3mkM_nrgj2g@mail.gmail.com>
In-Reply-To: <CAFEAcA9JC=j4iwr9kuT262s=QonM=y9uTmcJ3Xq3mkM_nrgj2g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 16:33:32 +0000
Message-ID: <CAFEAcA9UZttB8UdAMwskx75SkpNC+zKwBZe0vyYRekOCiKCmmw@mail.gmail.com>
Subject: Re: [PATCH v5 13/31] linux-user: Explicitly untag memory management
 syscalls
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CGaf+yBvAjZ9

On Mon, 8 Feb 2021 at 14:10, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 3 Feb 2021 at 19:00, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > We define target_mmap et al as untagged, so that they can be
> > used from the binary loaders.  Explicitly call cpu_untagged_addr
> > for munmap, mprotect, mremap syscall entry points.
> >
> > Add a few comments for the syscalls that are exempted by the
> > kernel's tagged-address-abi.rst.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  linux-user/syscall.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index 748893904e..4451f8e4f0 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -889,6 +889,8 @@ abi_long do_brk(abi_ulong new_brk)
> >      abi_long mapped_addr;
> >      abi_ulong new_alloc_size;
> >
> > +    /* brk pointers are always untagged */
> > +
> >      DEBUGF_BRK("do_brk(" TARGET_ABI_FMT_lx ") -> ", new_brk);
> >
> >      if (!new_brk) {
>
> It's not clear to me from
> https://www.kernel.org/doc/Documentation/arm64/tagged-address-abi.rst
> whether brk() pointers are "always untagged", or only "always untagged
> when at stage 1 of relaxation"... Unlike shmat and shmdt pointers,
> they aren't listed in the section 3 "must be untagged regardless
> of the ABI relaxation" part of the doc. I've asked the kernel folks
> for clarification.
>
> Same applies to mmap() and mremap() new_address.

I got back the clarification: these should have been added to
the section 3 "always untagged" list (and they'll update the
kernel docs). So this patch is correct.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
