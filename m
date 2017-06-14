Received: by 10.25.0.23 with SMTP id 23csp482302lfa;
        Wed, 14 Jun 2017 13:33:44 -0700 (PDT)
X-Received: by 10.55.217.136 with SMTP id q8mr2276161qkl.220.1497472424495;
        Wed, 14 Jun 2017 13:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497472424; cv=none;
        d=google.com; s=arc-20160816;
        b=SpHI1s6hV6g+O9tuhnx/8nM0rkPJqC5+ImWKzWRmjHPgBuwNVhpnJ6CuhhHfzc+e+o
         094qD6rw92Q5dvcQOm0rnqiYSP9Rq0/9O65OX+sgWp8T/UTJ3nIXuNZtqdhNLKEZyEPT
         QNP9YYZMOHf7r0Jhu/Lb7/wDuMzNFUpd+Kr3SX65j1JaN4B9gZsJx/HreaMy6SSCL8bm
         o58NUGYMZ5IzYoUq8nUFORX64rtWByGnEmdKxhhcOctdtlu5NfFLCfRcHyJz4DFCVszs
         c3kLuqHeDmkjBUd/n2X2GBnoaQJBXDzzj4wK3vTBfzFfQMhcqU+FcF5akfxGnJQvhgBj
         kgMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=hpP1ds6EZfmJ5TcfFEzajWxyavCIjFS9MAUJGRraDQQ=;
        b=wrABE+ZDceSGaOfj5MZi8sBqaKUUpcU8Yq6YCPpK+EfAi+vbHNopoWvPL/6UJK987U
         V90+dXj7BqfaFai7/GHYxDAR+JZUE2vnI9tiPsK85zE7t+6FrqYE4bSRmhLvwFfbLIwj
         rkDo6M9Sd1/Hd45ae9cUBp5EgmJJpeKj4n5K07hU+ylNRg6LPZKO6iyqY0Wm6R859UVi
         UVVrbfdVTHv2OwEEhbhqG9mcgJd0fgoEM/lLxTGjbQIueJ8FGDcom1CXHv51Y+XiHqRb
         4tBKIh+oJgEI6OA73IE2XyZXK8bhKgBRo6J/0JZQHFEhMf/WGM5QovbaOwANdVPeBFZB
         DqrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.b=G9bmdJnw;
       dkim=pass header.i=@messagingengine.com header.b=JAIZkl4z;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id v3si911885qki.103.2017.06.14.13.33.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2017 13:33:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.b=G9bmdJnw;
       dkim=pass header.i=@messagingengine.com header.b=JAIZkl4z;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 1DF0F20CFF;
	Wed, 14 Jun 2017 16:33:44 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Wed, 14 Jun 2017 16:33:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=hpP1ds6EZfmJ5Tc
	fFEzajWxyavCIjFS9MAUJGRraDQQ=; b=G9bmdJnw72jvxqzu75aWQ9U4gLRZ9uq
	/krrxfFnilU9eUOGXqyM85gdJNp6D1K/bcWbJuzr1Ycev5CZf8ZKWM7T8tln+C19
	Bx0VRYO9A0mi4SuIzBogcbJadWaAZfje0ONq5n97DNNS5deTJ9ksLaDPg3xZVibh
	haFe4sVLTkhk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=hpP1ds6EZfmJ5TcfFEzajWxyavCIjFS9MAUJGRraDQQ=; b=JAIZkl4z
	miyrVgJ7N7jGWtWIDQ1qfZ+0wYbwSTtmo00+AbfRSIJJkEKatRJVmZvEF6SLjoig
	Q9WZHjsa0BonQKGEPWIj09nbH0jUNhISPYLVV7j9k0s506oKL1aLUJmSu+oBiTVc
	z3kCEhtgSjrYKw+rm+kmQbTePuBpwgvv8nA/Qo0sK28LLheGex8FVbqpqL5SyDeQ
	Z/B7NEhYNpPDIYeaiqsIZ7YycvQW3ravAcHIEc/Zz/GjPQTUTjT7LAU6sKzt4rIg
	6t7CWyB+tlCMUhNWihcW+4stsIGJqhHFQ85TwZU2vu1VeBqvmyJKpyZrmZg144mF
	2Jbp7AqO2adUww==
