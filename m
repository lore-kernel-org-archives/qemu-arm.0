Received: by 10.28.4.212 with SMTP id 203csp334371wme;
        Fri, 4 May 2018 11:31:26 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqNiEImMSYOtDKtdsvGaYetJ8ldikfkAJtRrcgeQ+9fAMiph1suuUMgegMRriLYMYh2JbO1
X-Received: by 2002:a0c:f146:: with SMTP id y6-v6mr24962655qvl.0.1525458686216;
        Fri, 04 May 2018 11:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525458686; cv=none;
        d=google.com; s=arc-20160816;
        b=bCV0Fc38wj5HsCKk6IIMQMi9muyBaU6k6nd5KRns5DJsS98xKdpkHriocfhswWIhAo
         mxoBVn+sumiNgEdgS93uTfHr6eSV8jZ8Wu9ULatj7wFjC1OuFX2tpD9gJx6ADCNNilwA
         OnmHuyw3Sf2VANGT4o73fyYybDkaJYpQJPZlPgIBzM7lMzTSRZz2Wud+Yt8OMTfDnJJW
         wAH6tgdxSzUr7eIE0ZIDHjt7MbcRcQVjiN6TQzm6sxf6qUjSGH84ii4stIdCOBIedT0d
         KLtRgAioBNLjuRVOm0nV0bqRv8lrQXUohyaDRn5XbQ6dt+ZkjuEgmF0vLTvbdpTk5A4C
         aCmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=4PxQ9ypwFLuzoamvhpohGwQ9B+0V26vuEkgTGmcr9do=;
        b=Tb+TOtTRdpib+pFFbn10CtjAp2lcMnlKeSXtntJcZFb+w3JxGwNHDhPEARuKiC1XGc
         buKzCD/SjyXasfczHB5qdhxe1FDsrbKbQpeDElQnWI/nit6L1iBnHNAfIgHurJVkiCoR
         jXf+ZqpFzkBButPlOtcEXlWtb9c5CohJyEnsHe4PNml1l3yZwqhHnAEtPcm/wKHGCSuT
         KxW2WDWpDLZmssGK1vGZUIjqz3KhCwMdYKZfjaIxPgU+8chFoneGbK42fy0oSI3IknOR
         +n+2V5oiZOB30AGFODVJZE1w1pEQT/RYdtQqsdiMr9SaSOR7Soc7eGfxHOnAKO0FUMqi
         0Uew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R3JN2Fn3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k5-v6si1616748qvg.278.2018.05.04.11.31.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 11:31:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R3JN2Fn3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35979 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEfUL-0007y6-KX
	for alex.bennee@linaro.org; Fri, 04 May 2018 14:31:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTU-0007VM-DK
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTS-00016p-KQ
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:32 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:35639)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fEfTS-00016F-Cq
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:30 -0400
Received: by mail-pf0-x242.google.com with SMTP id j5so18082171pfh.2
	for <qemu-arm@nongnu.org>; Fri, 04 May 2018 11:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4PxQ9ypwFLuzoamvhpohGwQ9B+0V26vuEkgTGmcr9do=;
	b=R3JN2Fn3Ax3FGhDJJ9hF4ubSCaIByueo3XntQ4rKvNMCSyhClS4moSLHpNQ2v+AnRq
	qz9il6eGf/Z/7OCSIese9Y9+kH/1ja49z7aqRHx1cMc9aaMGpae/ZVpPYJq+ilxYBcQV
	yfxxqlTvQe8/q+i6hXQbAkrTVfyz1SHCvXZM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4PxQ9ypwFLuzoamvhpohGwQ9B+0V26vuEkgTGmcr9do=;
	b=XM/z0dZDwiK4YoGwFzv4480B0bIEY0vw72S2IZMR5Xd38eaMAG4pWw4+bAym2hbr73
	Klq/+fUn2Q7A0rmbpkx7UjJPl5MmmxMqMKycg7RMWp2aRSBvtkgm7xChud8Iic0nSy6V
	Tsw/+eQHtFRLIpW3Zty6ut8q37xGI/vkSuOQptja8z190vWiHYHVOxGvjDZZV5U+jurQ
	KWQw0yK8Z3M2ynp+HwXTnlRfASvjqlAtRNETx+WeQ/OidImbHgo32HvZhI/TW6WAJSxv
	PJYdoH1rm9K9Pyd7Y8UtpUJyjopnDw5+X7BTS852be+G44cKiJCOnl/w8AkCT+MC/mr4
	ecZg==
