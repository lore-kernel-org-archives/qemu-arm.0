Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783999njd;
        Sun, 27 Apr 2025 23:41:55 -0700 (PDT)
X-Received: by 2002:a17:902:dac9:b0:224:194c:6942 with SMTP id d9443c01a7336-22dbf63d31cmr152617865ad.34.1745822515439;
        Sun, 27 Apr 2025 23:41:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822515; cv=none;
        d=google.com; s=arc-20240605;
        b=RalasxZD9U17N9XpnJY9QtjYT4sJ615sRMOrzp8vJF54/zxAxHVeNXQjlZaYyVZ7jT
         orouKWBWRgBzk4yn4LUcmhY495Rlo+So8i836laIBQmy2gfylvmY0ZbvRaaOTRwqUwMu
         gV72ryMJlfTW/k3WnmLvZI/d7WZag49eAY11OWC989zr/0akCMWraGJBmJyx0K3AsjkR
         OQEDqGR0K/WEwyizsjJWWbdRLM+y4TVYGYZkCx7rG10eCXF6pTSsOmbPIlg6j7ZNuQna
         zQL2wbMqGfDOa/jhBzKPlzKc24Pu1VKc54diWlGCIgl5XhO7M5qAREuJ53x4+ms8imjm
         ThfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=K0Wf80NffurSlkXmcsdUzlJZxbjy4i/ytcK33G2V2E4=;
        fh=JjPYbFraR6qRJh6vdNfWLAGkAaIHItjfga/b/xUsxv0=;
        b=GvRTfoowxIixTa8bLUnAILoYBd1MmswB0f+IU8m2Nn7zXulMfmsLW8P8W6peiB9IUG
         DzoewVl2hG8HfdV5dWmhDg2wmk+oyImccjLwQ/EOFK69l28kT6ExSW3t5JVTyteu8Get
         fwR/sUhwKAJN7WKej/F+03nqV/4VdTXoBdoB5qxPwAWYA/L00cgHxuqtfyMAeYdCfZkT
         dKFPWFqz6AtDkquXs89wawIwKW1gKELhxLVtcNBEaxGDZUozalSRn3pV8PLp9DZH48JE
         NI91O+F+paLFqkW9f1Y7H6/HOITeD/XU0jiFtNZZ6wMFyKgHjj5QBIBXChm6CcaiBYtH
         n/PA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OX1r1aDw;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db50f4f48sor80880075ad.13.2025.04.27.23.41.55
        (Google Transport Security);
        Sun, 27 Apr 2025 23:41:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OX1r1aDw;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822515; x=1746427315; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0Wf80NffurSlkXmcsdUzlJZxbjy4i/ytcK33G2V2E4=;
        b=OX1r1aDwhe2D89oVwmsrNymLi86FoLL2ov4ZOnqirXrukyeIRsak+JZ/9iStGJlG6e
         Y1qh80Vx34gre2gd8gaCSio4v5Zagx2SVnDEm8+yqrOgGTQsMAcuayzZeLegw+E2Va0R
         SwVdxq3L6sMCAQ43buuj4pNLgSyIeA7zSx1fIEz9/C1fDZJ0/2b6nK3TuW8NAI7sqMDH
         9lyNK22VsHBmJnKLJqNRSTlbQXkyr4OBXQcA/RoYBy/emq1xJXVbnyuXQFZXfGf9sFR3
         GfIo9dmm6fS3fpevGjecvJ2ToleAK8Fka4WuQHqLxZDoveEjIL7uYM6RuJyZQtRIymit
         xq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822515; x=1746427315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0Wf80NffurSlkXmcsdUzlJZxbjy4i/ytcK33G2V2E4=;
        b=CMIxKRy/Wv6OhST9WsXcaP1BcQJMowXVRCS1S9WJU0XxbVnZP88+jE77PAQT/ZYwEP
         RpFewMYk3YdbckBBckVzt4pSsF5ZnE5BWbd+2TrfFRMM5wVMBtGFvrqReSWLUCZp4A2f
         hnTddGlmNYN+OAAM2CYmqzirLVf+x8rp1qQdTRSoIG+eCA/7zwHCXOicWLyn6UGI7V/z
         bhqAVIEiGQHcRUsOvO4h0exJ3XwcXNMqTz4UpovwZH5o0nEu4SoqVC/7k1uNxHYyZm4c
         BB+REk+9KLwXWvY0vYxRpILfz96paZPEDLiCPh+9nv5nAvs6gMglvGR45P/K0tXbTOM0
         S+mg==
