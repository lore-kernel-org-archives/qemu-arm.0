Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6426451njd;
        Mon, 7 Apr 2025 07:48:05 -0700 (PDT)
X-Received: by 2002:a17:902:ce0e:b0:224:2717:7993 with SMTP id d9443c01a7336-22a8a8cf307mr182768305ad.45.1744037284874;
        Mon, 07 Apr 2025 07:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744037284; cv=none;
        d=google.com; s=arc-20240605;
        b=jeHy3SSQrZYGpPo53hCYzmub4FAS6eCLRqHOrOKjBOoK6nJb3BN5KBA7ijeirV5hlY
         6B4wp2AP/ov8QuBxyN9TmMRlEC1qsiXgxXVtLheGrvMZT+4oJaB0e2reR1IzcToAXQzB
         FfESjVjtea2+9f0GPPuzj2DukKIbJAxie62FN7rff1yiFNejmOxze3tTyBOolp6Lwh+i
         Gx0Q0TxJ2Re/IFFViZ6/P/YxX4xi1cUX/94wJ4EYiMVBBRUTQ18ChqRjBBDQxUISa2xX
         4kRVgrDoaDvX4r9el6ogKXPuf6aw0wT3/BLOIZG1Qk9f8TpfgTqStz1+3X/cGlf9RwYU
         +EEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y/vXoOU9/WH6B8z0Pp6XgozbGmRLjl1o39LJP8NE6XY=;
        fh=suD0jIJg8bDsS00CTx1roEw2EWciE5r8Pq42OKKaWrw=;
        b=giOhUfzjPUL73xw3Ui/qa5XSpuDSgYk5GHq+I/vbUjnJ1+IqAU+ZnAT2Tvgeu3Dcpx
         w8nPOERZV7xU8ZuGy5n8EKv1EMrl0eodkdnk2yALV2i/HmVdBF3ykC348c0zxT4Szk51
         0IuGBT3tm5Kk8yUY/LI5GwWIhSDYEmS+1MP88+uzaFQat1ZhIQhuTSGNy0BicW2BpQXI
         sq0DBo55nX1/hb1nUl7VuXSuYvih4XhduJvLj/ud+T4uoe2QYYCCT61dO+X6sB/hsVlR
         QQROMxCCujmqzoXHD7sDJiRYf3XbqwAYkKyxzFuv+z40oowAsVv8WpMzYqEYwauSs+Va
         7kbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=jdTOqdfS;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-229a7b58b1fsor71334845ad.3.2025.04.07.07.48.04
        (Google Transport Security);
        Mon, 07 Apr 2025 07:48:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=jdTOqdfS;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037284; x=1744642084; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/vXoOU9/WH6B8z0Pp6XgozbGmRLjl1o39LJP8NE6XY=;
        b=jdTOqdfS4AFHUVSGkw8JutZKDDaqWdfpfQSiwaizn0V//aCD4vgM9ZfWgGDtOOntHK
         iQfvJp/9kJLe3wvqudVo+hh7ezkeUqEPfZtm3tBZ6sKcNq268cPpR2IOEnpnVPoitXNv
         V+5RwMwO/EeYonkjNPlTmVA7RRRuXRzsv0cljqtnqxsF6JQc6FdPIFvABTRJrAAtr07S
         z3INA0RgdEvygRrRU3deYAAppQnlKzyxcE94HvlWSKDgnoU3JmWc4PDE0DvXcZwl+tFK
         X8SZoyKkLod83pxfMb2XW+4Qc3F/I2p4fCuBO8QqMmlON2e8dvuMbH++QKtYcBqDCc/A
         jcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037284; x=1744642084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/vXoOU9/WH6B8z0Pp6XgozbGmRLjl1o39LJP8NE6XY=;
        b=kNuqAiW4+NaGxsJ/GLjhXF2HDpvt2FuHlngWJb6Oh6NFKLWOgZR6KrNlVeK5dLXw9V
         8GVplKGihxBL1am3Cr4pW9mm5u4KG/ml9NoqCd1/AoskTn8+T0IfxrQEs1z9GDNk8066
         +/E+s6kPOvOJYeFMzfDZTAcer5rjhe0z0a+nSBLRORSUDqwRwUUwGqp+kobWcjnUNANv
         NEqal2rWCYCKZThaTgGYWoFz+xx29H6QUxEHmtU3qT2eUn8OHfM0cwZgVV1SZKzhmNkL
         glgJzWiNMbuTv1B7mciMEn/VqNnPDbC08N9N/AK2iihHSKet/ms10z+z9vMIoK/F7gfV
         gjGA==
