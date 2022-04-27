Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp733924lfu;
        Tue, 26 Apr 2022 22:21:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeCQt2lXgLKbVCYqlnLwrMOs8eqs/pcxDrP83PwzZfg02/R8mymJI/u1cI9ZnK3RKmclOU
X-Received: by 2002:a05:622a:1806:b0:2f3:6941:9402 with SMTP id t6-20020a05622a180600b002f369419402mr8897310qtc.359.1651036894332;
        Tue, 26 Apr 2022 22:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651036894; cv=none;
        d=google.com; s=arc-20160816;
        b=rsPoa/aOQn8v+fmQcrLxYfIAXqhXuT0/9qRxEIsQv4s6zU6SuATMb0tlSuLO+Crwih
         YXNosO9G8hAPo2aA+8dViTHj4NkS/5F0qR0s5hrx9LDIXw3w13BJivzHOW8wNBP8FCsN
         4XuylQV/6JdBiU2mov+EdtANsXATqQx8vcDbuoNl2ubPZJF0HCg+mSxtSiCC1mfU9opQ
         2lpbWuP0AUdYT6fzZmvXmHtMghdllQOWi+IpOaLkwORA2qa+b6THLoqqR6nkzuTWO5h1
         pNIdy7Cy2b2W7e/PhFwAiQUpFPHavKEXzYgyw6GTLMLe2BfdZBwe0j40Mv07f5VOpAJ9
         k6PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=RdymRlKG4QHHxfQDhQPpKrTPK5kxHJQ39dg4hBDxLwQ=;
        b=m9nqj3gRsljzebdkiKvOy+7+775ah1URvx5PpZUnvTni3L7Xlo3LQEk0HI7fBLWIjh
         K0cQejSpoM3BuG9816U88dwAGE1yaSc6FRfiLaxi7eYf7Jwz9RvxY/wizx4/bn3OkfND
         qSPOe4G8YdH/V/hYZQWquMX/tuzQe7qKAbnYHaGTFaCK70Hd/WuysGUeXBl3yUX7LU2q
         AYbva/dsU6+oHSL6f93gvwaVdGIisU2XKrM4DQFuI37wOnUN3hcTRc3iUkG0sCypZ5lz
         WUoSESzhBwNv1o1uTg92DBhDddBH5oOaqhexgY7fOhbjzgG9nOzqz1xfbluBP3A2WE/c
         Jf7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oi40W2Yk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18-20020a05622a009200b002f3650bf452si122883qtw.115.2022.04.26.22.21.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 22:21:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oi40W2Yk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nja7J-0001Cu-8f
	for alex.bennee@linaro.org; Wed, 27 Apr 2022 01:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nja5V-0000R9-Ij
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 01:19:41 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nja5Q-0004EU-Lx
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 01:19:41 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso848445pjj.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 22:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RdymRlKG4QHHxfQDhQPpKrTPK5kxHJQ39dg4hBDxLwQ=;
 b=oi40W2Ykxpe45aR6oVcnfcpAIXzp25uuG3J84LTRlXuFnWlsyAj4Z+AQNXkmV4e62K
 yPlh5USFyPmPfq8/bK6Yv5SzdUVh6z0ktH8ckUXk4zZAjHqsAW7WUfeDFR2iLHRtHC/t
 3FPhjXEbXHlvWmZ6mKV782yDreaJCvzjnLEthfE78uP8NFkgmgRJTd//ZghlcawR3auR
 B/nr+McGcNlKsBmAQLLJPD47nrtOX2OumgrUtZAKa7/N2LsVbuYXB/F7PK/2C6ltLqsb
 tPoSR9j86s3wyoEiuF47SLJky1S9dqoOiMQiC6I3iogwa/rVhc5NIwuDtOYxsW45ka6C
 nDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RdymRlKG4QHHxfQDhQPpKrTPK5kxHJQ39dg4hBDxLwQ=;
 b=vgayj4zeyNDJhH7KTORTTOWFdfUw3y2toZ7Wnosh3NnzSWhgs7aCwO8hBTCO/ULWRE
 2CIachqYY6GRPD8HgOWa8HnCZaNq5iI/OROnvYyTzRas8AquR2WTmGW9Q9y1jteu/v5V
 VrLyleX7v6BT5K/DGmHdPj4duWR0UBKSDM9e/fMYBSjJgL6q7iryo+K0++WD9yg5NP6I
 9VLbGbumabgly/JsN4pzK9dz6heYnmvQODwzDaa2KdcTsbcjmfP62c8w7e3k5ofF+Klo
 mepD/iNZcDCPIa45Acw/z8hQI/n/xm8J98vHYm8uh8XQEZQnsA+ZoYe3V+zhNtvUFuvd
 jBlQ==
