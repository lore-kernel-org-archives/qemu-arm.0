Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5770128wrq;
        Tue, 26 Jun 2018 21:34:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfkvmQ9SMsO6hfBV3KDG06FAkAho4wrwRi2okfTzwb6ownt81eLFwXkfCh1ue50wT/JY40V
X-Received: by 2002:ac8:610a:: with SMTP id a10-v6mr4159027qtm.139.1530074070820;
        Tue, 26 Jun 2018 21:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074070; cv=none;
        d=google.com; s=arc-20160816;
        b=d3w7C+Upsd4w7mpfhTmpGG776bVJjuq+9FNSgP5hoEGSYe4npkbY45IVLwimQn1YLy
         n2IvejLXH63eBrRhmVCyeM7smeBXX3/FpYfek4BXMWPNK5XK75MClkp/BE4HYyTXpqXn
         u17p8Z532IXQXOaQRpif0j9iZMLoLdzDB4uD315YkGa6xPV4QPD9ZmVanja1MmKIFs19
         tp6SEpPPj27Uc5u0GLWK02tAgbb3wrPP/cm6crP69e75/yaX3cWoo5067H+kW2waOIsc
         l1pNSGx1odwWfPZTOiI7BKbIEI1e6dET1m8lA6ie5WObxbdSnJL7oCNltjbUMRdiKG3m
         ddTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=QYO2UbmsWye4KUl79/KJ4eUpBHEcbH/7GuW7WEWWVaY=;
        b=jDTHk9/jlq0crxqFi5uz510PRS7lavazdoK7uH0CJPNUViNgK/5VwQauqxxChuZEBM
         xhzDLKG5nGB0uAYwYbKnJP8SFyRxXrO607T6Q+XfHTS2lgo7FWMAy/vggvwTOfrLZU0f
         +g3usMi582P6T63SXn4INqgRSXFBvzBE/qpvsAu24HwnPwQl0aCiNHSD7oyJyQwGhAAv
         fgJpm7eOMLsVLNaFl3K3mjWTQkAksz+9CYP2OWjsaSJBUHlDAsI7CBunr6P82iZ3rKbn
         bT3kqeB8MWlNs1lU/ejmuLfp2xLfFS50zhkMdhYZ3oqKEn1XTPbVcZADY5VFk39Z0icl
         Wsig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aBDMJulC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w13-v6si2870803qtn.401.2018.06.26.21.34.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:34:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aBDMJulC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56475 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2A2-0004cS-6p
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:34:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29D-00043N-0p
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY299-0008SP-Fw
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:39 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:41955)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY299-0008RQ-73
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:35 -0400
Received: by mail-pf0-x242.google.com with SMTP id a11-v6so384335pff.8
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QYO2UbmsWye4KUl79/KJ4eUpBHEcbH/7GuW7WEWWVaY=;
	b=aBDMJulCJ/x4umZZSUg/n2XFC/4LozaCfk/iRZK9aJtQYUzzBlsANKXIQgrlBYGSe5
	uD1zjh8DsoxBpQzcckOGs9j2qsKmrT1tRIbMBK66pxYsuwsPYPWswiFypy+/uHu9GhkM
	2x7UAv9chfXWWhwl0PYXWvFlPKgv6pUlJCwTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QYO2UbmsWye4KUl79/KJ4eUpBHEcbH/7GuW7WEWWVaY=;
	b=A4EhNK2oDB8cOEQ+vs4ueR5L1ZUmmOkZdPp6bdC+LdzhdKqEAi1UZsoCV4d1RrEpMs
	jjd4PaPlneOSeRfM16U15jnCOGmRLa33EAptSRYDK5hnbfB6svcNjQkqEXhuON2TvzK9
	ZblyvyOhWXnacrvRCwfZ5zj81dFbUcDdiGJW/Wsr33sBYE/Iv7nJMDwlcmwfiIdEU2fz
	ahQGJUj8KjytV21B62NZ6yO/uGqI7/T6P5NmQzFNICgiBNP4qa/5VtQMIvDb6bsZVDf+
	wOJzdTYVEOU/nwThcQ5wlMWxygKwBJTqlqobO7sNi+ABS8xmw2hgnFCxSeLCW7/TXqQT
	zWUg==
X-Gm-Message-State: APt69E3Wd2f6AQsweQrwjKLe02wQQ0KO8NQQntzmlS19yGfQfJxxYkqd
	PN0ErJK261UhoZG3uS7BoLWYSQ==
