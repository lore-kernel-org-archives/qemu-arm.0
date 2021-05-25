Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4053136lfm;
        Mon, 24 May 2021 19:10:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfX9mRkZfqtPEh5gsAHQsKskiOEz05u6qGrzcwQNROP4qnkfD2x/9J9Mc9aDNex6AUxh5k
X-Received: by 2002:a05:6122:2008:: with SMTP id l8mr581390vkd.15.1621908624528;
        Mon, 24 May 2021 19:10:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621908624; cv=none;
        d=google.com; s=arc-20160816;
        b=K3XRWlYScIPDECYU0VB2D6DQ+iMCvtOOya2m3MIEvLZNC002CY/TETs6oU61FdUGri
         0+FjFw8RT/tZg6zIEOvahZcEQqFk26Hbd9E+UnXyfEsam2V6Oy0JtUoTrtm9309Q1rO1
         Bp7nsU30FVmo5N3vVyjmzASqdNOQ7riQCITrm3MO0b4K3kPlJo3yAcHQvpZgMoHdIAMO
         XC/vvI98g7ALX06ptxS7S5n9dtpclRs8HqRn9EKNi7wn2bjrizdHW+JS+AqeVBLiEDvk
         TYxVwYZT6wGASvNGSIZyyGSbHqZh7fk/jPBKcNdMq+3hSyTsiO0b07vCtnYqvENMxDB5
         /uZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rqEfrgTAxZRSYWJVsj3UhKlDudjDrwfnyFzuC7wZThU=;
        b=B3dfqb+wXCMGKB9EF0sSu6SluBM7DUFRQhrPsyLjxehOLaz78gqUkW0hyTdpRXfz7U
         U+7ooTU4ThO30uu5ddCGAAUKUUOlpg4IR6UvtrJfLrJBs+eT2kGtMiaAEndjfGOfR55w
         mRk/L/yUdytYAEGnGQR3nOe1wckv9j2Yc/cgAReBTePGaRqogbjKZTloTz/u5VPxrjBk
         cy8FR8Jo/3jnPkmYJQmZXFIi6PGqdpPHEsZlyZOnV6sncfo1/Gdy827eWqihO4xuohsM
         2lMxDl39PCPPPZGG9xhKnR5i6lacYLDbx+uCihXV6DBIMpdmhpmBCTC9gRD3fNwPr/kL
         6HYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gkaMUMjj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si3336682vsf.190.2021.05.24.19.10.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 19:10:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gkaMUMjj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMWV-0002Vo-QA
	for alex.bennee@linaro.org; Mon, 24 May 2021 22:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLbA-0006SI-5V
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:11:08 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLaz-0005uM-AQ
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:11:07 -0400
Received: by mail-pl1-x62d.google.com with SMTP id v13so15498910ple.9
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rqEfrgTAxZRSYWJVsj3UhKlDudjDrwfnyFzuC7wZThU=;
 b=gkaMUMjjIQbaRhIuF+waM6nyriWD1Y1lKClG5hb5Gxre+jAZvSxQ7vuj8BDVGlrjo6
 PAD9oDpnbLBIVQfaYYl3a/H0GQ4q5QfI8pDYxOA/VNCR2m0XZwd0+JleVX4MlhmRyM/r
 NxyLQenJHtEC4G99ekv/IV1cc3cx8lRNr8L38RFMh+Ly6WAv/B133M0qrCm3ZJXY+xAi
 yfqBl4lTvtcrl0xujbe88fcWgMaCLoZuHkXDvc14JSxO/1NO/UBO4cxIJpKOwRUg3RP7
 mevJGaw1HV+mg5oiqzhfk47m4gYg/DE9AyfH+mDbqg3IDBFhSopd5kpqiUTbAL4u9Bpy
 wpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rqEfrgTAxZRSYWJVsj3UhKlDudjDrwfnyFzuC7wZThU=;
 b=e0YMlLn0AIs8EuHWzd80dFsYRm5YOonYVfsenUXWcYLR7KdC3Jo+Ge4/WXtvPq93N2
 NdcvPgNtmJ+2E/0QcD8TFP4svEpA9Zw+FylgFlTOu8tv6IE7BdOkdI9By3fCEG01uiwa
 LDTTiSZC3Xqi9W6YqK3oIJhHwVEWa1cYQRw0fbfPukXl9rJ/L1cS3ruk/Yx+l6zdnKjH
 ZkQRMFHEPUEy39tj7EmU3X/LlZ2xgtqvcDAVjqopKEbYnxxo3aHi53CuV98xRp/7N8sf
 yL6X7IkkYEYt6XJw4Ra1mpVmPV9tgaRl+BmDQze7WpuphuNZPLg2DR4/H4Cx29zZhxuQ
 GQXw==
