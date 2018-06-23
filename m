Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2121999wrq;
        Sat, 23 Jun 2018 11:20:57 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLkgfX/t1ue33yM9oS6vgZ3MJfcF9V6/fAwd5Isong6dHEndnAmOZhN3XD0NC+Q64Z9uJNY
X-Received: by 2002:aed:2b44:: with SMTP id p62-v6mr3665202qtd.103.1529778056999;
        Sat, 23 Jun 2018 11:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529778056; cv=none;
        d=google.com; s=arc-20160816;
        b=g1tD5wOACZitrDMOFgwf19KGPx8ADSjBKLTvEDJN3tjIC7eHKhRmXh03tbfGBSVTWv
         BvXcFX7XuYzB06Gn2h5f/xEDaftn9HDfpqz8nNuGKEMs54x8zFr71DC1ycFyGix6Ws+E
         uzUouvwpvX/f1XfgJCdtpUVcAKEy7a/IXXWQsrLY1MqcZoSHpYeKzFZ1gFVufC0rYnC8
         KtDTzVC52yjGPZAO5gG0LYCV+8qM5sOizCrvE5y17zfmCuWuq2Z9VkhFCmYLASXt3r5Y
         AzebRgdZjj3gqfSspD29HhE7VxJ468TAtM/BAtNHqWFxYVAQdvTbTveQmkQHF9ksCQHT
         jDxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=sI1lcS9ZpBIn8N/pLOBW4FFer59fVNsvmEpuitmvCR4=;
        b=kdUghTXd8/GmBQ21olLQ6gZIpjbTjLBqqOhZdYpX22b1JcpjWJqbTIMeeVF+TREiRb
         WEyoZ8jkD07FoJe+V6Ch0V1GF+j6p1NV9wKtIkc5w8Zq41kzHCT5XVSnUec+vZwAu444
         SfSNNV0kLvzHgrTzu0oDUo/egBDIUMrFiymcUtkUU4Tru6pBx3f8ZyFw907G8eN2qU3l
         OUmnFEsUoeDgNKlQIQ4LBXKArJeaDjfLD9i5P1Z6zXDyVz9rynIBwMQuf33MSG5v84cB
         46j6Dz1UaYOD5bF/QV8ledsW8bRxuRJrbc5UwZr64D2mDN0ZJiiFqtoOiqG7savxqZzp
         +/4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=X+1PQ2FW;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=EZsoYNUH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6-v6si5390178qte.149.2018.06.23.11.20.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 11:20:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=X+1PQ2FW;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=EZsoYNUH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWn9c-0002jS-ID
	for alex.bennee@linaro.org; Sat, 23 Jun 2018 14:20:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1fWn9S-0002jL-Bx
	for qemu-arm@nongnu.org; Sat, 23 Jun 2018 14:20:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1fWn9O-000461-DP
	for qemu-arm@nongnu.org; Sat, 23 Jun 2018 14:20:46 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:34665)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1fWn9O-00045s-52; Sat, 23 Jun 2018 14:20:42 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id EFC5921B1B;
	Sat, 23 Jun 2018 14:20:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Sat, 23 Jun 2018 14:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=sI1lcS9ZpBIn8N/pLOBW4FFer59fVNsvmEpuitmvCR4=; b=X+1PQ
	2FWBp/osMcPLfydygGGqc0RGi5UMKZEOcI/gx4O13/AuqCQ3pA/x+PZg1RyTO2sp
	H2Huwy+qCnKSBb2e1g//gm3mAeAKLxazQc/s5KJ774nj5PNgTcP+/MOxF7sUfHgl
	nnsBdurxDUqnisQ36hVPCTVIKSft1DFRXwmp6I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=sI1lcS9ZpBIn8N/pLOBW4FFer59fV
	NsvmEpuitmvCR4=; b=EZsoYNUHHZBUIRDSMNbDLDMZT5z2Ji9zb84GO8E72wRXT
	R1rNsB7McgjTS6BSDa/F9UFdbkKjoaRI8iu5qnvqfNvZ1c2U8bQe784vH8W2PXg+
	dKlZkGApowSuiBtu1e/O2DCN6jiL+CYbchQHgKH4mXDIrNIgRyXN46+lESdg24NS
	bWTf9fWqB7w0HbAtBE+KqpZBJPoDK5CPC/Ro6O7FuBWLyBnYxo11hqThXbAu6bYD
	mXoC6agFvo6rr3xrNneCoo5dYExgh7ynJlSCahwcK1zWPYAH7FsdRfbq4ZFIwxlE
	w6R3taEV3VP/gghvwiwCnaBF6JGYOKQDihgyCDHbg==
