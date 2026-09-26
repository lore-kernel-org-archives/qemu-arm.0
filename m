Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF8BC98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:14:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMU4-0007XC-H2; Sat, 26 Sep 2026 03:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMRE-00043s-Le
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:03:15 -0400
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMRD-0000bD-3G
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:03:12 -0400
Received: by mail-dl2-x10.google.com with SMTP id
 a92af1059eb24-142dd046b87so1226466c88.2
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406189; x=1791010989; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ALxUX35YxAT0/hMJem0o96GiSG/xYkkLx16debZXGzM=;
 b=qvOHdJNGBmVG10EpjqO64jiVjb2y89tCUBFFiZfzQdnTPpBYid+Ad4fVBp3gWmftBd
 K6KnrTxkdO2PSEagYNUg17G9NnS3x/ys79UQy11m0uUZqOjaPojNr9PMZhJ+s7on6lxO
 Z3yeaEA8dc6twwriSg0+YYJ2GGdgn8u6tF9z5lLATnDQ3tEKZk/Bi0bO9sCNHlRdtVey
 LJqYJlAdDSVMqOcESwkGQff8bKvQGIth4NlarDBaG1DXuI6R7KOlELFdpN1qJKuw3Ol7
 6V/VfZhCsBbSMsA9Qravq2Gjl0dva0cy5wkLfrGBt9g9hh+fwGhyb/rOErgJSXc6rcBI
 DzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406189; x=1791010989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ALxUX35YxAT0/hMJem0o96GiSG/xYkkLx16debZXGzM=;
 b=dW3q49yQTDUTvvncK9HG9HAo84HtvlimdHOZCxExA86jFeKE9sg16czOVNQc+iH3eq
 z6sx9OnOnSqN35ITZ95RnyltzOdTGF/2zI2o1+dBWBWbA2GXICzbjwZcvoniVvCucLQV
 XEOWTjQdU86cKCdvhP+W5bP92nsD+RNHwPCD+9s+NzdroFG4Qpxqj4OQMwVV0bhwLQEp
 1IorVWry1lPQ2m6+F5K42nmaR7C7iut8b1dNDVgoZwcrrjXo2AlPzmnHpXcNWkZAPixD
 RrydhFx/JmZiTXIfmAin0JUWVJaFemWrZiMpnYrvfjk+i9On0jEH4v4iRAXe69pKWCrW
 YkXg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzZEYcnOT7XR65C/xRtdE+MbkIhnyu/WTqik6UsKcjyUqe3YTgiupbv+OvXXV6xBcBbXtUjrrKEJg==@nongnu.org
X-Gm-Message-State: AFuF++mbI8e/OC4JeaDznIWRysiLWqZEwQ4+uVucUAb/BWTQD1CpbwnF
 m+kh/6n7ECYVR5p3nfUQ7QGe5mAPl1pDNhY9I6MTg6P5cdT5APxWczdw
X-Gm-Gg: AYBFou0C87xwbQl5TbG/7FwaGxUto6jnm4vC1rx7fzZJfTvFWxGGWAQchE2cksoMp6T
 qcm0JYUIYDHVPJfuvEKgi0khgieZk0cQzicYL6Gk8NFJdKom5bBVM+RaerihRJ1aqpFK9Lt8XCG
 ZaZ5DNcWonPgzDyViaKj9lXmU6G/ORECDDF3kQJJct1/3eZdpdyLgmSEI+RQIEkYmKPUJMbjfI9
 M8lWqHqeLoVx78qrDv8lp0KcxxxFlj5rhX6Atu8ZI41HlDCx9yKn9/TPh/PlhmT9Efwm5SU5AX5
 djlxAMGULXCts5rUim0aFq27/wPfd2cpSX6nU/JDFQ7YIPXkYplWnMXWXH5kpmVH0TYO7i6zu39
 v41H3Cn0YPNulj0mUT1iRzvhMX2MXwuxvUJvwxESnH99cl6etjz4cl74+eCZNVES/VcWPVvQT6S
 CU8nJbLhufLZQdSSFFtWlehOZ6bQb4Kql5chQt5XEMVuoS7CFTZkbmgn4c3MVECNUl+jaxwJU9v
 5eLK4HnfVonduk0GkHOc+bcsuizHeo=
