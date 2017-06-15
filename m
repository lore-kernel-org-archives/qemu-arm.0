Received: by 10.25.0.23 with SMTP id 23csp624664lfa;
        Wed, 14 Jun 2017 22:19:36 -0700 (PDT)
X-Received: by 10.55.126.197 with SMTP id z188mr4094804qkc.121.1497503976173;
        Wed, 14 Jun 2017 22:19:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497503976; cv=none;
        d=google.com; s=arc-20160816;
        b=bga6VMELZNIOWL9D1q904ST2sZczhPhaVa2aREddpkUfLnRo15VD2qK/AH6eMbe+k8
         Rj31b3EiV9vPQB5x6Rf1pa/0GCNLQ4fdrjtdr2E0nZhPL7AvZydG4j1uq8Tzpfv1byhR
         CGwa0AK/KU+ghz3YpxiuZAwtQyNxYqvHhpEsxiyN0R5zmWmZzXYhiVjETlpRsihWEOuR
         0G62OH0oUHN7xlPFR5qwsTm8hCcfrJ5Y6hzHZX82AGBtiCQ3L1PPUaFzl4SGlddFgKTb
         9+DRe92/kaPns7yC++WQst8ILPsXgZzKpkPrxzJ8HI3QnKUK+vb3mlqxsn8yY4GiriRn
         VOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=qj+XwvUFtyV/C/sTgK24nS54bRteu9T8ohzCemVaswg=;
        b=YI8GbE0JGI82ss2Wt6mlqoNxh6oauRyuSwrkkNMhj65e0X+gYKTH/WXATedefveC3e
         ieUFTNImQB7lb6VUmlU0tQzgSN+h/3VTgJt2nHoDfnw4fJaHt5Pt6yvW6qsEwCBXLNix
         fraqtqnU/19gWtsNtHvl5iNS0Mvjx1ZXMfBI0Rd2dhL4l2W8N6EJDBPkyX5xBomSU7ha
         zYUVqwW/yrsJsvfPtu7r9uixOQRbRF6JDvnwzivgz36wdFow2CIH56EuItuadlJe6FGm
         rAthu1xPW4fRUe4olKEXrqSVs//uMWwJoOTgX3UZQbvCqiAFXzmu8EBjmCzGBgQJzhhG
         llhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.b=MsbhmpIO;
       dkim=pass header.i=@messagingengine.com header.b=pzzNGz1J;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id p68si2048474qkb.237.2017.06.14.22.19.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2017 22:19:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.b=MsbhmpIO;
       dkim=pass header.i=@messagingengine.com header.b=pzzNGz1J;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id BE34820B8F;
	Thu, 15 Jun 2017 01:19:35 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Thu, 15 Jun 2017 01:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=qj+XwvUFtyV/C/sTgK24nS54bRteu9T8ohzCem
	Vaswg=; b=MsbhmpIObJqdQrpqghN8W7JBXaR/iQVqy52x1PrImQqnojcv3uf/X9
	4m6KRRb56oCUSVsp9rje+QcTiRqd3KNa3SXMJGBIfI9GfQuqrq4BK4POtBB6XGVh
	O3Rr0LEXm6DwUmO0Y+hWjNqKQTp/pwEITt7UvoLbC/hYwUTkF6lw8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=qj+XwvUFtyV/C/sTgK
	24nS54bRteu9T8ohzCemVaswg=; b=pzzNGz1J9v22RLto+sdMdTyMlqHSWu1Y8K
	npVJPy2R16sPhtq4TCY6tCf430KUKG1ONjkN0N9/yz0GSFlBN+Q6RtYdiyPeP2ts
	6JJhJJoHg1bgsnXTCBb/U8Xd9ULAfoslBCwj0lToRnEn0TtlRuweol4mAogVaqgb
	yXX6epMkygjECCD6dfBp+VM+Cjl5nVymI80QWfI11STzPswzWkwDvmCZEM6eG3xX
	UNUVQwu1EBTu/rDb+3dUrGIT1jHFpqph9MNg4CRDyR/Ecc2dt5YXIMtY8QlhLlpg
	l6tCiq81hf4jx8pkWcfSEide3TZyjoh3K63J4CPqArD/fG/16U2w==
X-ME-Sender: <xms:5xhCWelTX2b55zg1qB9Uy6FAlLJHWCOaMiq2i3PhoORO7coNakxdmg>
X-Sasl-enc: 4XinnDWL2/i2fJMVfRHHUJafsIg1iBY6AHgzHdACQzkE 1497503975
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7583624767;
	Thu, 15 Jun 2017 01:19:35 -0400 (EDT)
Date: Thu, 15 Jun 2017 01:19:35 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, pbonzini@redhat.com,
	qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] target/aarch64: exit to main loop after 'msr daifclr'
Message-ID: <20170615051935.GA6079@flamenco>
References: <20170614194821.8754-1-rth@twiddle.net>
 <20170614194821.8754-6-rth@twiddle.net>
 <20170614203343.GB8420@flamenco>
 <f348b0f7-a8ef-0347-2312-93462d8652f6@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f348b0f7-a8ef-0347-2312-93462d8652f6@twiddle.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: dY6DOzfdEOZ+

On Wed, Jun 14, 2017 at 18:20:29 -0700, Richard Henderson wrote:
> On 06/14/2017 01:33 PM, Emilio G. Cota wrote:
> >On Wed, Jun 14, 2017 at 12:48:21 -0700, Richard Henderson wrote:
> >>Exit to cpu loop so we reevaluate cpu_arm_hw_interrupts.
> >>
> >>Cc: qemu-arm@nongnu.org
> >>Cc: Peter Maydell <peter.maydell@linaro.org>
> >>Signed-off-by: Richard Henderson <rth@twiddle.net>
> >>---
> >>  target/arm/translate-a64.c | 7 ++++++-
> >>  1 file changed, 6 insertions(+), 1 deletion(-)
> >>
> >>diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> >>index 860e279..e55547d 100644
> >>--- a/target/arm/translate-a64.c
> >>+++ b/target/arm/translate-a64.c
> >>@@ -1422,7 +1422,9 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
> >>          gen_helper_msr_i_pstate(cpu_env, tcg_op, tcg_imm);
> >>          tcg_temp_free_i32(tcg_imm);
> >>          tcg_temp_free_i32(tcg_op);
> >>-        s->is_jmp = DISAS_UPDATE;
> >>+        /* For DAIFClear, exit the cpu loop to re-evaluate pending IRQs.  */
> >>+        gen_a64_set_pc_im(s->pc);
> >
> >For op != 0x1f we end up setting the pc twice (first here, then in
> >the switch statement). It's still correct though.
> 
> No, that's why I switched to DISAS_JUMP.
> 
(snip)
> >+        case DISAS_EXIT:
> >+            gen_a64_set_pc_im(dc->pc);
> >+            tcg_gen_exit_tb(0);
> >+            break;
> 
> This gives translate-a64.c and translate.c different semantics for
> DISAS_EXIT. I considered that to be a bad thing.

Agreed with the above two. Sorry I missed this in my first read
of the patch, it seems that my writing of my version of this patch
impaired my ability to review another version :-)

Thanks for the clarifications!

Reviewed-by: Emilio G. Cota <cota@braap.org>
Tested-by: Emilio G. Cota <cota@braap.org>

		E.
