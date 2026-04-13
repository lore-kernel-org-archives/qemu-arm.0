Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D50BF531DF
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 23:04:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCQJE-0005LA-7k; Mon, 13 Apr 2026 19:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wCQJB-0005K3-Dr
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:03:10 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wCQJ9-0005BT-AU
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:03:08 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-3567e2b4159so3101652a91.0
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 16:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776121386; x=1776726186; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xNSiu+7tUjOH0CH3gFe97LNdkln+koLOCxAi0WmfcA0=;
 b=x9HF+85XEf/XTuNhzIV8bvui5twAeAJmRyCAXZ3UqMM6Ymh2LMeMqkhKP0t48/ZeQX
 CYnOSyHd9Q7/ZduJMEyukxy3cT2H4CSqNSMs1dDhKWGNPJyH9gRWRFxjhuEJLmGDq/Md
 CddCmQ2RT0Qtw8G0paaojIGOMVgak7yIWMFb2mLoD+JYYILcG8pR3KrkWVHF9ysYYmgm
 Ut3Jq6mlsWXO/7mg/jDqvPTH9J7o1h1KOh9jA9HUMTKDIWc73lDVTzm67RwAUvTq1Pub
 MA/Vm8zSRunxC7y3XuJ/KBJcJd4uPBYLsC4+qG96uVuCzF16qljaHP2ZZ+QpDziI18hE
 h4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776121386; x=1776726186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xNSiu+7tUjOH0CH3gFe97LNdkln+koLOCxAi0WmfcA0=;
 b=j6ExT70Zthwg0JYVaPk63iAD4wtltjZT3EWerUXrbzWzJFofiM4VlFfzq0yX3E993p
 +fhuyHBaZhk/vLHqKUWON9P9NG5RLMrIlVRvngUXR/AL+ol1T6cdG2DvYLjc5+kvN3Kj
 fyCS7tF1dtr1OCclOMsimt8xZq73/ERv5/Wm3j7odD0lFoJZwK0KXrcizalXNI9wrANo
 LR9HjkjE9sM1cYVGoUKPVf6MKQEB9fP5LzxqW72w2nAPgeNfX33Q+Sy1o2YKYB5E1KnL
 rVPTyn8xYuxqMnkY3nNUth8hzoFThwKUv5x4LF+vJp4SSBtWHGm2RYDmlallEcMg+Vca
 RoXA==
X-Gm-Message-State: AOJu0YxHh7nxsSZeqq0T0K/Xjm5cXRe7PegmIf6VqvMr0F8HosU/JOo/
 8nKf447oD2BNBy2CrEvcYqm1pipsht3A5dbezKI0/Ko04eJ7Z+uUgIBOrnHOEhRN+vtw0M1kpj5
 w8mcMduo=
X-Gm-Gg: AeBDieuxXRNbebIODqV8vj2PLf7gCob64o67lrFthZbmW7Nizuxw7Mn2uT8axTHzbdI
 BmhVtGv0DKKYtYfN6lkFDZoKDoFXpm/vQr2LY1gnAR3gaQVn+9aGmg+oBvmsYhTdfKeS6809GrF
 tHM3L8XKxIm02QFZMIJW6pgMnGNp+Mlf4tWmD9r1zEnd+CNyiSm3t7ZJ2qE1XM5aH2A+iYjlzPw
 sBdtoKVLuVa4azX8mZ2rVE8lRxHwKQZyxC5aKxj6SHdb6k1msnK9Yz1XmmQ7ZT0/AJRDq2i/u/X
 xiUqbCZDpJ+eb7K9zEPvgCVh8c84ekk2YDeCcIupbTGRyT6GIRCO/gN82IUIoLWtYx01Yf8VKNv
 bTYMKkQ04/C3/19ljKV0qvzS/VspZrkK+NijdKzPXpBDsMYo+tZqKrDA9iA4NKXXmToyzwomBAh
 ojywy9Fyq+Obc+6Lf2SmQ59jL+qiA1TtSkXw==
X-Received: by 2002:a17:90b:5185:b0:359:8dfd:64c8 with SMTP id
 98e67ed59e1d1-35e4284178dmr15560642a91.24.1776121385573; 
 Mon, 13 Apr 2026 16:03:05 -0700 (PDT)
Received: from stoup.. ([2401:d002:dc0f:2100:377f:61ec:6edd:e205])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2d4db008esm120507675ad.16.2026.04.13.16.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 16:03:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 3/3] linux-user/arm/nwfpe: Use thread-local storage for qemufpa
Date: Tue, 14 Apr 2026 09:02:51 +1000
Message-ID: <20260413230251.22537-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413230251.22537-1-richard.henderson@linaro.org>
References: <20260413230251.22537-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Fix the thread safety of the emulation by not storing a
pointer in global storage.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/nwfpe/fpa11.h | 2 +-
 linux-user/arm/nwfpe/fpa11.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/linux-user/arm/nwfpe/fpa11.h b/linux-user/arm/nwfpe/fpa11.h
index 20f9d2eb81..659d38ae3a 100644
--- a/linux-user/arm/nwfpe/fpa11.h
+++ b/linux-user/arm/nwfpe/fpa11.h
@@ -74,7 +74,7 @@ typedef struct tagFPA11 {
     float_status fp_status;      /* QEMU float emulator status */
 } FPA11;
 
-extern FPA11* qemufpa;
+extern __thread FPA11* qemufpa;
 
 void resetFPA11(void);
 void SetRoundingMode(const unsigned int);
diff --git a/linux-user/arm/nwfpe/fpa11.c b/linux-user/arm/nwfpe/fpa11.c
index 44783934b2..15888463f7 100644
--- a/linux-user/arm/nwfpe/fpa11.c
+++ b/linux-user/arm/nwfpe/fpa11.c
@@ -29,7 +29,7 @@
 //#include <asm/system.h>
 
 
-FPA11* qemufpa = NULL;
+__thread FPA11* qemufpa = NULL;
 
 /* Reset the FPA11 chip.  Called to initialize and reset the emulator. */
 void resetFPA11(void)
@@ -154,7 +154,6 @@ void SetRoundingPrecision(const unsigned int opcode)
 }
 
 /* Emulate the instruction in the opcode. */
-/* ??? This is not thread safe.  */
 unsigned int EmulateAll(unsigned int opcode, FPA11* qfpa)
 {
   unsigned int nRc = 0;
-- 
2.43.0


