Received: by 10.223.188.70 with SMTP id a6csp4641812wrh;
        Tue, 22 Aug 2017 02:04:24 -0700 (PDT)
X-Received: by 10.46.25.153 with SMTP id 25mr7280437ljz.171.1503392664261;
        Tue, 22 Aug 2017 02:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503392664; cv=none;
        d=google.com; s=arc-20160816;
        b=Mdn2mS1jcd2Cu0K939mLT0RPyBcbyyTf8PXCB6fZ7h0QqXia5E/z9GjH0PaZK/BwI4
         Pocv4xBy1sWYITr3QUWYqf4G7g5d0brhg95Qo4ByEwe4YWhW8Mzfcbst+YyV7zoZHUws
         LG8O3J9+DFGFFrXBhy0jELOSwW6G++4IY71m3ndYLucsYLo87F/TDzcBRXSzZ+E1Vr23
         Z0sgnrMUwhji1++CG6Dyl/pk0fYGNQDnqIblgzwDmqrf2zO8l1betg29GG/vZzQ8COGG
         TsBOF24CtMyMrEyRcEZVV3fqXiGlPbvg60pGEQJN3Qa31wDYKicfCpAzr6lmza5yNVju
         kkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date:arc-authentication-results;
        bh=XG83PLl3Wjx2QNb42v5rMGxkCFoD7hzzpewWTpGXcmU=;
        b=LXGo1Trkr0TciDXOwWMXb9TCJ65rPEGBpYlTkuih3nynUCRyk5aLlvIZfWuIWrh4Op
         yqSVFmTBkUtUDv4lMmppc5FNK3Ymc8x61lvexGnSXYP65kbdqzKVkO/fg3rCsXdlfmGs
         1vvdBIUdGK5iIPhsSaaoJPenqLwhNJxwNQAPhA6vjFD/qfB1fwKnwH/1HNkbsRf8uYfa
         Armq69e+l2+5WUFlNWR+yTuEkz71kZzR7+QiqyIsCVIVp++pansbbYG3XjlFHdhSJbve
         +xTNI06x04+6aQBoMnRvu0SdA2uz3NHerRONI/HC2k7FIly3Ni6lGaHLXkJEhWkRjDpN
         IhPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of batuzovk@ispras.ru designates 83.149.199.196 as permitted sender) smtp.mailfrom=batuzovk@ispras.ru
Return-Path: <batuzovk@ispras.ru>
Received: from smtp.ispras.ru (bran.ispras.ru. [83.149.199.196])
        by mx.google.com with ESMTP id r8si5567949ljd.435.2017.08.22.02.04.24;
        Tue, 22 Aug 2017 02:04:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of batuzovk@ispras.ru designates 83.149.199.196 as permitted sender) client-ip=83.149.199.196;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of batuzovk@ispras.ru designates 83.149.199.196 as permitted sender) smtp.mailfrom=batuzovk@ispras.ru
Received: from bulbul.intra.ispras.ru (bulbul.intra.ispras.ru [10.10.3.51])
	by smtp.ispras.ru (Postfix) with ESMTP id 9F6E15FB48;
	Tue, 22 Aug 2017 12:04:23 +0300 (MSK)
Date: Tue, 22 Aug 2017 12:04:23 +0300 (MSK)
From: Kirill Batuzov <batuzovk@ispras.ru>
To: Richard Henderson <richard.henderson@linaro.org>
cc: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, cota@braap.org, 
    qemu-devel@nongnu.org, qemu-arm@nongnu.org, rth@twiddle.net
Subject: Re: [Qemu-devel] [RFC PATCH 0/9] TCG Vector types and example
 conversion
In-Reply-To: <64af762a-5d2b-5e33-fc8e-18244b0c6586@linaro.org>
Message-ID: <alpine.DEB.2.20.1708221128110.2770@bulbul.intra.ispras.ru>
References: <20170817180404.29334-1-alex.bennee@linaro.org> <alpine.DEB.2.20.1708181355080.2770@bulbul.intra.ispras.ru> <64af762a-5d2b-5e33-fc8e-18244b0c6586@linaro.org>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-TUID: rthgGlfFrG7K

On Fri, 18 Aug 2017, Richard Henderson wrote:

> On 08/18/2017 04:33 AM, Kirill Batuzov wrote:
> > From my own experimentations some times ago,
> > 
> > (1) translating vector instructions to vector instructions in TCG is faster than
> > 
> > (2) translating vector instructions to series of scalar instructions in TCG,
> > which is faster than*
> > 
> > (3) translating vector instructions to single helper calls, which is faster
> > than*
> > 
> > (4) translating vector instructions to helper calls for each vector element.
> > 
> > (*) (2) and (3) may change their respective places in case of some
> > complicated instructions.
> 
> This was my gut feeling as well.  With the caveat that for the ARM SVE case of
> 2048-bit registers we cannot afford to expand inline due to generated code size.
> 
> > ARM (at least ARM32, I have not checked aarch64 in this regard) uses the
> > last, the slowest scheme. As far as I understand, you are want to change
> > it to the third approach. This approach is used in SSE emulation, may be
> > you can use similar structure of helpers?
> > 
> > I still hope to finish my own series about implementation of the first
> > approach. I apologize for the long delay since last update and hope to
> > send next version somewhere next week. I do not think our series
> > contradict each other: you are trying to optimize existing general
> > purpose case while I'm trying to optimize case where both host and guest
> > support vector instructions. Since I'm experimenting on ARM32, we'll not
> > have much merge conflicts either.
> 
> I posted my own, different, take on vectorization yesterday as well.
> 
>   http://lists.nongnu.org/archive/html/qemu-devel/2017-08/msg03272.html
> 
> The primary difference between my version and your version is that I do not
> allow target/cpu/translate*.c to create vector types.  All of the host vector
> expansion is done within tcg/*.c.

I took a look at your approach. The only problem with it is that in
current implementation it does not allow to keep vector variables on
register between consecutive guest instructions. But this can be
changed. To do it we need to make copy propagation work with memory
locations as well, and dead code elimination to be able to remove excess
stores to memory. While in general case these can be troublesome if we
limit analysis to addresses that are [env + Const] it becomes relatively
easy. I've done similar thing in my series to track interference between
memory operations and vector global variables. In case of your series
this affects only performance so it does not need to be added in the
initial series and can be added later as a separate patch. I can care of
this once initial series are pulled to master.

Overall I like your approach the most out of three:
 - it handles different representations of guest vectors with host
   vectors seamlessly (unlike my approach where I still do not know how
   to make it right),
 - it provides better performance than Alex's (and the same as mine once
   we add a bit of alias analysis),
 - it moves in the direction of representing guest vectors not as
   globals, but as a pair (offset, size) in a special address space
   (this approach was successfully used in Valgrind and it handles
   intersecting registers much better than what we have now; we are
   moving in this direction anyway).

-- 
Kirill
