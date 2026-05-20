Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC01ECD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:24:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlYl-0006r7-Og; Wed, 20 May 2026 14:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYj-0006kC-Oo
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:21 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYh-0000TF-K0
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:21 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-366139223e4so3011775a91.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301338; x=1779906138; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0L8sm2nuOmiw4XE7Qu74ytG281Y5T5t916Djua5D5pM=;
 b=lgYDqEWT9940ZLa/V6Cc4sSy/R6rg8BjD0I7vJrss3A/uFqndtUVuM4AkE5p9OXL95
 hUxPWJXMM+YKAE1S27ThN1e+PLWB8HP3CcyVpGU0tJJyu66zHZys8NvjFNaRNm7JDYg8
 ecuqUFQedv+VHYg6ZS1XFk6Z9MUtNr/zahny0iqZ/2lju0OxE/mUV4eKQ+iqxVqK1tQw
 pnkMAxDhpL5ft7UQnMWM/hZGn8pabJ5JvRa7dP5YxtZ7y9qdxx6lgLx9Dl9IC70EjtJ6
 Mlwimm451kIk4B73vm85qaMzcbQvFtxyRIn8TSojFT08U+fCrv01HZdeWQRXPTydjYO5
 ObKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301338; x=1779906138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0L8sm2nuOmiw4XE7Qu74ytG281Y5T5t916Djua5D5pM=;
 b=UCrK7G1o/0IFCznetM6OTSzWmLqQpkF2vJp3sGvOzvQ6EYulIRG1NuLLQh+DsNWFX4
 g+CxUN9/hbL8Oj41wzIMgBQ2GitHJUjM8RM8v/kRZNh6kn7pprRgQWNvus5azIOhwTPc
 kykKJ9g6J9VWpfD4gapB679vnJqygAs/DVXpontflYGj9T+4JmMTEb9FMG3WgUqCQMUZ
 k0GDpD///JN+UZBsNLtUHdGiO3bYKObPocpJ+1jb/qRKvVefDrmPb7eB+eDw4v/aZ+Z2
 jkg7tTqMpnqnaoG8m3MnMVJ5c1sNy9bhLB03fDw+upTs5uaJDc9xaMqY+ZL9rnTozaXl
 85ow==
X-Gm-Message-State: AOJu0Yyk3ymyJ8jijsnZYwDRF5p0yQBftHjHmMLyczpNgP3NVuRPd0Tl
 hae8TxsjmjzalRgZxGsNUjCUwTSqBwlXM0ErZ9idMqFVxrOG/DadOZ5+lr9ZiuBNiHc0/qozZl2
 fTtPkqmQ=
X-Gm-Gg: Acq92OEHQ5+MeFIU+u0skjsaS8gyylCt/JpQ1ssXfOnej8hMGzAHvJqKjzgtQG/exBl
 dyXIk7KtpHFfZsZXw+YMuTCKMEJ2DSc/fRpewt9nPSRUsOef9q1H9IcKkP+xC28sdo8HSt7jvdf
 Cvtr+GznPAmthWexo9uMdZ+8M8EfuxZygw5+kl0eFG65+ZXPUCh1nSqaaxLlwJe9NcswXXu4Qx5
 rtmdMZekw3wE7NlqhpeVhenCfq2zWg7o0qqkRZNho4eVJc4k/5h+FRLgr6PpPHPVMr9Ph60ObL1
 lMf9XlNrkv/+5uWWuY5lSyUMg1NsByJEx0CnO2PqXW/MU4tWEexWJ3bee19yjN6m2QaZ30DLQat
 YFf4EWEybCJ8XolIP2o6iWqG2itMpZ82AkaS6219QftFXfC4Z06P5wf/psZOhAdQFbuX0NmvtS2
 uo5cv2fR9KeUfg2CGYwv9+6HR0NBLS
X-Received: by 2002:a17:90b:3804:b0:35f:9ab2:a5bb with SMTP id
 98e67ed59e1d1-36951a1cc30mr25925826a91.10.1779301338157; 
 Wed, 20 May 2026 11:22:18 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3d210b4esm274764a91.17.2026.05.20.11.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:22:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 05/64] target/arm: Enable FEAT_FAMINMAX for -cpu max
Date: Wed, 20 May 2026 11:21:14 -0700
Message-ID: <20260520182213.872945-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
 target/arm/tcg/cpu64.c        | 4 ++++
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 5 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 649d854a65..ff0c2b1c47 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1266,6 +1266,10 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR2, ATS1A, 1);    /* FEAT_ATS1A */
     SET_IDREG(isar, ID_AA64ISAR2, t);
 
+    t = GET_IDREG(isar, ID_AA64ISAR3);
+    t = FIELD_DP64(t, ID_AA64ISAR3, FAMINMAX, 1); /* FEAT_FAMINMAX */
+    SET_IDREG(isar, ID_AA64ISAR3, t);
+
     t = GET_IDREG(isar, ID_AA64PFR0);
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8cd7fe7b00..da5f7efce2 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -68,6 +68,7 @@ the following architecture extensions:
 - FEAT_EVT (Enhanced Virtualization Traps)
 - FEAT_F32MM (Single-precision Matrix Multiplication)
 - FEAT_F64MM (Double-precision Matrix Multiplication)
+- FEAT_FAMINMAX (Floating-point maximum and minimum absolute value instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FGT (Fine-Grained Traps)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
-- 
2.43.0


