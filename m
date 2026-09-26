Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF75FC9831E
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:14:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMVu-0001pj-Gc; Sat, 26 Sep 2026 03:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMRW-00051t-Hu
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:03:31 -0400
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMRU-0000dY-RQ
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:03:30 -0400
Received: by mail-dy2-x10.google.com with SMTP id
 5a478bee46e88-328664b7528so1430781eec.2
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406207; x=1791011007; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BiL+h4U+/0i4V9PGKop4ONI8GOLawX2pYUUOBevWvkI=;
 b=AHIY2d/FdVRiOfEpzF9ho/cezuhSIQpceBP5YzWCnIIQ65vgj6KQ4RCBKT00+lSQOm
 H/zZxzPUi5af8EhZYFpzwg5Lcl5W5w0jbTNcA7fj1Sh12EBfivbFpQtB6kVzAuu09YY7
 BdIvzVGVp4d6Wk3vyhp74NUmjNbcIp5L3YS4/pBajHxGiFvK22S9meZEyQOcBAUDQf/h
 bbaNp9Id6r+jN4I/polaEz13BZDjNYn9hQwgtlnSmHbDS14LhzGc0Iz+L2nG4q1kc/0q
 AtLUE+xNLjXbiaOoFm35RbXSt65AUbyx0IAcDVmzc6ELRkSbBfqGCQe4BW86iTnlqRQi
 iVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406207; x=1791011007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BiL+h4U+/0i4V9PGKop4ONI8GOLawX2pYUUOBevWvkI=;
 b=C1NU26bMUuANdzFBZm8O0yc2a3nt+FliX0vu0TRK8gifcwDdunbuouMJ7EaAsm7chb
 xmu8W0pGJyuXgTBFq41fnoMgoDuY1pepV4KFKBvYEYm8EMFouhIs4P7CwbHBzwmxlYGi
 FMJSaT9iXJONH+AZiup48HnK+024daPQC5LygHo9MaYBmonN1goeRrCIzQuvravYvDkf
 /nWc2jgMcpFjrZuII8XVC6MNIOfOLCZ8FTUPnTpbKZjUU7iqFAu/g6BlXEeaot9CYk9X
 c3j7mtYyjskxPgR3vTnvnvrNool6qyV8p9gcCwZ6MmfTPu+3IW7pURE0kIL7aA6l8eEU
 TwQA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxgwmlfHgJwSmRixLreNgvW0jgG/a7Qj2qX8X+0kbj3jpxXzgYngqaiafF4I7nVhxDJOXMbtpQKow==@nongnu.org
X-Gm-Message-State: AFuF++kb77GM/yCmI9/U273/oV52E15OwiENFIxH8Z7TL9wf/rdllQAO
 d1QA5jcGVnTJwq15br5BaY839kfq8t49Xgxdja+v5vJnEBqoWaWMIvIb
X-Gm-Gg: AYBFou18+ErjxeoSbfJ7rdY6wu9m4/zIFcV2Li5saxbkHCwcsEWx/dp/CVarv18JRCb
 0g3c7YiwmIgRW0Edr9Bjz8ZI0vkpBeiVPDdAgqoXPJByaKp+nMY1rCYMjY853O40ZVPrU9Afy1i
 olFf1IlfgX/PA9ES0kR6QoJ+MDu7isQLJU9315VtAUawzVc3hL0a0z88vt7lvxufONAWjtUrQSJ
 kGrHGvpTLQFBsql2KihfKh0/u18ffHA5Xh4jvyB8TChfPZ6GoswMegVUYPu/W5HbgAKG43nr+Xg
 J+MLygodvP3xrKmMSWxbzJ0vi6vQ6dTOVxqf+t6QhMJZB+081f81eTYaAEOlkF37Ltb5IbtxFho
 y/K+a1+3dLQ1QvlcoFm7N7bTB0GUOyNtQHUVKkdCeCoXfBXhrFI6++b+hGE+r3UPjYT3o8VBkVi
 lV68XaOc7E0RSFu56jhomuYpH9TnlUqO22GuDMcSAFa+lruyzaXGiYzGl54CWkkDT8jwyuxfg1m
 ds/Yvw3mSs7FS9Jp61GkBBMsSvfmCM=
X-Received: by 2002:a05:7300:f282:b0:33b:fa13:61bd with SMTP id
 5a478bee46e88-34272853c94mr2057256eec.31.1790406207220; 
 Sat, 26 Sep 2026 00:03:27 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:03:26 -0700 (PDT)
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
Subject: [PATCH v4 36/55] exec: compile abi_ptr.h without per-target
 cpu-param.h
Date: Sat, 26 Sep 2026 15:00:35 +0800
Message-ID: <20260926070057.1234-37-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x10.google.com
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

Include cpu-param.h only for user-mode, where abi_ptr depends on
TARGET_VIRT_ADDR_SPACE_BITS. Softmmu abi_ptr remains target_ulong,
and its format is PRIx64 when COMPILING_PER_TARGET is unset.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/exec/abi_ptr.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/exec/abi_ptr.h b/include/exec/abi_ptr.h
index 2aedcceb0c2..7e8a78bc980 100644
--- a/include/exec/abi_ptr.h
+++ b/include/exec/abi_ptr.h
@@ -6,13 +6,12 @@
 #ifndef EXEC_ABI_PTR_H
 #define EXEC_ABI_PTR_H
 
-#include "cpu-param.h"
-
 #if defined(CONFIG_USER_ONLY)
 /*
  * sparc32plus has 64bit long but 32bit space address
  * this can make bad result with g2h() and h2g()
  */
+#include "cpu-param.h"
 #if TARGET_VIRT_ADDR_SPACE_BITS <= 32
 typedef uint32_t abi_ptr;
 #define TARGET_ABI_FMT_ptr "%x"
@@ -26,7 +25,11 @@ typedef uint64_t abi_ptr;
 #include "exec/target_long.h"
 
 typedef target_ulong abi_ptr;
+#ifdef COMPILING_PER_TARGET
 #define TARGET_ABI_FMT_ptr TARGET_FMT_lx
+#else
+#define TARGET_ABI_FMT_ptr "%" PRIx64
+#endif
 
 #endif /* !CONFIG_USER_ONLY */
 
-- 
2.52.0.windows.1


