Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43E0F9EDC6
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 13:03:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFXE4-0001HB-Ul; Wed, 22 Apr 2026 09:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXDu-00017D-Kn
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:02:37 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXDs-00017y-Ux
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:02:34 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-bab8ae52954so62976866b.1
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862951; x=1777467751; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kgu1+4lGM6dZXG0uV8Iil1k3pEDxsUz8IH6/W2kJVsY=;
 b=Ba0+oiMdZOy28cchLXexc/AZwlAC/jSr3GZNkpqDvGaVlA6GLNAubBp4r+oeDc6W1+
 ebBM2LdcHr7ACyx565mMi1iZ+x1IMtXR5xf6c7I5E3FB5gf5CK79hXfQzaa76KU0wMAG
 Mf36cvcf5tIys27zU8NG8Fcxy2YoXpf0w2bmdi4oBI32kFje0BzF/iBBtgZ60vOIh0Hd
 k8udaAZclXqbpUQ35oIXIIjbsM2HgRX/SY1DL/mEHQWQYfk/ns+yanCSv3DhYijY9qZM
 D+Q0rAIuBV0FRifToRlWbvAh6HECizvXePDTKcfr59C3RwSjkxxvufZgyYwzhbunN9w2
 zhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862951; x=1777467751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kgu1+4lGM6dZXG0uV8Iil1k3pEDxsUz8IH6/W2kJVsY=;
 b=TyOyPndnnb0pH65Pc5FSnFBKH1+Xgotz92PX3SqkchCoJbQDinPhAHi8Aa3GMErQvY
 8X/9tbJ1V1NZI5tG4Tg/rhlE4KhYEfP25vMgvjg4seJ74ZQZG3HQBIdJJKjnr4l57bkR
 BdzqEN6yt4Wht04tsPuVT9xh4GyOk1AoehHiWjQ5MgYrxvLJ/usQ8e66BIh27epQCDYC
 +sdyCw1/iFaQEYJmzHBS++4jJpA2HMD+Egzlkgvv+/xERLTNiX0iVL7dkBEJKZe4jlLs
 wwC9eb1cHTJJBOk1dSeZQnqfpjcxKT7teOmu0J2n/dWHvaBfhxgwM0fw1a/FHRf0/woj
 ElVQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8/SD93KZjPepiOzUa4UJe0mUZXlxG/A5IYxOX57NMKHa5XMDYZ54YcnszAqGJkm4qq5PQHl/cGDQ==@nongnu.org
X-Gm-Message-State: AOJu0YxMCAuHYsWJM5vFSKEjRYlwk7bpJlynpMKm/IsZxHQWueK4Q3Ip
 TKI4ownTb00DzfnKFxhkcb02KNjYI+97ZlHhN9iw+5b/RZYPp0kCYzhit+Mq5fGK3K8=
X-Gm-Gg: AeBDieso881sMuj6vMa9ZxH0VXDDFtIBKxJGqRfsdtQWo9vzNnBoEVpSUQHYN8b7V9W
 tdXZ4AF4TZmobg/KRhgu7V7k6BUP5/KF7oOaoNK/uaktyyuuhzOFYR53UNNs2IJMg/9UNNTCMdx
 pC9D9gdxIbwPTDCVUkymjRVaovLgAkHFTE4Wh8gJvZnbHavkyHZPaA5Q3ZneXVUFXDm3VQnGWJh
 sNS0MI2A8ZOwlyEQfDdhdsp15nzQ3BHPhOfvj4Cj6ZWcBvA8NGssDP6q+UdDmyVfqDVqNGsRENr
 zTwIIWirIKzkBseptwnAhniGj5kaFuVilSncVX0ZiZo0zeJB5MYiXeobd5BinI08lmmG9+PRTLP
 vT7Jx4g7v72sXDGFQYgcdYRti506+jELvoOeDkxLpkHvx2DUOmRc4b/+2kTbO/aFEhACoNXVCam
 Zhj2t/dyzme6Rt2xmX93nqVfWKthS6uEvfrQ==
X-Received: by 2002:a17:907:a60b:b0:b98:40e:f335 with SMTP id
 a640c23a62f3a-ba41adfb10emr1011985966b.34.1776862946614; 
 Wed, 22 Apr 2026 06:02:26 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a7b4sm42442835f8f.22.2026.04.22.06.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 06:02:25 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9E238614A1;
 Wed, 22 Apr 2026 13:52:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 21/32] target/arm: use syndrome helpers to query VNCR bit
Date: Wed, 22 Apr 2026 13:52:38 +0100
Message-ID: <20260422125250.1303100-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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

These are only valid for data abort syndromes.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/tlb_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index c74d8e785a6..bbe1e70bc43 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -48,7 +48,7 @@ static inline uint64_t merge_syn_data_abort(uint32_t template_syn,
      * ST64BV, or ST64BV0 insns report syndrome info even for stage-1
      * faults and regardless of the target EL.
      */
-    if (template_syn & ARM_EL_VNCR) {
+    if (FIELD_EX32(template_syn, DABORT_ISS, VNCR)) {
         /*
          * FEAT_NV2 faults on accesses via VNCR_EL2 are a special case:
          * they are always reported as "same EL", even though we are going
@@ -190,7 +190,7 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
      * because we masked that out in disas_set_insn_syndrome())
      */
     bool is_vncr = (access_type != MMU_INST_FETCH) &&
-        (env->exception.syndrome & ARM_EL_VNCR);
+        FIELD_EX32(env->exception.syndrome, DABORT_ISS, VNCR);
 
     if (is_vncr) {
         /* FEAT_NV2 faults on accesses via VNCR_EL2 go to EL2 */
-- 
2.47.3


