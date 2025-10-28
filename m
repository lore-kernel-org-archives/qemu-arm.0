Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B85CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:00:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDckL-0000Kd-27; Tue, 28 Oct 2025 01:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDckJ-0000Ju-H6
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:59:51 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDckH-0005EM-QB
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:59:51 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso40417485e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761631187; x=1762235987; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y/pnrcoc7cYS7GwGVqSI0sbh32hz5/hHl5ailiW8kns=;
 b=lLTokvCsaWAjL98MLae1c+YWqE1/fUFxnWCecmsvJkdeUOYNdMUs9V5C1jzVsAjPNS
 ULA9nLz8B7BVXMbcTV6FpWy0CTKmlpyamcFr7K1Gy/JQHUsFIt4avqjS+tDi8e8FM6Pe
 iMWi10LwenYbDYWWZJ2U4ht8e/pvUGVnDUgyPKSJzoWeB9mJWQESZ7HRlejupCl2S+Rl
 qgA0jqbCJ6veEszZqMmBg72ZHKpUQtxE4vaeDAPZaTeMcNQKZrbKauUVoQSMumjzutdH
 rFIyLgLIGGQiOvZfi85SsJCYyL8NylHC7k0tDXH9KcclkvYRqq0W/B4454vhdL7WcKK4
 TxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761631187; x=1762235987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y/pnrcoc7cYS7GwGVqSI0sbh32hz5/hHl5ailiW8kns=;
 b=c9mn1iGGLWx58m8Q6mFRma77u3ozEY5ByeutnV0MyX1o7QdEyTJqui8vhQIB63Uc06
 sSygKnvgfbGLxS7/gRYHQnYn/odohoamx+WEctWhYep1YVzXiQR/OTzu3HLuO2JBCqOc
 MhzFAwVlNN6SmCA+C09tQ0TvrTTHbHIP1i6M0BTyb40NhD1Vj6eijCkxVbGWMSS2TzeU
 oRtlwqxgnzAaKyP2mBkB/ed9IKNWAgJGQLztzrneVADCvwZjZ3Xsi32kFYt78BYvCrX+
 vhZFneQobnhkBFSekttwm1wZTuAANiyxEHrxq3IHL9H6KDKhvVVW4VYi+liflzmK05zN
 0mWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyuQBlxXHwkeiFviR/wuDxO683l7h6MVt+NpcB1Xflrsj3aoKW9ovdWUFY903aNyIIeWiZs0HTxA==@nongnu.org
X-Gm-Message-State: AOJu0YzGEyU9TvMLAR0ufsLSnCoAMphOjPER/d6CBIO4b/eJ300Bum/S
 xjOyrIp/Xj0yOWrMB9z3PrEmo0XtVrctIUMNEJ38gcQ9oaXfsUwUB0H4KMxIOldqSik=
X-Gm-Gg: ASbGnctUk1GJqPghkreLLPMGFe2WAuT2oQ33kDmRb4+mPvixwGJdBsiUmF1t/SpM+D5
 RTr0f/8dTafGdR4y4B+Oe6TU1PYUxUypXt84SuOYeopVUKCk2mzMjkz2k9/IPQSR4VIHVaJb1gY
 sj5sHW/vgeOMMJxGzpa8wSFryDc6UnVkKjwNVlob634iwCpZEQWMqGkRf2gWtP36GS3n4fLFlRz
 vX2UzPnVPELr58UEOwXngWzyAOnDt+7a61Qq8GU+VsDM1KRMecX74lhj/uAOCtpMNM2hNot2AWu
 xnFCJhqBmQAfyEIg9jqiIOaU3xufUbSHRJk5jraQI/2IsIYoqbk5hnnWNhUILiDfyO8sJKtiW1k
 6QBZdKU43e8d4R65j0uPeREuKdIqPC73mFqg3UXIWSiEWthFYhkc0YscsdEQemwLCMd1GW5HFn/
 unfJdmsQccVoccAJncur46SN7xo5ocdRJHKBxje5l7gZ8JaKi0mBJN6E8=
X-Google-Smtp-Source: AGHT+IHYMVKfZEVR9J/wlSA+dishZEk2oVCDLXjk9MfKtSTnULTiRIcxTejUPDTOOFx6pXuYd1RQ1Q==
X-Received: by 2002:a05:600c:608c:b0:475:f16f:6e10 with SMTP id
 5b1f17b1804b1-47718170f3emr13646525e9.18.1761631186768; 
 Mon, 27 Oct 2025 22:59:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df3c7sm17969161f8f.40.2025.10.27.22.59.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:59:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 24/59] accel/hvf: Restrict ARM specific fields of
 AccelCPUState
Date: Tue, 28 Oct 2025 06:42:00 +0100
Message-ID: <20251028054238.14949-25-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Do not expose ARM specific fields to X86 implementation,
allowing to use the proper 'hv_vcpu_exit_t' type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/system/hvf_int.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index 195d64dcf18..3d2be4092ef 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -59,10 +59,12 @@ extern HVFState *hvf_state;
 
 struct AccelCPUState {
     hvf_vcpuid fd;
-    void *exit;
+#ifdef __aarch64__
+    hv_vcpu_exit_t *exit;
     bool vtimer_masked;
     sigset_t unblock_ipi_mask;
     bool guest_debug_enabled;
+#endif
 };
 
 void assert_hvf_ok_impl(hv_return_t ret, const char *file, unsigned int line,
-- 
2.51.0


