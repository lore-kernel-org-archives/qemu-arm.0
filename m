Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AC2CA0EEB
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 15:04:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upTI9-0002YB-DR; Fri, 22 Aug 2025 11:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTH0-0001wi-Ej
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 11:02:02 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGe-00051m-CG
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 11:01:45 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-b4717330f9eso1553911a12.1
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 08:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755874878; x=1756479678; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tr18OZZ52dyGR1rp5GdhWCgXctWVe7+fEbjUyyRt8KQ=;
 b=H6g4C+FCAnQc2VAt8ENTEU1uaOosyBORkscbOJ1EkOXBS7/NtxKHGAA0KQ2izo+Tpw
 jUYf6WUT7xVHRFp46oPBBtGOXiizsifkgiBRoAZJpIPGmulY349jK9I0wXZF3dErngyc
 1aK936yF0hFykQHHDL5+AkYJ2T8lj87j/QTppH86CQ3qtq6JuqLOWSzFqb2v58gMnw50
 34/HfN2/ByiZOiKA1n03Mc1XkCHe3WX5whbMUkT1tuHOXwY7AL1HUVkeOMEbKfFfkKn4
 x3Ei4z18u3speVEuM/eRye9O1IPkoAYtC4K6XLeVoRpr61VPg1olTnKlCBPSR/j9m7js
 HqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755874878; x=1756479678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tr18OZZ52dyGR1rp5GdhWCgXctWVe7+fEbjUyyRt8KQ=;
 b=lDSON3bT5vIqggGcVt8TgZeqAcBXw5Bn91JK7L/9EdQwdVGQl4akPjsXk0WJ08g2NH
 6dYJkj95O0xXgUI3NMI5kYxTpXYd1P9Mpn0vGPiMCMM/DBdbCiwrXF4a/Mt7vDM7iL7G
 rmgw5ecYgniciBSUUkijTnerVKVAnH3pCxFSZLAQvVHP3V5dmPHM5ZAk8pvGcUdyG42l
 glBzUPwsDdYrAHxmGDa8qaonVTUeNUibTo9pvGZh3kWB7nDONoAijT1h7jIJM1LQiZAI
 f5Aq0u6bHPqW+5Gbu6x56jwJkQLf35aEXp5w+NnmyJWGPkytOWjdgBvGKU2tSlUcBUgN
 Ep0Q==
X-Gm-Message-State: AOJu0YyRSnO89VTiRuyN+x/Vj57+CXParSrJ62JDpBmmzsKshFFv1jdV
 y/kZkjOuGOMneE/PMiD9wjJHWdUn62e2qggqwtOf5Blo2rMcNchhTxzJbgNl6d+aarY=
X-Gm-Gg: ASbGncvQ894b+GJ6E16FlUJnnL7Cu89fYctRBEEGWJ2C4A90CG4Z2yxB14GyUFXvOpN
 Eii9w1ISy8oHSX9b9GXiF27Yt9FBq5nf4I1M9VhjDUKveihzDfuVtD3Y00zR5CO4PHC3nVLn2J8
 kX+WMs759M4fzQD95S98q87ba1oMMt89QM7EBWpltksk788M3hsynLf6LwUCKa+36oEVReJ5NTh
 9DGbi99p4T6L8ks4cW/ulDMzEeerVs5/RfJdSaql+Amgkkk2yuYdp+7JSCbsFpIX792abAL5U/j
 m86Di4ZKF3Rg+qXsddLOZfMvdMdjRh4qoFP/Bg5KmrXgZwfq83Tw3mR6mPLxtOJHLICOBN7oYSc
 GB1mFiH705Iw58wE67TY4Py/sGGydIe5fhOTVUDGwjaE=
X-Google-Smtp-Source: AGHT+IHmY1fp1Cnt5Cfmqq6A+WCY/Utr6plzTnkgl4R8m0dB61vyWEpaa6QPYLHacKF/IvRmjv9Mqw==
X-Received: by 2002:a17:902:e84d:b0:240:417d:8115 with SMTP id
 d9443c01a7336-2462ee1a943mr51648885ad.16.1755874878302; 
 Fri, 22 Aug 2025 08:01:18 -0700 (PDT)
Received: from pc.taild8403c.ts.net ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed5406e4sm85929495ad.165.2025.08.22.08.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 08:01:17 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 11/12] semihosting/arm-compat-semi: remove dependency on
 cpu.h
Date: Fri, 22 Aug 2025 08:00:57 -0700
Message-ID: <20250822150058.18692-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
References: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x536.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 55d7bf29ad6..a14de23d45a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -34,7 +34,6 @@
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
 #include "exec/gdbstub.h"
-#include "cpu.h"
 #include "gdbstub/syscalls.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
-- 
2.47.2


