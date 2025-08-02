Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA023C87FD2
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:36:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLjh-00053i-6u; Sat, 02 Aug 2025 19:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLhr-0000E4-MG
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:32:04 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLhq-000581-3z
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:32:03 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-301fb587dfeso1041336fac.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177521; x=1754782321; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=80S2/0N0JL09bgOILR4cEYvK2n2zuzmPlht61UmRSoo=;
 b=LScW97aWc0IwGO6fhEQ+m+0cV8bwSBrDcoDwlMfY2jRAnMQ20EWNS5ZwjMoix3CW2P
 aeR/xo6Uv92STGvz5BmfK1pCeB87C03t1ehulRqZCLFlicTQbjk1CvEzwEe2q1qldlAF
 QUcsbjyb2krZa/iR4DEjvx1wXqw0aDDElAD7qlJFj7kzkemUwrD8Za/BEAYYFSL2umLB
 94MYuqrh/CSVYhbkM0f/4l9s66RWXMLQ+iU1MGxczipD84qfm3VUkiSEGkhYDeOTShRJ
 5CHSHEg1gOMTXeSNOjvh7EOChTTIjWh21hO8ziSCF+zBTWkA0TMUDqc/rUN7oqmXBc0p
 mDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177521; x=1754782321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=80S2/0N0JL09bgOILR4cEYvK2n2zuzmPlht61UmRSoo=;
 b=bNHiFOsgwYiiaR9teV8vj50k6hVgc3GlvhDo5nJbfLDkJhBZeHUPdXe1mqpJRCS6Ho
 6gf0LJu8i9mNOzwyeXFX91bNpGi7A5f7Tz2ytrRoEYXsTbx88ao7aNm14TjHWNUXTxVF
 86Y5KKpuv2cKvEkzSX8Uls34T3s5/3M97hU2tmubZ2R9/573/O8gJ89lB0E/G+Jbqklj
 K5Divn/CONBAoYd096B4TMN+PY3LbW1w0NxnZPzT2l1xtK4iKCEikKcEHXwYFNqU8yUp
 T0iCGb7UKS0mzdKDWGWwSu1WAf/Km5nYgw3OFjrXMI1xLieRekOzRBx7xVyBQGb3hIUA
 4lBQ==
X-Gm-Message-State: AOJu0YxeUHW4VzkwV4Gg4H0nZSj6uoUws91UBOTixjWZmOKO0HP8B96H
 vaQK/yb+tm3o/WRgvxux1EY++L9yJ8/06l+tG9d59Kx5Y1JeHn28hA2u8Y/YJKot1bM=
X-Gm-Gg: ASbGncv7X93lxRj2Lqbqr1K8iWvxLQp6pVWPDQDI64DP0x6L03TrCcS0ashwWo5M9T8
 y3hpXpRMwK/8/TbnHJbNqQOoztQCJbWFfHai35NPpMaJh5Vf1B6GsDNwqK7/IGROBBq1f8R2TG5
 7mLQXi6d37jSYPQOkxb0IckaDAuiBWNwhaqEsSRSmUO261V1ePZcAwcP1OCwWPlY8iJuzQchJPJ
 HwnUP5+yh3QDrLeiwR5BEQhr0OH1EODI7W2cCSu1voClqC5ARw3d+4SNWLUaUetcHc9esck43gZ
 YfScTxP/UYAwwui85aAHMlapX6uY0J1bbn8vlU2GVjXYfqbeJ0GWR2YD8YLV+vm4EApEyT2xsf0
 v2Uu8CU0i0oa2CYvKph5TFMg8/DACdmfS8hkK3gqJnZFjo6vdEGCU
X-Google-Smtp-Source: AGHT+IFSiTLcFvVavDCnFphBzVtRMt+JjFpj/cVl2bCVv8zeGfITTueW6pivqmjt8DD2xzwLTi9pgg==
X-Received: by 2002:a05:6870:e30a:b0:2d4:ce45:6990 with SMTP id
 586e51a60fabf-30b675d5eb9mr2582942fac.7.1754177520740; 
 Sat, 02 Aug 2025 16:32:00 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:32:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 25/85] target/arm: Enable FEAT_S1PIE and FEAT_S2PIE on -cpu
 max
Date: Sun,  3 Aug 2025 09:28:53 +1000
Message-ID: <20250802232953.413294-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 22ccc4f697..f4a41c854f 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1253,6 +1253,8 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR3, SCTLRX, 1);     /* FEAT_SCTLR2 */
     t = FIELD_DP64(t, ID_AA64MMFR3, MEC, 1);        /* FEAT_MEC */
     t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
+    t = FIELD_DP64(t, ID_AA64MMFR3, S1PIE, 1);    /* FEAT_S1PIE */
+    t = FIELD_DP64(t, ID_AA64MMFR3, S2PIE, 1);    /* FEAT_S2PIE */
     SET_IDREG(isar, ID_AA64MMFR3, t);
 
     t = GET_IDREG(isar, ID_AA64ZFR0);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 1489c262b8..6ebf9c9ce9 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -123,6 +123,8 @@ the following architecture extensions:
 - FEAT_RME (Realm Management Extension) (NB: support status in QEMU is experimental)
 - FEAT_RNG (Random number generator)
 - FEAT_RPRES (Increased precision of FRECPE and FRSQRTE)
+- FEAT_S1PIE (Stage 1 permission indirections)
+- FEAT_S2PIE (Stage 2 permission indirections)
 - FEAT_S2FWB (Stage 2 forced Write-Back)
 - FEAT_SB (Speculation Barrier)
 - FEAT_SCTLR2 (Extension to SCTLR_ELx)
-- 
2.43.0


