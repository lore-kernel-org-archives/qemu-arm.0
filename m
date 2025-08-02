Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AF8C87FC9
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:45:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLu9-0007r7-4d; Sat, 02 Aug 2025 19:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLoG-0005se-6x
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:38:49 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLoE-0006Oj-9c
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:38:39 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-306e88f0b0aso894829fac.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177917; x=1754782717; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XPFrNGF25aedFkFai4tvzmqvnXD7XuO5UqpCg3WnHEs=;
 b=ox97CxEPhKkrW8iWn/3o70VPKh5Of//V+0y0wt/sfPJi+DKqQNjV0LVKq0Krl18sDw
 VpjB6HqvlSoeCVRYmqLyBr6SmKLIpCsHoMRriHJyak/84zNmnLUbuC+9MUH+P0UNoaKb
 0jSJkMAka1JAz9TfCWbOJPJMI+LaO7XOAphcmjn1ndKL3oHNJAfcvZ+cD+eGm3c7AlwF
 AYb879Gsm4C+bQqMAbyFTO0c7olgpMgr8eEMOo5VEDeJMh7fmLvbBV+2bUA5NUOf9pnI
 O90SL4XBNRSwxhjbH68Cg0U2IOBUnbzA0oAACJvhoXSO0O7yFK/jinozspynAx1dHtEJ
 lfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177917; x=1754782717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XPFrNGF25aedFkFai4tvzmqvnXD7XuO5UqpCg3WnHEs=;
 b=uCSpgv8Dp+BcQvLYgRY7QHcG/T6YnwG1fc/M+2xNvgGzt3LmJ93gsQwTufnfUIdnu/
 gib3Lj2GKw52yVgRrS4a6bbs/O+kjYzQjgqkszrWbISB0UlQuaPGYzKvttFdQw6pEgEZ
 palAybXyv5BHu/G6h8/GO9vdn9xUf5sKwtCilVa4/U3yzNIRfwHrZ7GSAbBwBlSTRuyQ
 YYAk7ml6lDC4tNxuSShK/Lw4q7RdsliodtLHTO6+OwfRvOu5qnV4RFmGRFri49pV8GFP
 fvJLJaoNr8HjYVtKnHkj+iK449+9mne6Og2IpXQ9qYyBc7YCZPiJMtv4NnqZYdJB6nqk
 PiGA==
X-Gm-Message-State: AOJu0YzffnNt9Z9sAr0T+9KYJiHn6Tz9x69LdU1BCFrbYCjDu2dDRy6o
 kq16e3pK/bO/mz+CaG4Wz2//StTYeymCzNwXKGSL4UpjbI7Or/sg7jJyReIxIhnCJeqMndVVuIG
 xasUQ0iI=
X-Gm-Gg: ASbGnct6Si9VL1wZOhwgRkfTDzqH88DuX91E7w4tYeucDcLrlf0A9lDWrtOjtybhmph
 dP1yWhT3OIzU93XWzmDeft7YW/qWOKE6e52ugXxOT5GUd4DtwDXty+FZu7wUtispzhyh6khlEuo
 TZtAAHsiMi4Ygtwb215mn1r+sWqI5dTp5qCGTRYFFQL/K7b/yNMyipCg59F5RIKwAnMF9xjKkm/
 QOlVwTH8t9HtvIYlHRzMOJAUYlfebSDflWnQMSZJCWc0LtwZZAoRoQNa8tg8kXU5+bQyjWfDpKU
 +ismxKnC8TR3uaNBOZFanV3nZvO5Ef/ltscciDXhhYnUO4ei3HD+lXKrkUhsX2BY0O3x8g/gFyC
 6N6TZmQZGHp9coCaPhHJLBRH7A7gpf1rTZCZde0xjFvLzPQWW7wRj
X-Google-Smtp-Source: AGHT+IGeQSMY+FW0DjbFjOYNnd6dgvGh/W5Cm3KemhEGjvP0pUgocTD5IKFkIZa/BLgpvLDJ3o40OQ==
X-Received: by 2002:a05:6871:6b01:b0:30b:85e1:d3ea with SMTP id
 586e51a60fabf-30b85e1e1e4mr385551fac.21.1754177917194; 
 Sat, 02 Aug 2025 16:38:37 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:38:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 71/85] target/arm: Copy EXLOCKEn to EXLOCK on exception to
 the same EL
Date: Sun,  3 Aug 2025 09:29:39 +1000
Message-ID: <20250802232953.413294-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
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


