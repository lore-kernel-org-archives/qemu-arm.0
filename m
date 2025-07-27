Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864B3C87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:04:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwMM-0007BF-B8; Sun, 27 Jul 2025 04:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLq-0005I1-AD
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:22 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLn-00046V-Ud
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:22 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-24014cd385bso1420215ad.0
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603399; x=1754208199; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DL9CLJOUFdaWACxBCMgH+zFAs5kXtrfa05dzoIG9m4s=;
 b=scZJR1jpTVyexWRgNKBVnGOWnBmHvcw6ee7+N2Joj/aZsz4NStydfsdur3LOcuz8Sn
 DqV7aHqsB8RplC7l4vHD00+sWYJjgKEVcFBdw7nmkFbMe9Hhy86HAsc8PefzmitKDsMF
 KgQM0alUzfmMRQpYFhoEMkEev0D7diVP6++ZS/yBY85wjmcJ5IxQjEFnjFMQ/mZK8w4F
 EgGRDAGTDuaz99TavqY0oypbdC927+mk060YHvBo+LsP3piVQY1uJ2xaaZNSh2vgu5Rz
 coBU5Hw0U/dIA2J5D0A1q67I9Ok0IZ1s7G9/m3oRbc8luDX6niEqLWSlVCHfQauFzxF8
 yIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603399; x=1754208199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DL9CLJOUFdaWACxBCMgH+zFAs5kXtrfa05dzoIG9m4s=;
 b=RB97QZYLbNC1oTIKM96g9ScRJpMaaZIwbCNsAusOEKOEGanGy4mi+woTZXW9ytzFUi
 40Ftb+k/IKZINkllvKdD6FZydTqARf6roZZGnjMQLlV8EXTkmMEiOBUhs9fAfR7tx7PB
 mW7k0DYB0DB3SXAXkStrESwuaD3IxdaWcZLnt0XOuYO3zZHvDJkwNzcvk0Qjlb3BnpmF
 yqNze0L+savP98mOs4YLntm3t8Izdu0aew/1lggwMB3Dzw/Fe4D/CsQq7j8u7lg0Njo8
 pl+qf1MXdJuDa+GmCUMueo9LOcTWWOLpLwV9xQ1/9A/qfn5vdqNEdQ+VIKrH68yZaia2
 pwMg==
X-Gm-Message-State: AOJu0YzatViZCwlgq3wmGF5lNNiz/bRo7bopAhKd21nEvboQSkR7kOyS
 R99Wn5jfaQbRh2/V8NwNXiR8b6peuTV909uyasJQRIRrZDI57Z2bisZQo6QHccksh/CK2VZxKEN
 bvtAQ
X-Gm-Gg: ASbGncvKgu6uXcT8rKsZKhIAAkYshXhGS8dDmPLuF/XQQ0/Pb0HEP7q0k5+IgKeNR3u
 xnsp/8MozYg3YjwfTQfQSd+xLuvCX8pTh9kbic9MzswUyfgNQwogJtgKIBfXE0w5So2yWsWPFQ+
 ol07yt4ZNHfV2ynvuqA4LH4OPvhvNhcU3LowZe5lwyqbJ+3yhQukiSL6OikWz+pWKAKIkHLenr2
 s8VyeFeju5GsG1roPpRQtBQMeG/jlyElFfwP2WiwEfxNnTnM20Q14thGLEzZNVu84qeXqMVNqE5
 tSynV8dw560GrUzwPBnop7Jb8y9AY3Z2Q8IL+K3sNvtH3HM/SnKWDL83z3bgBfjeQFFjWYL615o
 VCqB6t/VXOJDzOBlxEdNUlBenpm6/h24FgDpd+QS7r4axKzjkJLmyBO32KQQWnoKw+O5er70G5I
 iQ8j2K7isyuQ==
X-Google-Smtp-Source: AGHT+IE+lQz/NXMBFH8NUBwLwA4+Enx3kN9Mz4zJESXm652yImrSPGkku3jZKzomWsXStNwwdqxZrg==
X-Received: by 2002:a17:902:cf03:b0:235:e942:cb9d with SMTP id
 d9443c01a7336-23fb30cb4bdmr131589495ad.17.1753603398778; 
 Sun, 27 Jul 2025 01:03:18 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 18/82] target/arm: Do not migrate env->exception
Date: Sat, 26 Jul 2025 22:01:50 -1000
Message-ID: <20250727080254.83840-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

These are not architectural state, only placeholders
between identifying the exception and delivering it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/machine.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 6986915bee..8dbeca2867 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -1085,9 +1085,9 @@ const VMStateDescription vmstate_arm_cpu = {
         VMSTATE_UINT64(env.exclusive_val, ARMCPU),
         VMSTATE_UINT64(env.exclusive_high, ARMCPU),
         VMSTATE_UNUSED(sizeof(uint64_t)),
-        VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
-        VMSTATE_UINT32(env.exception.fsr, ARMCPU),
-        VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
+        VMSTATE_UNUSED(sizeof(uint32_t)),
+        VMSTATE_UNUSED(sizeof(uint32_t)),
+        VMSTATE_UNUSED(sizeof(uint64_t)),
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
         {
-- 
2.43.0


