Received: by 10.25.0.144 with SMTP id 138csp89160lfa;
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
X-Received: by 10.237.59.19 with SMTP id p19mr60407592qte.28.1491959868189;
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id 63si17939119qtc.201.2017.04.11.18.17.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 43B8A20B4B;
	Tue, 11 Apr 2017 21:17:47 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Tue, 11 Apr 2017 21:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=5TS
	T+1dZBNmJyO7KRqDMvNdeu2S380NORRHnloEkdok=; b=tjv1QxJWYbnkUrWx1mF
	qufJki1RlMDS3SWqEf/9EK8U/WwS+/A6hVDSbLA/WKCPR5n6zIgfpgrsotcaUKDm
	/wXxkCziFW/8dRnt1dWl3KvoYdnVp6z/isP70c0bQVpnQj1co4zBFZcO3UP4xQnV
	8sKrZ8RqfQxNjLjEYCP0ZCdQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=5TST+1dZBNmJyO7KRqDMvNdeu2S380NORRHnloEkd
	ok=; b=dQ8+fJvR6WM1NHDIQTFempvzlLDBaEMYseA+2f4Ws/guLJ+YgnjVT/fZx
	+58G3OmURnk02CY8QXg1JhnxwsYlQ7OHCWtqD/m0e6WWs5OoNj5TF5gAy9zPl5Bw
	AhJN1cBB+YNWwOWVZA4ukxwClM9IQDf8BdyXtnND/aboqQPs8noPZ7pMx/FDHhMz
	zU5XKm2E4eSMXJvu1k+TrQeNOwELMxy1EV5lAe8XHNHqfQoeJ/CeXlkw5KesZVCt
	F+WgJghZ6lF1AoB96ZNYHz8UHHV15DcU6hEciFh7vvIxIKr7gYKoi9pfamUQda5y
	iL46q3XzPrC64+wDwRAWdmRcYq+pA==
X-ME-Sender: <xms:O4DtWELFTO9og7me0nuiDiGdYHM4LL9PWFYHq_YQxIWZ2ncH5qgZDw>
X-Sasl-enc: ERq/ZaMEoUDg17PIOgadLnGpPiI9+MZL93SFqLcWFQJf 1491959867
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id F29667E442;
	Tue, 11 Apr 2017 21:17:46 -0400 (EDT)
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
Subject: [PATCH 03/10] target/arm: optimize cross-page block chaining in softmmu
Date: Tue, 11 Apr 2017 21:17:23 -0400
Message-Id: <1491959850-30756-4-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491959850-30756-1-git-send-email-cota@braap.org>
References: <1491959850-30756-1-git-send-email-cota@braap.org>
X-TUID: gRjfA2nK/J2I

Instead of unconditionally exiting to the exec loop, add a helper to
check whether the target TB is valid. As long as the hit rate in
tb_jmp_cache remains high, this improves performance.

Measurements:

- Boot time of ARM debian jessie on Intel host:

| setup              | ARM debian boot+shutdown time | stddev |
|--------------------+-------------------------------+--------|
| master             |                  10.050247057 | 0.0361 |
| +cross             |                  10.311265443 | 0.0721 |

That is a 2.58% slowdown when booting. This is reasonable given that
tb_jmp_cache's hit rate when booting is expected to be low.

