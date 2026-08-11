Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DD1C5CFC1
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 19:16:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtrx8-0002IA-8n; Tue, 11 Aug 2026 15:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtrwx-0002FO-DT
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 15:15:48 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtrwt-000287-LV
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 15:15:47 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-38ea87caafeso179941a91.3
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 12:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786475742; x=1787080542; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FWe3uPbG8QTQeWcNC7hsaTPyUcsTnfL69Da5dCKR/IM=;
 b=iVkcxKblc5kjxWW9eHxhYcw0KeCh3pPpoSL5+Q9T1ytx6sJC7kI3id36bhE/TCKefR
 WLfLUUSC2m56C79/Sng1UdM8iZ+4zm3V7uOFxFSoHJkMImZorRKMuXXNhyJY2NVR91Wi
 koI8r7hsQdKsQdXj3X++Xkq+5YNQD9dhnfZ+RMT75yo00A/Srpe56QAuz5u+XbznV57P
 4RUWQLGMsNdsZIehbJ7f7y8P8fpmcogBEE/KKP8p/k7f0y/SsSk98CeWuGWRiPEseEwi
 OvhjrsMRlP13fn3oWAxpu1py0Uy3bOH+s3o2f5/435DQnMW5Wzf/OtSNdc9EdE9P5j3z
 SDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786475742; x=1787080542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FWe3uPbG8QTQeWcNC7hsaTPyUcsTnfL69Da5dCKR/IM=;
 b=iBrPNx85lzR9+/P/yaNgkSG+PkuyLnSjrq+GxX8fWPgkSWNqGRrdufJNB/Tay8V2sq
 3nlE1bNHczz9CbGxw8SLhbIFFzdkzrctnF0OpI4UDz/oy4l5zX0tM734gc7GltXicSmc
 qqFg1wPIDVx02IZ6L2gEFf5n2gxdzxuMyjPTBkRCRdwgPBYspeF/vRPF7ekGVW8HrYpL
 jB63i/N3cXDFJqGYPLQtGBQWf8vV8PjH+TZ1qFv2SgA0KsEUBCTlEQJY1TgRk52etC6+
 HSjhIF0TKMHpC/W3PbGd92cE6LemZpZF5eITOgNoaamizrWP4evFEn/aakka5FKJaMVd
 4m5w==
X-Forwarded-Encrypted: i=1;
 AHgh+RrvEPbXBlUjXvi+Oxj2OpfymTMjwkyAXCcIiFTM+HmPEZ7uRwdi6ub2bGVbdqbjTd6ng4x5+Ajrvw==@nongnu.org
X-Gm-Message-State: AOJu0YzH2vf7PrV0KMtEoxO//+TLK/RXuWA2rkDFOInSomlLKQPdXBvY
 Nhwqeh5vifAxWT/yL+oAmZaS1icILk9dO74eFSdhFx4qe7j47LhtVPQC0obAsDVrQl94s02qvPD
 JW/NJ
X-Gm-Gg: AR+sD11MDNKU8UjJdS1eN1qVuR+ThJSQUYsniazvPd1JGawOrqUbCMX1h2pCUDheBNY
 u8Rh3gRPy2CVjmW+OujmcN0ykE/MD9f7Vdlhy2SohMq/dv6lJQrM+KBnxrAY5Lpr/HoQwAMwDtY
 aAhXifbYjvbJq5GdKsQRR+0dHamBggk8Bq33SJ7/BzlBwCwTI3lM1XS1+g4eGDkriuXB3V04Xwt
 p4/cvnotdXxi7WYZf3PL/Qvg07oDhowyUSRDlrIpZmk9gpbOvukE1zTi9qm323upblODyB4gmky
 lMK2+vhISjPuNtk5cDjaZmGY+uqpqN7K76MyK/BUg1YtuaSv5FoSBf13nAkQPybwHxOX+2ygJw7
 rfmVGk2i6/v4ICwBR+bERzm3gi6j2PwkwXUVzqS4S7nxokR+Pk3KqyHJx/feBs36BT6L/Z0/Q36
 +KvgWQQ3vUGNJbt09CCOAFMq6K8fPWND08yqQpUO8eG307SOzCMY+1dPSpW1kYIM/k8voqqquH0
 Q2Yy/D0fRZnV5+wMgMd53cW/fSB+d8=
X-Received: by 2002:a17:90b:180c:b0:383:f52b:d616 with SMTP id
 98e67ed59e1d1-392ec5b6b8amr5463314a91.10.1786475741991; 
 Tue, 11 Aug 2026 12:15:41 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-392f97fc409sm209668a91.1.2026.08.11.12.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 12:15:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yang.yanjun1@sanechips.com.cn,
	qemu-arm@nongnu.org
Subject: [PATCH v2 1/3] tcg: Export tcg_gen_ussub_i{32,64,tl}
Date: Tue, 11 Aug 2026 12:15:38 -0700
Message-ID: <20260811191540.79882-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811191540.79882-1-richard.henderson@linaro.org>
References: <20260811191540.79882-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Move from tcg-op-gvec.c to tcg-op.c.
Use a temporary, to cover the possibility of operand overlap.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op-common.h |  2 ++
 include/tcg/tcg-op.h        |  2 ++
 tcg/tcg-op-gvec.c           | 14 --------------
 tcg/tcg-op.c                | 20 ++++++++++++++++++++
 4 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/include/tcg/tcg-op-common.h b/include/tcg/tcg-op-common.h
