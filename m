Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D7ACCFA18
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 00:51:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIz52-0004Ol-SH; Tue, 11 Nov 2025 19:51:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vIz51-0004N2-Bu
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 19:51:23 -0500
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vIz4z-0005oI-CK
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 19:51:23 -0500
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-8823cde292eso3295746d6.2
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 16:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762908680; x=1763513480; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c0ooQgjp8fdCE0I1tUppq0fDnhYl978CXRbViAmWVfc=;
 b=DGWCaTYqY2WFcOXLpcd9n8xDLxNF7A/bIjI3Jboh3iX3CaWKnnM78/89nC12dsC+DG
 WKaz3xdPquslvEGrl+4lhOpES7Ogb9MzWZH18dXZv9k3Wxb4xiRqc+8vmw+mQJu/fVe/
 32t08hahbCkXk2quPfehZgg2u9nkJGhHKV6Ok+9BNEJZWRY23vqE98UU81ATURAYbnW9
 vlnuCAvPm2nJb0lR7z6yjyiu5kdNS6uQNiUtlY/naR4sUwwH7f/SI5nbm8zQTkmaJFfE
 PM6WIl5SNHFA3boAoFty2j0gRM8AlghaVW+sD7bsafg/b6oycGttGQ4N4tj2M8akhlER
 Yp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762908680; x=1763513480;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=c0ooQgjp8fdCE0I1tUppq0fDnhYl978CXRbViAmWVfc=;
 b=Tkl3kMJFGyCekVv6O/VxgzafD2nGta7yCY8BgCM33GoYwHAi1kSmhhe8uzWAVrWjmX
 Ukup6LIeOgRvmm7CI+ftjojyG9RqQywdzGrCv76fssuXg+MBRtJy+iYMpRVoghD/mSj6
 c3KJpZQXB2vn/AVdDopP/zMlAPOSct8VUQ9g3SRBI+eyMZIVMscIQeebVzacVd2KZxqK
 /oqZBYJXClBe/ISqta4iH7CGdjTwBaZfBXO5TyEX10IqEXoaXt0CLucbwPzN8Rsq/XJm
 38gc3hF22BhPjLzUU9qrN97ZnpEqF0S3yBWG+7/iHzsSUYszsoRdEihrsg3/sSY1j9Nw
 Hjrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjzdgDMGRqJR/zEBUPK7EeJviVnjw2H6P0QFLRaF39ld0eIGqg/lGDssIqs/3soHw0nrFt8n9CUg==@nongnu.org
X-Gm-Message-State: AOJu0YxvycJA2omBFuxQG35G5M6ZPx5SF+fOuE/NI+jMVfmmVk0yeC40
 AdPrpRT7FetWvGxZn4lGMsrfm/TLKwffrdCSVMeVl5XkBGkP6KeWZElu74UKdwm6
X-Gm-Gg: ASbGncuAXBlqA0WwdOhbwzEN6CjOed1c8GSAgbwoBGJZBNEAyZbDh0/kTooKTk9BQNG
 9RPs6MM/0f4dUQaaq4pXnXn2o0zW6NPY9iJYMBBoduovHOblSGA0t0WthoCb/jqmU7WKX1m6a8Y
 gLofI0aU90cQU81QTOtIGBclMMSmv1sIisyiUn/S4+aJ4r22QoaEqPp/UsRCwk0XJ35i98mm/cn
 v9L5kD64ia2qAjuJmYNL/rMIuPJByLZZyL1C7KVXWCrto0gss3+YZuiAJwsoVIiWHoRT/St1O3y
 PUZG8E8vVVsWlFvW/Cv3Er8dWcIH3uvlI8HdmCj8bt+NNmGQPEHTtzvr6yYsbD90s/+a8Sj65s6
 tmPS/okmBNv+CAhtMhnQUZV79EpKvGxMg7tGUs4R0V8ijrKNUO7tY1vjGVGV7Gx8JFQcQSxdK6D
 xY/BnxK8ib
