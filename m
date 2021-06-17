Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp508878lff;
        Thu, 17 Jun 2021 05:51:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYmRx5zcAdDSGv5514HperOu1oxgZoifvJq4VegAygqKfrIv081CausD2K/2VmWqkVOViD
X-Received: by 2002:ab0:5962:: with SMTP id o31mr4807693uad.89.1623934311276;
        Thu, 17 Jun 2021 05:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623934311; cv=none;
        d=google.com; s=arc-20160816;
        b=KfUnt1wd2TAlvibkX1J4kC6or3QOWqcuBPHfrbNSOdw+PP8fc/9sgrj01LZUzda2WZ
         BLVZuDo/uXhdYqvPVRubJXd8jQo+tdEKDw8c6DIA4SpV72Qm2Cyt6v3B5j6Zr94adDTE
         llfY0qpg1hNEC9tp7aFt+WO/bsot6E7wKQ+Xu4id2o6AxgG0S3hbrqULX0MXbLajjGDL
         y9KXt9Mw3dS5l0QJMlBToAoUi8chGJiqygXxIvQtVfljBCkkvQ1kPR21HWBeyAo+Bt7k
         lE2GSFI4xipM6MfVRxZzq1nxei1tuW4TXhjOQv75iOjdn+KlJoPXfx1ZX/PcERAmE/xT
         cM4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zrb5AvjnvJ0s1md2ppwPh2z3hxVg0GYrb9NBpUTkCjU=;
        b=W+Cd6AJ2JXGgiQ1wJhvP3lNkrJmCdFIQSVrdn6/CSPkx6NATHMqnkHz3UUWmfVGVQW
         YsLJoE7gBpzN20kKtaQcfwbtWZqeG9jcP5WEiTXtsN4Q5scRAzTvXnB7RAfdIoQ/CA1X
         DZAe9wvTAFpeaQURPAs27lwDXA9E4TeKrkWTaKEFKhLO4HCW8penf+DQdBMBqdnNDXPN
         cRwK0bk9gETV56Yrze1Z3QS0SA4xm4b3P15H5oUZaPWYdhkhQTeK3zcSnkU1R7JfNvyn
         g+/AqAa9GnO8hh25f6Jn3YzfBancE2wSlsbwMT9V9Q0zLZCluRaMlhUEoCEXKb+Ldry7
         nYeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X3JkkwTI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o68si3929061vsc.417.2021.06.17.05.51.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:51:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X3JkkwTI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltrUs-0007xA-IX
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxR-0002kD-EQ
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:17 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxE-0007J6-TP
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:17 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 n35-20020a05600c3ba3b02901cdecb6bda8so6220396wms.5
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zrb5AvjnvJ0s1md2ppwPh2z3hxVg0GYrb9NBpUTkCjU=;
 b=X3JkkwTI3nSQmA/qMgZs2ugANtRhpc1kJc0c/657y0K8rcOrc3TKh+W4OKXlrL6uEy
 RvdCo4owEHqdkkMLIpSfQSoNCpZk/f5O3zci7v6ufPRBhfEeolqSpnVghHXUFIpnkOIv
 vFbVrWRFNM+gBCFZ8SwIvDIirNZAfqnNDNu/zmi1SDPYPntjDFzLyJTTfJby4w7IPKme
 cm3uDviyQLyl2HNmtGZx7Ms0S63jOHDAyqnoUYgt3oCi8q2IhUe2XPiiRAZRYxj6hTPN
 ETX83fNsZejjB3YEDHg0sXVw+/kcJvzZ0Kl/e7G6OrEIfcadyf+hYd4fdFCgL209eQZq
 lypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zrb5AvjnvJ0s1md2ppwPh2z3hxVg0GYrb9NBpUTkCjU=;
 b=h8GeKPA/EW4awFILJFforGb8xd8FjsMXEX7BGOQGdxdgMVaIDgtn3VP8opHHL+1XK6
 mZl+Vz4ymic7mEEW/AtIim5wYX96wz4SM9GK8ZFykGMXzFGB/amDJYDwJ0rlONqqj6Gb
 VU3PGQaFpwOwVswS9R9KRDd1Or1wFQdO6/nBwvYeVASuPznzsc89GnA6v1F09PNr23Dy
 Uq7GgKyKuf+5tS8yijiXm749q4rSs27EoiQvXj+kn5DpUaZnP5rOCV1wq1nKu8P316gZ
 E2rjHbaqp7i8NS2TpPPaVPYpMIQRtbA5fVQIhhJGOxjx4Ni/RNGeKE6MR8lK/GFInByO
 Gk6w==
