Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp113407wrt;
        Fri, 11 Jan 2019 05:02:38 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4zr+yX0wMFCkuY3Zcbnz3R6rvaeQ6Gf40KUvls+RsyvsYiRWxdP7RNDfqE+sGOx55mS4KF
X-Received: by 2002:adf:84e4:: with SMTP id 91mr13279561wrg.237.1547211758468;
        Fri, 11 Jan 2019 05:02:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547211758; cv=none;
        d=google.com; s=arc-20160816;
        b=hLF77cXbSqXJ7uLVxT463QshYif8SUiW2WsHzVwj888+qsOWe7DVwZ6fVP8YGfPV3Z
         WprxPpzzSbnReOsNz++5j58W2OfAH7yjn8Ma5X5MGbSBjIXHSl9ORgoxDx9M3qEnJxUb
         0k40M3wdbjuTAcuh0ZzmSayfAHWhp/dL7BzlkazC+RlZ395Wmwx4OsnJAz6u9OULeD4+
         rrFQ1j8KGdHxRSmkOAMs8qtuV+VNwBNpTkjf9M2G+K6qH4OJAmBFA+o2yG3Jyf5HB1O1
         0IR2uV31ko+b/813Kg1DprAa5yoQ0gtxwyNsamvH+4lcvfBSvXx3Pljky8F+0LR84kwQ
         exIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jo4n3Yy2X40WPe3VNtVMTd3SWYF4wC8Roo7rnwI/DKk=;
        b=zteEWk4nZNFM9NjLJKF7cG/R4DIGtDMykBAzBNNYeWTRcK4v5tTXpUDlIJ8suvc4q6
         g2SAt+9N4vOJRENBIFJn/vexR7v0QZ0xH0v6Ujd5gWuQQE9dqYAuyU5Bq8wFeWTGprLD
         oS3IW1StdX1obrpkd6s38c++kXSmPnHel569tiR2bR/05OMBv9lZe+smx5C8V/2PLSgE
         9Wcw+dsz+ijlbjHf4Lp2iR4Jpz9k0/izw3ucIXkWV9GO/fbWMDiXBWzJxULLqzsghvsQ
         koccYEtFKBoBHhBtve8AfJscSBTY8M1Jq1QZarlGoeljhkubpTtGWKldBKbRO64w686l
         qhYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="K1V9ez/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si38490515wrs.141.2019.01.11.05.02.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 05:02:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="K1V9ez/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44964 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghwSL-0004Qt-89
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 08:02:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ghwQR-0003O2-VP
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 08:00:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ghwQQ-0006Zq-SK
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 08:00:39 -0500
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:37766)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ghwQQ-0006Ww-9X
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 08:00:38 -0500
Received: by mail-ot1-x336.google.com with SMTP id s13so4516687otq.4
	for <qemu-arm@nongnu.org>; Fri, 11 Jan 2019 05:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jo4n3Yy2X40WPe3VNtVMTd3SWYF4wC8Roo7rnwI/DKk=;
	b=K1V9ez/DSjA2OkvIQ7AFyVxmaWDtUJFllG+oYiP4MQXdsRX7YL3SnU1D9arTbCwIrf
	tybJVIfkJdP4fdk3hV5WAiEYBnEHXxtzBVeHz9jx/98V4HEoCZYKxIO0hdrX14lJ3ngY
	HIrBMt6ZGnEFIdvsoITv0BXcIGLe6VMzVHkrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jo4n3Yy2X40WPe3VNtVMTd3SWYF4wC8Roo7rnwI/DKk=;
	b=lPIpIlgDqRhtvx/kGHf6IHl7NKvkPcOS/HUYNu2+mYu5N3RpMtfOnn432ezBE6lfz3
	xvScc7MNvpNdG95gjCeABV4BV3JYacuWIbXYC4q5bIhjJmAEYlJOcr1AL3ZKqdNwJhQt
	KjUDI3Md0OH+8EeQATcNkUWWJrhMF9sBgZ8K1oBjkxBKIKJNzCcEvW4BCRmAUu1AG+Bn
	/+lR8lGfOE4gEj6cHU2U4ZyWOuSi8wv/icGTw0OBN4UyvZuj3Re1qxayMxsW2NfxbtnX
	oV4mICDoGUPiiJeobYAeR8DJeuHDWWAIMl6Rg0HNFyiohKIKQYLZjs/UJAVtPDuP8Ksb
	lAMA==
