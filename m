Received: by 10.25.0.144 with SMTP id 138csp89161lfa;
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
X-Received: by 10.200.4.147 with SMTP id s19mr4795326qtg.226.1491959868235;
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id t17si3950758qke.279.2017.04.11.18.17.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6C7FC20B79;
	Tue, 11 Apr 2017 21:17:47 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Tue, 11 Apr 2017 21:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=Tj7
	7T4KERFxEoiUruN1r0FWqM16gUREttWZpODDV7JI=; b=lo6m3DYBSTk829P5PCV
	bzzKeuauPxy/ZSsLfo057ZKe7jKP/5mMtbAKOJpY+ZRkem1hBXDUzvR3Cu/KcfkF
	39Hl6WUQAe+m21s6Q3dqOtmycboPF8TqtqJhIbb9LaeSXnUYXCW84X/79xN9rd97
	UV60hEkVYH/iJAm6fLRzB4h0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=Tj77T4KERFxEoiUruN1r0FWqM16gUREttWZpODDV7
	JI=; b=QpaV68gUr/jVgr0a59TXiH5ao2zeiB/20xf6DMZaBpjHAsYmINdx93KBp
	hV/zTrWQLiVLZQXodOeNqwtE/B9SKqYQOc1Vk/urkg1q8CynM2GAuHdZAneK0fgj
	ONrt64rHH+P0HmpYo2N600GNDRQxPQzyO+fEE4EOKprEGVBGcyGMT7sYXqHIdFL5
	ke2fiKwF8/ip27d/XHHgjaeWJHfpbAb/IKI9aYXXgLHPd9ZgFFGFJO9ndgFGtB+o
	4gT7zuHQ0Gbi3VSxTIX+ddiwldDgievc3m+3zy9v3L/SUNR09JGR5F+q4WH3XQ/W
	FHqcVmKwnOFn+QGrREbMS3XsTwOUA==
X-ME-Sender: <xms:O4DtWMPOwTIa0ACwAm-GIKnUzBq65SVpznDuudiHaLnm4U9GdktohQ>
X-Sasl-enc: ERqzZr8eoF/o3qTAIQudLnGpPiI9+MZL93SFqLcWFQJf 1491959867
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2B99624526;
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
Subject: [PATCH 04/10] target/i386: optimize cross-page block chaining in softmmu
Date: Tue, 11 Apr 2017 21:17:24 -0400
Message-Id: <1491959850-30756-5-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491959850-30756-1-git-send-email-cota@braap.org>
References: <1491959850-30756-1-git-send-email-cota@braap.org>
X-TUID: WGpG0oPFhw0j

Instead of unconditionally exiting to the exec loop, add a helper to
check whether the target TB is valid. As long as the hit rate in
tb_jmp_cache remains high, this improves performance.

Measurements:

-       specINT 2006 (test set), x86_64-softmmu. Host: Intel i7-4790K @ 4.00GHz
                          Y axis: Speedup over 95b31d70

     1.3x+-+-------------------------------------------------------------+-+
         |           cross $$                                              |
    1.25x+-+.............................................................+-+
         |                                                                 |
     1.2x+-+.............................................................+-+
         |                                                        :        |
         |                                                        :        |
    1.15x+-+.............................................................+-+
         |           $$$$ $$$$                     +++            :        |
     1.1x+-+.........$..$.$..$...........................................+-+
         |           $  $ $  $                     $$$           $$$$      |
    1.05x+-+.........$..$.$..$.....................$.$.$$$$......$..$....+-+
         |           $  $ $  $      +++  +++  +++  $+$ $++$  +++ $: $ $$$$ |
         |       +++ $  $ $  $ +++  $$$   :    :   $ $ $  $ $$$$ $: $ $++$ |
       1x+-$$$$G$$$$_$EM$_$ro$s$$$..$.$.......$$$..$.$.$..$.$..$.$..$.$..$-+
         | $++$ $ :$ $  $ $  $ $ $  $ $   :   $+$  $ $ $  $ $++$ $: $ $  $ |
    0.95x+-$..$.$..$.$..$.$..$.$.$..$.$..$$$..$.$..$.$.$..$.$..$.$..$.$..$-+
         | $  $ $  $ $  $ $  $ $ $  $ $  $:$  $ $  $ $ $  $ $  $ $  $ $  $ |
     0.9x+-$$$$-$$$$-$$$$-$$$$-$$$--$$$--$$$--$$$--$$$-$$$$-$$$$-$$$$-$$$$-+
           astarbzip2gcc gobmh264rehmlibquantumcfomneperlbensjxalancbhmean
  png: http://imgur.com/cwRnmCi