X-Gm-Message-State: ALQs6tCAye8IEh9PHgN5d+3LysbtBQ/4M6GI/psSx35ns/TyN5DyeWf9
	oUyKdDhHmB148iBHiFKnA6CVjg==
X-Received: by 2002:a17:902:22cc:: with SMTP id
	o12-v6mr29717058plg.38.1525458629408; 
	Fri, 04 May 2018 11:30:29 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	r8-v6sm16987413pgn.2.2018.05.04.11.30.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 May 2018 11:30:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  4 May 2018 11:30:15 -0700
Message-Id: <20180504183021.19318-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180504183021.19318-1-richard.henderson@linaro.org>
References: <20180504183021.19318-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v2 04/10] tcg: Introduce atomic helpers for
 integer min/max
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GHo/GC0UdDLy

Given that this atomic operation will be used by both risc-v
and aarch64, let's not duplicate code across the two targets.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/atomic_template.h | 71 +++++++++++++++++++++++++++++++++++++++++++++
 accel/tcg/tcg-runtime.h     |  8 +++++
 tcg/tcg-op.h                | 34 ++++++++++++++++++++++
 tcg/tcg.h                   |  8 +++++
 tcg/tcg-op.c                |  8 +++++
 5 files changed, 129 insertions(+)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index e022df4571..2489dd3ec1 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -25,18 +25,22 @@
 #elif DATA_SIZE == 8
 # define SUFFIX     q
 # define DATA_TYPE  uint64_t
+# define SDATA_TYPE int64_t
 # define BSWAP      bswap64
 #elif DATA_SIZE == 4
 # define SUFFIX     l
 # define DATA_TYPE  uint32_t
+# define SDATA_TYPE int32_t
 # define BSWAP      bswap32
 #elif DATA_SIZE == 2
 # define SUFFIX     w
 # define DATA_TYPE  uint16_t
+# define SDATA_TYPE int16_t
 # define BSWAP      bswap16
 #elif DATA_SIZE == 1
 # define SUFFIX     b
 # define DATA_TYPE  uint8_t
+# define SDATA_TYPE int8_t
 # define BSWAP
 #else
 # error unsupported data size
@@ -118,6 +122,39 @@ GEN_ATOMIC_HELPER(or_fetch)
 GEN_ATOMIC_HELPER(xor_fetch)
 
 #undef GEN_ATOMIC_HELPER
+
+/* These helpers are, as a whole, full barriers.  Within the helper,
+ * the leading barrier is explicit and the trailing barrier is within
+ * cmpxchg primitive.
+ */
+#define GEN_ATOMIC_HELPER_FN(X, FN, XDATA_TYPE, RET)                \
+ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
+                        ABI_TYPE xval EXTRA_ARGS)                   \
+{                                                                   \
+    ATOMIC_MMU_DECLS;                                               \
+    XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;                          \
+    XDATA_TYPE cmp, old, new, val = xval;                           \
+    smp_mb();                                                       \
+    cmp = atomic_read__nocheck(haddr);                              \
+    do {                                                            \
+        old = cmp; new = FN(old, val);                              \
+        cmp = atomic_cmpxchg__nocheck(haddr, old, new);             \
+    } while (cmp != old);                                           \
+    ATOMIC_MMU_CLEANUP;                                             \
+    return RET;                                                     \
+}
+
+GEN_ATOMIC_HELPER_FN(fetch_smin, MIN, SDATA_TYPE, old)
+GEN_ATOMIC_HELPER_FN(fetch_umin, MIN,  DATA_TYPE, old)
+GEN_ATOMIC_HELPER_FN(fetch_smax, MAX, SDATA_TYPE, old)
+GEN_ATOMIC_HELPER_FN(fetch_umax, MAX,  DATA_TYPE, old)
+
+GEN_ATOMIC_HELPER_FN(smin_fetch, MIN, SDATA_TYPE, new)
+GEN_ATOMIC_HELPER_FN(umin_fetch, MIN,  DATA_TYPE, new)
+GEN_ATOMIC_HELPER_FN(smax_fetch, MAX, SDATA_TYPE, new)
+GEN_ATOMIC_HELPER_FN(umax_fetch, MAX,  DATA_TYPE, new)
+
+#undef GEN_ATOMIC_HELPER_FN
 #endif /* DATA SIZE >= 16 */
 
 #undef END
