Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4752685wrg;
        Thu, 6 Jun 2019 10:52:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwSctuiUON+lBmFJUJGLzlzf0KmTNBV4NjBgAz7IoF8QDrGTt/he/SPfys0qZwokrjyDBs2
X-Received: by 2002:a0c:c146:: with SMTP id i6mr22129415qvh.79.1559843533700;
        Thu, 06 Jun 2019 10:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843533; cv=none;
        d=google.com; s=arc-20160816;
        b=rICYKyEcJyqD9IKADJ6atROiZPs/ndXhOnQaPBGDhHejTrLT4uXmczpdY6avmpMbib
         D4V8FztTrlv/ReG9L+VFBBnDNw9JikTCkS5E9DTy/LABsTxt+6mpGEptAwkNDl4TS3sb
         1o790jNKaJsuY/Kq+aEszElhBFBG+qHCLSHNLq7WJOI4DpXdzC+Jb/EvuVpxUwXiHwLH
         ZdJkbsLIlmxfkhRLFyZd3ANWsyCZEKHej2RZBBRgsP3J2begLY0qGEYABYR/RXyH/Bws
         dhfF7IBnrzgnVeCpSjQGuQWCvE5QEMEoQLjVIm2S+/f6yHFg+n/qpO6S61rKEbY4QT++
         Qxxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=/3K4w5xTobetV/OczLSlt15Lz4WijJvW66/wYpgJ/Os=;
        b=Kldu5eaTts1DEgXjzZkb29xkbz2iAY+p9M7usNkl9JNiRR8X66dt/DQdR2YQP5rLQy
         qK4HRgSStzYpun6u0iFifE6UQsa/7PkFhr63hJt73FYziYwNrwjLqozCXirfytcVrXrG
         D89/sTNnU2g1ETr07pduVtMFQlzDw5jYQfOa2/uL2pjBL+seyF65Ac+uciIJ7fg9+p1y
         9kBbYuj4GV+GL8/ujqfDmKpjGWyyLwDJesVxoIIXf6clA0LDeOWRCBMkAw17h17PvXPz
         hEk6jhG/b0Z9SU8rNR4mnK3UjPlqb6qU9cjQby7ZJJBOL4ENEMt/BSEaf2ZMmCf1CxpB
         kycQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VvivHsjk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si1381922qvq.20.2019.06.06.10.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:52:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VvivHsjk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwYf-00089K-5y
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:52:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTo-00047h-Fb
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTl-0003bV-Iw
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:11 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39174)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTj-0003A2-Qr
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:08 -0400
Received: by mail-wm1-x341.google.com with SMTP id z23so808736wma.4
	for <qemu-devel@nongnu.org>; Thu, 06 Jun 2019 10:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/3K4w5xTobetV/OczLSlt15Lz4WijJvW66/wYpgJ/Os=;
	b=VvivHsjkIt0SLNToC5eJ3tTFbQZ/kvt+LIiLBd144+B3yhA5Q5fkCt5J49T0Yp42yj
	6CIoYaq3msCfoUYY+vv1hJlKFb4CDXAe9zMXMmdJv6AO/wxlj6M68lpggO+fKGSrCYaC
	SAQnJewYXZG2JVW8ZE2Fx0DRJjruEFUAOFGLxQl8VpEMmd9Lb63ZytQ/jkvbXH8a59Ed
	AvGm3p/F3gDXC++Fa1350I0KUQaPqGBWBEnPcAMptGQiDVjzOJz2eK//Q55qs70u7irA
	OOPInS8CrEuTEKTpL3hKCPnMAT+GPuX3ydpBfiFITYP5xRJOQimA9//ClTXCj5v0Ctuq
	l5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/3K4w5xTobetV/OczLSlt15Lz4WijJvW66/wYpgJ/Os=;
	b=OI6vzinGfD32jrNc8mNV2nS3FllZiKFTfCNQcKgcJ2xe+Wa66OXrBfqtuFjdh6gtVp
	KIQXwsI6wqEW1PVmWlMrYgIBxBMliTMguR9rxQiqskaRnKoeEy8M29VKzVOxsdfj6Fd3
	JZRD9xuLzuAEoKO9ZOUPrayOwmdhwxOsFZc4Jn8aMDsZZGwIbGT9BVHLvMuaSS1NtVeK
	YWAkn2KeAOj+d8artcvyoUE4/sqReDAsjwcEWr0+R0icr0yERlZf8/CK4ngGQTCjIgMI
	7sPca5m+j+ey8LsMbGs38J+EjtFovqHgKXUvQr/nuaRneMZt/ewr0daXQW28zXpAgqzC
	SxJA==
