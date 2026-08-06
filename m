Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEE7C5AC7C
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 16:41:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws18K-0006nS-By; Thu, 06 Aug 2026 12:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws18F-0006kb-60
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 12:39:48 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws18D-0000Ie-Os
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 12:39:46 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2cacb8416a1so26016765ad.1
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 09:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786034384; x=1786639184; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EkXaE1LdHjxR5+SLCaE45VZ8+LEX5aQ8OT/h3czPRdQ=;
 b=Dk0219ORsXC3x5e9ZVgx2K2UTAg2aQyiXAj58ZEub/ifZ7kCTvpHlBmP6rbWJwH3xp
 OfMFnZHIE6NVvDkWPKyw0YbqXUvb5rM5K6n0rOCV8OngSW0xMvyET9o2jd63ccOa8Y9+
 zFqiwVUqWalxu8nlYLxS6c5ApckarXNgVLsTOIEw4kUXpQJhsquFV/0kcIpOIteMuNIs
 kmgM6lV4RIzNFRE6z26RrG4qp2MXmxQH324vcSdbiMYNU4dv4C/FSvV9qdjWMSpscB2L
 xVPMP7JzSSTZ53doVKuMLIe/NApq5+tKYSx30JGa6riMt+8uK2cFdkmggPkHARWZWFDY
 ezRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786034384; x=1786639184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EkXaE1LdHjxR5+SLCaE45VZ8+LEX5aQ8OT/h3czPRdQ=;
 b=qz5Ah611aWDLSVThn7GRrQYkIEkuo2Bopqpz30kSgieoSbHVXY3hCPes8IeTkRuR/C
 OB928EuuXBAvlNas7AD0rf1jfwOkrysvVRBxGYqFIJYELDj/A8Hw1gxc9QGB9Gt2ukKZ
 JG/5baXuPT4mtc0JGwD90LGwjHHvPnUA6pSm7sml14h0Rj166SCToHAgcAAA1M56ORcc
 TLtcWrOLLSmU+awPT5hVVrtFsLWFiGCANSApJPisGReP7/OmNqo1jX4sQAb+Bids4Z+S
 7/LWzr2LAcXpf/6AAjJkuVwcctfN5a3W5Yn/WRvYALUnVGpEeh7C9DsX38iFo57ShxBF
 HE2g==
X-Gm-Message-State: AOJu0YwPM9L0F7G2g3pZ40jIuzAQCkPIGFIpiXJAvDA3c9oglyJQIvGt
 j74TRa+/U+bMMy3fBpuzT63jJw+szgGxRzKbCsUlpjdFR8F8dXi7UNaV4NMF4LCGfnc=
X-Gm-Gg: AR+sD11UbBoMPUEiWMkAFZCJ28/bIGL0IFeD6p91hLNJHQBMsDEbrCVsz57Ed5m1nli
 yxRmj6ht1hsboHWSG6K/OHn6nJlullQa2ygcs+cxf9uR+ehhQI2Jn+Ku3jL15y2v2Fj/R5/zlYk
 28OQ7PZn80UbNT187qLtM5dODXjkEdEMRHhqi8o63Wz5U9THEgQJJxiae6miYJAY4Hp8qE3OEXo
 25RjXM1wGmls4pcEL1wWT7ZJiKmuqrR/+zKG3VHGdNpDW0Rb/HTBccdFdB/6B0a/iyMZZsZ/5uo
 J0Zr9gittc7CuqgcqprR23F4bgpq0nOzVLpZCRBYupiqp2op8z0H0Ey4Ft6FtBcMT577kvwUbeG
 fUQVEBCJfr8nqrYZoLZbceD6kl+vEKS/vv4V4m6U/iHgFIHskfXECsi3av+r0k+FFmXp6Wxd/AQ
 pqbrfk0OAo2SmCch86va8193e7xXH88GOFCAKpcg6tFHB1vFVyeQ/SqPbetqBs5s7qy3Zl9Zpnf
 EAjLJlXNp4VXCs024j1
X-Received: by 2002:a17:903:90b:b0:2ca:ce92:6e44 with SMTP id
 d9443c01a7336-2d0ca7b0926mr202890265ad.8.1786034384336; 
 Thu, 06 Aug 2026 09:39:44 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d0aa4ec8c7sm34280735ad.80.2026.08.06.09.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 09:39:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 4/7] target/arm: Sink aarch64_aa32_a57_init into
 aarch64_max_tcg_initfn
Date: Thu,  6 Aug 2026 09:39:36 -0700
Message-ID: <20260806163939.328201-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806163939.328201-1-richard.henderson@linaro.org>
References: <20260806163939.328201-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
 target/arm/cpu-max.c   | 3 +--
 target/arm/tcg/cpu64.c | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
index bdacfb21d3..cfcc46eb9d 100644
--- a/target/arm/cpu-max.c
+++ b/target/arm/cpu-max.c
@@ -203,9 +203,8 @@ static void cpu_max_initfn(Object *obj)
 
     assert(tcg_enabled() || qtest_enabled());
 
-    aarch64_aa32_a57_init(cpu, aarch64_enabled);
-
     if (!aarch64_enabled) {
+        aarch64_aa32_a57_init(cpu, false);
         aa32_max_features(cpu);
 #ifdef CONFIG_USER_ONLY
         /*
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 8a3ebf6321..2c0b7c1be4 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1167,6 +1167,8 @@ void aarch64_max_tcg_initfn(Object *obj)
     uint64_t t;
     uint32_t u;
 
+    aarch64_aa32_a57_init(cpu, true);
+
     SET_IDREG(isar, CLIDR, 0x8200123);
     /* 64KB L1 dcache */
     cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
-- 
2.43.0


