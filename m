Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18C7F9B608
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 10:11:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFUXr-0006u6-E3; Wed, 22 Apr 2026 06:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXk-0006pN-RN
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:53 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXh-0000iP-KK
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:52 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-483487335c2so52303515e9.2
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 03:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776852648; x=1777457448; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XRTiu65oEEP/NVXKQGmyzqv/GBntii32+7VLEeXU9Tc=;
 b=fzE97kJz62CgSTz+ZapOg+VcESMiBRuzcFh7RGBaaV0/sxCEOi5vuaDucca///vvWD
 AX/Tm1ZlAsrLiTs/up9dxB9d6QeZnUJi7vhCMXg1XluRVypGJjx/Va3ekd8mfoDWlZDI
 9I5MBirNe8wF2sbL2YPchsOfHzi5fVjzbcEN4JdvlG+3feJuqc89oPb+l1j0maXdVAcJ
 xu/yqkqksdBTYN1k6SyMVKwjBO8kFY3DwStJiQyYH2XKWsrczSVwOifUtVZ0vJXPIZYh
 ameJwrKNy4IEZUUQORvZPH29vG2+a9UPUKt2NG+fGYuoVyJ3mDw/d/5Zx6UVFuL7Ezb0
 06BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776852648; x=1777457448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XRTiu65oEEP/NVXKQGmyzqv/GBntii32+7VLEeXU9Tc=;
 b=WktXeT6hSwIKQ+ZGyC/UWsyFVpKbXGe3x8sqfzUcrgI62TPlceawBViMt9ls5y7vbp
 mNoPCK7s2OtBIQcGRJM6Sd/S/ZJzNUDiXM4SAMPBQTrzwbJxZFJFv3M9TXhw8yH9WItu
 SKGGHVwIGzQMcPW6knsq1giSQBbt+vjbmL51HPolG0yG0RoLyqr+sdM/7e4iXORmYHZH
 vAGo7JShlNL+bBJ233h1DJkOD4xf53xoqgKzT0LbG+QszoG2+dPrsVJc6tSIUTyQFwEn
 lZansDJ8a5Vh3f210g0fQhB/AsjIiHXv+dNG8xpEOxdVFR7ejk++3A65D7qpCvAs/jQQ
 XrEA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/OpzxUN14pk0qFHxIqo9MBgpHM2PnJPwh5yVkeNmbt0ta4WCoaDzOKMgozHcgEfULQCcXJekobjQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywzb6RuCQOInXTqcJ1w5owcnq4YyQDctmAzll2QWzyu/27Giw73
 bp7gX2lBMlxq8rDlYwqDrRXuumtDrByjrqvwmUjaudZknq7vWTORJGd/gTRFF55yNg4=
X-Gm-Gg: AeBDiesiBTXVxOKGcn+WiCHmNkmPVm0vdNExbIKppg4TIoNcHvo3QlDBJ8RpPjvJWia
 NPpCMS9ZPDYBWvLFzT63Liw2PHAA1EpOgvx9yuseiVNgk+ZUKJGEI8AZuX3gZDeyc9ERaG1nT04
 VhRANq68HUHvyllo2kMnwdKiGsxmbqerlMvqd83R+G7X63SJRaTzN+6cBp0bDs4d2ADfCam3gZ2
 YqTT9zm/SU9tjl0NyU5aeX0m9+ut/l7DDLnC/ZBBB0HUuR2x/g3xuwbquleiqrQBsWKpD8b3erb
 wMAUi1kqLXzlG5RqxJiSM+RO3XYVowkrjFw//g6RuTSn6dBkrxkUdjcizMzoxogz2NU9SzVLhDJ
 LSB8bG4Kn41uAw8bWfEBWq502rZ5tLO8hIta9HxadxFVzCAEMyHcjNp6I0cIHW16J/TpDrzTVX2
 5cbmX9lxbyoYyFlvIC0xZYqIk0rt9CDBQ/xA==
X-Received: by 2002:a05:600c:19d3:b0:489:1ae1:4eb9 with SMTP id
 5b1f17b1804b1-4891ae14f23mr171514615e9.28.1776852648038; 
 Wed, 22 Apr 2026 03:10:48 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e46898sm46509989f8f.27.2026.04.22.03.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 03:10:44 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BC52060338;
 Wed, 22 Apr 2026 11:10:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 04/31] target/arm: migrate eret trap syndromes to
 registerfields
Date: Wed, 22 Apr 2026 11:10:15 +0100
Message-ID: <20260422101043.1234229-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422101043.1234229-1-alex.bennee@linaro.org>
References: <20260422101043.1234229-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

For simplicity keep the OP as a two bit field rather than the two
interlinked fields in the docs (ERET/ERETA).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 72051443d59..63c8e66ea91 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -367,12 +367,21 @@ static inline uint32_t syn_sve_access_trap(void)
 }
 
 /*
+ * ISS encoding for an exception from an ERET, ERETAA or ERETAB
+ * instructions.
+ *
  * eret_op is bits [1:0] of the ERET instruction, so:
  * 0 for ERET, 2 for ERETAA, 3 for ERETAB.
  */
+FIELD(ERET_ISS, OP, 0, 2)
+
 static inline uint32_t syn_erettrap(int eret_op)
 {
-    return (EC_ERETTRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL | eret_op;
+    uint32_t res = syn_set_ec(0, EC_ERETTRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    res = FIELD_DP32(res, ERET_ISS, OP, eret_op);
+
+    return res;
 }
 
 static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
-- 
2.47.3


