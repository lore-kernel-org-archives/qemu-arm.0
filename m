Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2920932lfq;
        Mon, 11 Jan 2021 11:06:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxf3HOTrx01JSv18y8RNZZnBta81quYFVTFmK9jIWOg26Jes+nc+FFQsS2q4B+n6ja3t65+
X-Received: by 2002:a5b:404:: with SMTP id m4mr1777469ybp.436.1610391995245;
        Mon, 11 Jan 2021 11:06:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610391995; cv=none;
        d=google.com; s=arc-20160816;
        b=ejfTksK20YHWXqtLfrcCG1gRU2k3Z6VV6N+uoJl65zUpYJy0hCnNso1gEsxwOHVI5U
         T2td/rnzaqnI7VBOkOPpcD2bct4W/2vURMVJ4brnLmH7aQHOinbCRRUDW22fbN0o7QR+
         5cDDWHJFsZ57hcIYAi2ZW/mYGImu+Hp3dLpXgSkl99OTGVZvFm72vaHoDJm4U1H+6eIG
         sh0507wKTWNxtfdI7Gjpr5MZoiWVcSEnbb/PxRkN4V9illvcdFoPRlmIOslAmT3m4opW
         Y+4to0zhq1NmutHUhFbbb4K6dLnXHOUix4xNW20hMT4T0FHoBDn6ygNV0ZG4/Pd7cRKk
         UCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5Vo6hKG+XeXChWCO/nvW6DJ7PoxmnMyeEjcU9Aitm8k=;
        b=qm7oEqv7KSVGWXlHGPHVWisonnF2BOz3Jxc5x1MKm64lhIB/OELqqXFLmgfDLQLHNO
         rVXfkFg6zY7ByNAsJu15CKpgX1KUD5Ry2JSC5SNfRnEKfSi1+u8d+wI5DVd2G8Ex39Ue
         Br0I0ykq2b94Qx423S3STaa0c+3VG0cNq/rVNTUSyd/RpQD0wLheVtF7DT3NkgeFEpSO
         aBABDEVYjWGqgJWVuC1nciJmshy4Xr+kk9cQt3lwvAdvq/t2KE3EBwtCpqgjEELvAEgZ
         MNxR3d+I/qXKx2zTFfnIjPqW2jrgwYZ63cWlmIca41m9egQg+4Hc/mT/ZQo51MvIDXVu
         4nAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wB8QbFzC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19si633280ybj.293.2021.01.11.11.06.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:06:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wB8QbFzC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2WQ-0002Ak-Ks
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RW-0005rx-Cb
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:30 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RU-0006OZ-Cb
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:30 -0500
Received: by mail-pg1-x52b.google.com with SMTP id g15so256858pgu.9
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 11:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Vo6hKG+XeXChWCO/nvW6DJ7PoxmnMyeEjcU9Aitm8k=;
 b=wB8QbFzCmsJAZTXrsgIP+l7TBsqQDhPTNBcXt3a68iZP+fMcz5sVl/XBacPT/dFsCo
 r6N+1UvTNvw/Q0xtA5/G+5LU6elom4o2h9D/p8x/9cTWFsDxFl56CCgl8/zhRSGsZep2
 vkHwd+cw059z5Atmu8r7ZvJHIRuauWu9j81OHN1Glr2BNy8R2E8BscB5Qz6zmAoAL+Gj
 XKOxnbjAhzVCJGKu43BM3ZEy+g6P0jARQZqAQpXMb9DRc7tYS2wTAfsc5r9iVHBW7Wny
 4rm4UNgPSYBl13HzA3HXiEZq8+kzCKydRscVlDPQvfz9vuEWiww0+vZ2KcZWQU0MsWHJ
 iKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Vo6hKG+XeXChWCO/nvW6DJ7PoxmnMyeEjcU9Aitm8k=;
 b=qIhVJ/K4cCYWjpJB7RGv9AIujhfe0pkHSLNvBbJuxMDoPSS9uo26v0YueYQ7P62jbN
 pEKoma04k108Af8jhEfj3K1i1FPMoJj14Nys6o2Uyo5ukerUrgnA/czT9fk5DsuVXX2I
 F32Et3H6Ne5p7LjwnagN9GfPdYKnYuTAdOib/Is0DHQSFgBTTYfuC9/WY0Vq6fXfPR56
 RAJzxMeXDui7BxI90xf2gMwGbV1CLxBMlWSlocDKdzPCZ6MFqus0fuThCcBO3s8WFlLU
 KsvLBUIIG85xbBQFn1cc0/79VPSgICSk9Ga5BDn6H4XjSWWrb4r9z4sOGj+U59Llg6xS
 M8iw==
