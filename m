Received: by 10.25.0.144 with SMTP id 138csp572130lfa;
        Wed, 26 Apr 2017 20:29:29 -0700 (PDT)
X-Received: by 10.55.159.16 with SMTP id i16mr3121272qke.295.1493263769185;
        Wed, 26 Apr 2017 20:29:29 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id 88si1474922qtc.289.2017.04.26.20.29.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 20:29:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 88A6A209CE;
	Wed, 26 Apr 2017 23:29:28 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 23:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=WRE
	1oWXgD7pAGLXroSPOVQKqjm51VFq84TSKH0z1aGA=; b=VIHNvebJgZ//4GD3Gdc
	SGwVQ9/aD5nvAlHpILipeOBFAtVNou7aAV899LxLgXsNuXGaNVzWnfDeelf+3Rt4
	fDvJp4LrKTD4YzbTeXFlTLygxFWIrBKl0uN/OxcvbLwtK/lioKyDcRA2ktw7Ssj8
	KLIBXv32incg6rRKXReqw1TM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=WRE1oWXgD7pAGLXroSPOVQKqjm51VFq84TSKH0z1a
	GA=; b=odadxjPbNV+xXUYfZ7rFGmqJrALh/O1r7Ulp551D22GzGul6Jss3D70cZ
	IIkSdwtUMoTYWgSHt4c2WQGp5V5hcDQInhduyp8yjhVwrkajkkwGFvZL+Dptm5q/
	uey49dWTNSK1RnU4Uo9tEokYY5bDjIi3UiaJBAxQXRvBoANJpXKCNXfep5kZxTTT
	L5KziLcXagWoi5+1YS9gNxLYTv6Z9kZGuceKQUbe8CHxz/Pn8gbylCStgp6hk9VE
	HWMl9jLHYjAz136jBAkKUm7Y3fSVtQUmiHoINb0M5JovNCVBVUp5vNG4KK5asVrk
	6A6eYmiYrv3Mh3U4KnY0CkRsmoMHA==
X-ME-Sender: <xms:mGUBWdC5HWqV4oCRd93ojrtGuSPOGnTlwQqdZjqiuZzlqeY51QUXrQ>
X-Sasl-enc: UmuforQ66vBlt10NDkhWmrOmqCewZc5mbqcq/7BLhlkm 1493263768
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 42A232471A;
	Wed, 26 Apr 2017 23:29:28 -0400 (EDT)
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
Subject: [PATCH v4 10/11] target/i386: optimize indirect branches
Date: Wed, 26 Apr 2017 23:29:23 -0400
Message-Id: <1493263764-18657-11-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493263764-18657-1-git-send-email-cota@braap.org>
References: <1493263764-18657-1-git-send-email-cota@braap.org>
X-TUID: EZc2+vgXR3dz

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

Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/i386/translate.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index ea113fe..674ec96 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4996,7 +4996,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
             gen_push_v(s, cpu_T1);
             gen_op_jmp_v(cpu_T0);
             gen_bnd_jmp(s);
-            gen_eob(s);
+            gen_jr(s, cpu_T0);
             break;
         case 3: /* lcall Ev */
             gen_op_ld_v(s, ot, cpu_T1, cpu_A0);
@@ -5014,7 +5014,8 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
                                       tcg_const_i32(dflag - 1),
                                       tcg_const_i32(s->pc - s->cs_base));
             }
-            gen_eob(s);
+            tcg_gen_ld_tl(cpu_tmp4, cpu_env, offsetof(CPUX86State, eip));
+            gen_jr(s, cpu_tmp4);
             break;
         case 4: /* jmp Ev */
             if (dflag == MO_16) {
@@ -5022,7 +5023,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
             }
             gen_op_jmp_v(cpu_T0);
             gen_bnd_jmp(s);
-            gen_eob(s);
+            gen_jr(s, cpu_T0);
             break;
         case 5: /* ljmp Ev */
             gen_op_ld_v(s, ot, cpu_T1, cpu_A0);
@@ -5037,7 +5038,8 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
                 gen_op_movl_seg_T0_vm(R_CS);
                 gen_op_jmp_v(cpu_T1);
             }
-            gen_eob(s);
+            tcg_gen_ld_tl(cpu_tmp4, cpu_env, offsetof(CPUX86State, eip));
+            gen_jr(s, cpu_tmp4);
             break;
         case 6: /* push Ev */
             gen_push_v(s, cpu_T0);
@@ -6417,7 +6419,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
         /* Note that gen_pop_T0 uses a zero-extending load.  */
         gen_op_jmp_v(cpu_T0);
         gen_bnd_jmp(s);
-        gen_eob(s);
+        gen_jr(s, cpu_T0);
         break;
     case 0xc3: /* ret */
         ot = gen_pop_T0(s);
@@ -6425,7 +6427,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
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
