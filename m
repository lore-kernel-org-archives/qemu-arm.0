Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6C1CCD1A4
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:12:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kEA-0005fT-Nm; Fri, 17 Oct 2025 09:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kDb-0004Da-3N
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:10:04 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kDP-0004eA-Kb
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:10:02 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso6234595e9.0
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760706582; x=1761311382; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JqZvHOn07DkcN1hM5TgN0Mo/k+1lQdqmWA6ozj/h18E=;
 b=uiHU0XxdnOsrQu/Pv81QbyjbLEqPZD9eajY2KfWyxnZ7lD8yPpIWtDxjelCa5q88z0
 3Du51rWDlurl7UKDL7SVT0toH3jvWL+h0SrvbhG6Uj0Kl2HDRyA31on3WpWfrAu3GEPt
 7uNen3MOJL17piTKCAnWY5ARgkb2wBaNg4RCsJ5ca0rx9SHhLUEf/dFhfQY22ttwEWcZ
 O4LsPvfjfyDJBUmpH7bxuNncZ3SS9ldO1r7tjsIVTmKGWep4zxXwNVCigVgb1mdpXEvm
 KPtNCNqHpny4Um+ikNBADKCq9KmfbpxU+pCPF9ANhAo53mhg9YFKGDT1UULJGr/Q6dFN
 Rn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706582; x=1761311382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JqZvHOn07DkcN1hM5TgN0Mo/k+1lQdqmWA6ozj/h18E=;
 b=SFrdmZiXsU5qZ+m7sH7+oVjF29rNEV21pmonhDHO3nuyGe2c+WzQmV5dPqBrLN5WMS
 fes/KF9oopuUX/VpkGZRID517igx23NAMaSHCG7Tnhv6ksV0GOcOge8Gf2i7bLvXVbm4
 KStoPC3fcBocdQqnqQtdLXnCnSZQVUnw0xVW7wMipbt43XOfysRdZwlwBrt4EeFRh+fR
 k4FcstrAydeHdxqbt+pOE4jN1vS+gv/OC4uubVlOhE5gbKFMbKRRQ08I18XefVgKbvGk
 PR0Hrqq/6bk90cDSeem1XnMhnWm6WdE9xvPZYxNER/lGdfd8thsrsYBEdVkr67zL8JJ0
 DHLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9JINCENPZ+raeg+P3rt0ORMW9aAMlH83OS7tQWL4JU1msfHXuKiLKc7/ojFwq1nlKeHxhCEf+LA==@nongnu.org
X-Gm-Message-State: AOJu0YweLKUv65ETk2czz7gR2b3yYXc9D2BahP8DR7r/3Qt3z4Vs5CJY
 X0CS6dIcmUjGQQPOl432EN/VWrZA+bijqsQ1ZAG6n6z01+eQ87dAxIDRFiEmtYNeLDY=
X-Gm-Gg: ASbGncumdc7o0zuYuMeIe7np2gJTDumYLjHDd+LcE5H3y0Gguo7z2y6wbnydJc5fI6r
 95POSJPyPNLV39oVdeUvLsj8j+hjhOAWaAJ7y0EjUW+jyInZcFN+sUWuHtgEj98jNB3mhmNohmi
 KbWAPV8cpujpFPAcAV7YJL1KaMrK4OrS8m5UZG/b1CYDJxv58NJluIx7k9ytrr/ZkdiyQCcagN8
 VIoj82xtcbeyAl40Dr0R0ruAeM3zTwHY+6uxoAzTmQhrzx4F2KAxpNGw4Xr3mPHH29R8LYJvmK9
 ef5dv008hAaKQDvPJ2NKhICndLSttUh2XpkZuTo863/rmxs1E1rfJqbJhg6kr9/5T+yznspt4r8
 TiuAtsL292z3leT1AMc2RMoRc60SFo65RfwOyvR10FwTOZ73DAyRpZPD9ayU/lw4qajqOgYEapS
 F6UUqYwfIg3gThtYdf6UpwJY2Z/QrXLQYjn85+MaEmzkImoUu1m78CRK054XnN
X-Google-Smtp-Source: AGHT+IErk1H3Uz2OQcj2tx4t4Ui2XV3s3oek1yyPvPrLTYbX/X+ZHZ5KPM+3ywNHAM+7XoLnU7xU1w==
X-Received: by 2002:a05:600c:3e86:b0:46e:36f8:1eb7 with SMTP id
 5b1f17b1804b1-471178a3a94mr28480705e9.10.1760706581890; 
 Fri, 17 Oct 2025 06:09:41 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471143663afsm81871395e9.0.2025.10.17.06.09.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Oct 2025 06:09:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 16/20] hw/arm/virt: Remove VirtMachineClass::no_tcg_lpa2 field
Date: Fri, 17 Oct 2025 15:08:15 +0200
Message-ID: <20251017130821.58388-17-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017130821.58388-1-philmd@linaro.org>
References: <20251017130821.58388-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

The VirtMachineClass::no_tcg_lpa2 field was
only used by virt-7.1 machine, which got removed.
Remove it as now unused.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/virt.h | 1 -
 hw/arm/virt.c         | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ca2e59ec569..ddbd2d78209 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -122,7 +122,6 @@ typedef enum VirtGICType {
 struct VirtMachineClass {
     MachineClass parent;
     bool no_highmem_compact;
-    bool no_tcg_lpa2;
     bool no_ns_el2_virt_timer_irq;
     bool no_nested_smmu;
 };
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d9ec61e7354..eb0e0e1bee3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2355,10 +2355,6 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "has_el2", false, NULL);
         }
 
-        if (vmc->no_tcg_lpa2 && object_property_find(cpuobj, "lpa2")) {
-            object_property_set_bool(cpuobj, "lpa2", false, NULL);
-        }
-
         if (object_property_find(cpuobj, "reset-cbar")) {
             object_property_set_int(cpuobj, "reset-cbar",
                                     vms->memmap[VIRT_CPUPERIPHS].base,
-- 
2.51.0


