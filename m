Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08C4CA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:23:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXej-0004Uy-Sf; Thu, 14 Aug 2025 09:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXdr-0003KY-9i
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:16 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXdd-0005MS-SD
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:15 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-76e2e60433eso786193b3a.0
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176696; x=1755781496; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XPFrNGF25aedFkFai4tvzmqvnXD7XuO5UqpCg3WnHEs=;
 b=TfULhRTxuvo6icmsc/AVGew7D5BIbEaNyg7xLApfu97A4fxfDdsDqto42kaivmq3Fo
 sFGiJZTt5mPtyWpNj0ftpCJj39l5tHktvIN+p0N5N3wejjAEysE+geAQAcRjRRLYw0HI
 iXOZqr72VClHeGcaEi6NBGvGGOhzHYCM2WI3qIEp7zhA9TGt4q+GsRfTyDC+1kVkVc0K
 mreTlCTsZr4ZMtJlge4ld/SkHBIUTaCUdPwq1+SatmJCMU/4uNy+U2g5MWBUY5UYD55s
 VIO1l6bqWtaRE5qLQRr8SYDj7jkJqoG/g/GHSguw2k/ZYbstaQpp0uw/7MzcHF1u06D3
 FZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176696; x=1755781496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XPFrNGF25aedFkFai4tvzmqvnXD7XuO5UqpCg3WnHEs=;
 b=JtC0741/EHV2p2tM67RgtNjgqpWvzr3wyVx0T1alXmu30OrsYYT0i59nybCy7UWHbL
 +oMweMfguJ8yCn+CkMIgluZopNHaq+TQh5xAV1Om4QF7lo2qQlFJ7F5JZcKpM+qj8X/v
 vdHsVDJHRNrPjVxzQsCbNzy7M4hpDUeLzIk4zMoGaZFrd+L6MNWD6WxKSWqQNZCmYR1h
 EhMn2ZldoClZsCflmIt1j2H1TI8xgzQoXZPgogCtUwjo10uk+3Cs+imrz+5Pahlkt8i7
 wgQk6Au7/1VukNraH/WAdFISo+/KFFDqSC8R8DCAJidkgbCeNg0WrK42kbEXhGc3DAWc
 Eknw==
X-Gm-Message-State: AOJu0YyTZyiNDvgRYAABDER5PUuxTCrZJtxPywmkguLKwVxaMTW2nRx/
 d4WtZWIO3G1Fy7TKTnlzP2RfwsjzaKNMGu4huu8EZxEEXOduqtVZQx0/TtlfFROPZgA=
X-Gm-Gg: ASbGnctjp0MfgNUntdm/g3t6B1aTr7QIalzVinBdJeT2clNFef9K7MzrHeAxZJfhXl/
 Do2j8tW8ZOU5WiFnkxpsUeT+h9q9c8TXuoJ9f1By3PyRpylteTpiKt+oI1svYBGrtjV5LOdowTe
 dMGe6zKzVyBKul9ryWgPyS2ep8P2o15ADZ660qpYccmD+LTPDAJaBz47d9AWsHSHo6VWfJ/wV3O
 cYmVgyMXVhc4bcLtBbD378SojXs8y1O0Cr5d0zAi6q5oo94SCjkClRGu825f9EowdjzJhreD2Jf
 Wb9ILWExCHtno8aW9j6jAFZ2JjXPYFIPOxB8kUMug3VkbjFsru6pnyNfXNRWCvrS7yeP5QO2pmr
 p4HE1wxuBtISQ/wZnvUYonKR1T7S7EimROdpZzZIb2pjc+0M=
X-Google-Smtp-Source: AGHT+IHXu7kVwvsiHCESWKp89UykVuKTFb0m49VMRflGl73F2VVq7uyMikzGvuzQi85isQ13z/hovA==
X-Received: by 2002:a05:6a00:398b:b0:76b:e805:30e4 with SMTP id
 d2e1a72fcca58-76e3200f33dmr4540446b3a.24.1755176695933; 
 Thu, 14 Aug 2025 06:04:55 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:04:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 71/85] target/arm: Copy EXLOCKEn to EXLOCK on exception to
 the same EL
Date: Thu, 14 Aug 2025 22:57:38 +1000
Message-ID: <20250814125752.164107-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Per R_WTXBY, PSTATE.EXLOCK is 0 on an exception to a higher EL,
and copied from EXLOCKEn otherwise.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4495433ce4..b2754b1678 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9300,8 +9300,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         } else {
             addr += 0x600;
         }
-    } else if (pstate_read(env) & PSTATE_SP) {
-        addr += 0x200;
+    } else {
+        if (pstate_read(env) & PSTATE_SP) {
+            addr += 0x200;
+        }
+        if (is_a64(env) && (env->cp15.gcscr_el[new_el] & GCSCR_EXLOCKEN)) {
+            new_mode |= PSTATE_EXLOCK;
+        }
     }
 
     switch (cs->exception_index) {
-- 
2.43.0


