Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp621175lfb;
        Thu, 26 Aug 2021 06:38:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMocvbuvWthvPNsklhcIrfm8q6p5EGhtzlu7qI9meitzmTTuYc3vL9enfO3b4EH2bKj96C
X-Received: by 2002:a17:906:168d:: with SMTP id s13mr4384279ejd.13.1629985107515;
        Thu, 26 Aug 2021 06:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629985107; cv=none;
        d=google.com; s=arc-20160816;
        b=K23o4H2z35AMsBIH37CxMM1EyVoGNKz8l+p1d0PEhpgSN1BKAIt6XXUxK5EJN9ocTY
         /Bp9QjJAn1SOFFD0zaUtvJSBbUUxtENFHeiA9lJIfEwRnhTj6vsMcvUR5lOWu04tzddC
         RLqr8vxiapRYAKh8C+5nb6uvrQCrnbEc77S4wITCnAL5NFO3N1kWCUFtKY1+pVDk6OFL
         t6bWOjc3MzM35hvlOwyMBeMoKpc+65dUaY+0Ujy1NBJF+82ouKQ/pksr4ricYqBF8myS
         Yk55iieJF+fSVR5S2B500wekr2bp8dKOTujpinBAzK+SdgxU1aCtzePTfPBhF2XgsSC/
         EHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bkuWlzNSI2yuRBQTkDjmPVrmm9Ffu+LTHOZ/atHURyg=;
        b=nbmtluWZ5rpwiy8zxY150lHuD1gVJTwypZUKn/D6FPTBqpCGCgQ3XlElUZ0YCsaq9Q
         QWaH5iAd3HT/1iTpaCx+c5m+semFjHhAlZKw8YwB4EYP10weNEuaKqypWCd570MqdcO9
         XdQYFu6QgvrQdCituOI4VX5MLg/y+Xh96yFvU1hyQvNr8yrlvNCQZbjfsHgTVsTXUgU3
         33sAe5akjcRq15Yan1rQdNMy2x9futhpkcEwe08Y0RZ0sLVlrmoSv0HX2G7Tvceld2S5
         acb6uC9nXUusnOY9803UH4dmTEmTaIhQmQir3q1uT1v0gWA1SL5j71r5h6vKmyGoVtJW
         JelQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QSyyflhO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j61si3478770edc.343.2021.08.26.06.38.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 06:38:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QSyyflhO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJFaM-0004kT-KI
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 09:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGM-0005qQ-J2
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:17:47 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGI-00055f-0g
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:17:46 -0400
Received: by mail-wr1-x429.google.com with SMTP id h4so5016677wro.7
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 06:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bkuWlzNSI2yuRBQTkDjmPVrmm9Ffu+LTHOZ/atHURyg=;
 b=QSyyflhOUYN+l/ld38/IqEv7jqYjFUWX2aeYLRBAtZ2fB3xY5sBO5lRo7l6AK7rp9/
 q3T3E7JZlkm4GJH8piQy7INyod3dxfSt7cB057PTFOF16Ku6Sq+cXaRahFlrm55TcJa4
 nnJt7y6PesfZDyKDCa9ccy5yl3qUpOxYWW52N0G9+PVdgbWH8Orhy8Kk5Xnu8e8p7SCJ
 4BQ1q2etgIDpxAziEWYOn+t6Uq/E9ZoISjL0o047piny3lzvyOMzvaLJv8q/7N5HVo1i
 j70hKlaEfEUo4Ve/WPCdMCsnp8+4LSrNENFeyb9z8igAPyx3L6OMo5OqvIRE6JCGJluo
 sv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bkuWlzNSI2yuRBQTkDjmPVrmm9Ffu+LTHOZ/atHURyg=;
 b=pR1FsE60t6FDTmTOC34iRKefRDiXAXMYtZvdgJmL1qrhwARQVGqIP6F62ztb77+Tul
 ffFV67nuVYL1tHG5BbJOvmrIT7vz3kF5viy4gBp8057YrLd5vWJ8iMz1PW3cZKsVp1+i
 YWo2xVkHk25nY6fnps5w7Rvy8mnkp57lpVI411C0pq0YL5oSG2LX6udME6m8GC8Il/QL
 NdyaV562g4gKPZrAhpBllH7f4Y5stQ2CE5+Kp34dGqd6QFY2XQnBR1F7C6klhSTT6Cv8
 EZ3VdTvtEswVfD5HLY3ahnZuw6WikGSRdtKhPSLJcus5Bah25kVVGMCtQrJaH0bAV9w1
 R0mw==