X-Received: by 2002:a63:8b44:: with SMTP id
	j65-v6mr3779624pge.248.1530074014178; 
	Tue, 26 Jun 2018 21:33:34 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:32:55 -0700
Message-Id: <20180627043328.11531-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v6 02/35] target/arm: Implement SVE Contiguous
 Load, first-fault and no-fault
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
X-TUID: KjZhkKPDJyN+

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

---
v6:
  * Remove cold attribute from record_fault, add unlikely marker
    to the if that protects its call, which seems to be enough to
    prevent the function being inlined.
  * Fix the set of bits masked by record_fault.
---
 target/arm/helper-sve.h    |  40 ++++++++++
 target/arm/sve_helper.c    | 157 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  69 ++++++++++++++++
 target/arm/sve.decode      |   6 ++
 4 files changed, 272 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index fcc9ba5f50..7338abbbcf 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -754,3 +754,43 @@ DEF_HELPER_FLAGS_4(sve_ld1hds_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 
 DEF_HELPER_FLAGS_4(sve_ld1sdu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld1sds_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldff1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1bhu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1bsu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1bdu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1bhs_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1bss_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1bds_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldff1hh_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1hsu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1hdu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1hss_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1hds_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldff1ss_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1sdu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1sds_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldff1dd_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldnf1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1bhu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1bsu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1bdu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1bhs_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1bss_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1bds_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldnf1hh_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1hsu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1hdu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1hss_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1hds_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldnf1ss_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1sdu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1sds_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldnf1dd_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4e6ad282f9..0d22a57a22 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2963,3 +2963,160 @@ DO_LD4(sve_ld4dd_r, cpu_ldq_data_ra, uint64_t, uint64_t, )
 #undef DO_LD2
 #undef DO_LD3
 #undef DO_LD4
+
+/*
+ * Load contiguous data, first-fault and no-fault.
+ */
+
+#ifdef CONFIG_USER_ONLY
+
+/* Fault on byte I.  All bits in FFR from I are cleared.  The vector
+ * result from I is CONSTRAINED UNPREDICTABLE; we choose the MERGE
+ * option, which leaves subsequent data unchanged.
+ */
+static void record_fault(CPUARMState *env, uintptr_t i, uintptr_t oprsz)
+{
+    uint64_t *ffr = env->vfp.pregs[FFR_PRED_NUM].p;
+
+    if (i & 63) {
+        ffr[i / 64] &= MAKE_64BIT_MASK(0, i & 63);
+        i = ROUND_UP(i, 64);
+    }
+    for (; i < oprsz; i += 64) {
+        ffr[i / 64] = 0;
+    }
+}
+
+/* Hold the mmap lock during the operation so that there is no race
+ * between page_check_range and the load operation.  We expect the
+ * usual case to have no faults at all, so we check the whole range
+ * first and if successful defer to the normal load operation.
+ *
+ * TODO: Change mmap_lock to a rwlock so that multiple readers
+ * can run simultaneously.  This will probably help other uses
+ * within QEMU as well.
+ */
+#define DO_LDFF1(PART, FN, TYPEE, TYPEM, H)                             \
+static void do_sve_ldff1##PART(CPUARMState *env, void *vd, void *vg,    \
+                               target_ulong addr, intptr_t oprsz,       \
+                               bool first, uintptr_t ra)                \
+{                                                                       \
+    intptr_t i = 0;                                                     \
+    do {                                                                \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
+        do {                                                            \
+            TYPEM m = 0;                                                \
+            if (pg & 1) {                                               \
+                if (!first &&                                           \
+                    unlikely(page_check_range(addr, sizeof(TYPEM),      \
+                                              PAGE_READ))) {            \
+                    record_fault(env, i, oprsz);                        \
+                    return;                                             \
+                }                                                       \
+                m = FN(env, addr, ra);                                  \
+                first = false;                                          \
+            }                                                           \
+            *(TYPEE *)(vd + H(i)) = m;                                  \
+            i += sizeof(TYPEE), pg >>= sizeof(TYPEE);                   \
+            addr += sizeof(TYPEM);                                      \
+        } while (i & 15);                                               \
+    } while (i < oprsz);                                                \
+}                                                                       \
+void HELPER(sve_ldff1##PART)(CPUARMState *env, void *vg,                \
+                             target_ulong addr, uint32_t desc)          \
+{                                                                       \
+    intptr_t oprsz = simd_oprsz(desc);                                  \
+    unsigned rd = simd_data(desc);                                      \
+    void *vd = &env->vfp.zregs[rd];                                     \
+    mmap_lock();                                                        \
+    if (likely(page_check_range(addr, oprsz, PAGE_READ) == 0)) {        \
+        do_sve_ld1##PART(env, vd, vg, addr, oprsz, GETPC());            \
+    } else {                                                            \
+        do_sve_ldff1##PART(env, vd, vg, addr, oprsz, true, GETPC());    \
+    }                                                                   \
+    mmap_unlock();                                                      \
+}
+
+/* No-fault loads are like first-fault loads without the
+ * first faulting special case.
+ */
+#define DO_LDNF1(PART)                                                  \
+void HELPER(sve_ldnf1##PART)(CPUARMState *env, void *vg,                \
+                             target_ulong addr, uint32_t desc)          \
+{                                                                       \
+    intptr_t oprsz = simd_oprsz(desc);                                  \
+    unsigned rd = simd_data(desc);                                      \
+    void *vd = &env->vfp.zregs[rd];                                     \
+    mmap_lock();                                                        \
+    if (likely(page_check_range(addr, oprsz, PAGE_READ) == 0)) {        \
+        do_sve_ld1##PART(env, vd, vg, addr, oprsz, GETPC());            \
+    } else {                                                            \
+        do_sve_ldff1##PART(env, vd, vg, addr, oprsz, false, GETPC());   \
+    }                                                                   \
+    mmap_unlock();                                                      \
+}
+
+#else
+
+/* TODO: System mode is not yet supported.
+ * This would probably use tlb_vaddr_to_host.
+ */
+#define DO_LDFF1(PART, FN, TYPEE, TYPEM, H)                     \
+void HELPER(sve_ldff1##PART)(CPUARMState *env, void *vg,        \
+                  target_ulong addr, uint32_t desc)             \
+{                                                               \
+    g_assert_not_reached();                                     \
+}
+
+#define DO_LDNF1(PART)                                          \
+void HELPER(sve_ldnf1##PART)(CPUARMState *env, void *vg,        \
+                  target_ulong addr, uint32_t desc)             \
+{                                                               \
+    g_assert_not_reached();                                     \
+}
+
+#endif
+
+DO_LDFF1(bb_r,  cpu_ldub_data_ra, uint8_t, uint8_t, H1)
+DO_LDFF1(bhu_r, cpu_ldub_data_ra, uint16_t, uint8_t, H1_2)
+DO_LDFF1(bhs_r, cpu_ldsb_data_ra, uint16_t, int8_t, H1_2)
+DO_LDFF1(bsu_r, cpu_ldub_data_ra, uint32_t, uint8_t, H1_4)
+DO_LDFF1(bss_r, cpu_ldsb_data_ra, uint32_t, int8_t, H1_4)
+DO_LDFF1(bdu_r, cpu_ldub_data_ra, uint64_t, uint8_t, )
+DO_LDFF1(bds_r, cpu_ldsb_data_ra, uint64_t, int8_t, )
+
+DO_LDFF1(hh_r,  cpu_lduw_data_ra, uint16_t, uint16_t, H1_2)
+DO_LDFF1(hsu_r, cpu_lduw_data_ra, uint32_t, uint16_t, H1_4)
+DO_LDFF1(hss_r, cpu_ldsw_data_ra, uint32_t, int8_t, H1_4)
+DO_LDFF1(hdu_r, cpu_lduw_data_ra, uint64_t, uint16_t, )
+DO_LDFF1(hds_r, cpu_ldsw_data_ra, uint64_t, int16_t, )
+
+DO_LDFF1(ss_r,  cpu_ldl_data_ra, uint32_t, uint32_t, H1_4)
+DO_LDFF1(sdu_r, cpu_ldl_data_ra, uint64_t, uint32_t, )
+DO_LDFF1(sds_r, cpu_ldl_data_ra, uint64_t, int32_t, )
+
+DO_LDFF1(dd_r,  cpu_ldq_data_ra, uint64_t, uint64_t, )
+
+#undef DO_LDFF1
+
+DO_LDNF1(bb_r)
+DO_LDNF1(bhu_r)
+DO_LDNF1(bhs_r)
+DO_LDNF1(bsu_r)
+DO_LDNF1(bss_r)
+DO_LDNF1(bdu_r)
+DO_LDNF1(bds_r)
+
+DO_LDNF1(hh_r)
+DO_LDNF1(hsu_r)
+DO_LDNF1(hss_r)
+DO_LDNF1(hdu_r)
+DO_LDNF1(hds_r)
+
+DO_LDNF1(ss_r)
+DO_LDNF1(sdu_r)
+DO_LDNF1(sds_r)
+
+DO_LDNF1(dd_r)
+
+#undef DO_LDNF1
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3543daff48..09f77b5405 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3647,3 +3647,72 @@ static bool trans_LD_zpri(DisasContext *s, arg_rpri_load *a, uint32_t insn)
     }
     return true;
 }
