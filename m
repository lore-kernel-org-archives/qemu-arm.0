Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1196018wrs;
        Wed, 28 Aug 2019 12:50:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzV0zJgDPPiakAbBz0b9yu07Zio3F3aL7X1gdOob2d62N8vY56AOR4IuH+C45vzu7QWhELu
X-Received: by 2002:a50:ac1a:: with SMTP id v26mr5956178edc.131.1567021852509;
        Wed, 28 Aug 2019 12:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567021852; cv=none;
        d=google.com; s=arc-20160816;
        b=lzDI4hmY1/hoK1OPjqiuf4yAFclBFHbkA7NvVIbg/IlH7eHvfSuDjQ+XVDvEqLMds9
         +xnACRSMQ2ThcxmcO4GvKnee3zYfmgll2GY7mjNUAdK/KN0WmSaMnMpZ9f5wl1ikhXV7
         hz6WHO5iXCOVXKkrJjQ0o64VWrLqoWDDTRWj98LjOXYZXVA4nr1R3akenVdwLzqo6Kc5
         bbu2uorAOdgijtZV+EVndnz4urKh/KXUiogd85d9Ey2Lh02FMw9TZh2VlOmIrhdoBX2a
         ds2TRRB55OhCjSDfqM6/Se8S+rHNU2HUcaDBAWhy7zcwHZngd88tbF33UFOB4CEVUyJy
         05og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ENB9E1VePGgEvpljqAX8EyWULibUwHF2u0OAo21pbuU=;
        b=Zpz+W2jNPV7GYzoV8Av/p/5JfHOg5kQ/c8PKZn3RrLfyeRkRmSqz43gnNYLm66zCaw
         2g37H9vNLY5RtTceq90nDp+MnBZNiRcU6BZQyQVjArLpGWUL7JT9YZzDg3hBU0TDLYyG
         S/wcEw1Z4QIZjoQFATC/F/Fed6gJgFdltTlWPg2VsYirKjNL7CxqQgPWhhRR6RYyV/b+
         BdJqk9N8cxsh6n+pCpdF++w4z/3yCznT/tCul7A4/1P9lAEzxsquG9nFdfPu/DkwpjRf
         WoPQMT4BnVmZBn8XgWGIYDnysfN03CD201WhKoipLR2LcwFlgQo6OKo0t8agf4IsXW4T
         rNlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DO6gaC//";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kt1si6545ejb.189.2019.08.28.12.50.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:50:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DO6gaC//";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33xy-00054i-SC
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38368)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GX-0003q2-RJ
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GU-0000Q7-4P
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:57 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:37137)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33GT-0000Ps-Ux
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:54 -0400
Received: by mail-pl1-x643.google.com with SMTP id bj8so402909plb.4
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 12:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ENB9E1VePGgEvpljqAX8EyWULibUwHF2u0OAo21pbuU=;
 b=DO6gaC//GIpneYcXV+mDdDit5od2Vlkcx53NuOuHBPR4okk6WvHoj5+PfDKc7Ems7d
 Q7eCVQ6l4Bi/TDsbXOchcucDrNf7V5PTS5wO45ulcaM8INtUyclH3XnO+SkT24Sn3bwU
 nZv0ObJWh0G4l8czS5jdNmSxAcwl2Qf4gRdEeTzOFBQJrcsuGCY0IT+Yo4KRm8VS/3Iq
 cVZ0KoWOVYvnJpVWLUbpqzqCbRCLAq0Lc9LlKH0AkyeKJuJ5U0nm+3TBS3dIOASyB6d7
 4xgYcN3OY5JGZclRkWwPphnc9Ma7QUcRkICGWGjDGKqmio5cHlBmpQqxqkc9JzmTB4lJ
 02+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ENB9E1VePGgEvpljqAX8EyWULibUwHF2u0OAo21pbuU=;
 b=Vp68NeJ3F9J3O0v97HWuwqYJZHPDAufWuyLanHowLmjCscuy2GQM9aVVl5zihkmgi1
 Q2/DPl2rIrHN0ZGQefL95Bky6HEq3btK+OQ97pGI17wz66bxZ69ZFrN/j9EVwoU4FThb
 tr5sNE/Wtr4PSK+Kjzw5QUSWvfMod5sGXUkOHIpMnap7R33pItblpzxjwcTqcG25ZO/L
 HEnA97p4V8QGGLoU2HGMJmLkt8/HBqdlEsmvBgRlqiTf4rwnNlQHsjF9WbsZF6y4sdSe
 QLRmJWZYXXTkeU3ZkJTVbOUYWJRT23D88Ch3BBi+rYRtdd95bVf8IRawZxgkm1klFvUX
 xqbg==
