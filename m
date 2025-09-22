Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2603CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:55:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lcF-0005Ca-UN; Mon, 22 Sep 2025 14:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lc9-000561-Vh
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:18 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbz-0004R9-Rh
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:17 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-77f207d0891so1613666b3a.1
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567005; x=1759171805; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ePluHC0H/NP5Mr3iGwvDk85qezCPg64S4ISl6e9Zi/A=;
 b=e302XKQG3JBdA35jxSU00tuIHvF3OcwwGQR+KIIr+onwM3Eu3Fy05IfebnxnszQrAh
 IRz+Xo35R7kye+vCCWfos/WJJzQ9gH92E9Jtz+9MikwJFEpP5y40Z6pe/bv5gFu55nmQ
 GfgbH1W9bnEbi5w1iBNUl8CZ9Lv4FWRgtBZJ0dx8iruG/MlUc1xLHQVexp3Wm0Bl6j0F
 Dhe8h+3cyXgTsHkFoSHt2cNyEg2pwWqtVmoL8lCxTr6ZzNJw7wOfyk9wzf295JPOShew
 xjckfwzQYwmi5qAcz+KYWcBvQMn1bxALnGt0D3cyIe2ibmu/YL+Nn2wcz/yHBnxyo/SI
 VWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567005; x=1759171805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ePluHC0H/NP5Mr3iGwvDk85qezCPg64S4ISl6e9Zi/A=;
 b=IfkQ0M0s2TEoNaRbIztKvo0j8NO+GCs6M/OQ4yyCfPBrDLn1g0QZ7fak+hGlx1Avui
 ZBkcqmETHgQFNcqWMHXAkgRb2fu5PkdL9j5X38x7OG5WbM+d6bXbL/aDsFc2ev2SCo2Q
 kzKT8ctoXpL2RgCPPdgFsOq9bXuU2bkjt/Ir5k8WVpOENXcqdEe2j1Yn7ly1eeLvhVyU
 JaZiXh9PI6gdl3zKyImFjo1c4imggdZpmATdBn5BPQBCpXGY2sbois0dWczsoQUr97YN
 Mz0CRP07iaTZJWm2p3kU4c1QkgUy+cfdmACOFu9+GRnlByEoh7i14wnmSQRPN93LQBtQ
 LAKw==
X-Gm-Message-State: AOJu0Yz8nvmikwD+wX02Y25XrkVThD4i6H8fV8+sjXqQCL8Bs+ImkCtI
 hdIOoQTinX84H1+RWmkO3SobJlYJEpXY/12zQOA6sjiVRTsYn1G5+0RsvY61tkJ/NL0=
X-Gm-Gg: ASbGnctGhJiGB5ZW31cIFluAQVoRfA5StYbjANtD+KtpJFv2tXerlAE7AAEAE4i8sGU
 gl/lZFiyaDjD3YmmgXeZ00dChGTr/tJxZLXZcQyf2Ew9RqBCFbZrJHOLdKPBg/F4SAQ2akR2+YB
 S94Q3IqiUSRX0JKwvQ63wZNH3LfupHHBbSovQLZ/g12ooybLyRh9AbsJuBCRfuT+JTItDHPxlMr
 bHw4joXqU/zoaNA4lALj9aAi+xmAEOQO7LNCiIbE341RU+9DVTb9LrKZNIKyE3R9KNq17YZa97x
 /cNDoGNHI5NAngKSCP3HhpuIvmiPkuAhPuJmFNMx+EtCnUv/mcJUKDk7XVNTRuw1vCG8225Lt+P
 8r9dvrzzW7MlyIbdmzIzHJq4fr8e8
X-Google-Smtp-Source: AGHT+IGznF8vcVQNXZl4n9D3ByK1OCWQV3jQPV9q8x3fqNxGF0QHJqlcnKvu+5n4I0uMT/aiD2DANg==
X-Received: by 2002:a05:6a00:1887:b0:77f:1a7e:7bc0 with SMTP id
 d2e1a72fcca58-77f1a7e85b8mr10602472b3a.31.1758567005232; 
 Mon, 22 Sep 2025 11:50:05 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:50:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 32/76] target/arm: Support page protections for GCS mmu
 indexes
Date: Mon, 22 Sep 2025 11:48:40 -0700
Message-ID: <20250922184924.2754205-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Take read and write from the s1perms.gcs bit computed
by the Arm pseudocode.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 16ca2b6187..bfa0aeb4c0 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1583,12 +1583,16 @@ static int get_S1prot_indirect(CPUARMState *env, S1Translate *ptw,
         }
     }
 
-    if (perm & PAGE_WXN) {
+    if (regime_is_gcs(mmu_idx)) {
+        /*
+         * Note that the one s1perms.gcs bit controls both read and write
+         * access via AccessType_GCS.  See AArch64.S1CheckPermissions.
+         */
+        perm = (perm & PAGE_GCS ? PAGE_READ | PAGE_WRITE : 0);
+    } else if (perm & PAGE_WXN) {
         perm &= ~PAGE_EXEC;
     }
 
-    /* TODO: FEAT_GCS */
-
     return perm & PAGE_RWX;
 }
 
@@ -2241,6 +2245,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
              */
             prot = get_S1prot_indirect(env, ptw, mmu_idx, pi, po,
                                        result->f.attrs.space, out_space);
+        } else if (regime_is_gcs(mmu_idx)) {
+            /*
+             * While one must use indirect permissions to successfully
+             * use GCS instructions, AArch64.S1DirectBasePermissions
+             * faithfully supplies s1perms.gcs = 0, Just In Case.
+             */
+            prot = 0;
         } else {
             int xn = extract64(attrs, 54, 1);
             int pxn = extract64(attrs, 53, 1);
-- 
2.43.0


