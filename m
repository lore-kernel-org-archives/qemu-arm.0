Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5776413wrq;
        Tue, 26 Jun 2018 21:44:36 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeLz0J9l+GMObxRB0NfuQSmSBMDIqpxkn1Cq8QRrclNT1Za2Su0w3a2hiTRGd5nqftgDzQ0
X-Received: by 2002:ae9:f402:: with SMTP id y2-v6mr3751999qkl.75.1530074676023;
        Tue, 26 Jun 2018 21:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074676; cv=none;
        d=google.com; s=arc-20160816;
        b=XZYQHpKCzcFU/8OFOfLUxmcpUGgeyn0I3oIogbQO6UAc02azHsWFmssjhMBEKz79qc
         9mF9mQgsfELT5MzNLP0FGRojWJ4cc8qJVBRyw/+jSoGTflHv8ubLWC2JE6e/LBTLbY0N
         OqWb19Meil6mmzD7c+Ua6jbYKNs2KfNaUM+lj1cVRZmPnw+GjEzDsgQP0oc1D5WAOMWD
         D6iLlNuUh4v+mLujQfLBJ1KZfFji+FQa076d9MXCoU8Uz0mbQyPNA1QBstJeBP6m3UKu
         eSiHvXDNZdyb4vR538vBvEd+r91ya6MEmAVl6eqg+/sIsIjws8uHsxhLpLs466fawTH2
         uqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=5vv4EiTE9BZ96vf89TrhRWBBhF9m5gudG6jjB7iTbjw=;
        b=snhXO4Cd6y6VmFCoVxtVB3jmYvvtWlKGHcwE0v9Tw0yRhQfsNgjhIjLrBidGZZVtW1
         K0k8RMhcWWacQePx4O6626D+IK4sa6/9Kfdu1R5GR15dBqLu33FILR9xNQtQR0jCQD3X
         2p2KYpxDlGXcztvYwPN6XOHdMP5oucnPW/Ai+C1IGxyQXyjXdV+3BaGcBqQT+4xVH/0/
         Oo8OvhdyiOCXg4k0FSFbulwMd2W03cmI+pGaU7NNRzb4xw3SxewVRsAOzBkKdcRMhQgv
         IEaArIddp08k2dcVJWk2DC7mS0vGPm1q4mCEVxfcyL2sbHforPWG70kBHuOvH4039uJx
         LxnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BpKgVB6h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x23-v6si3131854qtj.169.2018.06.26.21.44.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:44:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BpKgVB6h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56545 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2Jn-0004h2-Cq
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:44:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29T-0004Hw-8p
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29Q-0000Y4-CR
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:55 -0400
Received: from mail-pg0-x232.google.com ([2607:f8b0:400e:c05::232]:42180)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29Q-0000WK-1V
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:52 -0400
Received: by mail-pg0-x232.google.com with SMTP id c10-v6so361518pgu.9
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5vv4EiTE9BZ96vf89TrhRWBBhF9m5gudG6jjB7iTbjw=;
	b=BpKgVB6hmk40q4nqbaaKwzHxRko6wqTAYkRyhB5/LDOaBu12phWb9rYnY3J563gch2
	rDxnmyZcmFGJex+A5q+ycl8WFJlWO6vohQCYSstR9RAY1stc9kJ5hWgjQpKFZrZQ4WTc
	3pu0x4hiX4KP125Gl0AIvSOqBHJerchK7xk5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5vv4EiTE9BZ96vf89TrhRWBBhF9m5gudG6jjB7iTbjw=;
	b=jGbFSMvaICBclF1JS8SYwcWcvQtBMfH6u/d4I7JGLjNy7Mr7U3/qAzMUcNAG4QzUL5
	hHvOLYPKHCsctPkClLDdhJJrECRF3ktadg8AEOj/IVVn8HNvHH7K4lHhPnzBcZT3zHXL
	ZT19RcltwPmT3J1S2GDwwEwV9OLEN8m7gFbb0tF9wl1gG5j0M8HxxUAp0SZZXcc0ybSg
	ICIgfakVSgfOP2iU+/OgaHopb/ANDJ5Xb2eQ2ApQLyOcUunTsnymTuNfzODlCaL7cf/K
	/c41Mj5P+NSnxm594DffOJvd4uzmbQkPqtumO+uH/WJRomvp0iLJ3Sv9szYQ/oOmcENz
	jg8g==
X-Gm-Message-State: APt69E1pbahUKXb5W+iWL5QYgvS0Cwtnasq+zsnMKP1bWCAE62oWdPFw
	7iKjdFQQrSG1r+qRrlE55KDgyQ==
X-Received: by 2002:a63:5e45:: with SMTP id
	s66-v6mr3712536pgb.151.1530074030801; 
	Tue, 26 Jun 2018 21:33:50 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:07 -0700
