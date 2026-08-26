Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D66C5DF97
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 17:43:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzHeO-0000b4-Vk; Wed, 26 Aug 2026 13:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHdx-000060-3N
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:33 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHdv-0004oe-BA
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:32 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-cc1c8d4a959so686024a12.3
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 10:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787766150; x=1788370950; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4jzGNhaLx3zE9dzspkiZZcbA9C9gEpNpA5SHsyurALs=;
 b=hGO6dYzl9UmA/+KiitDk9b5F7rf+Po5z5r07eSFo3VXKBQQELnGzJ5iX9HVyYlrE+U
 YaSgbG8Jw8I2Dij/ZKk7L9/a13oWs5NSQyjbZOFb7AJqMDUkQDJgFJ/cxYoQ5Yr/SIJJ
 Fey+Z/xSv3piDkvH3ygrrjD8EVCKV9UcgyECc61p6Yhmz4k3WnCutqcfxHmQJTRjBq6i
 6sOos3a1NlHbkauTPC9t0ukHqpCRGcxuHpa6UMqb2r2tcergfbCcTio16VN3IGXaHwS9
 XOYTQm0LxU5Gn0GGVVS8yT6o+bvW0V0XwHpYHqc90fhZBSm++ZeZf6o1IAksxwuYubQ8
 PHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787766150; x=1788370950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4jzGNhaLx3zE9dzspkiZZcbA9C9gEpNpA5SHsyurALs=;
 b=HOH9ZtEy1Y6v/foUmi0NxRFKAgspCwawUa60BKOtEiOIaRGe9WiyNjBjYaRI4dsISH
 G+hBU2n3j/4uYopQxqu59HsyV+KIMvQpFK1pzk0NGjcUKif2E6Ok2VnS+Fi9LSpCfENp
 UrI9powaQ7+4ge3v9Pr5I7FqqmoY9yBgzuBaqKd3HYi6N67VsWMst9E0GDO16Mr+uuWV
 wuQKma0n6JfYK/dnAWuf8P0Wo8SdVmv9pBkRAJJ/eWgqv6nj9i7W3WuLC3y/wvisVvvg
 QG/gKzMejoNMwmjZ/dqOCCjgANFnFi4yRKsbzwi5wc44sA4/13nXwU0slhjOhaBcS3W/
 KJzg==
X-Gm-Message-State: AFuF++nHLD1LgiP81IwaE0SuJSwGB4K4VauheOtfZaqIhGShuaQ2lCS9
 89wSXTykufWwip3rnegstXgfnC5CwN/a9l3eje6pa6as5fywJI1lweD7OMjjtCHYha+AAl7O6Nh
 GUhFTvj0=
X-Gm-Gg: AR+sD13Kw6GBkqRNTbUy0y5ADjYk8rU50QeSIy1gZdRHqGhoLFv1xAY6qQciiI+HbGq
 +CvVJkmKRNa61L08WmNuIIthXehVJYWzt6SHiNr5uU/5+Ox/CBD6gpFDuH0t8xkU0N/sW9cFnq5
 K/ucEEc2QSbbCLzCUt7N5OF75SeLI75SVY5aGiA26mLF3IMDkEGgkCvtXl6x4ctcFbZPPHOCJkO
 Owphe/E6rTNvYMWMay0AN7zaSZCyxi0TBHIaGX5S14AI/NofeVm0/L8QgKTetvADPxhJ9b25RMa
 e19PwxYSwd2WN3LgZryDvr/xpTgmenzORmw6PAcaEZbbogQAW2Xm1ZHpT+n4k/WhDdqkDQb8Yes
 T6N6KslI13AwHJbe23Pe95Z0Vz3yMdzYx9ixIzZ+dJaQkNa8VQSYpsi63YOUHPHBNnwn0hWy9pm
 2Cwj4IRN7fN4sYVUjev517L65q+rOm2svIYcu2fLnGr3ePqwe3+wXJ9FcBfoKNdmeU1/4AXX80i
 s0bwd+zWGNHIMpi0w==
X-Received: by 2002:a05:6a20:e18b:b0:3be:b0b3:3962 with SMTP id
 adf61e73a8af0-3cf83f36b8amr18852117637.9.1787766149906; 
 Wed, 26 Aug 2026 10:42:29 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc1bec66020sm1260072a12.21.2026.08.26.10.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 10:42:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 13/25] target/arm: Implement SME BFMUL
