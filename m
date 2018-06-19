Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5416096wrq;
        Tue, 19 Jun 2018 10:44:37 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJMojdECH8ipJ2zcvnWfnBgwvwpmnmOTWaOKwTE7CoLQa63uLhrRcKZ3VrwZpmUPfrrT5EV
X-Received: by 2002:ac8:17eb:: with SMTP id r40-v6mr15902808qtk.75.1529430277324;
        Tue, 19 Jun 2018 10:44:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529430277; cv=none;
        d=google.com; s=arc-20160816;
        b=wC/+zasIxgvpdjVwW/sElJzc5kQ3wKQFm2bS9CIi4v9uhvflCAYsXbin9oygIh8msO
         b8ZXKt8+I0DttFOoRtkbhc4ruGMKlx1LsSkrcQZ+DmTdW/ClNq439ToxkiGoplwkUV5K
         NaRJnfBEqssaOP/OOwpURp6CX+U4XnJBOFTQ2uoxKIfp5C7s61saNjqyowR8pQDd0QMm
         JPGnntBVLy5REH95uK/V6zLPH1DxVBuxHDOeQvCBwk1w1qGV0faI049e6kRxv1SWpkSk
         UkymsxY1ssyVXNJniBgXaKFCSwz4aIPcESy3SWTcOkUW+RC0MywPYZ7cQO9tw6WGfWxo
         2B9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=bOXjzZGs2a/R3FDR1WwveAo7fZyADIglrCFlbO1Q4Y8=;
        b=FP2azBhv/WZgHaiaEmLwE0eEPTgIS7AIqcUZEXpKTbnZVmyuvg4TZN3M1rvhK01bv8
         eUR6uJHmAKqSinzY+J1HNmEpoVSxtbwzCz1auPmS6UpQO4HKT1gGbglJoGQE24akERfz
         nGMS12y9PcswKETQyB8idNqIXQ+W6KuyzSknG48J9JMhYGJPvUWxcF1kqnUY2bSfv1Io
         YZhfXR+1aIKGhSU2Um+Yj4qLVq7ohYZqeuct2EQ+keIxvbDsClNhAl3WOGwyrh/YLYxU
         6ScUgPW2rRfEm0KQJUH4PoiCemOa/nDEB/oNjur2EA2BZRIiMbyWT1OedTY81TPMUsTO
         vETw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=CQ3Z1p6g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v15-v6si253106qth.399.2018.06.19.10.44.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jun 2018 10:44:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=CQ3Z1p6g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44189 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVKgG-0004GH-UQ
	for alex.bennee@linaro.org; Tue, 19 Jun 2018 13:44:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fVKfW-0003ud-SL
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 13:43:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fVKfT-0000eB-KD
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 13:43:50 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:35678)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>) id 1fVKfT-0000dW-C2
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 13:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default;
	h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bOXjzZGs2a/R3FDR1WwveAo7fZyADIglrCFlbO1Q4Y8=;
	b=CQ3Z1p6g7rzCkodYGvhKhxQfKv
	FViOt7qx/YpF2hkNZ7pLkwFX6kTHFaDwPWNJexoyC/p1sO+e+wFiIQZjD/qpNfaXbbfvXtGb8ejTu
	NowwrFE9Q2U2s5RiZR/9MBHvURCuYZLuJFeXvi9n0YifYGlTyR6WX9a5gUSnKLE4nnlt4BS9jl7SH
	iK5Sl+ODxWpV9SexHMp8MYZ2NevKqwLbQ8maAYLMxoA9u+fGmWAFbBWtQQ32xqHQIP6xu7JqsrDGO
	IPWL1ua4lxQQoDJ5/D8lES06+Qy37oh5K0DWmOfUv65OP1Eb+PnPjBGNisqs8BaAcDwu+n7pplnLQ
	gAP6ge/g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:45380 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.89)
	(envelope-from <linux@roeck-us.net>)
	id 1fVKfR-005U8R-Ri; Tue, 19 Jun 2018 17:43:46 +0000
Date: Tue, 19 Jun 2018 10:43:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180619174345.GC16846@roeck-us.net>
References: <20180614215422.GA29690@roeck-us.net>
	<CAFEAcA-t9G=HAPH2325rduAKFNUEXNE-Jp_m9fMhfdTCbtm28g@mail.gmail.com>
	<4ff384cf-14ad-ef33-5532-4f8dbb8d0ff6@roeck-us.net>
	<CAFEAcA9+nW7nZb0ZaN__xBGGV9WFcBJ0_q=EYTA_DM6=bVfhNg@mail.gmail.com>
	<20180615181331.GA29302@roeck-us.net>
	<CAFEAcA_ua-FMw_SCYExPNPyFoY_jvokns7R=weoODbfVuP82+g@mail.gmail.com>
	<5ebbb70a-79dd-b3b0-6d87-10a1942af1f4@roeck-us.net>
	<CAFEAcA-Jiu-93wqtWuCQqJsQ47g=Zeb4J7y+eAZBsv1ct_QxYw@mail.gmail.com>
	<c7910c30-6b71-a376-e945-e30a6f954c0e@roeck-us.net>
	<CAFEAcA_8c6awzGcik2Hzs8zrHpkqGG=tCt_ykjVnSSa1fkkpzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_8c6awzGcik2Hzs8zrHpkqGG=tCt_ykjVnSSa1fkkpzQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
	guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 208.91.199.152
Subject: Re: [Qemu-arm] Booting Cortex-M3 Linux kernels in qemu
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tM6D9Bvjmppt

On Tue, Jun 19, 2018 at 01:41:06PM +0100, Peter Maydell wrote:
> On 16 June 2018 at 19:53, Guenter Roeck <linux@roeck-us.net> wrote:
> > On 06/16/2018 11:08 AM, Peter Maydell wrote:
> >> My general view is that where QEMU takes the path of "do what
> >> the hardware does", that is straightforward and doesn't lead
> >> us into future annoying deadends or misdesigns. Where QEMU
> >> does things that are not what the hardware does, that is where
> >> it's easy to go wrong. Real MPS2 hardware doesn't magically
> >> load Linux kernels and DTBs (it boots whatever the firmware
> >> image is).
> >
> > ... while mine is that I have no trouble running Linux test images
> > in qemu when it supports options such as -dtb and -initrd, while it
> > is a pain to run and maintain if I have to have a secondary loader
> > that isn't part of qemu. Guess we just have different perspectives.
> 
> Well, somebody has to write and maintain the code that deals
> with the mismatch between how hardware starts up and how
> the kernel wants to be started. The question seems to me
> to be whether that should be in QEMU, in the kernel or a
> standalone bit of code... I don't think the overall effort
> required changes much. (Personally I'd put the code in the
> kernel, since it's about a dozen lines of asm and a linker
> script or two.)
> 
> You need a boot-wrapper bit of code to run the kernel on the
> real hardware too. I haven't actually tested it but
> I think it ought to work in QEMU too (and if it doesn't
> that's a bug I'd like to fix):
>  https://github.com/ARM-software/bootwrapper/tree/cortex-m-linux
> 

Thanks a lot for the link; that gave me enough information to find
a solution that is not too invasive and works for me.

I need to be able to run a single kernel image against multiple
devicetree files and root file systems. This doesn't work with
above solution since it bundles everything together (or, rather,
it would break my workflow). However, it was easy enough to tweak the
boot wrapper and load it using "-bios". I added support for "-bios",
"-initrd", and "-dtb" to mps2_common_init(). That change is simple
enough to carry in my private qemu branch.

Thanks,
Guenter
