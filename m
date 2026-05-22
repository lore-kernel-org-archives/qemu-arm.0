Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7729CD4F3D
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:12:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQY2Z-0001xt-MO; Fri, 22 May 2026 18:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1H-0006kP-4M
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:05 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1C-0002dB-VP
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:02 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2ba6485d219so59993675ad.3
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487616; x=1780092416; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NYnhgOtc22ps1dbE8uAHDywGG6G9iAb2JOADAM47v90=;
 b=MBLAL7vXqEJDjz1Ue3yzRf5FuAQwHWeECCihymfGSZewCd4zoI2Bdrcj3Sf00/P8tJ
 StkJtbsVSGtCkNQGcO/el2rINThp2vbM7HEzz6X1wb2aSrhkSUgziR8HuQH9TIimX+dj
 P62W96zS8CsZtstNHRQPD47NynT/ZbQC7Wx55tEyh7UV0IfhTxiVYxM35aS6Dz8yyFcp
 +psdiN3+5ynJHoQFRHZopoeFhPFJfi5FTauppKi392jxgCoBX9CurdcOgRIOEbSIQRk3
 lflpYZA3q2Yj+o630cFdXDRLAPHFYHhn/1fQhILcVYpQ9lgEGD7qyyjhKPznb0CXgIok
 Uznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487616; x=1780092416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NYnhgOtc22ps1dbE8uAHDywGG6G9iAb2JOADAM47v90=;
 b=ALaod8Staw6vVzr2t5mJ+SBqy/0SpZZrkbjib4uGAVq5VqEAJyMU8EJHRpr1Taz19I
 wdXOC3H+YD8JTGF4Dke/j8AcSlDQEjrqZWzjv7nxBvtXX5FXViYDsNK17sv+Muh24Eu8
 +6inZMYT/z0zASSZp/6Cbgicgg0NJ2ukiyb68mmuiqyfd50L88inpFoFWHFGzzkt5rwQ
 vYgKH8pTLUamkh9eZydse/KZjQAOzgk07sot+0CvmD4zinoZnGD8fKMkEMCUs16lE4WN
 X2FSnaSQo/3uAO2gJ2ciOdxUDuR6sJM5k1CvfWy7Z4skxQ6uMtd/5KS5jP5KC0eurQ8a
 6VXg==
X-Gm-Message-State: AOJu0YyvAQOUqZxcCYZDf0rpVPfNKp+t8gyLBIHEP785e6fe3fbI91yl
 tBW/I/kPFwHcxdOyK3Jqwj7u3n5upAXBszIcUL9WltBbryjhorkn7HLQlw9lpjuYfEBHkJg67Pe
 JO4Lg
X-Gm-Gg: Acq92OFGKYlIoug3M/UjHa99CDJN8Ck2KCeoOVnQtcahOrBNwKrGe3hGdf+3SyHD5KU
 caq4t7H0b45iE/IuOIl1aw2nYKO94sBBKfxjRTOFPWsyysNE6s08Y3bqlbcPE1PBwzJZjYUQ+2B
 7aPImUsCrtWZcCYw68OkbQsQIj4GSdmeMovWLZPeccLakghZQxSgShyovkNDKf4EJA6kr76k7Yn
 XPlH2KEApi+gQEbHhSd5zxd1LIqom4lK7GvPzowRBE2bQtUt4wxJ2OFZvK7ZXyhANE6WgHnx/sc
 5XJeOv9nELoh89v7DKC8nwL8/zBBOLHmOL4kbJhmhsJgjnlnbXlCKpsu7gHgeve9K4O/ESlnXKs
 zmU+l9WHJtHiMRGoFnJbC9H4ecXFgEOSFjLNRRQYwOII94Gbs6PVc8LYG68xNx4n5mIeo0PKn0/
 5AMIKkefdLZB2vZYnEsUSQsmkLS2nbpHUdQDwvtPE=
X-Received: by 2002:a17:903:19e7:b0:2b2:67ca:5ff9 with SMTP id
 d9443c01a7336-2beb026f4c4mr60082155ad.0.1779487616499; 
 Fri, 22 May 2026 15:06:56 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb56b7920sm27835745ad.21.2026.05.22.15.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:06:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 51/64] target/arm: Implement FMLALL{BB,BT,TB,TT} for SVE
Date: Fri, 22 May 2026 15:02:53 -0700
Message-ID: <20260522220306.235200-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
 target/arm/tcg/translate-sve.c | 3 +++
 target/arm/tcg/sve.decode      | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index dc2484847e..f74e888580 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8387,3 +8387,6 @@ static bool do_fmla_fp8(DisasContext *s, arg_rxx *a, gen_helper_gvec_3_ptr *fn)
 
 TRANS(FMLAL_hb, do_fmla_fp8, a, gen_helper_gvec_fmla_hb)
 TRANS(FMLAL_idx_hb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_hb)
+
+TRANS(FMLALL_sb, do_fmla_fp8, a, gen_helper_gvec_fmla_sb)
+TRANS(FMLALL_idx_sb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_sb)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 71ec09393c..06bbd7fa63 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1868,6 +1868,8 @@ BFMLSLT_zzzw    01100100 11 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_ex esz=2
 
 FMLAL_hb        01100100 10 1 rm:5 100 idxn:1 10 rn:5 rd:5 &rxx idxm=0
 
+FMLALL_sb       01100100 00 1 rm:5 10 idxn:2  10 rn:5 rd:5 &rxx idxm=0
+
 ### SVE2 floating-point dot-product
 FDOT_zzzz       01100100 00 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
@@ -1887,6 +1889,9 @@ BFMLSLT_zzxw    01100100 11 1 ..... 0110.1 ..... .....     @rrxr_3a esz=2
 FMLAL_idx_hb    01100100 idxn:1 01 .. rm:3 0101 .. rn:5 rd:5 \
                 &rxx idxm=%index4_19_10
 
+FMLALL_idx_sb   01100100 idxn:2  1 .. rm:3 1100 .. rn:5 rd:5 \
+                &rxx idxm=%index4_19_10
+
 ### SVE2 floating-point dot-product (indexed)
 
 FDOT_zzxz       01100100 00 1 ..... 010000 ..... .....     @rrxr_2 esz=2
-- 
2.43.0


