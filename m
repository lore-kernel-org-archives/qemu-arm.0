Received: by 10.25.0.144 with SMTP id 138csp1748170lfa;
        Tue, 25 Apr 2017 00:54:09 -0700 (PDT)
X-Received: by 10.55.77.209 with SMTP id a200mr30325213qkb.11.1493106849769;
        Tue, 25 Apr 2017 00:54:09 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id n27si21151817qta.103.2017.04.25.00.54.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 00:54:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4480F21E75;
	Tue, 25 Apr 2017 03:54:05 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Tue, 25 Apr 2017 03:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=V/Y
	rpO6/2k9TxnQVe3ZEh+k90S/i4+cXXfTugLLV4XE=; b=oPJJUYOCN1V5WeuzsDo
	UZGK0qlutyATOCeYJeDLU7Q5QGuJSLgjwVsHMnwd+gPVjy0reogr/6SjCv/XGexi
	1U2OqGAYQKq1NN4/tQ8LMqC1IVRAyPSGmMoyDY4o1G465H3WePGuCorXH7et2ti9
	G6YY5EtNb2gPfNNlq+7i+43c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=V/YrpO6/2k9TxnQVe3ZEh+k90S/i4+cXXfTugLLV4
	XE=; b=nbWDKyZ/1aOEAhZZZF/xbxtxoNTbDp1LYkqYhZrJl5Ee+tYCxocVinHfx
	3sYAN8Tkq+WtawHaoNIEC1rR1BiFPo4Xdo+YddgVoYHycR6AdkAgT8BnPKY7jNtY
	QHtDaY0Axsv2XRkcbpwUeLx3tD1IsasM93BMau2qx6fEA4SgwiSxfe2fnovxmeHg
	lcwQFjpaTSMvwWL/kSbT3Lq8TQXA+2pZrPpzG4/mJVFEL2ntWDgxLihyCuTWYvYw
	xkJrl1ckABUJaVRRPrXL7aU3q75Q3JDd8SrfpZRc1NC01RPymvi2Kj8pmLO+FC6x
	532wDQkLOxRw+Utov1E8/xxQzgJUg==
X-ME-Sender: <xms:nQD_WIZAhWSIH2hK5zy3DnKW6Irb_PCzRY4aa1OLbFiHUDOvS35-Rw>
X-Sasl-enc: McDudosGJtTogGV9zCdR3HgI4wlwRuVbhondrqX23xnS 1493106844
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id E622D7E962;
	Tue, 25 Apr 2017 03:54:04 -0400 (EDT)
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
Subject: [PATCH v2 09/13] target/arm: optimize indirect branches with TCG's goto_ptr
Date: Tue, 25 Apr 2017 03:53:55 -0400
Message-Id: <1493106839-10438-10-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493106839-10438-1-git-send-email-cota@braap.org>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
X-TUID: MWMrYCi3tgT1

Speed up indirect branches by directly jumping to the target
if it is valid, i.e. if it is found in tb_jmp_cache.

Softmmu measurements: (see later commit for user-mode results)

Note: baseline (i.e. speedup == 1x) is QEMU v2.9.0.

- Impact on Boot time

| setup         | ARM debian boot+shutdown time | stddev |
|---------------+-------------------------------+--------|
| v2.9.0        |                         10.35 |   0.07 |
| +cross+inline |                         10.32 |   0.03 |
| +jr+inline    |                         10.59 |   0.20 |

-                            NBench, arm-softmmu (debian jessie guest). Host: Intel i7-4790K @ 4.00GHz

 1.25x +-+-------------------------------------------------------------------------------------------------------------+-+
       |                                                         +++       |                                             |
       |   cross+inline                                         ####       |                                             |
  1.2x +cross+jr+inline.........................................#++#......####.........................................+-+
       |                                                     +++#  #      #| #                                           |
       |                                  +++ +++            ****  #      #| #      +++                                  |
       |                                   | ####            *  *  #      #++#       |                                   |
 1.15x +-+................................****++#............*..*..#......#..#.....####................................+-+
       |                                  *++*  #            *  *  #      #  #     # |#                                  |
       |                                  *  *  #      +++   *  *  #      #  #     #++#                                  |
  1.1x +-+................................*..*..#.......|....*..*..#......#..#.....#..#................................+-+
       |                                  *  *  #      ####  *  *  #      #  #     #  #                         ####     |
       |                            +++   *  *  #      #++#  *  *  #      #  #     #  #                         #  #     |
       |                            ####  *  *  #      #  #  *  *  #      #  #     #  #                         #  #     |
 1.05x +-+..........................#++#..*..*..#......#..#..*..*..#...+++#..#.....#..#................+++......#..#...+-+
       |                            #  #  *  *  #      #  #  *  *  #  *****  #     #  #            +++####  *****  #     |
       |      ++++++   +++ +++      #  #  *  *  #   +++#  #  *  *  #  * | *  #     #  #            ****  #  *+++*  #     |
    1x +-++-+++++####++****###++++-+#++#+-*++*++#-+++++#-+#++*++*++#++*+-+*++#+-+++#++#-+*****###++*++*++#++*+-+*++#+-++-+
       |     *****++#  *++*++#    | #  #  *  *  #    | #  #  *  *  #  *   *  #  ****  #  *+++*++#  *  *  #  *   *  #     |
       |     *+++*  #  *  *  #  *****  #  *  *  #  *****  #  *  *  #  *   *  #  *++*  #  *   *  #  *  *  #  *   *  #     |
       |     *   *  #  *  *  #  *+++*  #  *  *  #  * | *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #     |
 0.95x +-+...*...*..#..*..*..#..*...*..#..*..*..#..*+++*..#..*..*..#..*...*..#..*..*..#..*...*..#..*..*..#..*...*..#...+-+
       |     *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #     |
       |     *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #     |
  0.9x +-+---*****###--****###--*****###--****###--*****###--****###--*****###--****###--*****###--****###--*****###---+-+
       ASSIGNMENT BITFIELD   FOURFP EMULATION   HUFFMAN   LU DECOMPOSITIONEURAL NNUMERIC SOSTRING SORT     hmean
  png: http://imgur.com/528aS76

NB. 'cross' represents the previous commit.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/arm/translate.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 574cf70..d5296b1 100644
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
+                TCGv_ptr ptr = tcg_temp_new_ptr();
+
+                gen_jr = false;
+                gen_helper_lookup_tb_ptr(ptr, cpu_env, cpu_R[15]);
+                tcg_gen_goto_ptr(ptr);
+                tcg_temp_free_ptr(ptr);
+                break;
+            }
+            /* fall through */
         default:
             /* indicate that the hash table must be used to find the next TB */
             tcg_gen_exit_tb(0);
-- 
2.7.4
