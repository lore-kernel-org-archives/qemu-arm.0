Received: by 10.28.71.27 with SMTP id u27csp2082281wma;
        Sat, 17 Feb 2018 10:40:42 -0800 (PST)
X-Google-Smtp-Source: AH8x224YNnlV0esQGKJi1HNZHYMhRLChTqmn4XRXMY9DEzjpPW4pa3tvO3RB1HWeljOVsWyRnB8W
X-Received: by 10.13.255.193 with SMTP id p184mr7212644ywf.360.1518892842375;
        Sat, 17 Feb 2018 10:40:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518892842; cv=none;
        d=google.com; s=arc-20160816;
        b=ARGutw3P4NbfZIUMIP69PebwkR9l00ErLmWK4bzUjlOss40CjSaEzCc2OnDg37hcd6
         xK+bZr6rcGfE/muyhhtP3zOuiQbrvAH3ak2m0Qvx2P9MYJ2HPL0boCeK1JsZTgnYFwRA
         OER8OslHNYDu7WHz1gld5mNeDdLs9/hSgkl8clhUyjVsWYtx3SxHY0ww+eFYr/d+yxp7
         9fMl4vKLP8kyv5Nb0RYkoUZoKGWj5GxlbfBLCep0nxWytFI4a5Ji98AO40Kp2UwRz7SK
         WqWWpXZ4fnxPh2XB5K2M5wTrUQnhTDex6flCdV+LKFdq5sISF/rZgPr5EuczLzGhuEOv
         CyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=yc03Rp6PfTCJLkAYx7Y9aOVkKsWaJPzL0uw4GCiXPIs=;
        b=kgVE32Au5fB1RyHuIKcYKECGzru03WwmNkO17x9rTm2Jzp8gbepcgQEncPbgXOFcwm
         fhtuwT7nrQgbIxhPAlYAf+LXGrGE+c+hkAskQljaSxfTCrRZQZ1oL2xyFdB+0UL/q7Sm
         lTSuky7bGETuzb9LT6jfKRtPc9v1StcYhoDwF1CDa9p3j5ybHUxJd3n5mQERFH3wIaR9
         8YSs/k8Z8UdIwqmCjg7Lpmw2AU/G4hE5yR+qOQYyz2QZPacW76RQWE34FJQPt19GXUtC
         LeNdnwG3FdiAmTNCVAJCBroPYD1q2XkBwcFwkrlcBwY3cZTC4C2VLLF5iosmorWMc4pK
         QHzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sli782BV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y124si3417621ybc.234.2018.02.17.10.40.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:40:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sli782BV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48187 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7Pd-000679-LC
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:40:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79J-0000Mb-8B
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79G-0001aA-3f
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:49 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:45872)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79F-0001Ze-QY
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:46 -0500
Received: by mail-pf0-x241.google.com with SMTP id w83so592175pfi.12
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yc03Rp6PfTCJLkAYx7Y9aOVkKsWaJPzL0uw4GCiXPIs=;
	b=Sli782BVp2lpxlSXYnXso4LDD7TxDzNG6OcjkbhML+ngpCR+p1iDjpM4OzPmdyu5fw
	Qfy+mt9UXcXaA+OvgKMukxG5RvzckQtWuU59nYrrmX/85LJn7dqYgHhtXucz0Ho8Q5fX
	XU+nwW8627udYRWOmUEyOY/tJIndz5efT3XWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yc03Rp6PfTCJLkAYx7Y9aOVkKsWaJPzL0uw4GCiXPIs=;
	b=CTCIFb8S+UWrEQmV8x8WHkTywuuT6nfx+/yO+yKW46ILSex47Lt1YtHqybVnDjir3R
	xLhK/wZ7xt1Nw9sXu4tmfJ7VK7QLhJgeG9HeXEcp5IJJW+pXlVzpewBue1wC2hCd85oi
	rXgBvsTlC9ycE6qHRCr7fF2EuMVhSVrrS2epenWuHiplCUKopQrHzDyDOQy9cmhll05g
	pElcr0HMMv3RCxLy1mFUmCzwO++5hFDRgVVvKzRsiNKwU1GR8AwMtSCPljgLk1MmP5q1
	9J1tSvAstcMkYXM9B9HSa+baDF5blU/UbJugP8f4QzAPkSMof9ky+YeJMM2AeGPPzVsr
	hKuw==
