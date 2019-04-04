Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1208878wrx;
        Thu, 4 Apr 2019 01:28:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwgM8+eM0ZMGBPdEBaW/+G0SHUJGRGSLQgfc9CUaV/1eXN0TjU4IU9yUE+Q6V+ZCvbur42B
X-Received: by 2002:a25:a445:: with SMTP id f63mr4163634ybi.323.1554366494799;
        Thu, 04 Apr 2019 01:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554366494; cv=none;
        d=google.com; s=arc-20160816;
        b=yvgjILy8jkiIUOPxT5b/dkr22VsB3OAagIXvDJ8S5UdzBpy3JrNaPNceGOk4QIlsPU
         JkqfYLyeZZoXkUhgRHAWl1NRooAr7Df5vKcZ1WQEdSyhCvVIcQSGLcUpU5di4JPX9z8Q
         KDRu97eVNFYlyBpTqQCF5QU/ToHpnzIMCMOtvlQARUNYq6EsBkqgsUa2ZkjQ79Tp5ovL
         +tgJb7WsnrscXy3CPfRSjVSvrkN92ygmVCMuc7q7g51F6jnNl4kSS4fz18EfnuRCc7u+
         z4jZ1fMauT5QhMcw8AO3U8UjKGPw+fMFmPG+iLLDSoxw1UZjVrJ5uWfMTNIvOvaFIJ9D
         cwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pqSbY3F2XvdU8E5EG/LyxY2Fv06Bzt0Fm6Gr7BYGaOk=;
        b=dPTI4Qh5UZwiKYS5+0D9h7yvRXa0viPB2mc3ym9F+R/SMlONsmf70kLr682qi1aWE2
         9RAkyFzgkZxfCbQF73jRkmsJIKhAHHD7wnv4LwB6LJ5gg7tSfMoq8eBKAsDxi1hJY08h
         3nO6swrm2tJ60PdLqXkaoUoTEQpEhe6M1TBrRgt+4R9k/vbuhycCM2Sr1On1SepPD8iv
         tIGQCEwhrGbh6XYW2sapIddXHDvbwa+WSBZG7M6z5Jb72h/W/fm878MsSOmBSlWkkApw
         fJzPRNX44tOKYn1sjexx/9baGhSdf66HPoLuWP+q+RMzdEvgam6nkntZz2XQQAwCA3Tj
         wHtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=REdbgBpU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a127si6656870ywf.255.2019.04.04.01.28.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Apr 2019 01:28:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=REdbgBpU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48283 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hBxjK-00022d-3w
	for alex.bennee@linaro.org; Thu, 04 Apr 2019 04:28:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1hBxj7-000210-2p
	for qemu-arm@nongnu.org; Thu, 04 Apr 2019 04:28:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1hBxj6-0003eg-1k
	for qemu-arm@nongnu.org; Thu, 04 Apr 2019 04:28:01 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:32782)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1hBxj5-0003c2-IO
	for qemu-arm@nongnu.org; Thu, 04 Apr 2019 04:27:59 -0400
Received: by mail-lf1-x144.google.com with SMTP id v14so1172298lfi.0
	for <qemu-arm@nongnu.org>; Thu, 04 Apr 2019 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pqSbY3F2XvdU8E5EG/LyxY2Fv06Bzt0Fm6Gr7BYGaOk=;
	b=REdbgBpUmOOzNFBe7EqKcV9zsC+Ys1RsnpxH9EUtN9mqYyIenue6PHq4f/Dzon68H9
	G0Wy8BYIN3fvg1t0fsX2MWnKTyYdNAmt8XiS98AMbo6xxkuzdlEFHzCS9VzSF+vLzCyq
	ZkTxh0yhlMB/c4UWPqsPpVuJsbaADCe66fMgHfPWSJ7Ww0eQDGZIY5op0db9ttHaUEKK
	7FfW/2EnkFBzK3727P7dh/0U5mERZH+2LBTgSCiCrITGtKu5swsTHKIvEat6VcDbGJ1t
	/C8elvHm1bUTniJlQKbLIDmYeRwvCuwX66DNzE5AK78Vx5y7/JMGqcMrPGxYGEac4N8j
	mfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pqSbY3F2XvdU8E5EG/LyxY2Fv06Bzt0Fm6Gr7BYGaOk=;
	b=e/GI9MrDxmbdIg3yQmgVYdL+FoQRN4VG2G3W/97sc0uRWd8hOvEnzkRPOyYrhq5zeM
	+gsCEBWfVimfrh5DzfDCwvhPvllxBEe0SkdeQ1U3qZw4UY51A1ZKmG9WKCWuDq809210
	t2d4TcICwCYxcoKLGfkGkSyJ3VzyT40sUhYe8TDUBNB6dxXY70heUDKt8kGg7r0xnG6o
	VZHu42AU0SFPnAeEsQOafmWh4s+7yiKpyxFsqV/jVp/l22LLYkqTmQxNF1LjP2JiIBz0
	zdPPshpPrsxiUohRZy2DesQuC/qE4xiTb7Lvc23dmLWvj3x2GubatHSEpQBeZZYLhbOR
	GfzQ==
