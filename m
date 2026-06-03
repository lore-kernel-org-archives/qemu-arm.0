Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7D9CD6E56
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:34:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcLL-0001e4-E6; Tue, 02 Jun 2026 23:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcLI-0001XN-F0
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:32:33 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcLF-0004cX-Ih
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:32:32 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2c132ac5ec2so10983115ad.1
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457547; x=1781062347; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P/P/bsLRa8Km1ZFwwN9fhqKy4ONbgc9/cxj6UUIH6cY=;
 b=xpT5uizjJmGwvUr6U3L4vNX4p/fhLEJ9jw3gFKafS+XzaKe8s2rGZ7DR5pHknNv6ku
 in31pyC4lqNtrE4vff/1Xp6zys+ut7h0sFvF+kEb7RZUmAJ/BbWQjtbDFk24igtC4iiM
 8OHXonofe5ZkRxvUBEBqY+aox1v1mkxAdD10WSZAR6C5TsvEkA6Q/LNXkjoZI0Fb4WOn
 S1Z1XL6lMWd77mShrKVT7GqPzvN3hbY6EkzPE7S34Z9VRoJYwu0+P+3KKHgEi1J+s1jc
 yinz2/g3yypVOS6qeCB2aYku/5D8H0wO4Tmo1Jl/ntj3sr0lL+WubXoYMFwvXCVEdxyb
 XOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457547; x=1781062347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P/P/bsLRa8Km1ZFwwN9fhqKy4ONbgc9/cxj6UUIH6cY=;
 b=MCuc1Ae8jlL/LiV+s7PzrsRXfvgfrNFWBXah83q/mHKQyJocSyymofu7eeEcpK7k7u
 +vxjPpClSqAn51g4UXbsuaNaVeWhnmax8EKnSPlTzdaXjTTiovm7CKFZff+IuQ+t9x8y
 RFWR8wcw98QnMbiXcWA9tAkDu+5E2qpN92qg/tjVAujZ07UlO/Pox8fQ4cqbqVVimEUQ
 oFqME9FCHFIHBZSPyUTPXFU9OAvryGSrfMhnunnwq9lK3fGX3uu+Hm5ayiVG7SpqelRk
 zFmtA1PmIH1xU1p3+xpHNo21CkPJdC5tZmEyFSja/ioejj8yVY7KkTg7SRJcAwV2Zz7c
 htMQ==
X-Gm-Message-State: AOJu0Yw4L3j2An8oK1U04h01dvbl02iA9p9jGENFsutpaeTifeT09Hcl
 IrBKvsvHvA17B5//v64LBKxDOAU5NXmz5nPFvbC1vh/DggHXYFayIpcUNm7903l3mt0=
X-Gm-Gg: Acq92OGgqI/w7FZmQ3pk3knaMr+byJgValuos9RukwjXBSV4Y9bsuu0gcTEcKwyMekl
 B+l9mx8x5OC4xQ4TaCgD5www7/HqoDUTX0EB9FOu6KspMcgRfxzR9qjl2B6RO79SGP6n6umBMkT
 9SUJHYSCOnVS7v0+f9ERw5S2sY7oJhyQjxGqj4D4M7sKRZqRxxMlExzxs8HYC2keJ/5W47uQF6h
 omxGC4HlFOJpNeFB92gUUqzWLjpguuPR6tQPv+Gb+gFtJ+BmLMvz4BcZE6d2nZ9eXdJXOUGOeH1
 OAkE9SLLy9QMg/y0JO9ADdTaPa1OgKZtkckUPB6kidwOh5VoUVPBJaAaO83jg7PtDBnJ1FB2lFr
 Cg4GJG7gJnDlY/wcIUeklzvLTLKTNKG9O59zpPyKflDs8jgHR4ezUzsxVeG0e3z9iQlFCSxXLvT
 kNuj7gG3agLMpu1PAEjSS78nih+y9kpH8VUrMeliFKarPm83r8HA==
X-Received: by 2002:a17:902:c947:b0:2c0:ab92:584c with SMTP id
 d9443c01a7336-2c163fa8a01mr17026835ad.25.1780457547132; 
 Tue, 02 Jun 2026 20:32:27 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164fa0236sm7785685ad.33.2026.06.02.20.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:32:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 42/45] target/arm: Enable FEAT_F8F32MM for -cpu max
Date: Tue,  2 Jun 2026 20:28:51 -0700
Message-ID: <20260603032855.106930-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/elfload.c  | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 3 files changed, 3 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index d40e39169b..7864765ba0 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -171,6 +171,7 @@ abi_ulong get_elf_hwcap(CPUState *cs)
     GET_FEATURE_ID(aa64_rcpc_8_4, ARM_HWCAP_A64_ILRCPC);
     GET_FEATURE_ID(aa64_gcs, ARM_HWCAP_A64_GCS);
     GET_FEATURE_ID(aa64_cmpbr, ARM_HWCAP_A64_CMPBR);
+    GET_FEATURE_ID(aa64_f8mm8, ARM_HWCAP_A64_F8MM8);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 893e20f0eb..15dafb9aee 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1399,6 +1399,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8MM8, 1);    /* FEAT_F8F32MM */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP2, 1);    /* FEAT_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP4, 1);    /* FEAT_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8FMA, 1);    /* FEAT_FP8FMA */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index f1c8f5aa68..dcfb4f2073 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -67,6 +67,7 @@ the following architecture extensions:
 - FEAT_EPAC (Enhanced pointer authentication)
 - FEAT_ETS2 (Enhanced Translation Synchronization)
 - FEAT_EVT (Enhanced Virtualization Traps)
+- FEAT_F8F32MM (8-bit floating-point matrix multiply-accumulate to single-precision)
 - FEAT_F32MM (Single-precision Matrix Multiplication)
 - FEAT_F64MM (Double-precision Matrix Multiplication)
 - FEAT_FAMINMAX (Floating-point maximum and minimum absolute value instructions)
-- 
2.43.0


