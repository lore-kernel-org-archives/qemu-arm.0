Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp283600wrt;
        Fri, 11 Jan 2019 07:50:27 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4nyXAFz4SX/elVeCbwOvzjpqWmki+Qz9bQ7z2pjai07XEbqrAuCpxR0hDv+bsEWGn0ZlrF
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr15405822wrt.227.1547221827861;
        Fri, 11 Jan 2019 07:50:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547221827; cv=none;
        d=google.com; s=arc-20160816;
        b=MgFcEGMag3AwgjXPaf+sLS5kzyPIt4Pl136l+A1U+LI6L4JtID8ERlAq1Pl0fWJHQL
         w/PA76IPHLXmng/UVErbP746RQWpEpChG0E00fIc5WBYzNSXSRfz2mPyZ6d62l1yUh3D
         mNcpYxgw6t6LPZXHQODiYLzaFGpuIlCrBj0ssoUGEOSETnOP15Iq0KPm6X+GsoBDR49N
         vgW9piIKvlgWDi2yw2lBsuHHRfOHsgaYGduKRj9MTQMns5l1E6rGIsufYqk+OpAq/uk7
         cXAz3EAmp75uw+zCKOFcGcxygh0+8TLhsb6p/AegmxJA9Ykd3GZ+fzv2CM7rLWTkZkJe
         6Oew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=+JEMTuIQ33DEHTD0l/mX9XFZnIbNSnC5oJAPbhMONKY=;
        b=VT4jrjbthHzlZ/lysVYd/2BGQm9MdNaZVqNFgbg2kZC4wvsuLKeX8Rve/N5ZpYOztM
         yme/zLa44JPA9KFEkjjIBVH/VBRMF8mmXFsoJHq012SvvnAcepnX5liYPV4B0XAuFGwg
         mf32F5BYnIFFYuJYujH4ETftiKQ5Gqv6zzUJj4sPmJzRX8hNq6533ubs/I8LeNmC1nm6
         lD4e9hO74EEuSGcXaQ4SIgeqc9jaxf+VzYaCjrEhNn1dIJLcg2ExOVBE/ZRGLn9L8x76
         dcyDZB23p6BBr9ByOwzKQIJjj0pOFtcxYC/rn9OYCD2gJt+2uXc9xE466SdPrQ82s9m7
         Guug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=A9gHcEgk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17si13110840wrx.310.2019.01.11.07.50.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 07:50:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=A9gHcEgk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:57003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghz4k-0002ZW-QA
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 10:50:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1ghz4F-0002X8-Dg
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 10:49:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1ghz4E-0002aa-0c
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 10:49:55 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:41250)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
	id 1ghz4B-0002YL-1S; Fri, 11 Jan 2019 10:49:51 -0500
Received: by mail-oi1-x22b.google.com with SMTP id j21so12527276oii.8;
	Fri, 11 Jan 2019 07:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3e0a6lqlkqbGPEJ7F83luqgfJhB0Yz/pwGh04zgW7gI=;
	b=A9gHcEgkC1RIxSgwcsbQdNvF61uSB5kEKSEizZN9XIGsn0zbJcLuAdgX5kuYfBpUra
	gcgqvkuB2CTlPDLJZA75Yhe5aU6XHz5TIj088hxsUuh4zbRU9y09vY2HO1rAyc7yLQOT
	JlwbciYoy3sccw4m55MG5Mib3tgOCdJO+Akv4CA04Wjtu02PEJYbZPJkhiSxAf6eAxPS
	ANs4rStHLfGDuVzrFOVkmSmnx4G/Y3JVffScHtHFdt7n7OurcyhYGytsvnaztAs7eOHn
	8Gb5eqUlIlQMlAyjygLyJ7+nhj+uvf/Px2yrlovksh7U6QhRbOq4unUXKob73v55TcqM
	NxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3e0a6lqlkqbGPEJ7F83luqgfJhB0Yz/pwGh04zgW7gI=;
	b=iByFUIdCnjOkFiUDPVvs8RE39beKoAyepaFUWNajvgJB/p4Th6+vftlFl+hkbWXAH/
	m4R4x+/87F4UN95JSqQEwmUlYTTgU309iua2LkJsxMymjRxb30MZI3GR9GmZP0XdhlhA
	o5SV24MBg4mUMga+2D1UVSLxbhTRZ7XPfxeOYfzJxB6X+Wsc/aax9PkeHJkttCGcDrX4
	pt3UJwvZ9W+2mLq9CacUHr1jeUOhCqTQtJxvGfd4P0APzINaXPoKX9NAlG6QXL3uPEM4
	ePv/NkrYjS50SW2KxlUd5fK7ISVhyTbRaaRh+K7vjMRZ2RDDig/n0qi4OS7InA61dP2m
	Sh+g==
X-Gm-Message-State: AJcUukeqO9oOMb8eREP3VBYGIKQTOTMLtddPqb7a3Eoqs066lUuvaMee
	s1vLKRBZNaUCAonEFPTzyHUh1sJTYl//IMYRctE=
