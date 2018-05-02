Received: by 10.28.4.212 with SMTP id 203csp1221577wme;
        Wed, 2 May 2018 15:18:49 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrMsLhOYZ/i2K6llnkHo7H9lSHORa4ZldRDEoFtCL+ak4akn9iK6YV3eS63Oa3mfmgM4mmS
X-Received: by 2002:ac8:290d:: with SMTP id y13-v6mr16887309qty.376.1525299529624;
        Wed, 02 May 2018 15:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525299529; cv=none;
        d=google.com; s=arc-20160816;
        b=GkdLDGv0gpzVxF2F+wppzMXs/ZRTOR5UFEVuJdnckAs92T+fZXL2enY+F7I7ZCW8Mo
         tucguV/zKmTQ8/jZr+TWL4ZGWoc6catKNjinOPP+UDyGM0glxG2E7qDNtoS50ncXqIDW
         de/eLwc/F2ZP3gQR2itSjN7kcvjsVkImC7RCR7ayIlXUOWne8zJrdPmwLcrmEJPWNVYc
         tD0MQQvQubGjMnleH7guSuddyU5bwqDJezp+CVHVgxQFJ/vYUNXFhQofl6sWgKDihm2e
         QB2bPWq8XgT5Eyg+FC34qiaLOa/FToj2Gd/gqgYJg/pCSHtxB7pCFt6FXp+AqBgLKWJu
         uBDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ttF+PGQCCRk+6WGb0b/LmzzNUpVRejL7hhsfT7m+hVs=;
        b=dbukelED6/DhOVifwcsOeY+lDFCQd46BJcD3rFeeblRltTk7onKEH8VNIi8+5APlkO
         ixVVXRWzhYRtbPid1XVWklRWT0GD1hUXND6R6D6tqyDm9bKIj5LV5D93FgEaWUeCflpY
         UKHZbcusHNILn3HLwYqHe+VVYCrWSs6nolyFb0tcIUhMVid2Knb052iJQVB4MgamkrKq
         aRJBzHjVre7RcCqkHLbKfrq0VUKy+GxuCHgcIclPD44ELReScrwnK56Ym4GV/bTiAoSm
         INXJi6tE2Jg0gNPgRzaKALR89iRc2f1hHBShNMgXmg6s7T5kYK/Vpu2OSM4ZxkaqszCT
         q4SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P97L7+WA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b32-v6si4291362qvh.18.2018.05.02.15.18.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 May 2018 15:18:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P97L7+WA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fE05J-00020t-6E
	for alex.bennee@linaro.org; Wed, 02 May 2018 18:18:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02Z-0000ap-DF
	for qemu-devel@nongnu.org; Wed, 02 May 2018 18:16:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02X-0007pA-Gt
	for qemu-devel@nongnu.org; Wed, 02 May 2018 18:15:59 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:43068)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fE02X-0007oK-BS
	for qemu-devel@nongnu.org; Wed, 02 May 2018 18:15:57 -0400
Received: by mail-pf0-x244.google.com with SMTP id b26so199724pfi.10
	for <qemu-devel@nongnu.org>; Wed, 02 May 2018 15:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ttF+PGQCCRk+6WGb0b/LmzzNUpVRejL7hhsfT7m+hVs=;
	b=P97L7+WAfrFaZJHhzeNQe46cRIyFVwkBymc4n1oguuZzDSzh35LSFEsb3ExIO9rOS3
	F4GkDWZUqGEYB//Mm24FfRgO5KozZVN7ioITIwtmNajDMiige4++JGH2kydmOhNpsncr
	G0G01uGBpHI+/o4fAxSDZekAsrj6C4NpSqtOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ttF+PGQCCRk+6WGb0b/LmzzNUpVRejL7hhsfT7m+hVs=;
	b=TN03EQe1AVw2uDEfLu4VapDkJQreW0BddzZEd6TGfVpBWblPscwWPiWFq6AfBfGsbJ
	d4IcNe+C+RZz2fwivVUSPDspZKKaj9yf9nMEm1ImQp8/kRV0ZpasawMyRJi4YSjnXMbR
	LH8DMXDXeVGTMpw27++9QlS/6k/EiQLZVis94KYkzjDtQDULNkxPJnaGxK8Wspvo5ZVE
	2OzMyT2zsCcGnnMuNZ+yE6W42VPH/thvRZx9AJumRyaav79PKbg+BQcys91BMoz1ife8
	6QdUFxaKZe01l8YmuK7KGksLCRGxE/3pWg4v16c74JvGNvwCGa0OEucvrYQ9iB31wNzR
	7aYA==
X-Gm-Message-State: ALQs6tACSFS6mF4xa5gMHeo5TFebcLJMt7W92AR/++81OpAmW4PBl/J5
	zD9CH6EFK4zdvY84ml6MQIaTCYxF6C8=
X-Received: by 2002:a65:6027:: with SMTP id
	p7-v6mr3856905pgu.210.1525299356105; 
	Wed, 02 May 2018 15:15:56 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	65sm26170145pft.74.2018.05.02.15.15.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 May 2018 15:15:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  2 May 2018 15:15:39 -0700
Message-Id: <20180502221552.3873-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180502221552.3873-1-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-devel] [PATCH v2 01/14] target/arm: Implement vector shifted
 SCVF/UCVF for fp16
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r68+rBBulGpv

While we have some of the scalar paths for *CVF for fp16,
we failed to decode the fp16 version of these instructions.

Cc: qemu-stable@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

---
v2: Use parens with (x << y) >> z.
---
 target/arm/translate-a64.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index bff4e13bf6..68ca445691 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -7165,13 +7165,26 @@ static void handle_simd_shift_intfp_conv(DisasContext *s, bool is_scalar,
                                          int immh, int immb, int opcode,
                                          int rn, int rd)
 {
-    bool is_double = extract32(immh, 3, 1);
-    int size = is_double ? MO_64 : MO_32;
-    int elements;
+    int size, elements, fracbits;
     int immhb = immh << 3 | immb;
-    int fracbits = (is_double ? 128 : 64) - immhb;
 
-    if (!extract32(immh, 2, 2)) {
+    if (immh & 8) {
+        size = MO_64;
+        if (!is_scalar && !is_q) {
+            unallocated_encoding(s);
+            return;
+        }
+    } else if (immh & 4) {
+        size = MO_32;
+    } else if (immh & 2) {
+        size = MO_16;
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+            unallocated_encoding(s);
+            return;
+        }
+    } else {
+        /* immh == 0 would be a failure of the decode logic */
+        g_assert(immh == 1);
         unallocated_encoding(s);
         return;
     }
@@ -7179,20 +7192,14 @@ static void handle_simd_shift_intfp_conv(DisasContext *s, bool is_scalar,
     if (is_scalar) {
         elements = 1;
     } else {
-        elements = is_double ? 2 : is_q ? 4 : 2;
-        if (is_double && !is_q) {
-            unallocated_encoding(s);
-            return;
-        }
+        elements = (8 << is_q) >> size;
     }
+    fracbits = (16 << size) - immhb;
 
     if (!fp_access_check(s)) {
         return;
     }
 
-    /* immh == 0 would be a failure of the decode logic */
-    g_assert(immh);
-
     handle_simd_intfp_conv(s, rd, rn, elements, !is_u, fracbits, size);
 }
 
-- 
2.14.3