Message-Id: <20180627043328.11531-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::232
Subject: [Qemu-arm] [PATCH v6 14/35] target/arm: Implement SVE first-fault
 gather loads
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
X-TUID: Jxz84SKNJFRg

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 67 +++++++++++++++++++++++++++++
 target/arm/sve_helper.c    | 88 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 40 ++++++++++++++++-
 3 files changed, 193 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index aeb62afc34..55e8a908d4 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1026,6 +1026,73 @@ DEF_HELPER_FLAGS_6(sve_ldhds_zd, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_6(sve_ldsds_zd, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_6(sve_ldffbsu_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhsu_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffssu_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffbss_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhss_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldffbsu_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhsu_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffssu_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffbss_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhss_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldffbdu_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhdu_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsdu_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffddu_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffbds_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhds_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsds_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldffbdu_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhdu_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsdu_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffddu_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffbds_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhds_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsds_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldffbdu_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhdu_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsdu_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffddu_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffbds_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhds_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsds_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
 DEF_HELPER_FLAGS_6(sve_stbs_zsu, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 DEF_HELPER_FLAGS_6(sve_sths_zsu, TCG_CALL_NO_WG,
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 24f75a32d3..81fc968087 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3791,6 +3791,94 @@ DO_LD1_ZPZ_D(sve_ldbds_zd, uint64_t, int8_t,   cpu_ldub_data_ra)
 DO_LD1_ZPZ_D(sve_ldhds_zd, uint64_t, int16_t,  cpu_lduw_data_ra)
 DO_LD1_ZPZ_D(sve_ldsds_zd, uint64_t, int32_t,  cpu_ldl_data_ra)
 
+/* First fault loads with a vector index.  */
+
+#ifdef CONFIG_USER_ONLY
+
+#define DO_LDFF1_ZPZ(NAME, TYPEE, TYPEI, TYPEM, FN, H)                  \
+void HELPER(NAME)(CPUARMState *env, void *vd, void *vg, void *vm,       \
+                  target_ulong base, uint32_t desc)                     \
+{                                                                       \
+    intptr_t i, oprsz = simd_oprsz(desc);                               \
+    unsigned scale = simd_data(desc);                                   \
+    uintptr_t ra = GETPC();                                             \
+    bool first = true;                                                  \
+    mmap_lock();                                                        \
+    for (i = 0; i < oprsz; i++) {                                       \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
+        do {                                                            \
+            TYPEM m = 0;                                                \
+            if (pg & 1) {                                               \
+                target_ulong off = *(TYPEI *)(vm + H(i));               \
+                target_ulong addr = base + (off << scale);              \
+                if (!first &&                                           \
+                    page_check_range(addr, sizeof(TYPEM), PAGE_READ)) { \
+                    record_fault(env, i, oprsz);                        \
+                    goto exit;                                          \
+                }                                                       \
+                m = FN(env, addr, ra);                                  \
+                first = false;                                          \
+            }                                                           \
+            *(TYPEE *)(vd + H(i)) = m;                                  \
+            i += sizeof(TYPEE), pg >>= sizeof(TYPEE);                   \
+        } while (i & 15);                                               \
+    }                                                                   \
+ exit:                                                                  \
+    mmap_unlock();                                                      \
+}
+
+#else
+
+#define DO_LDFF1_ZPZ(NAME, TYPEE, TYPEI, TYPEM, FN, H)                  \
+void HELPER(NAME)(CPUARMState *env, void *vd, void *vg, void *vm,       \
+                  target_ulong base, uint32_t desc)                     \
+{                                                                       \
+    g_assert_not_reached();                                             \
+}
+
+#endif
+
+#define DO_LDFF1_ZPZ_S(NAME, TYPEI, TYPEM, FN) \
+    DO_LDFF1_ZPZ(NAME, uint32_t, TYPEI, TYPEM, FN, H1_4)
+#define DO_LDFF1_ZPZ_D(NAME, TYPEI, TYPEM, FN) \
+    DO_LDFF1_ZPZ(NAME, uint64_t, TYPEI, TYPEM, FN, )
+
+DO_LDFF1_ZPZ_S(sve_ldffbsu_zsu, uint32_t, uint8_t,  cpu_ldub_data_ra)
+DO_LDFF1_ZPZ_S(sve_ldffhsu_zsu, uint32_t, uint16_t, cpu_lduw_data_ra)
+DO_LDFF1_ZPZ_S(sve_ldffssu_zsu, uint32_t, uint32_t, cpu_ldl_data_ra)
+DO_LDFF1_ZPZ_S(sve_ldffbss_zsu, uint32_t, int8_t,   cpu_ldub_data_ra)
+DO_LDFF1_ZPZ_S(sve_ldffhss_zsu, uint32_t, int16_t,  cpu_lduw_data_ra)
+
+DO_LDFF1_ZPZ_S(sve_ldffbsu_zss, int32_t, uint8_t,  cpu_ldub_data_ra)
+DO_LDFF1_ZPZ_S(sve_ldffhsu_zss, int32_t, uint16_t, cpu_lduw_data_ra)
+DO_LDFF1_ZPZ_S(sve_ldffssu_zss, int32_t, uint32_t, cpu_ldl_data_ra)
+DO_LDFF1_ZPZ_S(sve_ldffbss_zss, int32_t, int8_t,   cpu_ldub_data_ra)
+DO_LDFF1_ZPZ_S(sve_ldffhss_zss, int32_t, int16_t,  cpu_lduw_data_ra)
+
+DO_LDFF1_ZPZ_D(sve_ldffbdu_zsu, uint32_t, uint8_t,  cpu_ldub_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffhdu_zsu, uint32_t, uint16_t, cpu_lduw_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffsdu_zsu, uint32_t, uint32_t, cpu_ldl_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffddu_zsu, uint32_t, uint64_t, cpu_ldq_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffbds_zsu, uint32_t, int8_t,   cpu_ldub_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffhds_zsu, uint32_t, int16_t,  cpu_lduw_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffsds_zsu, uint32_t, int32_t,  cpu_ldl_data_ra)
+
+DO_LDFF1_ZPZ_D(sve_ldffbdu_zss, int32_t, uint8_t,  cpu_ldub_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffhdu_zss, int32_t, uint16_t, cpu_lduw_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffsdu_zss, int32_t, uint32_t, cpu_ldl_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffddu_zss, int32_t, uint64_t, cpu_ldq_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffbds_zss, int32_t, int8_t,   cpu_ldub_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffhds_zss, int32_t, int16_t,  cpu_lduw_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffsds_zss, int32_t, int32_t,  cpu_ldl_data_ra)
+
+DO_LDFF1_ZPZ_D(sve_ldffbdu_zd, uint64_t, uint8_t,  cpu_ldub_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffhdu_zd, uint64_t, uint16_t, cpu_lduw_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffsdu_zd, uint64_t, uint32_t, cpu_ldl_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffddu_zd, uint64_t, uint64_t, cpu_ldq_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffbds_zd, uint64_t, int8_t,   cpu_ldub_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffhds_zd, uint64_t, int16_t,  cpu_lduw_data_ra)
+DO_LDFF1_ZPZ_D(sve_ldffsds_zd, uint64_t, int32_t,  cpu_ldl_data_ra)
+
 /* Stores with a vector index.  */
 
 #define DO_ST1_ZPZ_S(NAME, TYPEI, FN)                                   \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 33ffb217d0..ea4407b746 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4269,7 +4269,19 @@ static gen_helper_gvec_mem_scatter * const gather_load_fn32[2][2][2][3] = {
         { gen_helper_sve_ldbsu_zss,
           gen_helper_sve_ldhsu_zss,
           gen_helper_sve_ldssu_zss, } } },
-    /* TODO fill in first-fault handlers */
+
+    { { { gen_helper_sve_ldffbss_zsu,
+          gen_helper_sve_ldffhss_zsu,
+          NULL, },
+        { gen_helper_sve_ldffbsu_zsu,
+          gen_helper_sve_ldffhsu_zsu,
+          gen_helper_sve_ldffssu_zsu, } },
+      { { gen_helper_sve_ldffbss_zss,
+          gen_helper_sve_ldffhss_zss,
+          NULL, },
+        { gen_helper_sve_ldffbsu_zss,
+          gen_helper_sve_ldffhsu_zss,
+          gen_helper_sve_ldffssu_zss, } } }
 };
 
 /* Note that we overload xs=2 to indicate 64-bit offset.  */
@@ -4298,7 +4310,31 @@ static gen_helper_gvec_mem_scatter * const gather_load_fn64[2][3][2][4] = {
           gen_helper_sve_ldhdu_zd,
           gen_helper_sve_ldsdu_zd,
           gen_helper_sve_ldddu_zd, } } },
