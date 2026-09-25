Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9ABC9832A
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Sep 2026 21:51:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xADp4-00005v-5V; Fri, 25 Sep 2026 17:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADoE-0007lf-CZ
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:27 -0400
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADo9-0007lr-56
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:19 -0400
Received: by mail-pz2-x0c.google.com with SMTP id
 d2e1a72fcca58-8805988a200so697413b3a.3
 for <qemu-arm@nongnu.org>; Fri, 25 Sep 2026 14:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790373012; x=1790977812; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qf9HpDmhr2X/BPeZxdfFZ3PfLAE7JfKlZsgAf57xaSM=;
 b=snfWqfk7Xu5HaipT/pz0RSxTc+uTKxKdICXFLYY4+ZU4leG+QNUZE63r3kOLNEuTOL
 pHcu76vM5JmtswXOvAjgOD2wD+ec6LzcWxXtv+QYucUNX9CVWMD/xGTjBC2ZRyzRXBfj
 2MQGJjQzltcl6+nsrVBWlWHoFFp7iN8noVgH/xUtLYWmdP1kMTCmSUd5fulZfeeznvTg
 tHCaCRD1njYLWQyCRSmMTiXbg4RUumGTy0dccL/xmjXorgKzRRBOyNAllZaK7wliscut
 UQmZm/12dKjjeIke2JQYfLWJWTKiiWj5u9fgwKYxgRNpMTqClpChY3ECsxtkQFmcqM/v
 MNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790373012; x=1790977812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qf9HpDmhr2X/BPeZxdfFZ3PfLAE7JfKlZsgAf57xaSM=;
 b=herGuFkPewO6cYXQvzwXlVrhZ88MmMTOCN/rQvb8zTE2ZboAEmCmRqcdTbBmyu+gSA
 t/F2Em9Xq91DNSVbyihmPCn1WzRG2bAtHQgrIlBUNaOx+6nuXysnex2nXsbv9PXK8yWi
 zxWf2GQVmxXhOh2LfpziM4r+iSwt51sso/zuushQoC7ubQTPfACoxo5sebujlxAu7Gp2
 iQEny0IbgAhy+3sh3+8t1a6qAe0A0FeMxaBX22cmI51KpNk+S90Kb0JSGwxQ92bnSmi3
 HHl4z7QVncNpjQMrbz6fR9105IfQq+EqPDZW0iZx6bqiD1b+Wu4Zhd42a3QwNP9F4WH7
 aivw==
X-Gm-Message-State: AFuF++nddTYioSbLKjzGemH9LJm54sEavVsi5u72KrvIsFJqYU/oquOp
 OzPqWT0KBeA1Ewuh5Q1ToOvLYLrinGS4Ux97oyVtQua1zU5dyyqDgTdQyY3EEL1wC8s=
X-Gm-Gg: AYBFou3qhgDOpiRLTml8b7gBI6FuPnjY97bA15hzD6/UA3azlY1USRZsEQV/q5UySd3
 nEts0dTCtDxOPesB/IAob3scAN320VHCN9Iil2f9nz7IFDrnEg7zT3Pq8kfr9rr7Fe+taZjZ2lU
 urTSB85NjA3esbD1mph8rT+VzDensysK1N8fMNj4agefIqSLyPJCIuy1Frw2lfjJ46MHgSY4PXe
 cLz3TuC5/Kr9B03BOV+2KAn9HGs32UL8/gyWsIwx37oTjwl+jNRz1xtg7n+teOjKA3M9u42FkUr
 gU8zMWzRe2QthyCyuhtY8wFwiQmqrwmDpFjPec9ynEe+AGTh2VpO8P/O05yoVLkIXSmAUgBp6Py
 yX6YWCAsWlTveGyB2v4ZFiGR1Sr4+x0GC8RzJYdnKojZ0Abfj3nVuZbpNradB2PufZrJ5YR2iGl
 7t5+T3bzpSbK8jK+t8atmFQhi+9+Qyd6DV2BCaJes5JY7oOLbb9EhLajLsNKdw4RI0TqKWv3y2X
 XAtxrc2z4c5exKVHCeazqMsDrEMbQ==
X-Received: by 2002:a05:6a00:414b:b0:878:34d7:6a30 with SMTP id
 d2e1a72fcca58-87e9ea6226bmr5185886b3a.36.1790373011756; 
 Fri, 25 Sep 2026 14:50:11 -0700 (PDT)
Received: from stoup (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87fea1940ecsm1725256b3a.13.2026.09.25.14.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 14:50:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 06/14] target/arm: Add isar_feature_aa64_uinj
Date: Fri, 25 Sep 2026 14:49:56 -0700
Message-ID: <20260925215004.456336-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925215004.456336-1-richard.henderson@linaro.org>
References: <20260925215004.456336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 06318d12f9f..a9eebb45564 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -290,6 +290,7 @@ FIELD(ID_AA64PFR2, MTEPERM, 0, 4)
 FIELD(ID_AA64PFR2, MTESTOREONLY, 4, 4)
 FIELD(ID_AA64PFR2, MTEFAR, 8, 4)
 FIELD(ID_AA64PFR2, GCIE, 12, 4)
+FIELD(ID_AA64PFR2, UINJ, 16, 4)
 FIELD(ID_AA64PFR2, FPMR, 32, 4)
 
 FIELD(ID_AA64MMFR0, PARANGE, 0, 4)
@@ -1242,6 +1243,11 @@ static inline bool isar_feature_aa64_gcie(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR2, GCIE) != 0;
 }
 
+static inline bool isar_feature_aa64_uinj(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR2, UINJ) != 0;
+}
+
 static inline bool isar_feature_aa64_fpmr(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64PFR2, FPMR) != 0;
-- 
2.53.0


