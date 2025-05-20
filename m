Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp476410njc;
        Tue, 20 May 2025 05:55:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9b:b0:73e:1e21:b653 with SMTP id d2e1a72fcca58-742a978e6a3mr22109902b3a.5.1747745706183;
        Tue, 20 May 2025 05:55:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745706; cv=none;
        d=google.com; s=arc-20240605;
        b=ZHfZXHc4haMjroRmfSXyZ+uBpooA76/9qlWlBZi3LEH26E1cXARRGPbxzl7mhRjeu/
         DaIvRddHrLaFUvEeHaIxVLFC4Iz4hlsJ/k1KsW2u4U5e4cVV8ez5stk+rmEbZxo/Hsj1
         Dq8nuHgqe0Lyj3yeBEmy4/wincB0nlpM/VjDgOY9BP0lrxniJy4puQwW2G8+wFRkaowI
         wZWJVLNH6SsnY6ebaqSLxMVCWzraNJD7jebeIGWuBQAntkK219f1rtUilnsWiu+ptzmG
         XRdanKBo0gx7RUeXxYV/deFLjfOCWu5DsaGe1Hs2VOnHKnRbfZzaqkI5lS7oMHy2XMfn
         udGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CBZg2rkxk5ny0INYpq4DIhkYLh/SGhQqukUB+EhzpVk=;
        fh=wujOBPsifkfeuEibogW7D5K4JbmgEQyzfwYERXUjWNc=;
        b=aNOZxGXqPpz5S9mX+5RSFlH3l9ybyVCgnrlJSIUN34d2xkfe7X2Kd2nKiXrVzlSyyb
         U7/Ov02EaxonfZ83/Mw6dpAq901RCDP5YlCzwvB3Anpk97KkDsazXrpAm5RPW54122Yf
         uGNUC06cg1S3yuSo9MUtkd7/qs0Ad7+wCzPECoGd41xI/FB8ttaY467Cis0XKjKwbesO
         /dwDgQddKwqwUjWKvRorl4jkNCm5pwtoNEa4hl+4KUKwT2F/OIOZbs20x5BIUe1PSNAL
         +gNs2YjLFqgOLUcIoQm53xflRLVpJCzmn9BD1GzsTR6fAMLz1XYpv2W2n5v1LI/cEPlT
         ywBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nMYWeCFm;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-742a973462dsor8098706b3a.1.2025.05.20.05.55.05
        (Google Transport Security);
        Tue, 20 May 2025 05:55:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nMYWeCFm;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745705; x=1748350505; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBZg2rkxk5ny0INYpq4DIhkYLh/SGhQqukUB+EhzpVk=;
        b=nMYWeCFmUSH0f+MNgZUPjEUSQW7Ntcyeh9zmvPN8h4aR/e/28OZuDn0eOQCFTvBjRr
         JUSr1K+8EB90N7Ri2Jar2lEjAlSxVuHgSUfiWVY3mJKzxYYant2H85zmsh/0yk/LGj95
         orQcejmNjHf70rXmunOkPULKUyXBnxSjKlR2lPFfzqH1fC21IXwTVARiDSNDGuONfVV4
         4tChn2jwYqPAU0Xa3CpPFyF0KLm9jiGlO4l2jPpkqnt5dGxEGgWct6MopRjbZkVxj3My
         Crr//9NOEVOJbVH2dUSjsH/OX8zwxQge8vOtPX5crhA/k/iSzkiX/fW9JQwg5mpUAFub
         gVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745705; x=1748350505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBZg2rkxk5ny0INYpq4DIhkYLh/SGhQqukUB+EhzpVk=;
        b=AGsYp+kgPGRmNFqmNBIukcK5ILmYbpystJao53mTGUnKtaQNUOGuD/biB8dZvJPhJ5
         KRNfbViIDL1e9EGsU7OKr56SMXBRb5sQDTIKt8BcWML3HAzOPTNBZOFXpWQMqPyuTa4/
         3OBQokQ7YD7EeH27yYIAQyjfeL+TK/Fzf3AT+hGJ7gNUPTd6NHrfLKKJgoYTYbKJvMcm
         CdFRLckz/V3g1Vr1DHl9ZQeflV50FzuoA3jUoMzy1weWU/By72UoVsDjPnoHQR0priYz
         u4vZOc2fxApowkNz44jKFb3nvtsc1ZjnZvBlUzLghhh2mOeRZr5LUMSXp8ZPYgRHDg4v
         YhAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGF+fNiMp4+dRfGqTNRfL70Ws9UfsIQdh12i9+iJzlzycwdO5DO5sOw/JwajE68ysgcpEIxhE=@linaro.org, AJvYcCVpUMrhkGXS/5/5F1kdC0qGTkcrc3NUvk17zzmF83WIGiBkQEVlzTzbhNjoXPN1Ut4hauPamwOlU0oxF/r0yGxxs5Y=@linaro.org, AJvYcCXzthXwkkj0SQxJowmSFOtsmOCn3kZPqFBNg9E2+IrsnuEj/1LlGh98i+5YmSKPT9hymVgA1jGMyzmUXiQC/Qh1Sw==@linaro.org