X-Gm-Message-State: APf1xPBYXPCIf/RmQuQnMiu3ONfgsxr4zuk3v8yvtmN0NvS5bF8hF/Ld
	AzGFySvlvW4XuWQKYvjqaF3Yeg==
X-Received: by 10.98.249.66 with SMTP id g2mr9847325pfm.112.1518891824536;
	Sat, 17 Feb 2018 10:23:44 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.23.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:23:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:27 -0800
Message-Id: <20180217182323.25885-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v2 11/67] target/arm: Implement SVE bitwise shift
 by immediate (predicated)
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
X-TUID: ABj7gzCl3z1R

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  25 +++++
 target/arm/sve_helper.c    | 265 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 128 ++++++++++++++++++++++
 target/arm/sve.decode      |  29 ++++-
 4 files changed, 445 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 6b6bbeb272..b3c89579af 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -212,6 +212,31 @@ DEF_HELPER_FLAGS_3(sve_uminv_h, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_uminv_s, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_uminv_d, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve_clr_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_clr_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_clr_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_clr_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_asr_zpzi_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_asr_zpzi_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_asr_zpzi_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_asr_zpzi_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_lsr_zpzi_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_lsr_zpzi_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_lsr_zpzi_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_lsr_zpzi_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_lsl_zpzi_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_lsl_zpzi_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_lsl_zpzi_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_lsl_zpzi_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_asrd_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_asrd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_asrd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_asrd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 18fb27805e..b1a170fd70 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -92,6 +92,150 @@ uint32_t HELPER(sve_predtest)(void *vd, void *vg, uint32_t words)
     return flags;
 }
 
