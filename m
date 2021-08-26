Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp606777lfb;
        Thu, 26 Aug 2021 06:21:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcDIE9JC79UHgC0iKSpM+2+FyRwNyKwkLJfSQk9+QNptFxe8L4RaBQVa9saGrg4Q2CVwT9
X-Received: by 2002:a1c:448a:: with SMTP id r132mr3625710wma.117.1629984118586;
        Thu, 26 Aug 2021 06:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629984118; cv=none;
        d=google.com; s=arc-20160816;
        b=0GqizviNmOx7aYUIh8iqIowDcspoa+/PGwAQMr1l/EG7P5JzzKyEQ2npyfSYuoGYwQ
         8sqwBZyulLA2Qf9DD02RaXwgXO2Y/CtU//XMAIS219vtjZmSIwWgZAc01Ak/+1V5UaLd
         tFaU3fpowPz+l7bdFau/u1qECVsTR6Hq7MS8D0TrAwYm/4Db4MDbodvos/OcaXDwkL6U
         1ZmtwkPaNU6XEKZt82L3CswVICdsyFuvXXgcvvBuW4L/fPw9VBqlpe8iSeR5E+ntrtKC
         IJLT0pV9J9KntMyEHs0RiL5l3yX72WIGGNT8ADn9o/gLWedPr92BuYge1Kz8DhNNyoPO
         qLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8O21K1IilhVzj+bzP20ikUdMzycJM1qc6/UnoM+AkTc=;
        b=gc8g79W/qYHqySMCe27mqEk5HHrdq4M1gngEtdW8mOWWapoKEoc13LzMqSs842adcc
         t8HzJYjwJRrwFkh0zE9F2yO+bfHJQDhV+sgwGrvmSP6bqUpE+gaZccSF5ZH0TN/NbkOw
         qbYnSY/HXKw5QgYr/2rP+26NoR0jeT9S439b55npnc/v59VHgiJuo+IDj25rDV1zXGGW
         vHz0i0bAkng7pd6hp88qjbT+0jWCTcCrTqFYQRLpNlojVZNa2QlAy0S9w00ardbaOK4w
         CpRGUFFGjDV2yQ4P46TsCSn3FlRIZJHJYoty8cF7rv91wzzB1M4xY98HI/pVv5hjRAlQ
         2YiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uads03W7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9si2849267wrr.416.2021.08.26.06.21.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 06:21:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uads03W7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJFKP-0005Ny-6H
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 09:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGF-0005m3-LI
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:17:40 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGA-0004yL-Ml
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:17:39 -0400
Received: by mail-wr1-x434.google.com with SMTP id u9so5002145wrg.8
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 06:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8O21K1IilhVzj+bzP20ikUdMzycJM1qc6/UnoM+AkTc=;
 b=uads03W7a4kMXqnY5yj8amGzWCqtGvnLNu6bBuseL8nAhjwWCIwVdmTKIexLcOiIGJ
 H9HDDYiRmkSvmqhJXSE7s2dOh4fNqVaR9kO5LHv4O9wRfcT8B1HJ0I13OFd/u1ayCaB4
 crQasECmIGWsVLU9JI5h+S96qBdHS6vLPNRs14V6TzSvq16Rntem+ixafpe5rMo2VlrR
 R/p83+BuOZHMdq2mxJVAtwjaubPEDINm7nN/GdYYFePihhF7U8MSiOm8gvv3rugJDu1t
 /QOJ6JnsrzU2RVP6r1JburAkEVfaAMof0pRV8ggkclB8XK3abixKw9xkmqc9JzfuoD1O
 ZsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8O21K1IilhVzj+bzP20ikUdMzycJM1qc6/UnoM+AkTc=;
 b=XM+LnFoGL0ZiLkJmZ2yfUypnL63OAvjzXB7FHNbIdXhMGew97v8tgkJswRkwpn3GcV
 Tu6kdDje3uCe8RvWUtmZfQwnEtu2WVrMlbVv6q428CwUgYiyLDn/nCzbY8dcnoBk82sE
 JFYikQo20bnqZmJ3aHMJ/0tHbaD6gS85jqtrKSzFA7gdOmYR5dkDHS6w9RmIh7NWlG7N
 aIxP8MuX3yGhydopfJH5Tkx79rUijBf+NbSYPmaqnTIPLEywqphX9g0yjejG1I0EfQw5
 Zq2XQ8hYLH5kbWCxe/G8+BNRsPO6durcGmQt698XDq8oH05OyRF9//T16d7Ho2YpL6qO
 u1nw==
X-Gm-Message-State: AOAM5334ttnpNYZgjimUEJuz55Zq1vWUWpQXq8tCH8hhDatolkaEz+qg
 l7JmGUZOP5TTktFudpRgtRYN2rJbDhHThA==
