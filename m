Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp60882lfm;
        Thu, 25 Jun 2020 20:58:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygQEDnyo/q+9rwGy352FdY5PpVDiiVTvGO5oZRSI+3Z+VpuDkDuYlnlBx/oAgqkcOFCK2T
X-Received: by 2002:a25:3c83:: with SMTP id j125mr1656021yba.223.1593143920593;
        Thu, 25 Jun 2020 20:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593143920; cv=none;
        d=google.com; s=arc-20160816;
        b=U+d+GgNxo4tuTWudJ+gdNSFyy+pA8ImC8Wl4zKzD7t44Ok1UppsW84VVVoVCZiaKda
         clj22z9a1p84nkLkOFPvpD/+QbH8rnMwGEgM7SaWFcXdbQ5/fVK243PBtBx89VzrsaUZ
         12Xm0O8Ldik1BnzWmzjECZYDH09gGqEaap3C9idL+sk+r6/ix1YF+Oo9u2Lyc7RrufS9
         fkzrFG7fhLZ1SDlPmFA+789vnhZJqFGd0WcB+TjGNvMWnxMVhCF1++5s95s7pmiPteJ9
         qiIVUX0qCGk0Lyqast+GxOzMIAnyrpwo7xI+yEbg66R6ObT1njUM9ngklJug1YuXF14L
         Ye8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3GLkukFRFNUJ3dp50WZNEvNqQ9MQfmMd/OfAXS3PDtA=;
        b=l17o0ifyIzm1BOClqHGEpEBM+rlHrgseQmcD4giUOEGIG/LwA1GKFV8PDiVp7RLTS3
         eZk11Ep9kXGbbElK0OeVZ+1BdrbKhb7swW1O2ei05FDIp2SsimU81utwUosUuZB/5kxU
         6GJUq/LTlx/SaCYb1r/AuMs7MkhjQnQ+geAlqN/mPGF0jvE2KeNj4DbVgJQ2gCmPhq9G
         32t+65UbqodPtnSeyi1+U5Y/Qv07D/MO8YkI0QcorOrFsT/NoGad6o5IgNes44qhF+1u
         J+WIXdXfhcXc77hNvc0STPFvNTsxcsq5GtnHCsqzgkbUHgc+ENKTQjxDNUzkZzgLzMV+
         zThw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aVuSM8iO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s88si29240642ybi.345.2020.06.25.20.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:58:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aVuSM8iO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofVg-0003s8-0V
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6W-0001Bh-Me
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:40 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6U-00025b-Sk
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:40 -0400
Received: by mail-pg1-x543.google.com with SMTP id t6so4370662pgq.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3GLkukFRFNUJ3dp50WZNEvNqQ9MQfmMd/OfAXS3PDtA=;
 b=aVuSM8iO0IGqBUEqC0YyOgFaWYN7UVoP3bP1m/AQnjqTHU2F5W5L4bjFh48y092Hzw
 wS69sa2IO2aaChJIj9BY/AhCVQ+RWH4aFhZuad7JXosb7gd6gL+10DIHvji2DDnTDeS9
 MNS6HP1bb4IjWazg3E8xRmKAbSt63/oKprsec4THUk0mciMfcK08zJCYZPpukhMriKlc
 2ZWplBalntDlR55TcoOfLZrBoQ8IGvBUNQifxGNv+in4vly9uSEiu5gKEsgb3wf4SfCe
 mfuSD9iEa/Ydh6sIojlLutzK0JossfgcANSjTU+GrK0VYcQ9q8ys9ZaoqiXNp4aSAWrF
 83Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3GLkukFRFNUJ3dp50WZNEvNqQ9MQfmMd/OfAXS3PDtA=;
 b=Vx/32P4TxE9PPRqWdDZqp/xqRdSHM18cE0+6kxktkRxetBIoC3HpEoh9cvBu1VfXIM
 rYWg6NUgJM3Bkqbp0p1cQACo2ESelCeyyZhxmok0yj5UidGo70l4kBY0Kkx43KdSPpOZ
 1+dX8z2sdWW7iU9PCVx5Sp7v7tdNN4RymXNJIF5GXHdOA5swRNfUnKycpDIpFb66lQIY
 dVVkZ2DjKXrD2KCVLX9CkG815We6AztXqCtB7A4UxC3gGjTphCmrZV2R3PAwGpBxknyy
 G/jIYZD37/Oazm5ACFLsdU8u9U8lMPYMzMOVS8IwgE6MJ8YitjiZKpqbHWi+Ckp/j2Jf
 ymWw==
