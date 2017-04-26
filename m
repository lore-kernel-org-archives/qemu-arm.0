Received: by 10.25.0.144 with SMTP id 138csp502837lfa;
        Wed, 26 Apr 2017 15:45:32 -0700 (PDT)
X-Received: by 10.237.62.150 with SMTP id n22mr2297158qtf.70.1493246732418;
        Wed, 26 Apr 2017 15:45:32 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id a53si794934qtb.6.2017.04.26.15.45.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 15:45:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id CD4C620FDC;
	Wed, 26 Apr 2017 18:45:31 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 18:45:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=a+Xe7/65NurHRYOE7e3mQkW/jNnEa81xGw5CyB
	cFFRY=; b=D8CeyQiBn24e6oNRHMO/W4Ek7kUmDxLAvxm7lHdDZdPQ8yrQ2CZ7bj
	bTGEZQJmv4wku+UoG9u2fMd7YDJLKVH/+fPVAB3YYl/H0Zj7k/o2ztBDZuIUlQy6
	v9DO2LA+rWaNHtiB2TJ1IJGW/XtA/VIay6SV9eXKxI2ScMVUESa3Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=a+Xe7/65NurHRYOE7e
	3mQkW/jNnEa81xGw5CyBcFFRY=; b=q0R/mZguh6u5dPMYne9XmmiMOr1r97SevH
	8pAYRggf4WGvjV3xSgDvTGJZDnHvpg5nAEfgOPx7P2vJDeP9KC8QZAPQxBh2jF1x
	Du0/M1GfV69hkaFs5ayihWbkCiwRlVQChp5uCCVhC3g0QbzWnFnzfnz50hG2NEzF
	zfYqg+AhgtFnDYWSCaReE8xpFb0SZX1j8kT7oNSVvl/LPJZC4qR9JkX4aLtWxw2n
	pF2kr+FJ3iU6j9qUXpMZcgtTir90oqkvy2AOvX9Tz1unWCUMVvmZOFaTIGA8qvr0
	dral7RYiH0+kxds2QeOUksoTvg9ZjcWyQBVXD8C2nbcejVuZRsqQ==
X-ME-Sender: <xms:CyMBWTV5CQ-JgceHaPWHP2TYi2WjoKO20qIn4BmPuqJgxAfB8Vl_qQ>
X-Sasl-enc: rtltXmOEEB0/dSctxOTN+l531wCcGXJo9C6E/iMJKuWE 1493246731
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 836D52471A;
	Wed, 26 Apr 2017 18:45:31 -0400 (EDT)
Date: Wed, 26 Apr 2017 18:45:31 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org, alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: Re: [PATCH v3 01/10] tcg-runtime: add lookup_tb_ptr helper
Message-ID: <20170426224531.GB16014@flamenco>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
 <1493187803-4510-2-git-send-email-cota@braap.org>
 <e206fe3e-5920-49c5-8f95-e4961aad5f89@twiddle.net>
 <20170426215604.GA16014@flamenco>
 <22fb44cc-b8de-c3fb-0980-bfc908229a2e@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22fb44cc-b8de-c3fb-0980-bfc908229a2e@twiddle.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: 3CjtaTQeiNmN

On Thu, Apr 27, 2017 at 00:29:49 +0200, Richard Henderson wrote:
> On 04/26/2017 11:56 PM, Emilio G. Cota wrote:
> >On Wed, Apr 26, 2017 at 10:40:45 +0200, Richard Henderson wrote:
> >>On 04/26/2017 08:23 AM, Emilio G. Cota wrote:
> >(snip)
> >>>+    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
> >>>+    tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(addr)]);
> >>>+    if (likely(tb && tb->pc == addr && tb->cs_base == cs_base &&
> >>>+               tb->flags == flags)) {
> >>
> >>This comparison is wrong.  It will incorrectly reject a TB for i386 guest
> >>when CS_BASE != 0.  You really want
> >>
> >>   tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(addr)]);
> >>   if (tb) {
> >>     cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
> >>     if (tb->pc == pc && tb->cs_base == cs_base && tb->flags == flags) {
> >>       return tb->tc_ptr;
> >>     }
> >>   }
> >>   return tcg_ctx.code_gen_epilogue;
> >
> >wrt the comparison, the only change I notice in your suggested change is
> >   tb->pc == pc
> >
> >instead of
> >   tb->pc == addr
> >
> >, which seems innocuous to me (since tb->pc == addr).
> >
> >I fail to see how this relates to your "CS_BASE != 0" comment.
> >What am I missing?
> 
> Recall how you computed vaddr for target/i386:
> 
>   addr = pc + cs_base

I see, thanks!

		Emilio
