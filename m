Received: by 10.28.173.206 with SMTP id w197csp871735wme;
        Thu, 11 Jan 2018 10:46:35 -0800 (PST)
X-Google-Smtp-Source: ACJfBosDgGDadMdq76q9ZHwwxmh4kLoB/X8aPa6vrZy5EEQJ1NTwXkU6KX57Rewzy03U6SFjjbp1
X-Received: by 10.37.186.18 with SMTP id t18mr11239443ybg.443.1515696395086;
        Thu, 11 Jan 2018 10:46:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515696395; cv=none;
        d=google.com; s=arc-20160816;
        b=bgWjsPm2d6TEYIQ4yaK3gwa66cR+VhfgmxJBWbYD0I/pNpe+NALbDGzXvXYH7DctnS
         fip+MQPzDMGV+jW3kmI8EapWzAwtmmpq9Q2PpR+8nx9nmxbf/nrlNasJNfiuBnc3dRud
         p5LT0luamKiTlrOA/VbopmHrMbJFfBXwKMM3p+0opb66mVH1J95oXISXIXtmAVtCJM7N
         ai53eobjIkU9lfZtu3hjqnTC77+lzJQxPNdzGzHhhFpHBxGNcJdX+TWluAOjVnPqu/aM
         XVAdZOQ6j2gt2wkF+f/D5a1ulJ7671cgjeoTmA551nwZfY4rqKLEm03RfACSynkuRnuB
         EngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=g0LFm9adG/3a986IZP4mfX9Ie4j+BYYEM+tnPQL90Tk=;
        b=NMpq5b27MbdbQ/GqZmQ1pC+KLJNGCDSyVfiygtF0XLiN3K9DR4iLD/bHNvZ5/KOuKE
         Uw5FSHEtV00q+Ku8P4Arf0QZEm7yZIwF4wiwSgAyXNWjyY0WQJ1OtLKD9YwnmaAh2jDd
         KD2Ajn3yk24itNpHWSzxte4tXVPcykZhsVPe7QluE7V13Apk2oCL7ik0rOmL6/1tEwbM
         +2os69fL+8F07qDMgXoo0oF9ubROdArND3kuD6qUOkfYrpMPCnvssQwIIRPp7BoJ/YiA
         d6k21JU29j/A6uQM9uuQ2X38sLIOi+jtWKUDm5rl2eShw6dp9B9zVd1+YW5mc6kiKmqP
         5Vpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kwlOM8/v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s19si2629881ywa.174.2018.01.11.10.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 10:46:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kwlOM8/v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33876 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZhs2-00060p-FD
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 13:46:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhrm-0005yz-Sm
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:46:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhrm-0007Yn-5E
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:46:18 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:44941)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZhrl-0007YP-WC
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:46:18 -0500
Received: by mail-oi0-x243.google.com with SMTP id g128so2286609oib.11
	for <qemu-arm@nongnu.org>; Thu, 11 Jan 2018 10:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g0LFm9adG/3a986IZP4mfX9Ie4j+BYYEM+tnPQL90Tk=;
	b=kwlOM8/vDOmYZj235N1+XyJj4skxBGqvbyS07x8pGnjra4EQ4a6r0J71xMxY7AFRxV
	DcLQlSIinJcYxuT2Zs90lJEd1lH+Inm8pXjvUNcL+5dTdr+H5jm5CQ4R8is1ezaWuXtT
	/WuNv54HNnRUZDINTwAV6p2i1DvweECBPZxQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g0LFm9adG/3a986IZP4mfX9Ie4j+BYYEM+tnPQL90Tk=;
	b=G9shj0boU+0MOyl+pT9IOop3uxt/2w7AH8HZVKgtkMK+GFDGQmr9f1dmfWON9+1RMy
	Khn1Qr3AsnSS8gZMARHPfhcJU4wOKedwAWFzTuAA+COlJRanke2D1f7kpG8VepnDDceR
	et90k0+eJlcrW8bXfLIto74vfSb+s9aC4L6Q7ho8uRV4nDlEDcMMqWTsAFPU20qZIJnu
	oGlStQRHLZL9Z/gd+fhEu8VJsGnTnEuvWkw11m1N3aObz67a+Kbfj0Y2YOTIxV6Bs3Rh
	aIyjZhdERJgiXaT/ykb2qywVhk78rIb1i3/NJEsSYUmYxDQ8Srio+cI1TL38G9x4d07m
	f/sw==
X-Gm-Message-State: AKwxyteSRIAZW0zb66GAqGzPo2JO5BmfCNzEWYhaFgVjLvO6yhW7Z5br
	8dst3EaGqdzzgnNDUJS35HPzfFAtKyQe1cC+elaypgbd
X-Received: by 10.202.53.84 with SMTP id c81mr6697228oia.63.1515696377285;
	Thu, 11 Jan 2018 10:46:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Thu, 11 Jan 2018 10:45:56 -0800 (PST)
In-Reply-To: <20171218173022.18418-3-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jan 2018 18:45:56 +0000
Message-ID: <CAFEAcA8j3bOeVz7ptUKaxS=jVaeqaBrQRwhpHAzPARvUd7SPgA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH 2/9] target/arm: Use pointers in crypto
 helpers
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZPESblj/cVAX

On 18 December 2017 at 17:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Rather than passing regnos to the helpers, pass pointers to the
> vector registers directly.  This eliminates the need to pass in
> the environment pointer and reduces the number of places that
> directly access env->vfp.regs[].
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        |  18 ++---
>  target/arm/crypto_helper.c | 184 +++++++++++++++++----------------------------
>  target/arm/translate-a64.c |  68 +++++++++--------
>  target/arm/translate.c     |  68 +++++++++--------
>  4 files changed, 154 insertions(+), 184 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
