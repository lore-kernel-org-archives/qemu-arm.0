Received: by 10.28.4.212 with SMTP id 203csp1219562wme;
        Wed, 2 May 2018 15:16:23 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrrT5BEwugH2ZX7IRawh8BPiqd3JW9P13V7/JlC2/HT+0qO2SUvsqV+XmSTtySX1r9sd2lb
X-Received: by 10.55.188.193 with SMTP id m184mr15489472qkf.92.1525299383455;
        Wed, 02 May 2018 15:16:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525299383; cv=none;
        d=google.com; s=arc-20160816;
        b=hOGtF6jl34Bgn+fvbePx7rus6w5pgH49/jtpodS8ApcOxdeLSKu6T/iwaNXEoHVkXS
         /lNJPyk5TbtBlCnzD0doela3atxyM3voVoOFWFJNbHZpBcTkk+Jp02ROIbr0BCux5b9M
         6RKXW6+od49IouKRcPPicjJ99jHoJu1HZhFfAtg8wMupVpaVXU472wN3/rgnFMD9lI/B
         a/+ZY+vcMmpqhSNWuUuvdyEzvuTnaGEz6X5ZUYQmD/sCKtICniKwLZq8du3ujZEHDcBD
         EIi0uF/eR2ewCticadCZIzsRnljYiGzIr3FZ/RGPe76egwQJCWLhSDVLmIjr2B+akpVx
         YOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=/7Is7JNJJAWMsuntBwVi2s5wQjfXgdNNCqqq9DMfcWs=;
        b=HGOJfCogEBkl1wZsr4mL3nyMb8lPJ34R2uNFiIlnC2/p+NhN6qeOt7wIJAM8HY/W1d
         NNWYnzXoK9oRl2j0jOcOsFQq+5FN8L1D0Jq5tcZJtWoqDKWNqfpDrPxJH+lepOBZPqMs
         E81U1qVhEwVaEr9dMQKXIFu3KiNjlefNUIQkVmnTiNZnoCbwEaeE9Pkj0cdbHBozyZUx
         rx/J1PeK2oMZ2YktXmQ/AdU6V2J8214TXG6d4B7rGYNnv9WnLb4RFqCLPuW9mriPiJvJ
         VkQdRiG8Bcb6yMbv1va1i4O1rh+UdAlP2YpebGkJuOMSo1K3QjI6/GWcqG5EW2NDaI3Z
         zeaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dib89hnS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q23si1005648qkh.42.2018.05.02.15.16.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 May 2018 15:16:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dib89hnS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52783 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fE02w-0000dw-V7
	for alex.bennee@linaro.org; Wed, 02 May 2018 18:16:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02Z-0000ar-QI
	for qemu-arm@nongnu.org; Wed, 02 May 2018 18:16:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02Y-0007po-FJ
	for qemu-arm@nongnu.org; Wed, 02 May 2018 18:15:59 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:37749)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fE02Y-0007pJ-8p
	for qemu-arm@nongnu.org; Wed, 02 May 2018 18:15:58 -0400
Received: by mail-pf0-x244.google.com with SMTP id e9so8968777pfi.4
	for <qemu-arm@nongnu.org>; Wed, 02 May 2018 15:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/7Is7JNJJAWMsuntBwVi2s5wQjfXgdNNCqqq9DMfcWs=;
	b=Dib89hnSudeq1lR9lqlhhXVKPx83azCNoCDwFPf98GK0UNgQ4Z4+VHEHoiLeY998kt
	+J8QsjiEzPL9mxKpSYN7RU46lzMn0Nkg453QDOZmLE6p2ktdHzgxJfECBZKzkmxjItpw
	AVu2WPLKgJP9XRyND5hUxRsU9Tr9MBYtnC5/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/7Is7JNJJAWMsuntBwVi2s5wQjfXgdNNCqqq9DMfcWs=;
	b=EB2kKbf+0UAZlGqOLbU25qFooR/yieVGAopNkfV4Dv7QdEGEprpR/T7/kd1MslBkzI
	iaUr02dUOPBNYZNiv+VZGlzV9s8lkQoCxG4vs/5KYGiu1GWJeyMRzF5B5ldhHlFA98Gn
	NLLLxK5F2jVMmX6KzjzXFOVq6Ewf4krujbxhx2JriYg8ba48eTP8o+nWWu8LgFmdYNXx
	eImTIqavNlLv2HcAwucHvk8VHuXLoUiPKnummGgS26zbcMZ+NEYHMZhQ5XjH55K0p1SB
	fvk4YmpZnn0OGgBsUX3ngHYA3xdE0A9G75uLbE2/1WXnARrTtoV/PDVVhlXNg08v7jRp
	GaFQ==