index 1fe342db0d..c7d1529c4f 100644
--- a/include/tcg/tcg-op-common.h
+++ b/include/tcg/tcg-op-common.h
@@ -163,6 +163,7 @@ void tcg_gen_smin_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
 void tcg_gen_smax_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
 void tcg_gen_umin_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
 void tcg_gen_umax_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
+void tcg_gen_ussub_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
 void tcg_gen_abs_i32(TCGv_i32, TCGv_i32);
 
 /* Replicate a value of size @vece from @in to all the lanes in @out */
@@ -274,6 +275,7 @@ void tcg_gen_smin_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_smax_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_umin_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_umax_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
+void tcg_gen_ussub_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_abs_i64(TCGv_i64, TCGv_i64);
 
 /* Replicate a value of size @vece from @in to all the lanes in @out */
diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 96a5af1a29..40ce17eed2 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -149,6 +149,7 @@ typedef TCGv_i64 TCGv;
 #define tcg_gen_umin_tl tcg_gen_umin_i64
 #define tcg_gen_smax_tl tcg_gen_smax_i64
 #define tcg_gen_umax_tl tcg_gen_umax_i64
+#define tcg_gen_ussub_tl tcg_gen_ussub_i64
 #define tcg_gen_atomic_cmpxchg_tl tcg_gen_atomic_cmpxchg_i64
 #define tcg_gen_atomic_xchg_tl tcg_gen_atomic_xchg_i64
 #define tcg_gen_atomic_fetch_add_tl tcg_gen_atomic_fetch_add_i64
@@ -268,6 +269,7 @@ typedef TCGv_i64 TCGv;
 #define tcg_gen_umin_tl tcg_gen_umin_i32
 #define tcg_gen_smax_tl tcg_gen_smax_i32
 #define tcg_gen_umax_tl tcg_gen_umax_i32
+#define tcg_gen_ussub_tl tcg_gen_ussub_i32
 #define tcg_gen_atomic_cmpxchg_tl tcg_gen_atomic_cmpxchg_i32
 #define tcg_gen_atomic_xchg_tl tcg_gen_atomic_xchg_i32
 #define tcg_gen_atomic_fetch_add_tl tcg_gen_atomic_fetch_add_i32
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index bc323e2500..27f3807b00 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -2399,20 +2399,6 @@ void tcg_gen_gvec_usadd(unsigned vece, uint32_t dofs, uint32_t aofs,
     tcg_gen_gvec_3(dofs, aofs, bofs, oprsz, maxsz, &g[vece]);
 }
 
-static void tcg_gen_ussub_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
-{
-    TCGv_i32 min = tcg_constant_i32(0);
-    tcg_gen_sub_i32(d, a, b);
-    tcg_gen_movcond_i32(TCG_COND_LTU, d, a, b, min, d);
-}
-
-static void tcg_gen_ussub_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
-{
-    TCGv_i64 min = tcg_constant_i64(0);
-    tcg_gen_sub_i64(d, a, b);
-    tcg_gen_movcond_i64(TCG_COND_LTU, d, a, b, min, d);
-}
-
 void tcg_gen_gvec_ussub(unsigned vece, uint32_t dofs, uint32_t aofs,
                         uint32_t bofs, uint32_t oprsz, uint32_t maxsz)
 {
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index bbcb510c76..4d15d1abbd 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -1264,6 +1264,16 @@ void tcg_gen_umax_i32(TCGv_i32 ret, TCGv_i32 a, TCGv_i32 b)
     tcg_gen_movcond_i32(TCG_COND_LTU, ret, a, b, b, a);
 }
 
+void tcg_gen_ussub_i32(TCGv_i32 ret, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t = tcg_temp_ebb_new_i32();
+    TCGv_i32 z = tcg_constant_i32(0);
+
+    tcg_gen_sub_i32(t, a, b);
+    tcg_gen_movcond_i32(TCG_COND_LTU, ret, a, b, z, t);
+    tcg_temp_free_i32(t);
+}
+
 void tcg_gen_abs_i32(TCGv_i32 ret, TCGv_i32 a)
 {
     TCGv_i32 t = tcg_temp_ebb_new_i32();
@@ -2433,6 +2443,16 @@ void tcg_gen_umax_i64(TCGv_i64 ret, TCGv_i64 a, TCGv_i64 b)
     tcg_gen_movcond_i64(TCG_COND_LTU, ret, a, b, b, a);
 }
 
+void tcg_gen_ussub_i64(TCGv_i64 ret, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t = tcg_temp_ebb_new_i64();
+    TCGv_i64 z = tcg_constant_i64(0);
+
+    tcg_gen_sub_i64(t, a, b);
+    tcg_gen_movcond_i64(TCG_COND_LTU, ret, a, b, z, t);
+    tcg_temp_free_i64(t);
+}
+
 void tcg_gen_abs_i64(TCGv_i64 ret, TCGv_i64 a)
 {
     TCGv_i64 t = tcg_temp_ebb_new_i64();
-- 
2.43.0