X-Gm-Message-State: AOJu0YxSVHNvOA4SWtvYBMjN669oMmO9KDHarZosMYX0CQYFs3BICbfq
	nUvTgkD1koVIljgj22blqji8i7TqJSqfOecoQ0z/jMvy3r2OcFAnfARd
X-Gm-Gg: ASbGnctLuI6sxg/wlt1msnOgElDHt8mvAtuz4MOaNhAq9+cBpY7MhBPz9VzzffGNtio
	fzl1xHaCRsUHhMQdFwBQcl/ilTHbojvWi41lCPK8ljvHOkPmKN/qCI99O0He5qe3zusy06VuFGM
	0EGweycnnEoHFYP6B6SsIqi0Ya8vzGx8JfsIFTeNmt1s+Z1bRFbpCRMRLWARXkBkEg0qDTC4lfG
	a/lLDnEOnwFe6b7pPsv/ydH2zzTy9ASkD5UIYNnCopp8nOmiVSXGSXTbximruxt+faCOGwnRfeJ
	CgwkvJ5zuGT7fY74GKDY2m3rvQXr+eiaNEv9IZFalG0civ5XO58=
X-Google-Smtp-Source: AGHT+IFVDwR9OMJl+zS8v+j14qOrqSC22HwHzudg6SLEv6QJtDFsh1QVYN472BwElteO3wpZaIh/uQ==
X-Received: by 2002:a17:90b:3905:b0:2ee:5bc9:75c3 with SMTP id 98e67ed59e1d1-30e7d501dd0mr21918201a91.5.1747745705216;
        Tue, 20 May 2025 05:55:05 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:55:04 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	WANG Xuerui <git@xen0n.name>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 30/33] tcg/wasm32: Enable instantiation of TBs executed many times
Date: Tue, 20 May 2025 21:51:32 +0900
Message-ID: <75d5017b4af1853c2924a21b406792c6154ac08e.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FJ62R2dBbEiO

This commit enables instantiations of TBs in wasm32.c. Browsers cause out of
memory error if too many Wasm instances are created so the number of
instances needs to be limited. So this commit restricts instantiation only
for TBs that are called many times.

This commit adds a counter (or its array if there are multiple threads) to
the TB. Each time a TB is executed on TCI, the counter on TB is
incremented. If it reaches to a threshold, that TB is instantiated as Wasm
via instantiate_wasm.

The total number of instances are tracked by the instances_global variable
and its max number is limited by MAX_INSTANCES. When a Wasm module is
instantiated, instances_global is incremented and the instance's function
pointer is recorded to an array of wasmInstanceInfo.

Each TB refers to the wasmInstanceInfo via wasmTBHeader's info_ptr (or its
array if there are multiple threads). This allows tcg_qemu_tb_exec to
resolve the instance function pointer from TB.

When a new instantiation risks exceeding the limit, the Wasm backend doesn't
perform the instantiation (i.e. TB continues to be executed on TCI),
instead, removal of older Wasm instances is triggered using Emscripten's
removeFunction function. Once the removal of the instance is detected via
FinalizationRegistry API[1], instances_global is decremented, which allows
instantiation of new modules again.

[1] https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/FinalizationRegistry

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32.c                | 241 +++++++++++++++++++++++++++++++++++-
 tcg/wasm32.h                |  45 +++++++
 tcg/wasm32/tcg-target.c.inc |  17 +++
 3 files changed, 299 insertions(+), 4 deletions(-)

diff --git a/tcg/wasm32.c b/tcg/wasm32.c
index e6a3dbf750..fe6f2f17da 100644
--- a/tcg/wasm32.c
+++ b/tcg/wasm32.c
@@ -26,6 +26,7 @@
 #include "tcg-has.h"
 #include <ffi.h>
 #include <emscripten.h>
+#include "wasm32.h"
 
 
 #define ctpop_tr    glue(ctpop, TCG_TARGET_REG_BITS)