X-Received: by 2002:adf:9063:: with SMTP id h90mr4011691wrh.121.1629983852678; 
 Thu, 26 Aug 2021 06:17:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/18] target/arm: Implement MVE VMAXNMA and VMINNMA
Date: Thu, 26 Aug 2021 14:17:13 +0100
Message-Id: <20210826131725.22449-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9E/+qqGIrADn

Implement the MVE VMAXNMA and VMINNMA insns; these are 2-operand, but
the destination register must be the same as one of the source
registers.

We defer the decode of the size in bit 28 to the individual insn
patterns rather than doing it in the format, because otherwise we
would have a single insn pattern that overlapped with two groups (eg
VMAXNMA with the VMULH_S and VMULH_U groups). Having two insn
patterns per insn seems clearer than a complex multilevel nesting
of overlapping and non-overlapping groups.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: use DO_2OP_FP_ALL macro
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      | 11 +++++++++++
 target/arm/mve_helper.c    | 23 +++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 42 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 73950403bc3..57ab3f7b59f 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -428,6 +428,12 @@ DEF_HELPER_FLAGS_4(mve_vmaxnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminnmh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vmaxnmah, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxnmas, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vminnmah, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminnmas, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vfcadd90h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfcadd90s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 403381eef61..b0622e1f62c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -130,6 +130,11 @@
 @2op_fp_size_rev .... .... .... .... .... .... .... .... &2op \
                  qd=%qd qn=%qn qm=%qm size=%2op_fp_size_rev
 
+# 2-operand, but Qd and Qn share a field. Size is in bit 28, but we
+# don't decode it in this format
+@vmaxnma  .... .... .... .... .... .... .... .... &2op \
+          qd=%qd qn=%qd qm=%qm
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -199,6 +204,8 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 # The VSHLL T2 encoding is not a @2op pattern, but is here because it
 # overlaps what would be size=0b11 VMULH/VRMULH
 {
+  VMAXNMA        111 0 1110 0 . 11 1111 ... 0 1110 1 0 . 0 ... 1 @vmaxnma size=2
+
   VSHLL_BS       111 0 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_BS       111 0 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
@@ -211,6 +218,8 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 }
 
 {
+  VMAXNMA        111 1 1110 0 . 11  1111 ... 0 1110 1 0 . 0 ... 1 @vmaxnma size=1
+
   VSHLL_BU       111 1 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_BU       111 1 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
@@ -221,6 +230,7 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 }
 
 {
+  VMINNMA        111 0 1110 0 . 11  1111 ... 1 1110 1 0 . 0 ... 1 @vmaxnma size=2
   VSHLL_TS       111 0 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_TS       111 0 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
@@ -233,6 +243,7 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 }
 
 {
+  VMINNMA        111 1 1110 0 . 11  1111 ... 1 1110 1 0 . 0 ... 1 @vmaxnma size=1
   VSHLL_TU       111 1 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_TU       111 1 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index e478408fddd..a6ad894414a 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2855,6 +2855,29 @@ DO_2OP_FP_ALL(vfabd, abd)
 DO_2OP_FP_ALL(vmaxnm, maxnum)
 DO_2OP_FP_ALL(vminnm, minnum)
 
+static inline float16 float16_maxnuma(float16 a, float16 b, float_status *s)
+{
+    return float16_maxnum(float16_abs(a), float16_abs(b), s);
+}
+
+static inline float32 float32_maxnuma(float32 a, float32 b, float_status *s)
+{
+    return float32_maxnum(float32_abs(a), float32_abs(b), s);
+}
+
+static inline float16 float16_minnuma(float16 a, float16 b, float_status *s)
+{
+    return float16_minnum(float16_abs(a), float16_abs(b), s);
+}
+
+static inline float32 float32_minnuma(float32 a, float32 b, float_status *s)
+{
+    return float32_minnum(float32_abs(a), float32_abs(b), s);
+}
+
+DO_2OP_FP_ALL(vmaxnma, maxnuma)
+DO_2OP_FP_ALL(vminnma, minnuma)
+
 #define DO_VCADD_FP(OP, ESIZE, TYPE, FN0, FN1)                          \
     void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
                                 void *vd, void *vn, void *vm)           \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d62ed1fc295..4d702da808d 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -864,6 +864,8 @@ DO_2OP_FP(VCMLA0, vcmla0)
 DO_2OP_FP(VCMLA90, vcmla90)
 DO_2OP_FP(VCMLA180, vcmla180)
 DO_2OP_FP(VCMLA270, vcmla270)
+DO_2OP_FP(VMAXNMA, vmaxnma)
+DO_2OP_FP(VMINNMA, vminnma)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1