X-Gm-Message-State: AOAM531tus/Oor1EUIKFLsNjbIHQEYRPJNZN5zThjJ5Ch1VzBcUBWIFw
 dou+rp2WbWR+KuPWPn+mt9up7Ll3JO95Qg==
X-Received: by 2002:a17:90b:1d03:b0:1d9:d06c:717c with SMTP id
 on3-20020a17090b1d0300b001d9d06c717cmr5334031pjb.218.1651036767206; 
 Tue, 26 Apr 2022 22:19:27 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a056a00114700b004f7be3231d6sm17486935pfm.7.2022.04.26.22.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 22:19:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Use field names for accessing DBGWCRn
Date: Tue, 26 Apr 2022 22:19:26 -0700
Message-Id: <20220427051926.295223-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Chris Howard <cvz185@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BKJXmKt+Wisp

While defining these names, use the correct field width of 5 not 4 for
DBGWCR.MASK.  This typo prevented setting a watchpoint larger than 32k.

Reported-by: Chris Howard <cvz185@web.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    | 12 ++++++++++++
 target/arm/debug_helper.c | 10 +++++-----
 target/arm/helper.c       |  8 ++++----
 target/arm/kvm64.c        | 14 +++++++-------
 4 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 9556e3b29e..255833479d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -81,6 +81,18 @@ FIELD(V7M_EXCRET, RES1, 7, 25) /* including the must-be-1 prefix */
  */
 #define FNC_RETURN_MIN_MAGIC 0xfefffffe
 
+/* Bit definitions for DBGWCRn and DBGWCRn_EL1 */
+FIELD(DBGWCR, E, 0, 1)
+FIELD(DBGWCR, PAC, 1, 2)
+FIELD(DBGWCR, LSC, 3, 2)
+FIELD(DBGWCR, BAS, 5, 8)
+FIELD(DBGWCR, HMC, 13, 1)
+FIELD(DBGWCR, SSC, 14, 2)
+FIELD(DBGWCR, LBN, 16, 4)
+FIELD(DBGWCR, WT, 20, 1)
+FIELD(DBGWCR, MASK, 24, 5)
+FIELD(DBGWCR, SSCE, 29, 1)
+
 /* We use a few fake FSR values for internal purposes in M profile.
  * M profile cores don't have A/R format FSRs, but currently our
  * get_phys_addr() code assumes A/R profile and reports failures via
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 32f3caec23..46893697cc 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -143,9 +143,9 @@ static bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp)
      * Non-Secure to simplify the code slightly compared to the full
      * table in the ARM ARM.
      */
-    pac = extract64(cr, 1, 2);
-    hmc = extract64(cr, 13, 1);
-    ssc = extract64(cr, 14, 2);
+    pac = FIELD_EX64(cr, DBGWCR, PAC);
+    hmc = FIELD_EX64(cr, DBGWCR, HMC);
+    ssc = FIELD_EX64(cr, DBGWCR, SSC);
 
     switch (ssc) {
     case 0:
@@ -184,8 +184,8 @@ static bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp)
         g_assert_not_reached();
     }
 