X-ME-Sender: <xms:qJ1BWci3BPEeNrp9BSUkU1opCtq2QkpkhZOU8MAeb00IavUR8xNQpg>
X-Sasl-enc: SSTxajjbPbqXLSIhfJHd2tlEs94Qu8iIBxQ7UHZtb4V+ 1497472423
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id D700F249CD;
	Wed, 14 Jun 2017 16:33:43 -0400 (EDT)
Date: Wed, 14 Jun 2017 16:33:43 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, pbonzini@redhat.com,
	qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] target/aarch64: exit to main loop after 'msr daifclr'
Message-ID: <20170614203343.GB8420@flamenco>
References: <20170614194821.8754-1-rth@twiddle.net>
 <20170614194821.8754-6-rth@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170614194821.8754-6-rth@twiddle.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: cBuoj4MzqKR1

On Wed, Jun 14, 2017 at 12:48:21 -0700, Richard Henderson wrote:
> Exit to cpu loop so we reevaluate cpu_arm_hw_interrupts.
> 
> Cc: qemu-arm@nongnu.org
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <rth@twiddle.net>
> ---
>  target/arm/translate-a64.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 860e279..e55547d 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1422,7 +1422,9 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
>          gen_helper_msr_i_pstate(cpu_env, tcg_op, tcg_imm);
>          tcg_temp_free_i32(tcg_imm);
>          tcg_temp_free_i32(tcg_op);
> -        s->is_jmp = DISAS_UPDATE;
> +        /* For DAIFClear, exit the cpu loop to re-evaluate pending IRQs.  */
> +        gen_a64_set_pc_im(s->pc);

For op != 0x1f we end up setting the pc twice (first here, then in
the switch statement). It's still correct though.

> +        s->is_jmp = (op == 0x1f ? DISAS_EXIT : DISAS_JUMP);

Could do without the parens.

>          break;
>      }
>      default:
> @@ -11369,6 +11371,9 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
>          case DISAS_JUMP:
>              tcg_gen_lookup_and_goto_ptr(cpu_pc);
>              break;
> +        case DISAS_EXIT:
> +            tcg_gen_exit_tb(0);
> +            break;

We could also mention the regression in the commit log. In fact
I just did that :-) feel free to reuse parts of the below.

Thanks,

		E.

--- 8< ---

Commit e75449a3 ("target/aarch64: optimize indirect branches") causes
a regression by which -smp > 1 freezes under TCG, even with
`-accel accel=tcg,thread=single' (i.e. MTTCG disabled).

The cause of the regression is well described here by Alex:
On Wed, Jun 14, 2017 at 15:02:06 +0100, Alex Bennée wrote:
> Fundamentally the problem was that an interrupt was pending
> (interrupt_request was set) but the "msr daifclr" operations when the
> kernel did local_irq/fiq_enable() never got handled because the
> cpu_idle loop was being very efficiently chained. As a result we never
> got around to exiting the TCG code and calling arm_cpu_do_interrupt
> which would then raise the IRQ to move things on
> [ Message-Id: <20170614140209.29847-1-alex.bennee@linaro.org> ]

Fix it by enforcing an exit to the main loop right after 'msr daifclr'
is executed.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/arm/translate-a64.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 860e279..323e419 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1422,7 +1422,8 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         gen_helper_msr_i_pstate(cpu_env, tcg_op, tcg_imm);
         tcg_temp_free_i32(tcg_imm);
         tcg_temp_free_i32(tcg_op);
-        s->is_jmp = DISAS_UPDATE;
+        /* force exit to the main loop for DAIFClear */
+        s->is_jmp = op == 0x1f ? DISAS_EXIT : DISAS_UPDATE;
         break;
     }
     default:
@@ -11362,6 +11363,10 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
         case DISAS_NEXT:
             gen_goto_tb(dc, 1, dc->pc);
             break;
+        case DISAS_EXIT:
+            gen_a64_set_pc_im(dc->pc);
+            tcg_gen_exit_tb(0);
+            break;
         default:
         case DISAS_UPDATE:
             gen_a64_set_pc_im(dc->pc);
-- 
2.7.4
