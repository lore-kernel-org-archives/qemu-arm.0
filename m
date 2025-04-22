Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2137119njd;
        Mon, 21 Apr 2025 22:30:14 -0700 (PDT)
X-Received: by 2002:a17:902:d491:b0:220:cb1a:da5 with SMTP id d9443c01a7336-22c536014bbmr223824535ad.40.1745299814367;
        Mon, 21 Apr 2025 22:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299814; cv=none;
        d=google.com; s=arc-20240605;
        b=jBr2aroBLbmhpUVn2O3SqFt+drr1kRJo8lCu586AQPLCyImeGhCMimrqHRu5KwYI1o
         CAeGLFpQjM4PhhX0REagZbfg5Q7+hDQlbKUgbf/5+OAGbepJqb4krJdIC3NBF0NhGfb3
         DqRi/LorGUXS1wiTXPmULvL146IJ2KFh6d6BTF9P/tu+Eg/NsO0bq1p364uYdpSKxVGe
         hkMn/hEcGdofTkrkBUrqMiQkSzuTWpJAMHWdfhJ165ldfdBxeJct5xlyNPCfsuI+Eoe4
         M7B7452tqG53taRPuR76lAktx87KO7f2wG9v9I+0gBKt1NgOK4PwnBhxwias9m5+Zi9W
         xT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OZJBhCTsN3O6Lx1qPX+scfds1YZkk4ZSjoc7nql2Rf8=;
        fh=9Sq5G8pfIUS+T4yWSHazEHbktC3O3MWW0jKJGB6oKFE=;
        b=h2NU5JRvt8zpMjElDB3kL+F6WCqha7lA6nLkDqPzrSuBnNvinWhJMuvJ1hjVNf5Cvj
         JXD/HjaLPhxT437XtNS18DHjRW8PTtB3iPMfmJSTm1m8ruDskUI8ulPW9+USY/K3wvXV
         c8yYxJiishBaCQ+U/WWHaHFIuShiVggaOL/37vF001Lq44EhNiZyjFO8WFMUGy/KOqDY
         WYx6ExsXeOv7ylRaWOcoIIhYV/kjWljjlph9oDrSU7040uvDyVVy7JlHxCEM1b2/DUeO
         0VZ4rWnzGhpyX2rmNHH+64Q+WJawUYoy9PAUVytx25HhEs16ldAlRkZmT7ejDk7U6I94
         vFfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=aCJ6DJEg;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50d5f682sor52517695ad.12.2025.04.21.22.30.14
        (Google Transport Security);
        Mon, 21 Apr 2025 22:30:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=aCJ6DJEg;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299814; x=1745904614; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZJBhCTsN3O6Lx1qPX+scfds1YZkk4ZSjoc7nql2Rf8=;
        b=aCJ6DJEg0U1oumiu5pFpRL5evyGiu5iXOoIv75WkZmwFL3gnTK8ll1cziclmSLXmSk
         XvHuAxPAr6MEUpglaETg5X4Or4PBjBZf2e6PrbXlIdc8vbY7VJsnxQq3CbZ1ewAgSylR
         y0EFO81HjAIagaJZJ6wAxTWdbEkbSDnpjMEU7h/59CV4+A4lzS+78pHSeVjdSOpSsB3t
         M/+4SGGcog1RHVMGcI/iQS7/OaRlnOgQn4Rs5QDBQ487UMrUOOwL+ejECZWHHel3RfA8
         P7JoIpV3wH56p/6vAlyMz4BsZwnT1zeb0t17qNBoM5ESuVk8h6udm7VrKn4UTfYbw5Iz
         Rcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299814; x=1745904614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZJBhCTsN3O6Lx1qPX+scfds1YZkk4ZSjoc7nql2Rf8=;
        b=XxRDDTw0pBFKlIHoCrMI0afX1q1GNDKmetHEKyy9knxWGIBjLqKa3FF1lgI8JRDid8
         3BoE967rqNPsnpGawSZuZCGVMEInWc1+7qfy9p2XMM7H9PPJVPTAxUoYkJu47BzWMjpH
         FrQdvtOB49SJVrCiqWKMVTY+wNDTMZcUm6I2fu9NAfEm6fyu/0fN0AnzfK4EFrAu6FWZ
         a2C9idQTFmM8Ij9MZ2Xmzl7L8dq9F2ioTU2uJ5sR8iLPsl30+GW/9NwlpAtd55Pdw01S
         QILDTut5UY6XyUBS7M/nPSFMpJ32nBX71de8p/FxZIHHkS3D3RagzYj/3BsaeAaROuno
         4dOw==
