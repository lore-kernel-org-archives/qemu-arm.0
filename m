Received: by 10.223.159.74 with SMTP id f10csp2931086wrg;
        Mon, 18 Dec 2017 09:44:48 -0800 (PST)
X-Google-Smtp-Source: ACJfBouq1U7vHsvXbhMT9XnoDYoW81yf2iuDjcrZZaIbl3vrGT640UK3aW/g4pwIj6SSfIq12YCQ
X-Received: by 10.37.186.140 with SMTP id s12mr462399ybg.111.1513619088294;
        Mon, 18 Dec 2017 09:44:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513619088; cv=none;
        d=google.com; s=arc-20160816;
        b=d61PmSN4GOl4ZjIfxajbukNRGzcbYWsjWFndKDpX/kSrG/fCXE/APcSaMM+2xsJWcb
         YAhZY4vD7YFaPAb2pv79byqS4Ym0eQXNNGTwN8mpp+NGiTf+0EP/C24D89pjo2BQNqlp
         qRdY/Cl7GDRNfVocxnKsOVRlgX0MYL5mnky7HLfnEqz+7sJQv1L+cFMDzsjjhUhhjxjP
         pFUJSDPA3IYHpuZtH6e1vS4Ep2/2daDQ0tIb1F+D1l7jVyMwbFK40JKTWFddLZn2cH+g
         IQ4/MIFzpDYyP7KN+bzHWDHy8R+Yg0mEna8j9bQvAc8Al9al2Dnhprwo4jpYSzuD2fyH
         J5NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ED/sGFM2UmEMA2zMq1t0YSITD+CoSMgfPJUUBeCqEVE=;
        b=oOPXE8tNcgBeGsfBKt2h5lANBM+JXbb+ONDBzwpNLTrr2JzoXOJsESOLiasVgIklaW
         jWpeUYoxQBjgJ4V+9ay5SnUV6FaRMiAYMO5tds13X0zeIfHjAmsNKtRL7bSuQKSXV8G+
         zBc9vKMVuaCwpqH6LCNAOTNtsFa1ok1rGNSMD2szBc6lJApuiTDOPAZCoGENfDVvm2M9
         tf6SEWC7kccWJp1+vePLgmBKeVTeDTscIA+1UuwN8PkiT3I9jYHsrozL08K/uRtHZlO9
         fPIfUlZdTKIh6hkVuCdL6+3YE6zaNzgSJjCTTyPDzu0Y2b+Y0cGYoxPwX8F1E9E6QOSH
         UmJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P6iDsaI9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t16si2536732ybb.705.2017.12.18.09.44.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:44:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P6iDsaI9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59082 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzT5-0006WF-Mp
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:44:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9X-0005te-O3
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:24:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9W-00088X-Q7
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:24:35 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:34458)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQz9W-00087X-K6
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:24:34 -0500
Received: by mail-pl0-x243.google.com with SMTP id d21so5200451pll.1
	for <qemu-devel@nongnu.org>; Mon, 18 Dec 2017 09:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ED/sGFM2UmEMA2zMq1t0YSITD+CoSMgfPJUUBeCqEVE=;
	b=P6iDsaI9/SZlIi/zxUQceTy9dIY0pqvxSFqg7CT3kv6jACc6xuSBpmOApIkVMXGtm5
	nIQt89aRemGEWvpeoj5c/CbcZ+8mxuXZO2sad2Sp6qsnlceNzRrqZVmYaBPFEzk4qBjD
	tSqT0J3iseei/Y/ldLAcqOw747DDphLeJGQhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ED/sGFM2UmEMA2zMq1t0YSITD+CoSMgfPJUUBeCqEVE=;
	b=bTheHpO3pD02Un/8hAQ75PfVf5ZFc+eMJetjm3jQbtrRTY98+4VPrTuXxWYausfGHN
	ti0s/UrBLj/PwuaVZ9wVGJICbye9ByP/gT78AY/lOef6chZWMJcHQM3ZF38Y1v2Wmb7t
	HZQsLSn4GjdYR8hlMLros+pTGFoDuBElpKZ/+FOhvoLW/K1H3waWFfjD0qpKC5xdLe2S
	bkOk2k5UJEjSBxlTSTpvruq42BSojA23+zYDdgvSRWsnVY4Nax4a4w4ukwUTvqPhsru4
	cESjBB7j4BbfisozMI7fws6aCjrXBFXkt3ugjVxDI8R9ewMwiw+YuQHU3S+aBNlDMbK5
	Y/Kg==
X-Gm-Message-State: AKGB3mJutpztKuWdloOVWPYc7eK1mW2sLH7tqlu5L3qyKO+SVVhOTRAS
	zbsj64+BX2fMUtZE1O4z0Ul4LPCJlng=
X-Received: by 10.159.229.10 with SMTP id s10mr430408plq.386.1513617873322;
	Mon, 18 Dec 2017 09:24:33 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63])
	by smtp.gmail.com with ESMTPSA id m10sm9260469pgs.4.2017.12.18.09.24.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:24:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:24:18 -0800
Message-Id: <20171218172425.18200-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218172425.18200-1-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-devel] [PATCH v2 04/11] target/arm: Decode aa64 armv8.1
 scalar/vector x indexed element
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MJ80mJUvMAti

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 46 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 3836e94135..85fc7af491 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11857,12 +11857,23 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
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
@@ -12100,13 +12111,36 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
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
2.14.3

