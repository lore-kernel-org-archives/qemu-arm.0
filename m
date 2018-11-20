Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp635871wrt;
        Tue, 20 Nov 2018 06:36:08 -0800 (PST)
X-Google-Smtp-Source: AJdET5fWZlxQ/aU66iS8GWJC62aBm+niBJFuj9ZY2GdyR4C9IowfBMJei7MQrXISW6K/GO7oIx3M
X-Received: by 2002:a81:e30b:: with SMTP id q11mr2166015ywl.490.1542724568093;
        Tue, 20 Nov 2018 06:36:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542724568; cv=none;
        d=google.com; s=arc-20160816;
        b=mIC/gjz1dGRTsRGJsUe1v3r+ycXAcd9QuSbL1tUvIUGiXyG0lNAtiCnRiY6eLvuSfW
         9Au3InHURUOobWPuGLIxC2p7SG8iCFbMzmRKajY59LEWmYygxPVUqSUDp/KsZHrqD9gA
         UwBHsj9H0d1/hoEdL6Kn2LW5u8DyJpP+GTgnC2Sejbues6lG18ScXjNL2Uc+MFJnK1PL
         DGECTbENURcW9Ul0kh3I1YCPeVhpIw+DCXqdjll7D4xadwZQdHCjSuJ/rJ9MdcjVvczA
         WD7vEbU1kzFyg9qFDthumRLN1MICc7BI2YE6yU6PFga23/fj+dyDAb5I9egMPwZuIFXX
         mlPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=+RZNTaBaXvR3YH5tKS+NsLy5kbV8XafPdRQDSgvUzzs=;
        b=PUSZc0Qiw45nFxzJAhAOeaaRFg0wzm2PJr3b4SLCLl47fJvafOm6mS3r6UIZVbypBQ
         GanB4ujttzhCkLJaarw6fcSGI/K1o0v8fpKyPi3YGGCshRlxpSkxK6FsHir4ybktUHCu
         9RvG+VI0hlwT0jDiW/zxgYyEFa6LLD22IEgR8Yt2ojzHZzd+Gs5IrBi1hjoiiBENp1EI
         DoUzRF8eLmxc7wvBfXi7FIGXux2nDdi/jaWLKfwDXyWCGBbCulQ/jheEb1nATyVJY8bQ
         07LkZrDgwzhCV3XFoAT/ZY76o60qQ595XH9KMavUXkXn4qbVIuGHCE8jJHFKDpPi/dXf
         shBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SrNhSB8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p67-v6si22601082ybp.497.2018.11.20.06.36.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 06:36:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SrNhSB8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP78J-0008F9-I6
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 09:36:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP788-0008EQ-3b
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:35:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP787-0002m9-9S
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:35:55 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:35604)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gP787-0002lm-4U
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:35:55 -0500
Received: by mail-oi1-x243.google.com with SMTP id v6so1661499oif.2
	for <qemu-arm@nongnu.org>; Tue, 20 Nov 2018 06:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+RZNTaBaXvR3YH5tKS+NsLy5kbV8XafPdRQDSgvUzzs=;
	b=SrNhSB8dzjzWnR+kYh0wDNkUWCTjinMvUA2f0Kk17iVM813numBqURXmQV1m/9Ix47
	jNPWIGBhgQIQOLFp4lzcXwishHHQ08I4c3dj9FxEdc1RsXgi6b142WCIVxPTBxz+I0ii
	kZ77UIv5+KOZRBJgBF5RxNOE7fy46YSz8f0EI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+RZNTaBaXvR3YH5tKS+NsLy5kbV8XafPdRQDSgvUzzs=;
	b=CU+m2A6Vme7Nqs8n9fn7lk8A8lWFwL7kTJzldJczrNdGZeyuPC3TvDc65yOUzOlCY0
	Biii9Wy99JNvve/lgGk2+GUhmR7iW8UgxSaxIxNtHLctCGypj/Spq3PGIBfsLxecBjPP
	rHRM75andTt9GbPX2+0RboEt/KrAFRLuZ6/WZQlKi7jmP60inF+AxxgaeifpgWAusTef
	fRSqx3mOCOL8eKeP4o697cfoF2i0/ZGOB/kqsPfYXs96ytrJt3JSfqvVqfDf3sCBYR3F
	8v4WX9t+D0psCUVvGtVcw7qaEBklq4zrQUzUzavghetWcG/LWlIqojokBbknJyYTYKS5
	wRPw==
X-Gm-Message-State: AGRZ1gKap0EVullGQhvCnEOBgtMVR+KfWVxTVtHBq1dMPHSHSSWjL3Zc
	bC1wfyxnzLDokuGga/YJFZThSgr6wViAzANmtXNyWw==
X-Received: by 2002:aca:2dc9:: with SMTP id t192mr1262933oit.325.1542724554263;
	Tue, 20 Nov 2018 06:35:54 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 20 Nov 2018 06:35:33
	-0800 (PST)
In-Reply-To: <20181116212154.GG23658@quinoa.localdomain>
References: <20181105185046.2802-1-aaron@os.amperecomputing.com>
	<20181105185046.2802-13-aaron@os.amperecomputing.com>
	<20181116212154.GG23658@quinoa.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Nov 2018 14:35:33 +0000
Message-ID: <CAFEAcA-RkSKviFW0uah+HYuy9K4LAn1Ye=V-UVujLT_WRHCT=g@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH v7 12/12] target/arm: Send interrupts on PMU
 counter overflow
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bK8QHA4wVF34

On 16 November 2018 at 21:22, Aaron Lindsay
<aaron@os.amperecomputing.com> wrote:
> On Nov 05 13:52, Aaron Lindsay wrote:
>> Setup a QEMUTimer to get a callback when we expect counters to next
>> overflow and trigger an interrupt at that time.
>
> Peter,
>
> It looks like there's probably going to be at least a v8 in this series
> since you've made a few comments which require changes. But I don't
> think this final patch has ever received any review comments from
> anyone, and I suspect it's not because it's perfect...
>
> Would you mind taking a look at this one during your review if you can
> find time?

I think I'd rather let Richard review this one...

thanks
-- PMM