@@ -233,6 +270,39 @@ ABI_TYPE ATOMIC_NAME(add_fetch)(CPUArchState *env, target_ulong addr,
         ldo = ldn;
     }
 }
+
+/* These helpers are, as a whole, full barriers.  Within the helper,
+ * the leading barrier is explicit and the trailing barrier is within
+ * cmpxchg primitive.
+ */
+#define GEN_ATOMIC_HELPER_FN(X, FN, XDATA_TYPE, RET)                \
+ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
+                        ABI_TYPE xval EXTRA_ARGS)                   \
+{                                                                   \
+    ATOMIC_MMU_DECLS;                                               \
+    XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;                          \
+    XDATA_TYPE ldo, ldn, old, new, val = xval;                      \
+    smp_mb();                                                       \
+    ldn = atomic_read__nocheck(haddr);                              \
+    do {                                                            \
+        ldo = ldn; old = BSWAP(ldo); new = FN(old, val);            \
+        ldn = atomic_cmpxchg__nocheck(haddr, ldo, BSWAP(new));      \
+    } while (ldo != ldn);                                           \
+    ATOMIC_MMU_CLEANUP;                                             \
+    return RET;                                                     \
+}
+
+GEN_ATOMIC_HELPER_FN(fetch_smin, MIN, SDATA_TYPE, old)
+GEN_ATOMIC_HELPER_FN(fetch_umin, MIN,  DATA_TYPE, old)
+GEN_ATOMIC_HELPER_FN(fetch_smax, MAX, SDATA_TYPE, old)
+GEN_ATOMIC_HELPER_FN(fetch_umax, MAX,  DATA_TYPE, old)
+
+GEN_ATOMIC_HELPER_FN(smin_fetch, MIN, SDATA_TYPE, new)
+GEN_ATOMIC_HELPER_FN(umin_fetch, MIN,  DATA_TYPE, new)
+GEN_ATOMIC_HELPER_FN(smax_fetch, MAX, SDATA_TYPE, new)
+GEN_ATOMIC_HELPER_FN(umax_fetch, MAX,  DATA_TYPE, new)
+
+#undef GEN_ATOMIC_HELPER_FN
 #endif /* DATA_SIZE >= 16 */
 
 #undef END