Date: Wed, 26 Aug 2026 10:42:00 -0700
Message-ID: <20260826174213.614571-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826174213.614571-1-richard.henderson@linaro.org>
References: <20260826174213.614571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c |  4 ++++
 target/arm/tcg/sme.decode      | 24 ++++++++++++++++++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index d28574a8cf0..08b25b0be9d 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -903,6 +903,10 @@ static gen_helper_gvec_3_ptr * const f_vector_fmul[4] = {
 };
 TRANS_FEAT(FMUL_n1, aa64_sme2p2, do_zzz_n1_fpst, a, f_vector_fmul[a->esz])
 TRANS_FEAT(FMUL_nn, aa64_sme2p2, do_zzz_nn_fpst, a, f_vector_fmul[a->esz])
+TRANS_FEAT(BFMUL_n1, aa64_sme2_sve_bfscale, do_zzz_n1_fpst, a,
+           gen_helper_gvec_fmul_b16)
+TRANS_FEAT(BFMUL_nn, aa64_sme2_sve_bfscale, do_zzz_nn_fpst, a,
+           gen_helper_gvec_fmul_b16)
 
 /* Add/Sub vector Z[m] to each Z[n*N] with result in ZA[d*N]. */
 static bool do_azz_n1(DisasContext *s, arg_azz_n *a, int esz,
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 4e19c42b196..3e4cb7e5829 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -296,10 +296,18 @@ SQDMULH_n1     1100000 1 .. 10 .... 1010.1 00000 .... 0    @z2z_4x1
   FSCALE_n1    1100000 1 .. 10 .... 1010.0 01100 .... 0    @z2z_4x1
 }
 
-FMUL_n1        1100000 1 esz:2 1 zm:4 0 111010 ....0 ....0 \
+{
+  BFMUL_n1     1100000 1 00    1 zm:4 0 111010 ....0 ....0 \
+               &zzz_en n=2 zd=%zd_ax2 zn=%zn_ax2 esz=0
+  FMUL_n1      1100000 1 esz:2 1 zm:4 0 111010 ....0 ....0 \
                &zzz_en n=2 zd=%zd_ax2 zn=%zn_ax2
-FMUL_n1        1100000 1 esz:2 1 zm:4 1 111010 ...00 ...00 \
+}
+{
+  BFMUL_n1     1100000 1 00    1 zm:4 1 111010 ...00 ...00 \
+               &zzz_en n=4 zd=%zd_ax4 zn=%zn_ax4 esz=0
+  FMUL_n1      1100000 1 esz:2 1 zm:4 1 111010 ...00 ...00 \
                &zzz_en n=4 zd=%zd_ax4 zn=%zn_ax4
+}
 
 ### SME2 Multi-vector Multiple Vectors SVE Destructive
 
@@ -380,10 +388,18 @@ FAMIN_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 1    @z2z_4x4
   FSCALE_nn    1100000 1 .. 1 ..... 1011.0 01100 .... 0    @z2z_4x4
 }
 
-FMUL_nn        1100000 1 esz:2 1 ....0 111001 ....0 ....0  \
+{
+  BFMUL_nn     1100000 1 00    1 ....0 111001 ....0 ....0  \
+               &zzz_en n=2 zd=%zd_ax2 zn=%zn_ax2 zm=%zm_ax2 esz=0
+  FMUL_nn      1100000 1 esz:2 1 ....0 111001 ....0 ....0  \
                &zzz_en n=2 zd=%zd_ax2 zn=%zn_ax2 zm=%zm_ax2
-FMUL_nn        1100000 1 esz:2 1 ...01 111001 ...00 ...00  \
+}
+{
+  BFMUL_nn     1100000 1 00    1 ...01 111001 ...00 ...00  \
+               &zzz_en n=4 zd=%zd_ax4 zn=%zn_ax4 zm=%zm_ax4 esz=0
+  FMUL_nn      1100000 1 esz:2 1 ...01 111001 ...00 ...00  \
                &zzz_en n=4 zd=%zd_ax4 zn=%zn_ax4 zm=%zm_ax4
+}
 
 ### SME2 Multi-vector Multiple and Single Array Vectors
 
-- 
2.53.0