X-Gm-Message-State: APjAAAVQfoSjjbfYAWpCpcnnQSkl22QV+IckF/G6YCWtbFdlyKChYoFA
	2bJmnWjs5RjgFuHXiqnrecjb5Uc3VC1UvUes0KQeOA==
X-Received: by 2002:ac2:5285:: with SMTP id q5mr2400112lfm.37.1554366477396;
	Thu, 04 Apr 2019 01:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <1552644466-24625-1-git-send-email-hongbo.zhang@linaro.org>
	<1552644466-24625-2-git-send-email-hongbo.zhang@linaro.org>
	<CAKv+Gu-aZeYwegzFQ7pPqvm28ySR5xC6rZh8FBvQaWiNykgPEg@mail.gmail.com>
	<CAHmQWvD8byf+4=J7+rnU9CiGRKnuA4NnRPHRw1Zki4-m4anwOA@mail.gmail.com>
	<CAKv+Gu9cWgkH-ZTDQ42_HnN-LfAMoL-k7ysd1Hz07RrP+Pp94g@mail.gmail.com>
In-Reply-To: <CAKv+Gu9cWgkH-ZTDQ42_HnN-LfAMoL-k7ysd1Hz07RrP+Pp94g@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Thu, 4 Apr 2019 16:27:43 +0800
Message-ID: <CAHmQWvArKFj9WPwaLjHs11x75iD0Rk9PBsTRq8mXrhm-LZt7=A@mail.gmail.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-arm] [PATCH v6 1/2] hw/arm: Add arm SBSA reference
 machine, skeleton part
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QMhfXs1Sy/xP

I would like to wait for more days to see if there are any further
comments, and if no I will send another iteration with memory map
slightly changed.

On Wed, 20 Mar 2019 at 18:27, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> On Mon, 18 Mar 2019 at 03:39, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> >
> > On Fri, 15 Mar 2019 at 18:41, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> > >
> > > On Fri, 15 Mar 2019 at 11:08, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> > > >
> > > > For the Aarch64, there is one machine 'virt', it is primarily meant to
> > > > run on KVM and execute virtualization workloads, but we need an
> > > > environment as faithful as possible to physical hardware, for supporting
> > > > firmware and OS development for pysical Aarch64 machines.
> > > >
> > > > This patch introduces new machine type 'sbsa-ref' with main features:
> > > >  - Based on 'virt' machine type.
> > > >  - A new memory map.
> > > >  - CPU type cortex-a57.
> > > >  - EL2 and EL3 are enabled.
> > > >  - GIC version 3.
> > > >  - System bus AHCI controller.
> > > >  - System bus EHCI controller.
> > >
> > > Hello Hongbo,
> > >
> > > Apologies for bringing this up now, but I seem to remember that the
> > > EHCI does not support 64-bit DMA. Did you run into any issues with
> > > this? Or was this fixed in QEMU in the mean time?
> > >
> > Hi Ard,
> > Which EHCI do you mean?
> > This time I use a newly introduced system bus EHCI, commit 114529f7
> > and I only tested USB mouse and key board, didn't test DMA function.
> >
>
> The host controller doesn't work without DMA, so if mouse and keyboard
> worked for you, and no DRAM exists below the 4 GB mark, this has
> apparently been fixed in QEMU.