X-ME-Proxy: <xmx:d48uW3REyenxlG549UDevY4tkMVIgQ6b-tt_1uaag-77bhrqt-TmIQ>
	<xmx:d48uWzdjz--Qon4U1HD3EzBfeQnyUunwWlX3muRfm2PlDeFX86PY8g>
	<xmx:d48uW1hypkRVxcYAsBhlJ2Cj-jHm7LEocDJdzclmZ1ZN4ZU4CI3m0w>
	<xmx:d48uW-JhrziRw5MnzLerCELiBBUmIeUvdkPhXmLV2wolAdMDAJsrlg>
	<xmx:d48uWyF4OjbiFMHKT0Fm2EVArEoEQjmpo0pydnRaLbMRYtc6km8V2w>
	<xmx:d48uWzhg7CoXLLsByBdLT8Bw6GlYOAuE6nImTcJ3yeUD0lsQjHiYTA>
X-ME-Sender: <xms:d48uW6Ji_u2fa1gVreA3Zv7C911EHt5bY-6_MfOJwuS1yOKgN71_cg>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 824941025C;
	Sat, 23 Jun 2018 14:20:39 -0400 (EDT)
Date: Sat, 23 Jun 2018 14:20:39 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20180623182039.GA4920@flamenco>
References: <20180621173635.21537-1-richard.henderson@linaro.org>
	<20180622211244.GA11346@flamenco>
	<1319a0f0-0009-ebfc-dab4-eec196ba8ba5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1319a0f0-0009-ebfc-dab4-eec196ba8ba5@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [PATCH 0/2] linux-user: Change mmap_lock to rwlock
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h1KQKo6TW5df

On Sat, Jun 23, 2018 at 08:25:52 -0700, Richard Henderson wrote:
> On 06/22/2018 02:12 PM, Emilio G. Cota wrote:
> > I'm curious to see how much perf could be gained. It seems that the hold
> > times in SVE code for readers might not be very large, which
> > then wouldn't let us amortize the atomic inc of the read lock
> > (IOW, we might not see much of a difference compared to a regular
> > mutex).
> 
> In theory, the uncontended case for rwlocks is the same as a mutex.

In the fast path, wr_lock/unlock have one more atomic than
mutex_lock/unlock. The perf difference is quite large in
microbenchmarks, e.g. changing tests/atomic_add-bench to
use pthread_mutex or pthread_rwlock_wrlock instead of
an atomic operation (this is enabled with the added -m flag):

$ taskset -c 0 perf record tests/atomic_add-bench-mutex  -d 4 -m
 Throughput:         62.05 Mops/s

$ taskset -c 0 perf record tests/atomic_add-bench-rwlock  -d 4 -m
 Throughput:         37.68 Mops/s

That said, it's unlikely to have real user-space code
(i.e. not from microbenchmarks) that would be sensitive to
the additional delay and/or lower scalability. It is common to
avoid frequent calls to mmap(2) due to potential serialization
in the kernel -- think for instance of memory allocators, they
do a few large mmap calls and then manage the memory themselves.

To double-check I ran some multi-threaded benchmarks from
Hoard[1] under qemu-linux-user, with and without the rwlock change,
and couldn't measure a significant difference.

[1] https://github.com/emeryberger/Hoard/tree/master/benchmarks

> > Are you using any benchmark that shows any perf difference?
> 
> Not so far.  Glibc has some microbenchmarks for strings, which I will try next
> week, but they are not multi-threaded.  Maybe just run 4 threads of those
> benchmark?

I'd run more threads if possible. I have access to a 64-core machine,
so ping me once you identify benchmarks that are of interest.

		Emilio