X-Gm-Message-State: ALQs6tDYQiyJQMMetnIusbmV7nbsfklUFiDdwQU/7v2vKsIEjjAActJe
	SevBdPxPB2hK5TyeszmRnRxtWw==
X-Received: by 2002:a65:6117:: with SMTP id
	z23-v6mr17103294pgu.72.1525299357362; 
	Wed, 02 May 2018 15:15:57 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	65sm26170145pft.74.2018.05.02.15.15.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 May 2018 15:15:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  2 May 2018 15:15:40 -0700
Message-Id: <20180502221552.3873-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180502221552.3873-1-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH v2 02/14] target/arm: Implement vector shifted
 FCVT for fp16
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G3tXS1Jy9lfo

While we have some of the scalar paths for FCVT for fp16,
we failed to decode the fp16 version of these instructions.

Cc: qemu-stable@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

---
v2: Use parens with (x << y) >> z.
---
 target/arm/translate-a64.c | 65 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 68ca445691..a64673575a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -7208,19 +7208,28 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
                                          bool is_q, bool is_u,
                                          int immh, int immb, int rn, int rd)
 {
-    bool is_double = extract32(immh, 3, 1);
     int immhb = immh << 3 | immb;
-    int fracbits = (is_double ? 128 : 64) - immhb;
-    int pass;
+    int pass, size, fracbits;
     TCGv_ptr tcg_fpstatus;
     TCGv_i32 tcg_rmode, tcg_shift;
 
-    if (!extract32(immh, 2, 2)) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!is_scalar && !is_q && is_double) {
+    if (immh & 0x8) {
+        size = MO_64;
+        if (!is_scalar && !is_q) {
+            unallocated_encoding(s);
+            return;
+        }
+    } else if (immh & 0x4) {
+        size = MO_32;
+    } else if (immh & 0x2) {
+        size = MO_16;
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+            unallocated_encoding(s);
+            return;
+        }
+    } else {
+        /* Should have split out AdvSIMD modified immediate earlier.  */
+        assert(immh == 1);
         unallocated_encoding(s);
         return;
     }
@@ -7232,11 +7241,12 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
     assert(!(is_scalar && is_q));
 
     tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
-    tcg_fpstatus = get_fpstatus_ptr(false);
+    tcg_fpstatus = get_fpstatus_ptr(size == MO_16);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+    fracbits = (16 << size) - immhb;
     tcg_shift = tcg_const_i32(fracbits);
 
-    if (is_double) {
+    if (size == MO_64) {
         int maxpass = is_scalar ? 1 : 2;
 
         for (pass = 0; pass < maxpass; pass++) {
@@ -7253,20 +7263,37 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
         }
         clear_vec_high(s, is_q, rd);
     } else {
-        int maxpass = is_scalar ? 1 : is_q ? 4 : 2;
+        void (*fn)(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_ptr);
+        int maxpass = is_scalar ? 1 : ((8 << is_q) >> size);
+
+        switch (size) {
+        case MO_16:
+            if (is_u) {
+                fn = gen_helper_vfp_toulh;
+            } else {
+                fn = gen_helper_vfp_toslh;
+            }
+            break;
+        case MO_32:
+            if (is_u) {
+                fn = gen_helper_vfp_touls;
+            } else {
+                fn = gen_helper_vfp_tosls;
+            }
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
         for (pass = 0; pass < maxpass; pass++) {
             TCGv_i32 tcg_op = tcg_temp_new_i32();
 
-            read_vec_element_i32(s, tcg_op, rn, pass, MO_32);
-            if (is_u) {
-                gen_helper_vfp_touls(tcg_op, tcg_op, tcg_shift, tcg_fpstatus);
-            } else {
-                gen_helper_vfp_tosls(tcg_op, tcg_op, tcg_shift, tcg_fpstatus);
-            }
+            read_vec_element_i32(s, tcg_op, rn, pass, size);
+            fn(tcg_op, tcg_op, tcg_shift, tcg_fpstatus);
             if (is_scalar) {
                 write_fp_sreg(s, rd, tcg_op);
             } else {
-                write_vec_element_i32(s, tcg_op, rd, pass, MO_32);
+                write_vec_element_i32(s, tcg_op, rd, pass, size);
             }
             tcg_temp_free_i32(tcg_op);
         }
-- 
2.14.3

