Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986F0C9830D
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 13:24:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9Mxj-0000HT-25; Wed, 23 Sep 2026 09:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mt8-00015g-U2
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:20:00 -0400
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mt5-00077F-OL
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:19:54 -0400
Received: by mail-dy2-x10.google.com with SMTP id
 5a478bee46e88-328664c2da6so545088eec.1
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 06:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169590; x=1790774390; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kG8T0B41yOsfKs7+mPQWY4VwYoc5DWh5xeT8YOfa6ig=;
 b=Rf+Yvq5nO4FU9KCawZnU1bXk+W2sDuvRonTLklOJPhlu2FuHmCP+r2uM/IQoD3iLiX
 ivx5jk2oJC1eabEg7QFKaZCnaceZLuzx2XMICjp0yZ64tBH+U4YnBlKOj0tBzxmtho7c
 i9dH1ZN+4FJXV58dOxW9mMm/DjOKJNh2R+6XyL/x0N3IBGaFiymTUhpIfV+Urk1Xu0sI
 yiZT6JTW7jOG/cuC2Wzn+9WTa5LGd+W8+7WqwYhOgA5oRUHzJgj3V3tNtgHsf6gwuNSN
 svEjsxPHwvBvSEmLnhjMMs/1xyoRvUs3M93Ng8FBXo8P43894feI7ONvEpaR2R3WMSOu
 JL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169590; x=1790774390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kG8T0B41yOsfKs7+mPQWY4VwYoc5DWh5xeT8YOfa6ig=;
 b=IbzhUAI7CRapm+1JjsCFxALgR2wvdiwKMzbhJW+dc1jPJTt69+EKdq8O9PyWGRcHfs
 6irVDjcEcSUeUBymr5KngPKjUDPjWmq5xGhevIHccyX9TwSV9V9e3S4dY88SzHr0dA4R
 GRoPxFWWuXHOpJbG4fRvIEEt6lGUzgeWfYyzwokHYvYC9ICGZeMT2R2q1Snq7y/ra0yu
 0bM2fR3xFuKhZi4K7pgCg7Uy6aXPWmNyas01NQo9K7uAu5NFVEazrEleYg8axQ+lFv/q
 miCJ9VSpVN8a2U3bc7qI9njz8zcpxzusfQIZTOupcW2JKTvcDPcsW/AXX0e2gfrhVRYa
 k2ag==
X-Forwarded-Encrypted: i=1;
 AKwUvBzy1DdENQZn9hLHRcDdWOcHH8L7+yLFFIWLWccMRt+ZdhS7uO24gHG0EeeMekEbTkBLokDl7gWv+A==@nongnu.org
X-Gm-Message-State: AFuF++l0thH0ScRACQ80lIJLelx5CzMY04/fFOlGtzUH2CLvWFMowa/D
 eUFcMJrcNSqAjQ+Lq+nnPF5vE2rHxk+e6YFEkddbLB2lm0ZYxAQCNtTY
X-Gm-Gg: AYBFou3xALsxj95r4Y9L1hJk1wrF1DzrPeTFFGSFtuk7+KcjVntF1LiGZY5LTm5MZGr
 9JXzIYMzE74j6bhQVrZVS2l/YIFXpqcBRCP9b+sBcLHTRsYV4erS/eloG5jSQbH4CKzeXuF/JEw
 nUpZN84RRI5TAjyKAW0Kp6wJCrFO82Mi97EN6LBlKUh4VvlyHehgn6IzGpOF59w58grC6qSYhJw
 Aej9jLiuukP4Pko7MqmFWexrSHiM3qwjaN0nYDzf4OSZyBRqW4Up8CQO0MjRyoBKhDij70G39jE
 FXfdFNtpZyR6vOExcMAAjZbZh3YqV+C2A2n0AG3EQzS2Hw6UlkFH1ZnNDoSClxsvYZrlnBEvMzc
 0mV1mCnEnq3SDB5xeXPCS84gYzrvZuswaMbxewTk+6kjjMWvz7g1L1afDU3wayBiux18aetqceB
 GJsBB6fUq9z+5HqhtapgRLsdqNayva97gpdjhXDPIFmN3Ij6hMh3zP4PJDujmtV9uTwPoBmF6iu
 aUHPjZDV1YCxFQiCKmeUcBBWWkhX+s=
X-Received: by 2002:a05:693c:87ce:20b0:33e:5cb6:249e with SMTP id
 5a478bee46e88-33e8ddc761cmr2337090eec.39.1790169589850; 
 Wed, 23 Sep 2026 06:19:49 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:19:44 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 017/114] module: add before/after hooks and
 module_call_init_fn
Date: Wed, 23 Sep 2026 21:14:51 +0800
Message-ID: <20260923131635.1894-18-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x10.google.com
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

module_call_init just walks the list. Add register_module_hooks
so one init type can wrap that walk with before and after
ModuleInitHook callbacks, and add module_call_init_fn so a single
function takes the same path.

