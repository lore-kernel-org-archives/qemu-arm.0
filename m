Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp547384lfb;
        Fri, 15 May 2020 07:21:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYViMh1Rjcd6N8evE+7DPXKAlfaiw4+vXJ2XmBhZJSj8COwSgzhUGvVoKmj+0+IAZE0dm2
X-Received: by 2002:a0c:f485:: with SMTP id i5mr3783368qvm.144.1589552476204;
        Fri, 15 May 2020 07:21:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589552476; cv=none;
        d=google.com; s=arc-20160816;
        b=Mn95MdR2r5nQBUP+3PtAL7HupB7L3xEScFS4cSWDwu+B44cKVjTwufb2X28oPfWT1s
         T5UtSaC8WS4Xx9mm8oDmtBhgTPQW3cMpKCymq1RK2q+faupu7I5JU6ufxP+lQe2g7P2V
         C5YdPoQpvMiLFNbwJuA8abRiOH5UH+dNa2DwhDvfX4e06paG3kfL9ZtAOnhe8mGtv4gp
         FKVCKMBNMiJc5qdjyszTaaeVc8vCfZkfyN8OBcArcJNQjz/CmBCHH/kQySz0QW20RTYU
         iuDhdxLHPL8C+rLQ98ZQl7mHV9wxr+5TuuEgiDDmhwB/PjbsKWjmzBsCfU19wVr0Q5Jm
         WUWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=17miaZnAVR6c8E+5NalM9aupFX47F8Zsgz/tNLlnYGE=;
        b=iKayh0vA+I4hEGF4TwiFO9OgRdOCNbvYJU6fwPMlbUKHTR2TF3BGjnxFTkPdb29jY7
         FrhGiFdlM+S/mIXe19MYrjmoYLUJ9QoD+FLmbRMR5ln3ClrSICZooNcRCHCNKqHz8bgg
         B2RJrlaK1SxTyBlVXH32y/O2hJyMFR4XZ4JGpQN8IuFDWmcRJyH9j4g+q1xLXF3DiLuC
         iWs+W4d5C24XuImdyWfXwWQ+z3RJu2DCU1XTnzIUUqWcG7vnfq7ufV9o78YoVJ7mLoEd
         he/e49sLAwdNGkoYj/CsuRy2fmkWIKAzMNmbzdcJY2s8tiVGsanayN6F8n7gbf/x834E
         Rh6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D0deTJfL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d51si1268714qtc.364.2020.05.15.07.21.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 07:21:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D0deTJfL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZbD9-0000ko-8k
	for alex.bennee@linaro.org; Fri, 15 May 2020 10:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZbCy-0000f5-7B
 for qemu-arm@nongnu.org; Fri, 15 May 2020 10:21:04 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:47012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZbCw-0003rr-O8
 for qemu-arm@nongnu.org; Fri, 15 May 2020 10:21:03 -0400
Received: by mail-wr1-x442.google.com with SMTP id w7so3705570wre.13
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 07:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=17miaZnAVR6c8E+5NalM9aupFX47F8Zsgz/tNLlnYGE=;
 b=D0deTJfLmgHltI/6u5Nua2Vfio85SFd+D8DvqxMP5X0NmioFo/1fy4SUyj3hCOZALO
 nsBC0yFREmmff7lkOcY3z8LqrUzHTuiCvsSZtDd+DJ9aRLoub+VdocB9wAWk24mrghtG
 8+h+KBBj5Scm7ti6za1YZAiANvLIyTkrUV5MK3fzRBm92yJuwXkU8ysCOIFYZASEto7j
 a3MaJCEijnBgwFF7HhwzyYcFPTd1lkamyE1a1lwVuMyMTHfK+QFCMWC0xDuHPUaxiiEL
 8UAZ3byOKvn5wR/Jte15lnyPhN/a8lD3cWgSyrP5Us4a9J5s8soP4yjtKxB8/qWFdCmj
 lAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=17miaZnAVR6c8E+5NalM9aupFX47F8Zsgz/tNLlnYGE=;
 b=X150MArlbzQsuRo7jxcIXX6++PWS9wQ2s1uMkQsaX2b1lqOFDB1coq7pRpP/vrJyoo
 9vEos9rewiuVFn6poOOGrbKSh5Cc8MNxH16ISQXN9S57LxI4GBtpNmVppEHg+SreOt26
 +Ao469663fiXIAV8r4+q07zT+sffpt34Nwy7npbFba5JbIXtRWEhyhxBDtEaidcOCBuJ
 TlN66SOED7AxNUptaRaps4qVt23f1orsGNsQUSd4OgvYtUlDlFRjBAwI7KFoHnhd5oPQ
 kA85MM3BGKhX2k9mtcA7gwKFeootc/TCRXHb68SAOeI4f1WdU2aURKOKPu3kvRV3opN4
 oIIQ==
X-Gm-Message-State: AOAM533lGQ3TG1m7hhMdDVFBEyVFwWzgslfJyZmx6oOf/5d3pUE6/aGb
 DIe5g/FZ2LlJeDOiIQoayNOVM8uQcDprjw==
X-Received: by 2002:a5d:522d:: with SMTP id i13mr4642896wra.306.1589552460990; 
 Fri, 15 May 2020 07:21:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s14sm3738327wmh.18.2020.05.15.07.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 07:21:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/10] target/arm: Convert Neon VSHL and VSLI 2-reg-shift insn
 to decodetree