+/* Expand active predicate bits to bytes, for byte elements.
+ *  for (i = 0; i < 256; ++i) {
+ *      unsigned long m = 0;
+ *      for (j = 0; j < 8; j++) {
+ *          if ((i >> j) & 1) {
+ *              m |= 0xfful << (j << 3);
+ *          }
+ *      }
+ *      printf("0x%016lx,\n", m);
+ *  }
+ */
+static inline uint64_t expand_pred_b(uint8_t byte)
+{
+    static const uint64_t word[256] = {
+        0x0000000000000000, 0x00000000000000ff, 0x000000000000ff00,
+        0x000000000000ffff, 0x0000000000ff0000, 0x0000000000ff00ff,
+        0x0000000000ffff00, 0x0000000000ffffff, 0x00000000ff000000,
+        0x00000000ff0000ff, 0x00000000ff00ff00, 0x00000000ff00ffff,
+        0x00000000ffff0000, 0x00000000ffff00ff, 0x00000000ffffff00,
+        0x00000000ffffffff, 0x000000ff00000000, 0x000000ff000000ff,
+        0x000000ff0000ff00, 0x000000ff0000ffff, 0x000000ff00ff0000,
+        0x000000ff00ff00ff, 0x000000ff00ffff00, 0x000000ff00ffffff,
+        0x000000ffff000000, 0x000000ffff0000ff, 0x000000ffff00ff00,
+        0x000000ffff00ffff, 0x000000ffffff0000, 0x000000ffffff00ff,
+        0x000000ffffffff00, 0x000000ffffffffff, 0x0000ff0000000000,
+        0x0000ff00000000ff, 0x0000ff000000ff00, 0x0000ff000000ffff,
+        0x0000ff0000ff0000, 0x0000ff0000ff00ff, 0x0000ff0000ffff00,
+        0x0000ff0000ffffff, 0x0000ff00ff000000, 0x0000ff00ff0000ff,
+        0x0000ff00ff00ff00, 0x0000ff00ff00ffff, 0x0000ff00ffff0000,
+        0x0000ff00ffff00ff, 0x0000ff00ffffff00, 0x0000ff00ffffffff,
+        0x0000ffff00000000, 0x0000ffff000000ff, 0x0000ffff0000ff00,
+        0x0000ffff0000ffff, 0x0000ffff00ff0000, 0x0000ffff00ff00ff,
+        0x0000ffff00ffff00, 0x0000ffff00ffffff, 0x0000ffffff000000,
+        0x0000ffffff0000ff, 0x0000ffffff00ff00, 0x0000ffffff00ffff,
+        0x0000ffffffff0000, 0x0000ffffffff00ff, 0x0000ffffffffff00,
+        0x0000ffffffffffff, 0x00ff000000000000, 0x00ff0000000000ff,
+        0x00ff00000000ff00, 0x00ff00000000ffff, 0x00ff000000ff0000,
+        0x00ff000000ff00ff, 0x00ff000000ffff00, 0x00ff000000ffffff,
+        0x00ff0000ff000000, 0x00ff0000ff0000ff, 0x00ff0000ff00ff00,
+        0x00ff0000ff00ffff, 0x00ff0000ffff0000, 0x00ff0000ffff00ff,
+        0x00ff0000ffffff00, 0x00ff0000ffffffff, 0x00ff00ff00000000,
+        0x00ff00ff000000ff, 0x00ff00ff0000ff00, 0x00ff00ff0000ffff,
+        0x00ff00ff00ff0000, 0x00ff00ff00ff00ff, 0x00ff00ff00ffff00,
+        0x00ff00ff00ffffff, 0x00ff00ffff000000, 0x00ff00ffff0000ff,
+        0x00ff00ffff00ff00, 0x00ff00ffff00ffff, 0x00ff00ffffff0000,
+        0x00ff00ffffff00ff, 0x00ff00ffffffff00, 0x00ff00ffffffffff,
+        0x00ffff0000000000, 0x00ffff00000000ff, 0x00ffff000000ff00,
+        0x00ffff000000ffff, 0x00ffff0000ff0000, 0x00ffff0000ff00ff,
+        0x00ffff0000ffff00, 0x00ffff0000ffffff, 0x00ffff00ff000000,
+        0x00ffff00ff0000ff, 0x00ffff00ff00ff00, 0x00ffff00ff00ffff,
+        0x00ffff00ffff0000, 0x00ffff00ffff00ff, 0x00ffff00ffffff00,
+        0x00ffff00ffffffff, 0x00ffffff00000000, 0x00ffffff000000ff,
+        0x00ffffff0000ff00, 0x00ffffff0000ffff, 0x00ffffff00ff0000,
+        0x00ffffff00ff00ff, 0x00ffffff00ffff00, 0x00ffffff00ffffff,
+        0x00ffffffff000000, 0x00ffffffff0000ff, 0x00ffffffff00ff00,
+        0x00ffffffff00ffff, 0x00ffffffffff0000, 0x00ffffffffff00ff,
+        0x00ffffffffffff00, 0x00ffffffffffffff, 0xff00000000000000,
+        0xff000000000000ff, 0xff0000000000ff00, 0xff0000000000ffff,
+        0xff00000000ff0000, 0xff00000000ff00ff, 0xff00000000ffff00,
+        0xff00000000ffffff, 0xff000000ff000000, 0xff000000ff0000ff,
+        0xff000000ff00ff00, 0xff000000ff00ffff, 0xff000000ffff0000,
+        0xff000000ffff00ff, 0xff000000ffffff00, 0xff000000ffffffff,
+        0xff0000ff00000000, 0xff0000ff000000ff, 0xff0000ff0000ff00,
+        0xff0000ff0000ffff, 0xff0000ff00ff0000, 0xff0000ff00ff00ff,
+        0xff0000ff00ffff00, 0xff0000ff00ffffff, 0xff0000ffff000000,
+        0xff0000ffff0000ff, 0xff0000ffff00ff00, 0xff0000ffff00ffff,
+        0xff0000ffffff0000, 0xff0000ffffff00ff, 0xff0000ffffffff00,
+        0xff0000ffffffffff, 0xff00ff0000000000, 0xff00ff00000000ff,
+        0xff00ff000000ff00, 0xff00ff000000ffff, 0xff00ff0000ff0000,
+        0xff00ff0000ff00ff, 0xff00ff0000ffff00, 0xff00ff0000ffffff,
+        0xff00ff00ff000000, 0xff00ff00ff0000ff, 0xff00ff00ff00ff00,
+        0xff00ff00ff00ffff, 0xff00ff00ffff0000, 0xff00ff00ffff00ff,
+        0xff00ff00ffffff00, 0xff00ff00ffffffff, 0xff00ffff00000000,
+        0xff00ffff000000ff, 0xff00ffff0000ff00, 0xff00ffff0000ffff,
+        0xff00ffff00ff0000, 0xff00ffff00ff00ff, 0xff00ffff00ffff00,
+        0xff00ffff00ffffff, 0xff00ffffff000000, 0xff00ffffff0000ff,
+        0xff00ffffff00ff00, 0xff00ffffff00ffff, 0xff00ffffffff0000,
+        0xff00ffffffff00ff, 0xff00ffffffffff00, 0xff00ffffffffffff,
+        0xffff000000000000, 0xffff0000000000ff, 0xffff00000000ff00,
+        0xffff00000000ffff, 0xffff000000ff0000, 0xffff000000ff00ff,
+        0xffff000000ffff00, 0xffff000000ffffff, 0xffff0000ff000000,
+        0xffff0000ff0000ff, 0xffff0000ff00ff00, 0xffff0000ff00ffff,
+        0xffff0000ffff0000, 0xffff0000ffff00ff, 0xffff0000ffffff00,
+        0xffff0000ffffffff, 0xffff00ff00000000, 0xffff00ff000000ff,
+        0xffff00ff0000ff00, 0xffff00ff0000ffff, 0xffff00ff00ff0000,
+        0xffff00ff00ff00ff, 0xffff00ff00ffff00, 0xffff00ff00ffffff,
+        0xffff00ffff000000, 0xffff00ffff0000ff, 0xffff00ffff00ff00,
+        0xffff00ffff00ffff, 0xffff00ffffff0000, 0xffff00ffffff00ff,
+        0xffff00ffffffff00, 0xffff00ffffffffff, 0xffffff0000000000,
+        0xffffff00000000ff, 0xffffff000000ff00, 0xffffff000000ffff,
+        0xffffff0000ff0000, 0xffffff0000ff00ff, 0xffffff0000ffff00,
+        0xffffff0000ffffff, 0xffffff00ff000000, 0xffffff00ff0000ff,
+        0xffffff00ff00ff00, 0xffffff00ff00ffff, 0xffffff00ffff0000,
+        0xffffff00ffff00ff, 0xffffff00ffffff00, 0xffffff00ffffffff,
+        0xffffffff00000000, 0xffffffff000000ff, 0xffffffff0000ff00,
+        0xffffffff0000ffff, 0xffffffff00ff0000, 0xffffffff00ff00ff,
+        0xffffffff00ffff00, 0xffffffff00ffffff, 0xffffffffff000000,
+        0xffffffffff0000ff, 0xffffffffff00ff00, 0xffffffffff00ffff,
+        0xffffffffffff0000, 0xffffffffffff00ff, 0xffffffffffffff00,
+        0xffffffffffffffff,
+    };
+    return word[byte];
+}
+
+/* Similarly for half-word elements.
+ *  for (i = 0; i < 256; ++i) {
+ *      unsigned long m = 0;
+ *      if (i & 0xaa) {
+ *          continue;
+ *      }
+ *      for (j = 0; j < 8; j += 2) {
+ *          if ((i >> j) & 1) {
+ *              m |= 0xfffful << (j << 3);
+ *          }
+ *      }
+ *      printf("[0x%x] = 0x%016lx,\n", i, m);
+ *  }
+ */
+static inline uint64_t expand_pred_h(uint8_t byte)
+{
+    static const uint64_t word[] = {
+        [0x01] = 0x000000000000ffff, [0x04] = 0x00000000ffff0000,
+        [0x05] = 0x00000000ffffffff, [0x10] = 0x0000ffff00000000,
+        [0x11] = 0x0000ffff0000ffff, [0x14] = 0x0000ffffffff0000,
+        [0x15] = 0x0000ffffffffffff, [0x40] = 0xffff000000000000,
+        [0x41] = 0xffff00000000ffff, [0x44] = 0xffff0000ffff0000,
+        [0x45] = 0xffff0000ffffffff, [0x50] = 0xffffffff00000000,
+        [0x51] = 0xffffffff0000ffff, [0x54] = 0xffffffffffff0000,
+        [0x55] = 0xffffffffffffffff,
+    };
+    return word[byte & 0x55];
+}
+
+/* Similarly for single word elements.  */
+static inline uint64_t expand_pred_s(uint8_t byte)
+{
+    static const uint64_t word[] = {
+        [0x01] = 0x00000000ffffffffull,
+        [0x10] = 0xffffffff00000000ull,
+        [0x11] = 0xffffffffffffffffull,
+    };
+    return word[byte & 0x11];
+}
+
 #define LOGICAL_PPPP(NAME, FUNC) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)  \
 {                                                                         \
@@ -483,3 +627,124 @@ uint32_t HELPER(sve_pnext)(void *vd, void *vg, uint32_t pred_desc)
 
     return flags;
 }
