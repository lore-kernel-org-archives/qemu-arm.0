Received: by 10.25.0.144 with SMTP id 138csp572125lfa;
        Wed, 26 Apr 2017 20:29:28 -0700 (PDT)
X-Received: by 10.55.67.77 with SMTP id q74mr371680qka.185.1493263768673;
        Wed, 26 Apr 2017 20:29:28 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id a19si1434557qkj.131.2017.04.26.20.29.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 20:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 04F66209B4;
	Wed, 26 Apr 2017 23:29:28 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 23:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=zaS
	FSMNOGre/S+7idWm8Q28pX9dgZQqKQWZlR7RfxQA=; b=yWdoS5MpLt2mG7jAiKk
	FEOrV3Zzf0H9X+R/VhzdXs7DT2tYkw0/Az6wtBwW+XdcTTUhsDocrv9Qm91VBr1N
	O6hXI16Omo6HfspocqcBG8iDLgK1j/2fEivz0c1nmUgoXEVjw+VPZx2sf1jsuzc9
	zC19v10nck6XNCITxEseEUQE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=zaSFSMNOGre/S+7idWm8Q28pX9dgZQqKQWZlR7Rfx
	QA=; b=H5sBdnwQZTDsFu0S5UVUz1hkNC6jqK/7pdKyCAEVVA6VWAypv7NqHHo1e
	M7L5vNO3EhNTUbOjKWsVE/QUTlOrQ+TpWHsGCKbJQCUO+MmOImnWsGnaKOh8np1o
	hH5iFd3BrTWWmoqbHd3OWfvZInZBP27pGWQx7mQDEoF1vtULYX1Ys0SUFMTORfRA
	Gi9O5yKElQdsJE5XOA5bG2UzmHBZUDAD+UadSFL5ySJ9KvaB6APJ7A2dBTmxQB5w
	SYZSUJDFu/12H0nrUyjVWPyOrrf0PG7aYX55Teq30ca2mr01C0EdFWu28pURgxPd
	o22HB+vFh9Ou2RrwtT2AGRzq436CQ==
X-ME-Sender: <xms:l2UBWXSJkBbH14-cedjLyqq83fq3gafaM3CEg5MhOsDLzljttHv_AA>
X-Sasl-enc: hcoNr++8xJqY0xaM2D75SUTmyb0a4EyUjYY9o1iz/VSx 1493263767
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id AE9537E442;
	Wed, 26 Apr 2017 23:29:27 -0400 (EDT)
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
Subject: [PATCH v4 07/11] target/arm: optimize indirect branches
Date: Wed, 26 Apr 2017 23:29:20 -0400
Message-Id: <1493263764-18657-8-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493263764-18657-1-git-send-email-cota@braap.org>
References: <1493263764-18657-1-git-send-email-cota@braap.org>
X-TUID: T9Y91kYB8/js

Speed up indirect branches by jumping to the target if it is valid.

Softmmu measurements (see later commit for user-mode results):

Note: baseline (i.e. speedup == 1x) is QEMU v2.9.0.

- Impact on Boot time

| setup  | ARM debian jessie boot+shutdown time | stddev |
|--------+--------------------------------------+--------|
| v2.9.0 |                                 8.84 |   0.07 |
| +cross |                                 8.85 |   0.03 |
| +jr    |                                 8.83 |   0.06 |

