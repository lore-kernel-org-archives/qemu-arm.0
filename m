Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66791098782
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 13:13:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3ZYU-0002u6-72; Fri, 20 Mar 2026 09:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3ZYR-0002rC-H1
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:06:19 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3ZYO-00060G-8P
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:06:19 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6634bb959a2so3115323a12.1
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774011974; x=1774616774; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H7IMorunvZEgUBqMMO2t6X3hXoPF7SbGEFrN2VHLAQ4=;
 b=uVcdnSZOTw/F1qilb4lZ0HYmxMnVSabZu179eaFs/3KaYJio6PKC5y4cPAs13X14/v
 xGL111zXCsxtUk5riqXX3H4WLffX2T1gPPgi6Gpe3bFS7/Ks21T1HvtdRN0oQzyIMEds
 6grNZ7KK+VrjIV2AJo+QQASg28EJ5dbMVOMd733oTkCJLMsAr1BxzZNMdaUKvWkYi1Ch
 HeoCiEEoVZEaEkzWAYQwKVEfA0X/3P1hlPr4F3hAyerXIMuG4Ko5BG/O1rytNIFUt85h
 nIamvR24/wRfz4eUKJjFgjZLujHw/JipK3TSkv+fxvG7XYtl9mvleQ8P0UJwOjNtGkAY
 aQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774011974; x=1774616774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H7IMorunvZEgUBqMMO2t6X3hXoPF7SbGEFrN2VHLAQ4=;
 b=Pqvdqfg7Ayfs369AH9oKDxJHNdY5scdJcSfSWi2Xt+Bmbg4w/MxfxBihgsbIC12sDr
 3DOS63EmlMbh7GnGUI+/2i3uEWF/emCPG6KBXppZ2ivQCm3o0OeboypEH5Hs0QyqNYXC
 81uTwTDhXNFp+/IyKreJbz7/naMCVFazHzSeKdx2+d5uBkEt4FhwK10DtrtY9V5NcItJ
 uEY2ftkV/oZnhUJsFirPPjg50gAEaqITmbROLlCukcw54fEMP4YVotViBwlWkMWREIgh
 XS7O0A79rW1gjr8giX+/nt03cDQ8Q2ey7wUpKv26nVwbcmtuRL3KoyxGfMWAjKFv+ppA
 nU2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRNDvrNR4k7hNekF4mzr9bcEUCTf7JpbRI1cHQLbth5MFfmpP/hSWqOpdOG84XbSebIl7h/oO2Ng==@nongnu.org
X-Gm-Message-State: AOJu0YzLSk40UrqJnbZ5nSO8BCIzLvGiuBeLjW3WU19Ea8LkboES5WAS
 vrqLX/L8eBDkqEWVk/ZoRg4cx1Qsq/LNML/onmeoBdWK9TwZsVX1RD0z5W3yxyrX7KI=
X-Gm-Gg: ATEYQzy6US2QE4NJsNXt6Unb4/t7rVHyfSWbsc19qBVW3nqVUt2EscG7uDqlffNNNST
 B+vC1LuBkd6jXKZUsJC8FMARKcl/cdF64kb16oODSCG54LCLFMK7kc6CWWQLLXIVs9mcHzCQW+a
 MPbGxfQ1RetVP8C+bsRaSuQS0z3+X+91Avpj+5WganPxQ9fsvs8+oE2Q4IM+eWBjZFUyT40KN0D
 r3WGNEyQm/AS0pK3OkIsPcjnwe4hkmWoKG+uG2PS3JhFXg5t0vZ0cz7RWCzc/m+jRDgTZ5EN39h
 1Jn/4CszkTn0gek2Ph5CC9kZp0rw+Cu5cze++j3DZjyQZGMewMoMFtzmK+sd+kI1QAE5rvJPptb
 V/MxJFmrE2XOtsp5WmDAYcQElzfInXvU+D1iNs6UhUBQNLFTBBhkJsK95xoPFuKo2gqvatecJIZ
 XuAgeQEHKYeX3UeVB+P+IRyrM=
X-Received: by 2002:a17:907:170c:b0:b97:9139:738 with SMTP id
 a640c23a62f3a-b982f2f0c72mr174716466b.33.1774011974166; 
 Fri, 20 Mar 2026 06:06:14 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b98336675e1sm154348266b.51.2026.03.20.06.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:06:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2DE255F946;
 Fri, 20 Mar 2026 13:06:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 08/35] target/arm: migrate BXJ trap syndromes to
 registerfields
Date: Fri, 20 Mar 2026 13:05:39 +0000
Message-ID: <20260320130607.2071996-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320130607.2071996-1-alex.bennee@linaro.org>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This is an Armv7 specific syndrome for chips with Jazelle
functionality.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 0520e51a686..fb86e7bf6a8 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -440,10 +440,26 @@ static inline uint32_t syn_btitrap(int btype)
     return res;
 }
 
+/*
+ * ISS encoding for trapped BXJ execution
+ *
+ * This is an Armv7 encoding.
+ */
+FIELD(BXJ_ISS, RM, 0, 4)
+/* bits 4:19 are Reserved, UNK/SBZP */
+FIELD(BXJ_ISS, COND, 20, 4)
+FIELD(BXJ_ISS, CV, 24, 1)
+
 static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
 {
-    return (EC_BXJTRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL |
-        (cv << 24) | (cond << 20) | rm;
+    uint32_t res = syn_set_ec(0, EC_BXJTRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, BXJ_ISS, CV, cv);
+    res = FIELD_DP32(res, BXJ_ISS, COND, cond);
+    res = FIELD_DP32(res, BXJ_ISS, RM, rm);
+
+    return res;
 }
 
 static inline uint32_t syn_gpc(int s2ptw, int ind, int gpcsc, int vncr,
-- 
2.47.3


