Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21026CA1009
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:11:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkRw-0006Xc-G8; Wed, 03 Sep 2025 06:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkRL-00069N-8B
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:10:12 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkRI-00005t-2C
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:10:06 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45b8b7ac427so19980285e9.2
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894202; x=1757499002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wPrMzC7xkMP6BFGfr7/f+KLgzjkhoBLbvGsAwbo7XSI=;
 b=ShiMvimXdR2D3FTucQzD3ZDgQ74EJMemYdXNjwU0WSBTddigV22N2aHopr6+1BNQDY
 xts/k03eFoR4Hzm0+aB1wwpO4HI7hBiZniPBzmLOVaBC/BlqLYzsryfsw3+fig1TD2R0
 VHEfqdX++itZSDdtMFQsanhgrvuj2xfWDgLcaFA0iFlTQ6iDphrnxlc0UvZN8DC78oVS
 yi1wdJnxtQqpCQUrE4IXrB0VCBy8p6/Lm6wywKR6sIrVn7+Zzx+vjD3nZG7IeUjFUvki
 Met+HeM9QTK3lQb68VQA/lUuBxLItGYyp3KIQSxyrBSVGrTB3OpRKwiNdPbvcPRaFsrp
 RE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894202; x=1757499002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wPrMzC7xkMP6BFGfr7/f+KLgzjkhoBLbvGsAwbo7XSI=;
 b=u3/EwC2Qo2eyoqgCmFIYU+/pfLEcTTZuN3HTy7fwigfU/fYdVQ2o1wgyJ+Elj9fh9N
 hHrA0xDIhc+J4f3/6Yypo5whShYw3r3VsKOd4eRvXrbRSWqMJaUTFUE334EAJ+k2H5dI
 6zQvL+DoGZ/XeBh71xUlVr7tQ1rOGaiy596WLJ41zxytFe+Pt9kcrzpu1UUxN6OayY+0
 jXXq5y2a0TRUaWHsrwhZS1dxRZvMW4jykHz8fsZD1Wu8lpru6U/G/p1Ak6nG/Do7hRUQ
 25bSV9dPjeckW+A35Q/j6Ri0Llg+O+fTWI0oQaxylE44j7GQBxEqPDhl56dH0H/xiWmE
 BMBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQWZbDwZngZCiv/9IIeDq+44zw+sR9XwK/SbjOZK3hjJSRqkwDDgShhG4kiANo14BlkMN8bURBdA==@nongnu.org
X-Gm-Message-State: AOJu0YyF3omI4K4DSjnmpmnhR74+fpN+kGlYv5F2+TzGnvkbdt2/z/EC
 iXhavMZ7Ss9DnBSI/ff4cGGnSh9vzAyQG/4AwjRNXCZjPRbs1F60augYdYgOrk+KPVg=
X-Gm-Gg: ASbGncsbo4H3HQX8Xhby4vfkCP+oaeTYnz3tiepns2QC8BhIbM2hWGVDYieFnpK04FP
 Xzmo71TMr2PNln2MTGIjsAJUAxY9Ap/VRaTeyq+VhUR9dKwxqMv2Z5AgLxIW4lOvYkGzMxnVjdm
 VOwpq9IJtxkRd2oE+KWExMJybcspsji2Ed4s4ZQyU0lq0kIGbn85ME1MRpD6UasuECRuQMcd+qx
 NGrXNGAcXCuxV77PLvSiUq6KqazvZts3nP0cm6OjSuXOSlre+rQtrNrEJxNK78AyxxTZmp7asJv
 B7ToSlP9ZUaMB7uK6GGySmkG2bdpDNnlRdGQeSG8JbOhst3fsy3xk8Sj1uZiWGr7WHfC3D689xS
 MZ1RefWnL/Nug+91cSxqFVeM1N5/fYowEcxJ5+JJ4PsJaPzWgV66KkHoqsJJ4GLOW3yJD3iczZB
 NTQn++EOCQVHdDjBc9
X-Google-Smtp-Source: AGHT+IFqGkT1Nsdy6nEix3cmm2NK4/o8TXTxVSoc7EyZnEEYvN+6IEOCgtR2JSl/s6rnfy/fD6GTRg==
X-Received: by 2002:a05:600c:1d10:b0:45b:891f:afcf with SMTP id
 5b1f17b1804b1-45b891fb24dmr95642275e9.27.1756894202179; 
 Wed, 03 Sep 2025 03:10:02 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f306c22sm320208935e9.13.2025.09.03.03.09.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:10:01 -0700 (PDT)
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
Subject: [PATCH 21/24] target/arm: Call aarch64_add_pauth_properties() once in
 host_initfn()
Date: Wed,  3 Sep 2025 12:06:57 +0200
Message-ID: <20250903100702.16726-22-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903100702.16726-1-philmd@linaro.org>
References: <20250903100702.16726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 26cf7e6dfa2..f81cfd0113c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -762,20 +762,20 @@ static void aarch64_a53_initfn(Object *obj)
 
 static void aarch64_host_initfn(Object *obj)
 {
-#if defined(CONFIG_KVM)
     ARMCPU *cpu = ARM_CPU(obj);
+#if defined(CONFIG_KVM)
     kvm_arm_set_cpu_features_from_host(cpu);
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
-        aarch64_add_pauth_properties(obj);
     }
 #elif defined(CONFIG_HVF)
-    ARMCPU *cpu = ARM_CPU(obj);
     hvf_arm_set_cpu_features_from_host(cpu);
-    aarch64_add_pauth_properties(obj);
 #else
     g_assert_not_reached();
 #endif
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        aarch64_add_pauth_properties(obj);
+    }
 }
 
 static void aarch64_max_initfn(Object *obj)
-- 
2.51.0


