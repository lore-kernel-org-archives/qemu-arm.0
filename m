Received: by 10.25.0.144 with SMTP id 138csp512482lfa;
        Wed, 26 Apr 2017 16:17:33 -0700 (PDT)
X-Received: by 10.237.58.70 with SMTP id n64mr2627345qte.196.1493248653809;
        Wed, 26 Apr 2017 16:17:33 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id o5si808562qkd.300.2017.04.26.16.17.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 16:17:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 66A6021B98;
	Wed, 26 Apr 2017 19:17:33 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 19:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=uclk/bIKRtp9CmDCcOvN6paT3xZO+f2PL6HRPa
	xSokU=; b=qpDQAeznxuh1j6nLowTBPQ2N8rtR3w084lq26CZ3QNlFRK1CImfcXa
	nLt2MUiT6xJ+ghaqL9TJrqwG/Z7u+X+9IAUZAxr2EiRsbZXGiCXrgcX4R6Z12o9I
	/sx2vPqDGfjORLKBQaqnItoJcqUbHXaWw/38QGhfAWUwjSmH0vbL0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=uclk/bIKRtp9CmDCcO
	vN6paT3xZO+f2PL6HRPaxSokU=; b=h/lsnALqmCsCPmjBnpMDrEV8mLNa0+pEAX
	7odDxn1zLJTWHtdkRJf2QUecC5b9sfK7bcUwIzcKBR5h1mboRqhF3Y/kQb5J+ICq
	X//EwzTplYZjcw3l//VGD1SujQ/lC2GtB4lswZiUENlw4pTZzzodJ0L/z/dC622s
	CPaz6mYScgcM/rAwLLk+FmgVwbprKZsCjhg8XIFXjjfdAE+azbqV3DLfvtwJDW7c
	u/Y7z0622aeolh4opsgH+g9EDzF/ziB6bUkppzLndQmE827Z79fZ2eI8+F+zWm1i
	1veqJunzmjLVNER3qOFXXdpjDkkCMY+AchuThNP0qAlSoWgMQ5dQ==
X-ME-Sender: <xms:jSoBWQawp1cEUm_yjuM7y5L5301shfUPN-_0NnxR0djnC5b9m2hrZA>
X-Sasl-enc: oWz6IaDC7XQVXuJ5Zko2XOE+jWywX98j0fJ8IJ2kK/RB 1493248653
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1BF537E352;
	Wed, 26 Apr 2017 19:17:33 -0400 (EDT)
Date: Wed, 26 Apr 2017 19:17:32 -0400
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
Message-ID: <20170426231732.GA27379@flamenco>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
 <1493187803-4510-2-git-send-email-cota@braap.org>
 <e206fe3e-5920-49c5-8f95-e4961aad5f89@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e206fe3e-5920-49c5-8f95-e4961aad5f89@twiddle.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: fvZMuGHYOQ66

On Wed, Apr 26, 2017 at 10:40:45 +0200, Richard Henderson wrote:
> On 04/26/2017 08:23 AM, Emilio G. Cota wrote:
> >This paves the way for upcoming work.
> >
> >Reviewed-by: Richard Henderson <rth@twiddle.net>
> >Signed-off-by: Emilio G. Cota <cota@braap.org>
> >---
> >  tcg-runtime.c     | 21 +++++++++++++++++++++
> >  tcg/tcg-runtime.h |  2 ++
> >  tcg/tcg.h         |  1 +
> >  3 files changed, 24 insertions(+)
> >
> >diff --git a/tcg-runtime.c b/tcg-runtime.c
> >index 4c60c96..90d2d4b 100644
> >--- a/tcg-runtime.c
> >+++ b/tcg-runtime.c
> >@@ -27,6 +27,7 @@
> >  #include "exec/helper-proto.h"
> >  #include "exec/cpu_ldst.h"
> >  #include "exec/exec-all.h"
> >+#include "exec/tb-hash.h"
> >  /* 32-bit helpers */
> >@@ -141,6 +142,26 @@ uint64_t HELPER(ctpop_i64)(uint64_t arg)
> >      return ctpop64(arg);
> >  }
> >+    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
> >+    tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(addr)]);
> >+    if (likely(tb && tb->pc == addr && tb->cs_base == cs_base &&
> >+               tb->flags == flags)) {
> 
> This comparison is wrong.  It will incorrectly reject a TB for i386 guest
> when CS_BASE != 0.  You really want
> 
>   tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(addr)]);
>   if (tb) {
>     cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
>     if (tb->pc == pc && tb->cs_base == cs_base && tb->flags == flags) {
>       return tb->tc_ptr;
>     }
>   }
>   return tcg_ctx.code_gen_epilogue;
> 
> where you don't even load the cpu state if there isn't a preliminary hit in
> the cache.

Yes, I like this.

> (Note to self: That minor optimization would also apply to tb_find.)

FWIW I looked at tb_find -- you need the pc though, which comes from
loading the CPU state:

    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
                               ^^
    tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)]);
                                                                   ^^

If we wanted to really avoid getting all the state I guess we'd have to add
another function that returned just the pc.

		E.
