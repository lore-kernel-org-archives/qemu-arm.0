Received: by 10.223.197.9 with SMTP id q9csp5934013wrf;
        Wed, 4 Oct 2017 11:47:03 -0700 (PDT)
X-Received: by 10.200.22.21 with SMTP id p21mr29141041qtj.104.1507142823558;
        Wed, 04 Oct 2017 11:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507142823; cv=none;
        d=google.com; s=arc-20160816;
        b=z++xnHtML1fwpNmix7LTuWJyskRmk05bh36CTeRyVUQVHF60yXvPJVs5kxS4iPoHpd
         TABVowkpZxOrGFMGtQs5PFr/YYbj+8f6Ll3ow82RHGTV/D8keg1UH9AFd7j5NidP7p0i
         3HbDxYSw7n4HYDQ46Cp8WrLvwppjc2IVLOIq8/XfuNJVZT7/zqMR1bQYMuIUIbVeJRDH
         k5dAbmHGXvcPsfcHGMviVMNAnhMoZlJaRMlvh96nbitbq75uiZwiEtJj7vtLBWffZ6bD
         bxjNkthNXoU563TgK1gh+i0C/eiCHh7YhvL5D2sWVrALgoDfmjbsQUQz4AhHazUr7YKk
         PKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uisqqIVUgFIrHPus0ecknWYXNomHu+IslQvv6H/fmw8=;
        b=gOxN9F4ehjaT9ThnQKddkfBjK8fCCdxmhYNjelJBhli1wjKHWghqZaCSUWqlxQD5TC
         /kRdTVNb9CYExacEZ38BD/vEP7AHXGEznGYSPoIVZbQ0x0QO5JAfDIG1lP64Kl7wtYmY
         ASxxGtzmoYNANm9EFQ5EBzAAlGt7eQlgomX9sSri6TQqfiytdya3+A/gvChDWqbtXRwj
         RfdpDOuWtL6C23NaLKY7YkKSkaJvbfh18v64jdsaykDb7c3rM5nrczEhazFIgaSvTImA
         jObnLNN0V2A8gLfjutTGlB+MStoC4baxnJcYxHGOynr00Oc1sl9bKs86qDGHMjtXLy/0
         iKhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OX11Atcb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u62si4488595qkd.155.2017.10.04.11.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 11:47:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OX11Atcb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzohD-0002g6-2I
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 14:47:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzodu-0008DH-8M
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzodt-0002gA-FX
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:38 -0400
Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a]:52615)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dzodt-0002fu-Ak
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:37 -0400
Received: by mail-qt0-x22a.google.com with SMTP id o52so21050091qtc.9
	for <qemu-arm@nongnu.org>; Wed, 04 Oct 2017 11:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uisqqIVUgFIrHPus0ecknWYXNomHu+IslQvv6H/fmw8=;
	b=OX11AtcbS23GaT9AN45kbl4z/hyqs8j+YXJruF71f6TJl+bOPofh9WhXVWAdq/8/ZV
	XTUw05l9jYfr9iniWwjVkCia6N9N2LSqm3U0S2mLFNNmp84Sqec2RGAg3mJx3eGmO2uR
	aO9nA6eUtDlUAcLLO0jdI1TWuTSwYsCKtYmzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uisqqIVUgFIrHPus0ecknWYXNomHu+IslQvv6H/fmw8=;
	b=Wd+eFHUrahNoCtvgfs4ChhZBDRMpDosX5iG5308q+DHWKsCVfgNZcEKegufKroq+hG
	MFFmBx+eFLEF6hNKAnCPVBCa82VnGn3iFi1kgECRPDi4LrnnUNzihY0Yf7Hm/recjqWu
	jFPR2/y+XOiA8p7V6xLrWRY+29DbliFldLy3pXOtVtFbb42ompUqt/txJWI3/kYfyfwK
	D7RdnVZpAXyO6UiPiFB6yFkk+0C1Hrh/J4a+ej906/glU5gythm3r7pemfJdUwdeJumH
	sDtPWXVLrTICUf9jHVG/H7ukUO6xK0LRWje8tihw/V5GUK5ddvA0Wx4DHS3idVCInLyV
	zCyg==
