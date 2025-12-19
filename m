Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F93FE66884
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Dec 2025 19:10:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWfr1-0000m9-1d; Fri, 19 Dec 2025 14:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vWfqY-0000cs-TV
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 14:09:03 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vWfqV-0006qr-Pk
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 14:09:02 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42e2d02a3c9so1358982f8f.3
 for <qemu-arm@nongnu.org>; Fri, 19 Dec 2025 11:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766171338; x=1766776138; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LdWAJH6s7XticPUwO+/xRlCKqNuhKhU8yKqVINAJxXA=;
 b=tuu/WSM336t7Mt4jWRUeiWgT92BVkUk18CbPkiuTrkkAfhsa8SVuBX2UX3yT75/AU5
 o5+ShVok1vHA/069XTCrhOaBzMNHbJES+iZnhnfK26IuYqWOBy8WL0ZmFauGDMmFMhtN
 HDuMhhNP0BdAJBHOexch4JeZhZkD4VQaOnkbdvVtf3kZ9YqtEyjhh8B13SybiRgVp3FD
 QD68MKo5dMn3hrjMqsz2EFz2xVV3bGRKEESjzrUBR4tr+q+5EdaRHV/x2DFVEgj63gLn
 pZdB+8wFknRUf2X4q7vMgvaoqDndG0r6uBviOmwH5ko+lIMPvfi7R+vsv46JdtRWXwk6
 Ddjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766171338; x=1766776138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LdWAJH6s7XticPUwO+/xRlCKqNuhKhU8yKqVINAJxXA=;
 b=fr0Rw391DlKDVHOt/t+44iT7jHCAn+368FQIPauCif+Ci4i4/WTYEtsYyX4Pv30hpb
 JxUIIqRoXWpU4mVNV7/1WOJ/1nAy5ipUMO61HdQoATCkfW2MdL1fKjvkeQUtFud2JTk0
 aKELY9uY5vzPSq2anDuTP368PPXzv3BsEuuiT3LwOgnUWCcsQpluWYIXYxHPlFRXG7zV
 kjlM0wOmKyLo6jJMwG1Y//jwbWDA5TsJaxRhLsxmhCw1g6xJeZbfAdHQzqfqrlzMUyUo
 7jvkQm3pqcwAAwp2l4jRwZ0XyF4/aSswZA6DnelF2lOdIHFB+kuNiHkke8efG4GM8Kc6
 YUZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuhrxlpvGCS9dYmRGO/Oqy6eJ/SLhXUbx5j9ymXs8l6YTvKkkJu1rrbBbueyVE4nDtFDTOf3vG1g==@nongnu.org
X-Gm-Message-State: AOJu0Ywo2kyaIXELveQuAHyQk504eIzrsRBzDohfKtG1lAXR8nmr54rC
 4zU5oYbatUvEwsHXH3jexI67QCU9HP3iGaBwaNUyae9n+ctX7uSYWe/vgnkw21f1uiA=
X-Gm-Gg: AY/fxX45JF/dQHV3IqiFBCm9dLuD+fypWGoSIudAbTjNpM1RO8KwMcbwv07a+y6sAws
 oMTV2ag11UvujhAEUh2VuLxsYOD7DrufMgwzEaTKDMjKWMOF32t+l41ERlyOaYkLWfjWJfBMAEo
 7QrV1Rl+t52239c3wJFtw2ANDquuLtFB/12+YPRPj9ffUT4g65x5TkX4+6r3N8HlP94LufH6dLt
 Rvwz9v6QIp/F/sr4B2hf2W7GxuLBFmLLloacjmn+7D4UxkcWYPXs+sOqFttwT36BH9Hb7/3v0da
 29QCdGYhSAtfhkATtX0VmtT61j45hUWvhqGa0xLHiqBR6DvzrWtSjHfG+K3LS/uDwgoPJSbla0+
 5ldUsGneC+rQOX9UGyc941wWqHamcgnu5sCI3PYguH+WCeeFqDQ2KyuP9fPaV/rug5LXqH6cHpD
 MCaTplj6Plak4=
X-Google-Smtp-Source: AGHT+IH7AC9vVnND0gYXr5atVBGRs/VhsrnYyCclK/S3/odWqahABKmANWELHXqVL5a40P6VSkjfMQ==
X-Received: by 2002:a05:6000:250d:b0:42f:bc61:d1d9 with SMTP id
 ffacd0b85a97d-4324e4c9dc4mr4863073f8f.20.1766171338219; 
 Fri, 19 Dec 2025 11:08:58 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1aee5sm6533011f8f.4.2025.12.19.11.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 11:08:53 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 72AE06003B;
 Fri, 19 Dec 2025 19:08:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alwalid Salama <asalama@qti.qualcomm.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Mark Burton <mburton@qti.qualcomm.com>, Laurent Vivier <laurent@vivier.eu>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 06/12] plugins: shorten aggressively long name
