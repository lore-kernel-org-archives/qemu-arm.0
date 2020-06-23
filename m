Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4348714lfm;
        Tue, 23 Jun 2020 12:50:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjKRS7zKiW31ZQp1KqCOkm9qJgU25+krPlE98O4CEPrN3vkcxViCObfsCHWFLjVrDbLbt0
X-Received: by 2002:a5b:cc9:: with SMTP id e9mr36637531ybr.287.1592941814462;
        Tue, 23 Jun 2020 12:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941814; cv=none;
        d=google.com; s=arc-20160816;
        b=atOnYIrUP5K8Xl7TacIC+3DH+1rvW4G6EBDcOkaurMy7euiPcV6LyfthIMbP7Y1aND
         ytFHKqfbQlAEOHt1x4CMhpR1MHObPM+KX8B2ClFdHUphNhBd2B95604F4TB/3P4LUscT
         yjoW0tbKmmxgSoabGrO8Kf0JyuI030EA5pPja2nn/p4eK7RKr4MlkzPDkxkrI7BMW8O2
         s1V8A+HUevycWf4vDVZR9EWIz0Vywxh3mzDG4goPbjpLIwKL2LbvPqgrSDOQzcdRYdeL
         3Nd7Bit1ga4+anzMx7r9QQt3BEBMN8oebEcLFv+Wpl7RXEO4o2EmCDOpnb8LbhhZc5FH
         GtCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fGbW5tvS0+UpJyiRK4dYYTBySIIIaaL7mo1DXmUGYVA=;
        b=B1ZXh/5cU9NPqbLS+OxqYMjFe/paTTVgkMxprISKggPFunoliBRADc/dN/z098sgHl
         6HEWrrUpAgNY7dlAzktPWTl1SwECHyFc+IH8oBlxwF8g+ZSuQjQXp7Zr+r75kn6n7WMA
         p3IbnKuQMKyXuR01HSGIvfxncuwlK0Rf5OJH32cf47hlSsqiEesmCUDqkGPtFA7g3Yuo
         Fv6YBTaORuA/Vjx1FtnBILlZmi620Lgi/RjKl+1c9O3CkMVXdSxfoLn1d+5zC01rtzaB
         xx1i757fVyAEF6trPGHKExHQ/c6Ut9pQn2iQxcHeAJG/2y8GO4/5E3OUiAiVGO51L3U9
         VmNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Diya21sN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si19931532yba.205.2020.06.23.12.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:50:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Diya21sN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnovt-0003TL-MV
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnok0-00050d-4A
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:56 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnoju-0005sf-B0
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:55 -0400
Received: by mail-pj1-x1033.google.com with SMTP id ga6so1914156pjb.1
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fGbW5tvS0+UpJyiRK4dYYTBySIIIaaL7mo1DXmUGYVA=;
 b=Diya21sNIsesRevG9uwRpLclZ9fQdHVdv2a/vmzR56yjptGBCUZDviVbOASBPX7eZs
 h3DLCTyn0mGFxV9Y1GxZlXx9uUuqX5dL5N+XAGbQl80b37blndRFUdNs56u0ZJR+/Qy9
 cmrYIO1lqtufETaOAnY6+9YHZHIXABgNBqFeyvBNLZeyOq/H9JB8GR7Z54ekRL35WFt4
 KYM1T8ksPSH3L0nghssrM6jq0HKvLWusGkpObM4AvQ1BTfeZ7VSex24/RfshS9ydnd4/
 4BLvB2xkuVjZCxj3HU/RjSNkCx+jFBUuIzR2i3HyFcfbUmw57zl8Ees94YafoqGlHyoQ
 tUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fGbW5tvS0+UpJyiRK4dYYTBySIIIaaL7mo1DXmUGYVA=;
 b=AxJjWJP8t7CufklHdn4+H6UgfcslaOqhmRf06MN3O9IOqzNVDoStuO9ofxkeNEQnDB
 wLYf4cxnwKIvqlf9L7rgpweGmltoUjCkwFIUXCt5Hl2vNm07JSYRFhPNWVoQLI+fBGdH
 BV+qw9gz0MFoYHjVfDZiS8E2aFiNB9m9KsjAC6DmPBdqD8D2ioTiKCiGSpZGlhIYmH32
 cSW8GEDKyfCXjHTbcvksSULqtWlU7Hbnu4zy3LN4vh1SexS7hL2mVkdKOMG5Z/d7Q+W2
 qqCDJ/VYwwUreJAgG/xdXpAThG3xTMPJFiE7YBdKRavtZezRJohBXVQe8gSp0BKjy/jn
 YYVQ==