X-Gm-Message-State: AMCzsaUwVOthDb5O9wTRm68VCS9kmQvEaFrK4EfzcPHHhaU6Xpv4OfTb
	RyqNgBnaNx32uYzDjDG+imXtqheHQxw=
X-Google-Smtp-Source: AOwi7QADJbeOYSktv7pK1O8qrIGm4sWM8iFEqJ8yEZJ3LTXr7Elyik3S5uUhiiT9oO8ZRMYAmPvLiA==
X-Received: by 10.37.189.136 with SMTP id f8mr4683256ybh.437.1507142616678;
	Wed, 04 Oct 2017 11:43:36 -0700 (PDT)
Received: from bigtime.twiddle.net.com ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	o64sm3020464ywe.12.2017.10.04.11.43.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Oct 2017 11:43:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Oct 2017 14:43:18 -0400
Message-Id: <20171004184325.24157-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171004184325.24157-1-richard.henderson@linaro.org>
References: <20171004184325.24157-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22a
Subject: [Qemu-arm] [PATCH v1 05/12] target/arm: Decode aa64 armv8.1
 scalar/vector x indexed element
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hD3g5qMqcQT5

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 46 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 0ea47a9dff..b02aad8cd7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10749,12 +10749,23 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         is_long = true;
         /* fall through */
     case 0xc: /* SQDMULH */
-    case 0xd: /* SQRDMULH */
         if (u) {
             unallocated_encoding(s);
             return;
         }
         break;
+    case 0xd: /* SQRDMULH / SQRDMLAH */
+        if (u && !arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
+            unallocated_encoding(s);
+            return;
+        }
+        break;
+    case 0xf: /* SQRDMLSH */
+        if (!u || !arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
+            unallocated_encoding(s);
+            return;
+        }
+        break;
     case 0x8: /* MUL */
         if (u || is_scalar) {
             unallocated_encoding(s);
@@ -10941,13 +10952,36 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                                                tcg_op, tcg_idx);
                 }
                 break;
-            case 0xd: /* SQRDMULH */
+            case 0xd: /* SQRDMULH / SQRDMLAH */
+                if (u) { /* SQRDMLAH */
+                    read_vec_element_i32(s, tcg_res, rd, pass,
+                                         is_scalar ? size : MO_32);
+                    if (size == 1) {
+                        gen_helper_neon_qrdmlah_s16(tcg_res, cpu_env,
+                                                    tcg_op, tcg_idx, tcg_res);
+                    } else {
+                        gen_helper_neon_qrdmlah_s32(tcg_res, cpu_env,
+                                                    tcg_op, tcg_idx, tcg_res);
+                    }
+                } else { /* SQRDMULH */
+                    if (size == 1) {
+                        gen_helper_neon_qrdmulh_s16(tcg_res, cpu_env,
+                                                    tcg_op, tcg_idx);
+                    } else {
+                        gen_helper_neon_qrdmulh_s32(tcg_res, cpu_env,
+                                                    tcg_op, tcg_idx);
+                    }
+                }
+                break;
+            case 0xf: /* SQRDMLSH */
+                read_vec_element_i32(s, tcg_res, rd, pass,
+                                     is_scalar ? size : MO_32);
                 if (size == 1) {
-                    gen_helper_neon_qrdmulh_s16(tcg_res, cpu_env,
-                                                tcg_op, tcg_idx);
+                    gen_helper_neon_qrdmlsh_s16(tcg_res, cpu_env,
+                                                tcg_op, tcg_idx, tcg_res);
                 } else {
-                    gen_helper_neon_qrdmulh_s32(tcg_res, cpu_env,
-                                                tcg_op, tcg_idx);
+                    gen_helper_neon_qrdmlsh_s32(tcg_res, cpu_env,
+                                                tcg_op, tcg_idx, tcg_res);
                 }
                 break;
             default:
-- 
2.13.6