X-Gm-Message-State: AOAM532+P1sJ80TscafhgBoqS3u+CeTQy1ixR3uVESERoPqstDMbJu2z
 Bk4kusy9xcbxrdYtSB0AWZ+oA0TQSHdFKQ==
X-Received: by 2002:a1c:4d09:: with SMTP id o9mr4768858wmh.149.1623932223525; 
 Thu, 17 Jun 2021 05:17:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:17:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 42/44] target/arm: Implement MVE VHCADD
Date: Thu, 17 Jun 2021 13:16:26 +0100
Message-Id: <20210617121628.20116-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZJaHsY4xRrM5

Implement the MVE VHCADD insn, which is similar to VCADD
but performs a halving step. This one overlaps with VADC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 8 ++++++--
 target/arm/mve_helper.c    | 2 ++
 target/arm/translate-mve.c | 4 +++-
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index b8ad3df9cc8..161308b67e6 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -259,6 +259,14 @@ DEF_HELPER_FLAGS_4(mve_vcadd270b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vcadd270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vcadd270w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vhcadd90b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhcadd90h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhcadd90w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vhcadd270b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhcadd270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhcadd270w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index afe60078649..695097dcca4 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -160,8 +160,12 @@ VQDMULLT         111 . 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 1 @2op_sz28
 VRHADD_S         111 0 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 VRHADD_U         111 1 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 
-VADC             1110 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 0 @2op_nosz
-VADCI            1110 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 0 @2op_nosz
+{
+  VADC           1110 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 0 @2op_nosz
+  VADCI          1110 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 0 @2op_nosz
+  VHCADD90       1110 1110 0 . .. ... 0 ... 0 1111 . 0 . 0 ... 0 @2op
+  VHCADD270      1110 1110 0 . .. ... 0 ... 1 1111 . 0 . 0 ... 0 @2op
+}
 
 {
   VSBC           1111 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 0 @2op_nosz
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index e06b2bcea79..fb002465413 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -632,6 +632,8 @@ void HELPER(mve_vsbci)(CPUARMState *env, void *vd, void *vn, void *vm)
 
 DO_VCADD_ALL(vcadd90, DO_SUB, DO_ADD)
 DO_VCADD_ALL(vcadd270, DO_ADD, DO_SUB)
+DO_VCADD_ALL(vhcadd90, do_vhsub_s, do_vhadd_s)
+DO_VCADD_ALL(vhcadd270, do_vhadd_s, do_vhsub_s)
 
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index b164907426c..73c15f41333 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -423,10 +423,12 @@ DO_2OP(VRHADD_U, vrhaddu)
 /*
  * VCADD Qd == Qm at size MO_32 is UNPREDICTABLE; we choose not to diagnose
  * so we can reuse the DO_2OP macro. (Our implementation calculates the
- * "expected" results in this case.)
+ * "expected" results in this case.) Similarly for VHCADD.
  */
 DO_2OP(VCADD90, vcadd90)
 DO_2OP(VCADD270, vcadd270)
+DO_2OP(VHCADD90, vhcadd90)
+DO_2OP(VHCADD270, vhcadd270)
 
 static bool trans_VQDMULLB(DisasContext *s, arg_2op *a)
 {
-- 
2.20.1

