Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1860702wrx;
        Sun, 14 Apr 2019 11:11:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzA7mU9jeWmKppFZ14N05O0gOTrm2prhJVU8gl/9YSGWHOxp+bgr1f/o4mcP3Rz/S/Kn++B
X-Received: by 2002:a5d:6646:: with SMTP id f6mr21266720wrw.68.1555265478595;
        Sun, 14 Apr 2019 11:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555265478; cv=none;
        d=google.com; s=arc-20160816;
        b=GYWW1DBm0rdSsEf6Sv/fIFl6B24R+hS07mtPCqEkSaeZpq7YK5LBTb5UEPasMXyh23
         7DG4R2VuklDOnAcLo33URCOCiMXsf0xUurhIWd8imkZxQQK9F0eVB7a+/AiCTVrLN3fB
         ZtyXL4QlnAgicDM0mDBrTppiFx63Ze639mlvRUKa1vRtqkbrb231JWjqkik5wHEh5jf2
         dMN1+dXVqyNQBJJ3aL5zWgzwZ6BQl5iC4+p2sFMPnhrQt3J8d+2vK+CHUWpMSEu3HBJw
         ECYKMABPAA5ThD7M0wP7IBOVYrgoW53H+IkJ9m6Kw8zVDVP9+J78RatIJAU6dQkTkxdI
         PPOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nO8LYFE/9Hx6rjyYRhGcmZvZ1Aqm8Idj6Hf2lG+zelM=;
        b=X2WElexUxLqmlPo72XRbfbZ5UWjJliHtDOsvkgipoX/LOFAX9s2360WQ1veLdUho7b
         xyaEfCtoS6z/Fhg/EYBW4j2JrVW7OtxEVhICrcc0BKriugq5lvyf+GNo0h6MYJh2FAMS
         y216oMyltbQ8YbDA3G1XUFIl3g41fP8wYTEKHxDE27FQFPk5d9HiB0W47wUc+mh3tRJC
         RFK3ucK6Sooq0YSWOZsp3J3PVhVGZPf1rAlA6qjnWd07FIH++ZG+AsGrygTIJpkQeRHm
         JywfEeRHemMGBLIoOEn2k2K00YLs1SsJ4ApKQu4GCHVh+kXrgdOQ4YmgaXM6aUaed4gH
         6Mdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yEcejka2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9si31657791wrp.73.2019.04.14.11.11.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Apr 2019 11:11:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yEcejka2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:38574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hFjb3-0005au-K4
	for alex.bennee@linaro.org; Sun, 14 Apr 2019 14:11:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hFjaF-0005GC-28
	for qemu-devel@nongnu.org; Sun, 14 Apr 2019 14:10:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hFjSj-0004ez-2N
	for qemu-devel@nongnu.org; Sun, 14 Apr 2019 14:02:41 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:43798)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hFjSi-0004df-Pz
	for qemu-devel@nongnu.org; Sun, 14 Apr 2019 14:02:41 -0400
