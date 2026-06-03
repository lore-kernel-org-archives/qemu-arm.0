Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36994CD6E55
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:33:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcLS-00026C-Lq; Tue, 02 Jun 2026 23:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcLJ-0001Xb-Pp
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:32:33 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcLG-0004co-1z
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:32:33 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2c0b9328c4aso25167595ad.0
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457548; x=1781062348; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wag/kMq2SOZ4UTghLOZZPUgDGcWCTksKDFfQl0odqRg=;
 b=Ao7hanc8qvVsWfzFlHqBj3P2fUbeINL5wC9GR6EiB1RbWQuEJmHjlrsSG+bnkEP1iI
 MuFimgEQfL6ViMS63w+xZ3Nb1vnJ7qYtN/tccmZqUilBgQizmwjlG9mWHNR81EXdM7aC
 yc4LcUaB2ialka0p8MEsTKiDvtKGupg1QV1B2eE188jYIpwDn1fgc5V3Svpc4svAIcee
 yV+f97RChwQ5H0dpHmYvVMRhVRmQRH6LZWRzGghCGEw/fmvu+t+gVHVTxF6hFlgTuxzb
 Po+Pmie0TCDZBfTvUngIlpL2DwxYA/j72divUYegOFYEoFBKp8y9pfS6XGlzFofSXEKI
 CJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457548; x=1781062348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wag/kMq2SOZ4UTghLOZZPUgDGcWCTksKDFfQl0odqRg=;
 b=QaEm0zQZcHvclTCf3/1MfmHhE0Y3YVzM3cbRMOjgOyO7OoeP9YDcDvqOJA9PlewoOn
 O/D8ggZrEUryI7k5FhPLk6sRzURdnc4IQibGeNOvgdOY8zv7cjuwnfb7/9A62y92CJTD
 5TCqwWZamJ07NOm7F63G212UtGqQjfF8TRQNSncX6Ojb4G+/xj832O49Y7ydVtEI605f
 v7RdNHR1r4fO+3sC1QlQGCWbCaQ/n/GGyayQEb83uY7zN8uchWUbDi0DdePOLwXtqvjG
 hb2VcTE7rOCwNDW4WGtHbbiKi99VZJAxRjRpABLtUZJBNxNnM4l2G1r3yUACy4fWMG7y
 0OaA==
X-Gm-Message-State: AOJu0Ywwab/xbR61yFb/YWXf41qA50hdxWcy42c+q/iHxWSLGLyGqbfK
 HHiKtczsLCe9Kq+18XknfQyTRqVFe3Vp5lV2/BxM/Pobtuz5UkEPqYyeBe/ibUjDgw30TjWc/ZP
 BshQTZyU=
X-Gm-Gg: Acq92OFZ59t3SZxPgTGyZhmoTQ3AsnbJWegSfb8CuaRa0BPllrp04KqyIjKNwcpGUq9
 LcC1dEKbfHL39XiJgfndZlbqWtxibbV82UzQKrSI+4KBxDXWsj6BasreoZEkiE3xzHT/wkzGSWY
 hmVRCtDby/O60EbNFjdTh7c4Qs3NJpcajSLCapH1hBRt9aZGhNcxM2Vnq/H9J0B96ex4NWMFJ31
 SgtoU6Onzwt3ie0bkw4ZIKtEPxoli5KJWVyaN2vkmcisx8Cl2LqwvrVoEJ0V1uuFMGanE/IgXkC
 JMe5A88DRe4sO6pBVBBsX9NXse8z5IRWF6DZX1wcFu01nNSfhAIM32yR1iFcI8Wesmpl1A7IuBx
 fERfff7XwYZdOwtIGhTeCrwrcCfHIR8+FZLtRBVItHRfsv6tMoEubCDgyLi6Kwk4ww9Sfq8wQiU
 iO7jjs7a+YYPaYKm/026Rg/NZ+KEGPCQklRm4WgmY=
X-Received: by 2002:a17:902:e746:b0:2bf:2d0:887b with SMTP id
 d9443c01a7336-2c163a30c4cmr16856335ad.9.1780457548456; 
 Tue, 02 Jun 2026 20:32:28 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164fa0236sm7785685ad.33.2026.06.02.20.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:32:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 44/45] target/arm: Implement FMMLA (FP8 to FP16) for SVE
Date: Tue,  2 Jun 2026 20:28:53 -0700
Message-ID: <20260603032855.106930-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
index 6d65706186..5a14507682 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1713,6 +1713,11 @@ static inline bool isar_feature_aa64_sve2_f8mm8(const ARMISARegisters *id)
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
index 1def148f64..9a1bf71577 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8477,3 +8477,5 @@ static bool do_fmmla_fp8(DisasContext *s, arg_rrrr_esz *a,
 
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


