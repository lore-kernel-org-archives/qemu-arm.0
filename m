Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B13AD6100B
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 11:36:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlQJF-0002Uv-MZ; Thu, 29 Jan 2026 06:35:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlQIp-0002Cq-4t
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:35:14 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlQIk-0007wp-7k
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:35:10 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so12390435e9.1
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 03:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769686505; x=1770291305; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pC4vaBaGdBGxacndhuoO+54POr05bZJYxNH0VvqZF6E=;
 b=aDKnjwHNhkY0mqb7mMHCh0yKU5cOevz4VuqJ/P/5WbG4uFEbdemY5uX6sjo5kOV7xF
 BVLkzrhbGmUtwRCROsE11fKM907WlphTTmLXGv4ollhmAAPuTrtG1pGbze85C023WsQb
 MzV124bTIGzeZkcR+smApGNBnu1OcWOIxlB8TaJi7NJuVvAM3jX2YDB9ki8FB2zVo6un
 MlWT1Uer2/Pn2dnkFc4L/QYlAQ+qL1gV1eEY4Q7u4Gl5XE3mqzcV9sPW3EzmQtbHNpku
 XiGuj5ksNb5hO92egSb0MEmcid7qdeZLYui22QwRIEF1vjaWeQFmfzuuARCn5Nu8+1QA
 2M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769686505; x=1770291305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pC4vaBaGdBGxacndhuoO+54POr05bZJYxNH0VvqZF6E=;
 b=ne0o2KuzWdt9srLKRrm1ED30LlHIaYoAiBXclTpYyC4JUZcjrS5QZmn+hkbszbHpbb
 C7+nPGax7c4DedJLnJVuDwoOirblvVGJqOpmXDMr57dWY27pXlyirtYAGd6LBnZNckpC
 qHj8p10i8csmv0/dMtuQLbYXM7LrD2UKbWM1s33T2yNxFEc6M12kNvGk4d92Ob5JH5Yu
 h2tg8vJ5FA0tBD/D56v2d/oeeLE6f0AZwcqr9LIRh1zMzWbXazFcWV3CrkwxkkJTfMQM
 KXzgqh1uskspGKsErBrLZKjOU0HbjDnrw0W5QR2UrDDc4EZo08HtBKMCQOZb+0bodOte
 8JZg==
X-Gm-Message-State: AOJu0Yz1qfsD8SFG9WhLXJI2gqNS9rifHoOXAXct5N32RY7mjdEjfRYp
 a24hD1A6W/ZoqL2TMQ1u6/mhe7YOihpFmZBoM8dea/sBgO4mPuNd6+DwyYEK+ieLD8YhC4e3Nir
 MJbITT/Q=
X-Gm-Gg: AZuq6aIkGVn86dPjd/sG2OxT0Lz/0ocLyBWENAuj7tHCT+7Qg4wWUfaYx6xa3Vgbunc
 LSc0/XxJmNuZq0P8lMQ+HBaq1c2BR1uvWjI9+QCKIZecgslx6WAKlWlJohum7Qx3WwKpdPfD8dX
 Ss1M7s4QJnLFmKPXSESUfku+/77eKof+L4EcDNIq4KPaPgZok7gSzXc2fpUQ+c/xIxfezy63pT6
 F2tUiLMxRrnrQ5vPLlryKUzGVqqUOvHdxqubLKV/8sqmdUGe1cSnBh9iHP59gkRXOxJrqFFFv97
 eas7/tC82CmbBs2ewgXZ6w4/C5NS8eZfXWH8vuCMH14KcX6wvD/K/v0g4Rtv8AxhIB8k6u0+NLn
 cyymxtX80SVDU2ye2Rb4J0mAS+cmMICHGkFliF5XCyJCmcIZHC//rfZp6DAQ+4x2mUoToGBfUko
 aI2hlupmXlM3VCtXKP/1fmMsclub3p7g==
X-Received: by 2002:a05:600c:3143:b0:47e:e2b8:66e6 with SMTP id
 5b1f17b1804b1-480829b1c51mr37657985e9.14.1769686504640; 
 Thu, 29 Jan 2026 03:35:04 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c42895sm196311075e9.14.2026.01.29.03.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 03:35:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v2 6/6] target/arm: Permit configurations with SME but not SVE
Date: Thu, 29 Jan 2026 11:34:55 +0000
Message-ID: <20260129113455.1283266-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129113455.1283266-1-peter.maydell@linaro.org>
References: <20260129113455.1283266-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

In commit f7767ca30179 ("target/arm: Disable SME if SVE is disabled")
we added code that forces SME to be disabled if SVE is disabled.
This was something we did in the run-up to a release to avoid an
assertion failure in smcr_write() if the user disabled SVE on the
'max' CPU without disabling SME also.

Now that we have corrected the code so that it doesn't assert
in an SME-without-SVE setup, we can let users select it.

This effectively reverts f7767ca30179.

Note that this now means that command lines like "-cpu max,sve=off"
which used to turn off SME and SVE will now give you a CPU with SME
but not SVE.  This is permitted by our loose "max can always give you
extra stuff" rules, but may be unexpected to users.  Mention this in
the CPU property documentation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/cpu-features.rst | 10 ++++++++--
 target/arm/cpu.c                 | 10 ----------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 37d5dfd15b..9d0c5731cc 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -318,12 +318,18 @@ SVE CPU Property Parsing Semantics
      provided an error will be generated.  To avoid this error, one must
      enable at least one vector length prior to enabling SVE.
 
+  10) Disabling SVE does not automatically disable SME. If you want to
+      disable both you must use ``sve=off,sme=off``. In particular,
+      for the ``max`` CPU, ``sve=off`` alone will give you a CPU with
+      SME only (and which therefore still has the SVE vector registers).
+      Most users will want to disable both at once.
+
 SVE CPU Property Examples
 -------------------------
 
-  1) Disable SVE::
+  1) Disable SVE and SME::
 
-     $ qemu-system-aarch64 -M virt -cpu max,sve=off
+     $ qemu-system-aarch64 -M virt -cpu max,sve=off,sme=off
 
   2) Implicitly enable all vector lengths for the ``max`` CPU type::
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6e1cbf3d61..1cb30076ad 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1571,16 +1571,6 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             return;
         }
 
-        /*
-         * FEAT_SME is not architecturally dependent on FEAT_SVE (unless
-         * FEAT_SME_FA64 is present). However our implementation currently
-         * assumes it, so if the user asked for sve=off then turn off SME also.
-         * (KVM doesn't currently support SME at all.)
-         */
-        if (cpu_isar_feature(aa64_sme, cpu) && !cpu_isar_feature(aa64_sve, cpu)) {
-            object_property_set_bool(OBJECT(cpu), "sme", false, &error_abort);
-        }
-
         arm_cpu_sme_finalize(cpu, &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
-- 
2.43.0