@@ -241,5 +311,6 @@ ABI_TYPE ATOMIC_NAME(add_fetch)(CPUArchState *env, target_ulong addr,
 #undef BSWAP
 #undef ABI_TYPE
 #undef DATA_TYPE
+#undef SDATA_TYPE
 #undef SUFFIX
 #undef DATA_SIZE
diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index 2536959a18..1bd39d136d 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -125,11 +125,19 @@ GEN_ATOMIC_HELPERS(fetch_add)
 GEN_ATOMIC_HELPERS(fetch_and)
 GEN_ATOMIC_HELPERS(fetch_or)
 GEN_ATOMIC_HELPERS(fetch_xor)
+GEN_ATOMIC_HELPERS(fetch_smin)
+GEN_ATOMIC_HELPERS(fetch_umin)
+GEN_ATOMIC_HELPERS(fetch_smax)
+GEN_ATOMIC_HELPERS(fetch_umax)
 
 GEN_ATOMIC_HELPERS(add_fetch)
 GEN_ATOMIC_HELPERS(and_fetch)
 GEN_ATOMIC_HELPERS(or_fetch)
 GEN_ATOMIC_HELPERS(xor_fetch)
+GEN_ATOMIC_HELPERS(smin_fetch)
+GEN_ATOMIC_HELPERS(umin_fetch)
+GEN_ATOMIC_HELPERS(smax_fetch)
+GEN_ATOMIC_HELPERS(umax_fetch)
 
 GEN_ATOMIC_HELPERS(xchg)
 
diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index 0451e2752e..04eb3e9e17 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -898,6 +898,7 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGv_i64,
 
 void tcg_gen_atomic_xchg_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
 void tcg_gen_atomic_xchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
+
 void tcg_gen_atomic_fetch_add_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
 void tcg_gen_atomic_fetch_add_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
 void tcg_gen_atomic_fetch_and_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
@@ -906,6 +907,15 @@ void tcg_gen_atomic_fetch_or_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
 void tcg_gen_atomic_fetch_or_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
 void tcg_gen_atomic_fetch_xor_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
 void tcg_gen_atomic_fetch_xor_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
+void tcg_gen_atomic_fetch_smin_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
+void tcg_gen_atomic_fetch_smin_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
+void tcg_gen_atomic_fetch_umin_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
+void tcg_gen_atomic_fetch_umin_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
+void tcg_gen_atomic_fetch_smax_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
+void tcg_gen_atomic_fetch_smax_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
+void tcg_gen_atomic_fetch_umax_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
+void tcg_gen_atomic_fetch_umax_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
+
 void tcg_gen_atomic_add_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
 void tcg_gen_atomic_add_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
 void tcg_gen_atomic_and_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
@@ -914,6 +924,14 @@ void tcg_gen_atomic_or_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
 void tcg_gen_atomic_or_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
 void tcg_gen_atomic_xor_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
 void tcg_gen_atomic_xor_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
+void tcg_gen_atomic_smin_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
+void tcg_gen_atomic_smin_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
+void tcg_gen_atomic_umin_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
+void tcg_gen_atomic_umin_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
+void tcg_gen_atomic_smax_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
+void tcg_gen_atomic_smax_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
+void tcg_gen_atomic_umax_fetch_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, TCGMemOp);
+void tcg_gen_atomic_umax_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
 
 void tcg_gen_mov_vec(TCGv_vec, TCGv_vec);
 void tcg_gen_dup_i32_vec(unsigned vece, TCGv_vec, TCGv_i32);
@@ -1043,10 +1061,18 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_atomic_fetch_and_tl tcg_gen_atomic_fetch_and_i64
 #define tcg_gen_atomic_fetch_or_tl tcg_gen_atomic_fetch_or_i64
 #define tcg_gen_atomic_fetch_xor_tl tcg_gen_atomic_fetch_xor_i64
+#define tcg_gen_atomic_fetch_smin_tl tcg_gen_atomic_fetch_smin_i64
+#define tcg_gen_atomic_fetch_umin_tl tcg_gen_atomic_fetch_umin_i64
+#define tcg_gen_atomic_fetch_smax_tl tcg_gen_atomic_fetch_smax_i64
+#define tcg_gen_atomic_fetch_umax_tl tcg_gen_atomic_fetch_umax_i64
 #define tcg_gen_atomic_add_fetch_tl tcg_gen_atomic_add_fetch_i64
 #define tcg_gen_atomic_and_fetch_tl tcg_gen_atomic_and_fetch_i64
 #define tcg_gen_atomic_or_fetch_tl tcg_gen_atomic_or_fetch_i64
 #define tcg_gen_atomic_xor_fetch_tl tcg_gen_atomic_xor_fetch_i64
+#define tcg_gen_atomic_smin_fetch_tl tcg_gen_atomic_smin_fetch_i64
+#define tcg_gen_atomic_umin_fetch_tl tcg_gen_atomic_umin_fetch_i64
+#define tcg_gen_atomic_smax_fetch_tl tcg_gen_atomic_smax_fetch_i64
+#define tcg_gen_atomic_umax_fetch_tl tcg_gen_atomic_umax_fetch_i64
 #define tcg_gen_dup_tl_vec  tcg_gen_dup_i64_vec
 #else
 #define tcg_gen_movi_tl tcg_gen_movi_i32
@@ -1145,10 +1171,18 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_atomic_fetch_and_tl tcg_gen_atomic_fetch_and_i32
 #define tcg_gen_atomic_fetch_or_tl tcg_gen_atomic_fetch_or_i32
 #define tcg_gen_atomic_fetch_xor_tl tcg_gen_atomic_fetch_xor_i32
