Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B072CA5FFC
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 11:53:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEQDF-0008Vr-5O; Wed, 07 Oct 2026 07:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEQDB-0008SK-JC
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 07:53:29 -0400
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEQD9-0007xw-To
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 07:53:29 -0400
Received: by mail-dl1-x122d.google.com with SMTP id
 a92af1059eb24-157fe9d771bso668294c88.0
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 04:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791374006; x=1791978806; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=y/n2W1Aed3myqHNBQyYhTG0fof+USqcnKZ3df3b6IGk=;
 b=mAmQ6q+DZa9FvksxBhqK13PC06sYuUthxRX/G6ewppban9CDuvcntmeptgwwU3xymV
 XK/s8X1UQOww3IQgVlCMqsIt0PyHPNPOeorzj5aOzND7iaB0D+Vz7b+csX4auPqiiNPt
 UIz0qa15730yluBa3WIr4xkZD0kt+i3RACBsKfQ47IHycJkfW3cqkeJvCqwkAI7H0tYM
 ZtQvalWOPTK2WSneEboNxBP+53/M9SlWIpwv9hU0k6o2sFMv4s0I0pjzdB1IMKbWBtma
 4JgeNtLVYt8xWxyRY5xxN8I4a2ygfsdyaH0bpibHb0f6Dv91KxJyE4cAwze4s1nDZiSe
 5cVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791374006; x=1791978806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=y/n2W1Aed3myqHNBQyYhTG0fof+USqcnKZ3df3b6IGk=;
 b=grN9o8X1mjDsYXHIKBzCPSDDGcoa3mWqdbcQILXtz5iOWyoaF42EQTUc7KDFiGt8x3
 hstc1Y47QK9hLNEH1A6GkTEAXizxzOpkcpuogRXmXd2pZ5l9CVVbXwzI0Syz5BJXrsiA
 u8q+LEXqtI1L6+08oMWXDNt9PB1CXuoeYIot8UmiXZLLnqnIPVDQxTGKAoJ6FbyPqg7z
 HdhBMOwcslLWxs/gvi5kPN0TsI3UzXuQBm08+fzISWex3LDDxRDc3iSM6jufCGNGIpCK
 ePApPFTfDdaospFSBenMGQT7rM9Zl2uEXUX+5PpZBWzyBomIGS/6vXSUieo4Au89/F7K
 TeMg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwtudYiFdDNVz+WkfudmIB5SWNBzfRKcwSWGmMgFS7NuDKhvfc3BxHhHfufSPJmmFga3RFAAQJU+Q==@nongnu.org
X-Gm-Message-State: AFuF++nFzLvPAFdPeQT7uKbGomJKMBDqh77n2PL/Rfk+qgopdqO8LPsy
 3UorFz5SIeRT7eK0KhoZCk//5TeJsfShdIJ3JUACGkdxzex2HRbAwwdG
X-Gm-Gg: AYBFou2+LTPXyxFnZFWg5+q5iIwPQElseJNdhDVJLzZH6LWG6CB08/I/B6pLauODsxY
 QXYymMDmtHnGff7o69Olb8dE7TBIkYtA4HxMuZG9KP0FzG+rXKurq2ZpQxJ/zikL+JZP69Vje9t
 xl3A5QPG6ifP60XfuSnoJDRagwHZ7xdtBMCEWU7ZU6l77fagdirrTanLDr1SEuBYeZDaqvE9udn
 vdS/o0lS6o5jOHcyuGrwNXTBcCnKkqw9yw3RgUpASP75F1G5Am6PMrQ6TGSOwUwodBCPACOR83L
 iMIahA+NSOOoV5Ka7ZpV7oiAFxn8BnR+a+lrAIHxodiyECIKjmZ3VcOTvDSNCE696SYzigvAwKC
 k4+UPl3eJfZWZ279qXTaXvAXhvSNulTvgjWudbPs7hg5xz8RdCBsaT+a6veb9jQ89JU44ntbPrF
 Iz+0odWtXm0p06OD2/2+gc39l3VnXZa/1nL52hs7hRS4fRGV0pqNXNZNHuV8Rhnewal0oK4h4jl
 dzW9y8sVGBy9sjvwQ==
X-Received: by 2002:a05:701b:4183:10b0:151:ece6:b171 with SMTP id
 a92af1059eb24-162041de4a1mr2065651c88.14.1791374006190; 
 Wed, 07 Oct 2026 04:53:26 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1616980c3b7sm6429520c88.16.2026.10.07.04.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 04:53:25 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Stafford Horne <shorne@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>
Subject: [PATCH 3/8] target-info: rename target-info-impl.h to
 target-info-def.h
Date: Wed,  7 Oct 2026 19:48:00 +0800
Message-ID: <20261007115253.328-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261007115253.328-1-luoyonggang@gmail.com>
References: <20261007115253.328-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122d;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
index 8b6e1ece969..ba2e4370afb 100644
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
index 3ae1627b8fb..aeeedb7e818 100644
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
index ab43c9f802c..6b365113955 100644
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
2.55.0.windows.3