+
+/* Store zero into every active element of Zd.  We will use this for two
+ * and three-operand predicated instructions for which logic dictates a
+ * zero result.  In particular, logical shift by element size, which is
+ * otherwise undefined on the host.
+ *
+ * For element sizes smaller than uint64_t, we use tables to expand
+ * the N bits of the controlling predicate to a byte mask, and clear
+ * those bytes.
+ */
+void HELPER(sve_clr_b)(void *vd, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd;
+    uint8_t *pg = vg;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] &= ~expand_pred_b(pg[H1(i)]);
+    }
+}
+
+void HELPER(sve_clr_h)(void *vd, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd;
+    uint8_t *pg = vg;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] &= ~expand_pred_h(pg[H1(i)]);
+    }
+}
+
+void HELPER(sve_clr_s)(void *vd, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd;
+    uint8_t *pg = vg;
+    for (i = 0; i < opr_sz; i += 1) {
+        d[i] &= ~expand_pred_s(pg[H1(i)]);
+    }
+}
+
+void HELPER(sve_clr_d)(void *vd, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd;
+    uint8_t *pg = vg;
+    for (i = 0; i < opr_sz; i += 1) {
+        if (pg[H1(i)] & 1) {
+            d[i] = 0;
+        }
+    }
+}
+
+/* Three-operand expander, immediate operand, controlled by a predicate.
+ */
+#define DO_ZPZI(NAME, TYPE, H, OP)                              \
+void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)  \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc);                      \
+    TYPE imm = simd_data(desc);                                 \
+    for (i = 0; i < opr_sz; ) {                                 \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));         \
+        do {                                                    \
+            if (pg & 1) {                                       \
+                TYPE nn = *(TYPE *)(vn + H(i));                 \
+                *(TYPE *)(vd + H(i)) = OP(nn, imm);             \
+            }                                                   \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);             \
+        } while (i & 15);                                       \
+    }                                                           \
+}
+
+/* Similarly, specialized for 64-bit operands.  */
+#define DO_ZPZI_D(NAME, TYPE, OP)                               \
+void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)  \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;                  \
+    TYPE *d = vd, *n = vn;                                      \
+    TYPE imm = simd_data(desc);                                 \
+    uint8_t *pg = vg;                                           \
+    for (i = 0; i < opr_sz; i += 1) {                           \
+        if (pg[H1(i)] & 1) {                                    \
+            TYPE nn = n[i];                                     \
+            d[i] = OP(nn, imm);                                 \
+        }                                                       \
+    }                                                           \
+}
+
+#define DO_SHR(N, M)  (N >> M)
+#define DO_SHL(N, M)  (N << M)
+
+/* Arithmetic shift right for division.  This rounds negative numbers
+   toward zero as per signed division.  Therefore before shifting,
+   when N is negative, add 2**M-1.  */
+#define DO_ASRD(N, M) ((N + (N < 0 ? ((__typeof(N))1 << M) - 1 : 0)) >> M)
+
+DO_ZPZI(sve_asr_zpzi_b, int8_t, H1, DO_SHR)
+DO_ZPZI(sve_asr_zpzi_h, int16_t, H1_2, DO_SHR)
+DO_ZPZI(sve_asr_zpzi_s, int32_t, H1_4, DO_SHR)
+DO_ZPZI_D(sve_asr_zpzi_d, int64_t, DO_SHR)
+
+DO_ZPZI(sve_lsr_zpzi_b, uint8_t, H1, DO_SHR)
+DO_ZPZI(sve_lsr_zpzi_h, uint16_t, H1_2, DO_SHR)
+DO_ZPZI(sve_lsr_zpzi_s, uint32_t, H1_4, DO_SHR)
+DO_ZPZI_D(sve_lsr_zpzi_d, uint64_t, DO_SHR)
+
+DO_ZPZI(sve_lsl_zpzi_b, uint8_t, H1, DO_SHL)
+DO_ZPZI(sve_lsl_zpzi_h, uint16_t, H1_2, DO_SHL)
+DO_ZPZI(sve_lsl_zpzi_s, uint32_t, H1_4, DO_SHL)
+DO_ZPZI_D(sve_lsl_zpzi_d, uint64_t, DO_SHL)
+
+DO_ZPZI(sve_asrd_b, int8_t, H1, DO_ASRD)
+DO_ZPZI(sve_asrd_h, int16_t, H1_2, DO_ASRD)
+DO_ZPZI(sve_asrd_s, int32_t, H1_4, DO_ASRD)
+DO_ZPZI_D(sve_asrd_d, int64_t, DO_ASRD)
+
+#undef DO_SHR
+#undef DO_SHL
+#undef DO_ASRD
+
+#undef DO_ZPZI
+#undef DO_ZPZI_D
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 49251a53c1..4218300960 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -37,6 +37,30 @@ typedef void GVecGen2Fn(unsigned, uint32_t, uint32_t, uint32_t, uint32_t);
 typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
                         uint32_t, uint32_t, uint32_t);
 