X-Gm-Message-State: AOAM533gM4aiURSYv9lR3tlQ+59ZdkYJ8DiG5AEMegt0Dz/wmbx8BoDl
 d3yURloZzkRHyGxYGtcYQJfghg==
X-Received: by 2002:a63:c58:: with SMTP id 24mr888373pgm.343.1593142357597;
 Thu, 25 Jun 2020 20:32:37 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 38/46] target/arm: Complete TBI clearing for user-only for
 SVE
Date: Thu, 25 Jun 2020 20:31:36 -0700
Message-Id: <20200626033144.790098-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vB1NEJCkNMhC

There are a number of paths by which the TBI is still intact
for user-only in the SVE helpers.

Because we currently always set TBI for user-only, we do not
need to pass down the actual TBI setting from above, and we
can remove the top byte in the inner-most primitives, so that
none are forgotten.  Moreover, this keeps the "dirty" pointer
around at the higher levels, where we need it for any MTE checking.

Since the normal case, especially for user-only, goes through
RAM, this clearing merely adds two insns per page lookup, which
will be completely in the noise.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v9: Added an assert for tbi in aarch64_tr_init_disas_context (pmm)
---
 target/arm/cpu.c           |  3 +++
 target/arm/sve_helper.c    | 19 +++++++++++++++++--
 target/arm/translate-a64.c |  5 +++++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d9876337c0..afe81e9b6c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -203,6 +203,9 @@ static void arm_cpu_reset(DeviceState *dev)
          * Enable TBI0 and TBI1.  While the real kernel only enables TBI0,
          * turning on both here will produce smaller code and otherwise
          * make no difference to the user-level emulation.
+         *
+         * In sve_probe_page, we assume that this is set.
+         * Do not modify this without other changes.
          */
         env->cp15.tcr_el[1].raw_tcr = (3ULL << 37);
 #else
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index ad974c2cc5..382fa82bc8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3966,14 +3966,16 @@ static void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host)  \
 static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
                              target_ulong addr, uintptr_t ra)               \
 {                                                                           \
-    *(TYPEE *)(vd + H(reg_off)) = (TYPEM)TLB(env, addr, ra);                \
+    *(TYPEE *)(vd + H(reg_off)) =                                           \
+        (TYPEM)TLB(env, useronly_clean_ptr(addr), ra);                      \
 }
 
 #define DO_ST_TLB(NAME, H, TYPEE, TYPEM, TLB) \
 static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
                              target_ulong addr, uintptr_t ra)               \
 {                                                                           \
-    TLB(env, addr, (TYPEM)*(TYPEE *)(vd + H(reg_off)), ra);                 \
+    TLB(env, useronly_clean_ptr(addr),                                      \
+        (TYPEM)*(TYPEE *)(vd + H(reg_off)), ra);                            \
 }
 
 #define DO_LD_PRIM_1(NAME, H, TE, TM)                   \
@@ -4091,6 +4093,19 @@ static bool sve_probe_page(SVEHostPage *info, bool nofault,
     int flags;
 
     addr += mem_off;
+
+    /*
+     * User-only currently always issues with TBI.  See the comment
+     * above useronly_clean_ptr.  Usually we clean this top byte away
+     * during translation, but we can't do that for e.g. vector + imm
+     * addressing modes.
+     *
+     * We currently always enable TBI for user-only, and do not provide
+     * a way to turn it off.  So clean the pointer unconditionally here,
+     * rather than look it up here, or pass it down from above.
+     */
+    addr = useronly_clean_ptr(addr);
+
     flags = probe_access_flags(env, addr, access_type, mmu_idx, nofault,
                                &info->host, retaddr);
     info->flags = flags;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e46c4a49e0..c20af6ee9d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14634,6 +14634,11 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->features = env->features;
     dc->dcz_blocksize = arm_cpu->dcz_blocksize;
 
+#ifdef CONFIG_USER_ONLY
+    /* In sve_probe_page, we assume TBI is enabled. */
+    tcg_debug_assert(dc->tbid & 1);
+#endif
+
     /* Single step state. The code-generation logic here is:
      *  SS_ACTIVE == 0:
      *   generate code with no special handling for single-stepping (except
-- 
2.25.1

