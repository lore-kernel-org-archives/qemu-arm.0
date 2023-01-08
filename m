Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1328300ejc;
        Sat, 7 Jan 2023 18:47:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsbEvRlfUJOOSUAifV6jO7yvCT9FogKT+SzG56gY1Aq/8CG6TIvdiu/jNDJ7NexYGU2w+Fp
X-Received: by 2002:a05:6214:90c:b0:531:86b7:41d1 with SMTP id dj12-20020a056214090c00b0053186b741d1mr56988433qvb.8.1673146059761;
        Sat, 07 Jan 2023 18:47:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673146059; cv=none;
        d=google.com; s=arc-20160816;
        b=gM8YMt3isdoUAzm4Ukh1BfFteA27n88pG3JxfVI16yp7MNHy46zTwtxJxROGrFte2e
         d8JDcosPg2EZULqteBEFWIR+LgpHpABbwiaKr+UoGi7mkSMF9h94xYlU5s9d6p1y2tCz
         AP6oKR9VWXzPwsG1pgls0ev5Yf3Drm01kBXmyRoElImc8jCggKiQyG+FslwerI0p3npS
         FxyYMSMkStgWVj/TwIQl8uBuQs4gJR/TyKOXaEvxVLiR2Idj2BGXuo9vZlTLxTAW3Q5X
         0cmCv7fdB1Tfl6aJyIwcwt1fdQblcq7is+RiTExBCyD0pvMKH2+AgnCmo0SwS9dU7N/a
         q2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SYNYnzLrz9KCAUVy04IP4XZxPYGmUgBISTp436OAjA8=;
        b=zYFxhB0qpEf4S7wGLRZMDxGIZzp4rf4M1xbtoU8zVF/8VYuAYM1o5oe1fqjZm13YQb
         VKWkX3PXDTimTSOizTdjgzO3//WZYI2ecNBbMgeJtbiIERBedMe7q3/zM7X9off+2c5n
         syIVcss+v8yStBOMTfv6F89Bjsc8hdTPovhJd/qHOLPWrTFtBQXu6UWVweJJ79WnEoow
         01TiVvJVzzsYozNEYjN588/7Dpjwl5fM5nj1a8NFnfKg6XL8hhHPcyfInrMCyQsqs6E7
         w+ditmfacKAs4ry2OJAS64PoRcEUsIFqlZL8P4ejceP2P6dqIaRT1DgX5da0YYuMfwkK
         BQ0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i0jDnogA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9-20020a0562141bc900b00531e1430b8bsi2737220qvc.583.2023.01.07.18.47.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Jan 2023 18:47:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i0jDnogA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pELZX-00052R-63; Sat, 07 Jan 2023 21:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZS-0004yb-MY
 for qemu-arm@nongnu.org; Sat, 07 Jan 2023 21:38:02 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZ0-0004VG-Vk
 for qemu-arm@nongnu.org; Sat, 07 Jan 2023 21:38:02 -0500
Received: by mail-pl1-x62f.google.com with SMTP id p24so5852183plw.11
 for <qemu-arm@nongnu.org>; Sat, 07 Jan 2023 18:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SYNYnzLrz9KCAUVy04IP4XZxPYGmUgBISTp436OAjA8=;
 b=i0jDnogA64Due9yw/UDbb1XKEp/8G1rQe0SaHxorUsaF11wfqxf2D78zX4+c/iSkpe
 U2HuRf9lbbYpXQuhKEi5e/JeCsqXyGYToOUNjJcGEoREWs4zSkQqYDhJuQRGQBLyuhTP
 sWvzK5Pu0m9nLIC5JBUvT2hQHnGMQ38bKUqB6ZbZrehHaB/Ok9Sn0Xe9D0vYRWlWloqL
 WO8zGyrhSrCDg2dqR167owWWUoSQ174hORLN2nETjlm9l7MTxDsyqfQ/MYgLyN4OHyV0
 ewSwS25qCpIa5sFWzv6JSzUfrsuvstTsFB6U0t40mB/mc6AXLARQmI2U6gJZ3wguXdEf
 ea3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SYNYnzLrz9KCAUVy04IP4XZxPYGmUgBISTp436OAjA8=;
 b=RinXN+bnm1cr9Bo2GJ/gfOObwXFUY5uUlSq+WJeyfbBXD7EEm4qWqKPKy0TGBrEe0F
 J5oZuYzXR5NHAMQBaBY+SMFKNfKhqxyMX7ZZ59rhu7DxvhqwQ+BPTKpLqE4Rm1Xs9VF0
 65FhB8GUl3D1jgbHuyEX8pppPjDuoiBR/JRhGKyc4FVTo661boUH2R1+MrCpWd4rmxz0
 5aHw8KZ+eYYZXPeQq3phhLOtkBLmnpZja1TSr+lrab32V8+FPSt9w0q182tLZz9KgD9g
 8ien2nWqqyJmEqLrgZPQZiHz4tYFIVvCevCiRWjTSxat62PLrB0/47Lw3Z5PsyZK/Yiu
 9sNg==
