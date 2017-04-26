Received: by 10.25.0.144 with SMTP id 138csp487160lfa;
        Wed, 26 Apr 2017 14:56:05 -0700 (PDT)
X-Received: by 10.200.57.73 with SMTP id t9mr2006437qtb.182.1493243765644;
        Wed, 26 Apr 2017 14:56:05 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id s45si654698qte.58.2017.04.26.14.56.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 14:56:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id AF67A208ED;
	Wed, 26 Apr 2017 17:56:04 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 17:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=vDsWhl2TZ6diUgeYGgOU6CdfhCqWOCg9Q4iX3Q
	8kFt4=; b=MkSimfNmoQDzgn4jnXCpEkZJ+DtT/zOHbV2Zqj+cZjd6sFZUyI2FVT
	Zzm3xoYAxzhg9OlSRJHVPcVyznlVUptOYR3r4tq7KbDKEGyLQ0GLoW7mGOngSg/q
	3VpDBldwpL7u22GkS4mv4fU1EcTPJr3oTS08MFHDIH1anr4rxlCoY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=vDsWhl2TZ6diUgeYGg
	OU6CdfhCqWOCg9Q4iX3Q8kFt4=; b=GuuMff4es8gikpLz5R2WTJXtZEV4SzIeCK
	sEs8qmpi4zzaxyWyFT6lU1V+db4NWqHRGQUKMp7lc6jkY/UjwCWioHkMWRhssV7e
	bplTZFOFtHPMK45wCqY1Pnjg1rdb1X4AzxMrbyxKoIas9KJ1/xAq53up3Eu+qIme
	OtSTn6uvEe9ggrIJ3fOmfiblaqWMAktOHBwZB9F7eF0/Q9jh9vpjS8z55a6I65Ze
	qUMEBJ8E2+iQ6aMainkqb/rlBrxVOLUwBaM2tlld99zgb7tWoqu4NdMssRxDlxEa
	SRad+HynsD/gK4cIqAg4JTZp+UmD4FdEzGkCT96WP/HRkk+WdEdQ==
X-ME-Sender: <xms:dBcBWWZD9u3-KTsEYB7Nw4x77pWNasgRJf9PGYl_bBPjyOVWe7qSYA>
X-Sasl-enc: tGUWtN447g2paY7YX2EUdD9AAcDUOgljQAPJtxUxT9Nv 1493243764
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 664EC7E320;
	Wed, 26 Apr 2017 17:56:04 -0400 (EDT)
Date: Wed, 26 Apr 2017 17:56:04 -0400
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
Message-ID: <20170426215604.GA16014@flamenco>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
 <1493187803-4510-2-git-send-email-cota@braap.org>
 <e206fe3e-5920-49c5-8f95-e4961aad5f89@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e206fe3e-5920-49c5-8f95-e4961aad5f89@twiddle.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: IbLB7gFNn52+

On Wed, Apr 26, 2017 at 10:40:45 +0200, Richard Henderson wrote:
> On 04/26/2017 08:23 AM, Emilio G. Cota wrote:
(snip)
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

wrt the comparison, the only change I notice in your suggested change is
  tb->pc == pc

instead of
  tb->pc == addr

, which seems innocuous to me (since tb->pc == addr).

I fail to see how this relates to your "CS_BASE != 0" comment.
What am I missing?

		E.