Received: by mail-oi1-x230.google.com with SMTP id t81so11932102oig.10
	for <qemu-devel@nongnu.org>; Sun, 14 Apr 2019 11:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nO8LYFE/9Hx6rjyYRhGcmZvZ1Aqm8Idj6Hf2lG+zelM=;
	b=yEcejka2gfqFklKrGw/elQHiXiq3/LxcAuF8Pvl2RSg4EV9+d2sVqamdqlFddHpc9y
	bZ7t51GJqJIlPz5zQSbgOFzYkgKcHWZpEyN86wh6H2rharrzfJ9k+HZYP/NO8rokPB9F
	AX8voPLo9AmwJDswnjrWn5dUWhipCWcfaqwVQHcg7evnygAWSzGxY0cAiXCLG9gT0baP
	faCGEVwdKGCcrUL3ABMPf9Txueyoau1gjj+44Vx1AvzeoNsdCbj33thw30xccxEcYyQt
	8FlOTVrme/Av6F2XrPHD97j3RAYWjD4HmwoDCMT+LMvR/TFUf7IMHZ1WixFlCvgctcQn
	lgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nO8LYFE/9Hx6rjyYRhGcmZvZ1Aqm8Idj6Hf2lG+zelM=;
	b=GJkQpmwbyjeUcpxID+dKKm7kqyz8hkzc4xeY/0Cb8HBuaZwHDQuzW7dUA82M8JyN3L
	98aZ8bEPDBbTrEjQtLX9IPaabEPD6d6XZhIu+AzSyJ14cDKkpjjNjymV+OPd7z2K5yB0
	b0KmWygGI5y+08R21/+BMP6h9N2LrMd5AFgHvO9u+jQKrfhzYdTBl31IF/msnzrb1F9k
	s3zb7w0nC4ZfKLSluh51toAI22wdsy9RVeDtFKUg+BBNoHVCPjgmmn+qQlImxGPYJZTh
	5fEbn0Q01kF7Y9f5hFNSB6aYS78PTZW3Zin0fO20kJywwRTX3sAZ8GMTcRV03mf+txY5
	/AvQ==
X-Gm-Message-State: APjAAAU/LE8Qazs+2WjI9ciRcVuIKcr3qYB9uzgmnb566gLOhsULWvJw
	reMNPKDbi5fy/OGdmmK7pdymvXW4eXPQFppN4LI+dA==
X-Received: by 2002:aca:c7d3:: with SMTP id x202mr15582972oif.48.1555264959131;
	Sun, 14 Apr 2019 11:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190411153942.4533-1-peter.maydell@linaro.org>
	<53930e87-3bb1-fdd5-a8fe-8603c0adecc2@linaro.org>
In-Reply-To: <53930e87-3bb1-fdd5-a8fe-8603c0adecc2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 14 Apr 2019 19:02:28 +0100
Message-ID: <CAFEAcA-dbGvhgTrBKEtx-CPS7f2NJO5X+dj=mdcm+NrkF=uynQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::230
Subject: Re: [Qemu-devel] [PATCH] target/arm: Implement NSACR gating of
 floating point
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p2ELAcVOHkZz

On Sat, 13 Apr 2019 at 08:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/11/19 5:39 AM, Peter Maydell wrote:
> > +static uint64_t cptr_el2_read(CPUARMState *env, const ARMCPRegInfo *ri)
> > +{
> > +    /*
> > +     * For A-profile AArch32 EL3, if NSACR.CP10
> > +     * is 0 then HCPTR.{TCP11,TCP10} ignore writes and read as 1.
> > +     */
> > +    uint64_t value = env->cp15.cptr_el[2];
> > +
> > +    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
> > +        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
> > +        value &= ~(0x3 << 10);
>
> Read as 1, and yet you're clearing the value?  Cut-n-paste error from CPACR?
> Surely better to do nothing on read, but set on write (to either HCPTR or NSACR).

The spec says the HCPTR bits must "behave as RAO/WI, regardless of
their actual value", which I interpret as being 'we must make
read and write do RAO/WI but preserve whatever the underlying
bit values happen to be'. You're right that I've incorrectly
made it clear the bits rather than set them, though.

> > +static uint64_t cpacr_read(CPUARMState *env, const ARMCPRegInfo *ri)
> > +{
> > +    /*
> > +     * For A-profile AArch32 EL3 (but not M-profile secure mode), if NSACR.CP10
> > +     * is 0 then CPACR.{CP11,CP10} ignore writes and read as 0b00.
> > +     */
> > +    uint64_t value = env->cp15.cpacr_el1;
> > +
> > +    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
> > +        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
> > +        value &= ~(0xf << 20);
> > +    }
>
> This one does do the right thing, but better to clear the bits on write to
> NSACR.  This lets you avoid the change to fp_exception_el, and the missing
> change to sve_exception_el.

There's similar wording for the effect of NSACR on CPACR, so
again I think we need to actually make the bits RAZ/WI
regardless of their underlying value, not just force them
to 0.

thanks
-- PMM
