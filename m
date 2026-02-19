Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7597E9A048
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 17:20:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt7fT-0005Pb-4s; Thu, 19 Feb 2026 12:18:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vt7fO-0005Lk-MI
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 12:18:18 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vt7fN-0000QU-2l
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 12:18:18 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6580dbdb41eso1528088a12.0
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 09:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771521495; x=1772126295; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2GGmWkjWz4puRqxAAWgWsdZGg7jCqrUwwLlCs/EENBI=;
 b=Mm3T/3uQaIKRTqZ8YcIZ5tMR8BWeZhvz8n29B86ta1/5/PBzlBnxpOzDdVDnEAhUrX
 SiJGO6l8/y5JmmJ6rLX5z6/7p/w/bs+Y8hJ6FqkFPpBSOBzZfNBdH0laj/9mnrUakK5w
 +T42Vbo+nRgBQwZCQSmdnckZoN/IV21sMETor9dbsanHGWcJE0TRRRxdVg7hY7XTlO4H
 KOddffcQr55MDydsL+IliL6dvovntmj9kIU+l0uFzLwhfO13gnKX//rKjiQwihIrt1Nd
 kPQgAezBqFI9hOc8rqcoSSa9Et8cLWzUWT4MpUU160BKy1GYYSxFZheKqisYQo3pfI2b
 vSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521495; x=1772126295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2GGmWkjWz4puRqxAAWgWsdZGg7jCqrUwwLlCs/EENBI=;
 b=AKrUPEqkSrJ+UCrI/1PDQlFAG/i4cxtrb054c6Ip+DxkHs2iWL4vIjMtpoBObQRIt5
 4LmNpVtmS6H2RsVZ4fooY7fsAinihe5RpqTqlRF1RjkrZuM+UADU5SyG99FNpJ1MKIbt
 hbZBAZt1G9qTrKfQqYmIz6qpnZSt/uKy5XUR0datk1HEVINw1JCXeIUEK8MkjSFuIg/p
 BBGEn7OM1OOCJcJcLKFMo5VNtgCuT4j7EUzo561Ppm0o+ZFbYqCV+odV8PEBERN6HBH6
 6qyPdKKEAtzWjjyLqyhDguPrs8QV0m8sR36V5YKol3pZrGo4ypq0dj4PKA4FRvQzZSD0
 XlNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCViteRz96BEN4YyckY6evKu/RW6SCwDDeT6IOcMY/0TRWlPuLS+WSznB2xQDc5pRyYLwtPpFyXzxA==@nongnu.org
X-Gm-Message-State: AOJu0YyFEEf2kDbgnvTRTaHh9tSlyncGK4EJT9vAULWKq+XXRcgfXzNi
 o6Obyt50kyazENHoXtszluQ3XXLpVDjWS4QvDM69VS94PbGVRcLrZchy/nRGbaETmNU=
X-Gm-Gg: AZuq6aIY2C36J0N0BfxNk+UU8goKA7PnVuNuac2ecvJFhl6OWD0JIGYwVUw1fYNjNBt
 MjxzeE9DoGyIJ9sdYnOiQAM9AYklszDICvaE4OvlVg33nwaeS9/OCxo2a13+WKZDIMrUfXzLEYR
 XAkhys2KUUdZclRK839Cc45L6qSKllT01KwUON5lFEmqC+y1cpuvMTNS0IDLhGtSeDqQkLmle/1
 o9m3/SYYoSjiMz4Ig6zOXtXdZ+It/kkLGW09MUysg5mYSxYf5CokO61N+rQavpI61q097cSSb8L
 qRX5xoP9mpR0DG9dUtjIAY1XpTBiXxtXKYfMHn4d+LAw4pQptup4y8oMGiILZQwJK5J4WshFWk5
 S2Qv4tX+1QHMP4Mu3mcjYLlD/Ghommv0+z+z1II9vUF95RQjhyHDkw2/vDYgR/+TwCzRpgcvw1k
 XFTn1JfO7r3rtGQuJyTMzmIg0=
X-Received: by 2002:a05:6402:5186:b0:659:5c63:e0e0 with SMTP id
 4fb4d7f45d1cf-65c76a24826mr3305965a12.24.1771521495125; 
 Thu, 19 Feb 2026 09:18:15 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65bad29d4afsm3912153a12.10.2026.02.19.09.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:18:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9F1355F877;
 Thu, 19 Feb 2026 17:18:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <yoshinori.sato@nifty.com>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <huth@tuxfamily.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH v2 01/14] target/m68k: clean-up includes in cpu.c
Date: Thu, 19 Feb 2026 17:17:57 +0000
Message-ID: <20260219171810.602667-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219171810.602667-1-alex.bennee@linaro.org>
References: <20260219171810.602667-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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

We don't need translation-block.h as the TB flags are local and the
only bits needed come from cpu-ops.h. The vmstate is a system only
concerns so we can guard against including it for linux-user.

Finally tidy up the order to keep things together with the local cpu.h
kept at the end.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/m68k/cpu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index c721a23b966..d849a4a90fc 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -19,12 +19,15 @@
  */
 
 #include "qemu/osdep.h"
+#include "accel/tcg/cpu-ops.h"
+#include "fpu/softfloat.h"
 #include "qapi/error.h"
-#include "cpu.h"
+
+#ifndef CONFIG_USER_ONLY
 #include "migration/vmstate.h"
-#include "fpu/softfloat.h"
-#include "exec/translation-block.h"
-#include "accel/tcg/cpu-ops.h"
+#endif
+
+#include "cpu.h"
 
 static void m68k_cpu_set_pc(CPUState *cs, vaddr value)
 {
-- 
2.47.3