X-Forwarded-Encrypted: i=1; AJvYcCUvDEvFGnW/xdJY7Ul71WimgZVHxMyHSkDX6a5EXKpnvxbcT/x98DpRKYZ7smmxnoZNK8cOj4VQkbbEVVSnOVL1lPU=@linaro.org, AJvYcCWWU9XjIceVGVcbDwIAcWZ7r8YvZRtOVreGgC3+/UndYjUcu3oPWDDfDosMRvSiQZeklNQaRXck@linaro.org, AJvYcCWtYwP6HY+TGMVfIRW4levRn1ZG7m62RPjLRMRtImzPHqz02WNernfvFEFd/y+MdB8EsRU2N7AVe+fjDSvk@linaro.org, AJvYcCXQc55QHyJZE4uUt3+TdwkCmChT7gAgZ048rxTWrPqRMSudC5KtJBjWS74SdCIAsn0z3XkyXcqpBJO5UT9Pf+FiwQ==@linaro.org
X-Gm-Message-State: AOJu0YyCP1q5TFj3ED39IjMTrv3N7wSGD8ImwcmI45tVzuH83ESn2rcw
	BknhKhO8lajL46GxVtOzgGfr4X/ps3Jh+faOtZoU4N7VU0n68wPZ
X-Gm-Gg: ASbGnctdfTxOcR2wKO/OOQheMHU3XyM0WBTp/bxLOhvVAnwzVthJERyhPCj1zUQD/Qm
	B1T6xku2X7D5c98EB6nMNXk1eGMNY9uxCS/eQpH9qmER4+QI6Jq1zuSt9s2kt5eR2nLDLFGrM/V
	PWOsoHqBeQqX1zilV+chqxY48fPSxQ3WRNgwwRFZpebiMWtb0WGB8W+d/Ls6PtpSipt7EcbqsPg
	1EVYGpcZnxisOy0MxQ+GeAejk6ISewf57z2QcU1bPZvt12Tg10i8bIjgB1V60JIMJv7W2J50uqx
	8kNx5QodwAXPYGCd2it3mo6kVYIgxhTJMKi/n/TZYGV5Li+ETDOyjjScme8=
X-Google-Smtp-Source: AGHT+IFSt/tJV0CpnE6V2hLouTHQ6ku88AMsbKVeVRMXeP3Flg699MixtrSFkbPBDLaSqOsNQluUDg==
X-Received: by 2002:a17:902:ebc3:b0:220:e63c:5aff with SMTP id d9443c01a7336-22c5361b3e7mr198582405ad.47.1745299813562;
        Mon, 21 Apr 2025 22:30:13 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:30:12 -0700 (PDT)
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
Subject: [PATCH v2 17/20] util: Add coroutine backend for emscripten
Date: Tue, 22 Apr 2025 14:27:21 +0900
Message-Id: <82afa4d287a16f89fa59f08cba14fb06e017ea83.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 3ScCg12Ad4W6

Emscripten does not support couroutine methods currently used by QEMU but
provides a coroutine implementation called "fiber". This commit introduces a
coroutine backend using fiber. Note that fiber does not support submitting
coroutines to other threads.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 MAINTAINERS           |   1 +
 util/coroutine-wasm.c | 127 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 128 insertions(+)
 create mode 100644 util/coroutine-wasm.c

V2:
- Split the MAINTAINERS file change that adds coroutine-wasm.c from the
  previous 19th patch into this commit.

diff --git a/MAINTAINERS b/MAINTAINERS
index c7a20ac8d7..72319f804e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -624,6 +624,7 @@ M: Kohei Tokunaga <ktokunaga.mail@gmail.com>
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
2.25.1
