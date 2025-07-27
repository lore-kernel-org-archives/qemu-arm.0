Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78824C87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:14:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwRC-0008RM-ND; Sun, 27 Jul 2025 04:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPi-0003ao-3k
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:23 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPg-0004rH-Dt
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:21 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-234f17910d8so29669675ad.3
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603639; x=1754208439; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rpfne0/mZ4p8IHBae8X7Y2QjbioW2/Mtp7IWsAwdNTY=;
 b=VoKk40uISNZitzhzJoLShp/1IGfYp9P1NSXG2/asm1j560/GSHTnqrOwRYGG3FXLUF
 V0UwaZELncfZFQ00X4dDfbjyI1L29k0m0QUjb+178FJh2s/Qr/TeMdtFHYeXnUd6MQnS
 nilJidzCO3rLpNQM/+9SEkOYf/AVd5S/hd9VayQWkTBfaXhtXS4bWOrT6KCLYmcbxYAf
 Ds1sPFP1TkCFuD/x/hdQ0VB0Jmu0U3OO5bGJ+/WpMIRoIlhlWxK1RIjqM7cXxGRZpG0L
 9mpL+IYr6qNTy1MGp/G2tTqiPOUfeqraNsZfd6JK0w+hpOBPReph1Zr9+3wtDi3jCnzX
 B2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603639; x=1754208439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rpfne0/mZ4p8IHBae8X7Y2QjbioW2/Mtp7IWsAwdNTY=;
 b=kB5WLcgE8maCazfpWv37aVjE4sPQ547PtW11Z9zfYjzCf+6cJwNo5C3G5/XB9n51jv
 tDd8T+r9SyBBlP2T8HiEq4atx56UgetF3Q9aBSHZ1Fd87Tt5+DR4MLtFConSIZQE8Emd
 ei61WWn1kdqOKABQyMjok5oKbEYeSO5LZug2nWuzRV/Vl2MAvTyXZo4boHpzpdI6WtRr
 tqUX/2VNtr/+v0atTabULHRr7Puz5aVugbY0mP2U4+gt6ETxmtZldunrgd0sld6Obs6e
 V/ch1pFDmy7tcsxMnjHVYQR66/GZYXgtcmPs8P1dnAk5KNzB5nyHxamPa7AHNyUJhjgJ
 5ZvQ==
X-Gm-Message-State: AOJu0YwPqiThxPLKhVoV8idxIa+dlQ7PQYMOsyM7hG1MjGCWQ0JzIUDI
 s5EV/oKx2/axzg4HzZbc4mUmQmfyCm6r/yfuDc36dptgRvyEpLS9Y/HV6lBkKIRbxp8=
X-Gm-Gg: ASbGnctawzbQqSYztpnDfOuasyE8OxaRZolvJCZrYGYClPu82SfAnVhXQ/+rDEYzpRK
 +mt5PNs9lr34tpDEpxRnUKx/Oe/YM5+HQmSY9r07HXh4vCiMeCpY6+GM23HwMwBPWBMqSDZTIJ/
 GJNIMbAD12ACI7ZLlhRT7Awiyvadl6u7IoclTXKksSPdpPvO4lWuNfC17l+oYA7CFVJ7cVLv1Y4
 MKyiRbWo40LfZbKHydAw2eRj1lw9nw8z/R+cCGDDMwBm6zHzK42jPsxM+JTQsiroIW0/eRL8dFr
 TAJrm97/aSunlzCU+QBrlulanTNA9yNyfNd/IeBcau/KvJR685Z2Tt+oQtk8t0TobMLItayrTSa
 8dVFjmHa4dA2hEmojjvJ161wam1FPKKvkHVKVFbwi5dHWC3a1e7xidGis9DRU1BerWY7UV/uXMT
 sYQaLBNeVXwA==
X-Google-Smtp-Source: AGHT+IG56sQfgqz33anShEeaMUmb3hh55vlGCIqobz69R8Xdox0GURjgL5UdJ029qX9g7AxqfaS+LQ==
X-Received: by 2002:a17:903:2346:b0:240:2145:e526 with SMTP id
 d9443c01a7336-2402145e8d5mr540885ad.6.1753603639052; 
 Sun, 27 Jul 2025 01:07:19 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 68/82] target/arm: Copy EXLOCKEn to EXLOCK on exception to the
 same EL
Date: Sat, 26 Jul 2025 22:02:40 -1000
Message-ID: <20250727080254.83840-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2514a03c0e..23e54684c4 100644
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


