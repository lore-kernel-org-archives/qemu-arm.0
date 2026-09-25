Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5E0C9832E
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Sep 2026 21:51:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xADoo-00084D-Rd; Fri, 25 Sep 2026 17:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADo8-0007lD-9T
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:22 -0400
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADo0-0007Zz-TB
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:11 -0400
Received: by mail-pz2-x0e.google.com with SMTP id
 41be03b00d2f7-cc797656e36so246923a12.3
 for <qemu-arm@nongnu.org>; Fri, 25 Sep 2026 14:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790373007; x=1790977807; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3uToE5TQtUeu04oq/KPmYzTSFGfvjSl8xGGZIFShgp0=;
 b=g8cUFVJvk1i1cHzjULDBmxe1MuUWTTZ2EZR772TFL1ZseYKvASt/E4p1M9fkPoUZfG
 K2nh0O/TNg4eoCuusSuVJCIC4ZFJpoU1yNxdk0J5Sr5+w/mjBSY0O7bdCj9wAGbkN7xe
 ve+nbW49rG/G8NpgDzDbK+S4/rskBDeoBdvpSSBLJLFK5fgcoy55In8MSxkwQSK2a2Ut
 2KUwxLesf4f+fQEdaMghjSZJ8WzITfNyjl/aywJrjWdmXwXqslPiHDfOPeXVvadwouyS
 0jDwKOfggeCaKkWos2UFkV9dLWPzTMqGn87MY1Ce2O3v00dIveklfi6+NxwMir0FEMBF
 ld6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790373007; x=1790977807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3uToE5TQtUeu04oq/KPmYzTSFGfvjSl8xGGZIFShgp0=;
 b=LhzXfyI0XQqOyvKS7wjq4Re3iXn/d0fUTfxGDvEqyGZDb2RafBRrQ3D2viYffWYkKL
 zXqUHDq5JqMPpbPBb1XJJEXkAW+cllgAU4EKv+WhkP4U/s5XaHrXHQYK/WepayqBqEAs
 Vb/KcPy7Fwu54oDXMw82h0JccxBLRhInVpCcAG7kdMcVDYkkfZsnjZ46LM13pdaZWeOy
 R2BtkQz6lf1jf3sYBV03pjGdO2vDhphTxKpyApP74KjCM9RmPnWsisji6nb7hxYq2wEf
 k5e4USeqmwrkJ0QWm/hZlp5zwQYKoVIBBK8iDNMGTjTAD++Iq/7KTEKzF+W1Up6uEp1T
 EzgA==
X-Gm-Message-State: AFuF++n/I3kmYCg4m9/QhfBWHSQ3Z4i8kc5KcQs0aaXtFgN2fSbLEWES
 VEEGGiZ4dGEKgerCSGQ2CT6YzcbOYAenpgoDw6rRZKCVzD5ot5kjZ5hKFqJ9b1F8D+M=
X-Gm-Gg: AYBFou05Md35sMfNqJjrhkM5EHNWFYsjgKhbprgoRLgh1HNRDs28kqvjSwJtZeQSJRv
 5mVG70M75350Nxc4dgvNS2lkszB84oyxN2JOgq0H2wqfqfSsEqv9c5xZaQKL7+G56A4VmyNOtkT
 AUA2JnI3/q/hgfl5uFOUYuLfxHLenMNf6jFyXY/U0xbPSORWA91mnRYOFH532VM/8nKr7Me3uQ8
 0Jfbtk61orgVrJSucAgqRFyuCG+uzI7gdlyGFZeoIEoHAhuTFmfmDkectB1mHwe5zzM3Q0sDoFo
 1VvlYzuer1HWezOgScd2qAREhl3neZ9XD7ukxOvmi/Mo2A5/Mjpprwxej7HkYsSABUEYO8pkz5D
 etz7v7EQkm3zZ3l6x7EcOf5frvk2Z951sFbPOuHP8nXy2dsMP1PoJSsKzU7WYwUiPwJOAcG9nj8
 pZ3SDYQUe/ZKUwcInM6kGGRAX/ERjiPgGV4j3bOwe3H+JwLG8S4DoRuRGmS84Vx98I56C1Ay3cN
 s8XZRx4R0tth9gThFfUfSMpydl8KeErF+Ue4Uob
