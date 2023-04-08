Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp649795ejb;
        Fri, 7 Apr 2023 19:46:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yb7qlRx8UUKL6PvXi2OLsIn0aMy+KeCT9UWLCCfmFMi5Iac8SGdd0OboOAXAywRPm7ZLG+
X-Received: by 2002:a05:6214:124c:b0:5bf:ba9d:8726 with SMTP id r12-20020a056214124c00b005bfba9d8726mr7857236qvv.10.1680921996646;
        Fri, 07 Apr 2023 19:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680921996; cv=none;
        d=google.com; s=arc-20160816;
        b=c4LdIWE+2bsmPsPxj63Qg/Z/N/LMSslDxEtciWNX1Us4IAjtgKedAo4XbTMzrfUf0e
         NjEM1cmHLTTEJkDLk4FR+oQFj14Ptm7rjirO1B6p5pdnzP4P/VejrdlgIsTwQ6WjVnpx
         Jp7X1fbS0dDk6AJ69N827UrswUgFSm/90JKOrCL+Y+Z0PnkHts+KDDKGr3mWAr64XSR6
         F+IF0HAS6nfiuD+8rjsHIdTUZVI/UTe5ixTEjTx2h9ShMFDlEqskO7LzGFIxx//zbXr8
         H5hmv1PmClEcmEDZyVheLKnqRw3Xr3KFJRdDdNKs+HK8bP6A58UUbIPqZHBCBKc2wvoy
         GiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h7T6BCs08xsWhjirpyWfdNuX6EmPKpgX+sbsQPFTCEs=;
        b=zjCLtUuvuXzEabpxuRPvgaa3cZaGOKnIpep+sdZFG3qWDsMu2SSJIeN0wmShNjRznr
         9W7KXDiY4aYrkQwXDo/AVkDaFKZtOHSrS5aD+uA0VbxWq/KHDLET+vIa067/wvjWMc8I
         rLIM+2GnN0UF2unE4YXAp1f3WMQl3G08OcQ2klhOMPi1ZG/fuexqkrfjOs0cXplnaLmT
         UA0UCPMfcGXz2cCwi+VZ6lRWMQeXDTzfPcf3pv66WWduJ5UZwhYmqDboBv9yfoDDNP8S
         reqaUtzkRMxIrEP6KYu1pyEtt7IozJlwfal6pp5h7nELSGT75zE4GxkSGR2WY5RnykQT
         ZzBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nGQX48TJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu15-20020ad45ccf000000b0056ebfdbf220si3814707qvb.184.2023.04.07.19.46.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:46:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nGQX48TJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkyZS-0001VE-IF; Fri, 07 Apr 2023 22:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyZA-00009R-MI
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:37 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYZ-0005cU-I4
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:36 -0400
Received: by mail-pj1-x1029.google.com with SMTP id c3so664300pjg.1
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7T6BCs08xsWhjirpyWfdNuX6EmPKpgX+sbsQPFTCEs=;
 b=nGQX48TJNDiSuqHWv/0uj7cUucF5+Ija8/ftVm6no7sbUp58zURB2Je8Yy01TsVkt1
 x+O4q01fLFWNYUXJFoPY7oOKNovS9kATa3fSegfq3a5128YveroaXiPa2iM3yzIs3Hum
 Ry8SIHnXDSvQaBH9BaNFs/FtKX3TSgdrb3SJKihxJ2ETZOev/4XQMedwEsrTMaolQWYD
 3CICSfy73NFZqYWDv/07INJ2qkinHqUSjdk7MOPuiOaCr+K2vlyNa5OdZ0xC0jK+cV7j
 96chaS/kJv1j5kGRxN1cBsdtX9cM8fe4ep8tx39MxER2URd9ZsZynjhLfMWeDadfRK4e
 ma2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7T6BCs08xsWhjirpyWfdNuX6EmPKpgX+sbsQPFTCEs=;
 b=QZ6CsxOTB8i2lKNyqms9dqMR2r14axa5Oveot5uD9OKdvw1n+PE9w2VU9El6wkjgJP
 4fpzbjNUOBg3aPG2qI7gSomNR/cFOAkz1fg/m/wzLWCDN/yDumPGCgtnu8QWCJ79fRbO
 Gc+0YFclYeVb1jgxXdW2d98Nh5+re8t8SOcBQokRXc7AivpoY8z1VlDsAmjrVl7RUSW8
 VpMUXaNK6FJHP5G0ypnogfIL5aTNtxMLtmJpB8RCE1jknHJyZChfVv3ifQZNt2F+4UmH
 vIcGZBVT1vGAaWb7r4CkgVnpsvRyE0YaNkqoMchiRApEqRSl6YKT+Ktk28twTh9dh+Fp
 D4wQ==
X-Gm-Message-State: AAQBX9fUulfodV+1FD0HumsGx8tmV1yPdHtJQazWdKorP25UCLWCUDw9
 MoSWtYdmD5DoI5QQDyB1LPn6GA==
