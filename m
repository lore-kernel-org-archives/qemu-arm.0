Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3179507njc;
        Wed, 16 Apr 2025 01:17:07 -0700 (PDT)
X-Received: by 2002:a17:902:ce07:b0:225:abd2:5e4b with SMTP id d9443c01a7336-22c358d8797mr17958265ad.16.1744791427565;
        Wed, 16 Apr 2025 01:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791427; cv=none;
        d=google.com; s=arc-20240605;
        b=lBgAWf4HRsXpifOdmpiy9u/Qh3XkSgIv3LN8CMrXMsG7msR0QZiutAOrzPlM1exNgk
         VYwbMp2V7BnJfqRzHgvC4h8qhYwO6Pg25RuIqbsb3WrUFwP5f9ITxdF+kxBRWbGzIoML
         q7MVJ0qy0QqOWV/hKH88prCo0nXDfOLtJhspdX/Th3sd+iu9p2d/kQ6ZvhNsqQs0h425
         jj5bWU7dET6b7jDYBJdpa0vAGm0lo6Wj9L3Ia3WuJTlTrHtLhYK3WWhDuPLx0sB5ATyT
         3UEX88NTsC51cwMYaZ0Ifsw8IatC+2xiWkHw5ZBP7ulMarDzvjbdxkn+9KLDIAIt88GV
         Ywtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oIbAMZeonD1y/THuAvolLW7txmOpN+fF9GLLZzGqdZQ=;
        fh=6ouVVukN59WsU7XMaRzlvKnhQG6/yNsHXSqR+UFe5qE=;
        b=NmsWPbzpS9sy+KBZHasM1BMjB+0MS37OK3LzfvNb4faIFSC5hxStWUpspWmlJOYokj
         6WT1sfKYmh7SDSHsCzYvsZog442taoitP6BAU0GOf9DKhDc5SXgJXTqmXecjN1El7ca3
         /jsQN+myWC0gUWmOEVTHDtdxnUBdp6FbyiXJiABpYDDaGVyYZ1HY38YDmV78u89Ffb3L
         /Em8WIjLgOjtZaX6LwXJox+QR4bSGS8GL8+NARsu5KyJMtDqQViBWOo6A1FcdbpZwsTB
         Ju+9hetz0nXDK/niL0XTQP4XmIZdOku9Z7+sa49N86cS6AbvTS833Oxt/5C/G/vlwiz3
         r/uQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=abntXV+y;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22ac7b867d6sor92642855ad.7.2025.04.16.01.17.07
        (Google Transport Security);
        Wed, 16 Apr 2025 01:17:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=abntXV+y;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791427; x=1745396227; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIbAMZeonD1y/THuAvolLW7txmOpN+fF9GLLZzGqdZQ=;
        b=abntXV+yvdq6niMVY+gYGRV6mPqu67zh9E3Rpi4nxmrksGSuBg2WHatg/iaI6liy9r
         SNBwRSFkjK0aFnYjZP6a8CCdHVZH1eZh8KKJiCMu1Svy0/Zoj+bNvJMTK+oHU6/lwJnD
         q+mtgum6xWzcXpC4G3QjrPENFHONXCvtmLn09TMY6cxBXKd2vmw225cfabB51bNcCjeL
         zM9CV9aMXYV1pKMlq/Nwp924+kPlWKMMieEefz4Yxk/3l49U3FUkvScWWUIhkr+tE5FI
         4hYkuCmbTcJNkGplrkZXQfSbBeoVSnQ32h18cVZmR7W0AfvAO02M/LkQigM1Tsr9kGrq
         RTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791427; x=1745396227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIbAMZeonD1y/THuAvolLW7txmOpN+fF9GLLZzGqdZQ=;
        b=TFQSS2vFwVSw7//UlIHnboXvHiX+LP8KGiiChlMz+7YD46svWGhMn6SJEwYyMFRXJB
         OaZoJLmDrvgtN4TSnmw2AQTfo5vDg3zHNpZWLRkgcB+SGNllHgamEZNh47jdNeIl9Agh
         xJyqNsmNw0wB6IDMfsH29Ahw/m328KUS8aF0fDhmxnVkiNf6SAOfoSQzskV19uBrOZOM
         U0wjSU3Sui9speL7c3i8XVkrExFmMu6tyEKTdRcivRfRYMZxkK6FK4MhdnFm1V1ayp+7
         CICHi7hMsYCwHRXJORDcLiFhr5QE3tDwnqw5rVlrmOyvwOL2yZmWLUStKHRE3VKBL3IE
         fFmg==