X-Received: by 2002:a05:6a20:d090:b0:3dd:a196:309f with SMTP id
 adf61e73a8af0-3de0e9901bdmr6090359637.79.1790373006784; 
 Fri, 25 Sep 2026 14:50:06 -0700 (PDT)
Received: from stoup (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87fea1940ecsm1725256b3a.13.2026.09.25.14.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 14:50:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 01/14] target/arm: Parenthesize tbflags arguments in TBFLAG
 macros
Date: Fri, 25 Sep 2026 14:49:51 -0700
Message-ID: <20260925215004.456336-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925215004.456336-1-richard.henderson@linaro.org>
References: <20260925215004.456336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e3f931dba26..8c50e91004d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2583,21 +2583,21 @@ FIELD(TBFLAG_A64, MTX, 49, 2)
  * word either is or might be 32 bits only.
  */
 #define DP_TBFLAG_ANY(DST, WHICH, VAL) \
-    (DST.flags = FIELD_DP32(DST.flags, TBFLAG_ANY, WHICH, VAL))
+    ((DST).flags = FIELD_DP32((DST).flags, TBFLAG_ANY, WHICH, VAL))
 #define DP_TBFLAG_A64(DST, WHICH, VAL) \
-    (DST.flags2 = FIELD_DP64(DST.flags2, TBFLAG_A64, WHICH, VAL))
+    ((DST).flags2 = FIELD_DP64((DST).flags2, TBFLAG_A64, WHICH, VAL))
 #define DP_TBFLAG_A32(DST, WHICH, VAL) \
-    (DST.flags2 = FIELD_DP32(DST.flags2, TBFLAG_A32, WHICH, VAL))
+    ((DST).flags2 = FIELD_DP32((DST).flags2, TBFLAG_A32, WHICH, VAL))
 #define DP_TBFLAG_M32(DST, WHICH, VAL) \
-    (DST.flags2 = FIELD_DP32(DST.flags2, TBFLAG_M32, WHICH, VAL))
+    ((DST).flags2 = FIELD_DP32((DST).flags2, TBFLAG_M32, WHICH, VAL))
 #define DP_TBFLAG_AM32(DST, WHICH, VAL) \
-    (DST.flags2 = FIELD_DP32(DST.flags2, TBFLAG_AM32, WHICH, VAL))
+    ((DST).flags2 = FIELD_DP32((DST).flags2, TBFLAG_AM32, WHICH, VAL))
 
-#define EX_TBFLAG_ANY(IN, WHICH)   FIELD_EX32(IN.flags, TBFLAG_ANY, WHICH)
-#define EX_TBFLAG_A64(IN, WHICH)   FIELD_EX64(IN.flags2, TBFLAG_A64, WHICH)
-#define EX_TBFLAG_A32(IN, WHICH)   FIELD_EX32(IN.flags2, TBFLAG_A32, WHICH)
-#define EX_TBFLAG_M32(IN, WHICH)   FIELD_EX32(IN.flags2, TBFLAG_M32, WHICH)
-#define EX_TBFLAG_AM32(IN, WHICH)  FIELD_EX32(IN.flags2, TBFLAG_AM32, WHICH)
+#define EX_TBFLAG_ANY(IN, WHICH)   FIELD_EX32((IN).flags, TBFLAG_ANY, WHICH)
+#define EX_TBFLAG_A64(IN, WHICH)   FIELD_EX64((IN).flags2, TBFLAG_A64, WHICH)
+#define EX_TBFLAG_A32(IN, WHICH)   FIELD_EX32((IN).flags2, TBFLAG_A32, WHICH)
+#define EX_TBFLAG_M32(IN, WHICH)   FIELD_EX32((IN).flags2, TBFLAG_M32, WHICH)
+#define EX_TBFLAG_AM32(IN, WHICH)  FIELD_EX32((IN).flags2, TBFLAG_AM32, WHICH)
 
 /**
  * sve_vq
-- 
2.53.0


