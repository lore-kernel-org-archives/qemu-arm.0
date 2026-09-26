Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D195C9831E
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:03:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMPW-0002Be-Eq; Sat, 26 Sep 2026 03:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMPU-0002At-Og
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:01:24 -0400
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMPT-0000Pw-2M
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:01:24 -0400
Received: by mail-dy2-x0e.google.com with SMTP id
 5a478bee46e88-3411e0ace19so778305eec.3
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406082; x=1791010882; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qkiRWh0yDSkP2OT8vLUxuaEaTt8B1WJVNLebJyYrgq0=;
 b=q3bK/EFqleW+HGk2uw71XrcZHRDnxVJAS0p57ADtDCTSf2OmPLEq2rIEHwsY1sVWjK
 o/KSxPYA93lLAmCLCLPiUXEfyWGUJGaUYfyRUl0bP0Gp7pU2CyArppU2V1Fwe2eXk41R
 QhDhNOtXzb3jUW21Dg+SBpZwU2iYp5O13MTfT7YCPoczT7Jou6kuA1By0mzy+Xbptdr6
 +bDt7pLgnwJtaSnyK4w9xdlJCYV6Ru6YLunGawilwNQd3uOOuy3PVooEO9cAPe9obgux
 alsxJ3vn4rXi+PEcfDR3Nf7LkduQSRWoGpyp7pJew7ypMBfAG6HSRPKuaqRa72qJDqlX
 9r6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406082; x=1791010882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qkiRWh0yDSkP2OT8vLUxuaEaTt8B1WJVNLebJyYrgq0=;
 b=RxzQR026p2LhHa8Ji0KNLUy62J8ph+iIzsam/S9nZmZZv8BgCCXa4tDtwHb9eCDEId
 CNV3PxExslfj6t7sZCctKA35p+hIQ3iSlXj98u2mqrKK3yKqRd5tRy2nxJ8QEWi+OKyM
 N9y6QqXB+0KogNsNkGZ5oIoVE3Q9yLd/bByqdNPAvLXz7+9wRgKqiaOGZ0wg3tHtwrdw
 MeEk8bbYXimm9D8u4J/7xXsWLieRd2FBXCuicrHad9KVDBb2F1B5PsGiwdxAkED7OcR+
 6BYFihAypu9cbz/GoIBryxvqX6X4NF/Z63V3mOs1fRvW+ac1pJXDhnls8w5JMO73Iqfv
 QQJw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwigvRZohRIrnZwlBc+3DLvwIL3zr2hpJVHwyL0Y7qcqiid85Z9yNFTQ+lZbumqCodpF/64yBj5MA==@nongnu.org
X-Gm-Message-State: AFuF++nFeDzK2zZvayBCPhYfrsQk1SYGkrCD/AGVxPijgCRj+wcq7Bb1
 Pkyh1cdnoCjnjq6fiLaTaM4fkCIMXQaMWzAMLQCwgRsCNAZSFUVcPiWi
X-Gm-Gg: AYBFou3g7q9w0g/ZMsgLYIfNLTfOgbSTlyzI53/Qtq3G1j8T7s4J+7tneccSUsx0bIc
 Y/iiaMT0t4iFUZU1+2FqC20h6CcKev066v4ZzM1Ij6exvmTVwzgXiuzyGFTvQbLYbt9e42NM17i
 avnCt1zq3lMmURsBCgrZnXAgCgVPMUEsllGDp/L78HgU+3MuepSYiAsMnS6VzmS2RUnZrZ3gDYF
 WDRiYuW1Qy1dBOYD2a2lDd6/R5TWSpJLrAKSR9z+QQmelp6wTqsf99wExe1XHDdxAfoEk1DOuKz
 wPQLJJWnc3VtvSK+rGGUH1ykqrLDsbIHBaVwO5OLMiJCbQfRA2CPOocITYJFT9srjcGGGyYfFOQ
 n6AbY5YPa7ZFG+cFMLQLLoKl8Oo5pXWA7nZy3Ypx1HqOaDh7CGIdPZdcS3iHY/wkbvuVRdWU7im
 VtzHYPQLfD9xnZd803HptW0TSDLywONLfwMjkJ6W7IEjY4QjXbE9zFW7OEGU1JriCciBiDCUwyh
 88Bq5ZnfVvFVy82x+pQfmtpYFn5AeE=
