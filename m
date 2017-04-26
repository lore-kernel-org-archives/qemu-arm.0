Received: by 10.25.0.144 with SMTP id 138csp133527lfa;
        Tue, 25 Apr 2017 23:23:32 -0700 (PDT)
X-Received: by 10.55.17.32 with SMTP id b32mr34677468qkh.5.1493187812647;
        Tue, 25 Apr 2017 23:23:32 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id x145si9263588qkb.117.2017.04.25.23.23.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 23:23:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4275821CCE;
	Wed, 26 Apr 2017 02:23:32 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 02:23:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=15o
	sJEsGDnVzxhqZFHkOUQS7uBrU2al87S0YPknkkVM=; b=mzNkJp+FExFSZkUZL2Q
	9Jf0v4xWd30rb2uIt/0EOwQq9+VIY1U+ZJW5hj3nbmfZNvWxf0EFULiUKS+rhbSJ
	TGCtVEV9veLrrlpk+knkPipP1OzNp6w2PB+5F0Nt02Qrnm5h0FLqTBfc4LjNeaZ+
	Nb5hItvtLZhccO7Q4FGRZ1K0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=15osJEsGDnVzxhqZFHkOUQS7uBrU2al87S0YPknkk
	VM=; b=B8JXkCIpNe9x4TqSx6MBLW1HSmmTcv8kjAwcYKSQbJ4DGpOUmgBhm/XM2
	fUSKfqsYKMoZSBaqyVcHhlyXYUh3eT7UGgF8/6+JxmejPEL6TikiavXL59wOCOvx
	CGYhYgRY6SSsS7RF2oqQ9qJBB0iqK/02wuyhDQJ0yIBcn75fimYsof6+Kh6mlvkG
	HDa43MWgo7FjdssFXdZbvh2QYN3JgzPk1J0R7er8a6BGWW9bLIgme4npbyyq7tcv
	RAVaqOi4p2nt7J3xyA2nseMruKqxeHJP1m1jdNGh+3ehbQ/ouNDbNTd0y8tZFlyH
	HHJqMw6o1NMoDGlG5fNzfGq9mfHZw==
X-ME-Sender: <xms:5DwAWXz_ssrIg8iaXcd_QdBAXDtTfh35ZXy7EbfqEcLoV7Z1kCcw1Q>
X-Sasl-enc: TrZoq9ih4dSSs3gR1W5dw7aYyJCDSOdJuuB+x2HTqFCJ 1493187811
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id EB4BF7E0A4;
	Wed, 26 Apr 2017 02:23:31 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: [PATCH v3 09/10] target/i386: optimize indirect branches
Date: Wed, 26 Apr 2017 02:23:22 -0400
Message-Id: <1493187803-4510-10-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493187803-4510-1-git-send-email-cota@braap.org>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
X-TUID: +qCDDr+VCCpO

Speed up indirect branches by jumping to the target if it is valid.

Softmmu measurements (see later commit for user-mode numbers):

Note: baseline (i.e. speedup == 1x) is QEMU v2.9.0.