-    /* TODO fill in first-fault handlers */
+
+    { { { gen_helper_sve_ldffbds_zsu,
+          gen_helper_sve_ldffhds_zsu,
+          gen_helper_sve_ldffsds_zsu,
+          NULL, },
+        { gen_helper_sve_ldffbdu_zsu,
+          gen_helper_sve_ldffhdu_zsu,
+          gen_helper_sve_ldffsdu_zsu,
+          gen_helper_sve_ldffddu_zsu, } },
+      { { gen_helper_sve_ldffbds_zss,
+          gen_helper_sve_ldffhds_zss,
+          gen_helper_sve_ldffsds_zss,
+          NULL, },
+        { gen_helper_sve_ldffbdu_zss,
+          gen_helper_sve_ldffhdu_zss,
+          gen_helper_sve_ldffsdu_zss,
+          gen_helper_sve_ldffddu_zss, } },
+      { { gen_helper_sve_ldffbds_zd,
+          gen_helper_sve_ldffhds_zd,
+          gen_helper_sve_ldffsds_zd,
+          NULL, },
+        { gen_helper_sve_ldffbdu_zd,
+          gen_helper_sve_ldffhdu_zd,
+          gen_helper_sve_ldffsdu_zd,
+          gen_helper_sve_ldffddu_zd, } } }
 };
 
 static bool trans_LD1_zprz(DisasContext *s, arg_LD1_zprz *a, uint32_t insn)
-- 
2.17.1

