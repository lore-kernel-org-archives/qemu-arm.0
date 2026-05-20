Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A62CD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:28:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPleB-0007Lt-Ct; Wed, 20 May 2026 14:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcQ-0004LN-2W
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:10 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlcM-0002ES-IT
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:26:09 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2bd2c147abaso31125415ad.3
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301560; x=1779906360; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2+saFtU6sDCDywdiaR0c/2CKQQH+n8UBNRc/yHjQxk=;
 b=FKG8t7KyA2BmXWaJoHxB5YontGqK2yMt1beiZQn+F7jP3WsSlESGhWbU/LamuzA7cz
 UktptW3+m+AAL6OZacosl8M1npvqhS+n5X1OwjDMaFPiErb8xSlAm00w5Qb3ubM6+s5p
 j3p6waF7Xzc/etNg1wd58hT8zzbPfYVSHGDMAWN+g8nUhnb2E97cg9APcpCd9J2PanB8
 oYP6mORjMiu/a3OuchfKgdCZvY/DZujCSCn9DbnVihmLGTQ1Z7QMXime5BI4aTkCB6zU
 yB9McaUDL9kG52tFdKgX09HRwFBX1i+OzfWeH+UDut2KIY8dhmb8CJ+WDfhJrIBHKqel
 GSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301560; x=1779906360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W2+saFtU6sDCDywdiaR0c/2CKQQH+n8UBNRc/yHjQxk=;
 b=XIzNXAKPNnpWoJGk9wcnxDr8kyuJpAP2x3Gako7uwOFaYpq0UbveVzhvLikdO4VYLI
 LHKCWVB9esAdZrs1JmxRxF0IPI6GwSRkGbFHz+I/FRDEyvSJbXOi3sxKZUbjuS5W2lQ5
 xOoP38Q8ntL9HyjfEDkjmTIn4gQy1Tz5NegMd5h7CKLNkmmMVubI8d3E00Wp5ZTpNRAn
 nxkwLp8gEAvEtVlvvXpQOh+lrEiLd6q19dd9UPzt5BLgnoa6FFPcJo1jbL+cT9ieka9N
 +bqBfhtL3s+CwjNTnTVe81B+AqJYR9izYLoJVrlSx0/IwCeVftrjukpvoiOIIIjq/kwU
 W/7g==
X-Gm-Message-State: AOJu0Yza2b3dLClPE/0QhdKIj1SjI/RgUnndTwooHoeOoGKIkr3pLe4z
 LmrFZgWMMrlYRspeGvmd/7eVdghUrm9RlW0GSU6wALIOVMUAFFp9zuqActZXrAnFDIc=
X-Gm-Gg: Acq92OGqu+P0PDCZDQEJ6LyXmhEx9QqUe9FrrE00gtSCXax5xAhUJbFpq5pW15iZ74u
 KwCKI75VlBw3/lRQE3tD4S9y/DQyTeoimMo9jx7pVe5TbvjDT4eZa87i9Qu8nh1z9+Jw/sl0NpW
 1tCpS/zCvHJ5wbEokbHoEsAhAr1nytO7OebkyeERBDGA9q0D+ipfowp/5HWyQleImYjyKV374TE
 D73kmAisPU/YKuiaS4oWk/0utrTSSM/4QfEjSeB0zMzEESDqM/j+u0ir7BU4jAlb+AKQD4/qsk1
 9YsTt7QD1nkDCtlvIgcbtCJb0jnktPy29GrCCtQcBlhgIpsJ9b3nNecXNbXW54/wqgnKPZK9JCE
 9Z4XDMEN7Dy+OEh/kLLLhY1aZqYlTyP7NyQ8WHDb10mzowJZcXCFqaB4Ja3so6DXrTkxMKyAQ6C
 MrgQlPjSVmNFHtBRkTnC4cgzelY54S
X-Received: by 2002:a17:902:d483:b0:2be:956f:144c with SMTP id
 d9443c01a7336-2be956f1dbbmr29658265ad.2.1779301559602; 
 Wed, 20 May 2026 11:25:59 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c0605ddsm217413925ad.32.2026.05.20.11.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:25:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 61/64] target/arm: Implement FMMLA (FP8 to FP16) for SVE
Date: Wed, 20 May 2026 11:22:10 -0700
Message-ID: <20260520182213.872945-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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


