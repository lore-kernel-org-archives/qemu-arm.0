Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C02BCCD1AA
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 21:04:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBJX2-0007FM-G6; Tue, 21 Oct 2025 17:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJVv-0006Ws-BY
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 17:03:29 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJVs-000329-QM
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 17:03:27 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so57807405e9.1
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 14:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761080602; x=1761685402; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JJ3ixfClpg8mA00v0V9RN1om183YDcGw634WpNvfvI8=;
 b=y44QMRwxuy6i/Dgx1FNqiRG9etI+bZZFNveEjFDu+7+2TQNz9zwWNwtmUhgYtbPOiN
 uEYkDhFbcpJZDipTXrmB1jYxLzQKm9viwq9czEpD2t8sHhh6VngL9orX/e2vh1V0OU99
 T325VNcH9ejlnG0l8K2OuYVdmrr+cp8K88G/1BMOEmDF9B2af6FJd41NlI9PGjGPBapR
 pVAAdxaJElPYn6D1rdrwrLl1eO7Lo4mAL6Sb3O+9x/X6Ilk8mjpC5J0szls47x72iYNg
 3xEjDSPBTzJkS6RK1eJvyc7Fx8S0lppxMbMv10kN4glR5aWtB4mFP6BBLHAX/j0vPVS2
 NJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761080602; x=1761685402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JJ3ixfClpg8mA00v0V9RN1om183YDcGw634WpNvfvI8=;
 b=I4O/638uCNJ+/Qo3UUmssp3rMvGUbk8YVAYIR7QXLHtA8DEx/Wd8Py4KOUzk2tB3DG
 UzBXT9+FuV6ifTKkgMTWJTvjUIJgggIaz5/xDqRpC3zl7DQ0QUEH5Ms1dcRiJ8FapUEy
 +QpZv5Tv/Y0YfJqix9TaK3iEeOInCAuhBskUuSQqVoXjpccNvNvzvzhnlvGZHK4wzPOm
 F5Z3IZ0cr1Zk3R58TYcsDAP142Yd8hC5CqHFsTpyslk2QuYiBZTqI+eAuoQFa88VH6PV
 kcY0jzlsY96rAWMz3PgZIxt78dU4kvPoM5HCraCRKUY0nLBRN4bs3S/fxs6jg1BN/qGF
 8fSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk5oz/5r7ro1TQYgnLqhdSafa4obfyb8gmnB5P5V0N2ryosgGkwvH9H2WG9+0wNeMtjcdK/V3vWw==@nongnu.org
X-Gm-Message-State: AOJu0Yxlz5ILz45AgdPw/p4QlwPn2mThl++mXkqvtZWg6w2Z0COoKdXu
 cGL2LNDv8k3Jh3ZpkWKi2LCoaUECfL43bl1WQ5gJ5cLsYrZqwT+PhDbyNHimAOeCl+Y=
X-Gm-Gg: ASbGnctKLa3d4rOnXWpdFj/+bDmt8gF/00ieZTU8dS0op71k4Y6PfXqcWz5EX+JnbHR
 ooijcJFocMXVvD3YDeVXvX7JpPZkciZGuJm2+ugs3Kj/27aw8LpdnPhQqkE0xX6Prz+v5XIwPJb
 rUZHMjA+e0hpFQnP8ML2zro0DaQl8X2OmruKYDyIkuCD2JbS3vN3Se7ctSbd2ComFQzD29GsOQ0
 +Kdj2vZUQXvXAAZD55o6axBugXJTaRw6WUEms2BA2JU9DO28mfFJxFBF+tc2QffoNZ96hvonjvZ
 0aDgwvehcEgycnwNN+jT1YWGO1IzsETi+rMCRXd1pA8q48raLchGlmYamXSLo9XeCZ5pE7PWP1c
 HnmF9yjO2G7zu5fjFenGXSmpTRgsJQwtb1RXcPaOKrZrSfx6SoCKTYu6Ka6KwVXfWFcU/EDNvX1
 45N7uF/LSWwGA8n3KnrplbmXToU9ZxfnOHz25DHGdUCDAQ1uxw1IpMPzqMBuej
X-Google-Smtp-Source: AGHT+IGOJ1cHOBGtyG4jOMNDRNFiIU1lBxvwITh6/0NB7YbTNx7z9/jfUGKw3EgM1s9MSiFBWMBHNA==
X-Received: by 2002:a05:600c:8b0c:b0:471:15df:9fcd with SMTP id
 5b1f17b1804b1-47117911c51mr140610065e9.25.1761080601735; 
 Tue, 21 Oct 2025 14:03:21 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496d23237sm23027555e9.10.2025.10.21.14.03.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Oct 2025 14:03:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <luc.michel@amd.com>, Peter Maydell <peter.maydell@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 17/19] hw/arm/virt-acpi-build: Build only once
Date: Tue, 21 Oct 2025 23:01:41 +0200
Message-ID: <20251021210144.58108-9-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021205741.57109-1-philmd@linaro.org>
References: <20251021205741.57109-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Previous commits removed the target-specificities,
we can now move virt-acpi-build.c to arm_common_ss[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 531a635936a..df4c1be3b3b 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -1,7 +1,7 @@
 arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
-arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
+arm_common_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_common_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
 arm_common_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 arm_common_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
-- 
2.51.0


