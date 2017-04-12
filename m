Received: by 10.25.0.144 with SMTP id 138csp89167lfa;
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
X-Received: by 10.233.216.65 with SMTP id u62mr12871220qkf.234.1491959868613;
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id d203si15569482qkc.148.2017.04.11.18.17.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 3ED9D20BA5;
	Tue, 11 Apr 2017 21:17:48 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Tue, 11 Apr 2017 21:17:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=sj/
	GcmZd5gFAWFWN7ErjjJ8uhFNieQtxw9vA6fVH+WY=; b=azy0MhK1ZpedannHiQN
	UY0RfOEjHudI1ZbnJ2nmjew8CVOGvhSUsC5b1wvxkYtKT8GY0mVqXgatbinwQtjH
	IV+LCb9Qy9/qVj+bawA4AvukpwTF7qM5m8bkFY+AFHx4hLOFqW7nAQ0LHByx7gBq
	oqLapo2qiIN1bfo0LVPAnnKE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=sj/GcmZd5gFAWFWN7ErjjJ8uhFNieQtxw9vA6fVH+
	WY=; b=JaGSfNzAe1Kw/RpoL7Fwdn6N3hlW2AIrtKl9gju99O8B0U0+03iMqSR3X
	37LBOcUdfEHUWlIrcz8RK/HRE7+bFwl1zbP4IsTqjxf2D3U2J/EVQCk8kZWhHg06
	tOfMWZQBmQCnMGHiAXhT61vGvOMtgmFOcAghAI7tjInUIJkTtNbVF1jmk3j7pEHA
	qKhH7/jjP9s2ovUpnXHrWu7mBoDFA/LXubJC1OnYBO1A6lt+Ni9pkG/jHRFKdshZ
	2eFocnHRAbAo/BtWIHV8mzNucplmvvrCVwBXtJXlCWG2zllSqTgbD+U+ud1wFgjO
	5yAWE8z3lL4Cw0Mfouughf58csxZw==
X-ME-Sender: <xms:PIDtWNLNtTCJBDvtXjVdCr7B2hxGZtmGYWQFTXwuln0jZgduHRX3jw>
X-Sasl-enc: ERq3Z6EBu0Tg17PfIgedLnGpPiI9+MZL93SFqLcWFQJf 1491959867
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id ED3E12400E;
	Tue, 11 Apr 2017 21:17:47 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: [PATCH 08/10] target/arm: optimize indirect branches with TCG's jr op
Date: Tue, 11 Apr 2017 21:17:28 -0400
Message-Id: <1491959850-30756-9-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491959850-30756-1-git-send-email-cota@braap.org>
References: <1491959850-30756-1-git-send-email-cota@braap.org>
X-TUID: Ytccbo42qPLJ

Speed up indirect branches by adding a helper to look for the
TB in tb_jmp_cache. The helper returns either the corresponding
host address or NULL.

Measurements:

- Impact on Boot time

| setup   | ARM debian boot+shutdown time | stddev |
|---------+-------------------------------+--------|
| master  |                  10.050247057 | 0.0361 |
| +cross  |                  10.311265443 | 0.0721 |
| +jr     |                  10.216832579 | 0.0878 |
| +inline |                  10.405597879 | 0.0332 |

That is, a 3.5% slowdown. This is reasonable since booting
has low hit rates in tb_jmp_cache.

