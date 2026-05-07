Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A56CD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:51:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8SD-0008AO-Nj; Thu, 07 May 2026 19:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8S3-0007Yt-IK
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:19 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Ry-0002Bl-Jp
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:19 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-7df05fc49e5so1467739a34.3
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197693; x=1778802493; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pnjAQy5uQrEwmgSYURuCn+Sb9FbsR2xmUbZI16rxj8g=;
 b=G9P1rBtGPCZdPvDSLwALLDitdM4j5trblIh5IiyLXo8CjQYogH9TsArm/rhoIlv4jN
 VnipEwMcREuC0SKrmS/zAg88PKSC0lbJsgitOoqdkR1zDZvAzpGMA6T788Gn0wSkEwic
 9Mk/E76Vs41BL81AzXI10+asB2ycywzU+PMNXcywuQ8j6E5izS1f1vQyM/1Jdzk03Sww
 Mt/XIMaDXZijA2hY13eEizc5FXfmFi2Rk6VzOvdwKhLnYFYXZoPyYUQ62F6+9nuw13HN
 7HMuAqbV+fsVgJv5W2+vjdktn0FsoNq0x5meaZf9mVvCeiOsdAje/QXgY1AC2BH9/pkK
 z4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197693; x=1778802493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pnjAQy5uQrEwmgSYURuCn+Sb9FbsR2xmUbZI16rxj8g=;
 b=ZErzejffG4pT+iONoY2GKkA6a4rFe6G1yHQRQo0jYrltja5xMd9air76WEK/BalCcO
 5elliTcGKgnX4Ycbx7yD6wEmL4akMhLlqcWGv5/SjBu80OQXGIxyYc7HXPEkij+lrQz0
 l0aRcsKZYlhm2aYiRTwUY8tvIHDUaETiQVPb0sLD7cAvYPTtdd24x86sMVkhVXV2WzfK
 nAb6tbc7c7AaJL9VOtxRx+7LqPBrVnEQf7hBycKo/q9BIl4R+0xp7ckcStJLAWE4fypQ
 yDS00RMCYE6HWE6AeOj7ktt1gIfMJuQHnibDL20n3DfULpMfzMHJdkaPIlGrvKqaJ/r6
 BHag==
X-Gm-Message-State: AOJu0YwISi+lAsSVqYm9yV7Ewe72j6sJKgC2UiFmFW2wTIkSuVMTnyr4
 oCkgdpcMFpnwN1ZzalRWgG5eT03lKv97arWxkc0/o6BVWQQLrxldW3aGCfb8CRyZr4U=
X-Gm-Gg: AeBDieuWxF5LuourQJu8vpzKRq+fxApWndsY4/+QPTlDoW/QoVkaYxLbfu3lM2woS1V
 EH2h4XUkZ513H+47ULm3CCqE8WUDuCAoPaBgy6A+sNWKUWP+MGSs5ahX0ymHpVp+727bn4AZiQn
 BO0ioN6tOTTGdlpxgd0iro1zCoGC+ghWcfmk5XzFj0cf/bI6PYl7oRpaaIncjafz7yyG4xL4CWe
 9TJ4Lto/BbxiWO9UhBhwaGqzJy5P/a2CxXGWVCEmQv3ceSGyh+AITRJUyRi8bM7/zqvDrjMQRim
 2LJsdaA4patvbAG1hdt2tM4ni11maVs0BeVIYAzSdzCN8085BcLWnq8lk9/ovGymEH69Za5O95f
 GSVeAYB0g69LTi54ypQ/phVG0yLVAK+J5mUB2JvtWOjtapclMNTnJaGkuRkLSt9r/RAxD4Q5OWE
 EsSCF+XrOqr5N0sAPZuww6IFeRBtZ0ifA5sa6PZXhBFSg9DA==
X-Received: by 2002:a05:6820:f032:b0:696:2cb1:9ffb with SMTP id
 006d021491bc7-69998d87ca1mr5917504eaf.55.1778197693249; 
 Thu, 07 May 2026 16:48:13 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4355736f517sm242730fac.12.2026.05.07.16.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:48:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 59/60] target/arm: Implement FMMLA (FP8 to FP16) for SVE
Date: Thu,  7 May 2026 18:44:12 -0500
Message-ID: <20260507234413.643512-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
index 41066ec5f7..546d29979e 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1697,6 +1697,11 @@ static inline bool isar_feature_aa64_sve2_f8mm8(const ARMISARegisters *id)
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