-                  SPECint06 (test set), x86_64-softmmu (Ubuntu 16.04 guest). Host: Intel i7-4790K @ 4.00GHz

 2.4x +-+--------------------------------------------------------------------------------------------------------------+-+
      |                                                                                                                  |
      |   cross                                                                                                          |
 2.2x +cross+jr..........................................................................+++...........................+-+
      |                                                                                   |                              |
      |                                                                               +++ |                              |
   2x +-+..............................................................................|..|............................+-+
      |                                                                                |  |                              |
      |                                                                                |  |                              |
 1.8x +-+..............................................................................|####...........................+-+
      |                                                                                |# |#                             |
      |                                                                              **** |#                             |
 1.6x +-+............................................................................*.|*.|#...........................+-+
      |                                                                              * |* |#                             |
      |                                                                              * |* |#                             |
 1.4x +-+.......................................................................+++..*.|*.|#...........................+-+
      |                                                      ++++++             #### * |*++#             +++             |
      |                        +++                            |  |              #++# *++*  #          +++ |              |
 1.2x +-+......................###.....####....+++............|..|...........****..#.*..*..#....####...|.###.....####..+-+
      |        +++          **** #  ****  #    ####          ***###          *++*  # *  *  #    #++#  ****|#  +++#++#    |
      |    ****###     +++  *++* #  *++*  #  ++#  #    ####  *|* |#     +++  *  *  # *  *  #  ***  #  *| *|#  ****  #    |
   1x +-++-*++*++#++***###++*++*+#++*+-*++#+****++#++***++#+-*+*++#-+****##++*++*-+#+*++*-+#++*+*++#++*-+*+#++*++*++#-++-+
      |    *  *  #  * *  #  *  * #  *  *  # *  *  #  * *  #  *|* |#  *++* #  *  *  # *  *  #  * *  #  *  * #  *  *  #    |
      |    *  *  #  * *  #  *  * #  *  *  # *  *  #  * *  #  *+*++#  *  * #  *  *  # *  *  #  * *  #  *  * #  *  *  #    |
 0.8x +-+--****###--***###--****##--****###-****###--***###--***###--****##--****###-****###--***###--****##--****###--+-+
         astar   bzip2      gcc   gobmk h264ref   hmmlibquantum      mcf omnetpperlbench   sjengxalancbmk   hmean
  png: http://imgur.com/DU36YFU

NB. 'cross' represents the previous commit.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/i386/translate.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index a065271..3bd80c0 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4988,7 +4988,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
             gen_push_v(s, cpu_T1);
             gen_op_jmp_v(cpu_T0);
             gen_bnd_jmp(s);
-            gen_eob(s);
+            gen_jr(s, cpu_T0);
             break;
         case 3: /* lcall Ev */
             gen_op_ld_v(s, ot, cpu_T1, cpu_A0);
@@ -5006,7 +5006,8 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
                                       tcg_const_i32(dflag - 1),
                                       tcg_const_i32(s->pc - s->cs_base));
             }
-            gen_eob(s);
+            tcg_gen_ld_tl(cpu_tmp4, cpu_env, offsetof(CPUX86State, eip));
+            gen_jr(s, cpu_tmp4);
             break;
         case 4: /* jmp Ev */
             if (dflag == MO_16) {
@@ -5014,7 +5015,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
             }
             gen_op_jmp_v(cpu_T0);
             gen_bnd_jmp(s);
-            gen_eob(s);
+            gen_jr(s, cpu_T0);
             break;
         case 5: /* ljmp Ev */
             gen_op_ld_v(s, ot, cpu_T1, cpu_A0);
@@ -5029,7 +5030,8 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
                 gen_op_movl_seg_T0_vm(R_CS);
                 gen_op_jmp_v(cpu_T1);
             }
-            gen_eob(s);
+            tcg_gen_ld_tl(cpu_tmp4, cpu_env, offsetof(CPUX86State, eip));
+            gen_jr(s, cpu_tmp4);
             break;
         case 6: /* push Ev */
             gen_push_v(s, cpu_T0);
@@ -6409,7 +6411,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
         /* Note that gen_pop_T0 uses a zero-extending load.  */
         gen_op_jmp_v(cpu_T0);
         gen_bnd_jmp(s);
-        gen_eob(s);
+        gen_jr(s, cpu_T0);
         break;
     case 0xc3: /* ret */
         ot = gen_pop_T0(s);
@@ -6417,7 +6419,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
         /* Note that gen_pop_T0 uses a zero-extending load.  */
         gen_op_jmp_v(cpu_T0);
         gen_bnd_jmp(s);
-        gen_eob(s);
+        gen_jr(s, cpu_T0);
         break;
     case 0xca: /* lret im */
         val = cpu_ldsw_code(env, s->pc);
-- 
2.7.4
