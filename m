Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1600952lff;
        Fri, 18 Jun 2021 07:14:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDLzYbkyAA8h5FPUZTx7RYlkmvxbNXeIN++tqC258TNcM9k1NrxyB+lI6mHJj9sUEo9p+/
X-Received: by 2002:a2e:9796:: with SMTP id y22mr7618537lji.435.1624025659090;
        Fri, 18 Jun 2021 07:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624025659; cv=none;
        d=google.com; s=arc-20160816;
        b=F2M0T3t89JYG+DNS13aU+w57qtjnHLZ/rMIi/1SIulF+nZuhnukSC94fiS+JdO6DxD
         AWqFxUgepl29RJdsmzPKW2E1GTK2HWDlBRO8Xhd5sUKo5hDrbYqFoyb/KZSoCDeClsNU
         OQaXlAxtQiTY+kx+07iCaTFKCWL+3KDUCx4OKV1e+vFBdltCwhWw1ukWXM8Z3vVqvg9z
         rFXKpM0aUTdrxbGNAS3qBJbs3/7EERE+yR8kwbmSHFoHz23XMHP/X7oKXo5tvLnUamg7
         7dIgJLUI1BagMssm8Da54bsEIZbDy4hVH9BOmYF8Y7O+/8xFb9t7efheYz1Ct5rLQxL6
         QfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=F9963mAn0HXp01JNVVDARECVbWpEusJQnHobNxtO4XM=;
        b=MmQFaDWbzTx4Jh99XEQe7lu/rrDb2FvkX2XlADd3Xr5hjqGujAUdQ/VQVQAH7Szawx
         3z362af9yGrXN3ew+KjIKqk5qIjlKD2VZ7fAKGttEe2WeTH4LA5jsb9BYA/bfgxmX7U9
         qZhq4U+PNSxNtQCw2lru9HxmMiBDUPCbBrpyxnVwM+p/i1MozMQXYjdxL308PSrWbW0p
         O3ebhui1e9kj2N3SVmGK7s429osemtXTzG+AJAFnprpQoaoaq9SC8Lj9RWe2w9+ZsknX
         ctE4mDdKULNxv/fSKFZbOUudx2v9ezVwmFV0NfzrBhrgH2aJ7Rw0B0UQv+SXYBkQTMVP
         aQzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X2asAge8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y23si11769509lfk.517.2021.06.18.07.14.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 07:14:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X2asAge8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1luFGE-0004nz-2z
	for alex.bennee@linaro.org; Fri, 18 Jun 2021 10:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCg-0007WF-Kr
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 10:10:39 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCU-0001wJ-0F
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 10:10:38 -0400
Received: by mail-wm1-x333.google.com with SMTP id k42so3870003wms.0
 for <qemu-arm@nongnu.org>; Fri, 18 Jun 2021 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F9963mAn0HXp01JNVVDARECVbWpEusJQnHobNxtO4XM=;
 b=X2asAge8fEBRpJXityfVMz196fb0GRmTKIXzormOwSqi5rxJmr3lbPXnYymc9R0Xmc
 YuhsAibVzeaTL9D49jZFu3mNRv3XnC/adX25e3GzYx35hxCtKBSTzHSqYAe9/gYkbhVV
 gEXs5P5qrT6GMNA9gEznRZ8pZ72Xz0LNp2fTlXdV/54V6p1si/Xn6bwu5AX9AsJChzzP
 MwTn328RLKNErP5Td6ZLdqYMmgXY+pPSgb40s5d7ZT672mYrEyUgEOLX50AO4gXxJXsI
 z9cjd6HpIzfFAjpvEJSweqob5F7NET4PHVyZWymU20NQNFtGLBxxpN4z11YTepsUZZZk
 ZLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F9963mAn0HXp01JNVVDARECVbWpEusJQnHobNxtO4XM=;
 b=ccqObWdGI39fZCesB8sdVN5ZVDEMlQIDZRZLvsZSzsnSlOpmKAAVOfS83VMUQVGUo0
 kpZ63Ea02uq2x7HQNCo6BZsjE1bVFwyN1/0lmph1x9AmCEQWdiqE5KQob2IhevykhePj
 rzhyjdNIxjll6lgVqsNLfh5DZAthuC5rBniiZ1nCJidNMzM65cZa1Xs3dGxK1FaL2GsO
 6EyfHOG6RRBR5sWwMsRnY0Xh9Cf8ZNHaUWHL/ifo35QHwtWMCBI2HNTTqMIRARnKuop9
 YfeGc/bcYw2EJq73728wRSLtIyretQ9DXSNMj2TNQiAWs3/G3jS4xZPrwv97N/EVf9QK
 UOuA==
X-Gm-Message-State: AOAM533qvtBb4QPOtVUg3vL56cJX5d8PP4My0WaSSxKz6VKkNxY0aCoN
 hsdxV36WdC2U1lcHjuvbKCKSecVfsF2EAgkA
X-Received: by 2002:a1c:7314:: with SMTP id d20mr1132372wmb.156.1624025422370; 
 Fri, 18 Jun 2021 07:10:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j11sm7751661wmq.4.2021.06.18.07.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 07:10:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/7] target/arm/translate-vfp.c: Whitespace fixes
Date: Fri, 18 Jun 2021 15:10:13 +0100
Message-Id: <20210618141019.10671-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618141019.10671-1-peter.maydell@linaro.org>
References: <20210618141019.10671-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: eXiVpVtiv2Ck

In the code for handling VFP system register accesses there is some
stray whitespace after a unary '-' operator, and also some incorrect
indent in a couple of function prototypes.  We're about to move this
code to another file, so fix the code style issues first so
checkpatch doesn't complain about the code-movement patch.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 01e26a246d6..5a4a13ec1e1 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -771,9 +771,8 @@ static void gen_branch_fpInactive(DisasContext *s, TCGCond cond,
 }
 
 static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
-
                                   fp_sysreg_loadfn *loadfn,
-                                 void *opaque)
+                                  void *opaque)
 {
     /* Do a write to an M-profile floating point system register */
     TCGv_i32 tmp;
@@ -874,8 +873,8 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
 }
 
 static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
-                                fp_sysreg_storefn *storefn,
-                                void *opaque)
+                                 fp_sysreg_storefn *storefn,
+                                 void *opaque)
 {
     /* Do a read from an M-profile floating point system register */
     TCGv_i32 tmp;
@@ -1207,7 +1206,7 @@ static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value)
     TCGv_i32 addr;
 
     if (!a->a) {
-        offset = - offset;
+        offset = -offset;
     }
 
     addr = load_reg(s, a->rn);
@@ -1242,7 +1241,7 @@ static TCGv_i32 memory_to_fp_sysreg(DisasContext *s, void *opaque)
     TCGv_i32 value = tcg_temp_new_i32();
 
     if (!a->a) {
-        offset = - offset;
+        offset = -offset;
     }
 
     addr = load_reg(s, a->rn);
-- 
2.20.1

