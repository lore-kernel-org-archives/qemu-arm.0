Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp348034lfu;
        Sat, 30 Apr 2022 16:45:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGA7EYHmIZI/YzRuvli2aGR386HmXKcoxZ8DMJ9Z5l+K4bh6COVnzOFov69XmsvTelJmqM
X-Received: by 2002:a05:622a:1a91:b0:2f3:8fd3:7e4a with SMTP id s17-20020a05622a1a9100b002f38fd37e4amr5172415qtc.54.1651362356224;
        Sat, 30 Apr 2022 16:45:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651362356; cv=none;
        d=google.com; s=arc-20160816;
        b=0kCsOdAtnp1hLQk02vtnHXqxSoA54h4TMe2EIakxXdUdxI+fWA2vcTXiuvrMRPntMh
         olHVvuYPNBHM6Yuc9dZWquIaFY960WPQXQZFhiq+OyG48GVGDKQD8k6ACGWviKgAE1Gx
         Uu5HQv6qjxNzjIuWY2SxHvjvvAlWBWTVJm9MPQ96iUJIEpGOEqUH+mOOHk75nQa87rxs
         VW/4N605gXZJytDrqVL25Pqss2RgbwVPWJ9qm5zB9jGJd3Z+McRu6NTvPj40hWXZSLjI
         ZeB4WhCpYJuTroXNvHGb8GgIOoqdUmYyg33BlNzfG42gj2aaW/ZFpi35HNYl1yBbOT+W
         CT0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=aIM5y3FwuUdO7Ss7RaTa5eRCNK5AwcUyLcfxq7kJae0=;
        b=EwcLmtxuKwL/ieuIfREqOQOenL+vZW26k6+TrYwR+E83PBjcx9i318UFiet1QIs3SF
         Bd4VYY83hBF/KUuLWa8y8LV/J9lU8BKGnr5t/7m20jDF0gciBWRu7Mly5LP/ZGEUNnFY
         70CtLYuKnyXsWmjDQ5sPCjPo1qk1hJXliKzJqluwCiS6XWBdOWpwqvi+UdVe0lI/rOeO
         sQtSYYZxSvGZ2/ThNxV2MJqx4n9WmlwHhTZS+fuOX2L4+8dbCw9LMfg42YD/VEduZPVN
         PD86IGhe9ABzUkHLrtYEJop5lf00NeDYLVIieDqwBVYzmL1c92SP6boCsQO14tjsIi6t
         JiSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZGA/7rlp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gg8-20020a056214252800b0045653248369si5053099qvb.285.2022.04.30.16.45.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 16:45:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZGA/7rlp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nkwmh-0002g0-NL
	for alex.bennee@linaro.org; Sat, 30 Apr 2022 19:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkwmV-0002fX-0c
 for qemu-arm@nongnu.org; Sat, 30 Apr 2022 19:45:43 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkwmQ-0004GJ-0a
 for qemu-arm@nongnu.org; Sat, 30 Apr 2022 19:45:42 -0400
Received: by mail-pg1-x530.google.com with SMTP id x12so9171473pgj.7
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 16:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aIM5y3FwuUdO7Ss7RaTa5eRCNK5AwcUyLcfxq7kJae0=;
 b=ZGA/7rlpiqOD9I+TJ5T7a1W4u+fBRmf96LHkMU/CvjLftExGH3Ibyk16xESdrSATp7
 Csak4k1F6m4OVLMsaqCF+/vO4qtnRQPUujFqUfa+k/hXUVDXvDjMCBHR8yyunsJMCXWb
 qoZ3dOTTuMvmnrSZyqlf7NxLMBKk2mOdkSTUly1B0orrhypkMhWfiDS3ycsaEBo6WxeC
 RGKepRW02MZ24loOskvp1/hqg/jxIXADVJAUKJfX0OvQOlodEW+CI7J6LDJOhPutMETr
 9fRI9CqR8TBLAeZgSqx+xpWsMUbwceAWyngky/PFVOkxUsRM7ylzpgtYgqIoUKltLj0l
 VoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aIM5y3FwuUdO7Ss7RaTa5eRCNK5AwcUyLcfxq7kJae0=;
 b=zbQoLx/1sBAnkR+U5BYnKScjcg4g+s7fu1dURocfJcdBqkUfKO40gLwn9beTBBKuEZ
 eBLStBSteZzLdyl7KXSNRjygnu9GYFt5ex8zw69TY2G8/yERjh51DY9d+hdsXzji7+7z
 f2WUGGcYW7vAkNEIo1a9d0ZMftIUHKoilotPJ/vPherUo921p8jkxS5xklyMEF89Qo7P
 HY2pyO6Tv2zyqKBeprJBIiGpEqLgIasAkA1hXWR0DP03+G733Z/gg68ztZzWeb8ov917
 Lu5FDc8ype3uPCaGfHOGn5ZZ40jBBuTvWz2tYUmInE3QwCQEUND+ClxgW7ZxtcIuSsXZ
 Kigg==
X-Gm-Message-State: AOAM533BzpNpM+f3vKozrOKr6CauwD2UzTi2X/HZihsVT5ga++ySLgDA
 bOZMmvf7MHLbeCcP1Fa2sNt0gg==
