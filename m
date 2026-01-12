Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8C2C9EC67
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:33:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFDQ-0002b3-HZ; Mon, 12 Jan 2026 05:32:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFDO-0002IZ-6m
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:32:02 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFDM-0001oK-Mr
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:32:01 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47d5e021a53so45245715e9.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213919; x=1768818719; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AX8TReywRramP00AS3aCoMrxM5/FCzCrdGkFzNm/dQI=;
 b=U+KAHOkGVuUAaCyHZT1RDGwqkYWJv5BaLsk11iJoSmyFiS73rYZTUZdYJ3dN8vyuNA
 alUzkCVDVZA16QhhPbLXLn4RSRoszt8YP2jvoMmuA+KAxSOZ4CshaiyEWfDZJhtI0nVI
 HerzwacjmW/Y2x4C3Wu2j7S1W3Cb0BYi4AlFXKSdthMIOvHo31Qx4GFq8W8pIPkk5KTL
 sGiKFVThQ4jkW7RnZ2uAo8Ze7dpnEjdz+0Hh8OjxhKrPh6KC/cTkcXPOXnXUwGBXjAYB
 KrExqLG9ppThXUUFRjs9eQESk1G4d7XjHZ/SK2PCDcg8faqdIH9XndLf1uTUz4ttU0a6
 y9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213919; x=1768818719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AX8TReywRramP00AS3aCoMrxM5/FCzCrdGkFzNm/dQI=;
 b=Lw04WWlh8HC0jNIcUPgexuGl8VGHH4TekZ2K7nqM8tVHmLsxibnSInpEO5sNlRVyAu
 V5Ezs7GNQ13GVbs2xM+uNFiww0se38qYKLziVX40Geg5+ZWNX1ZibGLuW0EdKF/7+XnD
 nY/gwaaWnfcTjH1RkXDgnvy0liu+hDNsOFrKtj1GCnq6V0u8ZWgS2ublKJ9E3vRQILFG
 lTNteqIcHanEsNDJZJ92trl8vElYFzCQ49MLuZbLbkgbe9FCVFZR7JG6S9i1xp36YXIR
 Hd340PoMQCzinUI2vyNgip+KtuKczBTTObaoh7z61odru/CK28jX8UbiL3nOIeZmZvZK
 MWWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqj6UwWTaJMgk1Q+ctouDtvV7A+y8aEE9jKJzseSpQugGwVIOEGJsQM5fu0qhPZuw3D5+fu9w1KA==@nongnu.org
X-Gm-Message-State: AOJu0YxBorK4AxwmvvEmBs8+dvTix53hBTvgZNdNdd2TgJvEXQPEPHzO
 bhfhb8lLyGVIWrNouv208pQr6bBxCVoloVipTvvsdaPfYKutYAJM0vjmUraCjXQLb2c=
X-Gm-Gg: AY/fxX4w09iQkyW5l6M4RJJAc2R47S35VMuSdORTTr91he9l+cv7eKxVWLOaNr/ymv9
 IrncbuAZGhc314uFGcYdojhdnd6RJZh0pEyvwAQJSLp/mnlcYId8TMjhr67DrkdLvCAZxceiock
 9e6AnQahN0Vo1RZh2hboRC2RiuMNUimjZRsaFGORlW2OKOJtMuoqFZpFBZ5oDSEYDoOb1IsV8oA
 7qUXia+58JxjmYZM4FsXVxgo9yVAOeA7Ned6Owask9PBctvy2TV1x91v1SHldV3fPyc5oZlVBaA
 QhBhzY2984GWm88rAGESobQWv+zJm9ZBoXqarWkZraP/qIqn6sPo2IW+XQAnhxdirRWN2Np50uL
 XsYYZn9OKz8N8xXcOte6kf2Bilwv+wdNKLk7EcFMf7qd8uTv4BlnXugiCh/LIUavOJJgJkXm1+U
 Z/TEy6KTzeMtj3a2k/VPR8ew6wz7kofjnpSdV+gc5WvLgNdQjdRlu4TeSZWP2O
X-Google-Smtp-Source: AGHT+IGB6Tl1ert2opqbGb3etVZFe2N9kHf1efTNdwwXBVqb7F1j0mAu1FrFM18r/Olgb+y1yiSm/g==
X-Received: by 2002:a05:600c:83c9:b0:47b:e2a9:2bd9 with SMTP id
 5b1f17b1804b1-47d84b3b719mr219757495e9.31.1768213919309; 
 Mon, 12 Jan 2026 02:31:59 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f668e03sm360270915e9.14.2026.01.12.02.31.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:31:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Nguyen Dinh Phi <phind.uet@gmail.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v6 12/19] accel/hvf: Skip WFI if CPU has work to do
Date: Mon, 12 Jan 2026 11:30:26 +0100
Message-ID: <20260112103034.65310-13-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112103034.65310-1-philmd@linaro.org>
References: <20260112103034.65310-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

Avoid sleeping vCPU thread for any pending work, not just IRQs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 target/arm/hvf/hvf.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index af28b8e8825..d74703a3d55 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1737,8 +1737,11 @@ static void hvf_wfi(CPUState *cpu)
     uint64_t nanos;
     uint32_t cntfrq;
 
-    if (cpu_test_interrupt(cpu, CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ)) {
-        /* Interrupt pending, no need to wait */
+    if (cpu_has_work(cpu)) {
+        /*
+         * Don't bother to go into our "low power state" if
+         * we would just wake up immediately.
+         */
         return;
     }
 
-- 
2.52.0


