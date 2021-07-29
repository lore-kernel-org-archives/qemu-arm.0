Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5561320lfc;
        Thu, 29 Jul 2021 04:51:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDMXkFJdc2aeL1y1wzb8Z1VApgUbAURGyAntH3Qy/tdUmP0xp1upI0TiEsk+qiCtn9Q0PR
X-Received: by 2002:a37:a004:: with SMTP id j4mr4715408qke.499.1627559484886;
        Thu, 29 Jul 2021 04:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627559484; cv=none;
        d=google.com; s=arc-20160816;
        b=M7jmMq2QXPAMgj8729aZkg1VxRHI7mlV2XTZjk9hXV0C44ZNz7jXnop2wYuNWX4kKL
         LR+ME9IZZ3UypomkBJKPaCvY8o2tsTqBNQeXYR/NAjAvi3E1tRey558KJzpv7Xnludmj
         5H7JPjlypM/i9oooSrQPnf9RN+HKbz8Q2NCoiuDsxpv47wqo3OMGk2ddgPx+YTdJZ7wG
         Ig/Nq1zbsLF2KWRgAFIDvzYZJ6yJdXef6iHmR3B4u64MvjVwhFCmZ4nffa7aeJhaa71F
         TYI5XIdWHIb2csIlzSyCb3TSM/eabbPeXaNRV8TcLrK0mZwVcRncf2vyPsqEPqV6tseP
         1eNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1vyQ0Oi0tEEGDv6NXEcKRepnjPjEniiaL2/Am2D+bJo=;
        b=M+ERt5sZawvkFAzDnpQbnuBaY4LEB5weS/ZztL7X8cyf7ONL1NRDM1SKTTNxpqQqMB
         ijacA6Wp4NmFN/pb3GbGs7xhhuRQCHX5ldzGc0olOmpQWlKkNdURbxJvW/vjiNXCBLij
         Aiqpe3C2WTJXX/lr2KaL/q9i409+hv1A04pk6HSiOHh7jY7bDRSwQqizyBwwLPF8icmN
         6B6B68r2TxpWoU5n3PRiO4ZejQAIo3K1PPYFgmKvS71GL/HpAVflTQ885/ul8WvJB4Jg
         w6g5fuAnZVMJHM419qoUciPHfCMxtXjAeWtMYzlQvselQrjos7hCMePk9fzaAl85rIf0
         jkwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=akpBwRVP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21si1756161qtr.335.2021.07.29.04.51.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:51:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=akpBwRVP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m94ZQ-0005Tj-7B
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941f-0001ZJ-1u
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:16:31 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941A-0001UA-73
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:16:30 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so3761436wmg.4
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1vyQ0Oi0tEEGDv6NXEcKRepnjPjEniiaL2/Am2D+bJo=;
 b=akpBwRVPr3gGW5KI3ngUEkfu4smdkEL3E56ASLfC4ANOOyWmmv+6IZvd5xqz7ZDi1u
 knLbCE/eqgYHwpYk1vQibjDPeiTbcFq3OB8aAwO01q3PEs1qiemIwh+tuDJQWJUdYco7
 QKIEqta69hcIGoLy6TgIWZnUs5oDWES/yyXr1B7mcZldHyW66ydkZDYJP888FDBrYoHE
 RfUuOpz66YFRfhM30/1jMCH6l/R33YmTEslDUStaNKOdaQ2tnHl8iT9Jc/lfN2Qyq4Vk
 +eXJzRa72jmXD04xUje1FQo9vpzSSTVNGwi6NPijFKRhziQT4gF3YkEw/Gb0l8Qibdye
 64YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1vyQ0Oi0tEEGDv6NXEcKRepnjPjEniiaL2/Am2D+bJo=;
 b=sMAtvNZPT9cLJ5XFUzYXuOnNrpLJIo27luDbtfbc4jMzoZRwrMoHTlE02EZEnK4442
 GWeRGAGY3IoUSHqUy3D8pqAPdG0Mlx4mMNM6XH5xyer45cNKvGBhXcnThFGifiFWOWJY
 hu7nm+0tb6K4L9lk0gBIk2NfDA88U7AvNkLZ7MzcZdB+Xw+rlV05YJ3ZMeKYI7rHCvQA
 liJ7GhFmZ21Q8hRFfYMRxGorIq+lDCJf0uyLwekl4uBjSLCOTjU7Z6XARN9HQhkur+Se
 KQf7+B/l4IYKwbs/rA2kHhw7EkHEuUBoh1HQsF/Ddk2S9IMValf8jKqK6kO4XCsLusCi
 zowg==
X-Gm-Message-State: AOAM531tW6AFJgmBeR8Xuf8AJrbnPwzjR3GbgelFK/JAWcI2pJ3iFz4c
 ApUMLRmWmuLRLr63lW2GekCy9YP99V2C4Q==
X-Received: by 2002:a1c:238e:: with SMTP id j136mr4273639wmj.91.1627557355681; 
 Thu, 29 Jul 2021 04:15:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 49/53] target/arm: Implement MVE VCVT between fp and
 integer
Date: Thu, 29 Jul 2021 12:15:08 +0100
Message-Id: <20210729111512.16541-50-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b5vea/sqPng/

Implement the MVE "VCVT (between floating-point and integer)" insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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

