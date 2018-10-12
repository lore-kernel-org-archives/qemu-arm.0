Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp801795wrt;
        Fri, 12 Oct 2018 06:27:57 -0700 (PDT)
X-Google-Smtp-Source: ACcGV607QZ7/u/LCtYQJ8p2Pg6zk61lSxaxDZkQvjl28MnpWCXBg831VcfewcpFgcitx+/18wRcV
X-Received: by 2002:ae9:f810:: with SMTP id x16-v6mr5855745qkh.334.1539350877262;
        Fri, 12 Oct 2018 06:27:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539350877; cv=none;
        d=google.com; s=arc-20160816;
        b=aTt7qQ5hofq3i3glnNlQ92mQd5g2oyQHGXfER7a0FuvkJ5Vx6wYlVPvJhEO9UvgWuu
         BsG3Y8UOS45Hb6hVQGzgKwL+2W6CIeY8zF88aApLzlBNhai1HSSvRDKZ8TQ/uBI8s+F0
         CpSpx2seywA+MgyfJGiMB5QQOlH7Bzcw65IsUiWiLUvIIPy5yVmwF+8fiV4scvalBIVR
         9UHPKYXPkePSouex4pviaSWvhQwK9tUTy1C8K/WlAPoHcqTky+ssKXVuwsz/UHE+ytkI
         BKJb6My5Ftn40q6QimFvo6EwuzldYVhmnkvi4CsqmMpmKGE68fosdwckcrSwZGoTT8Qy
         05bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=YJsNCLmrCayF4jCHSQNS+G/NDiFV7TTeCt9LUupQRps=;
        b=yJEnaaLlX1T9gTm96q2+NcL6aITY29DCNViY+9BmENi1caLXVupweFY6poq7qDhlpv
         gLeRkp3BFYzQCPQG1JHvPAH8ss+xVNQw4EqLhgDuLsoqn9pnrT4tI4RXb68YO0ygZDkw
         3D9r15u5samSLd5dPs42qydajCPqtp3ZEqCpztQiyelr1y3cm/sm1iduxwYiEF91gL1x
         GWdUT3gVEoDQZlkyZB7GLIjAV/rDYbF0bYuJRA6f+F8T4clYVE0igasdJU4QQM0cPYCC
         op5Gmzxft7AFbxFOTGUVdo7SfJh2KonqxXYMdSRUKdqImyUHk7+PUF62d8JEuD5MCLAr
         AbOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JgwUAXTt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i6-v6si1066020qkc.265.2018.10.12.06.27.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Oct 2018 06:27:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JgwUAXTt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAxTw-0003ah-OM
	for alex.bennee@linaro.org; Fri, 12 Oct 2018 09:27:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gAxTk-0003Yw-Tt
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 09:27:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gAxTj-0003hy-Se
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 09:27:44 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:39571)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gAxTj-0003h8-FI
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 09:27:43 -0400
Received: by mail-oi1-x241.google.com with SMTP id y81-v6so9848473oia.6
	for <qemu-arm@nongnu.org>; Fri, 12 Oct 2018 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YJsNCLmrCayF4jCHSQNS+G/NDiFV7TTeCt9LUupQRps=;
	b=JgwUAXTtdIfJCt8DpP/guRvXPOry8M1MMlMxsE7huh2YQXxrmQhusuSY+yrtSy7Lqe
	ulUoaglQm4HtNF9rP/HQPyNBgHqiFIVXPHHxs+I+HF0ISyPchBxvp9YjH62Fd0s1H/I6
	gAGarB4YDMKj675k4xpE1M9EDlNvvfwXWDJ4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YJsNCLmrCayF4jCHSQNS+G/NDiFV7TTeCt9LUupQRps=;
	b=RbtOne+9QoG4cI1q+OFLdS1PQb2uYpOuFRCrWMUjhoyYuVhvR0xvbngyhDt1Xe9Occ
	9CGfL2X5Oa6d1WML/BAHQZt/YKTxKQCwy7LtPEHnfNxAl7QUfBLTdhSuLi93GtYqrdKi
	FEzreXiR1gy0pg4iEhOWgCVBjdzJoh95/CMc0BSHeEFplb6lXKQY3PSmoIAhKY7MsGai
	xmFFZSbA7Ih7rVk5eSULK2eiAvZM6+Tmnzsz3e+fFEJtvYQzdKTXJPzPV3l3NpQnUsAR
	/kxcZODq9iVPf7MFTQmOWg6AEu5/IWJQWopBJFN5vk7oikrMUlGdeHnSAOu90usub4I3
	oICw==
X-Gm-Message-State: ABuFfoi2F4INq1jO/PXKc5RT/KLuF/5bLyQTeJiEP/F9kfY/FIRsvUKS
	XtyncgW+q8iwd2gocu+xmOaW867yepWgaFJTRtKxeQ==
X-Received: by 2002:aca:fd14:: with SMTP id
	b20-v6mr3404285oii.337.1539350862832; 
	Fri, 12 Oct 2018 06:27:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Fri, 12 Oct 2018 06:27:22
	-0700 (PDT)
In-Reply-To: <d8b39811-4584-f05c-6f6d-6e8c8cd8ac3f@greensocs.com>
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
	<20181002142443.30976-8-damien.hedde@greensocs.com>
	<7621d3ab-7cfe-0dca-bc0e-dad913052b25@redhat.com>
	<d8b39811-4584-f05c-6f6d-6e8c8cd8ac3f@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Oct 2018 14:27:22 +0100
Message-ID: <CAFEAcA-=pUuPg4u9wQgmh=YemSdbqO7moSH5ZcjRcBx+oQLzaA@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 7/9] hw/misc/zynq_slcr: add
 clock generation for uarts
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
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, konrad@adacore.com,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QviGWSyMpOMI

On 12 October 2018 at 14:24, Damien Hedde <damien.hedde@greensocs.com> wrote:
> I'm wondering if in such a case (a fixed frequency base clock), we
> should have a way to change the frequency through command line ? (In
> order to start the machine with, for example, a 50MHz base clock).
> But I don't know what's the right way to do it and if it needs some kind
> of special support in the clock object or in the machine object, like a
> frequency property.

New command line arguments are a complexity you don't want to get in to.
Just have the board model the frequency at whatever it typically is.
It seems vanishingly rare that a user would really care to model the
board frequency as something different.

thanks
-- PMM
