Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4238300wrg;
        Tue, 11 Jun 2019 04:37:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkOYr2QaT7eP0x3kDz6nhRGPco4XtA3iTa/iPS+8OMs8XN80b+xgNNI1wwEPW/bfTelhz1
X-Received: by 2002:a0c:b4ae:: with SMTP id c46mr5328282qve.230.1560253024562;
        Tue, 11 Jun 2019 04:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560253024; cv=none;
        d=google.com; s=arc-20160816;
        b=DSxh65BD0eLhQPTVq4FCqiaWgKxSGi3KtUEw75P8SHfEGgNs6OWzeS00GJY9cI2Aql
         DVoq+KPQe0s5MdCGf4WoQPrymIK69bL6lg8YQ457kHJ7FIKeSHzAgYDXsTlGl5IOkysv
         dx3zHYBFh4dRdwsY7oHHAt5XCH/eWKZ/Rboo0nXa1dazSmBZn5fuOY9qIJv9VzgYjtRk
         5jWANcuBdvSuwmzqK9cuMkpKGhGl5A++mu+3VUq2gZUy6AvFktDhi2UJXrwIPGRjZfgp
         kJO+qlzY1k7UXv7SGH9XcJt9S6jwLwMpOmJKLfzgNqQRVgPGEu9Q4KZ+gRQS05jYX3Uo
         IOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=8DDr7wU5Mf7FhJNHoQYd6MgxVhRgKHpZJzl/r4VHltc=;
        b=NyNXejH72C5+wVepa8HZFqe0Q0Q147NP4SqfJUzJcx9Mzzn7e5SFZE7+1f65VFuypM
         8eMNBYl2H3L0uCd6PPCs0eGfVbySMWv1xu4QhTC+g4hp+bNwawhW7DrBhp7hIqkX21lY
         wu9X1KRuAPfysQY+xmWHWnSIFgBPTvrnL05RDkjdLdbtKRsEuT4aVmTf5/d+GqpiP+5W
         YNhpo8Pvwv8CqgTo3KRo6rLN33M3osUR7lNgCxeoMimXWsb7Tiz4k+kPqOiKAXBTqnN/
         hU67nJQ5AZHLzBZkAM7g1HypLirUlXm8s7C5LphVyQ1IZuZqpKKbpE+CJw19D0qchLfB
         M1jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sWJ2XzSX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c25si6517580qte.177.2019.06.11.04.37.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:37:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sWJ2XzSX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56526 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haf5M-0002mK-4Y
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39752)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQT-0007kV-VB
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQM-0007u7-6X
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:49 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37460)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQL-0007mP-QD
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:41 -0400
Received: by mail-wm1-x343.google.com with SMTP id 22so2395966wmg.2
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8DDr7wU5Mf7FhJNHoQYd6MgxVhRgKHpZJzl/r4VHltc=;
 b=sWJ2XzSXfgOq+HIiZxOjagrZLTKeBuNbzyT1ZEMWS1B3XcZYRuCWS4DG0t/5Rmcmrf
 Hs1rqcUGn7W8KOxqzpaF7WU5nI+pgqY0VP8FVmEwFYIYN2Aq8CPCbinDVjC5s4qoftRS
 Yw5X2JLClSRNtH8JTIbHoqC7+f1hl1gI3ljq1sByRq/wL0kVheS/AExR6iJp2SbgnWTk
 2MdgGNVqjqDv8sKwNc8TWC7E0ahjclVhDvtdjfaZhQryBDeMpxJWN4i/V8TzrKN9mCrb
 8kv5GcvvEG0D+CIl+LVT4KbryBrGz4wtDNj00Rk96Ubm3Vf+AHBFIAEu4ztgivxxyZGe
 B05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8DDr7wU5Mf7FhJNHoQYd6MgxVhRgKHpZJzl/r4VHltc=;
 b=FRJEiSI3cPm7nn+nFgawekWb6SLXRcSuJY5TaNYhnZ5FB0pvqIZcuLQ7lJ2Ko7dFAO
 DzYUz85kYNsiCNyIrHDJa79tSOOIGZ+vovT7kI5WiiURDLO6ErxkFk3LxwBzqtKkTNmz
 96+D1JAJOLjto5G5Igzk5RU8hQmV2dudq0Qa0twKxMqf62yagHlidNk1RUbzS92ME5sK
 CnpFOk4ZvH6pPCoYg78xWvNfDG+ZG4duQLLOK6lzAYcAZ0ZRwND2sNnl4srD6eXltolP
 /m5Vykrz+ZqfYo6Aaps1eFuDb7BQ14JKmWnd1BEcdvuCCO8ztlhF+nZte66pGeKVCKDm
 hrSg==