X-Received: by 2002:a05:7022:f108:b0:144:fb42:52 with SMTP id
 a92af1059eb24-146cfdd1e08mr1944186c88.28.1790406184037; 
 Sat, 26 Sep 2026 00:03:04 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:03:03 -0700 (PDT)
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
Subject: [PATCH v4 30/55] accel/tcg: move helper_lookup_tb_ptr into cpu-exec.h
Date: Sat, 26 Sep 2026 15:00:29 +0800
Message-ID: <20260926070057.1234-31-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

helper_lookup_tb_ptr is implemented in cpu-exec.c. Move its
DEF_HELPER line to cpu-exec.h and emit helper_info_lookup_tb_ptr
from that file.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 accel/tcg/cpu-exec.c               | 5 +++++
 accel/tcg/cpu-exec.h               | 1 +
 accel/tcg/tcg-runtime.h            | 2 --
 include/exec/helper-gen-common.h   | 4 ++++
 include/exec/helper-proto-common.h | 4 ++++
 5 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 accel/tcg/cpu-exec.h

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5b4bca5084f..021912dc022 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -40,6 +40,11 @@
 #include "exec/replay-core.h"
 #include "system/tcg.h"
 #include "exec/helper-proto-common.h"
+
+#define HELPER_H "accel/tcg/cpu-exec.h"
+#include "exec/helper-info.c.inc"
+#undef  HELPER_H
+
 #include "tcg-accel-ops.h"
 #include "tb-jmp-cache.h"
 #include "tb-hash.h"
diff --git a/accel/tcg/cpu-exec.h b/accel/tcg/cpu-exec.h
new file mode 100644
index 00000000000..e4803ebc1a6
--- /dev/null
+++ b/accel/tcg/cpu-exec.h
@@ -0,0 +1 @@
+DEF_HELPER_FLAGS_1(lookup_tb_ptr, TCG_CALL_NO_WG_SE, cptr, env)
diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index c0626fa0e02..26e0baeca51 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -20,8 +20,6 @@ DEF_HELPER_FLAGS_1(clrsb_i64, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_FLAGS_1(ctpop_i32, TCG_CALL_NO_RWG_SE, i32, i32)
 DEF_HELPER_FLAGS_1(ctpop_i64, TCG_CALL_NO_RWG_SE, i64, i64)
 
-DEF_HELPER_FLAGS_1(lookup_tb_ptr, TCG_CALL_NO_WG_SE, cptr, env)
-
 #ifndef IN_HELPER_PROTO
 /*
  * Pass calls to memset directly to libc, without a thunk in qemu.
diff --git a/include/exec/helper-gen-common.h b/include/exec/helper-gen-common.h
index fa571d88147..73e979a35f3 100644
--- a/include/exec/helper-gen-common.h
+++ b/include/exec/helper-gen-common.h
@@ -11,6 +11,10 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "accel/tcg/cpu-exec.h"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 #define HELPER_H "accel/tcg/tcg-runtime.h"
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
diff --git a/include/exec/helper-proto-common.h b/include/exec/helper-proto-common.h
index 1b098777e8d..3c32f95f4c1 100644
--- a/include/exec/helper-proto-common.h
+++ b/include/exec/helper-proto-common.h
@@ -13,6 +13,10 @@
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "accel/tcg/cpu-exec.h"
+#include "exec/helper-proto.h.inc"
+#undef  HELPER_H
+
 #define HELPER_H "accel/tcg/tcg-runtime.h"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
-- 
2.52.0.windows.1