X-Received: by 2002:a05:7300:7313:b0:341:3ca2:de2d with SMTP id
 5a478bee46e88-342700bdf94mr2923658eec.6.1790406081403; 
 Sat, 26 Sep 2026 00:01:21 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:01:20 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 04/55] target-info: rename target-info-impl.h to
 target-info-def.h
Date: Sat, 26 Sep 2026 15:00:03 +0800
Message-ID: <20260926070057.1234-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Rename the TargetInfo structure header and its include guard.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/{target-info-impl.h => target-info-def.h} | 4 ++--
 include/qemu/target-info-qom.h                         | 2 +-
 page-vary-common.c                                     | 2 +-
 page-vary-system.c                                     | 2 +-
 target-info-def.c                                      | 2 +-
 target-info-qom.c                                      | 2 +-
 target-info.c                                          | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)
 rename include/qemu/{target-info-impl.h => target-info-def.h} (94%)

diff --git a/include/qemu/target-info-impl.h b/include/qemu/target-info-def.h
similarity index 94%
rename from include/qemu/target-info-impl.h
rename to include/qemu/target-info-def.h
index cf42aabbc8b..8019d2c7196 100644
--- a/include/qemu/target-info-impl.h
+++ b/include/qemu/target-info-def.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef QEMU_TARGET_INFO_IMPL_H
-#define QEMU_TARGET_INFO_IMPL_H
+#ifndef QEMU_TARGET_INFO_DEF_H
+#define QEMU_TARGET_INFO_DEF_H
 
 #include "qapi/qapi-types-common.h"
 #include "qapi/qapi-types-machine.h"
diff --git a/include/qemu/target-info-qom.h b/include/qemu/target-info-qom.h
index 91be415ed33..0f6772e65c3 100644
--- a/include/qemu/target-info-qom.h
+++ b/include/qemu/target-info-qom.h
@@ -9,7 +9,7 @@
 #ifndef QEMU_TARGET_INFO_QOM_H
 #define QEMU_TARGET_INFO_QOM_H
 
-#include "qemu/target-info-impl.h"
+#include "qemu/target-info-def.h"
 #include "qom/object.h"
 
 #define TYPE_TARGET_INFO "target-info"
diff --git a/page-vary-common.c b/page-vary-common.c
index ddd08633788..5a4654725a8 100644
--- a/page-vary-common.c
+++ b/page-vary-common.c
@@ -20,7 +20,7 @@
 #define IN_PAGE_VARY 1
 
 #include "qemu/osdep.h"
-#include "qemu/target-info-impl.h"
+#include "qemu/target-info-def.h"
 #include "exec/page-vary.h"
 
 /* WARNING: This file must *not* be complied with -flto. */
diff --git a/page-vary-system.c b/page-vary-system.c
index 6c49c10e23b..9773685dc16 100644
--- a/page-vary-system.c
+++ b/page-vary-system.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "exec/page-vary.h"
 #include "exec/tlb-flags.h"
-#include "qemu/target-info-impl.h"
+#include "qemu/target-info-def.h"
 
 QEMU_BUILD_BUG_ON(TLB_FLAGS_MASK & ((1u < TARGET_PAGE_BITS_MIN) - 1));
 
diff --git a/target-info-def.c b/target-info-def.c
index d121b8c0170..fa19cabc55f 100644
--- a/target-info-def.c
+++ b/target-info-def.c
@@ -8,7 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/target-info.h"
-#include "qemu/target-info-impl.h"
+#include "qemu/target-info-def.h"
 #include "qemu/target-info-init.h"
 #include "hw/core/boards.h"
 #include "cpu.h"
diff --git a/target-info-qom.c b/target-info-qom.c
index 6965e4d1169..2b38673a3f8 100644
--- a/target-info-qom.c
+++ b/target-info-qom.c
@@ -9,7 +9,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qom/object.h"
-#include "qemu/target-info-impl.h"
+#include "qemu/target-info-def.h"
 #include "qemu/target-info-init.h"
 #include "qemu/target-info-qom.h"
 
diff --git a/target-info.c b/target-info.c
index bba4503151a..9abe72b1f55 100644
--- a/target-info.c
+++ b/target-info.c
@@ -9,7 +9,7 @@
 #include "qemu/osdep.h"
 #include "qemu/target-info.h"
 #include "qemu/target-info-qapi.h"
-#include "qemu/target-info-impl.h"
+#include "qemu/target-info-def.h"
 #include "qapi/error.h"
 
 const char *target_name(void)
-- 
2.52.0.windows.1