X-Received: by 2002:aca:5344:: with SMTP id h65mr9778229oib.13.1547221789747; 
	Fri, 11 Jan 2019 07:49:49 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6830:1504:0:0:0:0 with HTTP; Fri, 11 Jan 2019 07:49:49
	-0800 (PST)
In-Reply-To: <CAFEAcA_Mga7Y1x_eA-HMdTGhC26MZbHJpSyo01XuKFmRG8gzcw@mail.gmail.com>
References: <20190108163008.7006-1-peter.maydell@linaro.org>
	<20190108163008.7006-4-peter.maydell@linaro.org>
	<CAFEAcA9xd-MJ7QHgYCyh0D+x_ooXYDCnKYTXELoxz3LbYO4SJw@mail.gmail.com>
	<CAL1e-=gKA9dnfgcJ2QuvbWxjgHya1DfUz4VPRxqakyDVKzH1SA@mail.gmail.com>
	<CAFEAcA_Mga7Y1x_eA-HMdTGhC26MZbHJpSyo01XuKFmRG8gzcw@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 11 Jan 2019 16:49:49 +0100
Message-ID: <CAL1e-=iWty7_eGYvJGNQx0HRJZKjNhw7XMxd=58oyQMi-E5xXw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22b
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH 3/4] accel/tcg: Add cluster number to TCG
 TB hash
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Emilio G . Cota" <cota@braap.org>,
	"patches@linaro.org" <patches@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rLGnUcBN4Eja

On Friday, January 11, 2019, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 11 Jan 2019 at 12:49, Aleksandar Markovic
> <aleksandar.m.mail@gmail.com> wrote:
> > 1. What would be, in more detail, if possible in layman terms,
> > the "bad case" that this series fixes?
>
> I describe this in the cover letter (which also has a link to
> a tarball with a test case demonstrating it):
> > TCG implicitly assumes that all CPUs are alike, because we have
> > a single cache of generated TBs and we don't account for which
> > CPU generated the code or is looking for the TB when adding or
> > searching for generated TBs. This can go wrong in two situations:
> > (1) two CPUs have different physical address spaces (eg CPU 1
> > has one lot of RAM/ROM, and CPU 2 has different RAM/ROM): the
> > physical address alone is then not sufficient to distinguish
> > what code to run
> > (2) two CPUs have different features (eg FPU
> > vs no FPU): since our TCG frontends bake assumptions into the
> > generated code about the presence/absence of features, if a
> > CPU with FPU picks up a TB for one generated without an FPU
> > it will behave wrongly
>
> What happens is that CPU 1 picks up code that was generated
> for CPU 2 and which is not correct for it, and thus does
> not behave correctly. (In the test case, an instruction that
> should UNDEF on the Cortex-R5F but not on the Cortex-A53 will
> either UNDEF on the A53 or fail to UNDEF on the R5F, depending
> on which CPU happened to get to the test code first.)
>
>
Thanks, this example makes the intentions of the patch clearer to me.

If you don't mind, I may take a closer look at MIPS' (and perhaps some
other targets' a little) multi-core design details in few coming weeks, and
see if we could improve feightfulness of our emulation, or maybe make it
more flexible, or scalable.

Thanks again, and happy holiday season to all!!

Aleksandar




> > 2. Let's suppose, hypothetically, and based on your example
> > from one of commit messages from this series, that we want to
> > support two multicore systems:
> >     A. Cluster 1: 1 core with FPU; cluster 2: 3 cores without FPU
> >     B. Cluster 1: 2 cores with FPU; cluster 2: 1 core without FPU
> > Is there an apparatus that would allow the end user specify these
> > and similar cpnfigurations through command line or acsimilar mean
> > (so, without QEMU explicitely supporting such core organization,
> > but supporting the single core in question, of course)?
>
> The QEMU definition of "cluster" requires that all the CPUs
> in the cluster must share (a) the same features (eg FPU)
> and (b) the same view of physical memory -- this is what
> defines that they are in the same cluster and not different
> ones. So you'd model this as four clusters (assuming that
> A and B have different views of physical memory. Otherwise
> you could put all the with-FPU cores in one cluster and
> the without-FPU cores in a second.)
>
> Real hardware might choose to define what it calls a "cluster"
> differently, but that doesn't matter.
>
> > 3. Is there a possibility to have two layer clustering sheme,
> > instead of one layer? Cluster/subcluster/core instead of
> > cluster/core? For MIPS, there is a need for such organization.
> > It looks to me 8 bits for cluster id, and 3 bits for subcluster
> > id would be sufficient.
>
> My view is that there is no need for the internal "cluster ID"
> to match what the hardware happens to do with SMP CPU IDs
> and NUMA architecture. What do you think we miss by this?
> (Handling of NUMA architecture is a distinct bit of QEMU code,
> unrelated to this.)
>
> thanks
> -- PMM
>
