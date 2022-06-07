Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2406082lfb;
        Tue, 7 Jun 2022 13:43:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFTSTXZkBAgaR014yf2zdByz3mC5uB0nNc4FXY8+5hyvLGSki1xKr9g9I5n9hXRDu4mMB4
X-Received: by 2002:a05:622a:1a9e:b0:304:e8a7:cfb9 with SMTP id s30-20020a05622a1a9e00b00304e8a7cfb9mr13560434qtc.228.1654634637130;
        Tue, 07 Jun 2022 13:43:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654634637; cv=none;
        d=google.com; s=arc-20160816;
        b=eruRiXhLTFFpDsS2CBUIv3M8bWEnlqxOXURWcmvbddg1S19JhKPkbjIlyS2Pwlo1Fz
         YdnW+v6/SHI40dHQYPD3hCjdQGsoQ/AKUVl48Ar2AYlPM3Gaj5Po1MR5GTB0P/bPi0dX
         eirtI5i5Rdbz4NiRv2cMJM4excY9FTQS2H0740koizsmk1Gc+bOHcz6RxrPQb50nUMlg
         zHfTIBl3P5MGAmaXOylRyZM7lOeyyaT6leT1tqvfdSKAnFFTss+5Mfs1k0iEy5HtmaMq
         CHqyKwaz8nL7iUqGgjH+G4432kum1PIxVOt4Y2FgGR6wH8xumbWJwpNAby9dJmmELb0o
         9Ycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1lEZUH/ogWVZdNv0ca1wSpWH+sIL1KbkILIib8NO3cE=;
        b=yz2UzTylXjArHm3WjZkZcgnbINqON1jrKxlNdGV6bDASZAzTPRpfOzGFtL/PDa2Q0K
         +4TfCzBlvG06GAHJWu/7zE3p6bz9t6M611OFMG+aEe3P7GEhpuGgrzwZJa6/E7mG1r3r
         UdscCQ09N+nF1bawe/8AbV+XgIZteSh88r+2wkVjmrZsrOcYKNrlIN6iY0WLCYOqHNKV
         on+LvQIykVvSdY6lxFK6RyoBkg8ghdBQSrjbL7vxzjFIixOegvJkn438v6vQFdYqennL
         vgCeIqkJLRIY1MZS1uLJUOH8lBbvXG0GOKBrQfaK61S1k/BPABetvj82Is2MtJ2yXiSq
         btZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RBURz8yY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8-20020ad45f48000000b00464646e6440si9380972qvg.268.2022.06.07.13.43.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:43:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RBURz8yY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyg3Q-0003C2-Jn
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftH-0007h3-DH
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:27 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:40769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftA-0007Fo-QT
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:27 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 w13-20020a17090a780d00b001e8961b355dso4705574pjk.5
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1lEZUH/ogWVZdNv0ca1wSpWH+sIL1KbkILIib8NO3cE=;
 b=RBURz8yY+JXWmgs5LI0t6iMxs3GV47TihDPYJN2wdFiQBHrOyJHXwnVf4OQrD7LyFB
 sBCoTOxXypv5reSUS0X/XcFdHYSoSM0gxyTBVg/AZ+mYE7HyFlL0VoPz2YPror4E6x75
 +z+bAbNkJplqUBm0NJy/aZ7x0jycUFki6wnZjoKREvP5aFlrFaIQORONB/OyjR0+izkV
 YoY9jDTQ/YOSOa4WSNuSEVFYbNmAuMVSg5pfziUuj6aIO+N/InUJcl733+s54PJnZLcV
 3+g5msB/wFtlBdLn6ECLTAbcclJmBu0oM/5TE/47uZAMymlJ78llbrttUzmT7kgzLX4X
 706w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1lEZUH/ogWVZdNv0ca1wSpWH+sIL1KbkILIib8NO3cE=;
 b=ka1QLHQCkMtI0muCSLNnz3EhQAu/EMsPaSrQ8KW3o/JJetsb16wrezPR/LlQ5qHHnT
 wGVknxhXcofEJw0hsLCTJasNXGMjWlvjHBGkvvio0Jgtd7M7yCMxW4OWBsKaB0s7I6Ug
 4G93Xwq5l2nEX07YkPRKbVmoQ1GNGPiHDC7u2uJzm5fUENujaCxCNzG6mYUczsJ1FDFE
 rG5vi7rp3OtAYohx/RH1KDCkTXdSr1uvpMYfWTYsAKRt8aoCkZHKnO8QgKd6mWPus31z
 gZ9UNGeR87Aw5FCuiovMJ3Ffmek7dPWwFUd92dkHRoPM1tzFkMiSyaVx+odmAUK13G9b
 UVcA==
X-Gm-Message-State: AOAM5300XhjRU7YXuhqpPNUChqUl76gLUrg7ayruV2vj998bZv9UHLdj
 pi7/ik112VcCNWdtmqAJFVABHUpqm2pPtQ==
