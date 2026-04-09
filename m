Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3E1E98FA9
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 03:51:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAgPc-0000ec-Jy; Wed, 08 Apr 2026 23:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAgPa-0000eK-Sx
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 23:50:34 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAgPZ-0003sg-FA
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 23:50:34 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c76e702e01aso134641a12.3
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 20:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775706632; x=1776311432; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=skSN8swTI7EkG7MjAECKBkEvBElR0vgImQ1L9hy0ps4=;
 b=I3HjK2Y+j8jlLwvol61wGCpZya+FPLFckil8EoO8TbfdhPbVGxq4queqmTYtljYOGX
 blPdCsCw01/QmqImMQ3oDTv3GtNCbol8zSKURTCI/yPxeIoVDxBQnZTrTbqg4aSfe8Pm
 80eSyjmxNb2Zg2g7+PhqbGAyatfUXOW/TeqweooCB0vgNi3IyRQTqqnn2YjiPJuzlBpa
 AgHNGfu5d3p0rdv7BCTWtf1iqRUveumH62/XrTadm1taBSb1cvjXykmnIBARK0KJjRm3
 sXpbb32UhZi0xuxeGp5zqeoWqXEFwiybi8A1CKbfJNh4YbxayM3SxS0d4xX/nHDagLn8
 Ly+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775706632; x=1776311432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=skSN8swTI7EkG7MjAECKBkEvBElR0vgImQ1L9hy0ps4=;
 b=mn1gWhI33s5jCUf76VuO664hVE0h3YsFDYDePQ5soEMjfEVOg3HRory/SRd6+VoCWe
 0rFCJ5NeBdDnL3ymm2b2M5Wda8e5Okwchy9d652fggnaOICgvWzNdSg8KmY6ZcCO6NBb
 ch+O7noEREEiOfRjJKWQjYzXOxNs2jKxbqvl+1ca7r0EIn13zDul7d0Yfdva5pqPxaDr
 FftaCiS3MYn6P6sgenhCDz879THIzUaBHJvYE6zHxcfnkdpUdUoB3W2OEwDc8DziwYVb
 TpT4ZSLjq7bfG6PhRj88/9TENKUUa0yZStJbudXi2ZTtQAtgAbhpUsd73Wk2Lw+mADXl
 HXKA==
X-Gm-Message-State: AOJu0YxO1BwbV7Yjvpo2vrZ6fL7G84JlsJOuG0eYnL1SLXqKELr1WCrW
 LR+KxCDNDLtQe7egBepoEzyJmInboxeP/eClIWgxqks/9e2GR70jl1YnmTmwn1D7S+JeSb0DBtM
 CQjZE2Lk=
X-Gm-Gg: AeBDietzjJDts92MSOGxFdm2HnekZ0J60ToH1zBfrLWBIg2pSRgbAiF0ziFQF2UXF7d
 wfp5vE+kfJFjPtIR2ldGs9+Ppx1hWaENPoWXP/KP+SrRdw+XQcCcrIolLq8zuzIXwh3DurRzLPd
 1/osnIb6paMEDLSv+NMXSP2BxPUQUCCzr5Cn3QfVY7PvdswrCcIL5R8CDclJ1jtKGAnT/BVA6jc
 vc6GvwniJ3ADQKo5ol77PG93469N3lqYSCghZWmkgUIZB/tp4tUbYRD5F+ztU4EvENLPZWcbKey
 jAFimpTpTP+m2VARBKvk6l/AQrpt391SmDiD7hEn+8T5VZvra/nMGo4wp+VPQoJUfh1jce2VgKE
 oIc15cQrr9TE9/Zy2y9ChCnTx4Zq3zJmHCdn+Sa2/aTkVHrVUDbvlaxhhNIX53M+rcW4qorbR7I
 J1iC90reea12ryLgfXn9gtnaoA70zvbK7rIV2ux1hThQAZGh5AJjvuGIT9
X-Received: by 2002:a17:902:cf10:b0:2ad:9b86:ddc2 with SMTP id
 d9443c01a7336-2b2c73acaeamr20502745ad.22.1775706631956; 
 Wed, 08 Apr 2026 20:50:31 -0700 (PDT)
Received: from stoup.. (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2745c480dsm277830605ad.0.2026.04.08.20.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2026 20:50:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pierrick.bouvier@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH v2 3/7] target/arm: Segregate target-specific user-only fields
Date: Thu,  9 Apr 2026 13:50:11 +1000
Message-ID: <20260409035015.132370-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409035015.132370-1-richard.henderson@linaro.org>
References: <20260409035015.132370-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

In CPUARMState, we have one field that is only used for
AArch32 and one that is only used for AArch64.  Use one
more ifdef to avoid adding both at the same time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 657ff4ab20..b11a31c807 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -812,12 +812,13 @@ typedef struct CPUArchState {
     const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
-#else /* CONFIG_USER_ONLY */
-    /* For usermode syscall translation.  */
-    bool eabi;
+#elif defined(TARGET_AARCH64)
     /* Linux syscall tagged address support */
     bool tagged_addr_enable;
-#endif /* CONFIG_USER_ONLY */
+#else
+    /* For usermode syscall translation.  */
+    bool eabi;
+#endif /* !CONFIG_USER_ONLY */
 } CPUARMState;
 
 static inline void set_feature(CPUARMState *env, int feature)
-- 
2.43.0