X-Forwarded-Encrypted: i=1; AJvYcCUX+nlxA4j7GDeUhv3+LeBmISm9m/9p1lKY3igUt//tz9WDp+D5y/S+Y8TSmrenIdsGMW6++0lh@linaro.org, AJvYcCVr/+UuVjt+GKwfE1D9N6NMtLxgQPtk6NLwhYV/xHw25bxX7emWGn+ylUmGvcuQ+eryP1zKJxbzjjV9PycVwCevEA==@linaro.org, AJvYcCWrnRUD+DmuS8N0bbXjBKPvBtGlXJovJi2QgbJxnw5psvE4Q3wMExI+217awUx/b+65fXE4Yfl6IW+lzDRpI7ddpAE=@linaro.org, AJvYcCX/Yk9YKLYPF+qRUQ9r/IRxHES6ufLO/TNLGzvEmsHl8dItcOl5MQm3UuACU3PQ7fTcZAUHPzu9Ziwj36UF@linaro.org
X-Gm-Message-State: AOJu0YztMrB/wCOHyv2Ops/gL+T4JGP2W1nzflV2aVQ5WrFyjBmVc4xk
	2+omgIcP80WMlH+wenEKxEFrGWW1MWGvBKUW6zByTovu6ItCQbpj
X-Gm-Gg: ASbGncvZeG/XZro/ueTOw3tr1PHbfv7XHr5/Z9nf8x9g+Fje15b7rXaEPkiRB+FaxJL
	Uk6F2BSsd4od+JPI8BO2p/W0ejlPEFrz82EbISwsDYdqOl57YUxYJp9vfrMvVAmuxnityZvRY9x
	xi7lI4OPJf6btrKuQI2Hf4w/Jc/nTSb3ER/eHbVmW3ZY77zdZqVtR0fPPxJ6eOUrO0iLH6LhrxD
	eBuXyd13+p1hC/T1d503v0ABspoH2Pb/X8qdy+BspPTxvNQV6NhU66xfuzRRnSBhjFpF/xVFeXY
	bxlJWNsX3QH5EIVct1cG4SNiBJ9GM+LdjCqG5g==
X-Google-Smtp-Source: AGHT+IHQKX6DhM37Ht0WV4SiSf/TUobWjgLJPNeO0UwuKZhXmTU4y+MYc25oI+0wuZVVoCFd6ncWIw==
X-Received: by 2002:a17:90a:c88b:b0:2fe:b016:a6ac with SMTP id 98e67ed59e1d1-309f7df179fmr16640434a91.15.1745822514802;
        Sun, 27 Apr 2025 23:41:54 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:41:54 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v3 17/20] util: Add coroutine backend for emscripten
Date: Mon, 28 Apr 2025 15:39:06 +0900
Message-ID: <006b683fd578ed6303a2dc8679094da9a7e6dfb4.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5Km8gSTzKGYD

Emscripten does not support couroutine methods currently used by QEMU but
provides a coroutine implementation called "fiber". This commit introduces a
coroutine backend using fiber. Note that fiber does not support submitting
coroutines to other threads.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS           |   1 +
 util/coroutine-wasm.c | 127 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 128 insertions(+)
 create mode 100644 util/coroutine-wasm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index dde5fd2a79..750afd44c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -633,6 +633,7 @@ M: Kohei Tokunaga <ktokunaga.mail@gmail.com>
 S: Maintained
 F: include/system/os-wasm.h
 F: os-wasm.c
+F: util/coroutine-wasm.c
 
 Alpha Machines
 --------------
diff --git a/util/coroutine-wasm.c b/util/coroutine-wasm.c
new file mode 100644
index 0000000000..cb1ec92509
--- /dev/null
+++ b/util/coroutine-wasm.c
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
2.43.0