Date: Fri, 15 May 2020 15:20:48 +0100
Message-Id: <20200515142056.21346-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515142056.21346-1-peter.maydell@linaro.org>
References: <20200515142056.21346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: 2dltLuhjHrez

Convert the VSHL and VSLI insns from the Neon 2-registers-and-a-shift
group to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       | 27 +++++++++++++++++++++++
 target/arm/translate-neon.inc.c | 38 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 18 +++++++---------
 3 files changed, 73 insertions(+), 10 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 8beb1db768b..df7b4798a5a 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -199,3 +199,30 @@ VRECPS_fp_3s     1111 001 0 0 . 0 . .... .... 1111 ... 1 .... @3same_fp
 VRSQRTS_fp_3s    1111 001 0 0 . 1 . .... .... 1111 ... 1 .... @3same_fp
 VMAXNM_fp_3s     1111 001 1 0 . 0 . .... .... 1111 ... 1 .... @3same_fp
 VMINNM_fp_3s     1111 001 1 0 . 1 . .... .... 1111 ... 1 .... @3same_fp
+
+######################################################################
+# 2-reg-and-shift grouping:
+# 1111 001 U 1 D immH:3 immL:3 Vd:4 opc:4 L Q M 1 Vm:4
+######################################################################
+&2reg_shift vm vd q shift size
+
+@2reg_shift      .... ... . . . ...... .... .... . q:1 . . .... \
+                 &2reg_shift vm=%vm_dp vd=%vd_dp
+
+VSHL_2sh         1111 001 0 1 . shift:6     .... 0101 1 . . 1 .... \
+                 @2reg_shift size=3
+VSHL_2sh         1111 001 0 1 . 1 shift:5   .... 0101 0 . . 1 .... \
+                 @2reg_shift size=2
+VSHL_2sh         1111 001 0 1 . 01 shift:4  .... 0101 0 . . 1 .... \
+                 @2reg_shift size=1
+VSHL_2sh         1111 001 0 1 . 001 shift:3 .... 0101 0 . . 1 .... \
+                 @2reg_shift size=0
+
+VSLI_2sh         1111 001 1 1 . shift:6     .... 0101 1 . . 1 .... \
+                 @2reg_shift size=3
+VSLI_2sh         1111 001 1 1 . 1 shift:5   .... 0101 0 . . 1 .... \
+                 @2reg_shift size=2
+VSLI_2sh         1111 001 1 1 . 01 shift:4  .... 0101 0 . . 1 .... \
+                 @2reg_shift size=1
+VSLI_2sh         1111 001 1 1 . 001 shift:3 .... 0101 0 . . 1 .... \
+                 @2reg_shift size=0
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 3fe65a0b080..305213fe6d9 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1310,3 +1310,41 @@ static bool do_3same_fp_pair(DisasContext *s, arg_3same *a, VFPGen3OpSPFn *fn)
 DO_3S_FP_PAIR(VPADD, gen_helper_vfp_adds)
 DO_3S_FP_PAIR(VPMAX, gen_helper_vfp_maxs)
 DO_3S_FP_PAIR(VPMIN, gen_helper_vfp_mins)
+
+static bool do_vector_2sh(DisasContext *s, arg_2reg_shift *a, GVecGen2iFn *fn)
+{
+    /* Handle a 2-reg-shift insn which can be vectorized. */
+    int vec_size = a->q ? 16 : 8;
+    int rd_ofs = neon_reg_offset(a->vd, 0);
+    int rm_ofs = neon_reg_offset(a->vm, 0);
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vm | a->vd) & a->q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fn(a->size, rd_ofs, rm_ofs, a->shift, vec_size, vec_size);
+    return true;
+}
+
+#define DO_2SH(INSN, FUNC)                                              \
+    static bool trans_##INSN##_2sh(DisasContext *s, arg_2reg_shift *a)  \
+    {                                                                   \
+        return do_vector_2sh(s, a, FUNC);                               \
+    }                                                                   \
+
+DO_2SH(VSHL, tcg_gen_gvec_shli)
+DO_2SH(VSLI, gen_gvec_sli)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c8296116d4b..d0a4a08f6d9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5294,6 +5294,14 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         if ((insn & 0x00380080) != 0) {
             /* Two registers and shift.  */
             op = (insn >> 8) & 0xf;
+
+            switch (op) {
+            case 5: /* VSHL, VSLI */
+                return 1; /* handled by decodetree */
+            default:
+                break;
+            }
+
             if (insn & (1 << 7)) {
                 /* 64-bit shift. */
                 if (op > 7) {
@@ -5387,16 +5395,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     gen_gvec_sri(size, rd_ofs, rm_ofs, shift,
                                  vec_size, vec_size);
                     return 0;
-
-                case 5: /* VSHL, VSLI */
-                    if (u) { /* VSLI */
-                        gen_gvec_sli(size, rd_ofs, rm_ofs, shift,
-                                     vec_size, vec_size);
-                    } else { /* VSHL */
-                        tcg_gen_gvec_shli(size, rd_ofs, rm_ofs, shift,
-                                          vec_size, vec_size);
-                    }
-                    return 0;
                 }
 
                 if (size == 3) {
-- 
2.20.1