-                NBench, arm-softmmu. Host: Intel i7-4790K @ 4.00GHz
                        (y axis: Speedup over 95b31d70)

    1.3x+-+--------------------------------------------------------------+-+
        |                                           cross+noinline $$$     |
        |                                           cross+inline   %%%     |
        |                   $$$%%                                          |
    1.2x+-+.................$.$.%.......$$$..............................+-+
        |                   $ $ %       $ $%                               |
        |                   $ $ %       $ $%                               |
    1.1x+-+.................$.$.%.......$.$%.............................+-+
        |             $$$%% $ $ %       $ $%                               |
        |             $ $ % $ $ %       $ $% $$$%%             $$$%% $$$%% |
        | $$$%% $$$%% $ $ % $ $ % $$$%% $ $% $ $ %   %%%       $ $ % $ $ % |
      1x+-$.$B%R$R$A%G$A$H%T$M$_%P$L$i%l$n$%.$.$.%...%.%.$$$%%.$.$.%.$.$.%-+
        | $ $ % $ $ % $ $ % $ $ % $ $ % $ $% $ $ %   % % $ $ % $ $ % $ $ % |
        | $ $ % $ $ % $ $ % $ $ % $ $ % $ $% $ $ %   % % $ $ % $ $ % $ $ % |
    0.9x+-$.$.%.$.$.%.$.$.%.$.$.%.$.$.%.$.$%.$.$.%...%.%.$.$.%.$.$.%.$.$.%-+
        | $ $ % $ $ % $ $ % $ $ % $ $ % $ $% $ $ %   % % $ $ % $ $ % $ $ % |
        | $ $ % $ $ % $ $ % $ $ % $ $ % $ $% $ $ % $$$ % $ $ % $ $ % $ $ % |
        | $ $ % $ $ % $ $ % $ $ % $ $ % $ $% $ $ % $ $ % $ $ % $ $ % $ $ % |
    0.8x+-$$$%%-$$$%%-$$$%%-$$$%%-$$$%%-$$$%-$$$%%-$$$%%-$$$%%-$$$%%-$$$%%-+
       ASSIGNMBITFIELFOUFP_EMULATHUFFMALU_DECOMPNEURANUMERICSTRING_SOhmean

  png: http://imgur.com/1rmYSaF

That is, a 4.04% hmean perf improvement over master with tb_from_jmp_cache
not inlined, and a 5.82% hmean perf improvement over master with tb_from_jmp_cache
inlined (i.e. this commit). The largest improvement is 21% for the FP_EMULATION
benchmark.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/arm/helper.c    |  5 +++++
 target/arm/helper.h    |  2 ++
 target/arm/translate.c | 12 ++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8cb7a94..10b8807 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9922,3 +9922,8 @@ uint32_t HELPER(crc32c)(uint32_t acc, uint32_t val, uint32_t bytes)
     /* Linux crc32c converts the output to one's complement.  */
     return crc32c(acc, buf, bytes) ^ 0xffffffff;
 }
+
+uint32_t HELPER(cross_page_check)(CPUARMState *env, target_ulong vaddr)
+{
+    return !!tb_from_jmp_cache(env, vaddr);
+}
diff --git a/target/arm/helper.h b/target/arm/helper.h
index df86bf7..d4b779b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1,6 +1,8 @@
 DEF_HELPER_FLAGS_1(sxtb16, TCG_CALL_NO_RWG_SE, i32, i32)
 DEF_HELPER_FLAGS_1(uxtb16, TCG_CALL_NO_RWG_SE, i32, i32)
 
+DEF_HELPER_2(cross_page_check, i32, env, tl)
+
 DEF_HELPER_3(add_setq, i32, env, i32, i32)
 DEF_HELPER_3(add_saturate, i32, env, i32, i32)
 DEF_HELPER_3(sub_saturate, i32, env, i32, i32)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index e32e38c..ce97d0c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4085,6 +4085,18 @@ static inline void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
         gen_set_pc_im(s, dest);
         tcg_gen_exit_tb((uintptr_t)s->tb + n);
     } else {
+        TCGv vaddr = tcg_const_tl(dest);
+        TCGv_i32 valid = tcg_temp_new_i32();
+        TCGLabel *label = gen_new_label();
+
+        gen_helper_cross_page_check(valid, cpu_env, vaddr);
+        tcg_temp_free(vaddr);
+        tcg_gen_brcondi_i32(TCG_COND_EQ, valid, 0, label);
+        tcg_temp_free_i32(valid);
+        tcg_gen_goto_tb(n);
+        gen_set_pc_im(s, dest);
+        tcg_gen_exit_tb((uintptr_t)s->tb + n);
+        gen_set_label(label);
         gen_set_pc_im(s, dest);
         tcg_gen_exit_tb(0);
     }
-- 
2.7.4
