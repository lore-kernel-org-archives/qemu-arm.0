Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742ACCA1009
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:12:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkSD-0007Cq-Li; Wed, 03 Sep 2025 06:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkRu-0006WZ-08
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:10:45 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkRc-0000X9-9Q
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:10:25 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45b8b8d45b3so29587455e9.1
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894223; x=1757499023; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d5FGcGNnO5bFwKSGnQCLf0ZTA2SwcR6MoHg2PC3auVs=;
 b=s8SNLN5uH/pt0WKADoJgRLccczogKUm8KW/fRJtGn73f0IJLErKLKJgI6ZqUZ5RbNR
 /dp3Yd5JlpGhh6uY7Gj1gHfQzY29Vq+UeMgTe+VO5TJ3TETT5c2zOZ6Jwju5U3dGOIki
 BWtgnmDjaRdLE8nFsX3sWPnaqaPjwMasjd4Y/383GyDmxkhUOkHGssYVVOWq5yLNXi0b
 c5jjoWXTXjX2StGIU55/K/rrh0yfE4+3vd5gC1fI/7rXphJ7Z2wHeem0zs4e73z/dfwb
 /w99QKjIhoorlC6xFYVMDwdzjDTy9ufoTuIB2lo/jKjoMdyTc6JSYpUKrEJsIr885LUe
 +7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894223; x=1757499023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d5FGcGNnO5bFwKSGnQCLf0ZTA2SwcR6MoHg2PC3auVs=;
 b=HNRK50NC0E4YNUbGOHkiuLNMJMLBIbFOf3vlHgBl0TyXbli8wUh6KOxZW4sGUmhCRH
 1SeopGo1cJLOmEpFSHGR3cFGqZbY1v2rsIhTE22jgbHJcan78VTvas+XcBEsziiDaO42
 2Kp8YEeGWO13nUKevE0TM2tPMvaNAIMHLe06efCvbIrpn0ZXQd7DXPSlgpbXyKktKQ3t
 WcLfJeNn4H/HloDk2KhvYZJ3czXanr1iU9/e1d4SEFUbfvDZsYl8rBknFD72/cCh6tXk
 k8fQV0oh6+pnlv+L42BUqkLcf1/IDm5Q0afGbMZkhiMGvmizypgD1rE1iRc1eiYkSGg7
 9+dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6n/TtPoGUR5vU7w6M85EubqE+1/MfcrAxY8USssZmlii6RVPDORLhCLKC1u/sld3kqlheAehMzw==@nongnu.org
X-Gm-Message-State: AOJu0YyGO0fQTuVyoS4gTmW1Hjz9pgBS9fUOyS8ukX2Juywf3po+FXcM
 2Z2vbj/6Fk0FM44H/CW5IMqOC0GyF7DhTtSt5zXjXVdScQQHXiCxqorSS2QnCV/USSE=
X-Gm-Gg: ASbGncs08Cl6sMwmVic0HG8hCqBXiuXq2KP47i8TLm7GQHjZwCQToM/1vqO4RxHpCjG
 JzGHk7Rc64OXXeDKtk3lXg8LpYWKA7YyA7/LNChAVQ2w7JEO4QPUJTwqV1sVxET2QLlXw1KBHiH
 ypBuZBAy+rwEDzAthQqWBZCLY+lEfc484csZQgIjj2FpWVYtMfs/qX+S7br+vgAEK3n7H4j8R7V
 hyijXLS0OmTkwQCQuMB0Q4lYkgQddSLuj3HFN9gcdrEIAprB8NV9kNbnPbaRuvAfywSDB+AQS2m
 pWT6wG3fxj0nuV+ubIMbj/4OwCW41hjL/hm3KOERcfKbXNLDCzZBZTGNvffwX26C9Byy54W30iN
 DVYUyJD7HmtwBOT0/l2BzZX2Kb4wN+Zba9kmCgK4xYrCqFrgYNHLUT3JqhPu8ESfeJS271LmSu6
 zMFbuLcqL/GGDqRmxz
X-Google-Smtp-Source: AGHT+IG6FhdEfuIiSctR9fI6wgfSq73X17SaR0W0HqT47riT3b5U2isz3lWPnoyo7+ygKQAQAUu+2w==
X-Received: by 2002:a05:600c:a43:b0:459:d3ce:2cbd with SMTP id
 5b1f17b1804b1-45b8556a7acmr120350345e9.13.1756894222822; 
 Wed, 03 Sep 2025 03:10:22 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d690f2edf1sm12379106f8f.16.2025.09.03.03.10.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:10:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 24/24] target/arm: Add arm_destroy_cpreg_list() helper
Date: Wed,  3 Sep 2025 12:07:00 +0200
Message-ID: <20250903100702.16726-25-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903100702.16726-1-philmd@linaro.org>
References: <20250903100702.16726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

arm_destroy_cpreg_list() releases ressources allocated by
arm_init_cpreg_list().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h | 2 ++
 target/arm/helper.c    | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 400b4d670f6..5af9b1110e8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -375,6 +375,8 @@ void arm_cpu_register(const ARMCPUInfo *info);
 
 void register_cp_regs_for_features(ARMCPU *cpu);
 void arm_init_cpreg_list(ARMCPU *cpu);
+/* Release ressources allocated by arm_init_cpreg_list() */
+void arm_destroy_cpreg_list(ARMCPU *cpu);
 
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0db3e05571f..9b7a2b94bd3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -268,6 +268,14 @@ void arm_init_cpreg_list(ARMCPU *cpu)
     g_list_free(keys);
 }
 
+void arm_destroy_cpreg_list(ARMCPU *cpu)
+{
+    g_free(cpu->cpreg_indexes);
+    g_free(cpu->cpreg_values);
+    g_free(cpu->cpreg_vmstate_indexes);
+    g_free(cpu->cpreg_vmstate_values);
+}
+
 bool arm_pan_enabled(CPUARMState *env)
 {
     if (is_a64(env)) {
-- 
2.51.0


