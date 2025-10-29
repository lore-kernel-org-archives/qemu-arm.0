Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23ADBCCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 22:00:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEED7-0004Ow-Rr; Wed, 29 Oct 2025 18:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEED4-0004Nl-N9
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 18:00:02 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEECr-00005c-Lu
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:59:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso2740035e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761775178; x=1762379978; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Om77k056XpbEIuSnFj8sNIzaZIBQ5Vhk3FyzV1fN32k=;
 b=yHd2VHFwgPg4GgFLhCusbsNGPMgvauRUyLu8J/TPCwcl7bQTiodPlUZ+ZHPsxBduQt
 XeYwcdZux3ombwhA5by0C3n4k4zy1Hfr55Ad977bfWDauBjbLFUxZy5GLNYf3Qe3136s
 H8jzIRNgDtiK3msckJfnAyMbwbKMVgI7AP7+T3L2t1Q6UAbTLeMPDweEYkxfVDLFuWgV
 8Ch/6wLx8Fc3azo/4QYcoi8EEhmKQpW9WafOcJP9aQd+NCiauirm+aMW8ZQj7acE6ff6
 rHqJlUChtDAnZWznpdSM3M220gLI18KBbjckrKSS0BbWBC3uUIIInrIb7g4JZ3bXV96z
 wcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761775178; x=1762379978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Om77k056XpbEIuSnFj8sNIzaZIBQ5Vhk3FyzV1fN32k=;
 b=IZIkdsLJYzLoVXxopEqDOYAmFP3ccavXZH8aGRb+I9LEuuYJUrR5R0PiGfLcOk7N+8
 xQ9HTJqlV3WC8rFjvNC5ICA3BhuAf9LBDrMDBOqvryiqr4nsvvXf1P2kNTG/clamb7qy
 4s37+Tbqy0nfGthfzYXF4ZjMYGRGDOmVKfzFNxi3Pu5DK/2kvzDXyUeQRRje4xpNc8Dc
 zPbfoF+5YoycYP51FgzNydtpceZF7rc2oEPEMitXfDyt0uSdIynnBaUhkb32hJFyg49M
 pi+Omcg3QPi68uh9oC7NBAnvRv2UgSQC06JifCuwG0S24h5rk7Sbu2A1DUP+mWYS2HF9
 GepQ==
X-Gm-Message-State: AOJu0Yxz4/y+QHgPeVRHB4hHXsBCLVAPqiNSkm2ePEw3uHuZddusm0sJ
 Qo1tcvnm0O9t10wZla5usF063sK2Csqp7c0rIfkIoJd2bloDJuLy57chgiU0ilSLdXIHIWNcxCz
 KT0GonmA=
X-Gm-Gg: ASbGncvw6MgG/e7KyfJIAfJMumQUqhcHDu0z7187tyW00Nt007KWXTj9EQSiOoJxQAU
 Rb2d2bbi1af95xhJT8UMWGKwV8hp/ogtFhgfi7DBzE6zhzP/b+ylC1NUVV8UXevH4wd6Eyy9rn3
 GWTjeizae5dZPktRCqs/AykmsDnEjh3Sx1TmHpUW9tPlXiznD4YqBzDEcVYIqiAJ2RO0k2F8JXV
 Y5HJiZ+Dd2HRtFWuDuxBY2uyX8shTRPNcVKLcnZY9ILeJ5Iqbky+nsmpySnZ/hS3570OMaIdskM
 +mNFlaDonpp1+h+d/AjErdKOcYV072fSuf6q+fFfA2Nucatyvro5+MLZDfApUWbbgLgy4IWZO0Z
 dyhBwP1pgFnJQf/gXuDqE+iqzJXsVp6WbUL4RR/eCgWQYZS9QDHQYUNNzORrN2hZuT/tAlU6T6P
 6Ua4q3Z1XTeDqBlYdOh3YROydpx/DclyreowPFoIHqFK7Vg0XLaA==
X-Google-Smtp-Source: AGHT+IEWk0+NwkbvYXS4vcOXkXrHkKtBCtQiFW790Ow8S2NcP7Quu/vxgFXw9rYjI/g4XqIi6rXaQw==
X-Received: by 2002:a05:600c:474f:b0:477:df3:1453 with SMTP id
 5b1f17b1804b1-4771e1ed170mr45259665e9.28.1761775178572; 
 Wed, 29 Oct 2025 14:59:38 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289a5932sm4827725e9.6.2025.10.29.14.59.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:59:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 19/23] hw/arm/meson: Move Xen files to arm_common_ss[]
Date: Wed, 29 Oct 2025 22:39:56 +0100
Message-ID: <20251029214001.99824-20-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20251021210655.59278-1-philmd@linaro.org>
---
 hw/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 9fbbbc9a6fe..61c66ee2d0b 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -65,7 +65,7 @@ arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP_EVK', if_true: files('imx8mp-evk.c'))
 arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_common_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_common_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
-arm_ss.add(when: 'CONFIG_XEN', if_true: files(
+arm_common_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-stubs.c',
   'xen-pvh.c',
 ))
-- 
2.51.0