Date: Fri, 19 Dec 2025 19:08:43 +0000
Message-ID: <20251219190849.238323-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219190849.238323-1-alex.bennee@linaro.org>
References: <20251219190849.238323-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The old name comes in at a 51 characters, contains at least one
redundant token and exec is arguably implied by inline as all inline
operations occur when instructions are executing.

By putting the name on a substantial diet we can reduce it by 15% and
gain valuable white-space in the process.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h    |  4 ++--
 contrib/plugins/cflow.c       | 22 +++++++++++-----------
 contrib/plugins/howvec.c      |  2 +-
 contrib/plugins/stoptrigger.c | 10 ++++++----
 plugins/api.c                 |  2 +-
 tests/tcg/plugins/discons.c   | 18 +++++++++---------
 tests/tcg/plugins/inline.c    |  6 +++---
 tests/tcg/plugins/insn.c      |  5 +++--
 8 files changed, 36 insertions(+), 33 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 60de4fdd3fa..29663591ebf 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -516,7 +516,7 @@ void qemu_plugin_register_vcpu_insn_exec_cond_cb(
     void *userdata);
 
 /**
- * qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu() - insn exec inline op
+ * qemu_plugin_register_inline_per_vcpu() - insn exec inline op
  * @insn: the opaque qemu_plugin_insn handle for an instruction
  * @op: the type of qemu_plugin_op (e.g. ADD_U64)
  * @entry: entry to run op
@@ -525,7 +525,7 @@ void qemu_plugin_register_vcpu_insn_exec_cond_cb(
  * Insert an inline op to every time an instruction executes.
  */
 QEMU_PLUGIN_API
-void qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(
+void qemu_plugin_register_inline_per_vcpu(
     struct qemu_plugin_insn *insn,
     enum qemu_plugin_op op,
     qemu_plugin_u64 entry,
diff --git a/contrib/plugins/cflow.c b/contrib/plugins/cflow.c
index b5e33f25f9b..cef5ae2239f 100644
--- a/contrib/plugins/cflow.c
+++ b/contrib/plugins/cflow.c
@@ -320,14 +320,14 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
      * check where we are at. Do this on the first instruction and not
      * the TB so we don't get mixed up with above.
      */
-    qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(first_insn,
-                                                      QEMU_PLUGIN_INLINE_STORE_U64,
-                                                      end_block, qemu_plugin_insn_vaddr(last_insn));
-    qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(first_insn,
-                                                      QEMU_PLUGIN_INLINE_STORE_U64,
-                                                      pc_after_block,
-                                                      qemu_plugin_insn_vaddr(last_insn) +
-                                                      qemu_plugin_insn_size(last_insn));
+    qemu_plugin_register_inline_per_vcpu(first_insn,
+                                         QEMU_PLUGIN_INLINE_STORE_U64,
+                                         end_block, qemu_plugin_insn_vaddr(last_insn));
+    qemu_plugin_register_inline_per_vcpu(first_insn,
+                                         QEMU_PLUGIN_INLINE_STORE_U64,
+                                         pc_after_block,
+                                         qemu_plugin_insn_vaddr(last_insn) +
+                                         qemu_plugin_insn_size(last_insn));
 
     for (int idx = 0; idx < qemu_plugin_tb_n_insns(tb); ++idx) {
         struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, idx);
@@ -355,9 +355,9 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
         }
 
         /* Store the PC of what we are about to execute */
-        qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(insn,
-                                                            QEMU_PLUGIN_INLINE_STORE_U64,
-                                                            last_pc, ipc);
+        qemu_plugin_register_inline_per_vcpu(insn,
+                                             QEMU_PLUGIN_INLINE_STORE_U64,
+                                             last_pc, ipc);
     }
 }
 
diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 42bddb6566d..c60737d57f1 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -321,7 +321,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 
         if (cnt) {
             if (do_inline) {
-                qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(
+                qemu_plugin_register_inline_per_vcpu(
                     insn, QEMU_PLUGIN_INLINE_ADD_U64,
                     qemu_plugin_scoreboard_u64(cnt), 1);
             } else {
diff --git a/contrib/plugins/stoptrigger.c b/contrib/plugins/stoptrigger.c
index b3a6ed66a7b..68c0ed432af 100644
--- a/contrib/plugins/stoptrigger.c
+++ b/contrib/plugins/stoptrigger.c
@@ -73,10 +73,12 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 
         if (exit_on_icount) {
             /* Increment and check scoreboard for each instruction */
-            qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(
-                insn, QEMU_PLUGIN_INLINE_ADD_U64, insn_count, 1);
-            qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(
-                insn, QEMU_PLUGIN_INLINE_STORE_U64, current_pc, insn_vaddr);
+            qemu_plugin_register_inline_per_vcpu(insn,
+                                                 QEMU_PLUGIN_INLINE_ADD_U64,
+                                                 insn_count, 1);
+            qemu_plugin_register_inline_per_vcpu(insn,
+                                                 QEMU_PLUGIN_INLINE_STORE_U64,
+                                                 current_pc, insn_vaddr);
             qemu_plugin_register_vcpu_insn_exec_cond_cb(
                 insn, exit_icount_reached, QEMU_PLUGIN_CB_NO_REGS,
                 QEMU_PLUGIN_COND_EQ, insn_count, icount + 1, NULL);
diff --git a/plugins/api.c b/plugins/api.c
index eac04cc1f6b..267fa2fd503 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -154,7 +154,7 @@ void qemu_plugin_register_vcpu_insn_exec_cond_cb(
                                        cond, entry, imm, udata);
 }
 
-void qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(
+void qemu_plugin_register_inline_per_vcpu(
     struct qemu_plugin_insn *insn,
     enum qemu_plugin_op op,
     qemu_plugin_u64 entry,
diff --git a/tests/tcg/plugins/discons.c b/tests/tcg/plugins/discons.c
index 2e0e664e823..1348d6e5020 100644
--- a/tests/tcg/plugins/discons.c
+++ b/tests/tcg/plugins/discons.c
@@ -156,15 +156,15 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
         uint64_t next_pc = pc + qemu_plugin_insn_size(insn);
         uint64_t has_next = (i + 1) < n_insns;
 
-        qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(insn,
-                                                            QEMU_PLUGIN_INLINE_STORE_U64,
-                                                            last_pc, pc);
-        qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(insn,
-                                                            QEMU_PLUGIN_INLINE_STORE_U64,
-                                                            from_pc, next_pc);
-        qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(insn,
-                                                            QEMU_PLUGIN_INLINE_STORE_U64,
-                                                            has_from, has_next);
+        qemu_plugin_register_inline_per_vcpu(insn,
+                                             QEMU_PLUGIN_INLINE_STORE_U64,
+                                             last_pc, pc);
+        qemu_plugin_register_inline_per_vcpu(insn,
+                                             QEMU_PLUGIN_INLINE_STORE_U64,
+                                             from_pc, next_pc);
+        qemu_plugin_register_inline_per_vcpu(insn,
+                                             QEMU_PLUGIN_INLINE_STORE_U64,
+                                             has_from, has_next);
         qemu_plugin_register_vcpu_insn_exec_cb(insn, insn_exec,
                                                QEMU_PLUGIN_CB_NO_REGS, NULL);
     }
diff --git a/tests/tcg/plugins/inline.c b/tests/tcg/plugins/inline.c
index 73dde995781..35307501105 100644
--- a/tests/tcg/plugins/inline.c
+++ b/tests/tcg/plugins/inline.c
@@ -244,15 +244,15 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
         void *insn_store = insn;
         void *mem_store = (char *)insn_store + 0xff;
 
-        qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(
+        qemu_plugin_register_inline_per_vcpu(
             insn, QEMU_PLUGIN_INLINE_STORE_U64, data_insn,
             (uintptr_t) insn_store);
         qemu_plugin_register_vcpu_insn_exec_cb(
             insn, vcpu_insn_exec, QEMU_PLUGIN_CB_NO_REGS, insn_store);
-        qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(
+        qemu_plugin_register_inline_per_vcpu(
             insn, QEMU_PLUGIN_INLINE_ADD_U64, count_insn_inline, 1);
 
-        qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(
+        qemu_plugin_register_inline_per_vcpu(
             insn, QEMU_PLUGIN_INLINE_ADD_U64, insn_cond_track_count, 1);
         qemu_plugin_register_vcpu_insn_exec_cond_cb(
             insn, vcpu_insn_cond_exec, QEMU_PLUGIN_CB_NO_REGS,
diff --git a/tests/tcg/plugins/insn.c b/tests/tcg/plugins/insn.c
index 0c723cb9ed8..b337fda9f13 100644
--- a/tests/tcg/plugins/insn.c
+++ b/tests/tcg/plugins/insn.c
@@ -147,8 +147,9 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
         struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
 
         if (do_inline) {
-            qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(
-                insn, QEMU_PLUGIN_INLINE_ADD_U64, insn_count, 1);
+            qemu_plugin_register_inline_per_vcpu(insn,
+                                                 QEMU_PLUGIN_INLINE_ADD_U64,
+                                                 insn_count, 1);
         } else {
             qemu_plugin_register_vcpu_insn_exec_cb(
                 insn, vcpu_insn_exec_before, QEMU_PLUGIN_CB_NO_REGS, NULL);
-- 
2.47.3


