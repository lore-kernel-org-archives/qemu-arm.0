Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D03C98325
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Sep 2026 16:28:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xA8lG-0002aG-EI; Fri, 25 Sep 2026 12:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xA8kz-0002UQ-QG
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 12:26:41 -0400
Received: from mail-pj2-x25.google.com ([2607:f8b0:4864:39::25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xA8ky-0001EA-6B
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 12:26:41 -0400
Received: by mail-pj2-x25.google.com with SMTP id
 98e67ed59e1d1-3a0b0fa2055so659217a91.0
 for <qemu-arm@nongnu.org>; Fri, 25 Sep 2026 09:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790353598; x=1790958398; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lPu8wyqwYW7FFX+FsO6U4yGuHiLwgc+qIwPK1MjE+CQ=;
 b=nrFxZj4LgIM6Czb1zjqHkHeWE7ZkY6v4Gq2WxbQXwDHEHv3qikUKssg7GtyEgCaJlJ
 PwsGGwqCd/Lv7f30J/t0awochnqItB/pUv5g+kiU6Z85gNE3xJgxffefWLxGHDpauA6O
 ljlvHiyBEMfsNUsl0V5h0ns88QMO2DN6PdYvftVCAuPGHlgCuc5WNn/hty5CJCyHGW0W
 ROEKnzpparbVnnUm4pzsQX3WqU1DwFboGkJEfM1p2CtLZY0QDQC2uhpQG6qDuDxDly/J
 1gay3RE+xPQD6uIB/BFkhLr9+gyOPL+Fx+IzVBzBTZu/gBJ2AAiQiahEAvMjfl/BlC4b
 D22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790353598; x=1790958398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=lPu8wyqwYW7FFX+FsO6U4yGuHiLwgc+qIwPK1MjE+CQ=;
 b=DxxPgZdE8tzElng/1MSUTpTIPDtCtX7RVvNlWFyTeqp97CTbQQ3SAd1Y5LocaQZa0v
 K4shjRNK19BFEzDd8R+K6vZ5eto09RASlPCFxhUfZxJOY93Y3wgrBOfLwzYMladuNk87
 sfjb81fHxI2eg/zG4V3PfmdL4Tx/3j9L0W5s+qx7L7Xczkt87rtdyDPxMhesmw6mgu6g
 0MxMZfs3d8mKBGekCT1ZAxY7Hs7LRW7CJ8UwU5tbSc55SD+2D6VuoYRvNiTic4KDV99Z
 TPQuwyqbGdBi+dxwiLndYpprfvCzbOFFn6PcNbztXGSmEI41z9X9hpPDByz/afl2kRr0
 PRvA==
X-Gm-Message-State: AFuF++kykmHve45fS8bDvvbMSYHyqNypCdXcjBzvEdKHMOsZJoKmLIeo
 mqotzS4HuzozhwpAptgeV9iUZn7tfi7s7kqERRHGeiyNV7NtSnee1xD4wrJ55zlQVTPWskt++YW
 CMBkB
X-Gm-Gg: AYBFou06SQSviKe18h1h4OfAUBBvMbGHs8acn6Q7YBghq9+SgNMCUzuqZRpnv/163cb
 ons0ECeKh6MiU1sIG1yeyFzbCgzPhU0ONAvTJ0nig48/uNYu4pLAbRLwSSWLd6Bpgcby68TeVAv
 4Z+hhGfBZHBtD+TieTW0XrVpg8yXnipgP473THwWsXocIZyp/WNOwMzCZrTxj1HUvRky2mDidSy
 Ws6jur0dfCCkhB+gH17mu0WYW4evwz3t6VTIgcqYKNxXqJazr0yyiFOCxHcAN2uzWj+cIrXM50K
 DRtOhIRq5sjMmPFu6KchHlyjAeydI7wd5YFzz66On7dndv+ZX7rh/wTCZOCRuzLqHbR2uxH+ezK
 stveXsiqLTo8QJiNoIx//syLWyjfcgMd6JNp+uo3EMNpenVAXGWz4g8Ys7sY9ryXBUCxP+Lo9Yf
 dSBATVlyXjNjUJ/r/35UNKbPQJaPb8aN1A2MBkQtogOSKBcFsS/EJc4J34bwmriVbxPqNGvwx9D
 ZZ9JjbkQFJwuXIuOF5mB18efcdgwSdsipI0GbpIQQ==
X-Received: by 2002:a17:90b:4c11:b0:39e:35a0:9c0f with SMTP id
 98e67ed59e1d1-3a0986eb49cmr5782434a91.14.1790353597926; 
 Fri, 25 Sep 2026 09:26:37 -0700 (PDT)
Received: from stoup (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0976cacbesm11464809a91.13.2026.09.25.09.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 09:26:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 5/5] target/arm: Enable FEAT_IDTE3 for -cpu max
Date: Fri, 25 Sep 2026 09:26:32 -0700
Message-ID: <20260925162632.404001-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925162632.404001-1-richard.henderson@linaro.org>
References: <20260925162632.404001-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::25;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x25.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
 docs/system/arm/emulation.rst | 1 +
 target/arm/tcg/cpu64.c        | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 34b63f9867f..bbdb5d8244d 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -105,6 +105,7 @@ the following architecture extensions:
 - FEAT_HPMN0 (Setting of MDCR_EL2.HPMN to zero)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
 - FEAT_IDST (ID space trap handling)
+- FEAT_IDTE3 (Trapping ID register accesses to EL3)
 - FEAT_IESB (Implicit error synchronization event)
 - FEAT_IVIPT (The IVIPT Extension)
 - FEAT_JSCVT (JavaScript conversion instructions)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index affd87a3ae5..321f78a74af 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1460,6 +1460,10 @@ void aarch64_max_v9_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR2, FPMR, 1);      /* v9.2: FEAT_FPMR */
     SET_IDREG(isar, ID_AA64PFR2, t);
 
+    t = GET_IDREG(isar, ID_AA64MMFR2);
+    t = FIELD_DP64(t, ID_AA64MMFR2, IDS, 2);      /* v9.0: FEAT_IDTE3 */
+    SET_IDREG(isar, ID_AA64MMFR2, t);
+
     t = GET_IDREG(isar, ID_AA64MMFR3);
     t = FIELD_DP64(t, ID_AA64MMFR3, MEC, 1);      /* v9.2: FEAT_MEC */
     SET_IDREG(isar, ID_AA64MMFR3, t);
-- 
2.53.0