X-Gm-Message-State: AOAM5308t7MO8ussxBH1RippsaZmFWmXMxyEaf0vEV9WnEZ/3Zus00gY
 x7YI9mo6DactJxHviIk0Wzgr/A==
X-Received: by 2002:a17:90b:108e:: with SMTP id
 gj14mr2041542pjb.109.1621905054416; 
 Mon, 24 May 2021 18:10:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 88/92] target/arm: Split decode of VSDOT and VUDOT
Date: Mon, 24 May 2021 18:03:54 -0700
Message-Id: <20210525010358.152808-89-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1uVMwStQm2JD

Now that we have a common helper, sharing decode does not
save much.  Also, this will solve an upcoming naming problem.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-shared.decode |  9 ++++++---
 target/arm/translate-neon.c   | 30 ++++++++++++++++++++++--------
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index facb621450..2d94369750 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -46,8 +46,9 @@ VCMLA          1111 110 rot:2 . 1 . .... .... 1000 . q:1 . 0 .... \
 VCADD          1111 110 rot:1 1 . 0 . .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp size=%vcadd_size
 
-# VUDOT and VSDOT
-VDOT           1111 110 00 . 10 .... .... 1101 . q:1 . u:1 .... \
+VSDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 0 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VUDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 1 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
 # VFM[AS]L
@@ -61,7 +62,9 @@ VCMLA_scalar   1111 1110 0 . rot:2 .... .... 1000 . q:1 index:1 0 vm:4 \
 VCMLA_scalar   1111 1110 1 . rot:2 .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp size=2 index=0
 
-VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 vm:4 \
+VSDOT_scalar   1111 1110 0 . 10 .... .... 1101 . q:1 index:1 0 vm:4 \
+               vn=%vn_dp vd=%vd_dp
+VUDOT_scalar   1111 1110 0 . 10 .... .... 1101 . q:1 index:1 1 vm:4 \
                vn=%vn_dp vd=%vd_dp
 
 %vfml_scalar_q0_rm 0:3 5:1
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index dfa33912ab..386b42fe4b 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -269,15 +269,22 @@ static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
     return true;
 }
 
-static bool trans_VDOT(DisasContext *s, arg_VDOT *a)
+static bool trans_VSDOT(DisasContext *s, arg_VSDOT *a)
 {
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
     }
     return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
-                        a->u
-                        ? gen_helper_gvec_udot_b
-                        : gen_helper_gvec_sdot_b);
+                        gen_helper_gvec_sdot_b);
+}
+
+static bool trans_VUDOT(DisasContext *s, arg_VUDOT *a)
+{
+    if (!dc_isar_feature(aa32_dp, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_udot_b);
 }
 
 static bool trans_VFML(DisasContext *s, arg_VFML *a)
@@ -329,15 +336,22 @@ static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
                              FPST_STD, gen_helper_gvec_fcmlas_idx);
 }
 
-static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
+static bool trans_VSDOT_scalar(DisasContext *s, arg_VSDOT_scalar *a)
 {
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
     }
     return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
-                        a->u
-                        ? gen_helper_gvec_udot_idx_b
-                        : gen_helper_gvec_sdot_idx_b);
+                        gen_helper_gvec_sdot_idx_b);
+}
+
+static bool trans_VUDOT_scalar(DisasContext *s, arg_VUDOT_scalar *a)
+{
+    if (!dc_isar_feature(aa32_dp, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        gen_helper_gvec_udot_idx_b);
 }
 
 static bool trans_VFML_scalar(DisasContext *s, arg_VFML_scalar *a)
-- 
2.25.1

