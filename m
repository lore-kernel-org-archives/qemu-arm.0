Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4756968wrg;
        Thu, 6 Jun 2019 10:57:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxivYsCLhmGHwuNSGsOM1IwUyet6R3qSpZn2ZS9SSjFiw4xp3R0ndKHtpfz64A7WUbUR2dT
X-Received: by 2002:ac8:6898:: with SMTP id m24mr41316644qtq.362.1559843824956;
        Thu, 06 Jun 2019 10:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843824; cv=none;
        d=google.com; s=arc-20160816;
        b=qsw06g57wzzXHxYo50nVZq8HpgPfZDwNGsyZEmZe5vgCjG9qOD0ozvKxZF/7a7Oi1q
         V9UpCDNiUbPtrb/622wpvcenR+elSfrzIKQtxtzcwNMffjXQP0flNGL24AzhWOP2wFed
         rqFXwHcGYN85FTWGLInfsuHO3se3oiTpN5VKsjKkCskeUZgdYY9MVifYx8pqhZ7QiEus
         n2PJufO5WZA00atRrKiDHm2Ywnel2nESPbk+SmWDaUKfW7UVLFY/metTaTXOBlnwdXMy
         hrVSTVa8Zkx1dx8jPNCp5+LncKJf1ZRJohNLB9Q/mBVQcDwCP6JfaAkpTiUsZHdurQ/p
         fpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=tJUsST+aGlhOT8pqIZXKH+UcDOpMGU+FNgpH8UqWdjI=;
        b=CnfVFQ5XRu1onRkWsH+N7eh0Kj7R+bGHMzHnP+tUB+nSke1+PXkSE/JE1lLlQZdWBE
         OTGf1lAy4fRHrFXOrC9rXlxcHHdm1xfqmBDobWWJwoRo/QJNoUFCXfBIt+eIlJf1Wwtq
         HE591baoWwDAa+BUYwZhlAvvLnZhkQpt2HST2BXA4Z8/MOl7LJB692Oaw+xHE91sgcvw
         G0iiYMvovPW3WrH9IENAWMrt8rorhh/IhciaOkxWowK3ek+eJXyjIH/vH8+U5EUsxsxb
         bim6TX3v6Z87uEgZn4Jkljq6r3JBlyKiLqVe0FkRu+Zf/3x5ghBV+fvyM/1tq6qPcfuQ
         LZDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="bN/xsLRz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si2037972qkf.186.2019.06.06.10.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:57:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="bN/xsLRz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36043 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwdM-0004q7-Ct
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:57:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwU5-0004Qs-6y
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwU2-00041b-B7
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:27 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38757)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTz-0003GI-R5
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:24 -0400
Received: by mail-wr1-x442.google.com with SMTP id d18so3338251wrs.5
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tJUsST+aGlhOT8pqIZXKH+UcDOpMGU+FNgpH8UqWdjI=;
	b=bN/xsLRzT8Q84/gf511fQfvi31EeHwKExgk767yOQlU8rI8utj7kWWk8Prx5bBTCFe
	bqxp8zuGngk5WDInm13pyrOagQT9xOaMapl1GMJSql/AhXgly34CjJNrEb/5oQsPeJgK
	1OyYle+Ehn4nu+h3Kt+hQWvYe+95rRZ1eSonlrJpvJyE8uS6EmSzRuFOBsM5vBPRrmye
	nT7RKx/nw6y47GOZFPndFvm0C969LpiMMNyW+DxgOZVmkxwIDCQHLEjHqHsBVQUnCubl
	gX9Oq2qTQu2TdMp5ULOXsS/LPeMTiLNCKX941Qg05TrY1LlEp20Fx8dfwWb+OVNrOFOe
	ApTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tJUsST+aGlhOT8pqIZXKH+UcDOpMGU+FNgpH8UqWdjI=;
	b=DzaYOeqfWZulifGreacO4D/kf6R3E0F7U/gGCpQ4ayBGpC62q8vaZrKxm/nCZSPrUp
	FkH0gWRQnqq2yvykrETXTTkqDJyDgVrXhEnm+4j+8/Vf3tAjfmTUM4ndN+R0mPLxp48y
	ZCy5IvE8dsIVGW4ZV0yszeJtcC/+8GJJepp7h0ScxmVIL4nrpXCVhZ/dW06RYXEOoYn6
	NYJwzYs0Akagz27rqVYiazL8PFyNTakpurIN8dnz0GYIexFuGnqd95uq7TmCE/XHrdhD
	AOYwANTGAQXRYfnQSQaWS6ldNgKWlwbAWfbI1S8o3a0UtzLY+gGApRQJrvoBK6NsBwGs
	vRpw==
