Received: by 10.223.161.27 with SMTP id o27csp3006894wro;
        Mon, 30 Oct 2017 15:57:44 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Rhfz5OM4TwEDX/sVQU9VtiZPfExLsq4iEVUfjJSJhrtOexb9yiK5q2k3x31A7mtUJuJapB
X-Received: by 10.37.223.129 with SMTP id w123mr6619255ybg.288.1509404264569;
        Mon, 30 Oct 2017 15:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509404264; cv=none;
        d=google.com; s=arc-20160816;
        b=XN5S6uHy4bImqRpIcqF6SCmDtrVudHTdLgecDXdFYkyLlTqrApV6ML7kEmd0ALEh7D
         Pb7F4lIFCQ1nBdiQMXhS5oAqdXVXexjuIh/BGw8Y8VDw9vSBAg7T5oj6KMKXIqSKNg1a
         G3twpksNu9B+IKgcXXLuf0BLhDwraWbOm6xRHMY9ha9gruziL23k3I8/iN6HZ8E20mn1
         6H7piso4QIABHG7ninCrA4Sj4iu0WWd1hRXtZ+SVRsGrVZ56zxtGmAD4ZqmjpO+P2SrK
         /5jYQQrthxglQsFtiMFa6Im+gab0qcWcr33IYfg2Ta4Ql7tF28dURIp7i1DBT5alo/uE
         2S+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=z1HIMUonGpIEZecH8Z40j117gKLGPmnBtLYI//4w0P0=;
        b=hdhWBes3vI5uSW9E37bXHd1ve6VQXZRKQbZX5oStxBlLwwlaQIZKRJ8lrlVtqDYFOF
         aw7Vz1/T0QnU4DI99Y/f6hCzyeijdtRElYo9zvG9v34uEcFDJwHQXIyKDUhdnwJwJocP
         DMVlwFEeJjkNVpARfP6uafQl9zBy467C+PLSXHitLDAX92g/ZqsVo9RBkJqvUq1M5BUB
         4rJTvc0LOW+Ofg4OMXHUoCdQ0QnFr+1KAeiOoFnzzad+hmhB1bVJilxKToBksZcs9Df1
         cFszm0rBcQJQVQLnFhUoaJtdSRMq62ZieZE2uZIxoC4DpZEV5k2wf9ywffBxw8ZS3Sod
         Jk4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k6si11176ywb.85.2017.10.30.15.57.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Oct 2017 15:57:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42922 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9J04-0002o3-2c
	for alex.bennee@linaro.org; Mon, 30 Oct 2017 18:57:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e9Izx-0002nx-3s
	for qemu-arm@nongnu.org; Mon, 30 Oct 2017 18:57:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e9Izu-0005XF-12
	for qemu-arm@nongnu.org; Mon, 30 Oct 2017 18:57:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:53538)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e9Izt-0005V1-O3; Mon, 30 Oct 2017 18:57:33 -0400
Received: from [10.149.184.130] (162-198-228-33.lightspeed.wlfrct.sbcglobal.net
	[162.198.228.33])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 08514218B4;
	Mon, 30 Oct 2017 22:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08514218B4
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Mon, 30 Oct 2017 15:57:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA8pvLNGReghJp0QATbBtC-KCgPqQheKnY=KzDPcjdym3g@mail.gmail.com>
Message-ID: <alpine.DEB.2.10.1710301444460.7297@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710251623560.574@sstabellini-ThinkPad-X260>
	<CAFEAcA8pvLNGReghJp0QATbBtC-KCgPqQheKnY=KzDPcjdym3g@mail.gmail.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: Re: [Qemu-arm] [PATCH v2] don't hardcode EL1 in
 extended_addresses_enabled
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien.grall@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k8mgutYyQutx

