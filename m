Received: by 10.25.44.15 with SMTP id s15csp4327033lfs;
        Mon, 24 Jul 2017 14:23:28 -0700 (PDT)
X-Received: by 10.200.47.146 with SMTP id l18mr17203113qta.176.1500931408666;
        Mon, 24 Jul 2017 14:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500931408; cv=none;
        d=google.com; s=arc-20160816;
        b=uxvIfC9eJ6lWWP8NChmxRBn75eHUcotxJkaFmsfxKOPHjsRZ5LQhYL0NZDxhEE+9HQ
         C/kYDgzFbv0ziYWHzyMCgrk1AAuQ5Ql2RYuqno2sZZ9A+0JCH/hlkfBs83nb+nG5rY7z
         9LvBSCRy35uADvrFaBRVZXT+AeAvY4nGltRJZOwGmlgDbokcN78a5DzmXiISvqiiqVKr
         Ihy49sPhI5gBVDoT5aioheCXHc2ecP1rfJrbFIVyvVslSf0xaoRW0UlRqTtwEitWO6dl
         XGOxK3FfG5OlcDbUfEYih+6zxhhOa5qN/ieFPsn4hTyGhIcKCxsg4VDV3XtaonaCApwW
         LQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=Uqqn8PWYOS7Bq8QQ3mWVAuuRjIATJFCCowpLaxq1vIE=;
        b=paKsBRTcNpymj7g5kKUhdCIOv3jAC8zQzFjcEuyZo2c5ErnLJNGoRFy2TfNo6n+H0B
         N6sGRb2nBMJNoFb0OKcb2F1RXMd93AGH3UvbbG8RcK4veAbiU83aWMy8ZyqVUTIbJeFN
         Nzu7eUxsJiX+wnnaQxpei7+qf9BIe99KQP2Kqzh5qbN7tLVNR0dIH+fAFjaOFYy25iK0
         lfzDYWzzsMBlN6gbSW/046guZMd3il8JGQb81Nv4EuaRJLInX0wjT7vSQRoOaIGmr69S
         C55a58wQl37B4Yl1OMAaRl0cWUYYq3d0W+yeOiGPoI/F+Zzjh9w2RrWrOomPkwEKi67F
         ME/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.b=KZDEUQ5E;
       dkim=pass header.i=@messagingengine.com header.b=g2bJ9OeZ;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id b131si10035834qka.411.2017.07.24.14.23.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jul 2017 14:23:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.b=KZDEUQ5E;
       dkim=pass header.i=@messagingengine.com header.b=g2bJ9OeZ;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 3E707224F1;
	Mon, 24 Jul 2017 17:23:28 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Mon, 24 Jul 2017 17:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=Uqqn8PWYOS7Bq8QQ3mWVAuuRjIATJFCCowpLax
	q1vIE=; b=KZDEUQ5EyvYD0MyOtrkvoYTzFKPCKTjeOJy2qRdcbe5fNaJmvDyL3N
	PqVTATr2eok7GejW+Lzl37zeLYngdGjy9g4ewuUfQoQgeKJ9Nr9rnjJdg4IRIwdl
	GDeYDh9KqHrTXPw9PXHduVEZLYejuQgdtmFqo0H8UXes1yhST9PGc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Uqqn8PWYOS7Bq8QQ3m
	WVAuuRjIATJFCCowpLaxq1vIE=; b=g2bJ9OeZBx3jd+VsOeJMAdnfPi0VYuF33Q
	P/d/ku6kfHmBgC69eb6l4svFJ9LVfkjVJNWk+zq1L3UV4MEHd6gMnTGD70sF7uw4
	9cOr0/sQVHHrmNacl8MnpTERBIQtY6qA/VAwlgcBCH2sUOuCmYay63EEMo1XRAic
	YkeKL7ZfkGMNacOQK8zvGi1H1raKYpSnZI81riNJVdji+STtu2D1DWSCSy2tqMTi
	Q22BQi5yYE9p+pTVS+JM4rZVO0cXU3Cjm/62s1LSLLH8J0CplVkW6vP9f3/SEvla
	xmL7eQLQ5jXMZEVpPzvM7lX1jDNQVKfmYKNDc8SV6ICUekFn2okQ==
