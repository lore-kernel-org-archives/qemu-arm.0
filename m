Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB75FC87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:17:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwQb-0006qp-7Z; Sun, 27 Jul 2025 04:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPL-0001Nd-GS
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:06:59 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPJ-0004jf-K6
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:06:59 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-31e41cfa631so3661745a91.2
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603616; x=1754208416; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aph0ZkYCjiTweukUbhlaS2yrRTHeOV9Z1zDO+YdfHoU=;
 b=BFCO8noJ4CwkJvMxwu/GP0B4Lmym+xhCe08Ak0NfH0j9pz8Dsk2qTyYuylvzqvMwtj
 Ed2i0XHdldpN3v1HQdH2Fgm/pEVs3y4Lyn4ofOAyUntsYouYWPTY7yElHZakfY0UlMsO
 zAegL0PWcTbwz8caiIdAwwvGPS3deVGfV0ZE8tPf6BVkB/xtBMBllDoB+6NetgHIKVoK
 koOD3iVpGc1+9wSdYYREPAr+Bhh/jIQC1gBcUNipuNTeztCXqld9JeQ22A44kLfzfaRe
 kXtqCvR2Jt++al4jilkgyAA7tCcky1t6USVD2AO3ssOQ6yOPaHXYFPkwsYCg8iGlS/iU
 GSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603616; x=1754208416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aph0ZkYCjiTweukUbhlaS2yrRTHeOV9Z1zDO+YdfHoU=;
 b=tpfsCFjJAKbJxy67MAhGmK4G5OlGTnYgro0IB05XrmIF/pj/kGGjjX/MK8AkWUEspn
 mkRgulz4lMlV1k4HRoOpo0DPmUMCqDRXkM1RkHMPbo8GpEbUq3wYXtknyH+lqX+JuXQ+
 U3seaRub7HzXWFXMx77CiIGK/sTHcZa39qXpjIctVlw+RkMHKqY37hdoOhDSFvZWrahT
 AcistNvQB3WptWdtpGUDEvzZsH1+QcUVK79LHQipOp4e66XgSMIt7SD2rbi1pr7lOES2
 oTVPqRsM9bm2TxP9RNvzJQ7NS5D4FE2AQBr84yklD49cDy945a5y9cusT/Li4l97OMeY
 s+jg==
X-Gm-Message-State: AOJu0YwYgLyGqcLWxJSXMhj5gplPXPabo5xMzn7OkDPO4xB6a+nMfauU
 j5PI2HOPJ8uYRqAXfcFm4XlkkeXB9nSbAqq2plbquFJf0F7OzGT2yn7RlbaaSHvHF3W/S6fcTc7
 Fpen/
X-Gm-Gg: ASbGnctK5gDCojgfjkXk5BfubPJl7hVOqjR3gmmqNFBsKNVOWdzkdVO5OR9fqGyMOGm
 gMSPDS0uMa00KYwsQd2ZVmceAJhldUpyy5qoC+RaiUA2jxSE5AkZ7AZfATmBudoF+/WD8a2X6AI
 PMe53O1kNUR6DolWDZH6iIOUhXyZdwSPj5/HNWoyjYxNzlKLQGjPhJsTZ8879FykIUraej+nzl1
 O5MgyJp0fXRakHy4wMxWlFpTvHPgIlDTYNb13OJ/6LJ7DVCyyB5tzhsF81kio73HH/Anaep/sjU
 ZUv6Ms8fVjqndeQ8MKo6cs8gx4/jtA6kMogK0PsLGfSiBzXGu0pORMHlr0egz2aCjVq2UIqtWKM
 uvXgX63fNDW0hSmhgBEnAiFxpv610e6k2lgWGQdp1r0oFmAcHRVLzQ4N0o0rDkDEShRNJxn+p6V
 Cxqf0YLrzG3w==
X-Google-Smtp-Source: AGHT+IF4jJzoNuOyW8ulnmLiKYz/LJK+i9Ip9ny6z5DTY/riG2Jv1c1+UFMaXIyIhtjobnSOAgEyTg==
X-Received: by 2002:a17:90a:c888:b0:311:9c1f:8516 with SMTP id
 98e67ed59e1d1-31e77879820mr10750158a91.15.1753603615935; 
 Sun, 27 Jul 2025 01:06:55 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:06:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 48/82] target/arm: Add syndrome data for EC_GCS
Date: Sat, 26 Jul 2025 22:02:20 -1000
Message-ID: <20250727080254.83840-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index c48d3b8587..bff61f052c 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -63,6 +63,7 @@ enum arm_exception_class {
     EC_MOP                    = 0x27,
     EC_AA32_FPTRAP            = 0x28,
     EC_AA64_FPTRAP            = 0x2c,
+    EC_GCS                    = 0x2d,
     EC_SERROR                 = 0x2f,
     EC_BREAKPOINT             = 0x30,
     EC_BREAKPOINT_SAME_EL     = 0x31,
@@ -83,6 +84,23 @@ typedef enum {
     SME_ET_InaccessibleZT0,
 } SMEExceptionType;
 
+typedef enum {
+    GCS_ET_DataCheck,
+    GCS_ET_EXLOCK,
+    GCS_ET_GCSSTR_GCSSTTR,
+} GCSExceptionType;
+
+typedef enum {
+    GCS_IT_RET_nPauth = 0,
+    GCS_IT_GCSPOPM = 1,
+    GCS_IT_RET_PauthA = 2,
+    GCS_IT_RET_PauthB = 3,
+    GCS_IT_GCSSS1 = 4,
+    GCS_IT_GCSSS2 = 5,
+    GCS_IT_GCSPOPCX = 8,
+    GCS_IT_GCSPOPX = 9,
+} GCSInstructionType;
+
 #define ARM_EL_EC_LENGTH 6
 #define ARM_EL_EC_SHIFT 26
 #define ARM_EL_IL_SHIFT 25
@@ -351,6 +369,23 @@ static inline uint32_t syn_pcalignment(void)
     return (EC_PCALIGNMENT << ARM_EL_EC_SHIFT) | ARM_EL_IL;
 }
 
+static inline uint32_t syn_gcs_data_check(GCSInstructionType it, int rn)
+{
+    return ((EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL |
+            (GCS_ET_DataCheck << 20) | (rn << 5) | it);
+}
+
+static inline uint32_t syn_gcs_exlock(void)
+{
+    return (EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL | (GCS_ET_EXLOCK << 20);
+}
+
+static inline uint32_t syn_gcs_gcsstr(int ra, int rn)
+{
+    return ((EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL |
+            (GCS_ET_GCSSTR_GCSSTTR << 20) | (ra << 10) | (rn << 5));
+}
+
 static inline uint32_t syn_serror(uint32_t extra)
 {
     return (EC_SERROR << ARM_EL_EC_SHIFT) | ARM_EL_IL | extra;
-- 
2.43.0