@@ -45,6 +46,9 @@
 
 __thread uintptr_t tci_tb_ptr;
 
+/* TBs executed more than this value will be compiled to wasm */
+#define INSTANTIATE_NUM 1500
+
 EM_JS(int, instantiate_wasm, (int wasm_begin,
                               int wasm_size,
                               int import_vec_begin,
@@ -68,6 +72,8 @@ EM_JS(int, instantiate_wasm, (int wasm_begin,
             "helper" : helper,
     });
 
+    Module.__wasm32_tb.inst_gc_registry.register(inst, "tbinstance");
+
     return addFunction(inst.exports.start, 'ii');
 });
 
@@ -353,16 +359,44 @@ static void tci_qemu_st(CPUArchState *env, uint64_t taddr, uint64_t val,
     }
 }
 
+__thread int thread_idx;
+
+static inline int32_t get_counter_local(void *tb_ptr)
+{
+    return get_counter(tb_ptr, thread_idx);
+}
+
+static inline void set_counter_local(void *tb_ptr, int v)
+{
+    set_counter(tb_ptr, thread_idx, v);
+}
+
+static inline struct wasmInstanceInfo *get_info_local(void *tb_ptr)
+{
+    return get_info(tb_ptr, thread_idx);
+}
+
+static inline void set_info_local(void *tb_ptr, struct wasmInstanceInfo *info)
+{
+    set_info(tb_ptr, thread_idx, info);
+}
+
+__thread struct wasmContext ctx = {
+    .tb_ptr = 0,
+    .stack = NULL,
+    .do_init = 1,
+    .buf128 = NULL,
+};
+
 /* Interpret pseudo code in tb. */
 /*
  * Disable CFI checks.
  * One possible operation in the pseudo code is a call to binary code.
  * Therefore, disable CFI checks in the interpreter function
  */
-uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
-                                            const void *v_tb_ptr)
+static uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec_tci(CPUArchState *env)
 {
-    const uint32_t *tb_ptr = v_tb_ptr;
+    uint32_t *tb_ptr = get_tci_ptr(ctx.tb_ptr);
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
     uint64_t stack[(TCG_STATIC_CALL_ARGS_SIZE + TCG_STATIC_FRAME_SIZE)
                    / sizeof(uint64_t)];
@@ -384,6 +418,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         MemOpIdx oi;
         int32_t ofs;
         void *ptr;
+        int32_t counter;
 
         insn = *tb_ptr++;
         opc = extract32(insn, 0, 8);
@@ -802,20 +837,40 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_exit_tb:
             tci_args_l(insn, tb_ptr, &ptr);
+            ctx.tb_ptr = 0;
             return (uintptr_t)ptr;
 
         case INDEX_op_goto_tb:
             tci_args_l(insn, tb_ptr, &ptr);
-            tb_ptr = *(void **)ptr;
+            if (*(uint32_t **)ptr != tb_ptr) {
+                tb_ptr = *(uint32_t **)ptr;
+                ctx.tb_ptr = tb_ptr;
+                counter = get_counter_local(tb_ptr);
+                if ((counter >= 0) && (counter < INSTANTIATE_NUM)) {
+                    set_counter_local(tb_ptr, counter + 1);
+                } else {
+                    return 0; /* enter to wasm TB */
+                }
+                tb_ptr = get_tci_ptr(tb_ptr);
+            }
             break;
 
         case INDEX_op_goto_ptr:
             tci_args_r(insn, &r0);
             ptr = (void *)regs[r0];
             if (!ptr) {
+                ctx.tb_ptr = 0;
                 return 0;
             }
             tb_ptr = ptr;
+            ctx.tb_ptr = tb_ptr;
+            counter = get_counter_local(tb_ptr);
+            if ((counter >= 0) && (counter < INSTANTIATE_NUM)) {
+                set_counter_local(tb_ptr, counter + 1);
+            } else {
+                return 0; /* enter to wasm TB */
+            }
+            tb_ptr = get_tci_ptr(tb_ptr);
             break;
 
         case INDEX_op_qemu_ld:
@@ -861,3 +916,181 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 /*
  * TODO: Disassembler is not implemented
  */
+
+/*
+ * Max number of instances can exist simultaneously.
+ *
+ * If the number of instances reaches this and a new instance needs to be
+ * created, old instances are removed so that new instances can be created
+ * without hitting the browser's limit.
+ */
+#define MAX_INSTANCES 15000
+
+int instances_global;
+
+/* Avoid overwrapping of begin/end pointers */
+#define INSTANCES_BUF_MAX (MAX_INSTANCES + 1)
+
+__thread struct wasmInstanceInfo instances[INSTANCES_BUF_MAX];
+__thread int instances_begin;
+__thread int instances_end;
+
+static void add_instance(wasm_tb_func tb_func, void *tb_ptr)
+{
+    instances[instances_end].tb_func = tb_func;
+    instances[instances_end].tb_ptr = tb_ptr;
+    set_info_local(tb_ptr, &(instances[instances_end]));
+    instances_end  = (instances_end + 1) % INSTANCES_BUF_MAX;
+
+    qatomic_inc(&instances_global);
+}
+
+__thread int instance_pending_gc;
+__thread int instance_done_gc;
+
+static void remove_old_instances(void)
+{
+    int num;
+    if (instance_pending_gc > 0) {
+        return;
+    }
+    if (instances_begin <= instances_end) {
+        num = instances_end - instances_begin;
+    } else {
+        num = instances_end + (INSTANCES_BUF_MAX - instances_begin);
+    }
+    /* removes the half of the oldest instances in the buffer */
+    num /= 2;
+    for (int i = 0; i < num; i++) {
+        EM_ASM({ removeFunction($0); }, instances[instances_begin].tb_func);
+        instances[instances_begin].tb_ptr = NULL;
+        instances_begin = (instances_begin + 1) % INSTANCES_BUF_MAX;
+    }
+    instance_pending_gc += num;
+}
+
+static bool can_add_instance(void)
+{
+    return qatomic_read(&instances_global) < MAX_INSTANCES;
+}
+
+static wasm_tb_func get_instance_from_tb(void *tb_ptr)
+{
+    struct wasmInstanceInfo *elm = get_info_local(tb_ptr);
+    if (elm == NULL) {
+        return NULL;
+    }
+    if (elm->tb_ptr != tb_ptr) {
+        /*
+         * This TB was instantiated but has been removed. Set counter to the
+         * max value so that this will be instantiated again at the next
+         * invocation.
+         */
+        set_counter_local(tb_ptr, INSTANTIATE_NUM);
+        set_info_local(tb_ptr, NULL);
+        return NULL;
+    }
+    return elm->tb_func;
+}
+
+static void check_instance_garbage_collected(void)
+{
+    if (instance_done_gc > 0) {
+        qatomic_sub(&instances_global, instance_done_gc);
+        instance_pending_gc -= instance_done_gc;
+        instance_done_gc = 0;
+    }
+}
+
+EM_JS(void, init_wasm32_js, (int instance_done_gc_ptr),
+{
+    Module.__wasm32_tb = {
+        inst_gc_registry: new FinalizationRegistry((i) => {
+            if (i == "tbinstance") {
+                const memory_v = new DataView(HEAP8.buffer);
+                let v = memory_v.getInt32(instance_done_gc_ptr, true);
+                memory_v.setInt32(instance_done_gc_ptr, v + 1, true);
+            }
+        })
+    };
+});
+
+#define MAX_EXEC_NUM 50000
+__thread int exec_cnt = MAX_EXEC_NUM;
+static inline void trysleep(void)
+{
+    /*
+     * Even during running TBs continuously, try to return the control
+     * to the browser periodically and allow browsers doing tasks.
+     */
+    if (--exec_cnt == 0) {
+        if (!can_add_instance()) {
+            emscripten_sleep(0);
+            check_instance_garbage_collected();
+        }
+        exec_cnt = MAX_EXEC_NUM;
+    }
+}
+
+int thread_idx_max;
+
+static void init_wasm32(void)
+{
+    thread_idx = qatomic_fetch_inc(&thread_idx_max);
+    ctx.stack = g_malloc(TCG_STATIC_CALL_ARGS_SIZE + TCG_STATIC_FRAME_SIZE);
+    ctx.buf128 = g_malloc(16);
+    ctx.tci_tb_ptr = (uint32_t *)&tci_tb_ptr;
+    init_wasm32_js((int)&instance_done_gc);
+}
+
+__thread bool initdone;
+
+uintptr_t tcg_qemu_tb_exec(CPUArchState *env, const void *v_tb_ptr)
+{
+    if (!initdone) {
+        init_wasm32();
+        initdone = true;
+    }
+    ctx.env = env;
+    ctx.tb_ptr = (void *)v_tb_ptr;
+    while (true) {
+        trysleep();
+        struct wasmTBHeader *header = (struct wasmTBHeader *)ctx.tb_ptr;
+        int32_t counter = get_counter_local(header);
+        uint32_t res;
+        wasm_tb_func tb_func = get_instance_from_tb(ctx.tb_ptr);
+        if (tb_func) {
+            /*
+             * call the instance if available
+             */
+            res = call_wasm_tb(tb_func, &ctx);
+        } else if (counter < INSTANTIATE_NUM) {
+            /*
+             * run it on TCI if the counter value is small
+             */
+            set_counter_local(ctx.tb_ptr, counter + 1);
+            res = tcg_qemu_tb_exec_tci(env);
+        } else if (!can_add_instance()) {
+            /*
+             * too many instances has been created, try removing older
+             * instances and keep running this TB on TCI
+             */
+            remove_old_instances();
+            check_instance_garbage_collected();
+            res = tcg_qemu_tb_exec_tci(env);
+        } else {
+            /*
+             * instantiate and run TB as Wasm
+             */
+            tb_func = (wasm_tb_func)instantiate_wasm((int)header->wasm_ptr,
+                                                     header->wasm_size,
+                                                     (int)header->import_ptr,
+                                                     header->import_size);
+            add_instance(tb_func, ctx.tb_ptr);
+            res = call_wasm_tb(tb_func, &ctx);
+        }
+        if (!ctx.tb_ptr) {
+            return res;
+        }
+    }
+}
diff --git a/tcg/wasm32.h b/tcg/wasm32.h
index f2749f1e0e..9a3230e87c 100644
--- a/tcg/wasm32.h
+++ b/tcg/wasm32.h
@@ -48,6 +48,14 @@ static inline int32_t call_wasm_tb(wasm_tb_func f, struct wasmContext *ctx)
     return f(ctx);
 }
 