X-Forwarded-Encrypted: i=1; AJvYcCUoE63ML2HNCVJv5jjRi3/xZ5/yz3OCvkyH4l3h609PXsh58UlfsBhaL3/cbs526mdW7VQgrtdtcukMw0RMm3sRcpo=@linaro.org, AJvYcCUopzqvtmEoTOK7Niayf7R7J6HqRlfGdKlA4rEWTdC5ronz1mhddV3IcOj8JPZ8x8+zmZwwOxcOFVaaTshd@linaro.org, AJvYcCVBjRc5STa6YvjlviGM52dURztRmKBqbIEUCsjONCBC0SaCFuhlJPwyCo2JbpiznQs6gKL4KmDQ@linaro.org, AJvYcCX5f4X3FTj94dJmfUcO0KJ1i0BkUrn47fPF0ggOAK+xElsVEmeTJB+E0ewxhtcYnmgFcbS0Cv0CyBG+olN/Q6a2IQ==@linaro.org
X-Gm-Message-State: AOJu0Ywhg/DzEIRGyzW8eJeBwBT123o22qF6nEnilKBI3WmrxDvvu+Zs
	ZI0K5Q0asfU3LfRDpUwOaBw/uCKKSn+yXJlUAcC45Dwj65le7REM
X-Gm-Gg: ASbGncsG2W6toff+tjKbrzenwREZN+y94smLISyGl+pHiS98c8izL8ccQ+ThmWDPxlR
	UvYp31Q3IKecX6dWL9sLsleo4lK8P3oV6/F39Y2c+mruYxkDneFjzAqsYrN1q1Ychiggdx0dGnc
	WBmAwj7/LvJLKDhu/uyElitVEzKIOjmtqguGiDQoJ2ztwJHE6TtwA1Jcf9v0wxXcoBe1SgleHct
	kKW2/AyyZQMDYJcnQJqXdhhvb9Y+RS5bUUCNSbYN4/HKDZSch7Fgbv9DI+5IHJ3n4cnlp976XOz
	Njc67hZD+I+m4n1MIZ5nuYTbIpJVqx8d3Q5NHYrRhuVaYbsiBrzTLlNyIg==
X-Google-Smtp-Source: AGHT+IFYdhSnB9zITJ1aITjDAOjnlnlic7rRWk+WIB51c/0DcssgTKezLLv7xrxaBupxkzncoPYm3w==
X-Received: by 2002:a17:902:ef01:b0:223:517c:bfa1 with SMTP id d9443c01a7336-22c3597ec25mr17871905ad.38.1744791426992;
        Wed, 16 Apr 2025 01:17:06 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:17:06 -0700 (PDT)
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
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 16/19] util: Add coroutine backend for emscripten
Date: Wed, 16 Apr 2025 17:14:21 +0900
Message-Id: <f89c3ddfcb3d1fe04781ac1b1ed94f3feec8601d.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: IcB3MXFl8I9n

Emscripten does not support couroutine methods currently used by QEMU but
provides a coroutine implementation called "fiber". This commit introduces a
coroutine backend using fiber. Note that fiber does not support submitting
coroutines to other threads.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 util/coroutine-wasm.c | 127 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 util/coroutine-wasm.c

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
2.25.1
