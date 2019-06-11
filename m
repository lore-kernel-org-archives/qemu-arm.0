Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4248162wrg;
        Tue, 11 Jun 2019 04:47:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx9VZDYMQvwMzS7F21NfRZK52kz9pf950Ib9ws6nVss83Ij2dEasPqqyARNfJ/PwfxYMbG1
X-Received: by 2002:ac8:188d:: with SMTP id s13mr47586123qtj.0.1560253620036;
        Tue, 11 Jun 2019 04:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560253620; cv=none;
        d=google.com; s=arc-20160816;
        b=EKpgqm5ig98AkXc8U4MXK19teZ42WVpXCe0n2LJlb/QRbB+5wxFRCO9AAarN2eCbe0
         oxtxEEeOuSPm5/5+vv+9Gm+OVuqauFCozLR4SZrPR7EP20V3YNTmiCjQEHSS7c+zigLM
         TafYZV7T8UqruSodsR/8gbQF4IlQaIwx8TNBliXeUopn/+1+3PRIeqt8jKRM7Vtfyo3Y
         JNrpQFv9BVYQYXFMc9stqszbXH9hu3fMVpkeEGvBsPgX/wMC/2RiP4nSbgXU+P/nFssp
         nfZn3mCD+P3m5Aj4MvmmyGsEHPz2KxLxIPEAPx6fPkmNICUUu+Rxj64VVv4mPfw5DZMA
         aBQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=OdD7ugR/BLvUdOtU43yNG5jqeDwBZd2sqvJMrpioEU0=;
        b=ggKCObFRHhLuAGsOctM0nva8BaiE/FeMpglDepGrbDuPGS3kDRSGTdijCPTX0Vm2/B
         PUK0kXyyGuxEr0pZ4zeewK09XI+zlEy5VipyarvnQ2KO5ubV8cJ69ddYrhCnbzrb1uuX
         yNLvPrl54gMw7sBcB13a2qryZXPNz+dpX5hSthoekwRsEJ7LXZXCFec+dockf32tP68j
         p4r7UEMPmryBflQ+uN4YOB+YOPqLluYoUicWbiHqd5gv8ck42MhYu5g/PyhaLnuHXknk
         DT9tPZnfy6d/QlcMu2X6KycRizAlOrT36/UqzNufEos9M2Dpib0An2Gl7vfsPYS6JqrT
         bVpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y+Zd42k1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g63si7659345qkf.71.2019.06.11.04.46.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:47:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y+Zd42k1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hafEx-0002CV-I4
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39576)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQN-0007Xp-7Z
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQK-0007qB-GQ
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:43 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:53199)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQK-0007hL-3O
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:40 -0400
Received: by mail-wm1-x344.google.com with SMTP id s3so2439859wms.2
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OdD7ugR/BLvUdOtU43yNG5jqeDwBZd2sqvJMrpioEU0=;
 b=Y+Zd42k13VSc4UQ12TONhB2KWeELhzVPKxx7wJ74+r2TQ2UqNKsLcUq/FePrO6InZC
 x5+SlDtddq4Drbg06sOlTbxg1DJNgOBxft2Op4nEf2t///pwdrTNVJdn53D9Pt2fCAbu
 r/9NuFhkIa5NWqKH9toW9mnW2BxTpQd5/UcYpvmkT3zbixLIj7Tm3U0mnv6cREeCAROz
 8WM8ZPVVwbZPTuqoVlg9YSG1jJ0C1Vfm4jWP50W/DlhHRApGQWiq7G6Qom5bYIvQ+XYa
 SOBSs4h8oOk9hqTWuv4Jv45zOeVNOMZ8EiQsQH3fte7U4HeD+kAiSS9Ab3lhapI7sjYM
 b5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OdD7ugR/BLvUdOtU43yNG5jqeDwBZd2sqvJMrpioEU0=;
 b=cmbxBE3aaWQ6XgZ1FNlvJrrJYu7M5bd3lhLbNZYjFEXQUbvzz6x2JLHbIGhBA5FMGT
 PF99jMPreVI7f2WzAeZXXbB9B9x//Tm/3s7dR9AR6EUTpZcy5k3vL9NnKmEJLHIDTFj6
 +FwonefIqv6X5j3QFWkh1JNHtvNdOhcm3BPKnVwOZl7P8AC1bxzePpoqUm0VGR3ekKLZ
 yrxPf8DuD+h53oi7f6fQmywry/92stXycx1V1KZPJnAGAyhiyJLWT9SxvynTp1WlCtDU
 iNQ5w8UWJ1BmwpD3VAcCdoqGp36bVKwJVzSxWyGdoXNE6NnZmPiYBvBEUP85C2CT0iv5
 WydA==
X-Gm-Message-State: APjAAAXSzAY/uRHBILz1i9Qe8sppDiG3Bu0FTybStpEaGlzJGa7FqCMC
 deBNhtO1ZA4ks8Y7Zj41mLmubnKIWwY5CA==
X-Received: by 2002:a1c:f001:: with SMTP id a1mr18329492wmb.130.1560250468231; 
 Tue, 11 Jun 2019 03:54:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:41 +0100
Message-Id: <20190611105351.9871-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-arm] [PATCH v2 32/42] target/arm: Convert VMOV (register) to
 decodetree
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
X-TUID: Y3HpIbQs0/yS

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index ce805f0ab28..ad723466b18 100644
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