-                NBench, arm-linux-user. Host: Intel i7-4790K @ 4.00GHz
                            Y axis: speedup over 95b31d70

    1.25x+-+-------------------------------------------------------------+-+
         |                                                jr          $$$  |
         |                                                jr+inline   %%%  |
     1.2x+-+..................................$$$%%......................+-+
         |                                    $ $ %                        |
         |                                    $ $ %                        |
         |                          %%%       $ $ %   %%                   |
    1.15x+-+........................%.%.......$.$.%.$$$%.................+-+
         |                          % %       $ $ % $ $%                   |
         |                        $$$ %       $ $ % $ $%                   |
     1.1x+-+......................$.$.%.......$.$.%.$.$%.................+-+
         |                        $ $ %       $ $ % $ $%                   |
         |                        $ $ % $$$   $ $ % $ $%               %%% |
    1.05x+-+......................$.$.%.$.$%%.$.$.%.$.$%.............$$$.%-+
         |             $$$%% $$%% $ $ % $ $ % $ $ % $ $%             $ $ % |
         | $$$%%       $ $ % $$ % $ $ % $ $ % $ $ % $ $%             $ $ % |
         | $ $ %       $ $ % $$ % $ $ % $ $ % $ $ % $ $%   %%% $$$%% $ $ % |
       1x+-$.$B%R$$$%%G$A$H%T$$P%j$+$n%i$e$.%.$.$.%.$.$%.$$$.%.$.$.%.$.$.%-+
         +-$$$%%-$$$%%-$$$%%-$$%%-$$$%%-$$$%%-$$$%%-$$$%-$$$%%-$$$%%-$$$%%-+
        ASSIGNMBITFIELFOFP_EMULATHUFFMANLU_DECOMPNEURNUMERICSTRING_SOhmean
  png: http://imgur.com/ihqQj6l

That is, a 6.65% hmean improvement with jr+inline (5.92% w/o inlining).
Peak improvement is 21% for HUFFMAN.

-                NBench, arm-softmmu. Host: Intel i7-4790K @ 4.00GHz
                            Y axis: speedup over 95b31d70
        +------------------------------------------------------------------+
        |                                                                  |
    1.3x+-+........................................ cross+noinline    $$ +-+
        |                                           cross+inline      %%   |
        |                      &&              @@&& cross+jr+noinline @@   |
        |                   $$%@&              @@ & cross+jr+inline   &&   |
    1.2x+-+.................$$%@&......$$..&&..@@.&......................+-+
        |                   $$%@&      $$%%@&  @@ &  @@&                   |
        |                   $$%@&      $$ %@&  @@ &  @@&                   |
    1.1x+-+.................$$%@&...@@.$$.%@&..@@.&..@@&................&&-+
        |             $$%@& $$%@&   @@&$$ %@&  @@ &  @@&               @@& |
        |             $$%@& $$%@&   @@&$$ %@&$$%@ &  @@&       $$%@& $$%@& |
        | $$%&& $$%&& $$%@& $$%@&$$$%@&$$ %@&$$%@ & %%@&       $$%@& $$%@& |
      1x+-$$%@&A$$%@&A$$%@&A$$%@&$R$%@&$$T%@&$$%@s&+%%@&n$$%@&.$$%@&.$$%@&-+
        | $$%@& $$%@& $$%@& $$%@&$ $%@&$$ %@&$$%@ & %%@& $$%@& $$%@& $$%@& |
        | $$%@& $$%@& $$%@& $$%@&$ $%@&$$ %@&$$%@ & %%@& $$%@& $$%@& $$%@& |
    0.9x+-$$%@&.$$%@&.$$%@&.$$%@&$.$%@&$$.%@&$$%@.&.%%@&.$$%@&.$$%@&.$$%@&-+
        | $$%@& $$%@& $$%@& $$%@&$ $%@&$$ %@&$$%@ & %%@& $$%@& $$%@& $$%@& |
        | $$%@& $$%@& $$%@& $$%@&$ $%@&$$ %@&$$%@ &$$%@& $$%@& $$%@& $$%@& |
        | $$%@& $$%@& $$%@& $$%@&$ $%@&$$ %@&$$%@ &$$%@& $$%@& $$%@& $$%@& |
    0.8x+-$$%@&-$$%@&-$$%@&-$$%@&$$$%@&$$%%@&$$%@&&$$%@&-$$%@&-$$%@&-$$%@&-+
       ASSIGNMBITFIELFOUFP_EMULATHUFFMALU_DECOMPNEURANUMERICSTRING_SOhmean
   png: http://imgur.com/yWJivBl

