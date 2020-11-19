Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp753613lfb;
        Thu, 19 Nov 2020 14:02:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDM4alHiKaHf/7E1Wt10eido6r9dgS50LgZtAseZ+B6zgDLBq2x0mASDN035Xkm+UyC3gM
X-Received: by 2002:a25:d88:: with SMTP id 130mr16279935ybn.469.1605823372268;
        Thu, 19 Nov 2020 14:02:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823372; cv=none;
        d=google.com; s=arc-20160816;
        b=KrdSrBg6KaDqkOGyy8FD90+xTnEh2k5ps3eJdoYjEnWlbYLRHjJKdpfr2qp/A/0BfX
         9p8Ts7AZIp1iGl77zjH6YUgwvrjxfFy1TYue3HLnrQqT4lCa1Roucdilktx6f5UXM41Y
         j6+hn9DihU/yCg+gfAiQ5PLbzDKbGFZmq+AbiQ0UvDPWdGA8y7yJjT93TgRRZD0G5y3y
         riHIrV28Xyem1NIIaET1UKGTG7NLbKmzjJjGqWxODBDKX0HGx5T+Ys//U1IKG9gAMwgI
         D/aWNF1T1yeGO34Vlr/g80SJ/ejPYFMOSDUBNkuSptOAPpsXV2infUaRyRBCKPRmk0UL
         yVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Geuo7aDlDntl9E+BThf4Sp6VC9Xi1ojKJ4sXKRlUeWo=;
        b=H2Lp/4fBCPxP/Q7YwbRjkk4G8AJIgmKtMoNO1l5oteDm/N9L9vasFu8RwFVX1CbOUJ
         iUJjjKcw9yB05TabZm+cs/LNMGWPY73RkYa6gvrRJYWz4R5Q6mLU4SE0BzU7dHG3GOT0
         0pQ/Uky48Xe74wzrgAdwAroHALNWeYyIiT41+Lyp0ujB6i8h8Ih+c/V95w40fGk+UaL7
         smt6tXMHGkJnXaz2LxTa2P8j4lvEncv6p2Z9C2b+GH/qjQorLNvRn55rM1atKiAEeOk/
         zvOQ0ZEI/WhFAk0actPBp74m16EEdhOD6n5SNSJo4o+irl437/CRQT/CF+12OXKO0ecl
         ckIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JdH587DA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si783453ybf.138.2020.11.19.14.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:02:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JdH587DA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfs0x-0007PR-In
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrun-0000d2-Da
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:29 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrul-00048W-72
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:29 -0500
Received: by mail-wr1-x42f.google.com with SMTP id c17so7955045wrc.11
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Geuo7aDlDntl9E+BThf4Sp6VC9Xi1ojKJ4sXKRlUeWo=;
 b=JdH587DAedQ+MR5KaQmfLjoDSs7/agOQHmuT6/EJfhzf3xwW81Flu2A2OHxY/6vEGK
 vVN18Dkgbr0yVm9hNdJ3xW5KgbxKAt27xtXNje7GiCEpBByB1uZo2E+xB2yQ40UDZfKD
 kTQX9PB8f3vBdyEk4GX4nmtmwp6N63jLk++9eM5VXmIngflVEKOStewieoNvpRmjzDcM
 BCeHDEAUkjpb6/Hbh3OB/f8OITAq+CjOtdXirDCuGUw4Ypd9vr1hWI1qAew/p+uNHA6z
 fARb183/ML4PDu+9Q7e1KNh1aOh3Cknsxn+3IHLELwbQTjbw6orE8MToU9Ne0zB2Xs9F
 SCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Geuo7aDlDntl9E+BThf4Sp6VC9Xi1ojKJ4sXKRlUeWo=;
 b=eo7czMOUb6CUhViiQrBGlGuvVv4fjO9z8EG00YULajPd7bmcWyORk7BBlQiJ9I6ibE
 TZgEca5HkzaBZiZ5LRt0JJnAoOvlMpf8IlzGyP902R7pQezmHfe8vvC90+WLpXyEEZM1
 dqLz94u038yMbYFurKJqbn1yhES2gWHrDFd+qs4vurzRcbC45ehx4pLft1ztT8hDUL07
 2nDfcLa5PZAP4p7rWLar1mjNyv2sxGjea+H/Y/CjUt9aqnvbsh86VJwtcVIJjTblWn6z
 KyJpvfiYBEJZla/ax8EN7VhCPKi/HBJTE2a3IlnuKHe9JVaEe+4ArpMQNDL0YWR4JctC
 AxoA==
