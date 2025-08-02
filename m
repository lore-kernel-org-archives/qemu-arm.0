Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1BCC87FD2
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:54:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLpH-0007YS-OM; Sat, 02 Aug 2025 19:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLmn-0003Nt-Iw
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:37:11 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLmm-0005p3-3y
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:37:09 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-741b1fe0e00so44929a34.1
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177827; x=1754782627; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QDW+HxP2J6pK8IxGshUeq+u65rBy5XdnKzmGA8gxmkE=;
 b=zgNzMZ5gZmutdY63P0kzAQy0XvqblCPUoD/wmwy5Qo5h+RCqMuVNLU+wgP8pRV8sy2
 t6sta85KpQY/8bOfuj1EZi+dQoalNCP2/2SyixYIRZ5JBvojQstuJ1r/XtSJt6+tEAkY
 HIaRlp366mlWUjc7kAHGqfNbrHMR6rXZI7cv1jYemQwdtHQmdVVRKE/B2frnOtxRTxAu
 +iHG4WSEluFDCamNihUgDZlrkSw52wGTJmNg7N9NX8UKvPSX9m97FDqcBQ5MC2CdaaKf
 8A2RwCMWFYrdPMBYZh2e2TvfcorvGBPVBFPFautxwD3znjeFKQUD4vlh7hXEpvTLfqgV
 B1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177827; x=1754782627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QDW+HxP2J6pK8IxGshUeq+u65rBy5XdnKzmGA8gxmkE=;
 b=aG+Fxp1nInrQlbMUKZ1RelVc5fiE+I5IpMWv9AxogBLE8+JBAIZloD6gdDHa9/5RpK
 ppqZq/QYEA1RekXYdBZp2UhbyGQvQjKwBLKGITRB+wAnlPL+yZ3HqRQvKIgFUXmhEE6U
 q56B2sRt7rebIaP0Jastb3oEsGOkN1XFoaz8ue7buzy0xTUXCh+PGZ3y80nsXStjZblm
 41Q6qpSwbwksISIH6yxAVHBQvY56yzr7kNOvHN6SpnT4zob2VDHDLbtEzZ9EVGeKSK6N
 RWB0GDu0OZxuwrNd6Pkjt0xQNthBY3mZb3RzcXwzEiCXifUbEPylGpWEVXFgXy/vrokd
 mE7g==
X-Gm-Message-State: AOJu0Yz0JzN0rpwvKD2htgYy979SfQDtZhvuMrcs2pu+fMAmrWO05Z/i
 3KcqHwYNNJkXbhbLKG1RAautplBFYGBC6xsYUC4bUr+5h3q7E2lksWy+wkEIkUlFYUUtScfhZ/7
 4UjLiaeM=
X-Gm-Gg: ASbGncude+GreLfMbcMLPDFn5VGfLICrgMAyl8yAvqRr5MndMcBfekrdwQIvkY2araT
 OwfFb9JXmYOokMlTxOkr60xDWIWsMLiapadcgaxHCgz51JDBNGjn93I4PSfnH7CkkOwFugfjtUJ
 fEhcbbwgvWiyyhXOGDe8xX2L5eTxfaQkel3ardsLYH7gJcydSDw4FqIysc06S9ExNkU2pYUGpVg
 vKmf8un4dcgLcXUj/mZer0H0RsVD1LW6zelxBJPa0JAXKOqV/XWy9XdlMHfBUyI7Vbhnkrx6AFX
 MGU2uNXXtaJv1UG9nWU30QxeI0WHsVB4JOZUDEnjfUQs6e5L7pAJqQsLSAEpngLPS6s3vL7H00n
 orZ9XPyH+p3Z6pRD9mbZMpeOCR/gmxgcPulNIihjdQpIEY+cseHz4gancBhhC4x8=
X-Google-Smtp-Source: AGHT+IGgqgUGJEh5uREVUzo7c6Stkqf7FbMPojwGUIG5RxDFYviN3DTEDm3Vllc7hd1GAy4o+hZA0w==
X-Received: by 2002:a05:6830:3112:b0:740:79df:9026 with SMTP id
 46e09a7af769-7419c4cdcb8mr2889465a34.0.1754177826850; 
 Sat, 02 Aug 2025 16:37:06 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:37:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 51/85] target/arm: Add syndrome data for EC_GCS
Date: Sun,  3 Aug 2025 09:29:19 +1000
Message-ID: <20250802232953.413294-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
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


