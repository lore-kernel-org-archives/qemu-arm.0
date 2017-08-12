Received: by 10.25.221.202 with SMTP id w71csp1961947lfi;
        Sat, 12 Aug 2017 03:25:07 -0700 (PDT)
X-Received: by 10.200.36.196 with SMTP id t4mr23859081qtt.227.1502533507735;
        Sat, 12 Aug 2017 03:25:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502533507; cv=none;
        d=google.com; s=arc-20160816;
        b=mrDGgROpU50PTZza+6QwAgeTrLRh+FJG857RAQdmlg0gwTQCFjLWrEeIS02qbXn+Vl
         WsxnHmjexYzsmojNc+6ar2h/4Nimcw611o/UW7R4cFyQo82p2RNvBZ3yRREkovXfnge4
         lr3dh8BAxRJE+ebU88rwCQ1sJyYnoSBmgJcuv4uprZwATKKZjKIHCvShGj3Wr2n+ZZxC
         eHO2dpsv4sFp5ycD+ckNnXJ7nTCr2eYcL3uq9qQ8hCQn3vnPz8zQG5ig848/uq5Z3+E0
         fxQDrjuwcT5X9X0rGZp2REuOvZ8/qytgMxvixjLIHaKBpRPG+kpHtQ2hX17dTwG0RgFU
         JTSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=kIplSY5C/hVtzdln6tSYfVBPCMcUEHdFcS6J9hyFNTY=;
        b=g9XH+zD6jM3B0Fn2xWbFfNZUVfvwq4drLUjswvETxjqD/OVjVgs0gH1EOiSzUgqSBZ
         h6wyFRXt8JlJwhqxNbs98FLUozyJ7I/rTxbAdFIPswDMYTGim3AFr8Rhi6z4pgqFIBUJ
         2WiraoFM43PjXUjA9Mh3s4dISsDdkHElZe+wdRdobcY0ZO5mM96zQ70Dn3UK8t1z6FpK
         0lij5tZcfpOedAz35OOjxDdjG6OMxHEbb3YcG0YA5de+FcFzwxj0/2vEMqCZX4QFCOzW
         ehuzkQCDpxdqRbJ4kAS7iETV/E+bZgjy88yhtlC7vu2UT70jgoE1AzmLk7mxZ9iMItMp
         mkVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LH/toEll;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b65si2542011qkg.516.2017.08.12.03.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Aug 2017 03:25:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LH/toEll;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42248 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgTbN-0003IP-47
	for alex.bennee@linaro.org; Sat, 12 Aug 2017 06:25:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dgTbB-0003FB-OK
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 06:24:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dgTbA-00062u-IV
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 06:24:53 -0400
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b]:34949)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dgTbA-000626-Ab
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 06:24:52 -0400
Received: by mail-wr0-x22b.google.com with SMTP id k71so20649634wrc.2
	for <qemu-arm@nongnu.org>; Sat, 12 Aug 2017 03:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kIplSY5C/hVtzdln6tSYfVBPCMcUEHdFcS6J9hyFNTY=;
	b=LH/toEllEx6Fxw7ZF6dAgOSrWlpJL4XlOsBs4AToXIUxxb+wB901as+GQZ1MVyeavT
	/rpeIITe4Nkhwh6Uo+51lYq2blvi4aF6x1XaXlWSXqgujaT2pQUx7XtPrzy4LlcGr26t
	CYxF3K/Pu3tKMOPGt0IZENJvsmzRhAHepfwJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kIplSY5C/hVtzdln6tSYfVBPCMcUEHdFcS6J9hyFNTY=;
	b=B3Bo7Dc5GrDFsOW6eXl/3pYhjqBOH9ZNw4YTuP6SVNtc2MrVRRMwblIkbTrZl6VvHG
	t+Gl9dOi9QpLaY0cpUQFXYpYNCIpLxpRdvhIaJEJgKDV2Gj2/ddRfGx4LetFmkxliOwK
	TQjm+Qic2eZwwn/BrJg9tw91qAcNUAactl++qzMgaf+oy1Aqt9R0sLWcvo4bFgy67Goc
	vSFUFrmvFCc85TO6Dt0iV5l44O8MIZG9envJcZVJ6vjKS3CeQHe1bK8TebjnvB8OHeld
	zivNkFWqA1hpE2WGKyDRNrtFCa/SpPx3fbwE+EH4cdtN4cw7zuYKyNfMMmrPX1dB4PX+
	rc7Q==
X-Gm-Message-State: AHYfb5jVaCjL2vaojn5csf13AS9BUF1cV85vozEthlCQ3t2WfKiodAcU
	4YBwY5dObSF4jUjRoDXpFowkW6sorsB2
X-Received: by 10.223.165.138 with SMTP id g10mr11904932wrc.167.1502533490735; 
	Sat, 12 Aug 2017 03:24:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Sat, 12 Aug 2017 03:24:30 -0700 (PDT)
In-Reply-To: <cover.1502488636.git.alistair.francis@xilinx.com>
References: <cover.1502488636.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Aug 2017 11:24:30 +0100
Message-ID: <CAFEAcA_GsfrueJQYbL6dzNBnLwMWHd3fv24CMRczuf_TxYo6NQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22b
Subject: Re: [Qemu-arm] [PATCH v1 0/3] Fixup exclusive store logic
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d4PdeWiO9jOL

On 11 August 2017 at 23:17, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> I found some issues with the way exclusive store was working. This patch
> series seems to fix the test cases that were failing for me.
>
> The first patch is just a simple adjustment.
>
> The third patch fixes the main bug I was seeing.
>
> The second patch is left over from the RFC that seems like it is still a
> good idea.
>
> Changes from RFC:
>  - Rewrite the third patch to correctly fix the issue.
>
> Alistair Francis (3):
>   target/arm: Update the memops for exclusive load
>   tcg/tcg-op: Expose the tcg_gen_ext_i* functions
>   target/arm: Correct exclusive store cmpxchg memop mask
>
>  target/arm/translate-a64.c | 4 ++--
>  tcg/tcg-op.c               | 4 ++--
>  tcg/tcg-op.h               | 2 ++
>  3 files changed, 6 insertions(+), 4 deletions(-)

Is this series (or at least patches 1 and 3) worth putting
into 2.10 ?

thanks
-- PMM