That is, a hmean gain of 2.6%.

-      specINT 2006 (train set), x86_64-softmmu. Host: Intel i7-4790K @ 4.00GHz
                          Y axis: Speedup over 95b31d70

    1.25x+-+-------------------------------------------------------------+-+
         |                cross $$                                         |
         |                                                                 |
     1.2x+-+.............................................................+-+
         |                                          :            +++       |
    1.15x+-+.............................................................+-+
         |            :                            $$$ $$$$      $$$$      |
         |           $$$$ +++                      $:$ $++$  +++ $: $      |
     1.1x+-+.........$..$.$$$$.....................$.$.$..$......$..$....+-+
         |       +++ $++$ $++$ +++   :             $ $ $  $   :  $++$ +++  |
    1.05x+-+....$$$$.$..$.$..$......$$$............$.$.$..$.$$$$.$..$.$$$$-+
         |      $++$ $  $ $  $ $$$  $:$            $ $ $  $ $ :$ $  $ $  $ |
         |      $  $ $  $ $  $ $:$  $+$  +++  +++  $ $ $  $ $ :$ $  $ $  $ |
       1x+-$$$$G$AP$_$EM$_$ro$s$i$li$e$..$$$.......$.$.$..$.$..$.$..$.$..$-+
         | $++$ $  $ $  $ $  $ $+$  $ $  $:$  $$$  $ $ $  $ $  $ $  $ $  $ |
    0.95x+-$..$.$..$.$..$.$..$.$.$..$.$..$.$..$.$..$.$.$..$.$..$.$..$.$..$-+
         | $  $ $  $ $  $ $  $ $ $  $ $  $ $  $+$  $ $ $  $ $  $ $  $ $  $ |
         | $  $ $  $ $  $ $  $ $ $  $ $  $ $  $ $  $ $ $  $ $  $ $  $ $  $ |
     0.9x+-$$$$-$$$$-$$$$-$$$$-$$$--$$$--$$$--$$$--$$$-$$$$-$$$$-$$$$-$$$$-+
           astarbzip2gcc gobmh264rehmlibquantumcfomneperlbensjxalancbhmean
  png: http://imgur.com/0CbG7dD

This is the larger "train" set. We get a hmean improvement of 6.1%.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/i386/helper.h      |  2 ++
 target/i386/misc_helper.c |  5 +++++
 target/i386/translate.c   | 14 +++++++++++++-
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 6fb8fb9..dceb343 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -1,6 +1,8 @@
 DEF_HELPER_FLAGS_4(cc_compute_all, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl, int)
 DEF_HELPER_FLAGS_4(cc_compute_c, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl, int)
 
+DEF_HELPER_2(cross_page_check, i32, env, tl)
+
 DEF_HELPER_3(write_eflags, void, env, tl, i32)
 DEF_HELPER_1(read_eflags, tl, env)
 DEF_HELPER_2(divb_AL, void, env, tl)
diff --git a/target/i386/misc_helper.c b/target/i386/misc_helper.c
index ca2ea09..a41daed 100644
--- a/target/i386/misc_helper.c
+++ b/target/i386/misc_helper.c
@@ -637,3 +637,8 @@ void helper_wrpkru(CPUX86State *env, uint32_t ecx, uint64_t val)
     env->pkru = val;
     tlb_flush(cs);
 }
+
+uint32_t helper_cross_page_check(CPUX86State *env, target_ulong vaddr)
+{
+    return !!tb_from_jmp_cache(env, vaddr);
+}
diff --git a/target/i386/translate.c b/target/i386/translate.c
index 1d1372f..ffc8ccc 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -2153,7 +2153,19 @@ static inline void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
         gen_jmp_im(eip);
         tcg_gen_exit_tb((uintptr_t)s->tb + tb_num);
     } else {
-        /* jump to another page: currently not optimized */
+        /* jump to another page */
+        TCGv vaddr = tcg_const_tl(eip);
+        TCGv_i32 valid = tcg_temp_new_i32();
+        TCGLabel *label = gen_new_label();
+
+        gen_helper_cross_page_check(valid, cpu_env, vaddr);
+        tcg_temp_free(vaddr);
+        tcg_gen_brcondi_i32(TCG_COND_EQ, valid, 0, label);
+        tcg_temp_free_i32(valid);
+        tcg_gen_goto_tb(tb_num);
+        gen_jmp_im(eip);
+        tcg_gen_exit_tb((uintptr_t)s->tb + tb_num);
+        gen_set_label(label);
         gen_jmp_im(eip);
         gen_eob(s);
     }
-- 
2.7.4