X-Gm-Message-State: AOAM53002tdxYJkwoNE3cDNDnwnNWyJFXw6sUZ7YLhHX7sp5UnRp6YNZ
 kNOIYFROjKAzJRTyGBzDBvHlGw==
X-Received: by 2002:a5d:4802:: with SMTP id l2mr12095180wrq.424.1605822985894; 
 Thu, 19 Nov 2020 13:56:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 05/28] target/arm: Implement CLRM instruction
Date: Thu, 19 Nov 2020 21:55:54 +0000
Message-Id: <20201119215617.29887-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /E2MEWDBwp95

In v8.1M the new CLRM instruction allows zeroing an arbitrary set of
the general-purpose registers and APSR.  Implement this.

The encoding is a subset of the LDMIA T2 encoding, using what would
be Rn=0b1111 (which UNDEFs for LDMIA).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/t32.decode  |  6 +++++-
 target/arm/translate.c | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index cfcc71bfb0a..f045eb62c84 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -609,7 +609,11 @@ UXTAB            1111 1010 0101 .... 1111 .... 10.. ....      @rrr_rot
 
 STM_t32          1110 1000 10.0 .... ................         @ldstm i=1 b=0
 STM_t32          1110 1001 00.0 .... ................         @ldstm i=0 b=1
-LDM_t32          1110 1000 10.1 .... ................         @ldstm i=1 b=0
+{
+  # Rn=15 UNDEFs for LDM; M-profile CLRM uses that encoding
+  CLRM           1110 1000 1001 1111 list:16
+  LDM_t32        1110 1000 10.1 .... ................         @ldstm i=1 b=0
+}
 LDM_t32          1110 1001 00.1 .... ................         @ldstm i=0 b=1
 
 &rfe             !extern rn w pu
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9f2b6018a21..47a1a5739c8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7968,6 +7968,44 @@ static bool trans_LDM_t16(DisasContext *s, arg_ldst_block *a)
     return do_ldm(s, a, 1);
 }
 
+static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
+{
+    int i;
+    TCGv_i32 zero;
+
+    if (!dc_isar_feature(aa32_m_sec_state, s)) {
+        return false;
+    }
+
+    if (extract32(a->list, 13, 1)) {
+        return false;
+    }
+
+    if (!a->list) {
+        /* UNPREDICTABLE; we choose to UNDEF */
+        return false;
+    }
+
+    zero = tcg_const_i32(0);
+    for (i = 0; i < 15; i++) {
+        if (extract32(a->list, i, 1)) {
+            /* Clear R[i] */
+            tcg_gen_mov_i32(cpu_R[i], zero);
+        }
+    }
+    if (extract32(a->list, 15, 1)) {
+        /*
+         * Clear APSR (by calling the MSR helper with the same argument
+         * as for "MSR APSR_nzcvqg, Rn": mask = 0b1100, SYSM=0)
+         */
+        TCGv_i32 maskreg = tcg_const_i32(0xc << 8);
+        gen_helper_v7m_msr(cpu_env, maskreg, zero);
+        tcg_temp_free_i32(maskreg);
+    }
+    tcg_temp_free_i32(zero);
+    return true;
+}
+
 /*
  * Branch, branch with link
  */
-- 
2.20.1