-                            NBench, arm-softmmu (debian jessie guest). Host: Intel i7-4790K @ 4.00GHz

  1.3x +-+-------------------------------------------------------------------------------------------------------------+-+
       |                                                                                                                 |
       |   cross                                                          ####                                           |
 1.25x +cross+jr..........................................................#++#.........................................+-+
       |                                                        ####      #  #                                           |
       |                                                     +++#  #      #  #                                           |
       |                                      +++            ****  #      #  #                                           |
  1.2x +-+...................................####............*..*..#......#..#.........................................+-+
       |                                  ****  #            *  *  #      #  #     ####                                  |
       |                                  *  *  #            *  *  #      #  #     #  #                                  |
 1.15x +-+................................*..*..#............*..*..#......#..#.....#..#................................+-+
       |                                  *  *  #            *  *  #      #  #     #  #                                  |
       |                                  *  *  #      ####  *  *  #      #  #     #  #                                  |
       |                                  *  *  #      #  #  *  *  #      #  #     #  #                         ####     |
  1.1x +-+................................*..*..#......#..#..*..*..#......#..#.....#..#.........................#..#...+-+
       |                                  *  *  #      #  #  *  *  #      #  #     #  #                         #  #     |
       |                                  *  *  #      #  #  *  *  #      #  #     #  #                         #  #     |
 1.05x +-+..........................####..*..*..#......#..#..*..*..#......#..#.....#..#......+++............*****..#...+-+
       |                        *****  #  *  *  #      #  #  *  *  #  *****  #     #  #   +++ |    ****###  *   *  #     |
       |                        *+++*  #  *  *  #      #  #  *  *  #  *+++*  #  ****  #  *****###  *  *  #  *   *  #     |
       |     *****###  +++####  *   *  #  *  *  #  *****  #  *  *  #  *   *  #  *  *  #  * | *++#  *  *  #  *   *  #     |
    1x +-++-+*+++*-+#++****++#++*+-+*++#+-*++*++#-+*+++*-+#++*++*++#++*+-+*++#+-*++*++#-+*+++*-+#++*++*++#++*+-+*++#+-++-+
       |     *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #     |
       |     *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #     |
 0.95x +-+---*****###--****###--*****###--****###--*****###--****###--*****###--****###--*****###--****###--*****###---+-+
       ASSIGNMENT BITFIELD   FOURFP EMULATION   HUFFMAN   LU DECOMPOSITIONEURAL NNUMERIC SOSTRING SORT     hmean
  png: http://imgur.com/eOLmZNR

NB. 'cross' represents the previous commit.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/arm/translate.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 02cad96..d46a576 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -65,6 +65,7 @@ static TCGv_i32 cpu_R[16];
 TCGv_i32 cpu_CF, cpu_NF, cpu_VF, cpu_ZF;
 TCGv_i64 cpu_exclusive_addr;
 TCGv_i64 cpu_exclusive_val;
+static bool gen_jr;
 
 /* FIXME:  These should be removed.  */
 static TCGv_i32 cpu_F0s, cpu_F1s;
@@ -221,6 +222,7 @@ static void store_reg(DisasContext *s, int reg, TCGv_i32 var)
          */
         tcg_gen_andi_i32(var, var, s->thumb ? ~1 : ~3);
         s->is_jmp = DISAS_JUMP;
+        gen_jr = true;
     }
     tcg_gen_mov_i32(cpu_R[reg], var);
     tcg_temp_free_i32(var);
@@ -893,6 +895,7 @@ static inline void gen_bx_im(DisasContext *s, uint32_t addr)
         tcg_temp_free_i32(tmp);
     }
     tcg_gen_movi_i32(cpu_R[15], addr & ~1);
+    gen_jr = true;
 }
 
 /* Set PC and Thumb state from var.  var is marked as dead.  */
@@ -902,6 +905,7 @@ static inline void gen_bx(DisasContext *s, TCGv_i32 var)
     tcg_gen_andi_i32(cpu_R[15], var, ~1);
     tcg_gen_andi_i32(var, var, 1);
     store_cpu_field(var, thumb);
+    gen_jr = true;
 }
 
 /* Variant of store_reg which uses branch&exchange logic when storing
@@ -12034,6 +12038,20 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
             gen_set_pc_im(dc, dc->pc);
             /* fall through */
         case DISAS_JUMP:
+            /*
+             * gen_jr is not set on every DISAS_JUMP because for some of those
+             * we do want to exit to the exec loop.
+             */
+            if (gen_jr) {
+                TCGv addr = tcg_temp_new();
+
+                gen_jr = false;
+                tcg_gen_extu_i32_tl(addr, cpu_R[15]);
+                tcg_gen_lookup_and_goto_ptr(addr);
+                tcg_temp_free(addr);
+                break;
+            }
+            /* fall through */
         default:
             /* indicate that the hash table must be used to find the next TB */
             tcg_gen_exit_tb(0);
-- 
2.7.4
