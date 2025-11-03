Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88E4CCFA04
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 10:18:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFrbn-0000d6-JQ; Mon, 03 Nov 2025 05:16:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrbV-0000R6-2I
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:16:01 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrbN-0003Pf-Vh
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:15:57 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-429b9b6ce96so2609830f8f.3
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 02:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762164950; x=1762769750; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4UXacg8QXXqCJVu+ViWlRptMSM7MqADu/UIOis6wkvM=;
 b=u7CIgsrHmpWTRuey5B8ofIm99V8AcB6mcrAHHszY9g8NayRen3ynEHr2TfwqzzCu1c
 DMIaRJv1GHPJWfWu0GETxkjZ6ywsFTb/aOXdQxynPjJsCuy1YjT24WAUfNH/p/7ABf3S
 g8hwzjVFI6vx5mnB9cTvCouBUIuGTF2/lFYGY8uQyxrKo3aHZvxRYVX+dTRBsqJnhU/M
 LFhc5BZgNtqaGo94U9RIkfgr+9176wGaRhaPk1uBd1BNDwM54sfltSlCcBeyZOKN9SbW
 YFvNMOv1/QLZcT7Ev54y0oDKD5QJ9hfB/mP6M5D8cHMGkr9e1sa/yKAB58lKeTLWZv2/
 FhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762164950; x=1762769750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4UXacg8QXXqCJVu+ViWlRptMSM7MqADu/UIOis6wkvM=;
 b=dhykBsQEFdWTszeZ+94PdeazLPInCJDPhwYSJ2k7CYzzIVfvqpPeQW4tE4HX/+w75Y
 Dbl+9q14N9ESChZnrqHlAHEq/jkrVYFTdqet8ydDWTkoNDj9ot/77L+jydCKDuUF5Fl+
 cviK+HZPxoKvxXoRotBHxYCBI4LV5ECs+e1d0fCcsEOsFqEAPzzIYTiX31kYtUeJ5E8G
 29JUdogqwXkNOGJeNEHd16SR2JQjHXjUPucSStOC+Wn9uC+Acm7C15RGhfoJaErmolmS
 +dBJ+s5O6AOrXBEK53efqBD2hvFE1Y4HIfr2CzsIsgAqqd5NAfIdCY8/zaRkfhBf0ql1
 i1rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU42BToyfE7DOkT0b0DGt5UT/oSDms+ECHc+x3YA6+SNzb5QEPBn9sIsnusaRnQHfSdyEX+4zcStQ==@nongnu.org
X-Gm-Message-State: AOJu0YzDzKkVQwmkmwUC4maZqECzhjFVJ0FbhVnSoquSPUbtKDbEfo8C
 VZyPgnJqpWOx2EaDfDBYG01NXYiJP3lkqDiT0ju8Ib+8UE5Ru+akGyw5jDUi54looUI=
X-Gm-Gg: ASbGncuktI/huclJMniZDv4+J/za3/pJx+Eyt5FzJMf6v7v027tHYmYKDFKWVeQodON
 yTP3k5stwKnIvES5gYVOWj0cG9FZwqEnq/4YumEglZBhCtv+5GaTovx5ukMQNcbx/lcgeZgZlDu
 tdNRw+v5qtrb3MeIkn/mK8YecarEFNhCJJa4fsxbN/sZ0Ozjeyw+g6DFurOZ7Bztg48Jdv+YY9z
 utE5nJqAeeAkFTGcoozA6+ylrxalkEMNingvaLPIOmyjzQrepvblt1fmNSikXzRwCOfeSNHwYCm
 dZhyslgwG/VCleymXrsGTI4Mmfl+pi98506UDh+PSh3ELnDiO5Melca/co83QI3uAqZzVVm9FXP
 CoKaggjGGDMR9F9so+Iy2wyl626qAheoOy1A5rV4xDx1EAxu0/f2547sNh7lCKCyA5gUkLMxBfR
 CEZLuRGLxDgmvaxPBjdA+QjYr8t03LwRMeNDx4HzMk3vjx6hnMFtoOG+VX2ro=
X-Google-Smtp-Source: AGHT+IEzM9ZamtMWij2/wVDfwjrebZuDC+xNtL+OXP2xUFNA/OaMg+jJYlkSrvup8esv2Xy+m7Xfqw==
X-Received: by 2002:a05:600c:a39a:b0:46e:32d4:46a1 with SMTP id
 5b1f17b1804b1-47730f93928mr75753195e9.22.1762164950385; 
 Mon, 03 Nov 2025 02:15:50 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c2e6771sm145968775e9.2.2025.11.03.02.15.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Nov 2025 02:15:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mads Ynddal <mads@ynddal.dk>, Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 12/23] accel/hvf: Skip WFI if CPU has work to do
Date: Mon,  3 Nov 2025 11:10:21 +0100
Message-ID: <20251103101034.59039-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103101034.59039-1-philmd@linaro.org>
References: <20251103101034.59039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
---
 target/arm/hvf/hvf.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 0f584b8137a..5e46e8bf4dd 100644
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
2.51.0