X-Gm-Message-State: APjAAAX/hNtGIJWixVhOZKdQQas1K44CBo8pUu4AHkASEa0OM4UgQliB
	aiR5WBARHSjzzD/CKNwlF43AsokP8xJJQg==
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr15941360wrr.5.1559843206924;
	Thu, 06 Jun 2019 10:46:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:59 +0100
Message-Id: <20190606174609.20487-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 32/42] target/arm: Convert VMOV (register) to
 decodetree
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yMhaI/5uxg53

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 10 ++++++++++
 target/arm/translate.c         |  8 +-------
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index ae2f77a873b..a7e4ae31985 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1889,6 +1889,16 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
     return true;
 }
 
+static bool trans_VMOV_reg_sp(DisasContext *s, arg_VMOV_reg_sp *a)
+{
+    return do_vfp_2op_sp(s, tcg_gen_mov_i32, a->vd, a->vm);
+}
+
+static bool trans_VMOV_reg_dp(DisasContext *s, arg_VMOV_reg_dp *a)
+{
+    return do_vfp_2op_dp(s, tcg_gen_mov_i64, a->vd, a->vm);
+}
+
 static bool trans_VABS_sp(DisasContext *s, arg_VABS_sp *a)
 {
     return do_vfp_2op_sp(s, gen_helper_vfp_abss, a->vd, a->vm);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index fda0962761f..639e0f5f91e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3090,7 +3090,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 return 1;
             case 15:
                 switch (rn) {
-                case 1 ... 3:
+                case 0 ... 3:
                     /* Already handled by decodetree */
                     return 1;
                 default:
@@ -3103,9 +3103,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             if (op == 15) {
                 /* rn is opcode, encoded as per VFP_SREG_N. */
                 switch (rn) {
-                case 0x00: /* vmov */
-                    break;
-
                 case 0x04: /* vcvtb.f64.f16, vcvtb.f32.f16 */
                 case 0x05: /* vcvtt.f64.f16, vcvtt.f32.f16 */
                     /*
@@ -3278,9 +3275,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 switch (op) {
                 case 15: /* extension space */
                     switch (rn) {
-                    case 0: /* cpy */
-                        /* no-op */
-                        break;
                     case 4: /* vcvtb.f32.f16, vcvtb.f64.f16 */
                     {
                         TCGv_ptr fpst = get_fpstatus_ptr(false);
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 2780e1ed9ea..b72ab8b8067 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -157,6 +157,11 @@ VMOV_imm_sp  ---- 1110 1.11 imm4h:4 .... 1010 0000 imm4l:4 \
 VMOV_imm_dp  ---- 1110 1.11 imm4h:4 .... 1011 0000 imm4l:4 \
              vd=%vd_dp
 
+VMOV_reg_sp  ---- 1110 1.11 0000 .... 1010 01.0 .... \
+             vd=%vd_sp vm=%vm_sp
+VMOV_reg_dp  ---- 1110 1.11 0000 .... 1011 01.0 .... \
+             vd=%vd_dp vm=%vm_dp
+
 VABS_sp      ---- 1110 1.11 0000 .... 1010 11.0 .... \
              vd=%vd_sp vm=%vm_sp
 VABS_dp      ---- 1110 1.11 0000 .... 1011 11.0 .... \
-- 
2.20.1