module_call_init passes MODULE_INIT_PHASE_ON. A DSO or
module_call_init_fn passes DSO_BEFORE until module_call_init
finishes, then DSO_AFTER.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/module.h | 18 +++++++++++
 util/module.c         | 70 ++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 84 insertions(+), 4 deletions(-)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 34e05c75348..c10e32731fa 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -60,6 +60,20 @@ typedef enum {
 
 typedef void (ModuleInitFn)(void);
 
+/*
+ * Where one module_init_run sits relative to module_call_init().
+ * DSO_BEFORE: a DSO or module_call_init_fn before module_call_init().
+ * ON: module_call_init() itself.
+ * DSO_AFTER: a DSO or module_call_init_fn after module_call_init().
+ */
+typedef enum ModuleInitPhase {
+    MODULE_INIT_PHASE_DSO_BEFORE,
+    MODULE_INIT_PHASE_ON,
+    MODULE_INIT_PHASE_DSO_AFTER,
+} ModuleInitPhase;
+
+typedef bool (ModuleInitHook)(ModuleInitPhase phase, Error **errp);
+
 typedef struct ModuleEntry {
     ModuleInitFn *init;
     QTAILQ_ENTRY(ModuleEntry) node;
@@ -82,6 +96,10 @@ void register_module_init(ModuleEntry *e, module_init_type type);
 void register_dso_module_init(ModuleEntry *e, module_init_type type);
 
 void module_call_init(module_init_type type);
+void module_call_init_fn(module_init_type type, ModuleInitFn *init, Error **errp);
+
+void register_module_hooks(module_init_type type,
+                           ModuleInitHook *before, ModuleInitHook *after);
 
 /*
  * module_load: attempt to load a module from a set of directories
diff --git a/util/module.c b/util/module.c
index 6c5980542f6..a007ecb53a6 100644
--- a/util/module.c
+++ b/util/module.c
@@ -32,6 +32,8 @@ typedef QTAILQ_HEAD(, ModuleEntry) ModuleEntryList;
 typedef struct ModuleInit
 {
     module_init_type type;
+    ModuleInitHook *before;
+    ModuleInitHook *after;
     ModuleEntryList list;
     ModuleEntryList dso_list;
     bool done;
@@ -88,14 +90,54 @@ void register_dso_module_init(ModuleEntry *e, module_init_type type)
     module_init_add(&find_type(type)->dso_list, e);
 }
 
-static void module_init_run(ModuleInit *m, ModuleEntryList *list)
+/**
+ * register_module_hooks:
+ * @type: init list
+ * @before: runs before every registered init for @type
+ * @after: runs after every registered init for @type
+ *
+ * One ModuleInit holds both callbacks so before and after stay 1:1.
+ * module_call_init(@type) passes MODULE_INIT_PHASE_ON. A DSO or
+ * module_call_init_fn passes DSO_BEFORE if module_call_init() has not
+ * finished, otherwise DSO_AFTER.
+ */
+void register_module_hooks(module_init_type type,
+                           ModuleInitHook *before, ModuleInitHook *after)
+{
+    ModuleInit *m = find_type(type);
+
+    g_assert(before);
+    g_assert(after);
+    g_assert(!m->before && !m->after);
+
+    m->before = before;
+    m->after = after;
+}
+
+static bool module_init_run(ModuleInit *m, ModuleEntryList *list, bool is_dso,
+                            Error **errp)
 {
     ModuleEntry *e;
+    ModuleInitPhase phase;
+
+    if (!is_dso) {
+        phase = MODULE_INIT_PHASE_ON;
+    } else if (m->done) {
+        phase = MODULE_INIT_PHASE_DSO_AFTER;
+    } else {
+        phase = MODULE_INIT_PHASE_DSO_BEFORE;
+    }
 
-    (void)m;
+    if (m->before && !m->before(phase, errp)) {
+        return false;
+    }
     QTAILQ_FOREACH(e, list, node) {
         e->init();
     }
+    if (m->after && !m->after(phase, errp)) {
+        return false;
+    }
+    return true;
 }
 
 void module_call_init(module_init_type type)
@@ -106,10 +148,27 @@ void module_call_init(module_init_type type)
         return;
     }
 
-    module_init_run(m, &m->list);
+    module_init_run(m, &m->list, false, &error_abort);
     m->done = true;
 }
 
+/*
+ * Run a single init through @type's before/after hooks with is_dso=true.
+ * May run before or after module_call_init.
+ */
+void module_call_init_fn(module_init_type type, ModuleInitFn *init, Error **errp)
+{
+    ModuleInit *m = find_type(type);
+    ModuleEntry e = {
+        .init = init,
+    };
+    ModuleEntryList list;
+
+    QTAILQ_INIT(&list);
+    QTAILQ_INSERT_TAIL(&list, &e, node);
+    module_init_run(m, &list, true, errp);
+}
+
 #ifdef CONFIG_MODULES
 
 static const QemuModinfo module_info_stub[] = { {
@@ -201,7 +260,10 @@ static bool module_load_dso(const char *fname, bool export_symbols,
             continue;
         }
 
-        module_init_run(m, &m->dso_list);
+        if (!module_init_run(m, &m->dso_list, true, errp)) {
+            empty_dso_lists();
+            return false;
+        }
     }
     trace_module_load_module(fname);
     empty_dso_lists();
-- 
2.52.0.windows.1


