Received: by 10.28.173.206 with SMTP id w197csp909738wme;
        Thu, 11 Jan 2018 11:21:59 -0800 (PST)
X-Google-Smtp-Source: ACJfBosuKqPmeZnkyhqfCaIPQxc830hVlj+wG4m5zP5Ki3ZvzEG5eqUvA152I/jYr2rWQbKQzHEa
X-Received: by 10.37.64.66 with SMTP id n63mr17272626yba.106.1515698519108;
        Thu, 11 Jan 2018 11:21:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515698519; cv=none;
        d=google.com; s=arc-20160816;
        b=lnXofa5nCViFwKQI5hJ9eWziGsHopY2x2XNuVDjV71TOR/MKZR12DaWlkdZp/1bUkO
         ZGg2DYZ/0yEhnn346DAeYLToI2+OpVD+u95tF3hy0juEk2wUTkm3BbrWHBnIUiOTVfe+
         cwywH8gbOaD+DD3l0C6ymE4hyUF6GTQJHBd9oSKm0W+h+RKnT3wjVq2E/Cqkaqq04yya
         oY36BfEf/GkEF0/Uvbc7DIukYDvAXDQqeRC9NacZoImnXy1dqqcws8kt1sOTaNQENTAi
         U9uR9ZAHXIhZs+YOr2tq/01pJBcbMF+gUIFhE+h9is5ANNnpl3Ok2Jg5ae8qpEG4ZcWj
         /ZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=x+yvAi8W5I3o32rCdltfGXc27H96UaA/zBpmraxDsn8=;
        b=jceY+7fVQ4M5o/mCgw289DpkVac+mcKHT0YfWhqxOL6XFeI4L4d9xZV9qThgzWWxmq
         v7Y3S3PkoanMUjO0UUIReH6iIvwaIR2/J0OsS2IyKoNH4ByEr1pC6wle4LQZs47vMhGx
         HNb8ONyZUZD4/tXHTHqRSoDHJKHL6Oz1zFru3Vy48l2QCvIVfFgawfp1tMFHYFAffVB7
         SoWmaSO5buYw/47Ai80Eg3LFJjjyjGnPXFq3he+Ph/QZn8Xv1PVEOHPVlJPlN0TldKr0
         edNW7JCiD3e30+MMOCZAQLKlfDK/naU/GUgFLgdxqtjWiv940MfA/p69engPvG3E+g4/
         f8NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LXjaQyuv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x68si4034174ywe.586.2018.01.11.11.21.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 11:21:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LXjaQyuv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZiQI-000692-IX
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 14:21:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZiQ9-00067k-J3
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:21:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZiQ8-00046N-N8
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:21:49 -0500
Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235]:44127)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZiQ8-00045m-H8
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:21:48 -0500
Received: by mail-oi0-x235.google.com with SMTP id g128so2361871oib.11
	for <qemu-arm@nongnu.org>; Thu, 11 Jan 2018 11:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x+yvAi8W5I3o32rCdltfGXc27H96UaA/zBpmraxDsn8=;
	b=LXjaQyuvpqZyaVMfMCYvhXqLEytoQTe4w/Co8TDxbTk1LXvClrP3tKSVXn760wpjtB
	wd1s/UzHbm8nVZugoXY4/qrM/dCi7Ds09TOfs/38tSVOmO56eiLoFznm/jM3bh7HwFXC
	MxZAzXlzgwjr8bc6TGAMQARoqc20B59eGozNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x+yvAi8W5I3o32rCdltfGXc27H96UaA/zBpmraxDsn8=;
	b=lo3k9XGGz/ZcO7oOBlds3iyGob2NVfxi7/RcKD0tKWM+gCDGJ3GWXtWveIvLYxrqj1
	jC8d8IuKfy+5qZiu5NiTcKjEwmkMb/jt9YSLajItpVO36Sy7H2KjtZGRtbQLYNnouUWW
	ol+885P+CzYGA9RzqQ2UCm/7wAlpZw1i1epli/bncNvoyAlNP+U3+H15QZFBjFmmjt+A
	iMW8EZTB+AAsnFnxxWpJHsdvX9w+im2KVBR+iSp/Bpz1EURHpoLCo7KiEoAvmIw6wz54
	vP2XunFmbGCXjT/oZUso/QLCGHzEWPMB9i++gtQW6cXFciA15Z09dfXkyH/OOm3zMwsZ
	JRCQ==
X-Gm-Message-State: AKwxytcB8BliHYDNzeWxhDmCchS/hCkpBURo8sMYp0qxB+j4vF7zQFr2
	cvLXljkGMF3yqhDcPOmSpyMBG+TrB8C53+zpgDbUuw==
X-Received: by 10.202.244.131 with SMTP id s125mr5183688oih.327.1515698507766; 
	Thu, 11 Jan 2018 11:21:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Thu, 11 Jan 2018 11:21:27 -0800 (PST)
In-Reply-To: <3ffa6112-d2bf-df10-c8ee-e96ead760359@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
	<20171218174552.18871-2-richard.henderson@linaro.org>
	<CAFEAcA_zoqWwAhg5PhuUG=xkRuC3uwT0MF7D3NOvEFg0Z3yKMQ@mail.gmail.com>
	<3ffa6112-d2bf-df10-c8ee-e96ead760359@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jan 2018 19:21:27 +0000
Message-ID: <CAFEAcA8QxgaaLNc_+-5M9D8LQCp3mkUBmfZpt4Gq58DtKgtGCw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::235
Subject: Re: [Qemu-arm] [PATCH 01/23] scripts: Add decodetree.py
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
X-TUID: fHgTl44xYSHF

On 11 January 2018 at 19:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 01/11/2018 10:06 AM, Peter Maydell wrote:
>> On 18 December 2017 at 17:45, Richard Henderson
>> <richard.henderson@linaro.org> wrote:

>>> +# Pattern examples:
>>> +#
>>> +#   addl_r   010000 ..... ..... .... 0000000 ..... @opr
>>> +#   addl_i   010000 ..... ..... .... 0000000 ..... @opi
>>> +#
>>
>> I think we should insist that a pattern defines all the
>> bits (either as constant values or as fields that get
>> passed to the decode function). That will help prevent
>> accidental under-decoding.
>
> Hmm.  What do you suggest then for bits that the cpu does not decode at all?
> This doesn't happen with ARM (I don't think) but it does happen with HPPA, and
> probably others.

Arm does have undecoded bits (they're in brackets in encoding diagrams),
but they're UNPREDICTABLE if you don't set them right, so ideally we
check them all and UNDEF. Our current aarch32 decoder doesn't always
do this, and it's non-obvious when that happens.

> I suppose I could either wrap it in a field that the translator ignores, or
> choose another character besides ".", e.g.
>
> mfia            000000 xxxxx 00000 xxx 10100101 t:5
>
> where bits [21-25] and bits [13-15] really are ignored by hardware.

Yes, I'd like to see something so that if you want the translator
to ignore a bit you have to explicitly mark it as to be ignored.

Something I noticed the doc comment doesn't mention: what's the
semantics for if the patterns you declare overlap? Is this a
purely declarative language where you have to make sure an
insn can only match one pattern (or get an error, presumably),
or is there an implicit "match starting from the top, so put
looser patterns last" process?

thanks
-- PMM
