Received: by 10.25.0.23 with SMTP id 23csp49904lfa;
        Tue, 13 Jun 2017 15:53:53 -0700 (PDT)
X-Received: by 10.55.20.156 with SMTP id 28mr2604447qku.191.1497394433166;
        Tue, 13 Jun 2017 15:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497394433; cv=none;
        d=google.com; s=arc-20160816;
        b=VVxFnGE4IHFS9xs5FAEZjBSlWOHvoTHrNSHraSYBII1dI0zxEGawdhidG0PyrFAJXv
         Ozgm+LqjZup1MRH5ZzcQJcAtbeH2yccLC9DMBqLa9Y63mvdBq9uoP3Q5JISPFczk8j7E
         1fmxooCyUyk+gOXfCFXR00rP3NjbjDJPWTr90eDzFy5hUdzDlfbrgQs77q8TJ6SKyzbL
         Vby34a/UOkzqCquAFOg6NBuXuPJRGBJhGy3AxjD8rwkycUI3pJw499n1SWhRBghVvM8s
         RQ10eBgKdhYxFLB/9wUCKRXopu0T33WXt2jEEAAI2m+B9cfzPFtGnc7a5laqyw6cSDXe
         MvNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=YhiRVYZm0wKYFGPurqFcQYiwhgolOwmoMuhhmJCp9rs=;
        b=vpZ+r4dkJYwhqEcrnmxwphdiW0t170ixSQ7pMSP7Fp5lOQj4k5zLbB/Fc9hm1U/h0a
         LoEf0G4jon2No4kkMOLedBnTN9fDIzh6zbFiDBLrTgxx8A6ENGf2w58K3VmQhl94TCFx
         vq7hp4D+7QhgEmkZkNOa7/Kfew+ovKacanYpawdpdn5V0dmye3f8GZkfKctjsGLzvPpz
         I5AL4RokmGBerYJC+XMtXsr5vijg54Ds/47bh+zgT1TzkM92nwJi6dv8166GUWpQhy7l
         RcoGdemdEalKZ8Yy3Yan+FETjrPja7+VqfE9omxfV+aanmJHQRt/emTJAz18rC37ih4+
         zv1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id o199si1438107qke.5.2017.06.13.15.53.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jun 2017 15:53:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id B216F20818;
	Tue, 13 Jun 2017 18:53:52 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Tue, 13 Jun 2017 18:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=YhiRVYZm0wKYFGPurqFcQYiwhgolOwmoMuhhmJ
	Cp9rs=; b=mxmEJf7HjWK0uW3IuEY1H3wWfLni/lMD9sO+n1FXpLxUicAVyncKo8
	+cO0lICAPdTdOM++O20RcmpJGNco5ha0XjD/XXcNn/RCe09+aVh71WzoOJb0p8qN
	8u/rArhLXwGYh4dbZ9JOfIw5O6GGdaAbl6fsW8DLNFUhmsTOV77R8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=YhiRVYZm0wKYFGPurq
	FcQYiwhgolOwmoMuhhmJCp9rs=; b=EZW7EpRbVZUslQHLmcZ88tycCHwosiLlcc
	ORf6OzsQ8WtbCvBtSCk3kQFONZ3eTrHITK8Ym7C/UzfqvtKbuGMB2O2PFmPJsVUt
	Q44GMfabTHy0xMIwA+zrs++YaJVYr3vp0DSwybVM02QKzVd9OSPGEq+qELMi9Dgp
	HxBO1T3Sdgx33Kp6jbcpUcTOnLwVEQU5G00tS5Pql8x5dl7g2mFiWR1VW9ue+74Z
	nVG8kbCwTsiN53ZvKEZYW/EEwjCb7gwtW89RdhOVYv7rj9BwroGdHXEL2PUwo3OQ
	LY3w3HMcdMXyXcg8wrs+QNIIhCUj8Cjq734+dHCyDaFlf9kab94Q==
X-ME-Sender: <xms:AG1AWZyaD2Tj3sY284BnykT9UUZ0zV0MVopW1qIny7Z3fBZIIrn2ug>
X-Sasl-enc: JbZO69KACiPiQVXbaADS1wQfzGT0vA8bfWUO9Uq2YvN2 1497394432
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 6CF5E248B0;
	Tue, 13 Jun 2017 18:53:52 -0400 (EDT)
Date: Tue, 13 Jun 2017 18:53:52 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, peter.maydell@linaro.org,
	pbonzini@redhat.com, edgar.iglesias@xilinx.com,
	qemu-devel@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Subject: [PATCH] target/aarch64: exit to main loop after handling MSR
Message-ID: <20170613225352.GA26288@flamenco>
References: <20170609170100.3599-1-alex.bennee@linaro.org>
 <20170609170100.3599-4-alex.bennee@linaro.org>
 <fc351edb-7c08-c341-d8ee-85f6768e4931@twiddle.net>
 <87vao4b4z5.fsf@linaro.org>
 <9776b437-90b4-f2c2-4a0c-c1c6585379bf@twiddle.net>
 <20170611050730.GA12317@flamenco>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170611050730.GA12317@flamenco>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: zce4QtkBTqGV

The appended fixes it for me. Can you please test?
[ apply with `git am --scissors' ]

Thanks,

		Emilio

---- 8< ----

Commit e75449a3 ("target/aarch64: optimize indirect branches") causes
a regression by which aarch64 guests freeze under TCG with -smp > 1,
even with `-accel accel=tcg,thread=single' (i.e. MTTCG disabled).

I isolated the problem to the MSR handler. This patch forces an exit
after the handler is executed, which fixes the regression.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/arm/translate-a64.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 860e279..5a609a0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1422,7 +1422,7 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         gen_helper_msr_i_pstate(cpu_env, tcg_op, tcg_imm);
         tcg_temp_free_i32(tcg_imm);
         tcg_temp_free_i32(tcg_op);
-        s->is_jmp = DISAS_UPDATE;
+        s->is_jmp = DISAS_EXIT;
         break;
     }
     default:
@@ -11362,6 +11362,10 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
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