X-Gm-Message-State: AFqh2kpqic/wi7g4hHLJWACIyJw6xunJQGpvNynZzT03S8aHRhJIJ6KA
 GC1EXgl5hT4fUp7Of9ZEQe6I/k8cMQvq5k43
X-Received: by 2002:a05:6a20:320e:b0:b5:6ebf:754c with SMTP id
 y14-20020a056a20320e00b000b56ebf754cmr12336057pzc.37.1673145454134; 
 Sat, 07 Jan 2023 18:37:34 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v4 12/36] tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128
Date: Sat,  7 Jan 2023 18:36:55 -0800
Message-Id: <20230108023719.2466341-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: LXfhUZ4BrQmp

Fill in the parameters for the host ABI for Int128 for
those backends which require no extra modification.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     | 2 ++
 tcg/arm/tcg-target.h         | 2 ++
 tcg/loongarch64/tcg-target.h | 2 ++
 tcg/mips/tcg-target.h        | 2 ++
 tcg/riscv/tcg-target.h       | 3 +++
 tcg/s390x/tcg-target.h       | 2 ++
 tcg/sparc64/tcg-target.h     | 2 ++
 tcg/tcg.c                    | 6 +++---
 tcg/ppc/tcg-target.c.inc     | 3 +++
 9 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 413a5410c5..0253e226d1 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -54,6 +54,8 @@ typedef enum {
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 /* optional instructions */
 #define TCG_TARGET_HAS_div_i32          1
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index b7843d2d54..6613d3d791 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -91,6 +91,8 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_CALL_STACK_OFFSET	0
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_EVEN
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_BY_REF
 
 /* optional instructions */
 #define TCG_TARGET_HAS_ext8s_i32        1
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index e5f7a1f09d..9d0db8fdfe 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -95,6 +95,8 @@ typedef enum {
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 /* optional instructions */
 #define TCG_TARGET_HAS_movcond_i32      0
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 15721c3e42..b235cba8ba 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -89,6 +89,8 @@ typedef enum {
 # define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_NORMAL
 #endif
 #define TCG_TARGET_CALL_ARG_I32       TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128      TCG_CALL_ARG_EVEN
+#define TCG_TARGET_CALL_RET_I128      TCG_CALL_RET_NORMAL
 
 /* MOVN/MOVZ instructions detection */
 #if (defined(__mips_isa_rev) && (__mips_isa_rev >= 1)) || \
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 232537ccea..d61ca902d3 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -85,9 +85,12 @@ typedef enum {
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #if TCG_TARGET_REG_BITS == 32
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_EVEN
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
 #else
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
 #endif
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 /* optional instructions */
 #define TCG_TARGET_HAS_movcond_i32      0
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 22d70d431b..aca22efeb8 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -168,6 +168,8 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_CALL_STACK_OFFSET	160
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_EXTEND
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_BY_REF
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_BY_REF
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP   1
 
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index 0044ac8d78..53cfa843da 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -73,6 +73,8 @@ typedef enum {
 #define TCG_TARGET_CALL_STACK_OFFSET    (128 + 6*8 + TCG_TARGET_STACK_BIAS)
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_EXTEND
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 #if defined(__VIS__) && __VIS__ >= 0x300
 #define use_vis3_instructions  1
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 6f72d4157a..e9bb1f329f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -744,8 +744,8 @@ static void init_call_layout(TCGHelperInfo *info)
         break;
     case dh_typecode_i128:
         info->nr_out = 128 / TCG_TARGET_REG_BITS;
-        info->out_kind = TCG_CALL_RET_NORMAL; /* TODO */
-        switch (/* TODO */ TCG_CALL_RET_NORMAL) {
+        info->out_kind = TCG_TARGET_CALL_RET_I128;
+        switch (TCG_TARGET_CALL_RET_I128) {
         case TCG_CALL_RET_NORMAL:
             /* Query the last register now to trigger any assert early. */
             tcg_target_call_oarg_reg(info->out_kind, info->nr_out - 1);
@@ -833,7 +833,7 @@ static void init_call_layout(TCGHelperInfo *info)
             break;
 
         case TCG_TYPE_I128:
-            switch (/* TODO */ TCG_CALL_ARG_NORMAL) {
+            switch (TCG_TARGET_CALL_ARG_I128) {
             case TCG_CALL_ARG_EVEN:
                 layout_arg_even(&cum);
                 /* fall through */
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index d31e6c3de4..38d6e2ed21 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -54,6 +54,9 @@
 #else
 # define TCG_TARGET_CALL_ARG_I64   TCG_CALL_ARG_NORMAL
 #endif
+/* Note sysv arg alignment applies only to 2-word types, not more. */
+#define TCG_TARGET_CALL_ARG_I128   TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_RET_I128   TCG_CALL_RET_NORMAL
 
 /* For some memory operations, we need a scratch that isn't R0.  For the AIX
    calling convention, we can re-use the TOC register since we'll be reloading
-- 
2.34.1