X-Gm-Message-State: AOAM533Iux4dnkMaDInsqfcuqI8Rt3ltJ0L+qCJvk00fi9u0VeedDmm7
 /QGps7E5/lcYSwcqyT3NMMWXvXkTOJIcJg==
X-Received: by 2002:a5d:51ca:: with SMTP id n10mr3876460wrv.119.1629983859042; 
 Thu, 26 Aug 2021 06:17:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 14/18] target/arm: Implement MVE VCVT between fp and integer
Date: Thu, 26 Aug 2021 14:17:21 +0100
Message-Id: <20210826131725.22449-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hQk8lX79x/Pi

Implement the MVE "VCVT (between floating-point and integer)" insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve.decode      |  7 +++++++
 target/arm/translate-mve.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index d9fcc42d36d..9a40ff9f43c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -790,3 +790,10 @@ VCVT_UF_fixed     1111 1111 1 . ...... ... 0 11 . 0 01 . 1 ... 0 @vcvt
 
 VCVT_FS_fixed     1110 1111 1 . ...... ... 0 11 . 1 01 . 1 ... 0 @vcvt
 VCVT_FU_fixed     1111 1111 1 . ...... ... 0 11 . 1 01 . 1 ... 0 @vcvt
+
+# VCVT between floating point and integer (halfprec and single);
+# VCVT_<from><to>, S = signed int, U = unsigned int, F = float
+VCVT_SF           1111 1111 1 . 11 .. 11 ... 0 011 00 1 . 0 ... 0 @1op
+VCVT_UF           1111 1111 1 . 11 .. 11 ... 0 011 01 1 . 0 ... 0 @1op
+VCVT_FS           1111 1111 1 . 11 .. 11 ... 0 011 10 1 . 0 ... 0 @1op
+VCVT_FU           1111 1111 1 . 11 .. 11 ... 0 011 11 1 . 0 ... 0 @1op
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 9269dbc3324..351033af1ec 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -543,6 +543,38 @@ DO_1OP(VQNEG, vqneg)
 DO_1OP(VMAXA, vmaxa)
 DO_1OP(VMINA, vmina)
 
+/*
+ * For simple float/int conversions we use the fixed-point
+ * conversion helpers with a zero shift count
+ */
+#define DO_VCVT(INSN, HFN, SFN)                                         \
+    static void gen_##INSN##h(TCGv_ptr env, TCGv_ptr qd, TCGv_ptr qm)   \
+    {                                                                   \
+        gen_helper_mve_##HFN(env, qd, qm, tcg_constant_i32(0));         \
+    }                                                                   \
+    static void gen_##INSN##s(TCGv_ptr env, TCGv_ptr qd, TCGv_ptr qm)   \
+    {                                                                   \
+        gen_helper_mve_##SFN(env, qd, qm, tcg_constant_i32(0));         \
+    }                                                                   \
+    static bool trans_##INSN(DisasContext *s, arg_1op *a)               \
+    {                                                                   \
+        static MVEGenOneOpFn * const fns[] = {                          \
+            NULL,                                                       \
+            gen_##INSN##h,                                              \
+            gen_##INSN##s,                                              \
+            NULL,                                                       \
+        };                                                              \
+        if (!dc_isar_feature(aa32_mve_fp, s)) {                         \
+            return false;                                               \
+        }                                                               \
+        return do_1op(s, a, fns[a->size]);                              \
+    }
+
+DO_VCVT(VCVT_SF, vcvt_sh, vcvt_sf)
+DO_VCVT(VCVT_UF, vcvt_uh, vcvt_uf)
+DO_VCVT(VCVT_FS, vcvt_hs, vcvt_fs)
+DO_VCVT(VCVT_FU, vcvt_hu, vcvt_fu)
+
 /* Narrowing moves: only size 0 and 1 are valid */
 #define DO_VMOVN(INSN, FN) \
     static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
-- 
2.20.1