X-Forwarded-Encrypted: i=1; AJvYcCVDwVHxZe1p/1PECFrQ0jIHEnHZA2ZuxA080o5IsyO3UyYlsWDYxI43ymzZrvYjLsMn22RBul5ddnPMVuyuSQMUSXs=@linaro.org, AJvYcCWJ3kIn8m4ER+/vhFvaUFuAP93Kpm1X332VjPzDuL+ndaTeGZSDzd7rJyTVXAnhZ2hQEmmfUhBL@linaro.org, AJvYcCXiS9yNT6MVa7mvcFsxc0WpEM6hYS12HKrAv+NFvUG+WC7WkyzqrDm8ePJ1bfIc8eRgewx2gJpcFI3ASswB@linaro.org
X-Gm-Message-State: AOJu0Yy0jiOvLKqgPmETNZi2CWGjtP6UjkqPyLIkW2h4dbhoD0XP2Myx
	o6CHRnRXQw86WZsybcyY/BH2pgP09ewiQfmq28ZeOzL2RRMeKXyqPl2VK6WM
X-Gm-Gg: ASbGnctMUDX3kU0kjVDhWUaJP54S/6enRruseWddOScA+eCu7qwvDsHva4LBeDfiEf1
	/AjuP6AIr8cjeZkFI/bntH5jap2muepet2VirJppVH94Np3Tu/QiCQ+d8urtv3fJFTOvWhKEzh4
	W0UXgPaz6Yi9VhWhfVU1sV3BG3IuktjIUbx0EUbhyBdq3JLO3iVlc8fNbWOfbhJmAZbIObdAXgX
	nZvwATKZlVvhyp5fEU1nTLYb8V4uMmmYxBS7hiM60Laq8VLfppqXyO/PSHrTXrappMJ2NGwo5sQ
	E11G9vMgL/oaBZyNjlo+UgB+ip4aiG0Yzsv408JZFChy5eDakupik6uwTOa+nw==
X-Google-Smtp-Source: AGHT+IGVX4WZdwjz8t2px+L/u1IusGGhdA+M9JnGeDomm+fX2PtXqK/fd/imZowOMFEYatlfbwDLfA==
X-Received: by 2002:a17:902:e749:b0:224:13a4:d61e with SMTP id d9443c01a7336-22a8a8d31e9mr167348655ad.51.1744037284265;
        Mon, 07 Apr 2025 07:48:04 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:8768:486:6a8e:e855])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ef3c2sm8856960b3a.59.2025.04.07.07.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:48:03 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Greg Kurz <groug@kaod.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 04/10] util: Add coroutine backend for emscripten
Date: Mon,  7 Apr 2025 23:45:55 +0900
Message-Id: <b6b8274b7dae5f3e4ee12c1d20cf9c329dd350bf.1744032780.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744032780.git.ktokunaga.mail@gmail.com>
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gfYTr1EQBGf9

Emscripten does not support couroutine methods currently used by QEMU but
provides a coroutine implementation called "fiber". This commit introduces a
coroutine backend using fiber. Note that fiber does not support submitting
coroutines to other threads.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 util/coroutine-fiber.c | 127 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 util/coroutine-fiber.c

