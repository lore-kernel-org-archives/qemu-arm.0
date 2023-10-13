Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1342512ejc;
        Fri, 13 Oct 2023 01:17:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaarcB3ylUo0z+8UybVCme3alZW8T71PN772VtJ40IO/lkQ/nK4ltFg8vDhDjy5PULP9a7
X-Received: by 2002:a05:620a:e9b:b0:772:6364:1409 with SMTP id w27-20020a05620a0e9b00b0077263641409mr26062250qkm.10.1697185052286;
        Fri, 13 Oct 2023 01:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697185052; cv=none;
        d=google.com; s=arc-20160816;
        b=t+tYiiaYTLm936YNxHZkmtkUbEm4Syh0sv+HrgSfoMEqqEMyxql7bLVwuhlaEOt1/H
         Prng6sU3k8pveX0QoI8DRfVjaTY3Z/rBCW5m3dHW6cq+sfrOO6vz2bqKV83WUshZ3CEE
         yUO3YG/gu8qPy9TUrEKzj5GAjR1A/Su/MJzheL14tZngJGSAw/XYRsSEgZ7IjymxrFg5
         KqEspna/GSJGRMClKdzTxwK4FfC3xRq1IM3bqraCqzBt7IDiyie04V9rY5/qxJHMxBZi
         Ty9CcmqSAmVfSDneLfvNrH11lo9hI5jFwC60dVNbDRgMuq0Oe/S/eyFN1ct1yZVzP6Z5
         UQPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aZ1hqe+Fu2cE5EdVcsb+6IpRINRQWQg+aUhoqPZ6lw8=;
        fh=tZaRhvGcNySwbdZ1XBEybW2ZbjQ08uLhbP/3D9VBYGs=;
        b=Rqbng0mEyFaV1CQClSB/r/XCn22OeOP8i+/KJd8HFQ2fuJe7HFet2OTpoatsqu9zOK
         hkf2T18A5BrPfDVJi8aIfrf3zCmzKbL4UuP7O8NKMt5XCYdC52aIy0yzZkZga+Ztb/Co
         iCbbsCqB0qosuDrNJ1w9eODh1Ql1KhDgURoFRBwZEo1OAYllxrZKjaX2QJ1i9x9Emmv+
         YXuUDekm2cL6If1sfOOeytOsBeczTIq7vG1ahwPjuT/0cb6aX/iqafvEuZl9M5fGSCy8
         qnJYMJQfSe+X/sfevfxilgklWiAg51yQDZxAjOZXcoTPwMPqqEn1sTdGrCp9fttnvOc2
         5bzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=usX8gcE8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk34-20020a05620a1a2200b0077411b34546si866911qkb.243.2023.10.13.01.17.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:17:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=usX8gcE8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCxX-0007Ng-D7; Fri, 13 Oct 2023 03:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwn-0005VR-Re
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:03 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwY-0004qJ-84
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:01 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3247cefa13aso1641229f8f.1
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183445; x=1697788245; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aZ1hqe+Fu2cE5EdVcsb+6IpRINRQWQg+aUhoqPZ6lw8=;
 b=usX8gcE8ufOM6VuBZfbJAL0IQI33/S54PwFD0T/lsi8Z+RFhOyRE5qeg3LcISPiInW
 J9Vw7HejD7jwriCKTKZt9TGZYUq9g2AX2vLc/oORR361P3UgDWhQ5pi/5fbQKhxfDgu8
 WvPavLV5LRpDew2ULQppPbUumIRECpRq31KgIyCmA3704n66h+iWaQs/oFC7kzph/6+h
 e58m2NInkt7b/ocK+v1UB6MON4nAUC04IKFJ1O3xh4pSzQeMznulSKaMwERk+uTFGH8z
 vNPKePTr+6Q6N5rLwq3ZnCfSTh7EIe+o+lqFekxc7huSBFo0GYWYSvW3GahN5xVGXMNC
 QzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183445; x=1697788245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aZ1hqe+Fu2cE5EdVcsb+6IpRINRQWQg+aUhoqPZ6lw8=;
 b=RY0UtocgQNp5JsqvE+QIAJcc4EUOdL74Eexhs7rQramr1bCnQ/UxNaVO/7x1jN93Qv
 lCL03eldnmSrR8i9bBrDjN+Z1LlSlWxti0VPBlDYeur2WTuI2qfspv4hwvXoeOI/iubp
 C1h1gRzWKgiP012zyabFNtJzCdY3+LqUweIZdVabQ3fMV9FHh/HktUt+t/Vabi77gkVR
 OWnR/+e+6X3uk3m4I/RzDL6FHMt+X9IHJfBGz3h2cfxE+dY9LvT7oqeMS78FUjCbFBeG
 OFHjGhPvgrFADDYsrWKL7c7c4wOP9AKjwLnAuyhixlZjcM7bODKiGSpMHHnC3mnFwbo1
 iQCQ==