X-Google-Smtp-Source: AGHT+IFyaIkQIk4EQs2k8HLLYluYdQCYUjI7E0j9lWNYoa83kInyCJapmuPentymHznXlaH37JMcRQ==
X-Received: by 2002:a05:6214:dad:b0:87c:1889:6a7f with SMTP id
 6a1803df08f44-882718f018emr20220726d6.5.1762908679699; 
 Tue, 11 Nov 2025 16:51:19 -0800 (PST)
Received: from [10.0.0.22] ([185.213.193.149])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8823892a79fsm81445096d6.4.2025.11.11.16.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 16:51:19 -0800 (PST)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Tue, 11 Nov 2025 19:50:51 -0500
Subject: [PATCH RFC 2/5] tests/tcg: added test for MTE FAR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-feat-mte4-v1-2-72ef5cf276f9@gmail.com>
References: <20251111-feat-mte4-v1-0-72ef5cf276f9@gmail.com>
In-Reply-To: <20251111-feat-mte4-v1-0-72ef5cf276f9@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762908676; l=2196;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=HOnmmRUvb4FXQDKxZ2OUkT6fS8G/aYsXOfMXqQ+VIZo=;
 b=+NTpZ/ubOyuqPZ3Lf2MO8vjfoQLpKdFwEV12/qTnnhGGwhNW6wvuje7o4mrH4RWjIVhl1/+rr
 83y0NWXN+sxDNvVKFC+qkflI/JWG6+m0yQbl64eWQsjtqzKCHJoZFwO
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qv1-xf31.google.com
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

This functionality was previously enabled but not advertised or tested.
This commit adds a new test, mte-9, that tests the code for proper
full-address reporting.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 tests/tcg/aarch64/Makefile.target |  2 +-
 tests/tcg/aarch64/mte-9.c         | 48 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 9fa8687453..b491cfb5e1 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -64,7 +64,7 @@ AARCH64_TESTS += bti-2
 
 # MTE Tests
 ifneq ($(CROSS_CC_HAS_ARMV8_MTE),)
-AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6 mte-7 mte-8
+AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6 mte-7 mte-8 mte-9
 mte-%: CFLAGS += $(CROSS_CC_HAS_ARMV8_MTE)
 endif
 
diff --git a/tests/tcg/aarch64/mte-9.c b/tests/tcg/aarch64/mte-9.c
new file mode 100644
index 0000000000..9626a90c13
--- /dev/null
+++ b/tests/tcg/aarch64/mte-9.c
@@ -0,0 +1,48 @@
+/*
+ * Memory tagging, full-address reporting.
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "mte.h"
+
+static void *faulting_ptr;
+
+void pass(int sig, siginfo_t *info, void *uc)
+{
+    assert(faulting_ptr == info->si_addr);
+    exit(0);
+}
+
+int main(int ac, char **av)
+{
+    struct sigaction sa;
+    int *p0, *p1, *p2;
+    long excl = 1;
+
+    enable_mte(PR_MTE_TCF_SYNC);
+    p0 = alloc_mte_mem(sizeof(*p0));
+
+    /* Create two differently tagged pointers. */
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(excl));
+    asm("gmi %0,%1,%0" : "+r"(excl) : "r" (p1));
+    assert(excl != 1);
+    asm("irg %0,%1,%2" : "=r"(p2) : "r"(p0), "r"(excl));
+    assert(p1 != p2);
+
+    /* Store the tag from the first pointer.  */
+    asm("stg %0, [%0]" : : "r"(p1));
+
+    *p1 = 0;
+
+    memset(&sa, 0, sizeof(sa));
+    sa.sa_sigaction = pass;
+    sa.sa_flags = SA_SIGINFO;
+    sigaction(SIGSEGV, &sa, NULL);
+
+    faulting_ptr = p2;
+    *p2 = 0;
+
+    abort();
+}

-- 
2.51.2