X-Gm-Message-State: APjAAAUnlsfWn4jh7URSv3jDiBjgzcJfTDWGnFHL9F9eqw7p/VEkLnH7
 caby6zc1egnHcpfx+OJuWOCQEO8Uf0Q=
X-Received: by 2002:a17:902:24c:: with SMTP id
 70mr5709334plc.331.1567019152568; 
 Wed, 28 Aug 2019 12:05:52 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:28 -0700
Message-Id: <20190828190456.30315-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-devel] [PATCH v3 41/69] target/arm: Convert SG
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MlP3A82PRctT

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 51 ++++++++++++++++++++++++------------------
 target/arm/t32.decode  |  5 ++++-
 2 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 92b3a66e05..52da7f4fa8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8441,6 +8441,34 @@ static bool trans_SMC(DisasContext *s, arg_SMC *a)
     return true;
 }
 
+static bool trans_SG(DisasContext *s, arg_SG *a)
+{
+    if (!arm_dc_feature(s, ARM_FEATURE_M) ||
+        !arm_dc_feature(s, ARM_FEATURE_V8)) {
+        return false;
+    }
+    /*
+     * SG (v8M only)
+     * The bulk of the behaviour for this instruction is implemented
+     * in v7m_handle_execute_nsc(), which deals with the insn when
+     * it is executed by a CPU in non-secure state from memory
+     * which is Secure & NonSecure-Callable.
+     * Here we only need to handle the remaining cases:
+     *  * in NS memory (including the "security extension not
+     *    implemented" case) : NOP
+     *  * in S memory but CPU already secure (clear IT bits)
+     * We know that the attribute for the memory this insn is
+     * in must match the current CPU state, because otherwise
+     * get_phys_addr_pmsav8 would have generated an exception.
+     */
+    if (s->v8m_secure) {
+        /* Like the IT insn, we don't need to generate any code */
+        s->condexec_cond = 0;
+        s->condexec_mask = 0;
+    }
+    return true;
+}
+
 /*
  * Load/store register index
  */
@@ -10530,28 +10558,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
              * - load/store doubleword, load/store exclusive, ldacq/strel,
              *   table branch, TT.
              */
-            if (insn == 0xe97fe97f && arm_dc_feature(s, ARM_FEATURE_M) &&
-                arm_dc_feature(s, ARM_FEATURE_V8)) {
-                /* 0b1110_1001_0111_1111_1110_1001_0111_111
-                 *  - SG (v8M only)
-                 * The bulk of the behaviour for this instruction is implemented
-                 * in v7m_handle_execute_nsc(), which deals with the insn when
-                 * it is executed by a CPU in non-secure state from memory
-                 * which is Secure & NonSecure-Callable.
-                 * Here we only need to handle the remaining cases:
-                 *  * in NS memory (including the "security extension not
-                 *    implemented" case) : NOP
-                 *  * in S memory but CPU already secure (clear IT bits)
-                 * We know that the attribute for the memory this insn is
-                 * in must match the current CPU state, because otherwise
-                 * get_phys_addr_pmsav8 would have generated an exception.
-                 */
-                if (s->v8m_secure) {
-                    /* Like the IT insn, we don't need to generate any code */
-                    s->condexec_cond = 0;
-                    s->condexec_mask = 0;
-                }
-            } else if (insn & 0x01200000) {
+            if (insn & 0x01200000) {
                 /* load/store dual, in decodetree */
                 goto illegal_op;
             } else if ((insn & (1 << 23)) == 0) {
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 24482e0eeb..2b30a767fe 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -487,7 +487,10 @@ STRD_ri_t32      1110 1001 .100 .... .... .... ........    @ldstd_ri8 w=0 p=1
 LDRD_ri_t32      1110 1001 .101 .... .... .... ........    @ldstd_ri8 w=0 p=1
 
 STRD_ri_t32      1110 1001 .110 .... .... .... ........    @ldstd_ri8 w=1 p=1
-LDRD_ri_t32      1110 1001 .111 .... .... .... ........    @ldstd_ri8 w=1 p=1
+{
+  SG             1110 1001 0111 1111 1110 1001 01111111
+  LDRD_ri_t32    1110 1001 .111 .... .... .... ........    @ldstd_ri8 w=1 p=1
+}
 
 # Load/Store Exclusive, Load-Acquire/Store-Release, and Table Branch
 
-- 
2.17.1