On Mon, 30 Oct 2017, Peter Maydell wrote:
> On 26 October 2017 at 00:28, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > extended_addresses_enabled calls arm_el_is_aa64, hardcoding exception
> > level 1. Instead, add an additional "el" argument to
> > extended_addresses_enabled.
> >
> > The caller will pass the right value. In most cases, it will be
> > arm_current_el(env). However, arm_debug_excp_handler will
> > use arm_debug_target_el(env), as the target el for a debug trap can be
> > different from the current el.
> >
> > Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> I have some longer comments below about what a mess this whole
> area is. Fixing some of that requires some heavy refactoring,
> which I don't want to do just now since we're about to go into
> softfreeze for the next release.
> 
> What's the specific situation/bug that you're trying to fix with
> this patch? You don't say in the commit message.
> We should be able to put in a point fix to deal with whatever it is,
> but it's hard to suggest what that would be without the detail
> of what exactly we're getting wrong. (It's the PAR format stuff,
> right? But which ATS instruction are you using, from which
> exception level, with which register width, for which stage
> 1 page table format and stage 1 guest register width?)

Thank you for understanding, I am not really up for heavy refactoring
in QEMU right now :-)

Yes, I am trying to fix the AT instruction, which is used by Xen for
address translations. Xen always runs at EL2. do_ats_write takes the
wrong path because extended_addresses_enabled assumes EL1.

To go more into details, virt_to_maddr translates a Xen virtual address
into a physical address. Xen implements virt_to_maddr as:

  static inline paddr_t __virt_to_maddr(vaddr_t va)
  {
      uint64_t par = va_to_par(va);
      return (par & PADDR_MASK & PAGE_MASK) | (va & ~PAGE_MASK);
  }

Where va_to_par is:

  #define ATS1HR          p15,4,c7,c8,0   /* Address Translation Stage 1 Hyp. Read */
  static inline uint64_t __va_to_par(vaddr_t va)
  {
      uint64_t par, tmp;
      tmp = READ_CP64(PAR);
      WRITE_CP32(va, ATS1HR);
      isb(); /* Ensure result is available. */
      par = READ_CP64(PAR);
      WRITE_CP64(tmp, PAR);
      return par;
  }

This is what breaks Xen 64-bit booting on qemu-system-aarch64.

For completeness, I'll also point out other uses of ATS instructions in
Xen.

Xen uses the following to translate a guest virtual address into a
physical address (Xen has no saying in the guest pagetable format or
register width):

  #define ATS12NSOPR      p15,0,c7,c8,4   /* Address Translation Stage 1+2 Non-Secure Kernel Read */
  #define ATS12NSOPW      p15,0,c7,c8,5   /* Address Translation Stage 1+2 Non-Secure Kernel Write */
  static inline uint64_t gva_to_ma_par(vaddr_t va, unsigned int flags)
  {
      uint64_t par, tmp;
      tmp = READ_CP64(PAR);
      if ( (flags & GV2M_WRITE) == GV2M_WRITE )
          WRITE_CP32(va, ATS12NSOPW);
      else
          WRITE_CP32(va, ATS12NSOPR);
      isb(); /* Ensure result is available. */
      par = READ_CP64(PAR);
      WRITE_CP64(tmp, PAR);
      return par;
  }

Finally, Xen uses the following to translate guest virtual addresses
into pseudo-physical addresses:

  #define ATS1CPR         p15,0,c7,c8,0   /* Address Translation Stage 1. Non-Secure Kernel Read */
  #define ATS1CPW         p15,0,c7,c8,1   /* Address Translation Stage 1. Non-Secure Kernel Write */
  
  static inline uint64_t gva_to_ipa_par(vaddr_t va, unsigned int flags)
  {
      uint64_t par, tmp;
      tmp = READ_CP64(PAR);
      if ( (flags & GV2M_WRITE) == GV2M_WRITE )
          WRITE_CP32(va, ATS1CPW);
      else
          WRITE_CP32(va, ATS1CPR);
      isb(); /* Ensure result is available. */
      par = READ_CP64(PAR);
      WRITE_CP64(tmp, PAR);
      return par;
  }