X-Received: by 2002:a17:902:ab8c:b0:167:4d5c:3542 with SMTP id
 f12-20020a170902ab8c00b001674d5c3542mr22520763plr.6.1654633998493; 
 Tue, 07 Jun 2022 13:33:18 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 12/71] target/arm: Rename sve_zcr_len_for_el to
 sve_vqm1_for_el
Date: Tue,  7 Jun 2022 13:32:07 -0700
Message-Id: <20220607203306.657998-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +KsAOhG61EvW

This will be used for both Normal and Streaming SVE, and the value
does not necessarily come from ZCR_ELx.  While we're at it, emphasize
the units in which the value is returned.

Patch produced by
    git grep -l sve_zcr_len_for_el | \
    xargs -n1 sed -i 's/sve_zcr_len_for_el/sve_vqm1_for_el/g'

and then adding a function comment.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 11 ++++++++++-
 target/arm/arch_dump.c |  2 +-
 target/arm/cpu.c       |  2 +-
 target/arm/gdbstub64.c |  2 +-
 target/arm/helper.c    | 12 ++++++------
 5 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4ec2daec2a..2cc28f9e59 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1132,7 +1132,16 @@ void aarch64_sync_64_to_32(CPUARMState *env);
 
 int fp_exception_el(CPUARMState *env, int cur_el);
 int sve_exception_el(CPUARMState *env, int cur_el);
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
+
+/**
+ * sve_vqm1_for_el:
+ * @env: CPUARMState
+ * @el: exception level
+ *
+ * Compute the current SVE vector length for @el, in units of
+ * Quadwords Minus 1 -- the same scale used for ZCR_ELx.LEN.
+ */
+uint32_t sve_vqm1_for_el(CPUARMState *env, int el);
 
 static inline bool is_a64(CPUARMState *env)
 {
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 0184845310..b1f040e69f 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -166,7 +166,7 @@ static off_t sve_fpcr_offset(uint32_t vq)
 
 static uint32_t sve_current_vq(CPUARMState *env)
 {
-    return sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+    return sve_vqm1_for_el(env, arm_current_el(env)) + 1;
 }
 
 static size_t sve_size_vq(uint32_t vq)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0621944167..1b5d535788 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -925,7 +925,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  vfp_get_fpcr(env), vfp_get_fpsr(env));
 
     if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
-        int j, zcr_len = sve_zcr_len_for_el(env, el);
+        int j, zcr_len = sve_vqm1_for_el(env, el);
 
         for (i = 0; i <= FFR_PRED_NUM; i++) {
             bool eol;
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 596878666d..07a6746944 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -152,7 +152,7 @@ int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
          * We report in Vector Granules (VG) which is 64bit in a Z reg
          * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
          */
-        int vq = sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+        int vq = sve_vqm1_for_el(env, arm_current_el(env)) + 1;
         return gdb_get_reg64(buf, vq * 2);
     }
     default:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7b6f31e9c8..cb44d528c0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6225,7 +6225,7 @@ int sve_exception_el(CPUARMState *env, int el)
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
+uint32_t sve_vqm1_for_el(CPUARMState *env, int el)
 {
     ARMCPU *cpu = env_archcpu(env);
     uint32_t len = cpu->sve_max_vq - 1;
@@ -6248,7 +6248,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                       uint64_t value)
 {
     int cur_el = arm_current_el(env);
-    int old_len = sve_zcr_len_for_el(env, cur_el);
+    int old_len = sve_vqm1_for_el(env, cur_el);
     int new_len;
 
     /* Bits other than [3:0] are RAZ/WI.  */
@@ -6259,7 +6259,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * Because we arrived here, we know both FP and SVE are enabled;
      * otherwise we would have trapped access to the ZCR_ELn register.
      */
-    new_len = sve_zcr_len_for_el(env, cur_el);
+    new_len = sve_vqm1_for_el(env, cur_el);
     if (new_len < old_len) {
         aarch64_sve_narrow_vq(env, new_len + 1);
     }
@@ -13683,7 +13683,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                 sve_el = 0;
             }
         } else if (sve_el == 0) {
-            DP_TBFLAG_A64(flags, VL, sve_zcr_len_for_el(env, el));
+            DP_TBFLAG_A64(flags, VL, sve_vqm1_for_el(env, el));
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
     }
@@ -14049,10 +14049,10 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      */
     old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
     old_len = (old_a64 && !sve_exception_el(env, old_el)
-               ? sve_zcr_len_for_el(env, old_el) : 0);
+               ? sve_vqm1_for_el(env, old_el) : 0);
     new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
     new_len = (new_a64 && !sve_exception_el(env, new_el)
-               ? sve_zcr_len_for_el(env, new_el) : 0);
+               ? sve_vqm1_for_el(env, new_el) : 0);
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
-- 
2.34.1

