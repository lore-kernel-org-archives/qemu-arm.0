Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E12CD4F3D
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:36:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPT7-0002od-4j; Sat, 16 May 2026 20:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPSJ-0007B9-To
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:34:12 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPSD-0006sW-SY
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:34:05 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-3660daea6a5so473875a91.1
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778978040; x=1779582840; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2+saFtU6sDCDywdiaR0c/2CKQQH+n8UBNRc/yHjQxk=;
 b=IWxDM+xo4QFzN4L2Dj6ARYXzei3ACqnT8YzQel1jtecOuFmEnrG7TiRQSIO+1lV08Q
 N1b8DrovYPDh79oIErRwF6rvLuOTWXNN9heZQbn3JThFVe472TKAIoecxUoBJ8sE04/L
 Emyl9ij7OYR5drKhapUA/7SRdatC7WaVZUYBJ7Gcwj+jk7Q3gWPRRBmUr3UcoZAMueco
 INL4zNK4b5t+OjmtBtc5Jbeh9wyMVh/yaUHIdzdYWtalAXbkI2QEvbXqAqohAwJpYk0q
 g9VW3BbjaWwtj9uVGq2KjvU/adzOGlvQzrATGu9sLNF5hSZgBN3c8eeOumdgeCqcz9IZ
 Q7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778978040; x=1779582840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W2+saFtU6sDCDywdiaR0c/2CKQQH+n8UBNRc/yHjQxk=;
 b=RAgZtOrRODrixkDEI0Sj6Bfiqiyag7Qiz86WWztlk0KAt+lAhiqgmuOIPz67Kd8C6I
 owXkUOLJRJhqywe1OMa+I6WPK1GEYvghCdE8/7VwodwIhRdbZCPQViJfDMAz9l/WRWtW
 yfflNJLCLgUlUkWHa8k6GCAMEdSk0wYod6hvcWoPCoPBD6+aE42H4qd7sjz5DcraYYTj
 qBwJF9mDpQeWVPUWmEQs8KEIc2z7Sp9oWptRhD9sHUafnsQzWHLb5z+B1e9xVET3/S2l
 FXAozBEN4Mk8RQOhhrlKC+a2zlio9ahuuV5jUQVhmbCxjBYFEEQOm4ZjU3O/34wg6Oqg
 Dgpg==
X-Gm-Message-State: AOJu0YwbGhxB+n3/tGKXAGOq+fglLC/Pl/Ay/uqe4OtMwxX2p5gT+wKj
 JWr5NrNUkfWvTHWmPfL5vDuFDp4YNoGfcHQwZ9Z6PNPOf6m7CuggaA/rqBbM1kcQvU4=
X-Gm-Gg: Acq92OHlb6oVzUEwBH4maB5804+4V3DhViIi8gLPZqB5XZIYf6UVnE5G5zab+OmAUn3
 nKe8RzFIWT2qDaFYjx7v6luucq1QKrhhqGttciunMxuHVsnU+LOus+iakQBVj7FaUY+N0V86eP8
 bUxEJUwefuzZs5MVjemWbgz+ajDxu4SjiORp+8oDCnax2irmsoSO/z6oikqgu0ugbtD9AuUOpVF
 Tv+VPWY/yn6+Hir8jX5pwyeQx7YleN5y4N1ddhnSLDJpUA7GG+IQi6/ZGInaaFBBAuf9S9P98E7
 Md2T15WC/MvK2Icu2dyiK7PJNs3ao2uz7XIwjdf7bOwBQNR9PLEojGukbEho1FokHt3cVKD7sgl
 2FFQcPcz+YLWGTobcSUK21XPeH0LTyOtbGWKJSpeRRMUxrDQfgZNEmWWCaBNdWOpT0OID7pT+al
 iBYtkYLRVAycHIHUg4p4D46spE7GBX
X-Received: by 2002:a17:90b:35c8:b0:356:22ef:57ba with SMTP id
 98e67ed59e1d1-369518b669amr9859171a91.7.1778978040474; 
 Sat, 16 May 2026 17:34:00 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82da93df0dsm3010559a12.19.2026.05.16.17.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:34:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 60/63] target/arm: Implement FMMLA (FP8 to FP16) for SVE
Date: Sat, 16 May 2026 17:29:59 -0700
Message-ID: <20260517003002.321430-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
 target/arm/cpu-features.h      | 5 +++++
 target/arm/tcg/translate-sve.c | 2 ++
 target/arm/tcg/sve.decode      | 1 +
 3 files changed, 8 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index fce38dfbb0..3eb08da6df 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1703,6 +1703,11 @@ static inline bool isar_feature_aa64_sve2_f8mm8(const ARMISARegisters *id)
     return isar_feature_aa64_sve2(id) && isar_feature_aa64_f8mm8(id);
 }
 
+static inline bool isar_feature_aa64_sve2_f8mm4(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sve2(id) && isar_feature_aa64_f8mm4(id);
+}
+
 static inline bool
 isar_feature_aa64_sme2_or_sve2_faminmax(const ARMISARegisters *id)
 {
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 5bda5f6c01..2bce6a38a2 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8458,3 +8458,5 @@ static bool do_fmmla_fp8(DisasContext *s, arg_rrrr_esz *a,
 
 TRANS_FEAT_NONSTREAMING(FMMLA_sb, aa64_sve2_f8mm8, do_fmmla_fp8, a,
                         gen_helper_gvec_fmmla_sb)
+TRANS_FEAT_NONSTREAMING(FMMLA_hb, aa64_sve2_f8mm4, do_fmmla_fp8, a,
+                        gen_helper_gvec_fmmla_hb)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 6610432528..b53fe6a58f 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1809,6 +1809,7 @@ FMMLA_s         01100100 10 1 ..... 111 001 ..... .....  @rda_rn_rm_ex esz=2
 FMMLA_d         01100100 11 1 ..... 111 001 ..... .....  @rda_rn_rm_ex esz=3
 
 FMMLA_sb        01100100 00 1 ..... 111 000 ..... .....  @rda_rn_rm_ex esz=2
+FMMLA_hb        01100100 01 1 ..... 111 000 ..... .....  @rda_rn_rm_ex esz=1
 
 ### SVE2 Memory Gather Load Group
 
-- 
2.43.0