X-Gm-Message-State: AOJu0YxHo6QhxHfFRdxexw4he49HYjzApvH4mu1U92F+OLU+aEaIWKKv
 CaMmWrCoBi0plSCePomGtGvvoqMH2pFuZ1F2PSA=
X-Received: by 2002:a5d:58ca:0:b0:31f:f65f:74ac with SMTP id
 o10-20020a5d58ca000000b0031ff65f74acmr20962360wrf.70.1697183444894; 
 Fri, 13 Oct 2023 00:50:44 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:50:44 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [RFC PATCH 29/78] target/cris: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:33 +0300
Message-Id: <295dcd972e29e2d4adb367e52199d7e412906405.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hhk6wj8nY5WZ

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/cris/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index b3974ba0bb..bdd128db23 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3061,94 +3061,94 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     DisasJumpType is_jmp = dc->base.is_jmp;
     target_ulong npc = dc->pc;
 
     if (is_jmp == DISAS_NORETURN) {
         /* If we have a broken branch+delayslot sequence, it's too late. */
         assert(dc->delayed_branch != 1);
         return;
     }
 
     if (dc->clear_locked_irq) {
         t_gen_movi_env_TN(locked_irq, 0);
     }
 
     /* Broken branch+delayslot sequence.  */
     if (dc->delayed_branch == 1) {
         /* Set env->dslot to the size of the branch insn.  */
         t_gen_movi_env_TN(dslot, dc->pc - dc->ppc);
         cris_store_direct_jmp(dc);
     }
 
     cris_evaluate_flags(dc);
 
     /* Evaluate delayed branch destination and fold to another is_jmp case. */
     if (is_jmp == DISAS_DBRANCH) {
         if (dc->base.tb->flags & 7) {
             t_gen_movi_env_TN(dslot, 0);
         }
 
         switch (dc->jmp) {
         case JMP_DIRECT:
             npc = dc->jmp_pc;
             is_jmp = dc->cpustate_changed ? DISAS_UPDATE_NEXT : DISAS_TOO_MANY;
             break;
 
         case JMP_DIRECT_CC:
             /*
              * Use a conditional branch if either taken or not-taken path
              * can use goto_tb.  If neither can, then treat it as indirect.
              */
             if (likely(!dc->cpustate_changed)
                 && (use_goto_tb(dc, dc->jmp_pc) || use_goto_tb(dc, npc))) {
                 TCGLabel *not_taken = gen_new_label();
 
                 tcg_gen_brcondi_tl(TCG_COND_EQ, env_btaken, 0, not_taken);
                 gen_goto_tb(dc, 1, dc->jmp_pc);
                 gen_set_label(not_taken);
 
                 /* not-taken case handled below. */
                 is_jmp = DISAS_TOO_MANY;
                 break;
             }
             tcg_gen_movi_tl(env_btarget, dc->jmp_pc);
-            /* fall through */
+            fallthrough;
 
         case JMP_INDIRECT:
             tcg_gen_movcond_tl(TCG_COND_NE, env_pc,
                                env_btaken, tcg_constant_tl(0),
                                env_btarget, tcg_constant_tl(npc));
             is_jmp = dc->cpustate_changed ? DISAS_UPDATE : DISAS_JUMP;
 
             /*
              * We have now consumed btaken and btarget.  Hint to the
              * tcg compiler that the writeback to env may be dropped.
              */
             tcg_gen_discard_tl(env_btaken);
             tcg_gen_discard_tl(env_btarget);
             break;
 
         default:
             g_assert_not_reached();
         }
     }
 
     switch (is_jmp) {
     case DISAS_TOO_MANY:
         gen_goto_tb(dc, 0, npc);
         break;
     case DISAS_UPDATE_NEXT:
         tcg_gen_movi_tl(env_pc, npc);
-        /* fall through */
+        fallthrough;
     case DISAS_JUMP:
         tcg_gen_lookup_and_goto_ptr();
         break;
     case DISAS_UPDATE:
         /* Indicate that interrupts must be re-evaluated before the next TB. */
         tcg_gen_exit_tb(NULL, 0);
         break;
     default:
         g_assert_not_reached();
     }
 }
-- 
2.39.2