X-ME-Sender: <xms:UGV2Wdiy0vQsR03L0qJPH2JCP1xG5ip3LfcB1guGVnPCZH6kmO-HQg>
X-Sasl-enc: CrruQ4Tk+ZIONk00mZEB9DjWLMGnNsPA5NsSyBczYyXo 1500931408
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0C79A7E186;
	Mon, 24 Jul 2017 17:23:28 -0400 (EDT)
Date: Mon, 24 Jul 2017 17:23:27 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Andrey Shedel <ashedel@microsoft.com>,
	Richard Henderson <rth@twiddle.net>,
	Alex =?utf-8?B?QmVubu+/vWU=?= <alex.bennee@linaro.org>,
	Pranith Kumar <bobby.prani@gmail.com>
Subject: Re: [Qemu-devel] Torn read/write possible on aarch64/x86-64 MTTCG?
Message-ID: <20170724212327.GA24963@flamenco>
References: <DM2PR21MB0060EFC1F6B9F0883A1792369EBB0@DM2PR21MB0060.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM2PR21MB0060EFC1F6B9F0883A1792369EBB0@DM2PR21MB0060.namprd21.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: SZ43Gvc/js7z

(Adding some Cc's)

On Mon, Jul 24, 2017 at 19:05:33 +0000, Andrew Baumann via Qemu-devel wrote:
> Hi all,
>
> I'm trying to track down what appears to be a translation bug in either
> the aarch64 target or x86_64 TCG (in multithreaded mode). The symptoms
> are entirely consistent with a torn read/write -- that is, a 64-bit
> load or store that was translated to two 32-bit loads and stores --
> but that's obviously not what happens in the common path through the
> translation for this code, so I'm wondering: are there any cases in
> which qemu will split a 64-bit memory access into two 32-bit accesses?

That would be a bug in MTTCG.

> The code: Guest CPU A writes a 64-bit value to an aligned memory
> location that was previously 0, using a regular store; e.g.:
>	f9000034 str	     x20,[x1]
>
> Guest CPU B (who is busy-waiting) reads a value from the same location:
>	f9400280 ldr	     x0,[x20]
>
> The symptom: CPU B loads a value that is neither NULL nor the value
> written. Instead, x0 gets only the low 32-bits of the value written
> (high bits are all zero). By the time this value is dereferenced (a
> few instructions later) and the exception handlers run, the memory
> location from which it was loaded has the correct 64-bit value with
> a non-zero upper half.
>
> Obviously on a real ARM memory barriers are critical, and indeed
> the code has such barriers in it, but I'm assuming that any possible
> mistranslation of the barriers is irrelevant because for a 64-bit load
> and a 64-bit store you should get all or nothing. Other clues that may
> be relevant: the code is _near_ a LDREX/STREX pair (the busy-waiting
> is used to resolve a race when updating another variable), and the
> busy-wait loop has a yield instruction in it (although those appear
> to be no-ops with MTTCG).

This might have to do with how ldrex/strex is emulated; are you relying
on the exclusive pair detecting ABA? If so, your code won't work in
QEMU since it uses cmpxchg to emulate ldrex/strex.

> The bug repros more easily with more guest VCPUs, and more load on the
> host (i.e. more context switching to expose the race). It doesn't repro
> for the single-threaded TCG. Unfortunately it's hard to get detailed
> trace information, because the bug only repros roughly every one in 40
> attempts, and it's a long way into the guest OS boot before it arises.
>
> I'm not yet 100% convinced this is a qemu bug -- the obvious path
> through the translator for those instructions does 64-bit memory
> accesses on the host -- but at the same time, it has never been seen
> outside qemu, and after staring long and hard at the guest code, we're
> pretty sure it's correct. It's also extremely unlikely to be a wild
> write, given that it occurs on a wide variety of guest call-stacks,
> and the memory is later inconsistent with what was loaded.
>
> Any clues or debugging suggestions appreciated!

- Pin the QEMU-MTTCG process to a single CPU. Can you repro then?

- Force the emulation of cmpxchg via EXCP_ATOMIC with:

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 87f673e..771effe5 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2856,7 +2856,7 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
         }
         tcg_temp_free_i64(t1);
     } else if ((memop & MO_SIZE) == MO_64) {
-#ifdef CONFIG_ATOMIC64
+#if 0
         gen_atomic_cx_i64 gen;

         gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];

This will halt all other vCPUs before the calling vCPU performs
the cmpxchg. Can you reproduce then?

		Emilio