-    wt = extract64(cr, 20, 1);
-    lbn = extract64(cr, 16, 4);
+    wt = FIELD_EX64(cr, DBGWCR, WT);
+    lbn = FIELD_EX64(cr, DBGWCR, LBN);
 
     if (wt && !linked_bp_matches(cpu, lbn)) {
         return false;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 63397bbac1..5a244c3ed9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6320,12 +6320,12 @@ void hw_watchpoint_update(ARMCPU *cpu, int n)
         env->cpu_watchpoint[n] = NULL;
     }
 
-    if (!extract64(wcr, 0, 1)) {
+    if (!FIELD_EX64(wcr, DBGWCR, E)) {
         /* E bit clear : watchpoint disabled */
         return;
     }
 
-    switch (extract64(wcr, 3, 2)) {
+    switch (FIELD_EX64(wcr, DBGWCR, LSC)) {
     case 0:
         /* LSC 00 is reserved and must behave as if the wp is disabled */
         return;
@@ -6344,7 +6344,7 @@ void hw_watchpoint_update(ARMCPU *cpu, int n)
      * CONSTRAINED UNPREDICTABLE; we opt to ignore BAS in this case,
      * thus generating a watchpoint for every byte in the masked region.
      */
-    mask = extract64(wcr, 24, 4);
+    mask = FIELD_EX64(wcr, DBGWCR, MASK);
     if (mask == 1 || mask == 2) {
         /* Reserved values of MASK; we must act as if the mask value was
          * some non-reserved value, or as if the watchpoint were disabled.
@@ -6361,7 +6361,7 @@ void hw_watchpoint_update(ARMCPU *cpu, int n)
         wvr &= ~(len - 1);
     } else {
         /* Watchpoint covers bytes defined by the byte address select bits */
-        int bas = extract64(wcr, 5, 8);
+        int bas = FIELD_EX64(wcr, DBGWCR, BAS);
         int basstart;
 
         if (extract64(wvr, 2, 1)) {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 17dd2f77d9..b8cfaf5782 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -208,7 +208,7 @@ static int insert_hw_watchpoint(target_ulong addr,
                                 target_ulong len, int type)
 {
     HWWatchpoint wp = {
-        .wcr = 1, /* E=1, enable */
+        .wcr = R_DBGWCR_E_MASK, /* E=1, enable */
         .wvr = addr & (~0x7ULL),
         .details = { .vaddr = addr, .len = len }
     };
@@ -221,19 +221,19 @@ static int insert_hw_watchpoint(target_ulong addr,
      * HMC=0 SSC=0 PAC=3 will hit EL0 or EL1, any security state,
      * valid whether EL3 is implemented or not
      */
-    wp.wcr = deposit32(wp.wcr, 1, 2, 3);
+    wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, PAC, 3);
 
     switch (type) {
     case GDB_WATCHPOINT_READ:
-        wp.wcr = deposit32(wp.wcr, 3, 2, 1);
+        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 1);
         wp.details.flags = BP_MEM_READ;
         break;
     case GDB_WATCHPOINT_WRITE:
-        wp.wcr = deposit32(wp.wcr, 3, 2, 2);
+        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 2);
         wp.details.flags = BP_MEM_WRITE;
         break;
     case GDB_WATCHPOINT_ACCESS:
-        wp.wcr = deposit32(wp.wcr, 3, 2, 3);
+        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 3);
         wp.details.flags = BP_MEM_ACCESS;
         break;
     default:
@@ -252,8 +252,8 @@ static int insert_hw_watchpoint(target_ulong addr,
             int bits = ctz64(len);
 
             wp.wvr &= ~((1 << bits) - 1);
-            wp.wcr = deposit32(wp.wcr, 24, 4, bits);
-            wp.wcr = deposit32(wp.wcr, 5, 8, 0xff);
+            wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, MASK, bits);
+            wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, BAS, 0xff);
         } else {
             return -ENOBUFS;
         }
-- 
2.34.1