X-Gm-Message-State: APjAAAUC4JqtIAbasZb5EWHUQd6PW3kOCPfpQONrJ0sglV9gg42XZ9VL
	Znedc8hIYd51NZE8yEihM0/KAQ==
X-Received: by 2002:a1c:dc45:: with SMTP id t66mr828212wmg.63.1559843199885;
	Thu, 06 Jun 2019 10:46:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:53 +0100
Message-Id: <20190606174609.20487-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH 26/42] target/arm: Convert VDIV to decodetree
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Da2W00OgveL

Convert the VDIV instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 10 ++++++++++
 target/arm/translate.c         | 21 +--------------------
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 12da3b8acb8..6af99605d5c 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1471,3 +1471,13 @@ static bool trans_VSUB_dp(DisasContext *s, arg_VSUB_sp *a)
 {
     return do_vfp_3op_dp(s, gen_helper_vfp_subd, a->vd, a->vn, a->vm, false);
 }
+
+static bool trans_VDIV_sp(DisasContext *s, arg_VDIV_sp *a)
+{
+    return do_vfp_3op_sp(s, gen_helper_vfp_divs, a->vd, a->vn, a->vm, false);
+}
+
+static bool trans_VDIV_dp(DisasContext *s, arg_VDIV_sp *a)
+{
+    return do_vfp_3op_dp(s, gen_helper_vfp_divd, a->vd, a->vn, a->vm, false);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 433f1cbf2c7..d35bf9d92c3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1374,22 +1374,6 @@ static TCGv_ptr get_fpstatus_ptr(int neon)
     return statusptr;
 }
 
-#define VFP_OP2(name)                                                 \
-static inline void gen_vfp_##name(int dp)                             \
-{                                                                     \
-    TCGv_ptr fpst = get_fpstatus_ptr(0);                              \
-    if (dp) {                                                         \
-        gen_helper_vfp_##name##d(cpu_F0d, cpu_F0d, cpu_F1d, fpst);    \
-    } else {                                                          \
-        gen_helper_vfp_##name##s(cpu_F0s, cpu_F0s, cpu_F1s, fpst);    \
-    }                                                                 \
-    tcg_temp_free_ptr(fpst);                                          \
-}
-
-VFP_OP2(div)
-
-#undef VFP_OP2
-
 static inline void gen_vfp_abs(int dp)
 {
     if (dp)
@@ -3109,7 +3093,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0 ... 7:
+            case 0 ... 8:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3295,9 +3279,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 8: /* div: fn / fm */
-                    gen_vfp_div(dp);
-                    break;
                 case 10: /* VFNMA : fd = muladd(-fd,  fn, fm) */
                 case 11: /* VFNMS : fd = muladd(-fd, -fn, fm) */
                 case 12: /* VFMA  : fd = muladd( fd,  fn, fm) */
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index de56f44efc9..de305f60e18 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -137,3 +137,8 @@ VSUB_sp      ---- 1110 0.11 .... .... 1010 .1.0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp
 VSUB_dp      ---- 1110 0.11 .... .... 1011 .1.0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VDIV_sp      ---- 1110 1.00 .... .... 1010 .0.0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp
+VDIV_dp      ---- 1110 1.00 .... .... 1011 .0.0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1

