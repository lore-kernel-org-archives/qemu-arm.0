Received: by 10.25.0.144 with SMTP id 138csp1748202lfa;
        Tue, 25 Apr 2017 00:54:17 -0700 (PDT)
X-Received: by 10.55.33.141 with SMTP id f13mr22303036qki.51.1493106857277;
        Tue, 25 Apr 2017 00:54:17 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id y68si21118877qke.336.2017.04.25.00.54.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 00:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id EC61821F3E;
	Tue, 25 Apr 2017 03:54:05 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Tue, 25 Apr 2017 03:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=5k8
	sxL+PF1uqkDCQo/1S5UFdjziH/x6eLKOacuSVhsM=; b=nCl2omGW/z+RBUJOVwB
	1rsGcfMvPjS2k/Ng+x1/E/io+X930n2GshxMLtRvbxUqGfxm6BPu+xetggEUSaqM
	M+663BWK1qW2gwNtcOCoDsP7hm9pOnVcxpdjvEM2I5q9rgcny6tDYUiri3reqds9
	UE9mydsQCQCEkGCirotqvWrQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=5k8sxL+PF1uqkDCQo/1S5UFdjziH/x6eLKOacuSVh
	sM=; b=TQmLNTDFUsTEG9Cf1nSlTIWtV7yNNhL0ciLFSwm/StvuiOUy1Q4Oh0c3q
	fD9oMsBcbAs+LbXnvOQqj5nP6trJwQSGufbLQRPjoaCJj+Fn9/Br1EMFiows5FdO
	7BGA9FcPxwsu3lZ+PB8blIDv2FG8BarpmW/sBp9X/vE8+vHYzN0mKPJHQA5tiE3v
	GMvJXG3Koucn4rW24bSVSTsiMEvU8AYla36w9kVAXTyFG8pIHcUeecck6QObWTN1
	i/Uus3Wo3sXT4Qi+mbrOv+lNLd5osGIkefxkkz/J9IeGZxwqulGmTfwHuTubiStu
	RsNiwbGop12y8NgGunyxBzMAOE8uQ==
X-ME-Sender: <xms:nQD_WF27zjCkIE2py5M7gu_cgf-a_9LUcy8EJczsHpgTurkcxEDtcQ>
X-Sasl-enc: AXHGlp/5xcsEMQGVydNrtHWprVzUq/D0sPaU5F1VjIJR 1493106845
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 88D5C24811;
	Tue, 25 Apr 2017 03:54:05 -0400 (EDT)
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
Subject: [PATCH v2 12/13] target/i386: optimize indirect branches
Date: Tue, 25 Apr 2017 03:53:58 -0400
Message-Id: <1493106839-10438-13-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493106839-10438-1-git-send-email-cota@braap.org>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
X-TUID: SEDuPaKzjq61

The appended minimizes exits to the exec loop for indirect branches.
By using the gen_jr helper, we can remain in TCG mode as long as
the indirect branch target is found in tb_jmp_cache.

This should improve performance for workloads that have a high
hit rate in tb_jmp_cache.

Softmmu Measurements: (see user-mode measurements in later commit)

Note: baseline (i.e. speedup == 1x) is QEMU v2.9.0.

-                   SPECint06 (test set), x86_64-softmmu (Ubuntu 16.04 guest). Host: Intel i7-4790K @ 4.00GHz

 2.2x +-+--------------------------------------------------------------------------------------------------------------+-+
      |                                                                                  +++                             |
      |   cross+inline                                                                    |                              |
   2x +cross+jr+inline................................................................+++.|............................+-+
      |                                                                                |  |                              |
      |                                                                                |  |                              |
      |                                                                                |  |                              |
 1.8x +-+..............................................................................|..|............................+-+
      |                                                                                |####                             |
      |                                                                                |# |#                             |
 1.6x +-+............................................................................****.|#...........................+-+
      |                                                                              * |* |#                             |
      |                                                                              * |* |#                             |
      |                                                                              * |* |#                             |
 1.4x +-+.......................................................................+++..*.|*.|#...........................+-+
      |                                                      +++                 |   * |*++#             +++             |
      |                        +++                            |                 #### * |*  #          +++ |              |
 1.2x +-+......................###.............+++............|.+++.............#++#.*++*..#...........|..|............+-+
      |                     +++# #     +++      |             |  |            ++#  # *  *  #     +++  ****##     ####    |
      |     ++####          **** #  +++####    ####          *** |           ****  # *  *  #  ++####  *| *|#  ****++#    |
      |    ****++#  ++####  *  * #  ****  #  ++#| #  ++####  *|*###  ****##  *  *  # *  *  #  *** |#  *++*+#  *++*  #    |
   1x +-++-*++*++#++***+-#++*++*+#++*+-*++#+****++#++***++#+-*+*++#-+*++*+#++*++*-+#+*++*-+#++*+*++#++*-+*+#++*++*++#-++-+
      |    *  *  #  * *  #  *  * #  *  *  # *++*  #  * *  #  *+* |#  *  * #  *  *  # *  *  #  * *  #  *  * #  *  *  #    |
      |    *  *  #  * *  #  *  * #  *  *  # *  *  #  * *  #  * *++#  *  * #  *  *  # *  *  #  * *  #  *  * #  *  *  #    |
 0.8x +-+--****###--***###--****##--****###-****###--***###--***###--****##--****###-****###--***###--****##--****###--+-+
         astar   bzip2      gcc   gobmk h264ref   hmmlibquantum      mcf omnetpperlbench   sjengxalancbmk   hmean
  png: http://imgur.com/aSXm0qh

NB. 'cross' represents the previous commit.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/i386/translate.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 9982a2d..0b4e1e1 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4991,7 +4991,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
             gen_push_v(s, cpu_T1);
             gen_op_jmp_v(cpu_T0);
             gen_bnd_jmp(s);
-            gen_eob(s);
+            gen_jr(s, cpu_T0);
             break;
         case 3: /* lcall Ev */
             gen_op_ld_v(s, ot, cpu_T1, cpu_A0);
@@ -5009,7 +5009,8 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
                                       tcg_const_i32(dflag - 1),
                                       tcg_const_i32(s->pc - s->cs_base));
             }
-            gen_eob(s);
+            tcg_gen_ld_tl(cpu_tmp4, cpu_env, offsetof(CPUX86State, eip));
+            gen_jr(s, cpu_tmp4);
             break;
         case 4: /* jmp Ev */
             if (dflag == MO_16) {
@@ -5017,7 +5018,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
             }
             gen_op_jmp_v(cpu_T0);
             gen_bnd_jmp(s);
-            gen_eob(s);
+            gen_jr(s, cpu_T0);
             break;
         case 5: /* ljmp Ev */
             gen_op_ld_v(s, ot, cpu_T1, cpu_A0);
@@ -5032,7 +5033,8 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
                 gen_op_movl_seg_T0_vm(R_CS);
                 gen_op_jmp_v(cpu_T1);
             }
-            gen_eob(s);
+            tcg_gen_ld_tl(cpu_tmp4, cpu_env, offsetof(CPUX86State, eip));
+            gen_jr(s, cpu_tmp4);
             break;
         case 6: /* push Ev */
             gen_push_v(s, cpu_T0);
@@ -6412,7 +6414,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
         /* Note that gen_pop_T0 uses a zero-extending load.  */
         gen_op_jmp_v(cpu_T0);
         gen_bnd_jmp(s);
-        gen_eob(s);
+        gen_jr(s, cpu_T0);
         break;
     case 0xc3: /* ret */
         ot = gen_pop_T0(s);
@@ -6420,7 +6422,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
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