X-Gm-Message-State: AOAM531QN9SLwVmxgAbEaM1L1w44qCdJ51aQsN8hsfdfYAz/MfZWsXep
 PE5nEcwrL6crC9pcO5cljihUTQ==
X-Received: by 2002:aa7:860b:0:b029:19e:2827:93b7 with SMTP id
 p11-20020aa7860b0000b029019e282793b7mr827804pfn.22.1610391686700; 
 Mon, 11 Jan 2021 11:01:26 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/30] target/arm: Move mode specific TB flags to
 tb->cs_base
Date: Mon, 11 Jan 2021 09:00:49 -1000
Message-Id: <20210111190113.303726-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kwHsACuJGsB5

Now that we have all of the proper macros defined, expanding
the CPUARMTBFlags structure and populating the two TB fields
is relatively simple.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 49 ++++++++++++++++++++++++------------------
 target/arm/translate.h |  2 +-
 target/arm/helper.c    |  2 +-
 3 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c7700c9c85..af70462cfa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -221,6 +221,7 @@ typedef struct ARMPACKey {
 /* See the commentary above the TBFLAG field definitions.  */
 typedef struct CPUARMTBFlags {
     uint32_t flags;
+    target_ulong flags2;
 } CPUARMTBFlags;
 
 typedef struct CPUARMState {
@@ -3251,20 +3252,26 @@ typedef ARMCPU ArchCPU;
 #include "exec/cpu-all.h"
 
 /*
- * Bit usage in the TB flags field: bit 31 indicates whether we are
- * in 32 or 64 bit mode. The meaning of the other bits depends on that.
- * We put flags which are shared between 32 and 64 bit mode at the top
- * of the word, and flags which apply to only one mode at the bottom.
+ * We have more than 32-bits worth of state per TB, so we split the data
+ * between tb->flags and tb->cs_base, which is otherwise unused for ARM.
+ * We collect these two parts in CPUARMTBFlags where they are named
+ * flags and flags2 respectively.
  *
- *  31          20    18    14          9              0
- * +--------------+-----+-----+----------+--------------+
- * |              |     |   TBFLAG_A32   |              |
- * |              |     +-----+----------+  TBFLAG_AM32 |
- * |  TBFLAG_ANY  |           |TBFLAG_M32|              |
- * |              +-----------+----------+--------------|
- * |              |            TBFLAG_A64               |
- * +--------------+-------------------------------------+
- *  31          20                                     0
+ * The flags that are shared between all execution modes, TBFLAG_ANY,
+ * are stored in flags.  The flags that are specific to a given mode
+ * are stores in flags2.  Since cs_base is sized on the configured
+ * address size, flags2 always has 64-bits for A64, and a minimum of
+ * 32-bits for A32 and M32.
+ *
+ * The bits for 32-bit A-profile and M-profile partially overlap:
+ *
+ *  18             9              0
+ * +----------------+--------------+
+ * |   TBFLAG_A32   |              |
+ * +-----+----------+  TBFLAG_AM32 |
+ * |     |TBFLAG_M32|              |
+ * +-----+----------+--------------+
+ *     14          9              0
  *
  * Unless otherwise noted, these bits are cached in env->hflags.
  */
@@ -3342,19 +3349,19 @@ FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
 #define DP_TBFLAG_ANY(DST, WHICH, VAL) \
     (DST.flags = FIELD_DP32(DST.flags, TBFLAG_ANY, WHICH, VAL))
 #define DP_TBFLAG_A64(DST, WHICH, VAL) \
-    (DST.flags = FIELD_DP32(DST.flags, TBFLAG_A64, WHICH, VAL))
+    (DST.flags2 = FIELD_DP32(DST.flags2, TBFLAG_A64, WHICH, VAL))
 #define DP_TBFLAG_A32(DST, WHICH, VAL) \
-    (DST.flags = FIELD_DP32(DST.flags, TBFLAG_A32, WHICH, VAL))
+    (DST.flags2 = FIELD_DP32(DST.flags2, TBFLAG_A32, WHICH, VAL))
 #define DP_TBFLAG_M32(DST, WHICH, VAL) \
-    (DST.flags = FIELD_DP32(DST.flags, TBFLAG_M32, WHICH, VAL))
+    (DST.flags2 = FIELD_DP32(DST.flags2, TBFLAG_M32, WHICH, VAL))
 #define DP_TBFLAG_AM32(DST, WHICH, VAL) \
-    (DST.flags = FIELD_DP32(DST.flags, TBFLAG_AM32, WHICH, VAL))
+    (DST.flags2 = FIELD_DP32(DST.flags2, TBFLAG_AM32, WHICH, VAL))
 
 #define EX_TBFLAG_ANY(IN, WHICH)   FIELD_EX32(IN.flags, TBFLAG_ANY, WHICH)
-#define EX_TBFLAG_A64(IN, WHICH)   FIELD_EX32(IN.flags, TBFLAG_A64, WHICH)
-#define EX_TBFLAG_A32(IN, WHICH)   FIELD_EX32(IN.flags, TBFLAG_A32, WHICH)
-#define EX_TBFLAG_M32(IN, WHICH)   FIELD_EX32(IN.flags, TBFLAG_M32, WHICH)
-#define EX_TBFLAG_AM32(IN, WHICH)  FIELD_EX32(IN.flags, TBFLAG_AM32, WHICH)
+#define EX_TBFLAG_A64(IN, WHICH)   FIELD_EX32(IN.flags2, TBFLAG_A64, WHICH)
+#define EX_TBFLAG_A32(IN, WHICH)   FIELD_EX32(IN.flags2, TBFLAG_A32, WHICH)
+#define EX_TBFLAG_M32(IN, WHICH)   FIELD_EX32(IN.flags2, TBFLAG_M32, WHICH)
+#define EX_TBFLAG_AM32(IN, WHICH)  FIELD_EX32(IN.flags2, TBFLAG_AM32, WHICH)
 
 /**
  * cpu_mmu_index:
diff --git a/target/arm/translate.h b/target/arm/translate.h
index f30287e554..50c2aba066 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -402,7 +402,7 @@ typedef void AtomicThreeOpFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGArg, MemOp);
  */
 static inline CPUARMTBFlags arm_tbflags_from_tb(const TranslationBlock *tb)
 {
-    return (CPUARMTBFlags){ tb->flags };
+    return (CPUARMTBFlags){ tb->flags, tb->cs_base };
 }
 
 /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cc73acc927..0d7c8817b6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13030,7 +13030,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     CPUARMTBFlags flags;
     uint32_t pstate_for_ss;
 
-    *cs_base = 0;
     assert_hflags_rebuild_correctly(env);
     flags = env->hflags;
 
@@ -13101,6 +13100,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     }
 
     *pflags = flags.flags;
+    *cs_base = flags.flags2;
 }
 
 #ifdef TARGET_AARCH64
-- 
2.25.1