+/*
+ * wasmInstanceInfo holds the relationship between TB and Wasm instance.
+ */
+struct wasmInstanceInfo {
+    void *tb_ptr;
+    wasm_tb_func tb_func;
+};
+
 /*
  * TB of wasm backend starts from a header which stores pointers for each data
  * stored in the following region in the TB.
@@ -69,6 +77,43 @@ struct wasmTBHeader {
      */
     void *import_ptr;
     int import_size;
+
+    /*
+     * Counter holds how many times the TB is executed before instantiation
+     * for each thread.
+     */
+    int32_t *counter_ptr;
+
+    /*
+     * Pointer to the instance information on each thread.
+     */
+    struct wasmInstanceInfo **info_ptr;
 };
 
+static inline uint32_t *get_tci_ptr(void *tb_ptr)
+{
+    return (uint32_t *)(((struct wasmTBHeader *)tb_ptr)->tci_ptr);
+}
+
+static inline int32_t get_counter(void *tb_ptr, int idx)
+{
+    return ((struct wasmTBHeader *)tb_ptr)->counter_ptr[idx];
+}
+
+static inline void set_counter(void *tb_ptr, int idx, int v)
+{
+    ((struct wasmTBHeader *)tb_ptr)->counter_ptr[idx] = v;
+}
+
+static inline struct wasmInstanceInfo *get_info(void *tb_ptr, int idx)
+{
+    return ((struct wasmTBHeader *)tb_ptr)->info_ptr[idx];
+}
+
+static inline void set_info(void *tb_ptr, int idx,
+                            struct wasmInstanceInfo *info)
+{
+    ((struct wasmTBHeader *)tb_ptr)->info_ptr[idx] = info;
+}
+
 #endif
diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index 04cd9b6e4a..f0c51a5d3d 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -27,6 +27,11 @@
 
 #include "../wasm32.h"
 
+/*
+ * This is included to get the max number of threads via tcg_max_ctxs.
+ */
+#include "../tcg-internal.h"
+
 /* Used for function call generation. */
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_STACK_ALIGN          8
@@ -3654,6 +3659,18 @@ static void tcg_out_tb_start(TCGContext *s)
     h = (struct wasmTBHeader *)(s->code_ptr);
     s->code_ptr += sizeof(struct wasmTBHeader);
 
+    /* locate counters */
+    h->counter_ptr = (int32_t *)s->code_ptr;
+    size = tcg_max_ctxs * sizeof(int32_t);
+    memset(s->code_ptr, 0, size);
+    s->code_ptr += size;
+
+    /* locate instance information */
+    h->info_ptr = (struct wasmInstanceInfo **)s->code_ptr;
+    size = tcg_max_ctxs * sizeof(void *);
+    memset(s->code_ptr, 0, size);
+    s->code_ptr += size;
+
     /* Followed by TCI code */
     h->tci_ptr = s->code_ptr;
 
-- 
2.43.0
