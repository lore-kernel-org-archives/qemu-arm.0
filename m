Received: by 10.25.0.144 with SMTP id 138csp510841lfa;
        Wed, 26 Apr 2017 16:11:34 -0700 (PDT)
X-Received: by 10.200.48.98 with SMTP id g31mr2537627qte.82.1493248293925;
        Wed, 26 Apr 2017 16:11:33 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id t42si826564qtt.330.2017.04.26.16.11.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 16:11:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 65B0121BC1;
	Wed, 26 Apr 2017 19:11:33 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 19:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=0hOPXyU2Gk8eELjx2i+rIQo0+lv8uvpJ9ViFwc
	yc+wE=; b=G/N3LhEtXzHqHrv7Xsh0FFUNVdIvstuHzqhDqSMmHfEYb3hydNMnxm
	OT80NG+0+fy9Du/NcjfHexsE9iY0caGj9vIHyhONg3c2Aiw9E4XFNYnF2pQ40C8H
	VoIIqWUN7Xfxfv+a2IG99BU57V/BElFw+t/uxMiTf+GX8D7j6CKWc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=0hOPXyU2Gk8eELjx2i
	+rIQo0+lv8uvpJ9ViFwcyc+wE=; b=TuvyljlaJT1bQegWbK/KKVYBVAwC4b8fuZ
	IyEYOKjAR1Bm5jhTI+VrM883Kkz7FCwgbaT/vob0mq9RH425SZnG9ln6rMFHy2e9
	W44SYz90tg3zh5jwHWAvoUfooCocat6TlGogxCuvJlVO6Vyy7HN/ZKihpkf0CMo8
	Qu0/f63U3MYpsnSScqWSDlT9/5zpqcSgBP/dBbPv+Z4oeCL1mGytpDe8tjctGk5K
	gndenwMoHKJyfkogNHgst6JNIaT4D6Q9Y/GU6mFXGmk5/HyeT+LHkkMlB5o37JbE
	EjMcedokKMCV+pCLiffWHnpnTy7VoTWtHHPXJzjJrQmZmGgVsn+Q==
X-ME-Sender: <xms:JSkBWXNBTkihqXrqXXXNliJIZbt59Y1CpMyqkpTpeXDEdnWVzvU4BA>
X-Sasl-enc: yZFXuiGFvkJdbo2Ytf14Lz7b7AlLF903hF6ICmumtEPN 1493248293
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 13B8A24765;
	Wed, 26 Apr 2017 19:11:33 -0400 (EDT)
Date: Wed, 26 Apr 2017 19:11:32 -0400
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
Message-ID: <20170426231132.GC16014@flamenco>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
 <1493187803-4510-2-git-send-email-cota@braap.org>
 <e206fe3e-5920-49c5-8f95-e4961aad5f89@twiddle.net>
 <20170426215604.GA16014@flamenco>
 <22fb44cc-b8de-c3fb-0980-bfc908229a2e@twiddle.net>
 <20170426224531.GB16014@flamenco>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170426224531.GB16014@flamenco>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: RO8pzIjaYwnG

On Wed, Apr 26, 2017 at 18:45:31 -0400, Emilio G. Cota wrote:
> On Thu, Apr 27, 2017 at 00:29:49 +0200, Richard Henderson wrote:
> > On 04/26/2017 11:56 PM, Emilio G. Cota wrote:
> > >On Wed, Apr 26, 2017 at 10:40:45 +0200, Richard Henderson wrote:
> > >>On 04/26/2017 08:23 AM, Emilio G. Cota wrote:
> > >(snip)
> > >>>+    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
> > >>>+    tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(addr)]);
> > >>>+    if (likely(tb && tb->pc == addr && tb->cs_base == cs_base &&
> > >>>+               tb->flags == flags)) {
> > >>
> > >>This comparison is wrong.  It will incorrectly reject a TB for i386 guest
> > >>when CS_BASE != 0.  You really want
> > >>
> > >>   tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(addr)]);
> > >>   if (tb) {
> > >>     cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
> > >>     if (tb->pc == pc && tb->cs_base == cs_base && tb->flags == flags) {
> > >>       return tb->tc_ptr;
> > >>     }
> > >>   }
> > >>   return tcg_ctx.code_gen_epilogue;
> > >
> > >wrt the comparison, the only change I notice in your suggested change is
> > >   tb->pc == pc
> > >
> > >instead of
> > >   tb->pc == addr
> > >
> > >, which seems innocuous to me (since tb->pc == addr).
> > >
> > >I fail to see how this relates to your "CS_BASE != 0" comment.
> > >What am I missing?
> > 
> > Recall how you computed vaddr for target/i386:
> > 
> >   addr = pc + cs_base
> 
> I see, thanks!

Hmm TB's are added to tb_jmp_cache by pc, not by pc + cs_base:

  atomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);

Shouldn't we then pass just the pc (without adding cs_base) to
lookup_ptr, then? i.e.

--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -2533,11 +2533,7 @@ gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf, TCGv jr)
     } else if (s->tf) {
         gen_helper_single_step(cpu_env);
     } else if (!TCGV_IS_UNUSED(jr)) {
-        TCGv vaddr = tcg_temp_new();
-
-        tcg_gen_add_tl(vaddr, jr, cpu_seg_base[R_CS]);
-        tcg_gen_lookup_and_goto_ptr(vaddr);
-        tcg_temp_free(vaddr);
+        tcg_gen_lookup_and_goto_ptr(jr);
     } else {
         tcg_gen_exit_tb(0);
     }

And while at it, rename the "addr" argument in lookup_ptr to "pc". Hmm?

		E.