X-Received: by 2002:a63:515a:0:b0:3c1:4902:5e6a with SMTP id
 r26-20020a63515a000000b003c149025e6amr4403597pgl.203.1651362336259; 
 Sat, 30 Apr 2022 16:45:36 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 m1-20020a637d41000000b003c14af5063esm8874128pgn.86.2022.04.30.16.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 16:45:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Special case split barriers before/after load
Date: Sat, 30 Apr 2022 16:45:34 -0700
Message-Id: <20220430234534.446733-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: redha.gouicem@gmail.com, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ip+72ZU62IMC

When st:ld is not required by the guest but ld:st is, we can
put ld:ld+ld:st barriers after loads, and then st:st barriers
before stores to enforce all required barriers.

The st:st barrier is often special cased by hosts, and that
is expected to be more efficient than a full barrier.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Redha, I expect this to produce exactly the same barriers as you
did with your 'fix guest memory ordering enforcement' patch.

While this compiles, it does not fix the failures that I see
occasionally with our private gitlab runner.  The standalone
version of this failure is

  export QTEST_QEMU_BINARY=./qemu-system-i386
  for i in `seq 1 100`; do
    ./tests/qtest/ahci-test > /dev/null &
  done
  wait

About 10 to 15% of the runs will fail with

ERROR:../src/tests/qtest/ahci-test.c:92:verify_state: assertion failed (ahci_fingerprint == ahci->fingerprint): (0xe0000000 == 0x29228086)

Note that this test never seems to fail unless the system is under
load, thus starting 100 tests on my 80 core neoverse-n1 system.


r~


---
 tcg/tcg-op.c | 55 +++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 48 insertions(+), 7 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 5d48537927..4c568a2592 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2834,9 +2834,6 @@ static void gen_ldst_i64(TCGOpcode opc, TCGv_i64 val, TCGv addr,
 
 static void tcg_gen_req_mo(TCGBar type)
 {
-#ifdef TCG_GUEST_DEFAULT_MO
-    type &= TCG_GUEST_DEFAULT_MO;
-#endif
     type &= ~TCG_TARGET_DEFAULT_MO;
     if (type) {
         tcg_gen_mb(type | TCG_BAR_SC);
@@ -2868,12 +2865,49 @@ static void plugin_gen_mem_callbacks(TCGv vaddr, MemOpIdx oi,
 #endif
 }
 
+typedef enum {
+    BAR_LD_BEFORE,
+    BAR_LD_AFTER,
+    BAR_ST_BEFORE,
+} ChooseBarrier;
+
+static TCGBar choose_barrier(ChooseBarrier which)
+{
+#ifdef TCG_GUEST_DEFAULT_MO
+    const TCGBar guest_mo = TCG_GUEST_DEFAULT_MO;
+#else
+    const TCGBar guest_mo = TCG_MO_ALL;
+#endif
+    TCGBar ret[3];
+
+    if (guest_mo == 0) {
+        return 0;
+    }
+    /*
+     * Special case for i386 and s390x.  Because store-load is not
+     * required by the guest, we can split the barriers such that we
+     * wind up with a store-store barrier, which is expected to be
+     * quicker on some hosts.
+     */
+    if (guest_mo == (TCG_MO_ALL & ~TCG_MO_ST_LD)) {
+        ret[BAR_LD_BEFORE] = 0;
+        ret[BAR_LD_AFTER]  = TCG_MO_LD_LD | TCG_MO_LD_ST;
+        ret[BAR_ST_BEFORE] = TCG_MO_ST_ST;
+    } else {
+        ret[BAR_LD_BEFORE] = (TCG_MO_LD_LD | TCG_MO_ST_LD) & guest_mo;
+        ret[BAR_ST_BEFORE] = (TCG_MO_LD_ST | TCG_MO_ST_ST) & guest_mo;
+        ret[BAR_LD_AFTER]  = 0;
+    }
+    return ret[which];
+}
+
 void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     MemOp orig_memop;
     MemOpIdx oi;
 
-    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
+    tcg_gen_req_mo(choose_barrier(BAR_LD_BEFORE));
+
     memop = tcg_canonicalize_memop(memop, 0, 0);
     oi = make_memop_idx(memop, idx);
 
@@ -2904,6 +2938,8 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
             g_assert_not_reached();
         }
     }
+
+    tcg_gen_req_mo(choose_barrier(BAR_LD_AFTER));
 }
 
 void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
@@ -2911,7 +2947,8 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
     TCGv_i32 swap = NULL;
     MemOpIdx oi;
 
-    tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
+    tcg_gen_req_mo(choose_barrier(BAR_ST_BEFORE));
+
     memop = tcg_canonicalize_memop(memop, 0, 1);
     oi = make_memop_idx(memop, idx);
 
@@ -2959,7 +2996,8 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
         return;
     }
 
-    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
+    tcg_gen_req_mo(choose_barrier(BAR_LD_BEFORE));
+
     memop = tcg_canonicalize_memop(memop, 1, 0);
     oi = make_memop_idx(memop, idx);
 
@@ -2994,6 +3032,8 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
             g_assert_not_reached();
         }
     }
+
+    tcg_gen_req_mo(choose_barrier(BAR_LD_AFTER));
 }
 
 void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
@@ -3006,7 +3046,8 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
         return;
     }
 
-    tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
+    tcg_gen_req_mo(choose_barrier(BAR_ST_BEFORE));
+
     memop = tcg_canonicalize_memop(memop, 1, 1);
     oi = make_memop_idx(memop, idx);
 
-- 
2.25.1