diff --git a/util/coroutine-fiber.c b/util/coroutine-fiber.c
new file mode 100644
index 0000000000..cb1ec92509
--- /dev/null
+++ b/util/coroutine-fiber.c
@@ -0,0 +1,127 @@
+/*
+ * emscripten fiber coroutine initialization code
+ * based on coroutine-ucontext.c
+ *
+ * Copyright (C) 2006  Anthony Liguori <anthony@codemonkey.ws>
+ * Copyright (C) 2011  Kevin Wolf <kwolf@redhat.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.0 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/coroutine_int.h"
+#include "qemu/coroutine-tls.h"
+
+#include <emscripten/fiber.h>
+
+typedef struct {
+    Coroutine base;
+    void *stack;
+    size_t stack_size;
+
+    void *asyncify_stack;
+    size_t asyncify_stack_size;
+
+    CoroutineAction action;
+
+    emscripten_fiber_t fiber;
+} CoroutineEmscripten;
+
+/**
+ * Per-thread coroutine bookkeeping
+ */
+QEMU_DEFINE_STATIC_CO_TLS(Coroutine *, current);
+QEMU_DEFINE_STATIC_CO_TLS(CoroutineEmscripten *, leader);
+size_t leader_asyncify_stack_size = COROUTINE_STACK_SIZE;
+
+static void coroutine_trampoline(void *co_)
+{
+    Coroutine *co = co_;
+
+    while (true) {
+        co->entry(co->entry_arg);
+        qemu_coroutine_switch(co, co->caller, COROUTINE_TERMINATE);
+    }
+}
+
+Coroutine *qemu_coroutine_new(void)
+{
+    CoroutineEmscripten *co;
+
+    co = g_malloc0(sizeof(*co));
+
+    co->stack_size = COROUTINE_STACK_SIZE;
+    co->stack = qemu_alloc_stack(&co->stack_size);
+
+    co->asyncify_stack_size = COROUTINE_STACK_SIZE;
+    co->asyncify_stack = g_malloc0(co->asyncify_stack_size);
+    emscripten_fiber_init(&co->fiber, coroutine_trampoline, &co->base,
+                          co->stack, co->stack_size, co->asyncify_stack,
+                          co->asyncify_stack_size);
+
+    return &co->base;
+}
+
+void qemu_coroutine_delete(Coroutine *co_)
+{
+    CoroutineEmscripten *co = DO_UPCAST(CoroutineEmscripten, base, co_);
+
+    qemu_free_stack(co->stack, co->stack_size);
+    g_free(co->asyncify_stack);
+    g_free(co);
+}
+
+CoroutineAction qemu_coroutine_switch(Coroutine *from_, Coroutine *to_,
+                      CoroutineAction action)
+{
+    CoroutineEmscripten *from = DO_UPCAST(CoroutineEmscripten, base, from_);
+    CoroutineEmscripten *to = DO_UPCAST(CoroutineEmscripten, base, to_);
+
+    set_current(to_);
+    to->action = action;
+    emscripten_fiber_swap(&from->fiber, &to->fiber);
+    return from->action;
+}
+
+Coroutine *qemu_coroutine_self(void)
+{
+    Coroutine *self = get_current();
+
+    if (!self) {
+        CoroutineEmscripten *leaderp = get_leader();
+        if (!leaderp) {
+            leaderp = g_malloc0(sizeof(*leaderp));
+            leaderp->asyncify_stack = g_malloc0(leader_asyncify_stack_size);
+            leaderp->asyncify_stack_size = leader_asyncify_stack_size;
+            emscripten_fiber_init_from_current_context(
+                &leaderp->fiber,
+                leaderp->asyncify_stack,
+                leaderp->asyncify_stack_size);
+            leaderp->stack = leaderp->fiber.stack_limit;
+            leaderp->stack_size =
+                leaderp->fiber.stack_base - leaderp->fiber.stack_limit;
+            set_leader(leaderp);
+        }
+        self = &leaderp->base;
+        set_current(self);
+    }
+    return self;
+}
+
+bool qemu_in_coroutine(void)
+{
+    Coroutine *self = get_current();
+
+    return self && self->caller;
+}
-- 
2.25.1