+
+static bool trans_LDFF1_zprr(DisasContext *s, arg_rprr_load *a, uint32_t insn)
+{
+    static gen_helper_gvec_mem * const fns[16] = {
+        gen_helper_sve_ldff1bb_r,
+        gen_helper_sve_ldff1bhu_r,
+        gen_helper_sve_ldff1bsu_r,
+        gen_helper_sve_ldff1bdu_r,
+
+        gen_helper_sve_ldff1sds_r,
+        gen_helper_sve_ldff1hh_r,
+        gen_helper_sve_ldff1hsu_r,
+        gen_helper_sve_ldff1hdu_r,
+
+        gen_helper_sve_ldff1hds_r,
+        gen_helper_sve_ldff1hss_r,
+        gen_helper_sve_ldff1ss_r,
+        gen_helper_sve_ldff1sdu_r,
+
+        gen_helper_sve_ldff1bds_r,
+        gen_helper_sve_ldff1bss_r,
+        gen_helper_sve_ldff1bhs_r,
+        gen_helper_sve_ldff1dd_r,
+    };
+
+    if (sve_access_check(s)) {
+        TCGv_i64 addr = new_tmp_a64(s);
+        tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
+        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
+        do_mem_zpa(s, a->rd, a->pg, addr, fns[a->dtype]);
+    }
+    return true;
+}
+
+static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a, uint32_t insn)
+{
+    static gen_helper_gvec_mem * const fns[16] = {
+        gen_helper_sve_ldnf1bb_r,
+        gen_helper_sve_ldnf1bhu_r,
+        gen_helper_sve_ldnf1bsu_r,
+        gen_helper_sve_ldnf1bdu_r,
+
+        gen_helper_sve_ldnf1sds_r,
+        gen_helper_sve_ldnf1hh_r,
+        gen_helper_sve_ldnf1hsu_r,
+        gen_helper_sve_ldnf1hdu_r,
+
+        gen_helper_sve_ldnf1hds_r,
+        gen_helper_sve_ldnf1hss_r,
+        gen_helper_sve_ldnf1ss_r,
+        gen_helper_sve_ldnf1sdu_r,
+
+        gen_helper_sve_ldnf1bds_r,
+        gen_helper_sve_ldnf1bss_r,
+        gen_helper_sve_ldnf1bhs_r,
+        gen_helper_sve_ldnf1dd_r,
+    };
+
+    if (sve_access_check(s)) {
+        int vsz = vec_full_reg_size(s);
+        int elements = vsz >> dtype_esz[a->dtype];
+        int off = (a->imm * elements) << dtype_msz(a->dtype);
+        TCGv_i64 addr = new_tmp_a64(s);
+
+        tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), off);
+        do_mem_zpa(s, a->rd, a->pg, addr, fns[a->dtype]);
+    }
+    return true;
+}
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index cfb12da639..afbed57de1 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -685,9 +685,15 @@ LDR_zri         10000101 10 ...... 010 ... ..... .....          @rd_rn_i9
 # SVE contiguous load (scalar plus scalar)
 LD_zprr         1010010 .... ..... 010 ... ..... .....    @rprr_load_dt nreg=0
 
+# SVE contiguous first-fault load (scalar plus scalar)
+LDFF1_zprr      1010010 .... ..... 011 ... ..... .....    @rprr_load_dt nreg=0
+
 # SVE contiguous load (scalar plus immediate)
 LD_zpri         1010010 .... 0.... 101 ... ..... .....    @rpri_load_dt nreg=0
 
+# SVE contiguous non-fault load (scalar plus immediate)
+LDNF1_zpri      1010010 .... 1.... 101 ... ..... .....    @rpri_load_dt nreg=0
+
 # SVE contiguous non-temporal load (scalar plus scalar)
 # LDNT1B, LDNT1H, LDNT1W, LDNT1D
 # SVE load multiple structures (scalar plus scalar)
-- 
2.17.1