X-Gm-Message-State: AOAM5334X/1gOMwxmP6EsOGpic9VeOuQfh/ZpnCABV4UG9HTaXH94TI+
 +Kp9jKZ2DEIu9jtWaBuKgYSIKA==
X-Received: by 2002:a17:902:ea82:: with SMTP id
 x2mr25962966plb.88.1592941068745; 
 Tue, 23 Jun 2020 12:37:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 35/45] target/arm: Add mte helpers for sve scalar + int
 ff/nf loads
Date: Tue, 23 Jun 2020 12:36:48 -0700
Message-Id: <20200623193658.623279-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: 4+K0O/3kwfKX

Because the elements are sequential, we can eliminate many tests all
at once when the tag hits TCMA, or if the page(s) are not Tagged.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  98 ++++++++++++++++
 target/arm/sve_helper.c    |  99 ++++++++++++++--
 target/arm/translate-sve.c | 232 +++++++++++++++++++++++++------------
 3 files changed, 343 insertions(+), 86 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 1425f33c92..f48752eb42 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1285,6 +1285,55 @@ DEF_HELPER_FLAGS_4(sve_ldff1sds_be_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ldff1dd_le_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ldff1dd_be_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_4(sve_ldff1bb_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1bhu_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1bsu_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1bdu_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1bhs_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1bss_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1bds_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldff1hh_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1hsu_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1hdu_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1hss_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1hds_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldff1hh_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1hsu_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1hdu_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1hss_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1hds_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldff1ss_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1sdu_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1sds_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldff1ss_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1sdu_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1sds_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldff1dd_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldff1dd_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+
 DEF_HELPER_FLAGS_4(sve_ldnf1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ldnf1bhu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ldnf1bsu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
@@ -1316,6 +1365,55 @@ DEF_HELPER_FLAGS_4(sve_ldnf1sds_be_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ldnf1dd_le_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ldnf1dd_be_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_4(sve_ldnf1bb_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1bhu_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1bsu_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1bdu_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1bhs_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1bss_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1bds_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldnf1hh_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1hsu_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1hdu_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1hss_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1hds_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldnf1hh_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1hsu_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1hdu_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1hss_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1hds_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldnf1ss_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1sdu_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1sds_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldnf1ss_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1sdu_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1sds_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ldnf1dd_le_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ldnf1dd_be_r_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, tl, i32)
+
 DEF_HELPER_FLAGS_4(sve_st1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_st2bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_st3bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index ded9cedd18..7aca4ad384 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4794,7 +4794,7 @@ static void record_fault(CPUARMState *env, uintptr_t i, uintptr_t oprsz)
  */
 static inline QEMU_ALWAYS_INLINE
 void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
-                   uint32_t desc, const uintptr_t retaddr,
+                   uint32_t desc, const uintptr_t retaddr, uint32_t mtedesc,
                    const int esz, const int msz, const SVEContFault fault,
                    sve_ldst1_host_fn *host_fn,
                    sve_ldst1_tlb_fn *tlb_fn)
@@ -4826,13 +4826,25 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
     mem_off = info.mem_off_first[0];
     flags = info.page[0].flags;
 
+    /*
+     * Disable MTE checking if the Tagged bit is not set.  Since TBI must
+     * be set within MTEDESC for MTE, !mtedesc => !mte_active.
+     */
+    if (arm_tlb_mte_tagged(&info.page[0].attrs)) {
+        mtedesc = 0;
+    }
+
     if (fault == FAULT_FIRST) {
+        /* Trapping mte check for the first-fault element.  */
+        if (mtedesc) {
+            mte_check1(env, mtedesc, addr + mem_off, retaddr);
+        }
+
         /*
          * Special handling of the first active element,
          * if it crosses a page boundary or is MMIO.
          */
         bool is_split = mem_off == info.mem_off_split;
-        /* TODO: MTE check. */
         if (unlikely(flags != 0) || unlikely(is_split)) {
             /*
              * Use the slow path for cross-page handling.
@@ -4868,7 +4880,9 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
                 /* Watchpoint hit, see below. */
                 goto do_fault;
             }
-            /* TODO: MTE check. */
+            if (mtedesc && !mte_probe1(env, mtedesc, addr + mem_off)) {
+                goto do_fault;
+            }
             /*
              * Use the slow path for cross-page handling.
              * This is RAM, without a watchpoint, and will not trap.
@@ -4916,7 +4930,9 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
                      & BP_MEM_READ)) {
                     goto do_fault;
                 }
-                /* TODO: MTE check. */
+                if (mtedesc && !mte_probe1(env, mtedesc, addr + mem_off)) {
+                    goto do_fault;
+                }
                 host_fn(vd, reg_off, host + mem_off);
             }
             reg_off += 1 << esz;
@@ -4954,44 +4970,103 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
     record_fault(env, reg_off, reg_max);
 }
 
-#define DO_LDFF1_LDNF1_1(PART, ESZ) \
+static inline QEMU_ALWAYS_INLINE
+void sve_ldnfff1_r_mte(CPUARMState *env, void *vg, target_ulong addr,
+                       uint32_t desc, const uintptr_t retaddr,
+                       const int esz, const int msz, const SVEContFault fault,
+                       sve_ldst1_host_fn *host_fn,
+                       sve_ldst1_tlb_fn *tlb_fn)
+{
+    uint32_t mtedesc = desc >> (SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+    int bit55 = extract64(addr, 55, 1);
+
+    /* Remove mtedesc from the normal sve descriptor. */
+    desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+
+    /* Perform gross MTE suppression early. */
+    if (!tbi_check(desc, bit55) ||
+        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+        mtedesc = 0;
+    }
+
+    sve_ldnfff1_r(env, vg, addr, desc, retaddr, mtedesc,
+                  esz, msz, fault, host_fn, tlb_fn);
+}
+
+#define DO_LDFF1_LDNF1_1(PART, ESZ)                                     \
 void HELPER(sve_ldff1##PART##_r)(CPUARMState *env, void *vg,            \
                                  target_ulong addr, uint32_t desc)      \
 {                                                                       \
-    sve_ldnfff1_r(env, vg, addr, desc, GETPC(), ESZ, MO_8, FAULT_FIRST, \
+    sve_ldnfff1_r(env, vg, addr, desc, GETPC(), 0, ESZ, MO_8, FAULT_FIRST, \
                   sve_ld1##PART##_host, sve_ld1##PART##_tlb);           \
 }                                                                       \
 void HELPER(sve_ldnf1##PART##_r)(CPUARMState *env, void *vg,            \
                                  target_ulong addr, uint32_t desc)      \
 {                                                                       \
-    sve_ldnfff1_r(env, vg, addr, desc, GETPC(), ESZ, MO_8, FAULT_NO,    \
+    sve_ldnfff1_r(env, vg, addr, desc, GETPC(), 0, ESZ, MO_8, FAULT_NO, \
+                  sve_ld1##PART##_host, sve_ld1##PART##_tlb);           \
+}                                                                       \
+void HELPER(sve_ldff1##PART##_r_mte)(CPUARMState *env, void *vg,        \
+                                     target_ulong addr, uint32_t desc)  \
+{                                                                       \
+    sve_ldnfff1_r_mte(env, vg, addr, desc, GETPC(), ESZ, MO_8, FAULT_FIRST, \
+                      sve_ld1##PART##_host, sve_ld1##PART##_tlb);       \
+}                                                                       \
+void HELPER(sve_ldnf1##PART##_r_mte)(CPUARMState *env, void *vg,        \
+                                     target_ulong addr, uint32_t desc)  \
+{                                                                       \
+    sve_ldnfff1_r_mte(env, vg, addr, desc, GETPC(), ESZ, MO_8, FAULT_NO, \
                   sve_ld1##PART##_host, sve_ld1##PART##_tlb);           \
 }
 
-#define DO_LDFF1_LDNF1_2(PART, ESZ, MSZ) \
+#define DO_LDFF1_LDNF1_2(PART, ESZ, MSZ)                                \
 void HELPER(sve_ldff1##PART##_le_r)(CPUARMState *env, void *vg,         \
                                     target_ulong addr, uint32_t desc)   \
 {                                                                       \
-    sve_ldnfff1_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, FAULT_FIRST,  \
+    sve_ldnfff1_r(env, vg, addr, desc, GETPC(), 0, ESZ, MSZ, FAULT_FIRST, \
                   sve_ld1##PART##_le_host, sve_ld1##PART##_le_tlb);     \
 }                                                                       \
 void HELPER(sve_ldnf1##PART##_le_r)(CPUARMState *env, void *vg,         \
                                     target_ulong addr, uint32_t desc)   \
 {                                                                       \
-    sve_ldnfff1_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, FAULT_NO,     \
+    sve_ldnfff1_r(env, vg, addr, desc, GETPC(), 0, ESZ, MSZ, FAULT_NO,  \
                   sve_ld1##PART##_le_host, sve_ld1##PART##_le_tlb);     \
 }                                                                       \
 void HELPER(sve_ldff1##PART##_be_r)(CPUARMState *env, void *vg,         \
                                     target_ulong addr, uint32_t desc)   \
 {                                                                       \
-    sve_ldnfff1_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, FAULT_FIRST,  \
+    sve_ldnfff1_r(env, vg, addr, desc, GETPC(), 0, ESZ, MSZ, FAULT_FIRST, \
                   sve_ld1##PART##_be_host, sve_ld1##PART##_be_tlb);     \
 }                                                                       \
 void HELPER(sve_ldnf1##PART##_be_r)(CPUARMState *env, void *vg,         \
                                     target_ulong addr, uint32_t desc)   \
 {                                                                       \
-    sve_ldnfff1_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, FAULT_NO,     \
+    sve_ldnfff1_r(env, vg, addr, desc, GETPC(), 0, ESZ, MSZ, FAULT_NO,  \
                   sve_ld1##PART##_be_host, sve_ld1##PART##_be_tlb);     \
+}                                                                       \
+void HELPER(sve_ldff1##PART##_le_r_mte)(CPUARMState *env, void *vg,     \
+                                        target_ulong addr, uint32_t desc) \
+{                                                                       \
+    sve_ldnfff1_r_mte(env, vg, addr, desc, GETPC(), ESZ, MSZ, FAULT_FIRST, \
+                      sve_ld1##PART##_le_host, sve_ld1##PART##_le_tlb); \
+}                                                                       \
+void HELPER(sve_ldnf1##PART##_le_r_mte)(CPUARMState *env, void *vg,     \
+                                        target_ulong addr, uint32_t desc) \
+{                                                                       \
+    sve_ldnfff1_r_mte(env, vg, addr, desc, GETPC(), ESZ, MSZ, FAULT_NO, \
+                      sve_ld1##PART##_le_host, sve_ld1##PART##_le_tlb); \
+}                                                                       \
+void HELPER(sve_ldff1##PART##_be_r_mte)(CPUARMState *env, void *vg,     \
+                                        target_ulong addr, uint32_t desc) \
+{                                                                       \
+    sve_ldnfff1_r_mte(env, vg, addr, desc, GETPC(), ESZ, MSZ, FAULT_FIRST, \
+                      sve_ld1##PART##_be_host, sve_ld1##PART##_be_tlb); \
+}                                                                       \
+void HELPER(sve_ldnf1##PART##_be_r_mte)(CPUARMState *env, void *vg,     \
+                                        target_ulong addr, uint32_t desc) \
+{                                                                       \
+    sve_ldnfff1_r_mte(env, vg, addr, desc, GETPC(), ESZ, MSZ, FAULT_NO, \
+                      sve_ld1##PART##_be_host, sve_ld1##PART##_be_tlb); \
 }
 
 DO_LDFF1_LDNF1_1(bb,  MO_8)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index daac8589f3..e4fbe48493 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4773,104 +4773,188 @@ static bool trans_LD_zpri(DisasContext *s, arg_rpri_load *a)
 
 static bool trans_LDFF1_zprr(DisasContext *s, arg_rprr_load *a)
 {
-    static gen_helper_gvec_mem * const fns[2][16] = {
-        /* Little-endian */
-        { gen_helper_sve_ldff1bb_r,
-          gen_helper_sve_ldff1bhu_r,
-          gen_helper_sve_ldff1bsu_r,
-          gen_helper_sve_ldff1bdu_r,
+    static gen_helper_gvec_mem * const fns[2][2][16] = {
+        { /* mte inactive, little-endian */
+          { gen_helper_sve_ldff1bb_r,
+            gen_helper_sve_ldff1bhu_r,
+            gen_helper_sve_ldff1bsu_r,
+            gen_helper_sve_ldff1bdu_r,
 
-          gen_helper_sve_ldff1sds_le_r,
-          gen_helper_sve_ldff1hh_le_r,
-          gen_helper_sve_ldff1hsu_le_r,
-          gen_helper_sve_ldff1hdu_le_r,
+            gen_helper_sve_ldff1sds_le_r,
+            gen_helper_sve_ldff1hh_le_r,
+            gen_helper_sve_ldff1hsu_le_r,
+            gen_helper_sve_ldff1hdu_le_r,
 
-          gen_helper_sve_ldff1hds_le_r,
-          gen_helper_sve_ldff1hss_le_r,
-          gen_helper_sve_ldff1ss_le_r,
-          gen_helper_sve_ldff1sdu_le_r,
+            gen_helper_sve_ldff1hds_le_r,
+            gen_helper_sve_ldff1hss_le_r,
+            gen_helper_sve_ldff1ss_le_r,
+            gen_helper_sve_ldff1sdu_le_r,
 
-          gen_helper_sve_ldff1bds_r,
-          gen_helper_sve_ldff1bss_r,
-          gen_helper_sve_ldff1bhs_r,
-          gen_helper_sve_ldff1dd_le_r },
+            gen_helper_sve_ldff1bds_r,
+            gen_helper_sve_ldff1bss_r,
+            gen_helper_sve_ldff1bhs_r,
+            gen_helper_sve_ldff1dd_le_r },
 
-        /* Big-endian */
-        { gen_helper_sve_ldff1bb_r,
-          gen_helper_sve_ldff1bhu_r,
-          gen_helper_sve_ldff1bsu_r,
-          gen_helper_sve_ldff1bdu_r,
+          /* mte inactive, big-endian */
+          { gen_helper_sve_ldff1bb_r,
+            gen_helper_sve_ldff1bhu_r,
+            gen_helper_sve_ldff1bsu_r,
+            gen_helper_sve_ldff1bdu_r,
 
-          gen_helper_sve_ldff1sds_be_r,
-          gen_helper_sve_ldff1hh_be_r,
-          gen_helper_sve_ldff1hsu_be_r,
-          gen_helper_sve_ldff1hdu_be_r,
+            gen_helper_sve_ldff1sds_be_r,
+            gen_helper_sve_ldff1hh_be_r,
+            gen_helper_sve_ldff1hsu_be_r,
+            gen_helper_sve_ldff1hdu_be_r,
 
-          gen_helper_sve_ldff1hds_be_r,
-          gen_helper_sve_ldff1hss_be_r,
-          gen_helper_sve_ldff1ss_be_r,
-          gen_helper_sve_ldff1sdu_be_r,
+            gen_helper_sve_ldff1hds_be_r,
+            gen_helper_sve_ldff1hss_be_r,
+            gen_helper_sve_ldff1ss_be_r,
+            gen_helper_sve_ldff1sdu_be_r,
 
-          gen_helper_sve_ldff1bds_r,
-          gen_helper_sve_ldff1bss_r,
-          gen_helper_sve_ldff1bhs_r,
-          gen_helper_sve_ldff1dd_be_r },
+            gen_helper_sve_ldff1bds_r,
+            gen_helper_sve_ldff1bss_r,
+            gen_helper_sve_ldff1bhs_r,
+            gen_helper_sve_ldff1dd_be_r } },
+
+        { /* mte active, little-endian */
+          { gen_helper_sve_ldff1bb_r_mte,
+            gen_helper_sve_ldff1bhu_r_mte,
+            gen_helper_sve_ldff1bsu_r_mte,
+            gen_helper_sve_ldff1bdu_r_mte,
+
+            gen_helper_sve_ldff1sds_le_r_mte,
+            gen_helper_sve_ldff1hh_le_r_mte,
+            gen_helper_sve_ldff1hsu_le_r_mte,
+            gen_helper_sve_ldff1hdu_le_r_mte,
+
+            gen_helper_sve_ldff1hds_le_r_mte,
+            gen_helper_sve_ldff1hss_le_r_mte,
+            gen_helper_sve_ldff1ss_le_r_mte,
+            gen_helper_sve_ldff1sdu_le_r_mte,
+
+            gen_helper_sve_ldff1bds_r_mte,
+            gen_helper_sve_ldff1bss_r_mte,
+            gen_helper_sve_ldff1bhs_r_mte,
+            gen_helper_sve_ldff1dd_le_r_mte },
+
+          /* mte active, big-endian */
+          { gen_helper_sve_ldff1bb_r_mte,
+            gen_helper_sve_ldff1bhu_r_mte,
+            gen_helper_sve_ldff1bsu_r_mte,
+            gen_helper_sve_ldff1bdu_r_mte,
+
+            gen_helper_sve_ldff1sds_be_r_mte,
+            gen_helper_sve_ldff1hh_be_r_mte,
+            gen_helper_sve_ldff1hsu_be_r_mte,
+            gen_helper_sve_ldff1hdu_be_r_mte,
+
+            gen_helper_sve_ldff1hds_be_r_mte,
+            gen_helper_sve_ldff1hss_be_r_mte,
+            gen_helper_sve_ldff1ss_be_r_mte,
+            gen_helper_sve_ldff1sdu_be_r_mte,
+
+            gen_helper_sve_ldff1bds_r_mte,
+            gen_helper_sve_ldff1bss_r_mte,
+            gen_helper_sve_ldff1bhs_r_mte,
+            gen_helper_sve_ldff1dd_be_r_mte } },
     };
 
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
-        do_mem_zpa(s, a->rd, a->pg, addr, a->dtype, 0, false,
-                   fns[s->be_data == MO_BE][a->dtype]);
+        do_mem_zpa(s, a->rd, a->pg, addr, a->dtype, 1, false,
+                   fns[s->mte_active[0]][s->be_data == MO_BE][a->dtype]);
     }
     return true;
 }
 
 static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
 {
-    static gen_helper_gvec_mem * const fns[2][16] = {
-        /* Little-endian */
-        { gen_helper_sve_ldnf1bb_r,
-          gen_helper_sve_ldnf1bhu_r,
-          gen_helper_sve_ldnf1bsu_r,
-          gen_helper_sve_ldnf1bdu_r,
+    static gen_helper_gvec_mem * const fns[2][2][16] = {
+        { /* mte inactive, little-endian */
+          { gen_helper_sve_ldnf1bb_r,
+            gen_helper_sve_ldnf1bhu_r,
+            gen_helper_sve_ldnf1bsu_r,
+            gen_helper_sve_ldnf1bdu_r,
 
-          gen_helper_sve_ldnf1sds_le_r,
-          gen_helper_sve_ldnf1hh_le_r,
-          gen_helper_sve_ldnf1hsu_le_r,
-          gen_helper_sve_ldnf1hdu_le_r,
+            gen_helper_sve_ldnf1sds_le_r,
+            gen_helper_sve_ldnf1hh_le_r,
+            gen_helper_sve_ldnf1hsu_le_r,
+            gen_helper_sve_ldnf1hdu_le_r,
 
-          gen_helper_sve_ldnf1hds_le_r,
-          gen_helper_sve_ldnf1hss_le_r,
-          gen_helper_sve_ldnf1ss_le_r,
-          gen_helper_sve_ldnf1sdu_le_r,
+            gen_helper_sve_ldnf1hds_le_r,
+            gen_helper_sve_ldnf1hss_le_r,
+            gen_helper_sve_ldnf1ss_le_r,
+            gen_helper_sve_ldnf1sdu_le_r,
 
-          gen_helper_sve_ldnf1bds_r,
-          gen_helper_sve_ldnf1bss_r,
-          gen_helper_sve_ldnf1bhs_r,
-          gen_helper_sve_ldnf1dd_le_r },
+            gen_helper_sve_ldnf1bds_r,
+            gen_helper_sve_ldnf1bss_r,
+            gen_helper_sve_ldnf1bhs_r,
+            gen_helper_sve_ldnf1dd_le_r },
 
-        /* Big-endian */
-        { gen_helper_sve_ldnf1bb_r,
-          gen_helper_sve_ldnf1bhu_r,
-          gen_helper_sve_ldnf1bsu_r,
-          gen_helper_sve_ldnf1bdu_r,
+          /* mte inactive, big-endian */
+          { gen_helper_sve_ldnf1bb_r,
+            gen_helper_sve_ldnf1bhu_r,
+            gen_helper_sve_ldnf1bsu_r,
+            gen_helper_sve_ldnf1bdu_r,
 
-          gen_helper_sve_ldnf1sds_be_r,
-          gen_helper_sve_ldnf1hh_be_r,
-          gen_helper_sve_ldnf1hsu_be_r,
-          gen_helper_sve_ldnf1hdu_be_r,
+            gen_helper_sve_ldnf1sds_be_r,
+            gen_helper_sve_ldnf1hh_be_r,
+            gen_helper_sve_ldnf1hsu_be_r,
+            gen_helper_sve_ldnf1hdu_be_r,
 
-          gen_helper_sve_ldnf1hds_be_r,
-          gen_helper_sve_ldnf1hss_be_r,
-          gen_helper_sve_ldnf1ss_be_r,
-          gen_helper_sve_ldnf1sdu_be_r,
+            gen_helper_sve_ldnf1hds_be_r,
+            gen_helper_sve_ldnf1hss_be_r,
+            gen_helper_sve_ldnf1ss_be_r,
+            gen_helper_sve_ldnf1sdu_be_r,
 
-          gen_helper_sve_ldnf1bds_r,
-          gen_helper_sve_ldnf1bss_r,
-          gen_helper_sve_ldnf1bhs_r,
-          gen_helper_sve_ldnf1dd_be_r },
+            gen_helper_sve_ldnf1bds_r,
+            gen_helper_sve_ldnf1bss_r,
+            gen_helper_sve_ldnf1bhs_r,
+            gen_helper_sve_ldnf1dd_be_r } },
+
+        { /* mte inactive, little-endian */
+          { gen_helper_sve_ldnf1bb_r_mte,
+            gen_helper_sve_ldnf1bhu_r_mte,
+            gen_helper_sve_ldnf1bsu_r_mte,
+            gen_helper_sve_ldnf1bdu_r_mte,
+
+            gen_helper_sve_ldnf1sds_le_r_mte,
+            gen_helper_sve_ldnf1hh_le_r_mte,
+            gen_helper_sve_ldnf1hsu_le_r_mte,
+            gen_helper_sve_ldnf1hdu_le_r_mte,
+
+            gen_helper_sve_ldnf1hds_le_r_mte,
+            gen_helper_sve_ldnf1hss_le_r_mte,
+            gen_helper_sve_ldnf1ss_le_r_mte,
+            gen_helper_sve_ldnf1sdu_le_r_mte,
+
+            gen_helper_sve_ldnf1bds_r_mte,
+            gen_helper_sve_ldnf1bss_r_mte,
+            gen_helper_sve_ldnf1bhs_r_mte,
+            gen_helper_sve_ldnf1dd_le_r_mte },
+
+          /* mte inactive, big-endian */
+          { gen_helper_sve_ldnf1bb_r_mte,
+            gen_helper_sve_ldnf1bhu_r_mte,
+            gen_helper_sve_ldnf1bsu_r_mte,
+            gen_helper_sve_ldnf1bdu_r_mte,
+
+            gen_helper_sve_ldnf1sds_be_r_mte,
+            gen_helper_sve_ldnf1hh_be_r_mte,
+            gen_helper_sve_ldnf1hsu_be_r_mte,
+            gen_helper_sve_ldnf1hdu_be_r_mte,
+
+            gen_helper_sve_ldnf1hds_be_r_mte,
+            gen_helper_sve_ldnf1hss_be_r_mte,
+            gen_helper_sve_ldnf1ss_be_r_mte,
+            gen_helper_sve_ldnf1sdu_be_r_mte,
+
+            gen_helper_sve_ldnf1bds_r_mte,
+            gen_helper_sve_ldnf1bss_r_mte,
+            gen_helper_sve_ldnf1bhs_r_mte,
+            gen_helper_sve_ldnf1dd_be_r_mte } },
     };
 
     if (sve_access_check(s)) {
@@ -4880,8 +4964,8 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
         TCGv_i64 addr = new_tmp_a64(s);
 
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), off);
-        do_mem_zpa(s, a->rd, a->pg, addr, a->dtype, 0, false,
-                   fns[s->be_data == MO_BE][a->dtype]);
+        do_mem_zpa(s, a->rd, a->pg, addr, a->dtype, 1, false,
+                   fns[s->mte_active[0]][s->be_data == MO_BE][a->dtype]);
     }
     return true;
 }
-- 
2.25.1