That is, a 9.86% hmean improvement when combining cross+jr+inline (this commit)
over current master. Peak improvement is 25% for FP_EMULATION.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/arm/helper.c    | 11 +++++++++++
 target/arm/helper.h    |  1 +
 target/arm/translate.c | 23 +++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 10b8807..dfbc488 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9927,3 +9927,14 @@ uint32_t HELPER(cross_page_check)(CPUARMState *env, target_ulong vaddr)
 {
     return !!tb_from_jmp_cache(env, vaddr);
 }
+
+void *HELPER(get_hostptr)(CPUARMState *env, target_ulong vaddr)
+{
+    TranslationBlock *tb;
+
+    tb = tb_from_jmp_cache(env, vaddr);
+    if (unlikely(tb == NULL)) {
+        return NULL;
+    }
+    return tb->tc_ptr;
+}
diff --git a/target/arm/helper.h b/target/arm/helper.h
index d4b779b..0faacc1 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -2,6 +2,7 @@ DEF_HELPER_FLAGS_1(sxtb16, TCG_CALL_NO_RWG_SE, i32, i32)
 DEF_HELPER_FLAGS_1(uxtb16, TCG_CALL_NO_RWG_SE, i32, i32)
 
 DEF_HELPER_2(cross_page_check, i32, env, tl)
+DEF_HELPER_2(get_hostptr, ptr, env, tl)
 
 DEF_HELPER_3(add_setq, i32, env, i32, i32)
 DEF_HELPER_3(add_saturate, i32, env, i32, i32)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ce97d0c..2510bb2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -65,6 +65,14 @@ static TCGv_i32 cpu_R[16];
 TCGv_i32 cpu_CF, cpu_NF, cpu_VF, cpu_ZF;
 TCGv_i64 cpu_exclusive_addr;
 TCGv_i64 cpu_exclusive_val;
+static bool gen_jr;
+
+static inline void set_jr(void)
+{
+    if (TCG_TARGET_HAS_jr) {
+        gen_jr = true;
+    }
+}
 
 /* FIXME:  These should be removed.  */
 static TCGv_i32 cpu_F0s, cpu_F1s;
@@ -221,6 +229,7 @@ static void store_reg(DisasContext *s, int reg, TCGv_i32 var)
          */
         tcg_gen_andi_i32(var, var, s->thumb ? ~1 : ~3);
         s->is_jmp = DISAS_JUMP;
+        set_jr();
     }
     tcg_gen_mov_i32(cpu_R[reg], var);
     tcg_temp_free_i32(var);
@@ -893,6 +902,7 @@ static inline void gen_bx_im(DisasContext *s, uint32_t addr)
         tcg_temp_free_i32(tmp);
     }
     tcg_gen_movi_i32(cpu_R[15], addr & ~1);
+    set_jr();
 }
 
 /* Set PC and Thumb state from var.  var is marked as dead.  */
@@ -902,6 +912,7 @@ static inline void gen_bx(DisasContext *s, TCGv_i32 var)
     tcg_gen_andi_i32(cpu_R[15], var, ~1);
     tcg_gen_andi_i32(var, var, 1);
     store_cpu_field(var, thumb);
+    set_jr();
 }
 
 /* Variant of store_reg which uses branch&exchange logic when storing
@@ -12042,6 +12053,18 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
             gen_set_pc_im(dc, dc->pc);
             /* fall through */
         case DISAS_JUMP:
+            if (TCG_TARGET_HAS_jr && gen_jr) {
+                TCGv_ptr ptr = tcg_temp_local_new_ptr();
+                TCGLabel *label = gen_new_label();
+
+                gen_jr = false;
+                gen_helper_get_hostptr(ptr, cpu_env, cpu_R[15]);
+                tcg_gen_brcondi_ptr(TCG_COND_EQ, ptr, NULL, label);
+                tcg_gen_jr(ptr);
+                tcg_temp_free_ptr(ptr);
+                gen_set_label(label);
+                /* fall through */
+            }
         default:
             /* indicate that the hash table must be used to find the next TB */
             tcg_gen_exit_tb(0);
-- 
2.7.4