X-Gm-Message-State: AJcUukfvBtCd4mxVe4Fbh5cSFxd5Um/jVYhC+leXohp/sHkpTx9cQrPs
	X3SUMiS8GOkwaIfQ3f1f0Ux8e11vWHkqjNmI2VfciQ==
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr10015683oth.317.1547211635359; 
	Fri, 11 Jan 2019 05:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20190108163008.7006-1-peter.maydell@linaro.org>
	<20190108163008.7006-4-peter.maydell@linaro.org>
	<CAFEAcA9xd-MJ7QHgYCyh0D+x_ooXYDCnKYTXELoxz3LbYO4SJw@mail.gmail.com>
	<CAL1e-=gKA9dnfgcJ2QuvbWxjgHya1DfUz4VPRxqakyDVKzH1SA@mail.gmail.com>
In-Reply-To: <CAL1e-=gKA9dnfgcJ2QuvbWxjgHya1DfUz4VPRxqakyDVKzH1SA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Jan 2019 13:00:24 +0000
Message-ID: <CAFEAcA_Mga7Y1x_eA-HMdTGhC26MZbHJpSyo01XuKFmRG8gzcw@mail.gmail.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::336
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/4] accel/tcg: Add cluster
 number to TCG TB hash
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Emilio G . Cota" <cota@braap.org>,
	"patches@linaro.org" <patches@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /4X5wfmysL+2

On Fri, 11 Jan 2019 at 12:49, Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:
> 1. What would be, in more detail, if possible in layman terms,
> the "bad case" that this series fixes?

I describe this in the cover letter (which also has a link to
a tarball with a test case demonstrating it):
> TCG implicitly assumes that all CPUs are alike, because we have
> a single cache of generated TBs and we don't account for which
> CPU generated the code or is looking for the TB when adding or
> searching for generated TBs. This can go wrong in two situations:
> (1) two CPUs have different physical address spaces (eg CPU 1
> has one lot of RAM/ROM, and CPU 2 has different RAM/ROM): the
> physical address alone is then not sufficient to distinguish
> what code to run
> (2) two CPUs have different features (eg FPU
> vs no FPU): since our TCG frontends bake assumptions into the
> generated code about the presence/absence of features, if a
> CPU with FPU picks up a TB for one generated without an FPU
> it will behave wrongly

What happens is that CPU 1 picks up code that was generated
for CPU 2 and which is not correct for it, and thus does
not behave correctly. (In the test case, an instruction that
should UNDEF on the Cortex-R5F but not on the Cortex-A53 will
either UNDEF on the A53 or fail to UNDEF on the R5F, depending
on which CPU happened to get to the test code first.)

> 2. Let's suppose, hypothetically, and based on your example
> from one of commit messages from this series, that we want to
> support two multicore systems:
>     A. Cluster 1: 1 core with FPU; cluster 2: 3 cores without FPU
>     B. Cluster 1: 2 cores with FPU; cluster 2: 1 core without FPU
> Is there an apparatus that would allow the end user specify these
> and similar cpnfigurations through command line or acsimilar mean
> (so, without QEMU explicitely supporting such core organization,
> but supporting the single core in question, of course)?

The QEMU definition of "cluster" requires that all the CPUs
in the cluster must share (a) the same features (eg FPU)
and (b) the same view of physical memory -- this is what
defines that they are in the same cluster and not different
ones. So you'd model this as four clusters (assuming that
A and B have different views of physical memory. Otherwise
you could put all the with-FPU cores in one cluster and
the without-FPU cores in a second.)

Real hardware might choose to define what it calls a "cluster"
differently, but that doesn't matter.

> 3. Is there a possibility to have two layer clustering sheme,
> instead of one layer? Cluster/subcluster/core instead of
> cluster/core? For MIPS, there is a need for such organization.
> It looks to me 8 bits for cluster id, and 3 bits for subcluster
> id would be sufficient.

My view is that there is no need for the internal "cluster ID"
to match what the hardware happens to do with SMP CPU IDs
and NUMA architecture. What do you think we miss by this?
(Handling of NUMA architecture is a distinct bit of QEMU code,
unrelated to this.)

thanks
-- PMM