+#define tcg_gen_atomic_fetch_smin_tl tcg_gen_atomic_fetch_smin_i32
+#define tcg_gen_atomic_fetch_umin_tl tcg_gen_atomic_fetch_umin_i32
+#define tcg_gen_atomic_fetch_smax_tl tcg_gen_atomic_fetch_smax_i32
+#define tcg_gen_atomic_fetch_umax_tl tcg_gen_atomic_fetch_umax_i32
 #define tcg_gen_atomic_add_fetch_tl tcg_gen_atomic_add_fetch_i32
 #define tcg_gen_atomic_and_fetch_tl tcg_gen_atomic_and_fetch_i32
 #define tcg_gen_atomic_or_fetch_tl tcg_gen_atomic_or_fetch_i32
 #define tcg_gen_atomic_xor_fetch_tl tcg_gen_atomic_xor_fetch_i32
+#define tcg_gen_atomic_smin_fetch_tl tcg_gen_atomic_smin_fetch_i32
+#define tcg_gen_atomic_umin_fetch_tl tcg_gen_atomic_umin_fetch_i32
+#define tcg_gen_atomic_smax_fetch_tl tcg_gen_atomic_smax_fetch_i32
+#define tcg_gen_atomic_umax_fetch_tl tcg_gen_atomic_umax_fetch_i32
 #define tcg_gen_dup_tl_vec  tcg_gen_dup_i32_vec
 #endif
 
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 75fbad128b..1ca985479b 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -1415,12 +1415,20 @@ GEN_ATOMIC_HELPER_ALL(fetch_sub)
 GEN_ATOMIC_HELPER_ALL(fetch_and)
 GEN_ATOMIC_HELPER_ALL(fetch_or)
 GEN_ATOMIC_HELPER_ALL(fetch_xor)
+GEN_ATOMIC_HELPER_ALL(fetch_smin)
+GEN_ATOMIC_HELPER_ALL(fetch_umin)
+GEN_ATOMIC_HELPER_ALL(fetch_smax)
+GEN_ATOMIC_HELPER_ALL(fetch_umax)
 
 GEN_ATOMIC_HELPER_ALL(add_fetch)
 GEN_ATOMIC_HELPER_ALL(sub_fetch)
 GEN_ATOMIC_HELPER_ALL(and_fetch)
 GEN_ATOMIC_HELPER_ALL(or_fetch)
 GEN_ATOMIC_HELPER_ALL(xor_fetch)
+GEN_ATOMIC_HELPER_ALL(smin_fetch)
+GEN_ATOMIC_HELPER_ALL(umin_fetch)
+GEN_ATOMIC_HELPER_ALL(smax_fetch)
+GEN_ATOMIC_HELPER_ALL(umax_fetch)
 
 GEN_ATOMIC_HELPER_ALL(xchg)
 
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 5b82c3be8d..6a914654f5 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3051,11 +3051,19 @@ GEN_ATOMIC_HELPER(fetch_add, add, 0)
 GEN_ATOMIC_HELPER(fetch_and, and, 0)
 GEN_ATOMIC_HELPER(fetch_or, or, 0)
 GEN_ATOMIC_HELPER(fetch_xor, xor, 0)
+GEN_ATOMIC_HELPER(fetch_smin, smin, 0)
+GEN_ATOMIC_HELPER(fetch_umin, umin, 0)
+GEN_ATOMIC_HELPER(fetch_smax, smax, 0)
+GEN_ATOMIC_HELPER(fetch_umax, umax, 0)
 
 GEN_ATOMIC_HELPER(add_fetch, add, 1)
 GEN_ATOMIC_HELPER(and_fetch, and, 1)
 GEN_ATOMIC_HELPER(or_fetch, or, 1)
 GEN_ATOMIC_HELPER(xor_fetch, xor, 1)
+GEN_ATOMIC_HELPER(smin_fetch, smin, 1)
+GEN_ATOMIC_HELPER(umin_fetch, umin, 1)
+GEN_ATOMIC_HELPER(smax_fetch, smax, 1)
+GEN_ATOMIC_HELPER(umax_fetch, umax, 1)
 
 static void tcg_gen_mov2_i32(TCGv_i32 r, TCGv_i32 a, TCGv_i32 b)
 {
-- 
2.14.3