X-Received: by 2002:a17:902:f213:b0:1a5:2592:89c6 with SMTP id
 m19-20020a170902f21300b001a5259289c6mr993185plc.29.1680921828586; 
 Fri, 07 Apr 2023 19:43:48 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 36/42] tcg/ppc: Adjust constraints on qemu_ld/st
Date: Fri,  7 Apr 2023 19:43:08 -0700
Message-Id: <20230408024314.3357414-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cBwPPDYdbXVB

The softmmu tlb uses TCG_REG_{TMP1,TMP2,R0}, not any of the normally
available registers.  Now that we handle overlap betwen inputs and
helper arguments, we can allow any allocatable reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-set.h | 11 ++++-------
 tcg/ppc/tcg-target-con-str.h |  2 --
 tcg/ppc/tcg-target.c.inc     | 32 ++++++++++----------------------
 3 files changed, 14 insertions(+), 31 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-set.h b/tcg/ppc/tcg-target-con-set.h
index a1a345883d..f206b29205 100644
--- a/tcg/ppc/tcg-target-con-set.h
+++ b/tcg/ppc/tcg-target-con-set.h
@@ -12,18 +12,15 @@
 C_O0_I1(r)
 C_O0_I2(r, r)
 C_O0_I2(r, ri)
-C_O0_I2(S, S)
 C_O0_I2(v, r)
-C_O0_I3(S, S, S)
+C_O0_I3(r, r, r)
 C_O0_I4(r, r, ri, ri)
-C_O0_I4(S, S, S, S)
-C_O1_I1(r, L)
+C_O0_I4(r, r, r, r)
 C_O1_I1(r, r)
 C_O1_I1(v, r)
 C_O1_I1(v, v)
 C_O1_I1(v, vr)
 C_O1_I2(r, 0, rZ)
-C_O1_I2(r, L, L)
 C_O1_I2(r, rI, ri)
 C_O1_I2(r, rI, rT)
 C_O1_I2(r, r, r)
@@ -36,7 +33,7 @@ C_O1_I2(v, v, v)
 C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, rZ, rZ)
 C_O1_I4(r, r, r, ri, ri)
-C_O2_I1(L, L, L)
-C_O2_I2(L, L, L, L)
+C_O2_I1(r, r, r)
+C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, rI, rZM, r, r)
 C_O2_I4(r, r, r, r, rI, rZM)
diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index 298ca20d5b..f3bf030bc3 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -14,8 +14,6 @@ REGS('A', 1u << TCG_REG_R3)
 REGS('B', 1u << TCG_REG_R4)
 REGS('C', 1u << TCG_REG_R5)
 REGS('D', 1u << TCG_REG_R6)
-REGS('L', ALL_QLOAD_REGS)
-REGS('S', ALL_QSTORE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 7195c0b817..dc4e88db8e 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -93,18 +93,6 @@
 #define ALL_GENERAL_REGS  0xffffffffu
 #define ALL_VECTOR_REGS   0xffffffff00000000ull
 
-#ifdef CONFIG_SOFTMMU
-#define ALL_QLOAD_REGS \
-    (ALL_GENERAL_REGS & \
-     ~((1 << TCG_REG_R3) | (1 << TCG_REG_R4) | (1 << TCG_REG_R5)))
-#define ALL_QSTORE_REGS \
-    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R3) | (1 << TCG_REG_R4) | \
-                          (1 << TCG_REG_R5) | (1 << TCG_REG_R6)))
-#else
-#define ALL_QLOAD_REGS  (ALL_GENERAL_REGS & ~(1 << TCG_REG_R3))
-#define ALL_QSTORE_REGS ALL_QLOAD_REGS
-#endif
-
 TCGPowerISA have_isa;
 static bool have_isel;
 bool have_altivec;
@@ -3780,23 +3768,23 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_qemu_ld_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O1_I1(r, L)
-                : C_O1_I2(r, L, L));
+                ? C_O1_I1(r, r)
+                : C_O1_I2(r, r, r));
 
     case INDEX_op_qemu_st_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O0_I2(S, S)
-                : C_O0_I3(S, S, S));
+                ? C_O0_I2(r, r)
+                : C_O0_I3(r, r, r));
 
     case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
-                : TARGET_LONG_BITS == 32 ? C_O2_I1(L, L, L)
-                : C_O2_I2(L, L, L, L));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r)
+                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, r)
+                : C_O2_I2(r, r, r, r));
 
     case INDEX_op_qemu_st_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(S, S)
-                : TARGET_LONG_BITS == 32 ? C_O0_I3(S, S, S)
-                : C_O0_I4(S, S, S, S));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(r, r)
+                : TARGET_LONG_BITS == 32 ? C_O0_I3(r, r, r)
+                : C_O0_I4(r, r, r, r));
 
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
-- 
2.34.1