+/*
+ * Helpers for extracting complex instruction fields.
+ */
+
+/* See e.g. ASL (immediate, predicated).
+ * Returns -1 for unallocated encoding; diagnose later.
+ */
+static int tszimm_esz(int x)
+{
+    x >>= 3;  /* discard imm3 */
+    return 31 - clz32(x);
+}
+
+static int tszimm_shr(int x)
+{
+    return (16 << tszimm_esz(x)) - x;
+}
+
+/* See e.g. LSL (immediate, predicated).  */
+static int tszimm_shl(int x)
+{
+    return x - (8 << tszimm_esz(x));
+}
+
 /*
  * Include the generated decoder.
  */
@@ -341,6 +365,110 @@ static void trans_SADDV(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
 
 #undef DO_VPZ
 
+/*
+ *** SVE Shift by Immediate - Predicated Group
+ */
+
+/* Store zero into every active element of Zd.  We will use this for two
+ * and three-operand predicated instructions for which logic dictates a
+ * zero result.
+ */
+static void do_clr_zp(DisasContext *s, int rd, int pg, int esz)
+{
+    static gen_helper_gvec_2 * const fns[4] = {
+        gen_helper_sve_clr_b, gen_helper_sve_clr_h,
+        gen_helper_sve_clr_s, gen_helper_sve_clr_d,
+    };
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_2_ool(vec_full_reg_offset(s, rd),
+                       pred_full_reg_offset(s, pg),
+                       vsz, vsz, 0, fns[esz]);
+}
+
+static void do_zpzi_ool(DisasContext *s, arg_rpri_esz *a,
+                        gen_helper_gvec_3 *fn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       pred_full_reg_offset(s, a->pg),
+                       vsz, vsz, a->imm, fn);
+}
+
+static void trans_ASR_zpzi(DisasContext *s, arg_rpri_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve_asr_zpzi_b, gen_helper_sve_asr_zpzi_h,
+        gen_helper_sve_asr_zpzi_s, gen_helper_sve_asr_zpzi_d,
+    };
+    if (a->esz < 0) {
+        /* Invalid tsz encoding -- see tszimm_esz. */
+        unallocated_encoding(s);
+        return;
+    }
+    /* Shift by element size is architecturally valid.  For
+       arithmetic right-shift, it's the same as by one less. */
+    a->imm = MIN(a->imm, (8 << a->esz) - 1);
+    do_zpzi_ool(s, a, fns[a->esz]);
+}
+
+static void trans_LSR_zpzi(DisasContext *s, arg_rpri_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve_lsr_zpzi_b, gen_helper_sve_lsr_zpzi_h,
+        gen_helper_sve_lsr_zpzi_s, gen_helper_sve_lsr_zpzi_d,
+    };
+    if (a->esz < 0) {
+        unallocated_encoding(s);
+        return;
+    }
+    /* Shift by element size is architecturally valid.
+       For logical shifts, it is a zeroing operation.  */
+    if (a->imm >= (8 << a->esz)) {
+        do_clr_zp(s, a->rd, a->pg, a->esz);
+    } else {
+        do_zpzi_ool(s, a, fns[a->esz]);
+    }
+}
+
+static void trans_LSL_zpzi(DisasContext *s, arg_rpri_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve_lsl_zpzi_b, gen_helper_sve_lsl_zpzi_h,
+        gen_helper_sve_lsl_zpzi_s, gen_helper_sve_lsl_zpzi_d,
+    };
+    if (a->esz < 0) {
+        unallocated_encoding(s);
+        return;
+    }
+    /* Shift by element size is architecturally valid.
+       For logical shifts, it is a zeroing operation.  */
+    if (a->imm >= (8 << a->esz)) {
+        do_clr_zp(s, a->rd, a->pg, a->esz);
+    } else {
+        do_zpzi_ool(s, a, fns[a->esz]);
+    }
+}
+
+static void trans_ASRD(DisasContext *s, arg_rpri_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve_asrd_b, gen_helper_sve_asrd_h,
+        gen_helper_sve_asrd_s, gen_helper_sve_asrd_d,
+    };
+    if (a->esz < 0) {
+        unallocated_encoding(s);
+        return;
+    }
+    /* Shift by element size is architecturally valid.  For arithmetic
+       right shift for division, it is a zeroing operation.  */
+    if (a->imm >= (8 << a->esz)) {
+        do_clr_zp(s, a->rd, a->pg, a->esz);
+    } else {
+        do_zpzi_ool(s, a, fns[a->esz]);
+    }
+}
+
 /*
  *** SVE Predicate Logical Operations Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index b390d8f398..c265ff9899 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -22,12 +22,20 @@
 ###########################################################################
 # Named fields.  These are primarily for disjoint fields.
 
+%imm6_22_5	22:1 5:5
 %imm9_16_10	16:s6 10:3
 %preg4_5	5:4
 
+# A combination of tsz:imm3 -- extract esize.
+%tszimm_esz	22:2 5:5 !function=tszimm_esz
+# A combination of tsz:imm3 -- extract (2 * esize) - (tsz:imm3)
+%tszimm_shr	22:2 5:5 !function=tszimm_shr
+# A combination of tsz:imm3 -- extract (tsz:imm3) - esize
+%tszimm_shl	22:2 5:5 !function=tszimm_shl
+
 # Either a copy of rd (at bit 0), or a different source
 # as propagated via the MOVPRFX instruction.
-%reg_movprfx		0:5
+%reg_movprfx	0:5
 
 ###########################################################################
 # Named attribute sets.  These are used to make nice(er) names
@@ -40,7 +48,7 @@
 &rpr_esz	rd pg rn esz
 &rprr_s		rd pg rn rm s
 &rprr_esz	rd pg rn rm esz
-
+&rpri_esz	rd pg rn imm esz
 &ptrue		rd esz pat s
 
 ###########################################################################
@@ -68,6 +76,11 @@
 # One register operand, with governing predicate, vector element size
 @rd_pg_rn	........ esz:2 ... ... ... pg:3 rn:5 rd:5	&rpr_esz
 
+# Two register operand, one immediate operand, with predicate,
+# element size encoded as TSZHL.  User must fill in imm.
+@rdn_pg_tszimm	........ .. ... ... ... pg:3 ..... rd:5 \
+		&rpri_esz rn=%reg_movprfx esz=%tszimm_esz
+
 # Basic Load/Store with 9-bit immediate offset
 @pd_rn_i9	........ ........ ...... rn:5 . rd:4	\
 		&rri imm=%imm9_16_10
@@ -126,6 +139,18 @@ UMAXV		00000100 .. 001 001 001 ... ..... .....		@rd_pg_rn
 SMINV		00000100 .. 001 010 001 ... ..... .....		@rd_pg_rn
 UMINV		00000100 .. 001 011 001 ... ..... .....		@rd_pg_rn
 
+### SVE Shift by Immediate - Predicated Group
+
+# SVE bitwise shift by immediate (predicated)
+ASR_zpzi	00000100 .. 000 000 100 ... .. ... ..... \
+		@rdn_pg_tszimm imm=%tszimm_shr
+LSR_zpzi	00000100 .. 000 001 100 ... .. ... ..... \
+		@rdn_pg_tszimm imm=%tszimm_shr
+LSL_zpzi	00000100 .. 000 011 100 ... .. ... ..... \
+		@rdn_pg_tszimm imm=%tszimm_shl
+ASRD		00000100 .. 000 100 100 ... .. ... ..... \
+		@rdn_pg_tszimm imm=%tszimm_shr
+
 ### SVE Logical - Unpredicated Group
 
 # SVE bitwise logical operations (unpredicated)
-- 
2.14.3

