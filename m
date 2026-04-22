Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0ADAF9EDCA
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 13:04:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFXE7-0001MZ-Ne; Wed, 22 Apr 2026 09:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXE0-0001Ax-Hu
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:02:40 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXDy-00019r-CR
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:02:39 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488ad135063so47500455e9.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 06:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862956; x=1777467756; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UF2x3LQsFVeOwuh4smvXIT3vMnoh5OJHhwB45pzXnIE=;
 b=pU4dmjM98QUrZKuABjsV/7+yCrTiB0Jwxg5Do6ZsjpMgtEk37nhxZoyORvMj3vh+bE
 KC2spQWVMhxYP93YxRVfCpOKHvgkKrFzYr7EGc3vLaDpfpK/XkhncNtstWd6A1On2TDr
 t8FbVDPFb7YgII7kuaAk10VoY1YT9siAG41dSscjV3nkd1xgPo2zDQ4LjjQaOyWDfxE0
 I4WRx3/BC9Mr4tZBRoG99ZPybunm6E1xo2FGFC6Y8xs4DGFB8qEnivzdTSNbr5FdVG7I
 +zoDumHCgbkbhVwVl+7hPuCR6hegegXIycslUH52Mz+xdtzPnH8dBr/cQkOMzh2uhtr3
 xHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862956; x=1777467756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UF2x3LQsFVeOwuh4smvXIT3vMnoh5OJHhwB45pzXnIE=;
 b=R63J0Pg/s7hj5pA4Gvl/D1ftY+cNyYCtMzuzgtyx0NzMirKtVZfGQkekvm4r9NVfk9
 riPNHxYOfR7pRkIR6BOonnVZiMA8MNBecNgcULgrJ6gaqLbvmxyvB0Wn9YQ5TIDeJiPy
 15GdoDcz/T6Zver/S4jWZDNI4uTo5JzVVjBklS2xPPahsnQS+8ohFbblC0j6ABWGSWGS
 v4tSw3ExN4VVgbfAyDAFZncNh1rr+ubtWPHO0bUsiuXMPtSt7jlJuGRF2zlt72Zfd9rJ
 BmEYIBgunmykGjiSX6dPKRll49S5/060dhlec/zan6qMxtGkrwzsfc/8lLumxGWiNayq
 vpag==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Ov0C9XHL0fTYyp/7ELrjomujEI8X+GmgVHc8Bhc5BDrqsfbWnoh9jZ4XEpUvRexG2Ra7f7aFUzQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy6/h+Mi+LmWGpyc2pCiu/4+Zgr9eCE3agGX0jrLSpLp5WFP9ZJ
 oNIzSGB62xGp0eTWesD+ouzdMUAy8hms/Ls6lmSJ9tBdp5MBaivpsE9QFKGN433w3Z0=
X-Gm-Gg: AeBDiesRefpN1osIQ/X+89Rfpcry0Ayzgix0gICz/tBkCMPsAL97G2zp6lAi6xjCQnH
 nvzl4WVUJq5NExccZf2nQ/aVzUO1ku3TgXDUK6cDhhwwktiNAsvxbNXXF/7ePid6EKbeRP8cegz
 GQykRu/9qNB+jNHybVjuAHVo9L5RoVbeumn1c0/ULSJlvDEdXjTklMbf+7LX/3mTdWJS6x4jXKp
 1UQIVVZAFDY7T/yBA25+IVG1CRancuE+0Dk26bnF6akb8sm8subDdzX2bht2lQPPJzuoju6knEk
 fVyQtjil/Q2JJIMTPPJH4JREqe3K2FejYfCj2z7MlP0NUn8DEfb2scjq8YSlP3fwlN3Ff89tEUm
 2xYK6UyJn3qIaMkb2RObJ1uoONk5CxB7IuZnwN492eBqpZmh9t+oxZ3v0dy8a9dBmJ8rt0Be/2F
 5UjSlnnQhR5STRkoYgF5dx9s3gjRcHS1mIuQ==
X-Received: by 2002:a05:600c:41d6:b0:487:2439:b7c8 with SMTP id
 5b1f17b1804b1-488fb745294mr205580125e9.1.1776862956044; 
 Wed, 22 Apr 2026 06:02:36 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc177dafsm550412285e9.4.2026.04.22.06.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 06:02:30 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B2A04614A7;
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
Subject: [PATCH v3 22/32] target/arm: remove old syndrome defines
Date: Wed, 22 Apr 2026 13:52:39 +0100
Message-ID: <20260422125250.1303100-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

Now everything is defined with registerfields we can drop the old
defines.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - remove stuff dropped earlier
---
 target/arm/syndrome.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index d4dfab8cd15..04a71eebcb5 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -106,15 +106,6 @@ typedef enum {
     GCS_IT_GCSPOPX = 9,
 } GCSInstructionType;
 
-#define ARM_EL_EC_LENGTH 6
-#define ARM_EL_IL_SHIFT 25
-#define ARM_EL_ISV_SHIFT 24
-#define ARM_EL_IL (1 << ARM_EL_IL_SHIFT)
-#define ARM_EL_ISV (1 << ARM_EL_ISV_SHIFT)
-
-/* In the Data Abort syndrome */
-#define ARM_EL_VNCR (1 << 13)
-
 static inline uint32_t syn_get_ec(uint32_t syn)
 {
     return FIELD_EX32(syn, SYNDROME, EC);
-- 
2.47.3


