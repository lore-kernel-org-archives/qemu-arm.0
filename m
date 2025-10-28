Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A23CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 05:45:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcWa-0004sM-1E; Tue, 28 Oct 2025 01:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcWY-0004of-GI
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:45:38 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcWW-00032d-0y
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:45:37 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso40346795e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761630334; x=1762235134; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WEm2BcJk3lcGKEr7IiOVTfv620coTuiYKu5tYc8rMA8=;
 b=mPD3DKnJwVJoSMJtODom7LegOlNzkeKqTvldzViOb6QrmJMELZw0YuG9XU9nlKpclh
 qBvU5Wv/siX8L76UxtV9qHl7gefALeuHVSFPWei1n87D/5ZcidkCGpQtAkOZZRxa5SnH
 MpB9KOMXsh7w5XilzER5sn5jJEjd6TosdNTd7tEzG+d8AC7VuoCnMV8M/vESq4L7gHtT
 +0BklHknUiasWJ+xkBc0qI5oh1mhTvRDHihfnKCvInFJCROtrPa6tZ7vzdbRxFZQvAIT
 x+2/VagDfGPyYLQNHIE3W5Mugy6lESkNo/akeZCm+Jg2sZMsvX83vAQbUOkFQSmlX+fx
 nfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761630334; x=1762235134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WEm2BcJk3lcGKEr7IiOVTfv620coTuiYKu5tYc8rMA8=;
 b=pWHooBcYV8t8HQv8tUdSWhCQ+JcCO+/8HphhIUg7HGbMKwhhEgAo12tfhwlAbJKRYd
 VcPxVzdZ8wLcd0eiBSXrrFsT3S4tLzi1u6VusSCqWEZ4cZpK9Xq16+bNvbPtlLMi9RmV
 S0q4qn947pfOFoVeNy7Mqn8MvS2TP1CWxOeInl61kU0bZWLuzAQQCQkzkD6CoIFM5EU4
 tcv9qNu1MwbGvGfqwK/j7I8ApRSdF2bBiwQY1NUMrHTi8yy2GD0b9T28WTbINtrqap3N
 CAlSti/9z+qUmKXonHxAeAdGoOUb5B4so9Dd1h2yWHCh3UwofVU61f5+MaX0cbWFjZhf
 A9rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLoI9hcrR52m2SO2uQ7SkFoIAIko5gWtC7nZ5xJwfrRE0R28TCJy1VzDq6ifb5kIwaf3cHcQeYkA==@nongnu.org
X-Gm-Message-State: AOJu0YyDyzi/nxKKno4Yott0p4f3VQPFqyYAGWZb9OKr6NqbVoCD+ASL
 wK8e2rAMundYgDwDjDVBEs/rEwNYZisLUxLC37+fq5TfIzk+HAaMh5q5DrLksKuFQVc=
X-Gm-Gg: ASbGncvBiyCO3Qzf/KjwARPSAnKsbuFg25eysrBSlbC7l+T+5XOyAJmH/IF+uIQ8sOj
 7N3rJIPLKsHnBULspoCUdN4W6ydfZYW6P8SJKkGdpMkYFH6LJuRcng5Dzc8MWQs1nlYOADwXV5l
 n6rUBmM+hGcZvGrAMU+WOPiKAp11WZQxEUricNATLSohf+jQ71prFJWTdTjO+erRVskwVVmgnHN
 vMY6pRVYQ4V8aB3V2IvA3QWFTtr7kSCgdh1HzPh5uU/yA8+fVFG3JdUDw8sww9WetOR0gDNDROg
 iZYwT4mFWh91cC0TN5HJALa5vt4khj7sMVvRBKAC0llDSD1offkJK5dNyOWD76v/xQZhfAlGrND
 j/Ngzvw4QmKnd6XU+7ErIBJ2ibwzPi449u4HwKwNaTtJpduUxHCAKh2TOzmgQOwr0O0UA5NIFTS
 4897xsy4EJ10UDoyrtqT1fcDAWfc9LjJvU7Ui2Fkwn/W4HsY9Crn2Vwm0=
X-Google-Smtp-Source: AGHT+IHpt0xwaemKy/yvq/FfaWxuSsYnG5zdlSQeS11LnDSl2uHUutoHJ6jNqV27iHrxoa1gw5RPtw==
X-Received: by 2002:a05:600c:a08b:b0:477:c68:b4da with SMTP id
 5b1f17b1804b1-47718176e5amr14811195e9.20.1761630333497; 
 Mon, 27 Oct 2025 22:45:33 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db9c6sm18409668f8f.36.2025.10.27.22.45.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:45:32 -0700 (PDT)
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
Subject: [PATCH v3 04/59] target/arm/hvf: Check hv_vcpu_set_vtimer_mask()
 returned value
Date: Tue, 28 Oct 2025 06:41:40 +0100
Message-ID: <20251028054238.14949-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

hv_vcpu_set_vtimer_mask() returns a hv_return_t enum type
(defined in <Hypervisor/hv_error.h>). Assert we succeeded,
as we are not ready to handle any error path.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
---
 target/arm/hvf/hvf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 4c98faebbed..bbe0b24b821 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1782,7 +1782,8 @@ static void hvf_sync_vtimer(CPUState *cpu)
 
     if (!irq_state) {
         /* Timer no longer asserting, we can unmask it */
-        hv_vcpu_set_vtimer_mask(cpu->accel->fd, false);
+        r = hv_vcpu_set_vtimer_mask(cpu->accel->fd, false);
+        assert_hvf_ok(r);
         cpu->accel->vtimer_masked = false;
     }
 }
-- 
2.51.0