X-Gm-Message-State: APjAAAVTNC/Hw9GIX8vgR+fi2t7PldVEgHPHaH1oJovQzwtM0oDupBPY
 YiiUqWd6EHI9PQkPNGY7+WzglgSwh4DwEQ==
X-Received: by 2002:a1c:e009:: with SMTP id x9mr17209422wmg.5.1560250475482;
 Tue, 11 Jun 2019 03:54:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:48 +0100
Message-Id: <20190611105351.9871-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH v2 39/42] target/arm: Convert VJCVT to decodetree
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lEiHWGDUksEg

Convert the VJCVT instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 28 ++++++++++++++++++++++++++++
 target/arm/translate.c         | 12 +-----------
 target/arm/vfp.decode          |  4 ++++
 3 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index cc3f61d9c41..161f0fdd888 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -2426,3 +2426,31 @@ static bool trans_VCVT_int_dp(DisasContext *s, arg_VCVT_int_dp *a)
     tcg_temp_free_ptr(fpst);
     return true;
 }
+
+static bool trans_VJCVT(DisasContext *s, arg_VJCVT *a)
+{
+    TCGv_i32 vd;
+    TCGv_i64 vm;
+
+    if (!dc_isar_feature(aa32_jscvt, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vm & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    vm = tcg_temp_new_i64();
+    vd = tcg_temp_new_i32();
+    neon_load_reg64(vm, a->vm);
+    gen_helper_vjcvt(vd, vm, cpu_env);
+    neon_store_reg32(vd, a->vd);
+    tcg_temp_free_i64(vm);
+    tcg_temp_free_i32(vd);
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1e28308aa6a..99b436ad6f7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3050,7 +3050,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 return 1;
             case 15:
                 switch (rn) {
-                case 0 ... 17:
+                case 0 ... 19:
                     /* Already handled by decodetree */
                     return 1;
                 default:
@@ -3085,13 +3085,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                     rm_is_dp = false;
                     break;
 
-                case 0x13: /* vjcvt */
-                    if (!dp || !dc_isar_feature(aa32_jscvt, s)) {
-                        return 1;
-                    }
-                    rd_is_dp = false;
-                    break;
-
                 default:
                     return 1;
                 }
@@ -3177,9 +3170,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 switch (op) {
                 case 15: /* extension space */
                     switch (rn) {
-                    case 19: /* vjcvt */
-                        gen_helper_vjcvt(cpu_F0s, cpu_F0d, cpu_env);
-                        break;
                     case 20: /* fshto */
                         gen_vfp_shto(dp, 16 - rm, 0);
                         break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 6da9a7913da..1a7c9b533de 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -220,3 +220,7 @@ VCVT_int_sp  ---- 1110 1.11 1000 .... 1010 s:1 1.0 .... \
              vd=%vd_sp vm=%vm_sp
 VCVT_int_dp  ---- 1110 1.11 1000 .... 1011 s:1 1.0 .... \
              vd=%vd_dp vm=%vm_sp
+
+# VJCVT is always dp to sp
+VJCVT        ---- 1110 1.11 1001 .... 1011 11.0 .... \
+             vd=%vd_sp vm=%vm_dp
-- 
2.20.1

