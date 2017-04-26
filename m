Received: by 10.25.0.144 with SMTP id 138csp133493lfa;
        Tue, 25 Apr 2017 23:23:32 -0700 (PDT)
X-Received: by 10.55.97.144 with SMTP id v138mr26327693qkb.241.1493187812055;
        Tue, 25 Apr 2017 23:23:32 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id x9si10644834qkb.314.2017.04.25.23.23.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 23:23:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id A49D021B5E;
	Wed, 26 Apr 2017 02:23:31 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 02:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=HTp
	BlSlL5TZyfZs7+MQhmAvEDjDeaC+wTIDguSRj2sA=; b=mhxE/9Js0jaDGwW+0ea
	aDFgQBcWzbVZvhSq6UPP72QkC1F3pnMbdsSI65dW8XKVKKQtEbjopU4VnKwShFTA
	Q+fdOUlpUEj+4mmt983+HwRIFdTH6PoQJLHGi2ftsPPNZu1j8pcqbk1p4H1mHRJ/
	B5d3hcuNT5N8YHZL3B2YFDhI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=HTpBlSlL5TZyfZs7+MQhmAvEDjDeaC+wTIDguSRj2
	sA=; b=dCqRhHiEKpxhxlTPVH/RzmveJmtH31AmYHEQA5DnC9323myeZxh9OwnYW
	n/ObsRjz66ETF5n5rLrvP+9PI6v7oL/kcoom1zKlCZp22glCklKmmFHQ+O2t5eLo
	+PItcmaUoAf2jJ4pYPnoaZB7KdjysfRPFwmHiRdbWWIOCu43XO9zWCH+bwQ4qZ85
	l/g0imi0WT2BQGkzl1cNrQJAnZYSGAaJNLbdbOdj/Uh2TPnzZ+AEE1PPmbzeun/8
	IPX1xCJ/yMiW9OQ8GiIVYFG6P/gZrNuWVjZ1JB4ASKFqqsVkBBfyK3eLoF+HFZ+G
	KQasTcJbMuy7oztMSxg4+3AcGMgyg==
X-ME-Sender: <xms:4zwAWfusSbDJMSmC6xlPuzQ3EDsP3fzs6DEq4E-YDNiB5GMWNS6JlQ>
X-Sasl-enc: TrZ8uM6h9cGYsGUY12Vdw7aYyJCDSOdJuuB+x2HTqFCJ 1493187811
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 61B2E2469B;
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
Subject: [PATCH v3 06/10] target/arm: optimize indirect branches
Date: Wed, 26 Apr 2017 02:23:19 -0400
Message-Id: <1493187803-4510-7-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493187803-4510-1-git-send-email-cota@braap.org>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
X-TUID: Vco/3mwJ32Sb

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
 target/arm/translate.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 02cad96..73595b4 100644
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
@@ -12034,6 +12038,16 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
             gen_set_pc_im(dc, dc->pc);
             /* fall through */
         case DISAS_JUMP:
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
